-- Kushan

Number_Properties_Priority = 1.0

Number_Properties = {
	cfg_race_is_playable = 1.0,
	cfg_race_index_sort = 16.0,
	cfg_race_select_weight = 0.0,
	cfg_race_is_random = 0.0,

	cfg_build_by_ships = 1.0,

--CPU Build

	persona_demand_scale_fighters = 7,
	persona_demand_scale_corvettes = 5,
	persona_demand_scale_frigates = 1,

-- AI Default
	persona_build_ships_scalar = 4.0,
	persona_build_ships_befull = 0.0,
	persona_build_open_chan_adjust = 0.0,
	persona_bigspender = 1.0,

-- Resource
	persona_mil_2_collector_scale = 0.3,

-- Military

	persona_comp_scale0 = 1.25,
	persona_comp_scale1 = 1.5,
	persona_comp_scale2 = 1.75,
	persona_comp_scale3 = 2,
	
	persona_group_scale = 3,


	cfg_hyperspace_effect_time = 9.5,
	cfg_buildable_subsystems = 0.0,
	
	ai_demand_reset_value = 3.0,
	
	persona_rus_for_builder = 1500.0,
	persona_demand_builder_adjust = -2.25,

}

String_Properties_Priority = 1.0

String_Properties = {
	cfg_hyperspace_effect_fx = "hyperspace_gate",
	cfg_hyperspace_effect_audio = [[etg/special/SPECIAL_ABILITIES_HYPERSPACE_IN]],
	
	path_build = [[data:scripts/races/kushan/scripts/def_build.lua]],
	path_research = [[data:scripts/races/2x_kushan/scripts/def_research.lua]],
	path_ai = [[data:scripts/races/kushan/scripts/def_ai.lua]],
	
	path_ai_special = [[data:scripts/races/kushan/scripts/ai_special.lua]],
	path_ai_research = [[data:scripts/races/kushan/scripts/ai_upgrades.lua]],
	path_ai_build = [[data:scripts/races/kushan/scripts/ai_build.lua]],
	
	path_crate_locate = [[data:scripts/races/kushan/scripts/crate_locate.lua]],
	path_crate_ships = [[data:scripts/races/kushan/scripts/crate_ships.lua]],
	
	def_type_mothership = "kus_mothership",
	def_type_carrier = "kus_carrier",
	def_type_scout = "kus_scout",
}
