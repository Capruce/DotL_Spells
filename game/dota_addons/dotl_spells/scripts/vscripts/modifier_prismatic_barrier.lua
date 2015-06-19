modifier_prismatic_barrier = class({})
--------------------------------------------------------------------------------

function modifier_prismatic_barrier:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_prismatic_barrier:IsStunDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_prismatic_barrier:GetEffectName()
	return "particles/generic_gameplay/generic_stunned.vpcf"
end

--------------------------------------------------------------------------------

function modifier_prismatic_barrier:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

--------------------------------------------------------------------------------

function modifier_prismatic_barrier:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_sven_storm_bolt_lua:GetOverrideAnimation( params )
	return ACT_DOTA_DISABLED
end

--------------------------------------------------------------------------------

function modifier_sven_storm_bolt_lua:CheckState()
	local state = {
	[MODIFIER_STATE_STUNNED] = true,
	}

	return state
end

--------------------------------------------------------------------------------
