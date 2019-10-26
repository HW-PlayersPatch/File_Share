-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
g_Carrier_3_Launches_First_Attack = 60
g_Carrier_3_Launches_Second_Attack = 180
g_AI_1_Gets_Aggressive = 400
g_Comm_Defenders_Get_Aggressive = 300
g_Comm_Station_Interceptor_Build_Frequency = 120
g_Vaygr_Carrier_Build_Frequency = 100
g_use_gate_interval = 20
g_playerInCombat = 0
g_protect_inhibitor_interval = 50
g_time_before_defenders_become_attackers = 300
g_communications_subsystem_repair_time = 900
g_first_repair_warning = 480
g_second_repair_warning = 240
g_carrier_destruction_add_time = 240
obj_prim_destroy_inhibitors = "$41500"
obj_prim_destroy_inhibitors_id = 0
obj_prim_destroy_comms_subsystem = "$41501"
obj_prim_destroy_comms_subsystem_id = 0
obj_sec_capture_gate = "$41502"
obj_sec_capture_gate_id = 0
obj_sec_prim_clearmines = "$41504"
obj_sec_prim_clearmines_id = 0
obj_prim_destroyvaygr = "$41503"
obj_prim_destroyvaygr_id = 0
obj_sec_build_minelayer = "$41505"
obj_sec_build_minelayer_id = 0
obj_sec_destroy_carrier = "$41506"
obj_sec_destroy_carrier_id = 0
ping_hyperspace_inhibitor_1 = "$41900"
ping_hyperspace_inhibitor_id = {0, 0, 0}
ping_hyperspace_inhibitor_2 = "$41901"
ping_hyperspace_inhibitor_3 = "$41902"
ping_communications_station = "$41903"
ping_communications_station_id = 0
ping_vaygrcarriergroup = "$41905"
ping_vaygrcarriergroup_id = 0
evt_speechevent_onedown_started = 0
evt_intelevent_tacjumpon_started = 0
evt_isplaying = 0
g_AI_inhibitor_defend_id_1 = 0
g_AI_inhibitor_defend_id_2 = 0
g_AI_inhibitor_defend_id_3 = 0
g_pointer_default = 0
g_pointer_inhibitor1_id = 0
g_pointer_inhibitor2_id = 0
g_pointer_inhibitor3_id = 0
g_pointer_comm_station_id = 0
g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
g_inhibitor_state = {1, 1, 1}
g_rein_1_sent = 0
-- g_rein_2_sent = 0
-- g_rein_3_sent = 0
g_timesreinforced = 0
g_mineState = {0, 0, 0}
g_firstgateseen = 0
g_gatediscovered = 0
g_minediscovered = 0
g_reinforcementsattackplayer = 0
g_all_ships_not_ms = 0
g_Comm_Carriers_Dead = 0
g_Comm_Subsystem_Dead = 0
g_TacticalHyperspace = 1
ShipToParadeRoundTypeName = "Hgn_MotherShip"
g_Players_Ships_Hyperspace = ""
g_Players_Ships_Docked = ""
g_Ships_To_Exit_Hyperspace = "Ships_To_Exit_Hyperspace"
evt_intelevent_tacjumpon_ended = 0
g_save_id = 0

