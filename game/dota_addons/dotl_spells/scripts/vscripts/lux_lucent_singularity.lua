lux_lucent_singularity = class({})
LinkLuaModifier( "modifier_lux_lucent_singularity_thinker", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_lux_lucent_singularity", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------

function lux_lucent_singularity:OnUpgrade()
	self.detonate_ability = self:GetCaster():FindAbilityByName("lux_lucent_singularity_detonate")
	self.detonate_ability:SetLevel(1)
end

function lux_lucent_singularity:OnSpellStart()
	
end