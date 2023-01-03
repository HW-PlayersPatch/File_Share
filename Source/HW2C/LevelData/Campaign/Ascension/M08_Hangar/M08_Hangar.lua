-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
KeeperTrapFXStarted = 0
Inhibitor1Installed = 0
Inhibitor2Installed = 0
Inhibitor3Installed = 0

function OnInit()
	Sound_EnableAllSpeech(0)
	Rule_Add("Rule_PlayAmbientMusic")
	Rule_Add("Rule_Init")
	Camera_UseCameraPoint("camera1")
end

function OnStartOrLoad()
	print("KeeperTrapFXStarted = "..KeeperTrapFXStarted)
	print("Inhibitor1Installed = "..Inhibitor1Installed)
	print("Inhibitor2Installed = "..Inhibitor2Installed)
	print("Inhibitor3Installed = "..Inhibitor3Installed)
	NISLoad("nis/NIS08")
	if (KeeperTrapFXStarted == 1) then
	print("trying to play trap fx!")
	FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "EffectPoint02", "EffectPoint01", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring", "EffectPoint02", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring_loop", "EffectPoint02", 10)
	FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "EffectPoint03", "EffectPoint01", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring", "EffectPoint03", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring_loop", "EffectPoint03", 10)
	FX_StartEvent("InhibitorChunk1", "Activate")
	FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "EffectPoint04", "EffectPoint01", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring", "EffectPoint04", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring_loop", "EffectPoint04", 10)
	FX_PlayEffect("pro_tech_trap_combo", "EffectPoint01", 10)
	FX_StartEvent("InhibitorChunk3", "Activate")
	FX_StartEvent("InhibitorChunk2", "Activate")
	FX_StartEvent("InhibitorChunk1", "Activate")
	end
	if (Inhibitor1Installed == 1) then
	Rule_Add("Rule_playeffect_inhibitor1Attached")
	end
	if (Inhibitor2Installed == 1) then
	Rule_Add("Rule_playeffect_inhibitor2Attached")
	end
	if (Inhibitor3Installed == 1) then
	Rule_Add("Rule_playeffect_inhibitor3Attached")
	end
end

