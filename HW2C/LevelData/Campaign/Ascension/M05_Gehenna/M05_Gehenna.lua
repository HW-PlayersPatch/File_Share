-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")

function OnInit()
	Camera_UseCameraPoint("camera1")
	Sound_EnableAllSpeech(0)
	Rule_Add("Rule_PlayAmbientMusic")
	HW2_SetResearchLevel(5)
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Rule_Add("Rule_Init")
end

function Rule_Init()
	Rule_Add("Rule_FrigateDockHack")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
	Sound_SpeechSubtitlePath("speech:missions/m_05/")
	obj_prim_retrieveOracle = "$42004"
	obj_prim_retrieveOracle_id = 0
	obj_sec_destroyGarrisons = "$42000"
	obj_sec_destroyGarrisons_id = 0
	obj_sec_destroyShipyard = "$42005"
	obj_sec_destroyShipyard_id = 0
	ping_gehenna = "$42405"
	ping_gehenna_id = 0
	ping_garrison1 = "$42406"
	ping_garrison1_id = 0
	ping_garrison2 = "$42406"
	ping_garrison2_id = 0
	ping_garrison3 = "$42406"
	ping_garrison3_id = 0
	ping_vaygr = "$42407"
	ping_vaygr_id = 0
	ping_shipyard = "$42405"
	ping_shipyard_id = 0
	pointer_oracle_id = 0
	pointer_dustVein1_id = 0
	pointer_dustVein2_id = 0
	pointer_dustVein3_id = 0
	pointer_enemyShipyard_id = 0
	pointer_garrison1_id = 0
	pointer_garrison2_id = 0
	pointer_garrison3_id = 0
	EventPlaying = 0
	GarrisonEventHasPlayed = 0
	PatrolsFound = 0
	Patrol1FoundONCE = 0
	Patrol2FoundONCE = 0
	Patrol3FoundONCE = 0
	Patrol1EventONCE = 0
	Patrol2EventONCE = 0
	Patrol3EventONCE = 0
	PatrolDestroyedEventsPlayed = 0
	g_pointer_default_1 = 0
	g_pointer_default_2 = 0
	g_pointer_default_3 = 0
	g_pointer_default_4 = 0
	g_now_time = Universe_GameTime()
	g_playerID = Universe_CurrentPlayer()
	g_save_id = 0
	ShipToParadeRoundTypeName = "Hgn_MotherShip"
	SobGroup_Create("VaygrShipsInProbeRange")
	SobGroup_Create("VaygrProbesInProbeRange")
	SobGroup_Create("PlayerShipsInProbeRange")
	SobGroup_Create("CarriersInProbeRange")
	SobGroup_Create("MothershipsInProbeRange")
	SobGroup_Create("AllPlayerScouts")
	SobGroup_Create("AllPlayerInterceptors")
	SobGroup_Create("AllPlayerBombers")
	SobGroup_Create("AllPlayerEliteBombers")
	SobGroup_Create("AllPlayerAssCorvs")
	SobGroup_Create("AllPlayerPulseCorvs")
	SobGroup_Create("AllPlayerMinelayerCorvs")
	SobGroup_Create("AllPlayerEliteAssCorvs")
	SobGroup_Create("AllPlayerResCollectors")
	g_proximity_brokentime = 0
	g_proximity_brokenstate = 0
	PlayerLeftFieldEVENTONCE = 0
	PlayerLeftFieldEVENTPLAYED = 0
	PlayStagingMusicONCE = 0
	g_proximity_timeplayerhastoleaveproximity = 45
	g_timetoleaveproxofgehenna = g_proximity_timeplayerhastoleaveproximity
	g_gehenna_alerted = 0
	RemovePlayerLeftDustField = 0
	CPU_Enable(1, 0)
	g_attacktime_2 = 0
	g_attacktime_3 = 0
	g_attacktime_4 = 0
	g_attacktime_5 = 0
	garrisons_destroyed = 0
	garrisonsObjectiveComplete = 0
	garrison1DestroyedONCE = 0
	garrison2DestroyedONCE = 0
	garrison3DestroyedONCE = 0
	garrison1DestroyedEventONCE = 0
	garrison2DestroyedEventONCE = 0
	garrison3DestroyedEventONCE = 0
	MarineFrigateDockedWithGehenna = 0
	SobGroup_Create("ShipsDockedWithGehenna")
	SobGroup_SetAutoLaunch("Gehenna", ShipHoldStayDockedAlways)
	ProbeNumber = 0
	CheckForMSONCE = 0
	CheckedProbeVol1 = 0
	CheckedProbeVol2 = 0
	CheckedProbeVol3 = 0
	CheckedProbeVol4 = 0
	CheckedProbeVol5 = 0
	CheckedProbeVol6 = 0
	for i = 1, 3 do
	CPU_RemoveSobGroup(1, "Garrison_"..i)
	CPU_RemoveSobGroup(1, "Patrol"..i)
	end
	for j = 1, 5 do
	CPU_RemoveSobGroup(1, "Vgr_Wave"..j)
	end
	VaygrShipList = {{"Vgr_Bomber", 20, 11}, {"Vgr_Interceptor", 21, 11}, {"Vgr_LaserCorvette", 22, 11}, {"Vgr_LanceFighter", 23, 11}, {"Vgr_MissileCorvette", 24, 11}, {"Vgr_HeavyMissileFrigate", 30, 10}, {"Vgr_AssaultFrigate", 25, 10},}
	g_vaygrShipLastBuilt = ""
	g_maxVaygrShips = 300
	g_vaygrPrimaryBuilder = "Vgr_Shipyard_1"
	g_vaygrID = 1
	g_vaygrCurrentOrder = "VO_Nothing"
	SobGroup_AbilityActivate("Gehenna", AB_Sensors, 0)
	SetAlliance(0, 2)
	SetAlliance(2, 0)
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	SobGroup_CreateSubSystem("Vgr_Shipyard_1", "Vgr_MS_Production_Fighter")
	SobGroup_CreateSubSystem("Vgr_Shipyard_1", "Vgr_MS_Production_Corvette")
	SobGroup_CreateSubSystem("Vgr_Shipyard_1", "Vgr_MS_Production_Frigate")
	SobGroup_CreateSubSystem("Vgr_Shipyard_1", "Vgr_MS_Module_PlatformControl")
	SobGroup_CreateSubSystem("Vgr_Shipyard_1", "Vgr_MS_Module_Research")
	SobGroup_CreateSubSystem("Vgr_Shipyard_1", "Vgr_MS_Sensors_AdvancedArray")
	Player_GrantResearchOption(1, "SuperCapHealthUpgradeSPGAME")
	Player_GrantResearchOption(1, "CorvetteTech")
	Player_GrantResearchOption(1, "FrigateTech")
	Player_GrantResearchOption(1, "LanceBeams")
	Player_GrantResearchOption(1, "PlasmaBombs")
	Player_GrantResearchOption(1, "CorvetteLaser")
	Player_GrantResearchOption(1, "PlatformHeavyMissiles")
	Player_GrantResearchOption(1, "FrigateAssault")
	Player_GrantResearchOption(1, "FrigateInfiltrationTech")
	Player_GrantResearchOption(1, "RepairAbility")
	SobGroup_AbilityActivate("Vgr_Shipyard_1", AB_Move, 0)
	SobGroup_AbilityActivate("Vgr_Shipyard_1", AB_Hyperspace, 0)
	SobGroup_SetTactics("Garrison_1", AggressiveTactics)
	SobGroup_SetTactics("Garrison_2", AggressiveTactics)
	SobGroup_SetTactics("Garrison_3", AggressiveTactics)
	SobGroup_SetTactics("AllTurrets", AggressiveTactics)
	SobGroup_SetAsDeployed("AllTurrets")
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	g_vaygrShipLastBuiltChanged = ""
	Player_SetPlayerName(0, "$42391")
	Player_SetPlayerName(1, "$42390")
	Player_SetPlayerName(2, "$42392")
	SobGroup_Create("Dummy_Vaygr")
	Rule_AddInterval("Rule_PlayStagingMusic", 3)
	Rule_Add("Rule_IntelEvent_situationreport")
	Timer_Start("Garrison_Timer", 90)
	Rule_AddInterval("Rule_IntelEvent_playerLeftDustField", 2)
	Rule_AddInterval("Rule_IntelEvent_DestroyGarrisons", 1)
	Rule_AddInterval("Rule_checkGarrisonsDestroyed", 1)
	Rule_AddInterval("Rule_IntelEvent_GarrisonDestroyed", 1)
	Rule_AddInterval("Rule_IntelEvent_PatrolDetected", 1)
	Rule_AddInterval("Rule_IntelEvent_PatrolDestroyed", 1)
	Rule_AddInterval("Rule_PlayerCanBuildIonCannonFrigates", 3)
	Timer_Start("IonCannonTimer", 160)
	Rule_AddInterval("Rule_checkForShipsDockedWithGehenna", 1)
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval("Rule_PlayerInProximityOfGehenna", 5)
	Rule_AddInterval("Rule_GehennaAttackOn", 2)
	Timer_Start("Probe_Timer", 1560)
	Rule_AddInterval("Rule_VaygrSendProbes", 10)
	Rule_Add("Rule_PatrolSetup")
	Rule_AddInterval("Rule_PlayerLose", 1)
	Rule_Add("Rule_GetReactiveFleetRatio")
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	HW2_ReactiveInfo()
	Rule_Remove("Rule_Init")
