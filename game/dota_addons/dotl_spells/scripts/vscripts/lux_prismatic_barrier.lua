lux_prismatic_barrier = class({})
LinkLuaModifier( "modifier_lux_prismatic_barrier", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function lux_prismatic_barrier:OnSpellStart()
	--Test()
	
	self.prismatic_barrier_ap_scaling = self:GetSpecialValueFor( "prismatic_barrier_ap_scaling" )
	self.prismatic_barrier_width = self:GetSpecialValueFor( "prismatic_barrier_width" )
	self.prismatic_barrier_distance = self:GetSpecialValueFor( "light_binding_distance" )
	self.prismatic_barrier_speed = self:GetSpecialValueFor( "prismatic_barrier_speed" )
	self.prismatic_barrier_duration = self:GetSpecialValueFor( "prismatic_barrier_duration" )

	--I want to make this unique, so that more than one projectile can be out on the field at the same time
	local vDirection = self:GetCursorPosition() - self:GetCaster():GetOrigin()
	vDirection = vDirection:Normalized()

	local info = {
		EffectName = "particles/units/heroes/hero_vengeful/vengeful_wave_of_terror.vpcf",
		Ability = self,
		vSpawnOrigin = self:GetCaster():GetOrigin(), 
		fStartRadius = self.light_binding_width,
		fEndRadius = self.light_binding_width,
		vVelocity = vDirection * self.light_binding_speed,
		fDistance = self.light_binding_distance,
		Source = self:GetCaster(),
		iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
		iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	}

	self.nProjID = ProjectileManager:CreateLinearProjectile( info )
	self.targetsHit = 0

	print(tostring(self.targetsHit))
end

function lux_prismatic_barrier:OnProjectileHit( hTarget, vLocation )
	if hTarget ~= nil then

		--Incase the hero casting doesn't have ap defined for it
		local caster_ap = 0
		if self:GetCaster().ap ~= nil then
			caster_ap = self:GetCaster().ap
		end

		local factor = math.pow(self.light_binding_decrease_factor, self.targetsHit)

		local final_damage = (caster_ap * self.light_binding_ap_scaling) + (self.light_binding_damage / factor)

		local final_duration = self.light_binding_root_duration / factor

		print(tostring(final_damage) .. " " .. tostring(final_duration))

		local damage = {
			victim = hTarget,
			attacker = self:GetCaster(),
			damage = final_damage,
			damage_type = DAMAGE_TYPE_PURE,
			ability = this,
		}

		ApplyDamage( damage )
		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_lux_light_binding", { duration = final_duration } )

		self.targetsHit = self.targetsHit + 1

		if self.targetsHit == self.light_binding_max_targets then
			return true
		else
			return false
		end
	end
end