function Enable_ResearchOptions()
	Player_UnrestrictResearchOption(0, "TorpedoFrigateHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "TorpedoFrigateMAXSPEEDUpgrade2")
end

function Rule_Init()
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Player_SetPlayerName(0, "$43803")
	Player_SetPlayerName(1, "$43804")
	Player_SetPlayerName(2, "$43804")
	Player_SetPlayerName(3, "$43804")
	Player_SetPlayerName(4, "")
	FOW_RevealGroup("Berth", 1)
	CPU_Enable(1, 0)
	CPU_Enable(2, 0)
	CPU_Enable(3, 0)
	CPU_Enable(4, 0)
	SobGroup_AllowPassiveActionsAlways("Dreadnaught", 1)
	SobGroup_SetSwitchOwnerFlag("Dreadnaught", 0)
	SobGroup_ManualEngineGlow("Dreadnaught", 0)
	Sound_SpeechSubtitlePath("speech:missions/m_08/")
	SobGroup_Create("NISTriggerShips")
	SobGroup_Create("tempSobGroup")
	SobGroup_Create("tempSobGroupOne")
	SobGroup_Create("tempSobGroupTwo")
	obj_prim_investigatePowerSignature = "$43500"
	obj_prim_investigatePowerSignature_id = 0
	obj_prim_retrieveDreadnaught = "$43501"
	obj_prim_retrieveDreadnaught_id = 0
	obj_prim_protectFleet = "$43502"
	obj_prim_protectFleet_id = 0
	obj_prim_installInhibitors = "$43503"
	obj_prim_installInhibitors_id = 0
	obj_prim_sendProbes = "$43504"
	obj_prim_sendProbes_id = 0
	ping_powerSignature = "$43900"
	ping_powerSignature_id = 0
	ping_dreadnaught = "$43901"
	ping_dreadnaught_id = 0
	ping_keeper = "$43902"
	ping_keeper_id = 0
	ping_derelict1 = "$43903"
	ping_derelict1_id = 0
	ping_derelict2 = "$43904"
	ping_derelict2_id = 0
	ping_derelict3 = "$43905"
	ping_derelict3_id = 0
	ping_inhibitor1 = "$43906"
	ping_inhibitor1_id = 0
	ping_inhibitor2 = "$43906"
	ping_inhibitor2_id = 0
	ping_inhibitor3 = "$43906"
	ping_inhibitor3_id = 0
	ping_inhibitorfield = "$43906"
	ping_inhibitorfield_id = 0
	ping_probeLocation1 = "$43907"
	ping_probeLocation_id1 = 0
	ping_probeLocation2 = "$43907"
	ping_probeLocation_id2 = 0
	ping_probeLocation3 = "$43907"
	ping_probeLocation_id3 = 0
	ping_probeLocation4 = "$43907"
	ping_probeLocation_id4 = 0
	ping_probeLocation5 = "$43907"
	ping_probeLocation_id5 = 0
	ping_probeLocation6 = "$43907"
	ping_probeLocation_id6 = 0
	pointer_powerSignature_id = 0
	pointer_dreadnaught_id = 0
	pointer_keeper_id = 0
	pointer_inhibitor1_id = 0
	pointer_derelict1_id = 0
	pointer_derelict2_id = 0
	pointer_derelict3_id = 0
	g_now_time = Universe_GameTime()
	g_playerID = Universe_CurrentPlayer()
	g_save_id = 0
	PlayerHasDreadnaught = 0
	DreadnaughtDockedWithMS = 0
	DreadnaughtIsMoving = 0
	DreadnaughtInProximityOfMS = 0
	Inhibitor1InstalledONCE = 0
	Inhibitor2InstalledONCE = 0
	Inhibitor3InstalledONCE = 0
	PlayInstalledEvent1 = 0
	PlayInstalledEvent2 = 0
	PlayInstalledEvent3 = 0
	TOTALInhibitorsInstalled = 0
	Inhibitor1EnRoute = 0
	Inhibitor2EnRoute = 0
	Inhibitor3EnRoute = 0
	Inhibitor1EnRouteONCE = 0
	Inhibitor2EnRouteONCE = 0
	Inhibitor3EnRouteONCE = 0
	InhibitorTrapHasStarted = 0
	volNumber = 0
	RemoveWatchForProbes = 0
	RemoveProbePingONCE1 = 0
	RemoveProbePingONCE2 = 0
	RemoveProbePingONCE3 = 0
	RemoveProbePingONCE4 = 0
	RemoveProbePingONCE5 = 0
	RemoveProbePingONCE6 = 0
	playEffect2ONCE = 0
	playEffect3ONCE = 0
	test_01 = 0
	test_02 = 1
	numDreadnaughtDroidsBuilt = 0
	numInhibitorDroidsBuilt = 0
	CreateFirstInhibitorDroids = 0
	DroidCount_Dreadnaught = 0
	DroidCount_Inhibitor = 0
	CountDroidsExistingONCE = 0
	KeeperAttackFleet = 0
	KeeperIsAttacking = 0
	KeeperIsAttackingONCE = 0
	KeeperGoGetTrapped = 0
	KeeperIsInTrap = 0
	DesireToAttackFleet = 0
	KeeperDoneFirstAttack = 0
	KeeperHealthLocked = 0
	KeeperAttackTimerStarted = 0
	SobGroup_Create("AttackDroid_Dreadnaught")
	SobGroup_Create("AttackDroid_Inhibitor")
	SobGroup_Create("MoversLatchedToInhibitor1")
	SobGroup_Create("MoversLatchedToInhibitor2")
	SobGroup_Create("MoversLatchedToInhibitor3")
	SobGroup_Create("InhibitorDroidTargets")
	intelevent_meetTheKeeperISDONE = 0
	intelevent_dreadnaughtAnalysisISDONE = 0
	intelevent_keeperTrappedISDONE = 0
	EventPlaying = 0
	PlayDroidAnalysisONCE = 0
	HW2_SetResearchLevel(8)
	Hyperspace_SetStateForPlayer(0, 0)
	PlayerMothership = "PlayerMothership"
	SobGroup_Create(PlayerMothership)
	Player_FillShipsByType(PlayerMothership, 0, "Hgn_Mothership")
	PlayerCarriers = "PlayerCarriers"
	SobGroup_Create(PlayerCarriers)
	Player_FillShipsByType(PlayerCarriers, 0, "Hgn_Carrier")
	PlayerBattlecruisers = "PlayerBattlecruisers"
	SobGroup_Create(PlayerBattlecruisers)
	Player_FillShipsByType(PlayerBattlecruisers, 0, "Hgn_BattleCruiser")
	PlayerShipyards = "PlayerShipyards"
	SobGroup_Create(PlayerShipyards)
	Player_FillShipsByType(PlayerShipyards, 0, "Hgn_Shipyard")
	SobGroup_EnterHyperSpaceOffMap("Player4Ship")
	SobGroup_SetDisplayedRestrictedHardpoint("PlayerMothership", 0)
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	SetAlliance(1, 3)
	SetAlliance(3, 1)
	Rule_Add("Rule_startDreadnaughtRetrieval")
	Rule_AddInterval("Rule_startInhibitorInstall", 1)
	Rule_Add("Rule_intelevent_intro")
	Rule_AddInterval("Rule_intelevent_meetTheKeeper", 2)
	Rule_AddInterval("Rule_intelevent_raisingTheDreadnaught", 2)
	Rule_AddInterval("Rule_intelevent_mothershipDestroyed", 3)
	Rule_Add("Rule_GetReactiveFleetRatio")
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
	if (ReactiveFleetRatio > 0.75 and ReactiveFleetRatio < 1) then
	Player_GrantResearchOption(1, "KeeperHealthUpgradeSPGAME_LOW")
	Player_GrantResearchOption(1, "AttackDroidHealthUpgradeSPGAME_LOW")
	Player_GrantResearchOption(1, "AttackDroidWeaponUpgradeSPGAME_LOW")
	elseif (ReactiveFleetRatio >= 1 and ReactiveFleetRatio < 1.25) then
	Player_GrantResearchOption(1, "KeeperHealthUpgradeSPGAME_MED")
	Player_GrantResearchOption(1, "AttackDroidHealthUpgradeSPGAME_MED")
	Player_GrantResearchOption(1, "AttackDroidWeaponUpgradeSPGAME_MED")
	elseif (ReactiveFleetRatio >= 1.25) then
	Player_GrantResearchOption(1, "KeeperHealthUpgradeSPGAME_HIGH")
	Player_GrantResearchOption(1, "AttackDroidHealthUpgradeSPGAME_HIGH")
	Player_GrantResearchOption(1, "AttackDroidWeaponUpgradeSPGAME_HIGH")
	end
	Rule_Remove("Rule_GetReactiveFleetRatio")
end

function Rule_testHyperspace1()
	SobGroup_EnterHyperSpaceOffMap("PlayerMothership")
	Rule_Add("Rule_testHyperspace2")
	Rule_Remove("Rule_testHyperspace1")
end

function Rule_testHyperspace2()
	if (SobGroup_AreAllInHyperspace("PlayerMothership") == 1) then
	print("AreAllInHyperspace is working!!!!!!!!")
	Rule_Add("Rule_testHyperspace3")
	Rule_Remove("Rule_testHyperspace2")
	end
end

function Rule_testHyperspace3()
	print("Telling Mothership to come out of hyperspace now")
	SobGroup_ExitHyperSpace("PlayerMothership", "ProbeSphere6")
	Rule_Add("Rule_testHyperspace4")
	Rule_Remove("Rule_testHyperspace3")
end

function Rule_testHyperspace4()
	if (SobGroup_AreAllInRealSpace("PlayerMothership") == 1) then
	print("AreAllInRealSpace is working!!!!!!!!")
	end
end

function Rule_testTimer()
	Rule_AddInterval("Rule_testIntervalRules", 30)
	Rule_Remove("Rule_testTimer")
end

function Rule_testIntervalRules()
	print("this should be 30 seconds late!")
	Rule_Remove("Rule_testIntervalRules")
end

function Rule_checkTimer()
	if (Timer_GetRemaining("TEST_TIMER") == 0) then
	print("timer has ended!")
	Rule_Remove("Rule_checkTimer")
	end
end

function Rule_testStatements()
	if (test_01 == 0) then
	print("first one has come true - removing rule!")
	Rule_Remove("Rule_testStatements")
	elseif (test_02 == 1) then
	print("second part has come true - this is very bad!")
	Rule_Remove("Rule_testStatements")
	end
end

function Rule_intelevent_intro()
	if (Universe_GameTime() >= (g_now_time + 8)) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_intro")
	Rule_Add("Rule_EnableResearchAfterIntelevent")
	Rule_Remove("Rule_intelevent_intro")
	end
end

function Rule_EnableResearchAfterIntelevent()
	if (Event_IsDone("intelevent_intro") == 1) then
	Enable_ResearchOptions();
	Rule_Remove("Rule_EnableResearchAfterIntelevent")
	end
end

function Rule_intelevent_meetTheKeeper()
	Player_FillSobGroupInVolume("NISTriggerShips", 0, "NIS08Sphere")
	if (EventPlaying == 0 and SobGroup_Empty("NISTriggerShips") == 0) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	SetAlliance(0, 2)
	SetAlliance(2, 0)
	Sound_EnterIntelEvent()
	Event_Start("intelevent_meetTheKeeper")
	Rule_Remove("Rule_intelevent_meetTheKeeper")
	else
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_EnableToggle(0)
	SetAlliance(0, 2)
	SetAlliance(2, 0)
	Sound_EnterIntelEvent()
	Event_Start("intelevent_meetTheKeeper")
	Rule_Remove("Rule_intelevent_meetTheKeeper")
	end
	end
end

function Rule_intelevent_NISDone()
	if (NISComplete(g_currentNISPlaying_id) == 1) then
	EventPlaying = 0
	Sensors_EnableToggle(1)
	SobGroup_SetSpeed("Keeper", 0)
	Rule_AddInterval("Rule_intelevent_retrieveTheDreadnaught", 1)
	Rule_AddInterval("Rule_keeperStart", 20)
	Rule_Remove("Rule_intelevent_NISDone")
	end
end

function Rule_turnUIBackOn()
	Camera_SetLetterboxStateNoUI(0, 0)
	Rule_Remove("Rule_turnUIBackOn")
end

function Rule_intelevent_retrieveTheDreadnaught()
	if (EventPlaying == 0) then
	SobGroup_SetSpeed("Keeper", 0.7)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_retrieveTheDreadnaught")
	Rule_Remove("Rule_intelevent_retrieveTheDreadnaught")
	end
end

function Rule_intelevent_hyperspaceDisabled()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_hyperspaceDisabled")
	Rule_Remove("Rule_intelevent_hyperspaceDisabled")
	end
end

function Rule_intelevent_raisingTheDreadnaught()
	if (EventPlaying == 0 and PlayerHasDreadnaught == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_raisingTheDreadnaught")
	Rule_AddInterval("Rule_intelevent_makeKeeperAttackFleet", 60)
	Rule_Add("Rule_intelevent_keeperAttacking")
	Rule_Remove("Rule_intelevent_raisingTheDreadnaught")
	end
end

function Rule_intelevent_raisingTheDreadnaughtREPEAT()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_raisingTheDreadnaught")
	Rule_Remove("Rule_intelevent_raisingTheDreadnaughtREPEAT")
	end
end

function Rule_intelevent_droidAnalysis()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_droidAnalysis")
	Rule_Remove("Rule_intelevent_droidAnalysis")
	end
end

function Rule_intelevent_makeKeeperAttackFleet()
	KeeperAttackFleet = 1
	Rule_Remove("Rule_intelevent_makeKeeperAttackFleet")
end

function Rule_intelevent_keeperAttacking()
	if (EventPlaying == 0 and KeeperIsAttacking == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_keeperAttacking")
	Rule_Remove("Rule_intelevent_keeperAttacking")
	end
end

function Rule_intelevent_dreadnaughtMoverLost()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_dreadnaughtMoverLost")
	Rule_Remove("Rule_intelevent_dreadnaughtMoverLost")
	end
end

function Rule_intelevent_dreadnaughtDocked()
	if (EventPlaying == 0 and DreadnaughtDockedWithMS == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_dreadnaughtDocked")
	Rule_AddInterval("Rule_intelevent_dreadnaughtAnalysis", 60)
	Rule_Remove("Rule_intelevent_dreadnaughtDocked")
	end
end

function Rule_intelevent_dreadnaughtAnalysis()
	if (EventPlaying == 0 and intelevent_dreadnaughtDockedISDONE == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_dreadnaughtAnalysis")
	Rule_Remove("Rule_intelevent_dreadnaughtAnalysis")
	end
end

function Rule_intelevent_cannotDefeatKeeper()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_cannotDefeatKeeper")
	Rule_Remove("Rule_intelevent_cannotDefeatKeeper")
	end
end

PlayerShipsInVolume = {}
ProbesInSphere = {}
ProbeInPosition = {0, 0, 0, 0, 0, 0}

function Rule_WatchForProbes()
	volNumber = (volNumber + 1)
	if (RemoveWatchForProbes == 1) then
	Rule_Remove("Rule_WatchForProbes")
	elseif (ProbeInPosition[volNumber] == 0) then
	Player_FillSobGroupInVolume("tempSobGroupOne", 0, "ProbeSphere"..volNumber)
	if (SobGroup_Empty("tempSobGroupOne") == 0) then
	print("Found some player ships in probe volume: "..volNumber)
	SobGroup_FillShipsByType("tempSobGroupTwo", "tempSobGroupOne", "Hgn_Probe")
	if (SobGroup_Empty("tempSobGroupTwo") == 0) then
	if (SobGroup_GetActualSpeed("tempSobGroupTwo") < 1) then
	print("Found STOPPED probes in probe volume: "..volNumber)
	ProbeInPosition[volNumber] = 1
	end
	end
	end
	if (volNumber == 6) then
	volNumber = 0
	end
	Rule_AddInterval("Rule_WatchForProbes", 0.25)
	Rule_Remove("Rule_WatchForProbes")
	elseif (volNumber == 6) then
	volNumber = 0
	Rule_AddInterval("Rule_WatchForProbes", 0.25)
	Rule_Remove("Rule_WatchForProbes")
	end
end

ProbeInPositionONCE = {0, 0, 0, 0, 0, 0}

function Rule_intelevent_probeInPosition()
	for i = 1, 6 do
	if (EventPlaying == 0 and ProbeInPosition[i] == 1 and ProbeInPositionONCE[i] == 0) then
	if (RemoveProbePingONCE1 == 0 and ProbeInPosition[1] == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_scansNegative")
	print("Removing ping on location 1!")
	RemoveProbePingONCE1 = 1
	Ping_Remove(ping_probeLocation_id1)
	end
	if (RemoveProbePingONCE2 == 0 and ProbeInPosition[2] == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_noDevicesFound")
	print("Removing ping on location 2!")
	RemoveProbePingONCE2 = 1
	Ping_Remove(ping_probeLocation_id2)
	end
	if (RemoveProbePingONCE3 == 0 and ProbeInPosition[3] == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_scanResultsNegative")
	print("Removing ping on location 3!")
	RemoveProbePingONCE3 = 1
	Ping_Remove(ping_probeLocation_id3)
	end
	if (RemoveProbePingONCE4 == 0 and ProbeInPosition[4] == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_scansNegative")
	print("Removing ping on location 4!")
	RemoveProbePingONCE4 = 1
	Ping_Remove(ping_probeLocation_id4)
	end
	if (RemoveProbePingONCE5 == 0 and ProbeInPosition[5] == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_noDevicesFound")
	print("Removing ping on location 5!")
	RemoveProbePingONCE5 = 1
	Ping_Remove(ping_probeLocation_id5)
	end
	if (RemoveProbePingONCE6 == 0 and ProbeInPosition[6] == 1) then
	print("Removing ping on location 6!")
	RemoveProbePingONCE6 = 1
	Ping_Remove(ping_probeLocation_id6)
	end
	ProbeInPositionONCE[i] = 1
	end
	end
end

function Rule_intelevent_devicesLocated()
	if (EventPlaying == 0 and RemoveProbePingONCE6 == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_devicesLocated")
	Ping_Remove(ping_probeLocation_id1)
	Ping_Remove(ping_probeLocation_id2)
	Ping_Remove(ping_probeLocation_id3)
	Ping_Remove(ping_probeLocation_id4)
	Ping_Remove(ping_probeLocation_id5)
	Ping_Remove(ping_probeLocation_id6)
	RemoveWatchForProbes = 1
	Rule_Remove("Rule_WatchForProbes")
	Rule_Remove("Rule_intelevent_probeInPosition")
	Rule_Remove("Rule_intelevent_devicesLocated")
	print("Despawning fake inhibitors!")
	SobGroup_Despawn("FakeInhibitors")
	print("Spawning real inhibitors!")
	SobGroup_Spawn("HSInhibitor1", "SpawnSphere1")
	SobGroup_Spawn("HSInhibitor2", "SpawnSphere2")
	SobGroup_Spawn("HSInhibitor3", "SpawnSphere3")
	Rule_AddInterval("Rule_setInhibitorsToAllowPassiveActions", 5)
	Rule_AddInterval("Rule_intelevent_installInhibitors", 2)
	end
end

function Rule_setInhibitorsToAllowPassiveActions()
	print("telling inhibitors to allow passive actions always!!!! please work!")
	SobGroup_AllowPassiveActionsAlways("HSInhibitor1", 1)
	SobGroup_AllowPassiveActionsAlways("HSInhibitor2", 1)
	SobGroup_AllowPassiveActionsAlways("HSInhibitor3", 1)
	Rule_Remove("Rule_setInhibitorsToAllowPassiveActions")
end

function Rule_intelevent_installInhibitors()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_installInhibitors")
	Rule_Add("Rule_watchForMoverDockedToInhibitor1")
	Rule_Add("Rule_watchForMoverDockedToInhibitor2")
	Rule_Add("Rule_watchForMoverDockedToInhibitor3")
	Rule_Add("Rule_intelevent_distortionFieldActive")
	Rule_AddInterval("Rule_intelevent_inhibitorsEnRoute", 3)
	Rule_AddInterval("Rule_intelevent_inhibitorsInstalled", 2.5)
	Rule_AddInterval("Rule_watchForTOTALInhibitorsInstalled", 2)
	Rule_Remove("Rule_intelevent_installInhibitors")
	end
end

function Rule_intelevent_inhibitorsEnRoute()
	if (EventPlaying == 0 and Inhibitor1EnRoute == 1 and Inhibitor1EnRouteONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_inhibitor1EnRoute")
	Inhibitor1EnRouteONCE = 1
	end
	if (EventPlaying == 0 and Inhibitor2EnRoute == 1 and Inhibitor2EnRouteONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_inhibitor2EnRoute")
	Inhibitor2EnRouteONCE = 1
	end
	if (EventPlaying == 0 and Inhibitor3EnRoute == 1 and Inhibitor3EnRouteONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_inhibitor3EnRoute")
	Inhibitor3EnRouteONCE = 1
	end
	if (Inhibitor1EnRoute == 1 and Inhibitor2EnRoute == 1 and Inhibitor3EnRoute == 1) then
	Rule_Remove("Rule_intelevent_inhibitorsEnRoute")
	end
end

function Rule_watchForTOTALInhibitorsInstalled()
	if (TOTALInhibitorsInstalled == 1) then
	PlayInstalledEvent1 = 1
	elseif (TOTALInhibitorsInstalled == 2) then
	PlayInstalledEvent2 = 1
	elseif (TOTALInhibitorsInstalled == 3) then
	PlayInstalledEvent3 = 1
	Rule_Remove("Rule_watchForTOTALInhibitorsInstalled")
	end
end

function Rule_FocusOnFirstInstalledInhibitor()
	if (Inhibitor1Installed == 1) then
	Camera_FocusSobGroup("HSInhibitor1", 1, 500, 1)
	elseif (Inhibitor2Installed == 1) then
	Camera_FocusSobGroup("HSInhibitor2", 1, 500, 1)
	elseif (Inhibitor3Installed == 1) then
	Camera_FocusSobGroup("HSInhibitor3", 1, 500, 1)
	end
	Rule_Remove("Rule_FocusOnFirstInstalledInhibitor")
end

function Rule_intelevent_inhibitorsInstalled()
	if (EventPlaying == 0 and PlayInstalledEvent1 == 1 and Inhibitor1InstalledONCE == 0) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_inhibitor1Installed")
	Inhibitor1InstalledONCE = 1
	else
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_inhibitor1Installed")
	Inhibitor1InstalledONCE = 1
	end
	end
	if (EventPlaying == 0 and PlayInstalledEvent2 == 1 and Inhibitor2InstalledONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_inhibitor2Installed")
	Inhibitor2InstalledONCE = 1
	end
	if (EventPlaying == 0 and PlayInstalledEvent3 == 1 and Inhibitor3InstalledONCE == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_inhibitor3Installed")
	Inhibitor3InstalledONCE = 1
	end
	if (Inhibitor1InstalledONCE == 1 and Inhibitor2InstalledONCE == 1 and Inhibitor3InstalledONCE == 1) then
	Rule_Remove("Rule_intelevent_inhibitorsInstalled")
	end
end

function Rule_intelevent_distortionFieldActive()
	if (TOTALInhibitorsInstalled == 3) then
	Rule_AddInterval("Rule_intelevent_distortionFieldActive_playEvent", 9)
	Rule_AddInterval("Rule_intelevent_makeKeeperGetTrapped", 11)
	Rule_AddInterval("Rule_intelevent_keeperTrapped", 1)
	Rule_Remove("Rule_intelevent_distortionFieldActive")
	end
end

function Rule_intelevent_makeKeeperGetTrapped()
	print("Telling Keeper to fall into trap!!!!!")
	KeeperGoGetTrapped = 1
	Rule_Remove("Rule_intelevent_makeKeeperGetTrapped")
end

function Rule_intelevent_keeperTrapped()
	if (EventPlaying == 0 and KeeperIsInTrap == 1) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_keeperTrapped")
	Rule_Remove("Rule_intelevent_keeperTrapped")
	else
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_EnableToggle(0)
	Event_Start("intelevent_keeperTrapped")
	Rule_Remove("Rule_intelevent_keeperTrapped")
	end
	end
end

function Rule_intelevent_oneMinuteToSelfDestruct()
	if (EventPlaying == 0 and Timer_GetRemaining(0) < 60) then
	Event_Start("intelevent_oneMinuteToSelfDestruct")
	Rule_Add("Rule_intelevent_thirtySecondsToSelfDestruct")
	Rule_Remove("Rule_intelevent_oneMinuteToSelfDestruct")
	end
end

function Rule_intelevent_thirtySecondsToSelfDestruct()
	if (EventPlaying == 0 and Timer_GetRemaining(0) < 30) then
	Event_Start("intelevent_thirtySecondsToSelfDestruct")
	Rule_Remove("Rule_intelevent_thirtySecondsToSelfDestruct")
	end
end

function Rule_intelevent_distortionFieldActive_playEvent()
	if (EventPlaying == 0) then
	Event_Start("intelevent_distortionFieldActive")
	Rule_Remove("Rule_intelevent_distortionFieldActive_playEvent")
	end
end

function Rule_intelevent_letsGo()
	if (EventPlaying == 0) then
	if (intelevent_dreadnaughtAnalysisISDONE == 1) then
	if (intelevent_keeperTrappedISDONE == 1) then
	print("LET'S GET OUT OF HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_letsGo")
	Rule_Remove("Rule_intelevent_letsGo")
	end
	end
	end
end

function Rule_intelevent_mothershipDestroyed()
	if (SobGroup_Count("PlayerMothership") == 0) then
	Event_Start("intelevent_mothershipDestroyed")
	Rule_Remove("Rule_intelevent_mothershipDestroyed")
	end
end

function Rule_playeffect_hyperspaceTrap()
	Rule_AddInterval("Rule_playeffect_hyperspaceTrap1", 2)
	Rule_Remove("Rule_playeffect_hyperspaceTrap")
end

function Rule_playeffect_hyperspaceTrap1()
	KeeperTrapFXStarted = 1
	FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "EffectPoint02", "EffectPoint01", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring", "EffectPoint02", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring_loop", "EffectPoint02", 10)
	FX_StartEvent("InhibitorChunk2", "Activate")
	if (playEffect2ONCE == 0) then
	Rule_AddInterval("Rule_playeffect_hyperspaceTrap2", 1.5)
	playEffect2ONCE = 1
	end
	Rule_Remove("Rule_playeffect_hyperspaceTrap1")
end

function Rule_playeffect_hyperspaceTrap2()
	FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "EffectPoint03", "EffectPoint01", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring", "EffectPoint03", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring_loop", "EffectPoint03", 10)
	FX_StartEvent("InhibitorChunk1", "Activate")
	if (playEffect3ONCE == 0) then
	Rule_AddInterval("Rule_playeffect_hyperspaceTrap3", 1.5)
	playEffect3ONCE = 1
	end
	Rule_Remove("Rule_playeffect_hyperspaceTrap2")
end

function Rule_playeffect_hyperspaceTrap3()
	FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "EffectPoint04", "EffectPoint01", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring", "EffectPoint04", 10)
	FX_PlayEffect("pro_tech_beam_burn_ring_loop", "EffectPoint04", 10)
	FX_PlayEffect("pro_tech_trap_combo", "EffectPoint01", 10)
	FX_StartEvent("InhibitorChunk3", "Activate")
	FX_StartEvent("InhibitorChunk2", "Activate")
	FX_StartEvent("InhibitorChunk1", "Activate")
	Rule_Remove("Rule_playeffect_hyperspaceTrap3")
end

function Rule_playeffect_inhibitor1Attached()
	FX_StartEvent("HSInhibitor1", "Activate")
	FX_StartEvent("InhibitorChunk1", "Activate")
	FX_StartEvent("HSInhibitor1", "Pulse")
	FX_StartEvent("InhibitorChunk1", "Pulse")
	Rule_Remove("Rule_playeffect_inhibitor1Attached")
end

function Rule_playeffect_inhibitor2Attached()
	FX_StartEvent("HSInhibitor2", "Activate")
	FX_StartEvent("InhibitorChunk2", "Activate")
	FX_StartEvent("HSInhibitor2", "Pulse")
	FX_StartEvent("InhibitorChunk2", "Pulse")
	Rule_Remove("Rule_playeffect_inhibitor2Attached")
end

function Rule_playeffect_inhibitor3Attached()
	FX_StartEvent("HSInhibitor3", "Activate")
	FX_StartEvent("InhibitorChunk3", "Activate")
	FX_StartEvent("HSInhibitor3", "Pulse")
	FX_StartEvent("InhibitorChunk3", "Pulse")
	Rule_Remove("Rule_playeffect_inhibitor3Attached")
end

function Rule_playeffect_dreadnaughtLaunch()
	print("Trying to play Dreadnaught launch fx!!!!!!!!!!!!")
	FX_StartEvent("Berth", "Launch")
	Rule_Remove("Rule_playeffect_dreadnaughtLaunch")
end

function Rule_keeperStart()
	SobGroup_Create("KeeperTarget")
	SobGroup_Stop(1, "Keeper")
	SobGroup_SetSpeed("Keeper", 1)
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	Rule_AddInterval("Rule_buildDreadnaughtAttackDroids", 1)
	Rule_Remove("Rule_keeperStart")
end

function Rule_buildDreadnaughtAttackDroids()
	if (SobGroup_AreAllInRealSpace("Keeper") == 1) then
	print("SCAR thinks the Keeper is out of hyperspace now!")
	Rule_Add("Rule_stopKeeper")
	if (CountDroidsExistingONCE == 0) then
	CountDroidsExistingONCE = 1
	numDreadnaughtDroidsBuilt = SobGroup_Count("AttackDroid_Dreadnaught")
	end
	if (numDreadnaughtDroidsBuilt > 5) then
	print("Keeper has determined there are enough droids - getting out of here")
	Rule_AddInterval("Rule_keeperHide", 5)
	Rule_Remove("Rule_buildDreadnaughtAttackDroids")
	else
	AttackDroid_DreadnaughtFreshlyBuilt = SobGroup_CreateShip("Keeper", "Kpr_AttackDroid")
	print("Keeper BUILDING ONE DROID in Phase 1")
	Rule_AddInterval("Rule_attackDroidDreadnaughtSobGroupCleanup", 2)
	numDreadnaughtDroidsBuilt = (numDreadnaughtDroidsBuilt + 1)
	Rule_AddInterval("Rule_buildDreadnaughtAttackDroids", 3)
	Rule_Remove("Rule_buildDreadnaughtAttackDroids")
	end
	end
end

function Rule_keeperHide()
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	print("Keeper HYPERSPACING out - going into HIDING STATE!")
	print("Locking Keeper's health!!!!!")
	Rule_AddInterval("Rule_keeperWatchDreadnaught", 3)
	Rule_Remove("Rule_keeperHide")
end

function Rule_keeperLockHealth()
	SobGroup_SetHealth("Keeper", LockedKeeperHealth)
end

function Rule_keeperLockHealthRemove()
	print("removing lock on keeper's health!")
	print("setting Keeper's health to 100 percent!")
	SobGroup_SetHealth("Keeper", 1)
	Rule_Remove("Rule_keeperLockHealth")
	Rule_Remove("Rule_keeperLockHealthRemove")
end

function Rule_keeperWatchDreadnaught()
	if (SobGroup_AreAllInHyperspace("Keeper") == 1) then
	print("SCAR thinks the Keeper is in hyperspace now!")
	FX_StopEvent("Keeper", "Phase_loop")
	if (KeeperHealthLocked == 1) then
	Rule_Remove("Rule_keeperLockHealth")
	SobGroup_SetHealth("Keeper", 1)
	KeeperHealthLocked = 0
	end
	if (KeeperAttackFleet == 1) then
	SobGroup_Clear("KeeperTarget")
	Player_FillShipsByType("tempSobGroupOne", 0, "Hgn_Destroyer")
	if (SobGroup_Empty("tempSobGroupOne") ~= 1) then
	print("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack DESTROYERS!")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroupOne")
	Rule_Add("Rule_keeperAttack")
	Rule_Remove("Rule_keeperWatchDreadnaught")
	else
	Player_FillShipsByType("tempSobGroupOne", 0, "Vgr_Destroyer")
	if (SobGroup_Empty("tempSobGroupOne") ~= 1) then
	print("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack CAPTURED DESTROYERS!")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroupOne")
	Rule_Add("Rule_keeperAttack")
	Rule_Remove("Rule_keeperWatchDreadnaught")
	else
	Player_FillShipsByType("tempSobGroupOne", 0, "Hgn_Carrier")
	if (SobGroup_Empty("tempSobGroupOne") ~= 1) then
	print("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack CARRIERS!")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroupOne")
	Rule_Add("Rule_keeperAttack")
	Rule_Remove("Rule_keeperWatchDreadnaught")
	else
	Player_FillShipsByType("tempSobGroupOne", 0, "Hgn_BattleCruiser")
	if (SobGroup_Empty("tempSobGroupOne") ~= 1) then
	print("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack BATTLECRUISERS!")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroupOne")
	Rule_Add("Rule_keeperAttack")
	Rule_Remove("Rule_keeperWatchDreadnaught")
	else
	Player_FillShipsByType("tempSobGroupOne", 0, "Hgn_Shipyard")
	if (SobGroup_Empty("tempSobGroupOne") ~= 1) then
	print("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack SHIPYARDS!")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroupOne")
	Rule_Add("Rule_keeperAttack")
	Rule_Remove("Rule_keeperWatchDreadnaught")
	else
	print("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack the MOTHERSHIP!")
	SobGroup_SobGroupAdd("KeeperTarget", "PlayerMothership")
	Rule_Add("Rule_keeperAttack")
	Rule_Remove("Rule_keeperWatchDreadnaught")
	end
	end
	end
	end
	end
	end
	elseif (SobGroup_Count("AttackDroid_Dreadnaught") < 5) then
	print("keeperWatchDreadnaught: not enough droids, going to build some")
	CountDroidsExistingONCE = 0
	Rule_AddInterval("Rule_keeperSpawnDroidsAtDreadnaught", 1)
	Rule_Remove("Rule_keeperWatchDreadnaught")
	else
	Rule_Remove("Rule_keeperWatchDreadnaught")
	Rule_AddInterval("Rule_keeperWatchDreadnaught", 5)
	end
end

function Rule_keeperRetreatPhase1()
	print("Keeper EXITING HYPERSPACE at the HEAL POINT! (Phase 1)")
	local randomPointIndex = (RandomIntMax(2) + 1)
	SobGroup_ExitHyperSpace("Keeper", "KeeperRetreat0"..randomPointIndex)
	Rule_AddInterval("Rule_keeperHealPhase1", 20)
	Rule_Remove("Rule_keeperRetreatPhase1")
end

function Rule_keeperHealPhase1()
	print("Keeper HEALING himself! (Phase 1)")
	CurrentKeeperHealth = SobGroup_HealthPercentage("Keeper")
	HealedKeeperHealth = (CurrentKeeperHealth + 0.01)
	SobGroup_SetHealth("Keeper", HealedKeeperHealth)
	Rule_AddInterval("Rule_keeperCheckHealthPhase1", 0.5)
	Rule_Remove("Rule_keeperHealPhase1")
end

function Rule_keeperCheckHealthPhase1()
	print("Keeper CHECKING his health! (Phase 1)")
	if (SobGroup_HealthPercentage("Keeper") > 0.99) then
	Rule_AddInterval("Rule_keeperWatchDreadnaught", 20)
	Rule_Remove("Rule_keeperCheckHealthPhase1")
	else
	Rule_Add("Rule_keeperHealPhase1")
	Rule_Remove("Rule_keeperCheckHealthPhase1")
	end
end

function Rule_keeperSpawnDroidsAtDreadnaught()
	SobGroup_ExitHyperSpaceSobGroup("Keeper", "Dreadnaught", 3800)
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	print("Locking Keeper's health!!!!!")
	Rule_Add("Rule_buildDreadnaughtAttackDroids")
	Rule_Remove("Rule_keeperSpawnDroidsAtDreadnaught")
end

function Rule_stopKeeper()
	SobGroup_SetTactics("Keeper", PassiveTactics)
	SobGroup_Stop(1, "Keeper")
	Rule_Remove("Rule_stopKeeper")
end

function Rule_keeperSpawnDroidsAtDreadnaughtPhase2()
	if (SobGroup_AreAllInHyperspace("Keeper") == 1) then
	FX_StopEvent("Keeper", "Phase_loop")
	print("SCAR thinks the Keeper is in hyperspace now!")
	SobGroup_ExitHyperSpaceSobGroup("Keeper", "Dreadnaught", 2800)
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	print("Locking Keeper's health!!!!!")
	Rule_Add("Rule_buildDreadnaughtAttackDroidsPhase2")
	Rule_Remove("Rule_keeperSpawnDroidsAtDreadnaughtPhase2")
	end
end

function Rule_buildDreadnaughtAttackDroidsPhase2()
	if (SobGroup_AreAllInRealSpace("Keeper") == 1) then
	print("SCAR thinks the Keeper is out of hyperspace now!")
	Rule_Add("Rule_stopKeeper")
	if (CountDroidsExistingONCE == 0) then
	CountDroidsExistingONCE = 1
	numDreadnaughtDroidsBuilt = SobGroup_Count("AttackDroid_Dreadnaught")
	end
	if (numDreadnaughtDroidsBuilt > 5) then
	print("Keeper has determined there are enough droids - getting out of here")
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	Rule_Add("Rule_keeperDecide")
	Rule_Remove("Rule_buildDreadnaughtAttackDroidsPhase2")
	else
	AttackDroid_DreadnaughtFreshlyBuilt = SobGroup_CreateShip("Keeper", "Kpr_AttackDroid")
	Rule_AddInterval("Rule_attackDroidDreadnaughtSobGroupCleanup", 2)
	numDreadnaughtDroidsBuilt = (numDreadnaughtDroidsBuilt + 1)
	Rule_AddInterval("Rule_buildDreadnaughtAttackDroidsPhase2", 3)
	Rule_Remove("Rule_buildDreadnaughtAttackDroidsPhase2")
	end
	end
end

function Rule_attackDroidDreadnaughtSobGroupCleanup()
	SobGroup_SobGroupAdd("AttackDroid_Dreadnaught", AttackDroid_DreadnaughtFreshlyBuilt)
	SobGroup_SetTactics("AttackDroid_Dreadnaught", AggressiveTactics)
	Rule_AddInterval("Rule_attackDroidPatrol", 1)
	Rule_AddInterval("Rule_attackDroidDreadnaughtWatchForStolenDreadnaught", 3)
	DroidCount_Dreadnaught = SobGroup_Count("AttackDroid_Dreadnaught")
	print("please"..DroidCount_Dreadnaught)
	Rule_Remove("Rule_attackDroidDreadnaughtSobGroupCleanup")
end

function Rule_attackDroidPatrol()
	SobGroup_FollowPath("AttackDroid_Dreadnaught", "DroidPatrolPath", 1, 1, 1)
	Rule_Remove("Rule_attackDroidPatrol")
end

function Rule_attackDroidDreadnaughtWatchForStolenDreadnaught()
	if (PlayerHasDreadnaught == 1) then
	Rule_Add("Rule_attackDroidDreadnaughtAttackMovers")
	Rule_Remove("Rule_attackDroidDreadnaughtWatchForStolenDreadnaught")
	end
end

function Rule_attackDroidDreadnaughtAttackMovers()
	SobGroup_Attack(1, "AttackDroid_Dreadnaught", "MoversLatchedToDreadnaught")
	if (PlayDroidAnalysisONCE == 0) then
	Rule_AddInterval("Rule_intelevent_droidAnalysis", 3)
	PlayDroidAnalysisONCE = 1
	end
	Rule_Remove("Rule_attackDroidDreadnaughtAttackMovers")
end

function Rule_keeperSpawnDroidsAtInhibitorTrap()
	if (SobGroup_AreAllInHyperspace("Keeper") == 1) then
	FX_StopEvent("Keeper", "Phase_loop")
	print("SCAR thinks the Keeper is in hyperspace!")
	SobGroup_ExitHyperSpace("Keeper", "EffectPoint01")
	print("telling Keeper to exit hyperspace at inhibitor trap!")
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	print("Locking Keeper's health!!!!!")
	Rule_Add("Rule_buildInhibitorAttackDroids")
	Rule_Remove("Rule_keeperSpawnDroidsAtInhibitorTrap")
	end
end

function Rule_buildInhibitorAttackDroids()
	if (SobGroup_AreAllInRealSpace("Keeper") == 1) then
	print("SCAR thinks the Keeper is out of hyperspace!")
	if (numInhibitorDroidsBuilt > 7) then
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	Rule_Add("Rule_keeperDecide")
	print("Keeper has determined there are enough inhibitor droids, going into KeeperDecide!")
	Rule_Remove("Rule_buildInhibitorAttackDroids")
	else
	AttackDroid_InhibitorFreshlyBuilt = SobGroup_CreateShip("Keeper", "Kpr_AttackDroid")
	Rule_AddInterval("Rule_attackDroidInhibitorSobGroupCleanup", 2)
	numInhibitorDroidsBuilt = (numInhibitorDroidsBuilt + 1)
	Rule_AddInterval("Rule_buildInhibitorAttackDroids", 3)
	Rule_Remove("Rule_buildInhibitorAttackDroids")
	end
	end
end

function Rule_attackDroidsGuardInhibitorSphere()
	SobGroup_Stop(1, AttackDroid_InhibitorFreshlyBuilt)
	SobGroup_SetTactics(AttackDroid_InhibitorFreshlyBuilt, AggressiveTactics)
	Rule_Remove("Rule_attackDroidsGuardInhibitorSphere")
end

function Rule_attackDroidInhibitorSobGroupCleanup()
	SobGroup_SobGroupAdd("AttackDroid_Inhibitor", AttackDroid_InhibitorFreshlyBuilt)
	print("Inhibitor group has this many ships:"..DroidCount_Inhibitor)
	SobGroup_SetTactics("AttackDroid_Inhibitor", AggressiveTactics)
	Rule_AddInterval("Rule_inhibitorAttackDroidPatrol", 1)
	Rule_AddInterval("Rule_inhibitorAttackDroidWatchForMovers", 5)
	Rule_Remove("Rule_attackDroidInhibitorSobGroupCleanup")
end

function Rule_inhibitorAttackDroidPatrol()
	SobGroup_FollowPath("AttackDroid_Inhibitor", "InhibitorDroidPatrolPath", 1, 1, 1)
	Rule_Remove("Rule_inhibitorAttackDroidPatrol")
end

function Rule_inhibitorAttackDroidWatchForMovers()
	SobGroup_SobGroupAdd("InhibitorDroidTargets", "MoversLatchedToInhibitor1")
	SobGroup_SobGroupAdd("InhibitorDroidTargets", "MoversLatchedToInhibitor2")
	SobGroup_SobGroupAdd("InhibitorDroidTargets", "MoversLatchedToInhibitor3")
	Player_FillSobGroupInVolume("tempSobGroupOne", 0, "InhibitorTrapSphere")
	if (SobGroup_Empty("InhibitorDroidTargets") ~= 1) then
	SobGroup_Attack(1, "AttackDroid_Inhibitor", "InhibitorDroidTargets")
	Rule_Add("Rule_attackDroidInhibitorAttackMoverWatch")
	Rule_Remove("Rule_inhibitorAttackDroidWatchForMovers")
	elseif (SobGroup_Empty("tempSobGroupOne") == 0) then
	SobGroup_FillShipsByType("tempSobGroupTwo", "tempSobGroupOne", "Kpr_Mover")
	if (SobGroup_Empty("tempSobGroupTwo") == 0) then
	SobGroup_Attack(1, "AttackDroid_Inhibitor", "tempSobGroupTwo")
	Rule_Add("Rule_attackDroidInhibitorAttackMoverWatch")
	Rule_Remove("Rule_inhibitorAttackDroidWatchForMovers")
	else
	SobGroup_Attack(1, "AttackDroid_Inhibitor", "tempSobGroupOne")
	Rule_Add("Rule_attackDroidInhibitorAttackRegularWatch")
	Rule_Remove("Rule_inhibitorAttackDroidWatchForMovers")
	end
	end
end

function Rule_attackDroidInhibitorAttackMoverWatch()
	if (HW2_IsRunTimeSobGroupEmpty(MoversNearInhibitorTrap) == 1) then
	Rule_Add("Rule_inhibitorAttackDroidPatrol")
	Rule_Remove("Rule_attackDroidInhibitorAttackMoverWatch")
	end
end

function Rule_attackDroidInhibitorAttackRegularWatch()
	if (HW2_IsRunTimeSobGroupEmpty(PlayerShipsNearInhibitorTrap) == 1) then
	Rule_Add("Rule_inhibitorAttackDroidPatrol")
	Rule_Remove("Rule_attackDroidInhibitorAttackRegularWatch")
	end
end

function Rule_keeperDecide()
	if (SobGroup_AreAllInHyperspace("Keeper") == 1) then
	print("SCAR thinks the Keeper is in hyperspace now!")
	FX_StopEvent("Keeper", "Phase_loop")
	if (KeeperHealthLocked == 1) then
	Rule_Remove("Rule_keeperLockHealth")
	SobGroup_SetHealth("Keeper", 1)
	KeeperHealthLocked = 0
	end
	print("Keeper in DECISION state and should be in hyperspace!")
	SobGroup_Clear("KeeperTarget")
	Player_FillSobGroupInVolume("tempSobGroupOne", 0, "InhibitorTrapSphere")
	if (KeeperGoGetTrapped == 1) then
	print("Keeper going to get trapped!!!")
	Rule_AddInterval("Rule_keeperFallIntoTrap2", 1)
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	Rule_Remove("Rule_keeperDecide")
	else
	Player_FillShipsByType("tempSobGroup", 0, "Hgn_Destroyer")
	if (DesireToAttackFleet > 2 or Timer_GetRemaining("KeeperLastAttackTimer") < 1 and SobGroup_Empty("tempSobGroup") ~= 1) then
	print("Keeper has chosen to attack DESTROYERS!")
	Timer_End("KeeperLastAttackTimer")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroup")
	DesireToAttackFleet = 0
	Rule_AddInterval("Rule_keeperAttack", 1)
	Rule_Remove("Rule_keeperDecide")
	else
	Player_FillShipsByType("tempSobGroup", 0, "Vgr_Destroyer")
	if (DesireToAttackFleet > 2 or Timer_GetRemaining("KeeperLastAttackTimer") < 1 and SobGroup_Empty("tempSobGroup") ~= 1) then
	print("Keeper has chosen to attack CAPTURED DESTROYERS!")
	Timer_End("KeeperLastAttackTimer")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroup")
	DesireToAttackFleet = 0
	Rule_AddInterval("Rule_keeperAttack", 1)
	Rule_Remove("Rule_keeperDecide")
	else
	Player_FillShipsByType("tempSobGroup", 0, "Hgn_Carrier")
	if (DesireToAttackFleet > 2 or Timer_GetRemaining("KeeperLastAttackTimer") < 1 and SobGroup_Empty("tempSobGroup") ~= 1) then
	print("Keeper has chosen to attack CARRIERS!")
	Timer_End("KeeperLastAttackTimer")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroup")
	DesireToAttackFleet = 0
	Rule_AddInterval("Rule_keeperAttack", 1)
	Rule_Remove("Rule_keeperDecide")
	else
	Player_FillShipsByType("tempSobGroup", 0, "Hgn_BattleCruiser")
	if (DesireToAttackFleet > 2 or Timer_GetRemaining("KeeperLastAttackTimer") < 1 and SobGroup_Empty("tempSobGroup") ~= 1) then
	print("Keeper has chosen to attack BATTLECRUISERS!")
	Timer_End("KeeperLastAttackTimer")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroup")
	DesireToAttackFleet = 0
	Rule_AddInterval("Rule_keeperAttack", 1)
	Rule_Remove("Rule_keeperDecide")
	else
	Player_FillShipsByType("tempSobGroup", 0, "Hgn_Shipyard")
	if (DesireToAttackFleet > 2 or Timer_GetRemaining("KeeperLastAttackTimer") < 1 and SobGroup_Empty("tempSobGroup") ~= 1) then
	print("Keeper has chosen to attack SHIPYARDS!")
	Timer_End("KeeperLastAttackTimer")
	SobGroup_SobGroupAdd("KeeperTarget", "tempSobGroup")
	DesireToAttackFleet = 0
	Rule_AddInterval("Rule_keeperAttack", 1)
	Rule_Remove("Rule_keeperDecide")
	elseif (DesireToAttackFleet > 2 or Timer_GetRemaining("KeeperLastAttackTimer") < 1) then
	print("Keeper has chosen to attack the MOTHERSHIP!")
	Timer_End("KeeperLastAttackTimer")
	SobGroup_SobGroupAdd("KeeperTarget", "PlayerMothership")
	DesireToAttackFleet = 0
	Rule_AddInterval("Rule_keeperAttack", 1)
	Rule_Remove("Rule_keeperDecide")
	elseif (CreateFirstInhibitorDroids == 0 and InhibitorTrapHasStarted == 1 and SobGroup_Empty("tempSobGroupOne") ~= 1) then
	print("Keeper Decide is going to build the first set of INHIBITOR droids!")
	CreateFirstInhibitorDroids = 1
	DesireToAttackFleet = (DesireToAttackFleet + 1)
	Rule_AddInterval("Rule_keeperSpawnDroidsAtInhibitorTrap", 1)
	Rule_Remove("Rule_keeperDecide")
	elseif (CreateFirstInhibitorDroids == 1 and SobGroup_Count("AttackDroid_Inhibitor") < 8) then
	print("Keeper Decide has determined there aren't enough INHIBITOR droids.. going to build some")
	numInhibitorDroidsBuilt = SobGroup_Count("AttackDroid_Inhibitor")
	DesireToAttackFleet = (DesireToAttackFleet + 1)
	Rule_AddInterval("Rule_keeperSpawnDroidsAtInhibitorTrap", 1)
	Rule_Remove("Rule_keeperDecide")
	elseif (SobGroup_Count("AttackDroid_Dreadnaught") < 5 and DreadnaughtInProximityOfMS == 0) then
	print("Keeper Decide has determined there aren't enough Dreadnaught droids.. going to build some")
	CountDroidsExistingONCE = 0
	DesireToAttackFleet = (DesireToAttackFleet + 1)
	Rule_AddInterval("Rule_keeperSpawnDroidsAtDreadnaughtPhase2", 1)
	Rule_Remove("Rule_keeperDecide")
	else
	Rule_Remove("Rule_keeperDecide")
	Rule_AddInterval("Rule_keeperDecide", 5)
	end
	end
	end
	end
	end
	end
	end
end

function Rule_keeperAttack()
	print("Keeper HYPERSPACING IN and GETTING READY TO ATTACK TARGET!")
	if (KeeperIsAttackingONCE == 0) then
	KeeperIsAttackingONCE = 1
	SobGroup_ExitHyperSpaceSobGroup("Keeper", "KeeperTarget", 2300)
	FX_StartEvent("Keeper", "Phase_loop")
	Rule_Add("Rule_keeperAttackTheTargetFIRSTTIME")
	Rule_Remove("Rule_keeperAttack")
	else
	SobGroup_ExitHyperSpaceSobGroup("Keeper", "KeeperTarget", 2300)
	Rule_Add("Rule_keeperAttackTheTarget")
	Rule_Remove("Rule_keeperAttack")
	end
end

function Rule_keeperAttackTheTarget()
	if (SobGroup_AreAllInRealSpace("Keeper") == 1) then
	print("SCAR thinks the Keeper is out of hyperspace now!")
	print("telling Keeper to ATTACK THE TARGET!")
	FX_StopEvent("Keeper", "Phase_loop")
	SobGroup_Attack(1, "Keeper", "KeeperTarget")
	Timer_Start("KeeperAttackTimer", 40)
	Rule_Add("Rule_keeperAttackWatch")
	Rule_Remove("Rule_keeperAttackTheTarget")
	print("Keeper going into Attack Watch state!")
	end
end

function Rule_keeperAttackTheTargetFIRSTTIME()
	if (SobGroup_AreAllInRealSpace("Keeper") == 1) then
	print("SCAR thinks the Keeper is out of hyperspace now!")
	print("telling Keeper to ATTACK THE TARGET FOR THE FIRST TIME!")
	FX_StopEvent("Keeper", "Phase_loop")
	KeeperIsAttacking = 1
	SobGroup_Attack(1, "Keeper", "KeeperTarget")
	Timer_Start("KeeperFirstAttackTimer", 60)
	Rule_Add("Rule_keeperFIRSTTIMEAttackWatch")
	print("Keeper going into FIRST TIME Attack Watch state!")
	Rule_Remove("Rule_keeperAttackTheTargetFIRSTTIME")
	end
end

function Rule_keeperFIRSTTIMEAttackWatch()
	if (Timer_GetRemaining("KeeperFirstAttackTimer") < 1) then
	print("Keeper attack timer has ended! Entering AttackWatch state!")
	Rule_AddInterval("Rule_keeperAttackWatch", 3)
	Rule_AddInterval("Rule_setKeeperDoneFirstAttack", 45)
	Rule_Remove("Rule_keeperFIRSTTIMEAttackWatch")
	elseif (SobGroup_HealthPercentage("Keeper") < 0.7) then
	print("FIRST TIME says the Keeper's health is too low, Entering Attack Watch state!")
	Rule_AddInterval("Rule_keeperAttackWatch", 3)
	Rule_AddInterval("Rule_setKeeperDoneFirstAttack", 25)
	Rule_Remove("Rule_keeperFIRSTTIMEAttackWatch")
	end
end

function Rule_setKeeperDoneFirstAttack()
	KeeperDoneFirstAttack = 1
	Rule_Remove("Rule_setKeeperDoneFirstAttack")
end

function Rule_keeperAttackWatch()
	Player_FillSobGroupInVolume("tempSobGroupOne", 0, "InhibitorTrapSphere")
	if (SobGroup_HealthPercentage("Keeper") < 0.7) then
	print("Keeper is below 70 percent health! Getting out of here!")
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	print("Telling Keeper to hyperspace out from keeperAttackWatch!!!")
	print("Keeper should be entering hyperspace NOW")
	FX_StartEvent("Keeper", "Phase_loop")
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	print("Locking Keeper's health!!!!!")
	Timer_Start("KeeperLastAttackTimer", 170)
	Rule_Add("Rule_keeperDecide")
	Rule_Remove("Rule_keeperAttackWatch")
	elseif (KeeperGoGetTrapped == 1) then
	print("Keeper going to get trapped!!!")
	Rule_AddInterval("Rule_keeperFallIntoTrap", 1)
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	Timer_Start("KeeperLastAttackTimer", 170)
	Rule_Remove("Rule_keeperAttackWatch")
	elseif (Timer_GetRemaining("KeeperAttackTimer") < 1 and SobGroup_Count("AttackDroid_Dreadnaught") < 5 and DreadnaughtInProximityOfMS == 0) then
	print("Keeper in AttackWatch - going to build drones!!")
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	FX_StartEvent("Keeper", "Phase_loop")
	CountDroidsExistingONCE = 0
	Timer_Start("KeeperLastAttackTimer", 170)
	Rule_Add("Rule_keeperSpawnDroidsAtDreadnaughtPhase2")
	Rule_Remove("Rule_keeperAttackWatch")
	elseif (Timer_GetRemaining("KeeperAttackTimer") < 1 and CreateFirstInhibitorDroids == 0 and InhibitorTrapHasStarted == 1 and SobGroup_Empty("tempSobGroupOne") ~= 1) then
	CreateFirstInhibitorDroids = 1
	print("Keeper in AttackWatch - going to build INHIBITOR drones for the first time!")
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	FX_StartEvent("Keeper", "Phase_loop")
	Timer_Start("KeeperLastAttackTimer", 170)
	Rule_Add("Rule_keeperSpawnDroidsAtInhibitorTrap")
	Rule_Remove("Rule_keeperAttackWatch")
	elseif (Timer_GetRemaining("KeeperAttackTimer") < 1 and CreateFirstInhibitorDroids == 1 and SobGroup_Count("AttackDroid_Inhibitor") < 8) then
	print("Keeper in AttackWatch - going to build INHIBITOR drones!")
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	FX_StartEvent("Keeper", "Phase_loop")
	numInhibitorDroidsBuilt = SobGroup_Count("AttackDroid_Inhibitor")
	Timer_Start("KeeperLastAttackTimer", 170)
	Rule_Add("Rule_keeperSpawnDroidsAtInhibitorTrap")
	Rule_Remove("Rule_keeperAttackWatch")
	elseif (SobGroup_Empty("KeeperTarget") == 1) then
	print("All targets are dead! Going into Decide state!")
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	FX_StartEvent("Keeper", "Phase_loop")
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	print("Locking Keeper's health!!!!!")
	Timer_Start("KeeperLastAttackTimer", 170)
	Rule_Add("Rule_keeperDecide")
	Rule_Remove("Rule_keeperAttackWatch")
	end
end

function Rule_keeperWait()
	print("Keeper EXITING HYPERSPACE and WAITING!")
	local randomPointIndex = (RandomIntMax(2) + 1)
	SobGroup_ExitHyperSpace("Keeper", "KeeperRetreat0"..randomPointIndex)
	print("Waiting for 40 seconds!")
	Rule_AddInterval("Rule_keeperDecide", 10)
	Rule_Remove("Rule_keeperWait")
end

function Rule_keeperRetreat()
	print("Keeper EXITING HYPERSPACE at the HEAL POINT!")
	local randomPointIndex = (RandomIntMax(2) + 1)
	SobGroup_ExitHyperSpace("Keeper", "KeeperRetreat0"..randomPointIndex)
	Rule_AddInterval("Rule_keeperHeal", 10)
	Rule_Remove("Rule_keeperRetreat")
end

function Rule_keeperHeal()
	print("Keeper HEALING himself!")
	if (KeeperGoGetTrapped == 1) then
	print("Keeper going to get trapped!!!")
	Rule_AddInterval("Rule_keeperFallIntoTrap", 1)
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")
	Rule_Add("Rule_keeperLockHealth")
	FX_StartEvent("Keeper", "Phase_loop")
	KeeperHealthLocked = 1
	Rule_Remove("Rule_keeperHeal")
	else
	CurrentKeeperHealth = SobGroup_HealthPercentage("Keeper")
	HealedKeeperHealth = (CurrentKeeperHealth + 0.01)
	SobGroup_SetHealth("Keeper", HealedKeeperHealth)
	Rule_AddInterval("Rule_keeperCheckHealth", 0.5)
	Rule_Remove("Rule_keeperHeal")
	end
end

function Rule_keeperCheckHealth()
	print("Keeper CHECKING his health!")
	if (SobGroup_HealthPercentage("Keeper") > 0.99) then
	Rule_AddInterval("Rule_keeperDecide", 1)
	Rule_Remove("Rule_keeperCheckHealth")
	else
	Rule_Add("Rule_keeperHeal")
	Rule_Remove("Rule_keeperCheckHealth")
	end
end

function Rule_keeperFallIntoTrap()
	print("Keeper hyperspacing out - getting ready to fall into trap!!!")
	SobGroup_EnterHyperSpaceOffMap("Keeper")
	FX_StartEvent("Keeper", "Phase_loop")
	Rule_Add("Rule_keeperFallIntoTrap2")
	Rule_Remove("Rule_keeperFallIntoTrap")
end

function Rule_keeperFallIntoTrap2()
	if (SobGroup_AreAllInHyperspace("Keeper") == 1) then
	print("SCAR thinks the Keeper is in hyperspace!")
	print("Keeper FALLING INTO TRAP!")
	FX_StopEvent("Keeper", "Phase_loop")
	KeeperIsInTrap = 1
	SobGroup_ExitHyperSpace("Keeper", "EffectPoint01")
	print("Telling keeper to exit hyperspace in middle of trap")
	SobGroup_AbilityActivate("Keeper", AB_Hyperspace, 0)
	Rule_AddInterval("Rule_stopKeeper", 20)
	Rule_Remove("Rule_keeperFallIntoTrap2")
	end
end

function Rule_StartKeeperSelfDestruct()
	Timer_Start(0, 90)
	Subtitle_TimeCounter(0, 43522)
	Rule_Remove("Rule_keeperLockHealth")
	Rule_AddInterval("Rule_DamageKeeper", 0.5)
	Rule_Remove("Rule_StartKeeperSelfDestruct")
end

function Rule_DamageKeeper()
	SobGroup_TakeDamage("Keeper", 0.0055)
	if (SobGroup_Empty("Keeper")) then
	Rule_AddInterval("Rule_DestroyPlayer", 3)
	Rule_Remove("Rule_DamageKeeper")
	end
end

function Rule_DestroyPlayer()
	SobGroup_TakeDamage("Player_Ships0", 1.5)
	Rule_Remove("Rule_DestroyPlayer")
end

function Rule_startDreadnaughtRetrieval()
	SobGroup_SetAutoLaunch("Berth", ShipHoldStayDockedAlways)
	SobGroup_DockSobGroupInstant("Dreadnaught", "Berth")
	SetAlliance(2, 3)
	SetAlliance(3, 2)
	SobGroup_SetAutoLaunch("Dreadnaught", ShipHoldStayDockedAlways)
	SobGroup_SetTactics("Dreadnaught", PassiveTactics)
	SobGroup_Create("MoversLatchedToDreadnaught")
	Rule_AddInterval("Rule_dreadnaughtLaunch", 3)
	Rule_Remove("Rule_startDreadnaughtRetrieval")
end

function Rule_dreadnaughtLaunch()
	SobGroup_GetSobGroupDockedWithGroup("Dreadnaught", "MoversLatchedToDreadnaught")
	if (SobGroup_Count("MoversLatchedToDreadnaught") == 6) then
	SobGroup_Launch("Dreadnaught", "Berth")
	Rule_Add("Rule_playeffect_dreadnaughtLaunch")
	SobGroup_DockSobGroupAndStayDocked("Dreadnaught", "PlayerMothership")
	PlayerHasDreadnaught = 1
	Rule_Add("Rule_dreadnaughtRetrievalWatch")
	Rule_Add("Rule_watchForDreadnaughtToDock")
	Rule_AddInterval("Rule_speedUpDreadnaught", 15)
	Rule_Add("Rule_slowDreadnaughtDown")
	Rule_Remove("Rule_dreadnaughtLaunch")
	end
end

function Rule_speedUpDreadnaught()
	SobGroup_SetSpeed("Dreadnaught", 1.35)
	Rule_Remove("Rule_speedUpDreadnaught")
end

function Rule_slowDreadnaughtDown()
	if (SobGroup_FillProximitySobGroup("tempSobGroupOne", "PlayerMothership", "Dreadnaught", 1800) == 1) then
	SobGroup_SetSpeed("Dreadnaught", 1)
	DreadnaughtInProximityOfMS = 1
	Rule_Remove("Rule_slowDreadnaughtDown")
	end
end

function Rule_watchForMoversLatchedToDreadnaught()
	SobGroup_GetSobGroupDockedWithGroup("Dreadnaught", "MoversLatchedToDreadnaught")
	if (SobGroup_Count("MoversLatchedToDreadnaught") == 6) then
	Ping_Remove(ping_dreadnaught_id)
	Rule_Add("Rule_intelevent_raisingTheDreadnaughtREPEAT")
	SobGroup_DockSobGroupAndStayDocked("Dreadnaught", "PlayerMothership")
	DreadnaughtIsMoving = 1
	Rule_AddInterval("Rule_dreadnaughtRetrievalWatch", 2)
	Rule_Remove("Rule_watchForMoversLatchedToDreadnaught")
	end
end

function Rule_dreadnaughtRetrievalWatch()
	SobGroup_GetSobGroupDockedWithGroup("Dreadnaught", "MoversLatchedToDreadnaught")
	if (DreadnaughtInProximityOfMS == 0 and SobGroup_Count("MoversLatchedToDreadnaught") < 6) then
	Rule_Add("Rule_intelevent_dreadnaughtMoverLost")
	SobGroup_Stop(2, "Dreadnaught")
	DreadnaughtIsMoving = 0
	ping_dreadnaught_id = Ping_AddSobGroup(ping_dreadnaught, "anomaly", "Dreadnaught")
	Ping_AddDescription(ping_dreadnaught_id, 0, "$43811")
	Rule_Add("Rule_watchForMoversLatchedToDreadnaught")
	Rule_Remove("Rule_dreadnaughtRetrievalWatch")
	end
end

function Rule_watchForDreadnaughtToDock()
	if (SobGroup_IsDocked("Dreadnaught") == 1) then
	SobGroup_SetAutoLaunch("Dreadnaught", ShipHoldLaunch)
	SobGroup_AllowPassiveActionsAlways("Dreadnaught", 0)
	SobGroup_Launch("MoversLatchedToDreadnaught", "Dreadnaught")
	DreadnaughtDockedWithMS = 1
	print("Dreadnaught has docked with mothership!")
	print("Dreadnaught docked variable:"..DreadnaughtDockedWithMS)
	Rule_AddInterval("Rule_intelevent_dreadnaughtDocked", 1)
	Rule_Remove("Rule_watchForDreadnaughtToDock")
	end
end

function Rule_launchDreadnaughtFromMS()
	SobGroup_GetSobGroupDockedWithGroup("Dreadnaught", "MoversLatchedToDreadnaught")
	if (intelevent_dreadnaughtDockedISDONE == 1) then
	SobGroup_Launch("Dreadnaught", "PlayerMothership")
	SobGroup_AutoEngineGlow("Dreadnaught")
	SobGroup_SwitchOwner("Dreadnaught", 0)
	local abilityList = {AB_Attack, AB_Guard, AB_Retire, AB_Scuttle}
	for j = 1, 4 do
	SobGroup_AbilityActivate("Dreadnaught", abilityList[j], 0)
	end
	Rule_Remove("Rule_launchDreadnaughtFromMS")
	end
end

function Rule_startInhibitorInstall()
	SetAlliance(0, 4)
	SetAlliance(4, 0)
	SetAlliance(3, 4)
	SetAlliance(4, 3)
	SetAlliance(1, 4)
	SetAlliance(4, 1)
	SobGroup_SetAutoLaunch("InhibitorChunk1", ShipHoldStayDockedAlways)
	SobGroup_SetAutoLaunch("InhibitorChunk2", ShipHoldStayDockedAlways)
	SobGroup_SetAutoLaunch("InhibitorChunk3", ShipHoldStayDockedAlways)
	SobGroup_SetAutoLaunch("HSInhibitor1", ShipHoldStayDockedAlways)
	SobGroup_SetAutoLaunch("HSInhibitor2", ShipHoldStayDockedAlways)
	SobGroup_SetAutoLaunch("HSInhibitor3", ShipHoldStayDockedAlways)
	Rule_Remove("Rule_startInhibitorInstall")
end

function Rule_watchForMoverDockedToInhibitor1()
	SobGroup_GetSobGroupDockedWithGroup("HSInhibitor1", "MoversLatchedToInhibitor1")
	if (SobGroup_Count("MoversLatchedToInhibitor1") > 0) then
	Ping_Remove(ping_inhibitor1_id)
	SobGroup_DockSobGroup("HSInhibitor1", "InhibitorChunk1")
	Inhibitor1EnRoute = 1
	Rule_Add("Rule_inhibitor1InstallWatch")
	Rule_Remove("Rule_watchForMoverDockedToInhibitor1")
	end
end

function Rule_inhibitor1InstallWatch()
	SobGroup_GetSobGroupDockedWithGroup("HSInhibitor1", "MoversLatchedToInhibitor1")
	if (SobGroup_Count("MoversLatchedToInhibitor1") == 0) then
	SobGroup_Stop(4, "HSInhibitor1")
	ping_inhibitor1_id = Ping_AddSobGroup(ping_inhibitor1, "anomaly", "HSInhibitor1")
	Ping_AddDescription(ping_inhibitor1_id, 0, "$43814")
	Rule_Add("Rule_watchForMoverDockedToInhibitor1")
	Rule_Remove("Rule_inhibitor1InstallWatch")
	end
	if (SobGroup_IsDocked("HSInhibitor1") == 1) then
	SobGroup_SetAutoLaunch("HSInhibitor1", ShipHoldLaunch)
	Ping_Remove(ping_inhibitor1_id)
	SobGroup_Launch("MoversLatchedToInhibitor1", "HSInhibitor1")
	Inhibitor1Installed = 1
	SobGroup_AbilityActivate("HSInhibitor1", AB_AcceptDocking, 0)
	Rule_Add("Rule_playeffect_inhibitor1Attached")
	TOTALInhibitorsInstalled = (TOTALInhibitorsInstalled + 1)
	print("Inhibitors installed = "..TOTALInhibitorsInstalled)
	FOW_RevealGroup("InhibitorChunk1", 1)
	Rule_Remove("Rule_inhibitor1InstallWatch")
	end
end

function Rule_watchForMoverDockedToInhibitor2()
	SobGroup_GetSobGroupDockedWithGroup("HSInhibitor2", "MoversLatchedToInhibitor2")
	if (SobGroup_Count("MoversLatchedToInhibitor2") > 0) then
	Ping_Remove(ping_inhibitor2_id)
	SobGroup_DockSobGroup("HSInhibitor2", "InhibitorChunk2")
	Inhibitor2EnRoute = 1
	Rule_Add("Rule_inhibitor2InstallWatch")
	Rule_Remove("Rule_watchForMoverDockedToInhibitor2")
	end
end

function Rule_inhibitor2InstallWatch()
	SobGroup_GetSobGroupDockedWithGroup("HSInhibitor2", "MoversLatchedToInhibitor2")
	if (SobGroup_Count("MoversLatchedToInhibitor2") == 0) then
	SobGroup_Stop(4, "HSInhibitor2")
	ping_inhibitor2_id = Ping_AddSobGroup(ping_inhibitor2, "anomaly", "HSInhibitor2")
	Ping_AddDescription(ping_inhibitor2_id, 0, "$43814")
	Rule_Add("Rule_watchForMoverDockedToInhibitor2")
	Rule_Remove("Rule_inhibitor2InstallWatch")
	end
	if (SobGroup_IsDocked("HSInhibitor2") == 1) then
	SobGroup_SetAutoLaunch("HSInhibitor2", ShipHoldLaunch)
	Ping_Remove(ping_inhibitor2_id)
	SobGroup_Launch("MoversLatchedToInhibitor2", "HSInhibitor2")
	Inhibitor2Installed = 1
	SobGroup_AbilityActivate("HSInhibitor2", AB_AcceptDocking, 0)
	Rule_Add("Rule_playeffect_inhibitor2Attached")
	TOTALInhibitorsInstalled = (TOTALInhibitorsInstalled + 1)
	print("Inhibitors installed = "..TOTALInhibitorsInstalled)
	FOW_RevealGroup("InhibitorChunk2", 1)
	Rule_Remove("Rule_inhibitor2InstallWatch")
	end
end

function Rule_watchForMoverDockedToInhibitor3()
	SobGroup_GetSobGroupDockedWithGroup("HSInhibitor3", "MoversLatchedToInhibitor3")
	if (SobGroup_Count("MoversLatchedToInhibitor3") > 0) then
	Ping_Remove(ping_inhibitor3_id)
	SobGroup_DockSobGroup("HSInhibitor3", "InhibitorChunk3")
	Inhibitor3EnRoute = 1
	Rule_Add("Rule_inhibitor3InstallWatch")
	Rule_Remove("Rule_watchForMoverDockedToInhibitor3")
	end
end

function Rule_inhibitor3InstallWatch()
	SobGroup_GetSobGroupDockedWithGroup("HSInhibitor3", "MoversLatchedToInhibitor3")
	if (SobGroup_Count("MoversLatchedToInhibitor3") == 0) then
	ping_inhibitor3_id = Ping_AddSobGroup(ping_inhibitor3, "anomaly", "HSInhibitor3")
	Ping_AddDescription(ping_inhibitor3_id, 0, "$43814")
	SobGroup_Stop(4, "HSInhibitor3")
	Rule_Add("Rule_watchForMoverDockedToInhibitor3")
	Rule_Remove("Rule_inhibitor3InstallWatch")
	end
	if (SobGroup_IsDocked("HSInhibitor3") == 1) then
	SobGroup_SetAutoLaunch("HSInhibitor3", ShipHoldLaunch)
	Ping_Remove(ping_inhibitor3_id)
	SobGroup_Launch("MoversLatchedToInhibitor3", "HSInhibitor3")
	Inhibitor3Installed = 1
	SobGroup_AbilityActivate("HSInhibitor3", AB_AcceptDocking, 0)
	Rule_Add("Rule_playeffect_inhibitor3Attached")
	TOTALInhibitorsInstalled = (TOTALInhibitorsInstalled + 1)
	print("Inhibitors installed = "..TOTALInhibitorsInstalled)
	FOW_RevealGroup("InhibitorChunk3", 1)
	Rule_Remove("Rule_inhibitor3InstallWatch")
	end
end

function Rule_PlayAmbientMusic()
	print("trying to play ambient music!")
	Sound_MusicPlayType("data:sound/music/ambient/amb_08", MUS_Ambient)
	Rule_Remove("Rule_PlayAmbientMusic")
end

function Rule_PlayStagingMusic()
	print("trying to play staging music!")
	Sound_MusicPlayType("data:sound/music/staging/staging_08", MUS_Staging)
	Rule_Remove("Rule_PlayStagingMusic")
end

function Rule_PlayBattleMusic()
	print("trying to play Battle music!")
	Sound_MusicPlayType("data:sound/music/battle/battle_keeper", MUS_Battle)
	Rule_Remove("Rule_PlayBattleMusic")
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

Events = {}
Events["intelevent_intro"] = {{{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6431')", ""},}, {HW2_Wait(2)}, {HW2_LocationCardEvent("$43520", 6)}, {{"Sound_EnableAllSpeech(1)", ""}, HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43530", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43531", 2)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43532", 5)}, {HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Sensors_Toggle(1)", ""},}, {{"Camera_Interpolate('here', 'camera9', 1)", ""}, HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43536", 4), {"pointer_powerSignature_id = HW2_CreateEventPointerSobGroup('Berth')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43537", 8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43534", 4), {"ping_powerSignature_id = Ping_AddSobGroup(ping_powerSignature, 'anomaly', 'Berth')", ""}, {"Ping_AddDescription(ping_powerSignature_id, 0, '$43810')", ""}, {"obj_prim_investigatePowerSignature_id = Objective_Add(obj_prim_investigatePowerSignature , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_investigatePowerSignature_id, '$43810')", ""},}, {HW2_Wait(1)}, {{"EventPointer_Remove(pointer_powerSignature_id)", ""},}, {{"Universe_EnableSkip(0)", ""}, HW2_Pause(0), {"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, HW2_Letterbox(0)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_meetTheKeeper"] = {{HW2_Wait(1)}, {{"Ping_Remove(ping_powerSignature_id)", ""}, {"Objective_SetState(obj_prim_investigatePowerSignature_id, OS_Complete)", ""}, {"Camera_SetLetterboxStateNoUI(1, 3)", ""},}, {HW2_Wait(3.5)}, {{"g_currentNISPlaying_id = NISPlayFromGroup('nis/NIS08', 'Berth')", ""}, {"Rule_Add ('Rule_intelevent_NISDone')", ""},},}
Events["intelevent_retrieveTheDreadnaught"] = {{HW2_Pause(1)}, {HW2_Wait(2)}, {{"Universe_EnableSkip(1)", ""}, {"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43610", 4), {"pointer_dreadnaught_id = HW2_CreateEventPointerSobGroup('Dreadnaught')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43611", 4), {"ping_dreadnaught_id = Ping_AddSobGroup(ping_dreadnaught, 'anomaly', 'Dreadnaught')", ""}, {"Ping_AddDescription(ping_dreadnaught_id, 0, '$43811')", ""}, {"obj_prim_retrieveDreadnaught_id = Objective_Add(obj_prim_retrieveDreadnaught , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_retrieveDreadnaught_id, '$43812')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43612", 4)}, {HW2_Wait(0.5)}, {{"EventPointer_Remove(pointer_dreadnaught_id)", ""},}, {{"Universe_EnableSkip(0)", ""}, HW2_Pause(0), {"Sensors_Toggle(0)", ""}, HW2_Letterbox(0)}, {{"Rule_AddInterval ('Rule_turnUIBackOn', 1)", ""}, {"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6432')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"Rule_AddInterval ('Rule_intelevent_hyperspaceDisabled', 3)", ""}, {"Rule_Add ('Rule_PlayStagingMusic')", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_hyperspaceDisabled"] = {{HW2_SubTitleEvent(Actor_FleetCommand, "$43605", 7)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43606", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_raisingTheDreadnaught"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43620", 3), {"Ping_Remove(ping_dreadnaught_id)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43621", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_droidAnalysis"] = {{HW2_Wait(3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43615", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43616", 7)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43617", 7)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_dreadnaughtMoverLost"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43630", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43631", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_dreadnaughtDocked"] = {{{"print ('trying to play dreadnaught docked event')", ""}, {"Objective_SetState(obj_prim_retrieveDreadnaught_id, OS_Complete)", ""}, {"Ping_Remove(ping_dreadnaught_id)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43640", 2.5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43641", 4)}, {HW2_Wait(8)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43642", 3)}, {HW2_Wait(1)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6433')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"intelevent_dreadnaughtDockedISDONE = 1", ""}, {"Rule_AddInterval ('Rule_launchDreadnaughtFromMS', 1)", ""}, {"EventPlaying = 0", ""}, {"Rule_AddInterval ('Rule_intelevent_cannotDefeatKeeper', 12)", ""},},}
Events["intelevent_dreadnaughtAnalysis"] = {{HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43650", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43651", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43652", 5)}, {HW2_Wait(0.5)}, {{"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""}, {"intelevent_dreadnaughtAnalysisISDONE = 1", ""}, {"Rule_AddInterval ('Rule_intelevent_letsGo', 3)", ""},},}
Events["intelevent_keeperAttacking"] = {{{"Rule_Add ('Rule_PlayBattleMusic')", ""}, HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {{"Camera_FocusSobGroup('Keeper', 1, 14000, 1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$43590", 4), {"pointer_keeper_id = HW2_CreateEventPointerSobGroup('Keeper')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43591", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43592", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43593", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43594", 5), {"obj_prim_protectFleet_id = Objective_Add(obj_prim_protectFleet , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_protectFleet_id, '$43813')", ""},}, {HW2_Wait(0.5)}, {{"EventPointer_Remove(pointer_keeper_id)", ""},}, {{"Universe_EnableSkip(0)", ""}, HW2_Pause(0), {"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, HW2_Letterbox(0)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_cannotDefeatKeeper"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43700", 5)}, {HW2_Wait(0.5)}, {HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43701", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43702", 6), {"pointer_derelict1_id = HW2_CreateEventPointerSobGroup('InhibitorChunk1')", ""}, {"pointer_derelict2_id = HW2_CreateEventPointerSobGroup('InhibitorChunk2')", ""}, {"pointer_derelict3_id = HW2_CreateEventPointerSobGroup('InhibitorChunk3')", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43709", 8)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43704", 8)}, {{"EventPointer_Remove(pointer_derelict1_id)", ""}, {"EventPointer_Remove(pointer_derelict2_id)", ""}, {"EventPointer_Remove(pointer_derelict3_id)", ""}, HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43705", 8), {"ping_probeLocation_id1 = Ping_AddPoint(ping_probeLocation1, 'anomaly', 'ProbeLocation1')", ""}, {"Ping_AddDescription(ping_probeLocation_id1, 0, '$43816')", ""}, {"ping_probeLocation_id2 = Ping_AddPoint(ping_probeLocation2, 'anomaly', 'ProbeLocation2')", ""}, {"Ping_AddDescription(ping_probeLocation_id2, 0, '$43816')", ""}, {"ping_probeLocation_id3 = Ping_AddPoint(ping_probeLocation3, 'anomaly', 'ProbeLocation3')", ""}, {"Ping_AddDescription(ping_probeLocation_id3, 0, '$43816')", ""}, {"ping_probeLocation_id4 = Ping_AddPoint(ping_probeLocation4, 'anomaly', 'ProbeLocation4')", ""}, {"Ping_AddDescription(ping_probeLocation_id4, 0, '$43816')", ""}, {"ping_probeLocation_id5 = Ping_AddPoint(ping_probeLocation5, 'anomaly', 'ProbeLocation5')", ""}, {"Ping_AddDescription(ping_probeLocation_id5, 0, '$43816')", ""}, {"ping_probeLocation_id6 = Ping_AddPoint(ping_probeLocation6, 'anomaly', 'ProbeLocation6')", ""}, {"Ping_AddDescription(ping_probeLocation_id6, 0, '$43816')", ""}, {"obj_prim_sendProbes_id = Objective_Add(obj_prim_sendProbes , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_sendProbes_id, '$43816')", ""},}, {HW2_Wait(3)}, {{"Universe_EnableSkip(0)", ""}, HW2_Pause(0), {"Sensors_Toggle(0)", ""}, HW2_Letterbox(0)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""}, {"Rule_Add ('Rule_WatchForProbes')", ""}, {"Rule_AddInterval ('Rule_intelevent_probeInPosition', 2)", ""}, {"Rule_AddInterval ('Rule_intelevent_devicesLocated', 3)", ""},},}
Events["intelevent_probeInPosition"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43720", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_scansNegative"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43725", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_noDevicesFound"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43726", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_scanResultsNegative"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43727", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_devicesLocated"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43721", 5), {"Objective_SetState(obj_prim_sendProbes_id, OS_Complete)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"InhibitorTrapHasStarted = 1", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_installInhibitors"] = {{HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43706", 5), {"pointer_inhibitor1_id = HW2_CreateEventPointerVolume('InhibitorSphere')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43708", 9), {"ping_inhibitor1_id = Ping_AddSobGroup(ping_inhibitor1, 'anomaly', 'HSInhibitor1')", ""}, {"Ping_AddDescription(ping_inhibitor1_id, 0, '$43814')", ""}, {"ping_inhibitor2_id = Ping_AddSobGroup(ping_inhibitor2, 'anomaly', 'HSInhibitor2')", ""}, {"Ping_AddDescription(ping_inhibitor2_id, 0, '$43814')", ""}, {"ping_inhibitor3_id = Ping_AddSobGroup(ping_inhibitor3, 'anomaly', 'HSInhibitor3')", ""}, {"Ping_AddDescription(ping_inhibitor3_id, 0, '$43814')", ""}, {"obj_prim_installInhibitors_id = Objective_Add(obj_prim_installInhibitors , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_installInhibitors_id, '$43815')", ""},}, {HW2_Wait(2)}, {{"EventPointer_Remove(pointer_inhibitor1_id)", ""},}, {{"Universe_EnableSkip(0)", ""}, HW2_Pause(0), {"Sensors_Toggle(0)", ""}, HW2_Letterbox(0)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6434')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_inhibitor1EnRoute"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43710", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_inhibitor2EnRoute"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43710", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_inhibitor3EnRoute"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43710", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_inhibitor1Installed"] = {{{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(4)}, {{"Rule_Add ('Rule_FocusOnFirstInstalledInhibitor')", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43740", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43742", 3)}, {HW2_Wait(1)}, {HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Sensors_EnableToggle(1)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_inhibitor2Installed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43745", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43742", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_inhibitor3Installed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43750", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43742", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_distortionFieldActive"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43756", 3), {"Objective_SetState(obj_prim_installInhibitors_id, OS_Complete)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id +1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6435')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_keeperTrapped"] = {{HW2_Wait(1)}, {HW2_Letterbox(1)}, {HW2_Wait(3)}, {{"Camera_Interpolate('here', 'camera2', 1)", ""}, {"Rule_Add ('Rule_playeffect_hyperspaceTrap')", ""},}, {HW2_Wait(7)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43578", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43579", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43580", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$43582", 5)}, {HW2_Wait(0.5)}, {{"intelevent_keeperTrappedISDONE = 1", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_oneMinuteToSelfDestruct"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43583", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_thirtySecondsToSelfDestruct"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43584", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_letsGo"] = {{{"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$43770", 3)}, {HW2_Wait(0.5)}, {{"Universe_Fade(1, 1.5)", ""},}, {HW2_Wait(2.5)}, {{"Player_InstantDockAndParade(0, 'PlayerMothership', 0)", "", 0}, {"Player_InstantlyGatherAllResources(0)", ""}, {"Camera_FocusSobGroup('PlayerMothership', 1, 4000, 0)", ""},}, {{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {HW2_Wait(0.5)}, {{"Universe_Fade(0, 1.5)", ""},}, {HW2_Wait(1.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$43771", 3)}, {{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')", ""},}, {HW2_Wait(12)}, {{"Universe_Fade(1, 1.5)", ""},}, {HW2_Wait(1.5)}, {{"SobGroup_SwitchOwner('Dreadnaught', 3)", ""}, HW2_LocationCardEvent("$43881", 2), {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},}, {HW2_Wait(0.5)}, {{"setMissionComplete(1)", ""},},}
Events["intelevent_mothershipDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$43880", 10)}, {HW2_Wait(0.5)}, {{"setMissionComplete(0)", ""},},}