function Enable_ResearchOptions()
	Player_UnrestrictBuildOption(0, "Hgn_ProximitySensor")
	Player_UnrestrictBuildOption(0, "Hgn_C_Sensors_AdvancedArray")
	Player_UnrestrictBuildOption(0, "Hgn_MS_Sensors_AdvancedArray")
	Player_UnrestrictBuildOption(0, "Hgn_MinelayerCorvette")
	Player_UnrestrictBuildOption(0, "Hgn_TorpedoFrigate")
	Player_UnrestrictBuildOption(0, "Hgn_IonTurret")
	Player_UnrestrictResearchOption(0, "GraviticAttractionMines")
	Player_UnrestrictResearchOption(0, "SensDisProbe")
	Player_UnrestrictResearchOption(0, "PlatformIonWeapons")
	Player_UnrestrictResearchOption(0, "TorpedoFrigateHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "TorpedoFrigateMAXSPEEDUpgrade1")
	Player_UnrestrictResearchOption(0, "IonTurretHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "ResourceCollectorHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "InterceptorMAXSPEEDUpgrade2")
	Player_UnrestrictResearchOption(0, "AttackBomberMAXSPEEDUpgrade2")
end

function OnInit()
	Rule_Add("Rule_Init")
	Camera_Interpolate("here", "Camera_Startpos", 0)
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function cheat()
	SobGroup_SetHardPointHealth("inhibitor_1", "Generic 1", 0)
	SobGroup_SetHardPointHealth("inhibitor_1", "Generic 4", 0)
	SobGroup_SetHardPointHealth("inhibitor_1", "Generic 3", 0)
	SobGroup_SetHardPointHealth("inhibitor_1", "Generic 2", 0)
	SobGroup_SetHardPointHealth("inhibitor_2", "Generic 1", 0)
	SobGroup_SetHardPointHealth("inhibitor_2", "Generic 4", 0)
	SobGroup_SetHardPointHealth("inhibitor_2", "Generic 3", 0)
	SobGroup_SetHardPointHealth("inhibitor_2", "Generic 2", 0)
	SobGroup_SetHardPointHealth("inhibitor_3", "Generic 1", 0)
	SobGroup_SetHardPointHealth("inhibitor_3", "Generic 4", 0)
	SobGroup_SetHardPointHealth("inhibitor_3", "Generic 3", 0)
	SobGroup_SetHardPointHealth("inhibitor_3", "Generic 2", 0)
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_Init()
	SobGroup_Create("tempSobGroup")
	SobGroup_Create(g_Ships_To_Exit_Hyperspace)
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	Sound_SpeechSubtitlePath("speech:missions/m_04/")
	Sound_MusicPlayType("data:sound/music/ambient/AMB_04", MUS_Ambient)
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
	Sound_EnableAllSpeech(0)
	Rule_Add("Rule_AI_Init")
	FOW_RevealGroup("Communications_Station", 1)
	HW2_SetResearchLevel(4)
	SobGroup_FormHyperspaceGate("gate_1a", "gate_1b")
	SobGroup_FormHyperspaceGate("gate_2a", "gate_2b")
	SobGroup_FormHyperspaceGate("gate_3a", "gate_3b")
	SobGroup_TakeDamage("Communications_Station", 0.6)
	Rule_AddInterval("Rule_CommStationInvulnerable", 10)
	Event_Start("intelevent_clearinhibitors")
	Rule_Add("Rule_EnableResearchAfterIntelevent")
	Rule_Add("Rule_VaygrUsingGates")
	SobGroup_Create("g_vaygrShipLastBuilt")
	Rule_Add("Rule_Inhibitor_Destroyed")
	Rule_Add("Rule_PlayerLose")
	Rule_Add("Rule_PlayerWins")
	Rule_Add("Rule_PlayerIsNearToCommStation")
	Rule_AddInterval("Rule_DestroyPlayer", 10800)
	Rule_AddInterval("Rule_PlayStaging", 300)
	Rule_Remove("Rule_Init")
	Player_SetPlayerName(0, "$41850")
	HW2_ReactiveInfo()
end

function Rule_SaveTheGameMissionStart()
	Rule_Remove("Rule_SaveTheGameMissionStart")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6414")
end

function Rule_PlayStaging()
	Sound_MusicPlayType("data:sound/music/staging/STAGING_04", MUS_Staging)
	Rule_Remove("Rule_PlayStaging")
end

function Rule_EnableResearchAfterIntelevent()
	if (Event_IsDone("intelevent_clearinhibitors") == 1) then
	Enable_ResearchOptions();
	Rule_Remove("Rule_EnableResearchAfterIntelevent")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameMissionStart", 1)
	end
end

function Rule_Grant_AI1_RU()
	Player_SetRU(1, 1000)
end

function Rule_AI_1_AttackNow()
	CPU_DoString(1, "AttackNow()")
end

function Rule_AI_Init_1()
	Player_SetPlayerName(1, "$41851")
	Player_SetRU(1, 1000)
	Rule_AddInterval("Rule_Grant_AI1_RU", 320)
	Rule_AddInterval("Rule_AI_1_AttackNow", 300)
	SetAlliance(1, 2)
	SetAlliance(1, 3)
	SetAlliance(1, 4)
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	CPU_RemoveSobGroup(1, "Vgr_Carrier_Patrolling")
	CPU_RemoveSobGroup(1, "Vgr_Carrier_Patrolling_1")
	SobGroup_CreateSubSystem("Vgr_Carrier_Patrolling", "FighterProduction")
	SobGroup_CreateSubSystem("Vgr_Carrier_Patrolling_1", "CorvetteProduction")
	SobGroup_FollowPath("Vgr_Carrier_Patrolling", "path_CarrierPatrol", 1, 1, 0)
	SobGroup_FollowPath("Vgr_Carrier_Patrolling_1", "path_CarrierPatrol", 1, 1, 0)
	AI_BulkResearchGrant(1)
	Rule_Remove("Rule_AI_Init_1")
end

function Rule_AI_Init_2()
	CPU_Enable(2, 0)
	Player_SetPlayerName(2, "$41851")
	CPU_RemoveResourceBlob(2, "vol_PlayerRU_1")
	CPU_RemoveResourceBlob(2, "vol_PlayerRU_2")
	CPU_RemoveResourceBlob(2, "vol_AIRU_3")
	Player_SetRU(2, 0)
	SetAlliance(2, 1)
	SetAlliance(2, 3)
	SetAlliance(2, 4)
	AI_BulkResearchGrant(2)
	CPU_RemoveSobGroup(2, "Comm_Carrier")
--	SobGroup_RepairSobGroup("Comm_Station_Repair_Group", "Communications_Station")
	SobGroup_CreateSubSystem("Comm_Carrier", "FrigateProduction")
	HW2_InitializeBuilder("Comm_Aux_Carrier", "tempSobGroup")
	CPU_AddDefendSobGroup(2, "Communications_Station", 50)
	Rule_Remove("Rule_AI_Init_2")
end

function Rule_AI_Init_3()
	Player_SetPlayerName(3, "$41851")
	Player_SetRU(3, 3000)
	CPU_RemoveResourceBlob(3, "vol_PlayerRU_1")
	CPU_RemoveResourceBlob(3, "vol_PlayerRU_2")
	CPU_RemoveResourceBlob(3, "vol_AIRU_2")
	SetAlliance(3, 1)
	SetAlliance(3, 2)
	SetAlliance(3, 4)
	CPU_RemoveSobGroup(3, "inhibitor_1")
	CPU_RemoveSobGroup(3, "inhibitor_2")
	CPU_RemoveSobGroup(3, "inhibitor_3")
	CPU_RemoveSobGroup(3, "rein_1")
--	CPU_RemoveSobGroup(3, "rein_2")
--	CPU_RemoveSobGroup(3, "rein_3")
	CPU_RemoveSobGroup(3, "inhibitor_2_minelayers")
	CPU_RemoveSobGroup(3, "inhibitor_1_minelayers")
	CPU_RemoveSobGroup(3, "inhibitor_3_minelayers")
	CPU_RemoveSobGroup(3, "Vgr_Gate_Destroyer")
	SobGroup_GuardSobGroup("Vgr_Gate_Destroyer", "Vgr_Gates_Carriers")
	g_AI_inhibitor_defend_id_1 = CPU_AddDefendSobGroup(3, "inhibitor_1", 50)
	g_AI_inhibitor_defend_id_2 = CPU_AddDefendSobGroup(3, "inhibitor_2", 50)
	g_AI_inhibitor_defend_id_3 = CPU_AddDefendSobGroup(3, "inhibitor_3", 50)
	CPU_RemoveSobGroup(3, "Vaygr_Carrier_Gate_Defend_1")
	CPU_RemoveSobGroup(3, "Vaygr_Carrier_Gate_Defend_2")
	CPU_RemoveSobGroup(3, "Vaygr_Carrier_Gate_Defend_3")
	SobGroup_CreateSubSystem("Vaygr_Carrier_Gate_Defend_1", "FighterProduction")
	SobGroup_CreateSubSystem("Vaygr_Carrier_Gate_Defend_2", "CorvetteProduction")
	SobGroup_CreateSubSystem("Vaygr_Carrier_Gate_Defend_3", "FrigateProduction")
	Player_SetDefaultShipTactic(3, AggressiveTactics)
	AI_BulkResearchGrant(3)
	Rule_Remove("Rule_AI_Init_3")
end

function Rule_AI_Init_4()
	Player_SetPlayerName(4, "$41852")
	SobGroup_SetCaptureState("Communications_Station", 0)
	SetAlliance(4, 1)
	SetAlliance(4, 2)
	SetAlliance(4, 3)
	Player_SetRU(4, 10000)
	CPU_RemoveSobGroup(4, "Communications_Station")
	CPU_AddDefendSobGroup(4, "Communications_Station", 10)
	Rule_Remove("Rule_AI_Init_4")
end

function Rule_AI_Init()
	SobGroup_SetSwitchOwnerFlag("gate_1a", 0)
	SobGroup_SetSwitchOwnerFlag("gate_1b", 0)
	SobGroup_SetSwitchOwnerFlag("gate_2a", 0)
	SobGroup_SetSwitchOwnerFlag("gate_2b", 0)
	SobGroup_SetSwitchOwnerFlag("gate_3a", 0)
	SobGroup_SetSwitchOwnerFlag("gate_3b", 0)
	Rule_Add("Rule_AI_Init_1")
	Rule_Add("Rule_AI_Init_2")
	Rule_Add("Rule_AI_Init_3")
	Rule_Add("Rule_AI_Init_4")
	Rule_Remove("Rule_AI_Init")
end

function AI_BulkResearchGrant(AI_Number)
	Player_GrantResearchOption(AI_Number, "CorvetteTech")
	Player_GrantResearchOption(AI_Number, "CorvetteCommand")
	Player_GrantResearchOption(AI_Number, "PlatformHeavyMissiles")
	Player_GrantResearchOption(AI_Number, "FrigateInfiltrationTech")
	Player_GrantResearchOption(AI_Number, "HyperspaceGateTech")
	Player_GrantResearchOption(AI_Number, "RepairAbility")
	Player_GrantResearchOption(AI_Number, "FrigateTech")
	Player_GrantResearchOption(AI_Number, "LanceBeams")
	Player_GrantResearchOption(AI_Number, "PlasmaBombs")
	Player_GrantResearchOption(AI_Number, "CorvetteLaser")
	Player_GrantResearchOption(AI_Number, "FrigateAssault")
end

function Rule_DestroyPlayer()
	for i = 1, 4 do
	Player_SetRU(i, 100000)
	CPU_DoString(i, "cp_minSquadGroupSize = 1")
	CPU_DoString(i, "cp_minSquadGroupValue = 1")
	CPU_DoString(i, "AttackNow()")
	end
	Rule_Remove("Rule_DestroyPlayer")
end

function Rule_PlayerCanBuildTorpedoFrigates()
	Player_UnrestrictBuildOption(0, "Hgn_TorpedoFrigate")
	Rule_Remove("Rule_PlayerCanBuildTorpedoFrigates")
end

function Rule_VaygrUsingGates()
	for i = 1, 3 do
	if (SobGroup_PlayerIsInSensorRange("gate_"..i.."b", 0) == 1) then
	Sound_MusicPlayType("data:sound/music/staging/STAGING_04", MUS_Staging)
	SobGroup_ExitHyperSpaceSobGroup("rein_1", "gate_"..i.."b", 1000)
	FOW_RevealGroup("gate_"..i.."b", 1)
	FOW_RevealGroup("rein_1", 1)
	g_firstgateseen = i
	Event_Start("autofocus_gate")
	Rule_AddInterval("Rule_Gate_Captured", 5)
	Rule_Remove("Rule_VaygrUsingGates")
	return
	end
	end
end

function Rule_Gate_Captured()
	for i = 1, 3 do
	if (SobGroup_OwnedBy("gate_"..i.."a") == 0) then
	Objective_SetState(obj_sec_capture_gate_id, OS_Complete)
	Rule_Remove("Rule_Gate_Captured")
	elseif (SobGroup_OwnedBy("gate_"..i.."b") == 0) then
	Objective_SetState(obj_sec_capture_gate_id, OS_Complete)
	Rule_Remove("Rule_Gate_Captured")
	end
	end
end

function Rule_Inhibitor_Destroyed()
	for i = 1, 3 do
	if (g_inhibitor_state[i] == 1) then
	if (SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 1") == 0) then
	if (SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 2") == 0) then
	if (SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 3") == 0) then
	if (SobGroup_GetHardPointHealth("inhibitor_"..i, "Generic 4") == 0) then
	print("SCAR: inhibitor destroyed "..g_inhibitor_state[i])
	Ping_Remove(ping_hyperspace_inhibitor_id[i])
	if (i == 1) then
	CPU_RemoveDefendTarget(3, g_AI_inhibitor_defend_id_1)
	elseif (i == 2) then
	CPU_RemoveDefendTarget(3, g_AI_inhibitor_defend_id_2)
	else
	CPU_RemoveDefendTarget(3, g_AI_inhibitor_defend_id_3)
	end
	g_inhibitor_state[i] = 0
	if (g_gatediscovered == "gate_"..i) then
	g_gatediscovered = 0
	end
	Inhibitor_Death();
	g_mineState[i] = 0
	end
	end
	end
	end
	end
	end
end

function Inhibitor_Death()
	if (((g_inhibitor_state[1] + g_inhibitor_state[2]) + g_inhibitor_state[3]) == 2) then
	Event_Start("speechevent_onedown")
	elseif (((g_inhibitor_state[1] + g_inhibitor_state[2]) + g_inhibitor_state[3]) == 1) then
	Event_Start("speechevent_twodown")
	elseif (((g_inhibitor_state[1] + g_inhibitor_state[2]) + g_inhibitor_state[3]) == 0) then
	Rule_Add("Rule_BeginCheckingInCombat")
	Rule_Remove("Rule_Inhibitor_Destroyed")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameInhibitorsDestroyed", 1)
	end
end

function Rule_SaveTheGameInhibitorsDestroyed()
	Rule_Remove("Rule_SaveTheGameInhibitorsDestroyed")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6415")
end

function Rule_BeginCheckingInCombat()
	SobGroup_RemoveType("Player_Ships3", "Meg_Asteroid")
	SobGroup_RemoveType("Player_Ships3", "Vgr_HyperSpace_Platform")
	if (SobGroup_PlayerIsInSensorRange("Player_Ships3", 0) == 0) then
	if (SobGroup_PlayerIsInSensorRange("Player_Ships2", 0) == 0) then
	if (SobGroup_PlayerIsInSensorRange("Player_Ships1", 0) == 0) then
	Objective_SetState(obj_prim_destroy_inhibitors_id, OS_Complete)
	if (g_TacticalHyperspace == 1) then
	Event_Start("intelevent_tacjumpon")
	Rule_Remove("Rule_PlayerIsNearToCommStation")
	Rule_Add("Rule_CPU_1_Leaves")
	Rule_Add("Rule_End_Tacjump")
	end
	Rule_Remove("Rule_BeginCheckingInCombat")
	end
	end
	end
end

function Rule_CPU_1_Leaves()
	SobGroup_RemoveType("Player_Ships3", "Meg_Asteroid")
	SobGroup_Despawn("Player_Ships1")
	SobGroup_Despawn("Player_Ships3")
	CPU_Enable(1, 0)
	CPU_Enable(3, 0)
	Rule_Remove("Rule_CPU_1_Leaves")
end

function Rule_End_Tacjump()
	if (evt_intelevent_tacjumpon_ended == 1) then
	if (SobGroup_AreAllInHyperspace(g_Ships_To_Exit_Hyperspace) == 1) then
	Event_Start("intelevent_tacjumpon_2")
	Rule_Add("Rule_DestroyCommStationCompleteAfterTacJump")
	Rule_Add("Rule_BeginStageTwo")
	Rule_Add("Rule_LaunchShipsWhenOutOfHyperspace")
	Rule_Remove("Rule_End_Tacjump")
	end
	end
end

function Rule_LaunchShipsWhenOutOfHyperspace()
	if (SobGroup_AreAllInRealSpace(Players_Mothership) == 1) then
	SobGroup_SetAutoLaunch(Players_Mothership, ShipHoldLaunch)
	SobGroup_Launch("g_Players_Ships_Hyperspace", Players_Mothership)
	Rule_Remove("Rule_LaunchShipsWhenOutOfHyperspace")
	end
end

function Rule_PlayerIsNearToCommStation()
	if (SobGroup_PlayerIsInSensorRange("Communications_Station", 0) == 1) then
	g_TacticalHyperspace = 0
	Event_Start("intelevent_eliminatecommstation")
	Rule_AddInterval("Rule_BeginStageTwo", 5)
	Rule_Remove("Rule_PlayerIsNearToCommStation")
	end
end

function Rule_DestroyCommStationComplete()
	if (Event_IsDone("intelevent_eliminatecommstation") == 1) then
	Rule_Remove("Rule_DestroyCommStationComplete")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameDestroyCommandStation", 1)
	end
end

function Rule_SaveTheGameDestroyCommandStation()
	Rule_Remove("Rule_SaveTheGameDestroyCommandStation")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6416")
end

function Rule_DestroyCommStationCompleteAfterTacJump()
	if (Event_IsDone("intelevent_tacjumpon_2") == 1) then
	Rule_Remove("Rule_DestroyCommStationCompleteAfterTacJump")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameDestroyCommandStation", 1)
	end
end

function Rule_BeginStageTwo()
	CPU_Enable(2, 1)
	Sound_MusicPlayType("data:sound/music/BATTLE/BATTLE_04", MUS_Battle)
	Rule_Add("Rule_Initialize_Comms_Station_Repairs")
	Rule_Add("Rule_Vaygr_Carriers_Destroyed")
	Rule_Add("Rule_Ping_Carrier")
	Rule_Remove("Rule_CommStationInvulnerable")
	Rule_Add("Rule_Defend_Station")
	Rule_Remove("Rule_BeginStageTwo")
end

function Rule_CommStationInvulnerable()
	if (SobGroup_HealthPercentage("Communications_Station") >= 0.4) then
	SobGroup_SetHealth("Communications_Station", 0.4)
	end
end

function Rule_Defend_Station()
	if (Player_FillProximitySobGroup("tempSobGroup", 0, "Communications_Station", 8000) == 1) then
	CPU_DoString(2, "cp_attackPercent = 50")
	CPU_DoString(2, "cp_minSquadGroupSize = 3")
	CPU_DoString(2, "cp_minSquadGroupValue = 200")
	Rule_Remove("Rule_Defend_Station")
	end
end

function Rule_Initialize_Comms_Station_Repairs()
	Rule_Add("Rule_Comms_Station_Repairs_2")
	Rule_Add("Rule_Comms_Station_Repairs_3")
	Rule_Add("Rule_Comms_Station_Repairs_Complete")
	Rule_Add("Rule_Comms_Station_Destroyed")
	Rule_Remove("Rule_Initialize_Comms_Station_Repairs")
end

function Rule_Comms_Station_Repairs_2()
	if (SobGroup_HealthPercentage("Communications_Station") >= 0.5) then
	Event_Start("voiceover_comm_stage_2")
	Rule_Remove("Rule_Comms_Station_Repairs_2")
	end
end

function Rule_Comms_Station_Repairs_3()
	if (SobGroup_HealthPercentage("Communications_Station") >= 0.75) then
	Event_Start("voiceover_comm_stage_3")
	Rule_Remove("Rule_Comms_Station_Repairs_3")
	end
end

function Rule_Comms_Station_Repairs_Complete()
	if (SobGroup_HealthPercentage("Communications_Station") >= 1) then
	Event_Start("intelevent_stationoperational")
	Rule_Remove("Rule_Comms_Station_Repairs_Complete")
	end
end

function CleanPlayersGroup()
	SobGroup_Create("g_Players_Ships_Hyperspace")
	SobGroup_Create("g_Players_Ships_Docked")
	nonHyperspaceList = {"Hgn_IonTurret", "Hgn_GunTurret", "Hgn_Probe", "Hgn_ProximitySensor", "Hgn_ECMProbe", "Vgr_HyperSpace_Platform"}
	SobGroup_SobGroupAdd("g_Players_Ships_Hyperspace", "Player_Ships0")
	for i = 1, getn(nonHyperspaceList) do
	SobGroup_RemoveType("g_Players_Ships_Hyperspace", nonHyperspaceList[i])
	end
	SobGroup_SobGroupAdd("g_Players_Ships_Docked", "g_Players_Ships_Hyperspace")
	nonDockList = {"Hgn_Mothership", "Hgn_DefenseFieldFrigate", "Hgn_TorpedoFrigate", "Hgn_AssaultFrigate", "Hgn_IonCannonFrigate", "Hgn_MarineFrigate", "Hgn_Carrier", "Hgn_ResourceController", "Vgr_Destroyer", "Vgr_Carrier", "Vgr_InfiltratorFrigate", "Vgr_HeavyMissileFrigate", "Vgr_AssaultFrigate", "Vgr_ResourceController"}
	for i = 1, getn(nonDockList) do
	SobGroup_RemoveType("g_Players_Ships_Docked", nonDockList[i])
	end
	SobGroup_FillSubstract(g_Ships_To_Exit_Hyperspace, "g_Players_Ships_Hyperspace", "g_Players_Ships_Docked")
end

function Rule_Comms_Station_Destroyed()
	if (SobGroup_Empty("Communications_Station") == 1) then
	Objective_SetState(obj_prim_destroy_comms_subsystem_id, OS_Complete)
	Rule_Remove("Rule_Comms_Station_Destroyed")
	end
end

function Rule_Vaygr_Carriers_Destroyed()
	if (SobGroup_AreAnyOfTheseTypes("Player_Ships2", "Vgr_ShipYard, Vgr_MissileCorvette, Vgr_LaserCorvette, Vgr_LanceFighter, Vgr_Interceptor, Vgr_InfiltratorFrigate, Vgr_HeavyMissileFrigate, Vgr_Carrier, Vgr_Bomber, Vgr_AssaultFrigate") == 0) then
	Objective_SetState(obj_prim_destroyvaygr_id, OS_Complete)
	Rule_Remove("Rule_Vaygr_Carriers_Destroyed")
	end
end

function Rule_Ping_Carrier()
	ping_vaygrcarriergroup_id = Ping_AddSobGroup(ping_vaygrcarriergroup, "anomaly", "Player_Ships2")
	Ping_AddDescription(ping_vaygrcarriergroup_id, 0, "$41971")
	Rule_Remove("Rule_Ping_Carrier")
end

function Rule_PlayerWins()
	if (Objective_GetState(obj_prim_destroyvaygr_id) == OS_Complete) then
	if (Objective_GetState(obj_prim_destroy_comms_subsystem_id) == OS_Complete) then
	if (Objective_GetState(obj_prim_destroy_inhibitors_id) == OS_Complete) then
	Event_Start("intelevent_vaygrandcommdestroyed")
	Rule_Remove("Rule_PlayerWins")
	end
	end
	end
end

function Rule_PlayerLose()
	if (SobGroup_Empty(Players_Mothership) == 1) then
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_PlayerLose")
	end
end

Events = {}
Events["intelevent_clearinhibitors"] = {{{"Sound_EnableAllSpeech (1)", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Camera_Interpolate( 'here', 'Camera_Startpos', 0 )", ""}, HW2_Wait(5)}, {HW2_LocationCardEvent("$41521", 6)}, {{"Sound_EnterIntelEvent()", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$41530", 8)}, {HW2_Wait(1)}, {HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, HW2_Pause(1), HW2_Wait(2)}, {{"Sensors_Toggle( 1 )", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41532", 8), {"Camera_Interpolate( 'here', 'Camera_Inhibitors', 3)", ""}, {"g_pointer_inhibitor1_id = HW2_CreateEventPointerSobGroup('inhibitor_1' )", ""}, {"g_pointer_inhibitor2_id = HW2_CreateEventPointerSobGroup('inhibitor_2' )", ""}, {"g_pointer_inhibitor3_id = HW2_CreateEventPointerSobGroup('inhibitor_3' )", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41533", 8)}, {HW2_Wait(1), {"ping_hyperspace_inhibitor_id[1] = Ping_AddSobGroup( ping_hyperspace_inhibitor_1, 'anomaly', 'inhibitor_1' )", ""}, {"Ping_AddDescription(ping_hyperspace_inhibitor_id[1], 0, '$41950')", ""}, {"ping_hyperspace_inhibitor_id[2] = Ping_AddSobGroup( ping_hyperspace_inhibitor_2, 'anomaly', 'inhibitor_2' )", ""}, {"Ping_AddDescription(ping_hyperspace_inhibitor_id[2], 0, '$41950')", ""}, {"ping_hyperspace_inhibitor_id[3] = Ping_AddSobGroup( ping_hyperspace_inhibitor_3, 'anomaly', 'inhibitor_3' )", ""}, {"Ping_AddDescription(ping_hyperspace_inhibitor_id[3], 0, '$41950')", ""},}, {{"EventPointer_Remove(g_pointer_inhibitor1_id)", ""}, {"EventPointer_Remove(g_pointer_inhibitor2_id)", ""}, {"EventPointer_Remove(g_pointer_inhibitor3_id)", ""}, HW2_Wait(2), {"Camera_Interpolate( 'here', 'Camera_CommLong', 2)", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41534", 8), {"g_pointer_comm_station_id = HW2_CreateEventPointerSobGroup('Communications_Station' )", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41535", 8)}, {HW2_Wait(1)}, {{"EventPointer_Remove(g_pointer_comm_station_id)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41536", 8), {"Camera_Interpolate( 'here', 'Camera_StartposLong', 6)", ""},}, {{"Sensors_Toggle( 0 )", ""}, HW2_Wait(1)}, {{"obj_prim_destroy_inhibitors_id = Objective_Add( obj_prim_destroy_inhibitors , OT_Primary )", ""}, {"Objective_AddDescription( obj_prim_destroy_inhibitors_id, '$41980')", ""}, HW2_Pause(0), HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["intelevent_minefield"] = {{HW2_Wait(2), {"Sensors_Toggle( 0 )", ""},}, {{"Universe_EnableSkip(1)", ""}, HW2_Pause(1), HW2_Letterbox(1), {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {{"Camera_Interpolate( 'here', g_minediscovered, 2)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41540", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41541", 10)}, {HW2_Wait(1), {"Player_UnrestrictBuildOption( 0, 'Hgn_MinelayerCorvette' )", ""}, {"Player_UnrestrictResearchOption( 0, 'GraviticAttractionMines' )", ""}, {"Player_GrantResearchOption( 0, 'GraviticAttractionMines' )", ""},}, {{"obj_sec_build_minelayer_id = Objective_Add( obj_sec_build_minelayer , OT_Secondary )", ""}, {"Objective_AddDescription( obj_sec_build_minelayer_id, '$41955')", ""}, HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(2), {"Universe_EnableSkip(0)", ""}, {"Sound_MusicPlayType( 'data:sound/music/staging/STAGING_04', MUS_Staging )", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["autofocus_minelayerbuilt"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$41550", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41551", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41552", 10), {"obj_sec_prim_clearmines_id = Objective_Add( obj_sec_prim_clearmines , OT_Secondary )", ""}, {"Objective_AddDescription( obj_sec_prim_clearmines_id, '$41975')", ""}, {"Objective_AddDescription( obj_sec_prim_clearmines_id, '$41976')", ""}, {"Objective_AddDescription( obj_sec_prim_clearmines_id, '$41977')", ""},}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["autofocus_gate"] = {{HW2_Wait(2)}, {HW2_Pause(1), HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {{"Sensors_Toggle( 0 )", ""}, {"Camera_Interpolate( 'here', 'Camera_Gate_'..g_firstgateseen, 2)", ""}, {"FOW_ForceUpdate()", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41560", 10)}, {HW2_Pause(0), HW2_SubTitleEvent(Actor_FleetIntel, "$41561", 10)}, {HW2_Wait(1)}, {{"FOW_RevealGroup( 'gate_'..g_firstgateseen..'b', 0 )", ""}, {"FOW_RevealGroup( 'rein_1', 0 )", ""}, {"obj_sec_capture_gate_id = Objective_Add( obj_sec_capture_gate , OT_Secondary )", ""}, {"Objective_AddDescription( obj_sec_capture_gate_id, '$41990')", ""}, {"Objective_AddDescription( obj_sec_capture_gate_id, '$41991')", ""}, HW2_Letterbox(0), HW2_Wait(2), {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["voiceover_comm_stage_1"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41570", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41571", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41572", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["voiceover_comm_stage_2"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41575", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41576", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["voiceover_comm_stage_3"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41580", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41581", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["voiceover_carrier_destroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41588", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["intelevent_stationoperational"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(4)}, {HW2_Pause(1), HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, {"Sensors_Toggle( 0 )", ""}, HW2_Wait(2)}, {{"Camera_FocusSobGroupWithBuffer( 'Communications_Station', 2000, 2000, 2)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41585", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41586", 10)}, {HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$41522", 4)}, {{"setMissionComplete( 0 )", ""},},}
Events["speechevent_onedown"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41590", 10)},}
Events["speechevent_twodown"] = {{{"evt_speechevent_onedown_started = 1", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41595", 5)},}
Events["speechevent_alldown"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41600", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41601", 5)},}
Events["intelevent_tacjumpon"] = {{{"evt_intelevent_tacjumpon_started = 1", ""}, {"evt_isplaying = 1", ""}, HW2_Wait(4)}, {{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41620", 10)}, {HW2_Letterbox(1), {"Camera_AllowControl(0)", ""}, {"Universe_AllowPlayerOrders( 0 )", ""}, {"SobGroup_DeSelectAll()", ""}, HW2_Wait(2), {"SobGroup_SetAutoLaunch(Players_Mothership, ShipHoldStayDockedAlways)", ""},}, {HW2_Fade(1), HW2_Wait(2)}, {{"Sensors_Toggle( 0 )", ""}, {"Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", ""}, {"CleanPlayersGroup()", ""}, {"SobGroup_ParadeSobGroup( 'g_Players_Ships_Hyperspace', Players_Mothership, 2 )", ""}, {"SobGroup_DockSobGroupInstant ('g_Players_Ships_Docked', Players_Mothership)", ""}, HW2_Wait(2)}, {HW2_Fade(0), HW2_Wait(2)}, {{"SobGroup_EnterHyperSpaceOffMap(g_Ships_To_Exit_Hyperspace)", ""},}, {HW2_Wait(10)}, {{"evt_intelevent_tacjumpon_ended = 1", ""},},}
Events["intelevent_tacjumpon_2"] = {{{"SobGroup_ExitHyperSpace(g_Ships_To_Exit_Hyperspace, 'HyperspaceDestination')", ""}, HW2_Wait(0.5)}, {{"Camera_Interpolate( 'here', 'Camera_HyperspaceDestination', 3)", ""}, {"SobGroup_ParadeSobGroup( g_Ships_To_Exit_Hyperspace, Players_Mothership, 1 )", ""}, HW2_Wait(3)}, {HW2_Wait(5), {"Sensors_EnableCameraZoom( 0 )", ""},}, {{"Sensors_Toggle( 1 )", ""}, {"Camera_Interpolate( 'here', 'Camera_CommShort', 4)", ""}, {"Camera_AllowControl(1)", ""}, {"Universe_AllowPlayerOrders( 1 )", ""}, HW2_Wait(4)}, {{"g_pointer_default = HW2_CreateEventPointerSobGroup( 'Communications_Station' )", ""}, {"ping_communications_station_id = Ping_AddSobGroup( ping_communications_station, 'anomaly', 'Communications_Station' )", ""}, {"Ping_AddDescription(ping_communications_station_id, 0, '$41960')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41534", 10)}, {{"obj_prim_destroy_comms_subsystem_id = Objective_Add( obj_prim_destroy_comms_subsystem , OT_Primary )", ""}, {"Objective_AddDescription( obj_prim_destroy_comms_subsystem_id, '$41985')", ""}, {"obj_prim_destroyvaygr_id = Objective_Add( obj_prim_destroyvaygr , OT_Primary )", ""}, {"Objective_AddDescription( obj_prim_destroyvaygr_id, '$41995')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41535", 10)}, {{"EventPointer_Remove(g_pointer_default)", ""}, HW2_Wait(1), {"Sensors_EnableCameraZoom( 1 )", ""},}, {{"Sensors_Toggle( 0 )", ""}, HW2_Letterbox(0), HW2_Wait(2), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"evt_isplaying = 0", ""},},}
Events["speechevent_stationattacks"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41640", 10), {"Sound_MusicPlayType( 'data:sound/music/BATTLE/BATTLE_04', MUS_Battle )", ""},},}
Events["intelevent_eliminatecommstation"] = {{{"evt_isplaying = 1", ""}, HW2_Pause(1), {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, HW2_Wait(2)}, {{"Camera_Interpolate( 'here', 'Camera_CommShort', 2)", ""}, HW2_Wait(2)}, {{"g_pointer_default = HW2_CreateEventPointerSobGroup( 'Communications_Station' )", ""}, {"ping_communications_station_id = Ping_AddSobGroup( ping_communications_station, 'anomaly', 'Communications_Station' )", ""}, {"Ping_AddDescription(ping_communications_station_id, 0, '$41960')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41534", 10)}, {HW2_Wait(1)}, {{"EventPointer_Remove(g_pointer_default)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41535", 10), {"obj_prim_destroy_comms_subsystem_id = Objective_Add( obj_prim_destroy_comms_subsystem , OT_Primary )", ""}, {"Objective_AddDescription( obj_prim_destroy_comms_subsystem_id, '$41985')", ""}, {"obj_prim_destroyvaygr_id = Objective_Add( obj_prim_destroyvaygr , OT_Primary )", ""}, {"Objective_AddDescription( obj_prim_destroyvaygr_id, '$41995')", ""},}, {{"Sensors_Toggle( 0 )", ""}, {"Universe_EnableSkip(0)", ""}, HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(2), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"evt_isplaying = 0", ""},},}
Events["intelevent_vaygrandcommdestroyed"] = {{HW2_Wait(4)}, {{"Sensors_EnableCameraZoom( 0 )", ""}, {"Sensors_Toggle( 0 )", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, {"Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", ""}, {"Universe_AllowPlayerOrders( 0 )", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41650", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41651", 10)}, {HW2_Fade(1), HW2_Wait(2)}, {{"Player_InstantlyGatherAllResources( 0 )", ""}, {"Player_InstantDockAndParade( 0, Players_Mothership, 0 )", ""}, {"Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", ""}, {"Subtitle_Message( '$3652', 2 )", ""}, HW2_Wait(2)}, {HW2_Fade(0), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41652", 10)}, {{"SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", ""}, HW2_Wait(15)}, {{"Universe_Fade( 1, 2 )", ""}, HW2_Wait(3)}, {HW2_LocationCardEvent("$41523", 4)}, {HW2_Wait(2)}, {{"setMissionComplete( 1 )", ""},},}
Events["speechevent_stationdown_vaygrleft"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41650", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41653", 10), {"Rule_Add('Rule_Ping_Carrier')", ""},},}
Events["intelevent_vayrgkilled_aftersub"] = {{HW2_Wait(4)}, {{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Letterbox(1), {"Camera_FocusSobGroupWithBuffer( Players_Mothership, 2000, 2000, 2)", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41651", 10)}, {{"Universe_AllowPlayerOrders( 0 )", ""}, HW2_Fade(1), HW2_Wait(2)}, {{"Player_InstantlyGatherAllResources( 0 )", ""}, {"Player_InstantDockAndParade( 0, Players_Mothership, 0 )", ""}, {"Subtitle_Message( '$3652', 2 )", ""}, HW2_Wait(2)}, {HW2_Fade(0), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41652", 10)}, {{"SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", ""}, HW2_Wait(15)}, {{"Universe_Fade( 1, 2 )", ""}, HW2_Wait(3)}, {HW2_LocationCardEvent("$41523", 4)}, {HW2_Wait(2)}, {{"setMissionComplete( 1 )", ""},},}
Events["speechevent_anticorvettefrigatesavailable"] = {{HW2_Wait(5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41610", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41611", 10)},}
Events["speechevent_carrieravailable"] = {{HW2_Wait(5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41630", 10)},}
Events["speechevent_playerloses"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$41522", 4)}, {{"setMissionComplete( 0 )", ""},},}