end

function Rule_GetReactiveFleetRatio()
	ReactiveFleetSize = GetReactiveFleetSizeInRU()
	print("Reactive fleet size = "..ReactiveFleetSize)
	PlayerFleetSize = GetActualPlayerFleetSizeInRU()
	print("Player fleet size = "..PlayerFleetSize)
	ReactiveFleetRatio = PlayerFleetSize / ReactiveFleetSize
	print("Reactive fleet ratio = "..ReactiveFleetRatio)
	if (ReactiveFleetRatio > 1 and ReactiveFleetRatio < 1.3) then
	Player_SetRU(1, 3000)
	elseif (ReactiveFleetRatio >= 1.3 and ReactiveFleetRatio < 1.6) then
	Player_SetRU(1, 6000)
	elseif (ReactiveFleetRatio >= 1.6) then
	Player_SetRU(1, 9000)
	end
	Rule_Remove("Rule_GetReactiveFleetRatio")
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_EnableResearchOptionsAfterIntelevent()
	if (Event_IsDone("intelevent_situationreport") == 1) then
	Enable_ResearchOptions()
	Rule_Remove("Rule_EnableResearchOptionsAfterIntelevent")
	end
end

function Rule_FrigateDockHack()
	Player_AllowDockFromUIOverride(0, "Hgn_MarineFrigate")
