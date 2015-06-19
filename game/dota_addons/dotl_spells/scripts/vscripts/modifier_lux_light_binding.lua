modifier_lux_light_binding = class({})

--------------------------------------------------------------------------------

function modifier_lux_light_binding:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_lux_light_binding:IsStunDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_lux_light_binding:GetEffectName()
	return "particles/generic_gameplay/generic_stunned.vpcf"
end

--------------------------------------------------------------------------------

function modifier_lux_light_binding:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_lux_light_binding:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_lux_light_binding:GetOverrideAnimation( params )
	return ACT_DOTA_DISABLED
end

--------------------------------------------------------------------------------

function modifier_lux_light_binding:CheckState()
	local state = {
	[MODIFIER_STATE_STUNNED] = true,
	}

	return state
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
