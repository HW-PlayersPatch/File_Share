-- Vaygr

Number_Properties_Priority = 1.0

Number_Properties = {
	cfg_race_is_playable = 1.0,
	cfg_race_index_sort = 15.0,
	cfg_race_select_weight = 0.0,
	cfg_race_is_random = 0.0,
	
	cfg_hyperspace_effect_time = 9.5,
	cfg_buildable_subsystems = 1.0,
	cfg_bc_can_upgrade = 1.0,


	cfg_build_by_ships = 0.0,
	persona_build_ships_scalar = 1.0,
	persona_build_ships_befull = 0.0,
	persona_build_open_chan_adjust = 0.0,
	persona_bigspender = 0.0,

-- Resource

	persona_mil_2_collector_scale = 0.6,
	
	persona_class_demand_fighter = 0.5,
	persona_class_demand_corvette = 0.25,
	persona_class_demand_frigate = 0.0,

-- Military

	persona_comp_scale0 = 1,
	persona_comp_scale1 = 1,
	persona_comp_scale2 = 1,
	persona_comp_scale3 = 1,

	persona_group_scale = 1,


-- CPU Build Scale

	persona_demand_scale_fighters =5,
	persona_demand_scale_corvettes = 3,
	persona_demand_scale_frigates = 1,

	persona_demand_adjusthi_fighters = 0.5,
	persona_demand_adjustlo_fighters = -0.5,

	persona_demand_adjusthi_corvettes = 0.5,
	persona_demand_adjustlo_corvettes = -0.5,

	persona_demand_adjusthi_frigates = 1.5,
	persona_demand_adjustlo_frigates = 0.5,

	
	ai_demand_reset_value = 2.0,
	
	persona_class_demand_fighter = 0.5,
	persona_class_demand_corvette = 0.5,
	persona_class_demand_frigate = 0.25,
	
	persona_rus_for_builder = -500.0,
}

String_Properties_Priority = 1.0

String_Properties = {
	cfg_hyperspace_effect_fx = "hyperspace_gate_vgr",
	cfg_hyperspace_effect_audio = [[etg/special/SPECIAL_ABILITIES_HYPERSPACE_IN]],
	
	path_build = [[data:scripts/races/vaygr/scripts/def_build.lua]],
	path_research = [[data:scripts/races/2x_vaygr/scripts/def_research.lua]],
	path_ai = [[data:scripts/races/vaygr/scripts/def_ai.lua]],
	
	path_ai_special = [[data:scripts/races/vaygr/scripts/ai_special.lua]],
	path_ai_research = [[data:scripts/races/vaygr/scripts/ai_upgrades.lua]],
	path_ai_subsystems = [[data:scripts/races/vaygr/scripts/ai_subsystems.lua]],
	path_ai_build = [[data:scripts/races/vaygr/scripts/ai_build.lua]],
	
	path_crate_locate = [[data:scripts/races/vaygr/scripts/crate_locate.lua]],
	path_crate_ships = [[data:scripts/races/vaygr/scripts/crate_ships.lua]],
	
	def_type_mothership = "vgr_mothership",
	def_type_carrier = "vgr_carrier",
	def_type_scout = "vgr_scout",
}