end

function Enable_ResearchOptions()
	Player_UnrestrictResearchOption(0, "ScoutPingAbility")
	Player_UnrestrictResearchOption(0, "ImprovedTorpedo")
	Player_UnrestrictResearchOption(0, "AssaultCorvetteHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "AssaultCorvetteMAXSPEEDUpgrade2")
	Player_UnrestrictResearchOption(0, "PulsarCorvetteHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "PulsarCorvetteMAXSPEEDUpgrade2")
	Player_UnrestrictResearchOption(0, "GunTurretHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "IonTurretHealthUpgrade2")
end

function DeployPlatforms()
	for i = 1, 12 do
	SobGroup_MoveToSobGroup("platform_"..i, "platform_"..i)
	end
end

function Rule_TrackVaygr()
	SobGroup_SobGroupAdd("Dummy_Vaygr", "Player_Ships1")
	SobGroup_RemoveType("Dummy_Vaygr", "Gehenna")
	SobGroup_RemoveType("Dummy_Vaygr", "Vgr_WeaponPlatform_gun")
end

function Rule_IntelEvent_situationreport()
	if (Universe_GameTime() >= (g_now_time + 12)) then
	Sound_EnableAllSpeech(1)
	Sound_EnterIntelEvent()
	EventPlaying = 1
	Event_Start("intelevent_situationreport")
	Rule_Add("Rule_EnableResearchOptionsAfterIntelevent")
	Rule_Remove("Rule_IntelEvent_situationreport")
	end
end

function Rule_IntelEvent_playerLeftDustField()
	if (RemovePlayerLeftDustField == 1) then
	Rule_Remove("Rule_IntelEvent_playerLeftDustField")
	elseif (EventPlaying == 0 and g_proximity_brokenstate == 1 and PlayerLeftFieldEVENTONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	PlayerLeftFieldEVENTONCE = 1
	Event_Start("autofocus_leftfield")
	end
end

function Rule_IntelEvent_playerLeftDustFieldREPEAT()
	if (EventPlaying == 0 and g_proximity_brokenstate == 1 and PlayerLeftFieldEVENTONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	PlayerLeftFieldEVENTONCE = 1
	Event_Start("autofocus_leftfieldREPEAT")
	end
end

function Rule_IntelEvent_DestroyGarrisons()
	if (EventPlaying == 0 and Timer_GetRemaining("Garrison_Timer") < 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_DestroyGarrisons")
	Rule_Remove("Rule_IntelEvent_DestroyGarrisons")
	end
end

function Rule_checkGarrisonsDestroyed()
	if (g_gehenna_alerted == 0 and SobGroup_Empty("Garrison_1") == 1 and garrison1DestroyedONCE == 0) then
	garrison1DestroyedONCE = 1
	garrisons_destroyed = (garrisons_destroyed + 1)
	end
	if (g_gehenna_alerted == 0 and SobGroup_Empty("Garrison_2") == 1 and garrison2DestroyedONCE == 0) then
	garrison2DestroyedONCE = 1
	garrisons_destroyed = (garrisons_destroyed + 1)
	end
	if (g_gehenna_alerted == 0 and SobGroup_Empty("Garrison_3") == 1 and garrison3DestroyedONCE == 0) then
	garrison3DestroyedONCE = 1
	garrisons_destroyed = (garrisons_destroyed + 1)
	end
	if (g_gehenna_alerted == 1 or garrisons_destroyed == 3) then
	Rule_Remove("Rule_checkGarrisonsDestroyed")
	end
end

function Rule_IntelEvent_GarrisonDestroyed()
	if (EventPlaying == 0 and garrisons_destroyed == 1 and garrison1DestroyedEventONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	garrison1DestroyedEventONCE = 1
	Event_Start("intelevent_garrison1destroyed")
	end
	if (EventPlaying == 0 and garrisons_destroyed == 2 and garrison2DestroyedEventONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	garrison2DestroyedEventONCE = 1
	Event_Start("intelevent_garrison2destroyed")
	end
	if (EventPlaying == 0 and garrisons_destroyed == 3 and garrison3DestroyedEventONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	garrison3DestroyedEventONCE = 1
	Event_Start("intelevent_garrison3destroyed")
	Rule_Remove("Rule_IntelEvent_GarrisonDestroyed")
	end
end

function Rule_IntelEvent_PatrolDetected()
	if (g_gehenna_alerted == 1) then
	Rule_Remove("Rule_IntelEvent_PatrolDetected")
	end
	if (g_gehenna_alerted == 0 and Patrol1FoundONCE == 0 and PatrolDetected[1] == 1) then
	PatrolsFound = (PatrolsFound + 1)
	Patrol1FoundONCE = 1
	elseif (g_gehenna_alerted == 0 and Patrol2FoundONCE == 0 and PatrolDetected[2] == 1) then
	PatrolsFound = (PatrolsFound + 1)
	Patrol2FoundONCE = 1
	elseif (g_gehenna_alerted == 0 and Patrol3FoundONCE == 0 and PatrolDetected[3] == 1) then
	PatrolsFound = (PatrolsFound + 1)
	Patrol3FoundONCE = 1
	end
	if (g_gehenna_alerted == 0 and EventPlaying == 0 and Patrol1EventONCE == 0 and PatrolsFound == 1) then
	Patrol1EventONCE = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_FirstPatrolFound")
	elseif (g_gehenna_alerted == 0 and EventPlaying == 0 and Patrol2EventONCE == 0 and PatrolsFound == 2) then
	Patrol2EventONCE = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_SecondPatrolFound")
	elseif (g_gehenna_alerted == 0 and EventPlaying == 0 and Patrol3EventONCE == 0 and PatrolsFound == 3) then
	Patrol3EventONCE = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_ThirdPatrolFound")
	end
	if (PatrolsFound == 3 and Patrol3EventONCE == 1) then
	Rule_Remove("Rule_IntelEvent_PatrolDetected")
	end
end

function Rule_IntelEvent_PatrolDestroyed()
	if (g_gehenna_alerted == 0 and EventPlaying == 0 and PatrolDetected[1] == 1 and SobGroup_Empty("Patrol1") == 1) then
	PatrolDestroyedEventsPlayed = (PatrolDestroyedEventsPlayed + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_FirstPatrolDestroyed")
	elseif (g_gehenna_alerted == 0 and EventPlaying == 0 and PatrolDetected[2] == 1 and SobGroup_Empty("Patrol2") == 1) then
	PatrolDestroyedEventsPlayed = (PatrolDestroyedEventsPlayed + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_SecondAndThirdPatrolDestroyed")
	elseif (g_gehenna_alerted == 0 and EventPlaying == 0 and PatrolDetected[3] == 1 and SobGroup_Empty("Patrol3") == 1) then
	PatrolDestroyedEventsPlayed = (PatrolDestroyedEventsPlayed + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_SecondAndThirdPatrolDestroyed")
	end
	if (g_gehenna_alerted == 1 or PatrolDestroyedEventsPlayed == 3) then
	Rule_Remove("Rule_IntelEvent_PatrolDestroyed")
	end
end

function Rule_IntelEvent_detectedByVaygr()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_detectedbyvaygr")
	Rule_Remove("Rule_IntelEvent_detectedByVaygr")
	end
end

function Rule_IntelEvent_ShipyardDiscovered()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_ShipyardDiscovered")
	Rule_Add("Rule_IntelEvent_ShipyardDestroyed")
	Rule_Remove("Rule_IntelEvent_ShipyardDiscovered")
	end
end

function Rule_IntelEvent_ShipyardDestroyed()
	if (EventPlaying == 0 and SobGroup_Empty("Vgr_Shipyard_1") == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_ShipyardDestroyed")
	Rule_Remove("Rule_IntelEvent_ShipyardDestroyed")
	end
end

function Rule_PlayerCanBuildIonCannonFrigates()
	if (EventPlaying == 0 and Timer_GetRemaining("IonCannonTimer") < 1) then
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	Event_Start("speechevent_ioncannonsavailable")
	Rule_Remove("Rule_PlayerCanBuildIonCannonFrigates")
	end
end

function Rule_checkForShipsDockedWithGehenna()
	SobGroup_GetSobGroupDockedWithGroup("Gehenna", "ShipsDockedWithGehenna")
	if (SobGroup_Empty("ShipsDockedWithGehenna") ~= 1) then
	SobGroup_FillShipsByType("tempSobGroup", "ShipsDockedWithGehenna", "Hgn_MarineFrigate")
	if (SobGroup_Empty("tempSobGroup") ~= 1) then
	MarineFrigateDockedWithGehenna = 1
	SobGroup_SetInvulnerability("Player_Ships0", 1)
	Rule_Add("Rule_IntelEvent_MissionEnd")
	Rule_Remove("Rule_checkForShipsDockedWithGehenna")
	end
	end
end

function Rule_IntelEvent_MissionEnd()
	if (EventPlaying == 0 and MarineFrigateDockedWithGehenna == 1) then
	EventPlaying = 1
	Event_Start("intelevent_MissionEnd")
	Rule_Remove("Rule_IntelEvent_MissionEnd")
	end
end

function ShipsInNebula()
	if (SobGroup_AreAnySquadronsOutsideDustCloud("Player_Ships0", "Nebula4_OLD, Nebula4_OLD1, Nebula2_OLD1, Nebula2_OLD2, Nebula2_OLD3, Nebula2_OLD4, Nebula2_OLD5, Nebula2_OLD7, Nebula5_OLD, Nebula7_OLD, Nebula3_OLD, Nebula2_OLD, Nebula8_OLD") == 1) then
	return 1
	else
	return 0
	end
end

function Rule_PlayerInProximityOfGehenna()
	if (Player_IsShipInVolume(0, "GehennaSphere") == 1) then
	if (g_gehenna_alerted == 0) then
	g_gehenna_alerted = 1
	Rule_Add("Rule_PlayerProximityToGehennaAlerted")
	Rule_Remove("Rule_IntelEvent_playerLeftDustField")
	end
	Rule_AddInterval("Rule_IntelEvent_ShipyardDiscovered", 5)
	Rule_Remove("Rule_PlayerInProximityOfGehenna")
	end
	if (g_gehenna_alerted == 0) then
	if (ShipsInNebula() == 1 and g_proximity_brokenstate == 0) then
	Rule_Add("Rule_checkPlayerReturnedToField")
	g_proximity_brokenstate = 1
	end
	end
end

function Rule_checkPlayerReturnedToField()
	if (g_proximity_brokenstate == 1) then
	if (PlayerLeftFieldEVENTPLAYED == 1) then
	if (ShipsInNebula() == 0) then
	Subtitle_TimeCounterEnd()
	print("Trying to remove on-screen timer NOW!!!!!!!!!")
	g_proximity_brokenstate = 0
	PlayerLeftFieldEVENTONCE = 0
	PlayerLeftFieldEVENTPLAYED = 0
	Rule_Remove("Rule_checkPlayerReturnedToField")
	end
	end
	end
	if (PlayerLeftFieldEVENTPLAYED == 1) then
	if (ShipsInNebula() == 1) then
	if (Timer_GetRemaining(0) < 0.1) then
	Subtitle_TimeCounterEnd()
	g_gehenna_alerted = 1
	Rule_Add("Rule_PlayerProximityToGehennaAlerted")
	Rule_Remove("Rule_IntelEvent_playerLeftDustField")
	Rule_Remove("Rule_checkPlayerReturnedToField")
	end
	end
	end
end

function Rule_PlayerProximityToGehennaAlerted()
	CPU_Enable(1, 1)
	DefendGehenna = CPU_AddDefendTarget(1, "GehennaSphere", 300)
	CPU_SetDefendTargetCapturePriority(1, DefendGehenna)
	CPU_SetDefendTargetRadius(1, DefendGehenna, 15000)
	if (garrisonsObjectiveComplete == 0) then
	print("setting Garrisons objective to off!!!!!")
	Objective_SetState(obj_sec_destroyGarrisons_id, OS_Off)
	Rule_Remove("Rule_IntelEvent_DestroyGarrisons")
	end
	print("Removing pings!!!!!")
	Ping_Remove(ping_garrison1_id)
	Ping_Remove(ping_garrison2_id)
	Ping_Remove(ping_garrison3_id)
	for i = 1, 3 do
	SobGroup_FormStrikeGroup("Garrison_"..i, "wall")
	SobGroup_AttackPlayer("Garrison_"..i, 0)
	SobGroup_AttackPlayer("Patrol"..i, 0)
	end
	Rule_Remove("Rule_PlayerProximityToGehennaAlerted")
end

VaygrFleetWaveSize = {{"Vgr_Wave1", 30}, {"Vgr_Wave2", 40}, {"Vgr_Wave3", 50}, {"Vgr_Wave4", 60}, {"Vgr_Wave5", 70},}
SobGroup_Create("Dummy")

function Rule_AddShipToAttackGroup()
	if (g_vaygrShipLastBuiltChanged ~= g_vaygrShipLastBuilt) then
	local currentShipCount = 0
	local lowestShipCount = 100000000.0
	local waveToAddTo = 0
	for i = 1, getn(VaygrFleetWaveSize) do
	currentShipCount = SobGroup_Count(VaygrFleetWaveSize[i][1])
	if (currentShipCount < lowestShipCount and currentShipCount < VaygrFleetWaveSize[i][2]) then
	lowestShipCount = currentShipCount
	waveToAddTo = i
	end
	end
	if (waveToAddTo ~= 0) then
	SobGroup_SobGroupAdd(VaygrFleetWaveSize[waveToAddTo][1], g_vaygrShipLastBuilt)
	else
	SobGroup_SobGroupAdd("Dummy", g_vaygrShipLastBuilt)
	end
	g_vaygrShipLastBuiltChanged = g_vaygrShipLastBuilt
	end
end

function Rule_CreateAttackTimes()
	g_attacktime_2 = Universe_GameTime()
	g_attacktime_3 = (Universe_GameTime() + 50)
	g_attacktime_4 = (Universe_GameTime() + 100)
	g_attacktime_5 = (Universe_GameTime() + 200)
	Rule_Remove("Rule_CreateAttackTimes")
end

function Rule_GehennaAttackOn()
	if (g_gehenna_alerted == 1) then
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	g_vaygrCurrentOrder = "VO_AttackPlayer"
	Rule_Add("Rule_CreateAttackTimes")
	Rule_AddInterval("Rule_IntelEvent_detectedByVaygr", 2)
	SobGroup_Attack(1, "Vgr_Wave1", "Player_Ships0")
	SobGroup_GuardSobGroup("Dummy", "Vgr_Shipyard_1")
	Rule_Remove("Rule_CountdownTimeToLeaveProxOfGehenna")
	Rule_Remove("Rule_PlayerLeftProximityOfGehenna")
	Rule_Add("Rule_AttackWave_2")
	Rule_Add("Rule_AttackWave_3")
	Rule_Add("Rule_AttackWave_4")
	Rule_Add("Rule_AttackWave_5")
	Rule_Remove("Rule_GehennaAttackOn")
	end
end

function Rule_AttackWave_2()
	if (Universe_GameTime() >= g_attacktime_2) then
	SobGroup_AttackPlayer("Vgr_Wave2", g_playerID)
	Rule_Remove("Rule_AttackWave_2")
	end
end

function Rule_AttackWave_3()
	if (Universe_GameTime() >= g_attacktime_3) then
	SobGroup_AttackPlayer("Vgr_Wave3", g_playerID)
	Rule_Remove("Rule_AttackWave_3")
	end
end

function Rule_AttackWave_4()
	if (Universe_GameTime() >= g_attacktime_4) then
	SobGroup_AttackPlayer("Vgr_Wave4", g_playerID)
	Rule_Remove("Rule_AttackWave_4")
	end
end

function Rule_AttackWave_5()
	if (Universe_GameTime() >= g_attacktime_5) then
	SobGroup_AttackPlayer("Vgr_Wave5", g_playerID)
	Rule_Remove("Rule_AttackWave_5")
	end
end

function Rule_GehennaInTrouble()
	if (SobGroup_Count("Player_Ships1") <= 20) then
	g_vaygrCurrentOrder = "VO_Retreat"
	SobGroup_GuardSobGroup("Player_Ships1", "Gehenna")
	Rule_Remove("Rule_GehennaInTrouble")
	end
end

function Rule_PlayerLose()
	if (SobGroup_Empty(Players_Mothership) == 1) then
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_PlayerLose")
	end
end

function Rule_PatrolSetup()
	for i = 1, 3 do
	SobGroup_FormStrikeGroup("Patrol"..i, "wall")
	SobGroup_FollowPath("Patrol"..i, "DustVeinPath"..i, 1, 1, 1)
	SobGroup_SetTactics("Patrol"..i, AggressiveTactics)
	end
	Rule_Remove("Rule_PatrolSetup")
end

EnemiesNearPatrol = {0, 0, 0}
PatrolDetected = {0, 0, 0}

function Rule_PatrolWatchForEnemies()
	for i = 1, 3 do
	Player_FillProximitySobGroup("tempSobGroup", 0, "Patrol"..i, 5000)
	if (SobGroup_Empty("tempSobGroup") == 0) then
	if (EnemiesNearPatrol[i] == 0) then
	EnemiesNearPatrol[i] = 1
	PatrolDetected[i] = 1
	SobGroup_Attack(1, "Patrol"..i, "tempSobGroup")
	end
	end
	end
end

function Rule_PatrolAttackWatch()
	for i = 1, 3 do
	if (EnemiesNearPatrol[i] == 1) then
	if (SobGroup_GetActualSpeed("Patrol"..i) < 1) then
	SobGroup_FormStrikeGroup("Patrol"..i, "wall")
	SobGroup_FollowPath("Patrol"..i, "DustVeinPath"..i, 1, 1, 0)
	EnemiesNearPatrol[i] = 0
	end
	end
	end
end

function Rule_PlayAmbientMusic()
	print("Trying to play ambient music!")
	Sound_MusicPlayType("data:sound/music/ambient/amb_05", MUS_Ambient)
	Rule_Remove("Rule_PlayAmbientMusic")
end

function Rule_PlayStagingMusic()
	if (PlayStagingMusicONCE == 1) then
	print("Trying to play staging music!")
	Sound_MusicPlayType("data:sound/music/staging/staging_05", MUS_Staging)
	Rule_Remove("Rule_PlayStagingMusic")
	end
end

function Rule_PlayBattleMusic()
	print("Trying to play battle music!")
	Sound_MusicPlayType("data:sound/music/battle/battle_04_alt", MUS_Battle)
	Rule_Remove("Rule_PlayBattleMusic")
end

FreshlyBuiltProbe = {}

function Rule_VaygrSendProbes()
	if (Timer_GetRemaining("Probe_Timer") < 1 and ProbeNumber < 6) then
	print("Probe timer is up! Starting to build probes!")
	if (CheckForMSONCE == 0) then
	print("Starting check for Carriers and Motherships!")
	Rule_AddInterval("Rule_VaygrCheckForMS", 2)
	Timer_Start("ProbeSearchTimer", 200)
	CheckForMSONCE = 1
	end
	ProbeNumber = (ProbeNumber + 1)
	FreshlyBuiltProbe[ProbeNumber] = SobGroup_CreateShip("Vgr_Shipyard_1", "Vgr_Probe")
	Rule_AddInterval("Rule_ProbeSetup", 7)
	Rule_AddInterval("Rule_VaygrSendProbes", 10)
	Rule_Remove("Rule_VaygrSendProbes")
	elseif (ProbeNumber == 6) then
	Rule_Remove("Rule_VaygrSendProbes")
	end
end

function Rule_ProbeSetup()
	SobGroup_Move(1, FreshlyBuiltProbe[ProbeNumber], "ProbeVol"..ProbeNumber)
	Rule_Remove("Rule_ProbeSetup")
end

function Rule_VaygrCheckForMS()
	if (g_gehenna_alerted == 1 or Timer_GetRemaining("ProbeSearchTimer") < 1) then
	Rule_Remove("Rule_VaygrCheckForMS")
	else
	for i = 1, ProbeNumber do
	Player_FillSobGroupInVolume("VaygrShipsInProbeRange", 1, "ProbeVol"..i)
	if (SobGroup_Empty("VaygrShipsInProbeRange") == 0) then
	print("Checking for Vaygr probes in this vol: "..i)
	SobGroup_FillShipsByType("VaygrProbesInProbeRange", "VaygrShipsInProbeRange", "Vgr_Probe")
	if (SobGroup_Empty("VaygrProbesInProbeRange") == 0) then
	print("Checking if (there are Carriers or MS's in this probe vol: "..i)
	Player_FillSobGroupInVolume("PlayerShipsInProbeRange", 0, "ProbeVol"..i)
	if (SobGroup_Empty("PlayerShipsInProbeRange") == 0) then
	SobGroup_FillShipsByType("CarriersInProbeRange", "PlayerShipsInProbeRange", "Hgn_Carrier")
	SobGroup_FillShipsByType("MothershipsInProbeRange", "PlayerShipsInProbeRange", "Hgn_MotherShip")
	if (SobGroup_Empty("CarriersInProbeRange") == 0 or SobGroup_Empty("MothershipsInProbeRange") == 0) then
	print("Found the player's Carrier or MS! Alerting Gehenna!")
	g_gehenna_alerted = 1
	CPU_Enable(1, 1)
	Rule_Add("Rule_PlayerProximityToGehennaAlerted")
	Rule_Remove("Rule_IntelEvent_playerLeftDustField")
	Rule_Remove("Rule_VaygrCheckForMS")
	end
	end
	end
	end
	end
	end
end

function Rule_startFadeOut()
	Universe_Fade(1, 2.5)
	Rule_Remove("Rule_startFadeOut")
end

function Rule_dockAllStrikeCraft()
	Player_FillShipsByType("AllPlayerScouts", 0, "Hgn_Scout")
	Player_FillShipsByType("AllPlayerInterceptors", 0, "Hgn_Interceptor")
	Player_FillShipsByType("AllPlayerBombers", 0, "Hgn_AttackBomber")
	Player_FillShipsByType("AllPlayerEliteBombers", 0, "Hgn_AttackBomberElite")
	Player_FillShipsByType("AllPlayerAssCorvs", 0, "Hgn_AssaultCorvette")
	Player_FillShipsByType("AllPlayerPulseCorvs", 0, "Hgn_PulsarCorvette")
	Player_FillShipsByType("AllPlayerMinelayerCorvs", 0, "Hgn_MinelayerCorvette")
	Player_FillShipsByType("AllPlayerEliteAssCorvs", 0, "Hgn_AssaultCorvetteElite")
	Player_FillShipsByType("AllPlayerResCollectors", 0, "Hgn_ResourceCollector")
	if (SobGroup_Empty("AllPlayerScouts") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerScouts", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerInterceptors") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerInterceptors", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerBombers") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerBombers", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerEliteBombers") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerEliteBombers", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerAssCorvs") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerAssCorvs", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerPulseCorvs") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerPulseCorvs", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerMinelayerCorvs") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerMinelayerCorvs", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerEliteAssCorvs") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerEliteAssCorvs", Players_Mothership)
	end
	if (SobGroup_Empty("AllPlayerResCollectors") == 0) then
	SobGroup_DockSobGroupInstant("AllPlayerResCollectors", Players_Mothership)
	end
	Rule_Remove("Rule_dockAllStrikeCraft")
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

Events = {}
Events["intelevent_situationreport"] = {{{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6417')", ""},}, {HW2_Wait(2)}, {HW2_LocationCardEvent("$42020", 6)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$42030", 4)}, {HW2_Wait(1.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$42031", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42032", 6)}, {HW2_Wait(1.5)}, {HW2_Letterbox(1)}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Universe_EnableSkip(1)", ""}, {"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42033", 6), {"pointer_oracle_id = HW2_CreateEventPointerSobGroup('Gehenna')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42040", 10)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42037", 8), {"obj_prim_retrieveOracle_id = Objective_Add(obj_prim_retrieveOracle , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_retrieveOracle_id, '$42010')", ""}, {"ping_gehenna_id = Ping_AddSobGroup(ping_gehenna, 'anomaly', 'Gehenna')", ""}, {"Ping_AddDescription(ping_gehenna_id, 0, '$42450')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42038", 6)}, {HW2_Wait(1)}, {{"EventPointer_Remove(pointer_oracle_id)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$42039", 6), {"pointer_dustVein1_id = HW2_CreateEventPointerVolume('DustVeinPointer1')", ""}, {"pointer_dustVein2_id = HW2_CreateEventPointerVolume('DustVeinPointer2')", ""}, {"pointer_dustVein3_id = HW2_CreateEventPointerVolume('DustVeinPointer3')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42035", 7)}, {HW2_Wait(0.5)}, {{"EventPointer_Remove(pointer_dustVein1_id)", ""}, {"EventPointer_Remove(pointer_dustVein2_id)", ""}, {"EventPointer_Remove(pointer_dustVein3_id)", ""},}, {HW2_Wait(0.5)}, {{"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, HW2_Pause(0), HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""},}, {HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_DestroyGarrisons"] = {{HW2_Letterbox(1)}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Universe_EnableSkip(1)", ""}, {"Sensors_Toggle(1)", ""},}, {{"Camera_Interpolate('here', 'camera2', 1)", ""}, HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42044", 8), {"pointer_garrison1_id = HW2_CreateEventPointerSobGroup('Garrison_1')", ""}, {"pointer_garrison2_id = HW2_CreateEventPointerSobGroup('Garrison_2')", ""}, {"pointer_garrison3_id = HW2_CreateEventPointerSobGroup('Garrison_3')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42042", 8), {"ping_garrison1_id = Ping_AddSobGroup(ping_garrison1, 'anomaly', 'Garrison_1')", ""}, {"Ping_AddDescription(ping_garrison1_id, 0, '$42420')", ""}, {"ping_garrison2_id = Ping_AddSobGroup(ping_garrison2, 'anomaly', 'Garrison_2')", ""}, {"Ping_AddDescription(ping_garrison2_id, 0, '$42420')", ""}, {"ping_garrison3_id = Ping_AddSobGroup(ping_garrison3, 'anomaly', 'Garrison_3')", ""}, {"Ping_AddDescription(ping_garrison3_id, 0, '$42420')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42043", 5), {"GarrisonEventHasPlayed = 1", ""}, {"obj_sec_destroyGarrisons_id = Objective_Add(obj_sec_destroyGarrisons , OT_Secondary)", ""}, {"Objective_AddDescription(obj_sec_destroyGarrisons_id, '$42012')", ""},}, {{"EventPointer_Remove(pointer_garrison1_id)", ""}, {"EventPointer_Remove(pointer_garrison2_id)", ""}, {"EventPointer_Remove(pointer_garrison3_id)", ""},}, {HW2_Wait(0.5)}, {{"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, HW2_Pause(0), HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_garrison1destroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42076", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_garrison2destroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42080", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42081", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_garrison3destroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42086", 5), {"Objective_SetState(obj_sec_destroyGarrisons_id, OS_Complete)", ""},}, {HW2_Wait(1)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6418')", ""},}, {HW2_Wait(2), {"Sound_ExitIntelEvent()", ""},}, {{"EventPlaying = 0", ""}, {"garrisonsObjectiveComplete = 1", ""},},}
Events["intelevent_FirstPatrolFound"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42090", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42091", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_SecondPatrolFound"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42110", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_ThirdPatrolFound"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42116", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_FirstPatrolDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42100", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42101", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_SecondAndThirdPatrolDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42126", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["autofocus_leftfield"] = {{{"PlayStagingMusicONCE = 1", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$42146", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42149", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42148", 4)}, {HW2_Wait(0.5)}, {{"Timer_Start(0, 40)", ""}, {"Subtitle_TimeCounter(0, 42025)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"PlayerLeftFieldEVENTPLAYED = 1", ""}, {"RemovePlayerLeftDustField = 1", ""}, {"Rule_AddInterval ('Rule_IntelEvent_playerLeftDustFieldREPEAT', 2)", ""}, {"EventPlaying = 0", ""},},}
Events["autofocus_leftfieldREPEAT"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$42149", 4)}, {{"Timer_Start(0, 40)", ""}, {"Subtitle_TimeCounter(0, 42025)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"PlayerLeftFieldEVENTPLAYED = 1", ""}, {"RemovePlayerLeftDustField = 1", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_detectedbyvaygr"] = {{{"Rule_Add ('Rule_PlayBattleMusic')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$42150", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42151", 7)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42152", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_ShipyardDiscovered"] = {{HW2_Letterbox(1)}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Universe_EnableSkip(1)", ""}, {"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42170", 7), {"pointer_enemyShipyard_id = HW2_CreateEventPointerSobGroup('Vgr_Shipyard_1')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$42176", 8), {"obj_sec_destroyShipyard_id = Objective_Add(obj_sec_destroyShipyard , OT_Secondary)", ""}, {"Objective_AddDescription(obj_sec_destroyShipyard_id, '$42011')", ""}, {"ping_shipyard_id = Ping_AddSobGroup(ping_shipyard, 'anomaly', 'Vgr_Shipyard_1')", ""}, {"Ping_AddDescription(ping_shipyard_id, 0, '$42440')", ""},}, {{"EventPointer_Remove(pointer_enemyShipyard_id)", ""},}, {HW2_Wait(0.5)}, {{"Sensors_Toggle(0)", ""}, HW2_Pause(0), HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6419')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_ShipyardDestroyed"] = {{{"Rule_Add ('Rule_PlayStagingMusic')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$42177", 5), {"Objective_SetState(obj_sec_destroyShipyard_id, OS_Complete)", ""}, {"Ping_Remove (ping_gehenna_id)", ""},}, {HW2_Wait(1)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6420')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_ioncannonsavailable"] = {{{"Player_UnrestrictBuildOption(0, 'Hgn_IonCannonFrigate')", ""}, {"Player_UnrestrictResearchOption(0, 'IonCannonFrigateHealthUpgrade1')", ""}, {"Player_UnrestrictResearchOption(0, 'IonCannonFrigateMAXSPEEDUpgrade1')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$42130", 5)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_MissionEnd"] = {{HW2_Letterbox(1)}, {HW2_Wait(3)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6421')", ""},}, {HW2_Wait(2)}, {{"Camera_FocusSobGroup('Gehenna', 1, 2000, 1)", ""}, {"Ping_Remove (ping_gehenna_id)", ""},}, {{"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(0.5)}, {{"Universe_Fade(1, 2.5)", ""}, HW2_SubTitleEvent(Actor_AllShips, "$42200", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_AllShips, "$42201", 3)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_AllShips, "$42202", 3), {"Objective_SetState(obj_prim_retrieveOracle_id, OS_Complete)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_AllShips, "$42203", 3)}, {HW2_Wait(0.5)}, {{"Rule_Add ('Rule_dockAllStrikeCraft')", ""}, {"Player_InstantlyGatherAllResources(0)", ""}, {"Camera_FocusSobGroup(Players_Mothership, 1, 4000, 0)", ""},}, {{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {HW2_Wait(0.5)}, {{"Universe_Fade(0, 1.5)", ""},}, {HW2_Wait(1.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$42204", 4)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$42205", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$42207", 6)}, {HW2_Wait(0.5)}, {{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')", ""},}, {HW2_Wait(12)}, {{"Universe_Fade(1, 1.5)", ""},}, {HW2_Wait(1.5)}, {HW2_LocationCardEvent("$42024", 2), {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},}, {HW2_Wait(0.5)}, {{"setMissionComplete(1)", ""},},}
Events["speechevent_playerloses"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$42023", 4)}, {{"setMissionComplete(0)", ""},},}
