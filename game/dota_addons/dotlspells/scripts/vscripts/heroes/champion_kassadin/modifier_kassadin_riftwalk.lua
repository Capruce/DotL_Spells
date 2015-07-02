modifier_kassadin_riftwalk = class({})

--------------------------------------------------------------------------------

function modifier_kassadin_riftwalk:IsHidden()
	return ( self:GetStackCount() == 0 )
end

--------------------------------------------------------------------------------

function modifier_kassadin_riftwalk:DestroyOnExpire()
	return false
end

--------------------------------------------------------------------------------

function modifier_kassadin_riftwalk:OnCreated( kv )
	self.fiery_soul_attack_speed_bonus = self:GetAbility():GetSpecialValueFor( "fiery_soul_attack_speed_bonus" )
	self.fiery_soul_move_speed_bonus = self:GetAbility():GetSpecialValueFor( "fiery_soul_move_speed_bonus" )
	self.fiery_soul_max_stacks = self:GetAbility():GetSpecialValueFor( "fiery_soul_max_stacks" )
	self.duration_tooltip = self:GetAbility():GetSpecialValueFor( "duration_tooltip" )
	self.flFierySoulDuration = 0

	self:GetAbility().modifier = self
end

--------------------------------------------------------------------------------

function modifier_kassadin_riftwalk:OnRefresh( kv )
	if IsServer() then
		
	end
end

--------------------------------------------------------------------------------

function modifier_kassadin_riftwalk:OnIntervalThink()
	if IsServer() then
		self:StartIntervalThink( -1 )
		self:SetStackCount( 0 )
	end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------