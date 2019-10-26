-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")

function OnInit()
	UI_ClearEventScreen()
	HW2_SetResearchLevel(2)
	Rule_Add("Rule_Init")
end

function OnStartOrLoad()
	FX_PlayEffectOnBackground("m02_explosion_spray", {-1.5, -0.1, -1}, 10)
end

function Rule_Init()
	Rule_Add("Rule_DisableSpeech")
	Sound_SpeechSubtitlePath("speech:missions/m_02/")
	SobGroup_Despawn("EscortInterceptors1")
	SobGroup_Despawn("EscortInterceptors2")
	SobGroup_Despawn("EscortBombers1")
	SobGroup_Despawn("EscortBombers2")
	SobGroup_SetSwitchOwnerFlag("EscortInterceptors1", 0)
	SobGroup_SetSwitchOwnerFlag("EscortInterceptors2", 0)
	SobGroup_SetSwitchOwnerFlag("EscortBombers1", 0)
	SobGroup_SetSwitchOwnerFlag("EscortBombers2", 0)
	NISOver = 0
	InterceptorEscortsGiven = 0
	BomberEscortsGiven = 0
	Camera_UsePanning(0)
	NISLoad("nis/NIS02A")
	g_currentNISPlaying_id = NISPlay("nis/NIS02A")
	NISDisableInterface(1)
	SobGroup_Create("tempSobGroup")
	SobGroup_Create("BombersNearEnemyCarrier")
	SobGroup_Create("MelarnFleetAll")
	Rule_AddInterval("Rule_watchForNISDoneFromTimer", 41)
	Rule_Add("Rule_watchForNISDone")
	Rule_Remove("Rule_Init")
end

function Rule_DisableSpeech()
	Sound_EnableAllSpeech(0)
	Rule_Remove("Rule_DisableSpeech")
end

function Rule_watchForNISDoneFromTimer()
	if (NISOver == 0) then
	NISOver = 1
	SobGroup_LoadPersistantData("Hgn_Mothership")
	UI_ClearEventScreen()
	Rule_AddInterval("Rule_spawnEscorts", 1)
	Rule_AddInterval("Rule_Init2", 10)
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	elseif (NISOver == 1) then
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	end
end

function Rule_watchForNISDone()
	if (NISOver == 0 and NISComplete(g_currentNISPlaying_id) == 1) then
	NISOver = 1
	SobGroup_LoadPersistantData("Hgn_Mothership")
	UI_ClearEventScreen()
	Rule_AddInterval("Rule_spawnEscorts", 1)
	Rule_AddInterval("Rule_Init2", 10)
	Rule_Remove("Rule_watchForNISDone")
	elseif (NISOver == 1) then
	Rule_Remove("Rule_watchForNISDone")
	end
end

function Enable_ResearchOptions()
	Player_UnrestrictResearchOption(0, "AssaultCorvetteHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "AssaultCorvetteMAXSPEEDUpgrade1")
	Player_UnrestrictResearchOption(0, "PulsarCorvetteHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "PulsarCorvetteMAXSPEEDUpgrade1")
	Player_UnrestrictResearchOption(0, "MothershipHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "MothershipMAXSPEEDUpgrade1")
	Player_UnrestrictResearchOption(0, "InterceptorMAXSPEEDUpgrade1")
	Player_UnrestrictResearchOption(0, "AttackBomberMAXSPEEDUpgrade1")
	Player_UnrestrictResearchOption(0, "ResourceCollectorHealthUpgrade1")
end

function Rule_Init2()
	print("starting Init2 !!!!! !!!!!!!! !!!!!!!! !!!!!!!! !!!!!!!")
	CPU_Enable(0, 0)
	CPU_Enable(1, 0)
	CPU_Enable(3, 0)
	CPU_Enable(4, 0)
	CPU_Enable(5, 0)
	Player_SetPlayerName(0, "$40005")
	Player_SetPlayerName(1, "$40006")
	FighterFacilityCount = 0
	obj_prim_saveconvoys = "$40000"
	obj_prim_saveconvoys_id = 0
	obj_sec_destroyFighterFacility = "$40001"
	obj_sec_destroyFighterFacility_id = 0
	obj_prim_destroycarrier = "$40002"
	obj_prim_destroycarrier_id = 0
	obj_sec_buildCorvetteFacility = "$40003"
	obj_sec_buildCorvetteFacility_id = 0
	obj_prim_saveMelarn = "$40004"
	obj_prim_saveMelarn_id = 0
	obj_sec_buildCollectors = "$40010"
	obj_sec_buildCollectors_id = 0
	ping_enemyCarrier = "$40390"
	ping_enemyCarrier_id = 0
	ping_carrierExitPoint = "$40400"
	ping_carrierExitPoint_id = 0
	ping_Convoy_1 = "$40391"
	ping_Convoy_1_id = 0
	ping_Convoy_2 = "$40392"
	ping_Convoy_2_id = 0
	ping_Convoy_3 = "$40393"
	ping_Convoy_3_id = 0
	ping_Convoy_4 = "$40394"
	ping_Convoy_4_id = 0
	ping_Convoy_5 = "$40395"
	ping_Convoy_5_id = 0
	ping_Convoy_6 = "$40396"
	ping_Convoy_6_id = 0
	ping_melarnSoban = "$40397"
	ping_melarnSoban_id = 0
	ping_frigateAttackers = "$40398"
	ping_frigateAttackers_id = 0
	pointer_enemyCarrier_id = 0
	pointer_convoy1_id = 0
	pointer_convoy2_id = 0
	pointer_convoy3_id = 0
	pointer_convoy4_id = 0
	pointer_convoy5_id = 0
	pointer_convoy6_id = 0
	pointer_fighterFacility_id = 0
	convoys_total = 6
	convoys_destroyed = 0
	convoys_saved = 0
	convoys_docked = 0
	convoy1SavedONCE = 0
	convoy2SavedONCE = 0
	convoy3SavedONCE = 0
	convoy4SavedONCE = 0
	convoy5SavedONCE = 0
	convoy6SavedONCE = 0
	convoy1LostONCE = 0
	convoy2LostONCE = 0
	convoy3LostONCE = 0
	convoy4LostONCE = 0
	convoy5LostONCE = 0
	convoy6LostONCE = 0
	convoy1DestroyedONCE = 0
	convoy2DestroyedONCE = 0
	convoy3DestroyedONCE = 0
	convoy4DestroyedONCE = 0
	convoy5DestroyedONCE = 0
	convoy6DestroyedONCE = 0
	convoy1DeadONCE = 0
	convoy2DeadONCE = 0
	convoy3DeadONCE = 0
	convoy4DeadONCE = 0
	convoy5DeadONCE = 0
	convoy6DeadONCE = 0
	convoy1_docked = 0
	convoy2_docked = 0
	convoy3_docked = 0
	convoy4_docked = 0
	convoy5_docked = 0
	convoy6_docked = 0
	convoy1_docked_and_launched = 0
	convoy2_docked_and_launched = 0
	convoy3_docked_and_launched = 0
	convoy4_docked_and_launched = 0
	convoy5_docked_and_launched = 0
	convoy6_docked_and_launched = 0
	convoy1_dockedONCE = 0
	convoy2_dockedONCE = 0
	convoy3_dockedONCE = 0
	convoy4_dockedONCE = 0
	convoy5_dockedONCE = 0
	convoy6_dockedONCE = 0
	convoy1_launchedONCE = 0
	convoy2_launchedONCE = 0
	convoy3_launchedONCE = 0
	convoy4_launchedONCE = 0
	convoy5_launchedONCE = 0
	convoy6_launchedONCE = 0
	convoyReward1ONCE = 0
	convoyReward2ONCE = 0
	convoyReward3ONCE = 0
	convoyReward4ONCE = 0
	convoyReward5ONCE = 0
	convoyReward6ONCE = 0
	initialReinforcementsLaunched = 0
	Convoy6InitialAttackLaunched = 0
	FighterFacilityEventHasPlayed = 0
	CurrentFighterFacilityHealth = 0
	getFighterFacilityHealthONCE = 0
	carrierFlee = 0
	carrierGuardLaunch = 0
	carrierUnderAttack = 0
	carrierDestroyed = 0
	carrierGuardConvoy4ONCE = 0
	carrierGuardConvoy5ONCE = 0
	carrierGuardConvoy6ONCE = 0
	carrierGuardConvoy2ONCE = 0
	carrierGuardConvoy1ONCE = 0
	convoy3ReinforceONCE = 0
	convoy4ReinforceONCE = 0
	convoy5ReinforceONCE = 0
	convoy6ReinforceONCE = 0
	convoy3Reinforcements = 0
	convoy4Reinforcements = 0
	convoy5Reinforcements = 0
	convoy6Reinforcements = 0
	convoy3Int2GuardCarrierONCE = 0
	convoy3Int3GuardCarrierONCE = 0
	convoy4Int2GuardCarrierONCE = 0
	convoy4Int3GuardCarrierONCE = 0
	convoy5Int2GuardCarrierONCE = 0
	convoy5Int3GuardCarrierONCE = 0
	convoy6Int2GuardCarrierONCE = 0
	convoy6Int3GuardCarrierONCE = 0
	callInTheFrigates = 0
	frigatesAttackingConvoy6 = 0
	frigatesAttackingConvoy5 = 0
	frigatesAttackingConvoy4 = 0
	frigatesAttackingMS = 0
	frigatesAttackingMelarnFleet = 0
	melarnArrived = 0
	melarnSaved = 0
	melarnDamaged = 0
	tellMelarnToHyperspaceOut = 0
	MelarnAttacking = 0
	PlayerStartingRUs = Player_GetRU(0)
	g_now_time = Universe_GameTime()
	g_playerID = Universe_CurrentPlayer()
	g_save_id = 0
	SobGroup_Create("PlayerMothership")
	SobGroup_Create("PlayerCollectors")
	SobGroup_Create("BombersAttackingMelarn")
	Player_FillShipsByType("PlayerMothership", 0, "Hgn_Mothership")
	SobGroup_SetSpeed("PlayerMothership", 0.2)
	SobGroup_CreateSubSystem("EnemyCarrier", "FighterProduction")
	SobGroup_SetSpeed("EnemyCarrier", 0.65)
	SobGroup_Create("AttackingMelarn")
	SobGroup_TakeDamage("Convoy_3", 0.25)
	SobGroup_TakeDamage("Convoy_4", 0.05)
	SobGroup_TakeDamage("Convoy_5", 0.07)
	SobGroup_TakeDamage("Convoy_6", 0.25)
	SobGroup_FillBattleScar("Convoy_3", "Bullet/Bullet")
	SobGroup_FillBattleScar("Convoy_4", "Plasma_Bomb/Plasma_Bomb")
	SobGroup_FillBattleScar("Convoy_5", "Plasma_Bomb/Plasma_Bomb")
	SobGroup_FillBattleScar("Convoy_6", "Plasma_Bomb/Plasma_Bomb")
	Convoy3Interceptors2Alive = 0
	Convoy3Interceptors3Alive = 0
	Convoy4Interceptors2Alive = 0
	Convoy4Interceptors3Alive = 0
	Convoy5Interceptors2Alive = 0
	Convoy5Interceptors3Alive = 0
	Convoy6Interceptors2Alive = 0
	Convoy6Interceptors3Alive = 0
	if (SobGroup_Empty("Convoy3Interceptors2") ~= 1) then
	print("Convoy3Interceptors2 are alive!!!!!")
	Convoy3Interceptors2Alive = 1
	SobGroup_DockSobGroupInstant("Convoy3Interceptors2", "EnemyCarrier")
	end
	if (SobGroup_Empty("Convoy3Interceptors3") ~= 1) then
	print("Convoy3Interceptors3 are alive!!!!!")
	Convoy3Interceptors3Alive = 1
	SobGroup_DockSobGroupInstant("Convoy3Interceptors3", "EnemyCarrier")
	end
	if (SobGroup_Empty("Convoy4Interceptors2") ~= 1) then
	print("Convoy4Interceptors2 are alive!!!!!")
	Convoy4Interceptors2Alive = 1
	SobGroup_DockSobGroupInstant("Convoy4Interceptors2", "EnemyCarrier")
	end
	if (SobGroup_Empty("Convoy4Interceptors3") ~= 1) then
	print("Convoy4Interceptors3 are alive!!!!!")
	Convoy4Interceptors3Alive = 1
	SobGroup_DockSobGroupInstant("Convoy4Interceptors3", "EnemyCarrier")
	end
	if (SobGroup_Empty("Convoy5Interceptors2") ~= 1) then
	print("Convoy5Interceptors2 are alive!!!!!")
	Convoy5Interceptors2Alive = 1
	SobGroup_DockSobGroupInstant("Convoy5Interceptors2", "EnemyCarrier")
	end
	if (SobGroup_Empty("Convoy5Interceptors3") ~= 1) then
	print("Convoy5Interceptors3 are alive!!!!!")
	Convoy5Interceptors3Alive = 1
	SobGroup_DockSobGroupInstant("Convoy5Interceptors3", "EnemyCarrier")
	end
	if (SobGroup_Empty("Convoy6Interceptors2") ~= 1) then
	print("Convoy6Interceptors2 are alive!!!!!")
	Convoy6Interceptors2Alive = 1
	SobGroup_DockSobGroupInstant("Convoy6Interceptors2", "EnemyCarrier")
	end
	if (SobGroup_Empty("Convoy6Interceptors3") ~= 1) then
	print("Convoy6Interceptors3 are alive!!!!!")
	Convoy6Interceptors3Alive = 1
	SobGroup_DockSobGroupInstant("Convoy6Interceptors3", "EnemyCarrier")
	end
	Player_GrantResearchOption(1, "SuperCapHealthUpgradeSPGAME")
	Player_GrantResearchOption(1, "VaygrCarrierHealthRegenDowngrade")
	Player_RestrictBuildOption(0, "CorvetteProduction")
	Player_GrantResearchOption(1, "HyperspaceRecoveryTimeUpgradeSPGAME")
	Player_GrantResearchOption(1, "FrigateHealthUpgrade2")
	Player_GrantResearchOption(3, "FrigateHealthUpgradeSPGAME")
	Player_GrantResearchOption(0, "AssaultCorvetteEliteWeaponUpgrade")
	Player_GrantResearchOption(0, "AttackBomberEliteWeaponUpgrade")
	Player_RestrictResearchOption(0, "SensorsBackToNormal1")
	Player_RestrictResearchOption(0, "SensorsBackToNormal2")
	Player_RestrictResearchOption(0, "SensorsBackToNormal3")
	g_now_time = Universe_GameTime()
	Rule_AddInterval("Rule_convoySetup", 5)
	Rule_AddInterval("Rule_convoyDockWatch", 3)
	Rule_AddInterval("Rule_convoyLaunchWatch", 2)
	Rule_AddInterval("Rule_convoyRewardWatch", 1)
	Rule_Add("Rule_combatSetup")
	Rule_AddInterval("Rule_carrierGuardWatch", 6)
	Rule_Add("Rule_InitializeInterceptorTargets")
	Rule_Add("Rule_startAttackOnConvoy1")
	Rule_AddInterval("Rule_callInTheFrigates", 4)
	Rule_AddInterval("Rule_PlayerLoses", 2)
	s_nextFxTime = 0
	r_nextFxTime = 0
	t_nextFxTime = 0
	q_nextFxTime = 0
	w_nextFxTime = 0
	v_nextFxTime = 0
	x_nextFxTime = 0
	evt_corvetteSubsystemComplete_started = 0
	carrierDestroyedHasPlayed = 0
	sobanToHiigaranFleetHasPlayed = 0
	MelarnIsComingEventFinished = 0
	NIS02B_Playing = 0
	NIS02BCompleted = 0
	ReinforcementEventHasPlayed = 0
	rewardEventPlaying = 0
	rewardEventHasStarted = 0
	EventPlaying = 0
	OpeningEventFinished = 0
	TellConvoysToReturnHome = 0
	numCollectors = 0
	Rule_Add("Rule_IntelEvent_convoysUnderAttack")
	Rule_AddInterval("Rule_IntelEvent_mothershipMoved", 4)
	Rule_AddInterval("Rule_convoyLostWatch", 3)
	Rule_AddInterval("Rule_convoyDeathWatch", 4)
	Rule_AddInterval("Rule_IntelEvent_3convoys_Lost", 3)
	Rule_AddInterval("Rule_intelevent_convoysDamaged", 3.5)
	Rule_AddInterval("Rule_convoySavedWatch", 3)
	Rule_AddInterval("Rule_reinforcementWatch", 3)
	Rule_AddInterval("Rule_intelevent_carrierDestroyed", 2.5)
	Rule_Add("Rule_intelevent_fighterFacilityDestroyed")
	HW2_ReactiveInfo()
	Rule_Remove("Rule_Init2")
end

function Rule_testReactiveFleets()
	if (SobGroup_Empty("ReactiveTest") ~= 1) then
	print("Reactive sob group is working!!!!")
	end
end

function Rule_TurnSpeechBackOn()
	Sound_ExitIntelEvent()
	Rule_Remove("Rule_TurnSpeechBackOn")
end

function Rule_IntelEvent_convoysUnderAttack()
	EventPlaying = 1
	FOW_RevealGroup("EnemyCarrier", 1)
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoysUnderAttack")
	Rule_Remove("Rule_IntelEvent_convoysUnderAttack")
end

function Rule_spawnEscorts()
	NumPlayerInterceptors = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "Hgn_Interceptor")
	if (NumPlayerInterceptors < 2) then
	SobGroup_Spawn("EscortInterceptors1", "EscortSpawnSphere")
	SobGroup_Spawn("EscortInterceptors2", "EscortSpawnSphere")
	SobGroup_SwitchOwner("EscortInterceptors1", 0)
	SobGroup_SwitchOwner("EscortInterceptors2", 0)
	InterceptorEscortsGiven = 2
	elseif (NumPlayerInterceptors < 3) then
	SobGroup_Spawn("EscortInterceptors1", "EscortSpawnSphere")
	SobGroup_SwitchOwner("EscortInterceptors1", 0)
	InterceptorEscortsGiven = 1
	elseif (NumPlayerInterceptors == 0) then
	SobGroup_Spawn("EscortInterceptors1", "EscortSpawnSphere")
	SobGroup_Spawn("EscortInterceptors2", "EscortSpawnSphere")
	SobGroup_SwitchOwner("EscortInterceptors1", 0)
	SobGroup_SwitchOwner("EscortInterceptors2", 0)
	InterceptorEscortsGiven = 2
	end
	NumPlayerBombers = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "Hgn_AttackBomber")
	if (NumPlayerBombers < 2) then
	SobGroup_Spawn("EscortBombers1", "EscortSpawnSphere")
	SobGroup_SwitchOwner("EscortBombers1", 0)
	BomberEscortsGiven = 1
	elseif (NumPlayerBombers == 0) then
	SobGroup_Spawn("EscortBombers1", "EscortSpawnSphere")
	SobGroup_Spawn("EscortBombers2", "EscortSpawnSphere")
	SobGroup_SwitchOwner("EscortBombers1", 0)
	SobGroup_SwitchOwner("EscortBombers2", 0)
	BomberEscortsGiven = 2
	end
	if (InterceptorEscortsGiven > 0 or BomberEscortsGiven > 0) then
	Rule_AddInterval("EscortSetup", 1)
	Rule_Remove("Rule_spawnEscorts")
	end
end

function EscortSetup()
	if (InterceptorEscortsGiven == 2) then
	print("Doing Escort setup on 2 Interceptor squadrons!!")
	SobGroup_SetTeamColours("EscortInterceptors1", {0.365, 0.553, 0.667}, {0.8, 0.8, 0.8}, "DATA:Badges/Hiigaran.tga")
	SobGroup_ParadeSobGroup("EscortInterceptors1", "PlayerMothership", 0)
	SobGroup_SetTeamColours("EscortInterceptors2", {0.365, 0.553, 0.667}, {0.8, 0.8, 0.8}, "DATA:Badges/Hiigaran.tga")
	SobGroup_ParadeSobGroup("EscortInterceptors2", "PlayerMothership", 0)
	elseif (InterceptorEscortsGiven == 1) then
	print("Doing Escort setup on 1 Interceptor squadron!!")
	SobGroup_SetTeamColours("EscortInterceptors1", {0.365, 0.553, 0.667}, {0.8, 0.8, 0.8}, "DATA:Badges/Hiigaran.tga")
	SobGroup_ParadeSobGroup("EscortInterceptors1", "PlayerMothership", 0)
	end
	if (BomberEscortsGiven == 2) then
	print("Doing Escort setup on 2 Bomber squadrons!!")
	SobGroup_SetTeamColours("EscortBombers1", {0.365, 0.553, 0.667}, {0.8, 0.8, 0.8}, "DATA:Badges/Hiigaran.tga")
	SobGroup_ParadeSobGroup("EscortBombers1", "PlayerMothership", 0)
	SobGroup_SetTeamColours("EscortBombers2", {0.365, 0.553, 0.667}, {0.8, 0.8, 0.8}, "DATA:Badges/Hiigaran.tga")
	SobGroup_ParadeSobGroup("EscortBombers2", "PlayerMothership", 0)
	elseif (BomberEscortsGiven == 1) then
	print("Doing Escort setup on 1 Bomber squadron!!")
	SobGroup_SetTeamColours("EscortBombers1", {0.365, 0.553, 0.667}, {0.8, 0.8, 0.8}, "DATA:Badges/Hiigaran.tga")
	SobGroup_ParadeSobGroup("EscortBombers1", "PlayerMothership", 0)
	end
	Rule_Remove("EscortSetup")
end

function Rule_IntelEvent_RecommendCollectors()
	NumPlayerCollectors = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "Hgn_ResourceCollector")
	if (OpeningEventFinished == 1) then
	if (NumPlayerCollectors<2) then
	Rule_AddInterval("Rule_IntelEvent_RecommendCollectorsPLAYEVENT", 7)
	Rule_Remove("Rule_IntelEvent_RecommendCollectors")
	end
	elseif (OpeningEventFinished == 1) then
	if (NumPlayerCollectors == 0) then
	Rule_AddInterval("Rule_IntelEvent_RecommendCollectorsPLAYEVENT", 7)
	Rule_Remove("Rule_IntelEvent_RecommendCollectors")
	end
	end
end

function Rule_IntelEvent_RecommendCollectorsPLAYEVENT()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_RecommendCollectors")
	Rule_AddInterval("Rule_checkForPlayerBuildingCollectors", 5)
	Rule_Remove("Rule_IntelEvent_RecommendCollectorsPLAYEVENT")
	end
end

function Rule_checkForPlayerBuildingCollectors()
	SobGroup_FillShipsByType("PlayerCollectors", "Player_Ships0", "Hgn_ResourceCollector")
	if (SobGroup_Count("PlayerCollectors") > 1) then
	Objective_SetState(obj_sec_buildCollectors_id, OS_Complete)
	Rule_Remove("Rule_checkForPlayerBuildingCollectors")
	end
end

function Rule_IntelEvent_mothershipMoved()
	if (EventPlaying == 0 and SobGroup_IsDoingAbility("PlayerMothership", AB_Move) == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_firstMSMove")
	Rule_Remove("Rule_IntelEvent_mothershipMoved")
	end
end

function Rule_checkCorvetteSubsystemComplete()
	if (SobGroup_GetHardPointHealth("PlayerMothership", "Production 2") > 0) then
	print("Corvette hardpoint has some health!")
	Sound_SetMuteActor("Fleet")
	Player_UnrestrictBuildOption(0, "Hgn_AssaultCorvette")
	Rule_Add("Rule_intelevent_corvetteSubsystemComplete")
	Rule_Remove("Rule_checkCorvetteSubsystemComplete")
	end
end

function Rule_intelevent_corvetteSubsystemComplete()
	if (EventPlaying == 0 and SobGroup_GetHardPointHealth("PlayerMothership", "Production 2") > 0) then
	print("Playing Corvette subsystem event!")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_corvetteSubsystemComplete")
	Timer_Start("PulsarCorvetteTimer", 100)
	Rule_Add("Rule_intelevent_pulsarCorvetteAvailable")
	Rule_Remove("Rule_intelevent_corvetteSubsystemComplete")
	end
end

function Rule_intelevent_pulsarCorvetteAvailable()
	if (EventPlaying == 0 and Timer_GetRemaining("PulsarCorvetteTimer") < 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sound_SetMuteActor("Fleet")
	Event_Start("intelevent_pulsarCorvetteAvailable")
	Rule_Remove("Rule_intelevent_pulsarCorvetteAvailable")
	end
end

function Rule_intelevent_recommendCorvettes()
	if (EventPlaying == 0) then
	if (evt_corvetteSubsystemComplete_started == 1) then
	if (NIS02B_Playing == 0) then
	if (SobGroup_Empty("Convoy1Bombers1") == 1) then
	if (SobGroup_Empty("Convoy1Bombers2") == 1) then
	if (SobGroup_Empty("Convoy1Bombers3") == 1) then
	if (SobGroup_Empty("Convoy2Bombers2") == 1) then
	if (SobGroup_Empty("Convoy2Bombers3") == 1) then
	if (initialReinforcementsLaunched == 1) then
	if (SobGroup_Empty("Convoy3Bombers1") == 1) then
	end
	if (SobGroup_Empty("Convoy4Bombers1") == 1) then
	if (SobGroup_Empty("Convoy5Bombers1") == 1) then
	if (convoy3ReinforceONCE ~= 1 or HW2_IsRunTimeSobGroupAlive(Convoy3Bombers2) ~= 1) then
	if (convoy3ReinforceONCE ~= 1 or HW2_IsRunTimeSobGroupAlive(Convoy3Bombers3) ~= 1) then
	if (convoy4ReinforceONCE ~= 1 or HW2_IsRunTimeSobGroupAlive(Convoy4Bombers2) ~= 1) then
	if (convoy4ReinforceONCE ~= 1 or HW2_IsRunTimeSobGroupAlive(Convoy4Bombers3) ~= 1) then
	if (convoy5ReinforceONCE ~= 1 or HW2_IsRunTimeSobGroupAlive(Convoy5Bombers2) ~= 1) then
	if (convoy5ReinforceONCE ~= 1 or HW2_IsRunTimeSobGroupAlive(Convoy5Bombers3) ~= 1) then
	if (convoy6ReinforceONCE ~= 1 or HW2_IsRunTimeSobGroupAlive(Convoy6Bombers2) ~= 1) then
	if (convoy6ReinforceONCE == 1 and HW2_IsRunTimeSobGroupAlive(Convoy6Bombers3) == 1) then
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_recommendCorvettes")
	Rule_Remove("Rule_intelevent_recommendCorvettes")
	end
	end
	end
	end
end

function Rule_spawnEliteFighters1()
	EliteFighters1 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite")
	SobGroup_SetTeamColours(EliteFighters1, {1, 1, 1}, {0, 0, 0}, "DATA:Badges/Hiigaran.tga")
	Rule_AddInterval("Rule_spawnEliteFighters2", 7)
	Rule_Remove("Rule_spawnEliteFighters1")
end

function Rule_spawnEliteFighters2()
	EliteFighters2 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite")
	SobGroup_SetTeamColours(EliteFighters2, {1, 1, 1}, {0, 0, 0}, "DATA:Badges/Hiigaran.tga")
	Rule_AddInterval("Rule_spawnEliteFighters3", 7)
	Rule_Remove("Rule_spawnEliteFighters2")
end

function Rule_spawnEliteFighters3()
	EliteFighters3 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite")
	SobGroup_SetTeamColours(EliteFighters3, {1, 1, 1}, {0, 0, 0}, "DATA:Badges/Hiigaran.tga")
	Rule_AddInterval("Rule_spawnEliteFighters4", 7)
	Rule_Remove("Rule_spawnEliteFighters3")
end

function Rule_spawnEliteFighters4()
	EliteFighters4 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite")
	SobGroup_SetTeamColours(EliteFighters4, {1, 1, 1}, {0, 0, 0}, "DATA:Badges/Hiigaran.tga")
	Rule_Remove("Rule_spawnEliteFighters4")
end

function Rule_spawnEliteCorvettes1()
	EliteCorvettes1 = SobGroup_CreateShip("PlayerMothership", "Hgn_AssaultCorvetteElite")
	SobGroup_SetTeamColours(EliteCorvettes1, {1, 1, 1}, {0, 0, 0}, "DATA:Badges/Hiigaran.tga")
	Rule_AddInterval("Rule_spawnEliteCorvettes2", 7)
	Rule_Remove("Rule_spawnEliteCorvettes1")
end

function Rule_spawnEliteCorvettes2()
	EliteCorvettes2 = SobGroup_CreateShip("PlayerMothership", "Hgn_AssaultCorvetteElite")
	SobGroup_SetTeamColours(EliteCorvettes2, {1, 1, 1}, {0, 0, 0}, "DATA:Badges/Hiigaran.tga")
	Rule_Remove("Rule_spawnEliteCorvettes2")
end

function Rule_convoyLostWatch()
	if (convoy1LostONCE == 0 and EventPlaying == 0 and SobGroup_Empty("Convoy_1") == 1 and NIS02B_Playing == 0) then
	print("Convoy 1 is lost! Setting convoy1LostONCE to 1")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_1_Lost")
	convoy1LostONCE = 1
	end
	if (convoy2LostONCE == 0 and EventPlaying == 0 and SobGroup_Empty("Convoy_2") == 1 and NIS02B_Playing == 0) then
	print("Convoy 2 is lost! Setting convoy2LostONCE to 1")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_2_Lost")
	convoy2LostONCE = 1
	end
	if (convoy3LostONCE == 0 and EventPlaying == 0 and SobGroup_Empty("Convoy_3") == 1 and NIS02B_Playing == 0) then
	print("Convoy 3 is lost! Setting convoy3LostONCE to 1")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_3_Lost")
	convoy3LostONCE = 1
	end
	if (convoy4LostONCE == 0 and EventPlaying == 0 and SobGroup_Empty("Convoy_4") == 1 and NIS02B_Playing == 0) then
	print("Convoy 4 is lost! Setting convoy4LostONCE to 1")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_4_Lost")
	convoy4LostONCE = 1
	end
	if (convoy5LostONCE == 0 and EventPlaying == 0 and SobGroup_Empty("Convoy_5") == 1 and NIS02B_Playing == 0) then
	print("Convoy 5 is lost! Setting convoy5LostONCE to 1")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_5_Lost")
	convoy5LostONCE = 1
	end
	if (convoy6LostONCE == 0 and EventPlaying == 0 and SobGroup_Empty("Convoy_6") == 1 and NIS02B_Playing == 0) then
	print("Convoy 6 is lost! Setting convoy6LostONCE to 1")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_6_Lost")
	convoy6LostONCE = 1
	end
end

function Rule_convoyDeathWatch()
	if (convoy1_docked == 0 and convoy1DestroyedONCE == 0 and SobGroup_Empty("Convoy_1") == 1) then
	convoys_destroyed = (convoys_destroyed + 1)
	print("convoys destroyed:" ..convoys_destroyed)
	convoy1DestroyedONCE = 1
	end
	if (convoy2_docked == 0 and convoy2DestroyedONCE == 0 and SobGroup_Empty("Convoy_2") == 1) then
	convoys_destroyed = (convoys_destroyed + 1)
	print("convoys destroyed:" ..convoys_destroyed)
	convoy2DestroyedONCE = 1
	end
	if (convoy3_docked == 0 and convoy3DestroyedONCE == 0 and SobGroup_Empty("Convoy_3") == 1) then
	convoys_destroyed = (convoys_destroyed + 1)
	print("convoys destroyed:" ..convoys_destroyed)
	convoy3DestroyedONCE = 1
	end
	if (convoy4_docked == 0 and convoy4DestroyedONCE == 0 and SobGroup_Empty("Convoy_4") == 1) then
	convoys_destroyed = (convoys_destroyed + 1)
	print("convoys destroyed:" ..convoys_destroyed)
	convoy4DestroyedONCE = 1
	end
	if (convoy5_docked == 0 and convoy5DestroyedONCE == 0 and SobGroup_Empty("Convoy_5") == 1) then
	convoys_destroyed = (convoys_destroyed + 1)
	print("convoys destroyed:" ..convoys_destroyed)
	convoy5DestroyedONCE = 1
	end
	if (convoy6_docked == 0 and convoy6DestroyedONCE == 0 and SobGroup_Empty("Convoy_6") == 1) then
	convoys_destroyed = (convoys_destroyed + 1)
	print("convoys destroyed:" ..convoys_destroyed)
	convoy6DestroyedONCE = 1
	end
end

function Rule_IntelEvent_3convoys_Lost()
	if (EventPlaying == 0 and convoys_destroyed == 3 and NIS02B_Playing == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_3convoys_Lost")
	Rule_Remove("Rule_IntelEvent_3convoys_Lost")
	end
end

function Rule_convoySavedWatch()
	if (EventPlaying == 0) then
	if (convoy1SavedONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (SobGroup_Empty("Convoy1Bombers1") == 1) then
	if (SobGroup_Empty("Convoy1Bombers2") == 1) then
	if (SobGroup_Empty("Convoy1Bombers3") == 1) then
	if (SobGroup_Empty("Convoy_1") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_1_Saved")
	convoy1SavedONCE = 1
	SobGroup_SetSpeed("Convoy_1", 3)
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy2SavedONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (SobGroup_Empty("Convoy2Bombers2") == 1) then
	if (SobGroup_Empty("Convoy2Bombers3") == 1) then
	if (SobGroup_Empty("Convoy_2") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_2_Saved")
	convoy2SavedONCE = 1
	SobGroup_SetSpeed("Convoy_2", 3)
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy3Reinforcements == 1) then
	if (convoy3SavedONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (SobGroup_Empty("Convoy3Bombers1") == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy3Bombers2) == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy3Bombers3) == 1) then
	if (SobGroup_Empty("Convoy_3") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_3_Saved")
	convoy3SavedONCE = 1
	SobGroup_SetSpeed("Convoy_3", 5)
	Rule_Add("Rule_SlowConvoy3Down")
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy3ReinforceONCE == 0) then
	if (convoy3SavedONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy3Bombers1") == 1) then
	if (SobGroup_Empty("Convoy_3") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_3_Saved")
	convoy3SavedONCE = 1
	SobGroup_SetSpeed("Convoy_3", 5)
	Rule_Add("Rule_SlowConvoy3Down")
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy4SavedONCE == 0) then
	if (convoy4ReinforceONCE == 1) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy4 == 0) then
	if (SobGroup_Empty("Convoy4Bombers1") == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy4Bombers2) == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy4Bombers3) == 1) then
	if (SobGroup_Empty("Convoy_4") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_4_Saved")
	convoy4SavedONCE = 1
	SobGroup_SetSpeed("Convoy_4", 3)
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy4SavedONCE == 0) then
	if (convoy4ReinforceONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy4 == 0) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy4Bombers1") == 1) then
	if (SobGroup_Empty("Convoy_4") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_4_Saved")
	convoy4SavedONCE = 1
	SobGroup_SetSpeed("Convoy_4", 3)
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy4SavedONCE == 0) then
	if (convoy4ReinforceONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy4 == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy4Bombers1") == 1) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_Empty("Convoy_4") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_4_Saved")
	convoy4SavedONCE = 1
	SobGroup_SetSpeed("Convoy_4", 3)
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy4SavedONCE == 0) then
	if (convoy4ReinforceONCE == 1) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy4 == 1) then
	if (SobGroup_Empty("Convoy4Bombers1") == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy4Bombers2) == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy4Bombers3) == 1) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_Empty("Convoy_4") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_4_Saved")
	convoy4SavedONCE = 1
	SobGroup_SetSpeed("Convoy_4", 3)
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy5SavedONCE == 0) then
	if (convoy5ReinforceONCE == 1) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy5 == 0) then
	if (SobGroup_Empty("Convoy5Bombers1") == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy5Bombers2) == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy5Bombers3) == 1) then
	if (SobGroup_Empty("Convoy_5") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_5_Saved")
	convoy5SavedONCE = 1
	SobGroup_SetSpeed("Convoy_5", 5)
	Rule_Add("Rule_SlowConvoy5Down")
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy5SavedONCE == 0) then
	if (convoy5ReinforceONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy5 == 0) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy5Bombers1") == 1) then
	if (SobGroup_Empty("Convoy_5") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_5_Saved")
	convoy5SavedONCE = 1
	SobGroup_SetSpeed("Convoy_5", 5)
	Rule_Add("Rule_SlowConvoy5Down")
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy5SavedONCE == 0) then
	if (convoy5ReinforceONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy5 == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy5Bombers1") == 1) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_Empty("Convoy_5") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_5_Saved")
	convoy5SavedONCE = 1
	SobGroup_SetSpeed("Convoy_5", 5)
	Rule_Add("Rule_SlowConvoy5Down")
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy5SavedONCE == 0) then
	if (convoy5ReinforceONCE == 1) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy5 == 1) then
	if (SobGroup_Empty("Convoy5Bombers1") == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy5Bombers2) == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy5Bombers3) == 1) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_Empty("Convoy_5") == 0) then
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_5_Saved")
	convoy5SavedONCE = 1
	SobGroup_SetSpeed("Convoy_5", 5)
	Rule_Add("Rule_SlowConvoy5Down")
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy6SavedONCE == 0) then
	if (Convoy6InitialAttackLaunched == 1) then
	if (convoy6ReinforceONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy6 == 0) then
	if (SobGroup_Empty("Convoy6Bombers1") == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy_6") == 0) then
	print("Convoy 6 saved in FIRST check")
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_6_Saved")
	convoy6SavedONCE = 1
	SobGroup_SetSpeed("Convoy_6", 5)
	Rule_Add("Rule_SlowConvoy6Down")
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy6SavedONCE == 0) then
	if (Convoy6InitialAttackLaunched == 1) then
	if (convoy6ReinforceONCE == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy6 == 1) then
	if (SobGroup_Empty("Convoy6Bombers1") == 1) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy_6") == 0) then
	print("Convoy 6 saved in SECOND check")
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_6_Saved")
	convoy6SavedONCE = 1
	SobGroup_SetSpeed("Convoy_6", 5)
	Rule_Add("Rule_SlowConvoy6Down")
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy6SavedONCE == 0) then
	if (Convoy6InitialAttackLaunched == 1) then
	if (convoy6ReinforceONCE == 1) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy6 == 0) then
	if (SobGroup_Empty("Convoy6Bombers1") == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy6Bombers2) == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy6Bombers3) == 1) then
	if (SobGroup_Empty("Convoy_6") == 0) then
	print("Convoy 6 saved in THIRD check")
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_6_Saved")
	convoy6SavedONCE = 1
	SobGroup_SetSpeed("Convoy_6", 5)
	Rule_Add("Rule_SlowConvoy6Down")
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (EventPlaying == 0) then
	if (convoy6SavedONCE == 0) then
	if (Convoy6InitialAttackLaunched == 1) then
	if (convoy6ReinforceONCE == 1) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy6 == 1) then
	if (SobGroup_Empty("Convoy6Bombers1") == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy6Bombers2) == 1) then
	if (HW2_IsRunTimeSobGroupEmpty(Convoy6Bombers3) == 1) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_Empty("Convoy_6") == 0) then
	print("Convoy 6 saved in FOURTH check")
	convoys_saved = (convoys_saved + 1)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_6_Saved")
	convoy6SavedONCE = 1
	SobGroup_SetSpeed("Convoy_6", 5)
	Rule_Add("Rule_SlowConvoy6Down")
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	if (convoy6SavedONCE == 0) then
	if (Convoy6InitialAttackLaunched == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy6 == 1) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy_6") == 0) then
	print("Convoy 6 saved in FIFTH check")
	convoys_saved = (convoys_saved + 1)
	convoy6SavedONCE = 1
	Ping_Remove(ping_Convoy_6_id)
	SobGroup_SetSpeed("Convoy_6", 5)
	Rule_Add("Rule_SlowConvoy6Down")
	end
	end
	end
	end
	end
	end
	end
	if (convoy6SavedONCE == 0) then
	if (Convoy6InitialAttackLaunched == 0) then
	if (NIS02B_Playing == 0) then
	if (frigatesAttackingConvoy6 == 0) then
	if (frigatesAttackingMelarnFleet == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (SobGroup_Empty("Convoy_6") == 0) then
	print("Convoy 6 saved in SIXTH check")
	convoys_saved = (convoys_saved + 1)
	convoy6SavedONCE = 1
	Ping_Remove(ping_Convoy_6_id)
	SobGroup_SetSpeed("Convoy_6", 5)
	Rule_Add("Rule_SlowConvoy6Down")
	end
	end
	end
	end
	end
	end
	end
end

function Rule_SlowConvoy3Down()
	if (SobGroup_FillProximitySobGroup("tempSobGroup", "PlayerMothership", "Convoy_3", 3000) == 1) then
	SobGroup_SetSpeed("Convoy_3", 3)
	Rule_Remove("Rule_SlowConvoy3Down")
	end
end

function Rule_SlowConvoy5Down()
	if (SobGroup_FillProximitySobGroup("tempSobGroup", "PlayerMothership", "Convoy_5", 3000) == 1) then
	SobGroup_SetSpeed("Convoy_5", 3)
	Rule_Remove("Rule_SlowConvoy5Down")
	end
end

function Rule_SlowConvoy6Down()
	if (SobGroup_FillProximitySobGroup("tempSobGroup", "PlayerMothership", "Convoy_6", 3000) == 1) then
	SobGroup_SetSpeed("Convoy_6", 3)
	Rule_Remove("Rule_SlowConvoy6Down")
	end
end

function Rule_convoyRewardWatch()
	if (convoyReward1ONCE == 0 and EventPlaying == 0 and convoys_docked == 1 and NIS02B_Playing == 0) then
	rewardEventPlaying = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_Reward1")
	convoyReward1ONCE = 1
	end
	if (convoyReward2ONCE == 0 and EventPlaying == 0 and convoys_docked == 2 and NIS02B_Playing == 0) then
	rewardEventPlaying = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_Reward2")
	convoyReward2ONCE = 1
	end
	if (convoyReward3ONCE == 0 and EventPlaying == 0 and convoys_docked == 3 and NIS02B_Playing == 0) then
	rewardEventPlaying = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_Reward3")
	convoyReward3ONCE = 1
	end
	if (convoyReward4ONCE == 0 and EventPlaying == 0 and convoys_docked == 4 and NIS02B_Playing == 0) then
	rewardEventPlaying = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_Reward4")
	convoyReward4ONCE = 1
	end
	if (convoyReward5ONCE == 0 and EventPlaying == 0 and convoys_docked == 5 and NIS02B_Playing == 0) then
	rewardEventPlaying = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_Reward5")
	convoyReward5ONCE = 1
	end
	if (convoyReward6ONCE == 0 and EventPlaying == 0 and convoys_docked == 6 and NIS02B_Playing == 0) then
	rewardEventPlaying = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_Reward6")
	convoyReward6ONCE = 1
	end
end

function Rule_reinforcementWatch()
	if (Player_FillProximitySobGroup("tempSobGroup", 0, "EnemyCarrier", 5000) == 1) then
	SobGroup_FillShipsByType("BombersNearEnemyCarrier", "tempSobGroup", "Hgn_AttackBomber")
	print("Found some ships near the Carrier!")
	end
	if (convoys_saved ~= 2) then
	if (convoys_saved ~= 1 or convoys_destroyed ~= 1) then
	if (convoys_destroyed ~= 2) then
	if (convoys_docked == 1) then
	end
	end
	end
	if (ReinforcementEventHasPlayed == 0) then
	print("Playing reinforcement event from FIRST check!")
	ReinforcementEventHasPlayed = 1
	Rule_AddInterval("Rule_launchReinforcements", 8)
	Rule_Remove("Rule_reinforcementWatch")
	end
	end
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") >= 0.9) then
	if (SobGroup_Empty("BombersNearEnemyCarrier") ~= 0) then
	if (SobGroup_HealthPercentage("EnemyCarrier") < 0.8) then
	end
	end
	if (ReinforcementEventHasPlayed == 0) then
	Rule_Add("Rule_lockFighterFacilityHealth")
	print("Playing reinforcement event from SECOND check!")
	ReinforcementEventHasPlayed = 1
	Rule_Add("Rule_launchReinforcements")
	Rule_Remove("Rule_reinforcementWatch")
	end
	end
end

function Rule_launchReinforcements()
	if (EventPlaying == 0) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_enemyReinforcements")
	else
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_EnableToggle(0)
	Event_Start("intelevent_enemyReinforcements")
	end
	Rule_AddInterval("Rule_StaggerLaunch1", 1)
	initialReinforcementsLaunched = 1
	Rule_AddInterval("Rule_AttackRemainingConvoys", 1)
	Timer_Start("AttackRemainingConvoysTIMER", 100)
	Rule_Remove("Rule_launchReinforcements")
	end
end

function Rule_StaggerLaunch1()
	SobGroup_Launch("Convoy3Bombers1", "EnemyCarrier")
	Rule_AddInterval("Rule_reinforcementSetup1", 6)
	Rule_Remove("Rule_StaggerLaunch1")
end

function Rule_StaggerLaunch2()
	SobGroup_Launch("Convoy3Interceptors1", "EnemyCarrier")
	Rule_AddInterval("Rule_reinforcementSetup2", 6)
	Rule_Remove("Rule_StaggerLaunch2")
end

function Rule_StaggerLaunch3()
	SobGroup_Launch("Convoy4Bombers1", "EnemyCarrier")
	Rule_AddInterval("Rule_reinforcementSetup3", 6)
	Rule_Remove("Rule_StaggerLaunch3")
end

function Rule_StaggerLaunch4()
	SobGroup_Launch("Convoy4Interceptors1", "EnemyCarrier")
	Rule_AddInterval("Rule_reinforcementSetup4", 6)
	Rule_Remove("Rule_StaggerLaunch4")
end

function Rule_StaggerLaunch5()
	SobGroup_Launch("Convoy5Bombers1", "EnemyCarrier")
	Rule_AddInterval("Rule_reinforcementSetup5", 6)
	Rule_Remove("Rule_StaggerLaunch5")
end

function Rule_StaggerLaunch6()
	SobGroup_Launch("Convoy5Interceptors1", "EnemyCarrier")
	Rule_AddInterval("Rule_reinforcementSetup6", 6)
	Rule_Remove("Rule_StaggerLaunch6")
end

function Rule_reinforcementSetup1()
	SobGroup_Attack(1, "Convoy3Bombers1", "Convoy_3")
	SobGroup_SetTactics("Convoy3Bombers1", PassiveTactics)
	Rule_Add("Rule_StaggerLaunch2")
	Rule_Remove("Rule_reinforcementSetup1")
end

function Rule_reinforcementSetup2()
	SobGroup_GuardSobGroup("Convoy3Interceptors1", "Convoy3Bombers1")
	Rule_Add("Rule_StaggerLaunch3")
	Rule_Remove("Rule_reinforcementSetup2")
end

function Rule_reinforcementSetup3()
	SobGroup_Attack(1, "Convoy4Bombers1", "Convoy_4")
	SobGroup_SetTactics("Convoy4Bombers1", PassiveTactics)
	Rule_Add("Rule_StaggerLaunch4")
	Rule_Remove("Rule_reinforcementSetup3")
end

function Rule_reinforcementSetup4()
	SobGroup_GuardSobGroup("Convoy4Interceptors1", "Convoy4Bombers1")
	Rule_Add("Rule_StaggerLaunch5")
	Rule_Remove("Rule_reinforcementSetup4")
end

function Rule_reinforcementSetup5()
	SobGroup_Attack(1, "Convoy5Bombers1", "Convoy_5")
	SobGroup_SetTactics("Convoy5Bombers1", PassiveTactics)
	Rule_Add("Rule_StaggerLaunch6")
	Rule_Remove("Rule_reinforcementSetup5")
end

function Rule_reinforcementSetup6()
	SobGroup_GuardSobGroup("Convoy5Interceptors1", "Convoy5Bombers1")
	Rule_AddInterval("Rule_setLaunchFinishedVariable", 10)
	Rule_Remove("Rule_reinforcementSetup6")
end

function Rule_setLaunchFinishedVariable()
	Rule_Remove("Rule_lockFighterFacilityHealth")
	Rule_Remove("Rule_setLaunchFinishedVariable")
end

function Rule_lockFighterFacilityHealth()
	if (getFighterFacilityHealthONCE == 0) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") < 0.15) then
	print("Fighter Facility health is too low!!")
	getFighterFacilityHealthONCE = 1
	CurrentFighterFacilityHealth = SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1")
	end
	end
	if (getFighterFacilityHealthONCE == 1) then
	SobGroup_SetHardPointHealth("EnemyCarrier", "Production 1", CurrentFighterFacilityHealth)
	end
end

function Rule_lockFighterFacilityHealthREMOVE()
	Rule_Remove("Rule_lockFighterFacilityHealth")
	Rule_Remove("Rule_lockFighterFacilityHealthREMOVE")
end

function Rule_AttackRemainingConvoys()
	if (convoys_saved ~= 3) then
	if (Timer_GetRemaining("AttackRemainingConvoysTIMER") < 5) then
	end
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.1) then
	SobGroup_Launch("Convoy6Bombers1", "EnemyCarrier")
	SobGroup_Launch("Convoy6Interceptors1", "EnemyCarrier")
	Convoy6InitialAttackLaunched = 1
	Rule_AddInterval("Rule_reinforcementSetup7", 10)
	Rule_Remove("Rule_AttackRemainingConvoys")
	end
	end
end

function Rule_reinforcementSetup7()
	SobGroup_Attack(1, "Convoy6Bombers1", "Convoy_6")
	SobGroup_GuardSobGroup("Convoy6Interceptors1", "Convoy6Bombers1")
	Rule_Remove("Rule_reinforcementSetup7")
end

ConvoyDamaged = {0, 0, 0, 0, 0, 0}

function Rule_intelevent_convoysDamaged()
	for i = 1, 6 do
	if (EventPlaying == 0 and ConvoyDamaged[i] == 0 and SobGroup_HealthPercentage("Convoy_" ..i) < 0.3) then
	ConvoyDamaged[i] = 1
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_convoy_CriticalDamage_" ..i)
	end
	end
	if (ConvoyDamaged[1] == 1 and ConvoyDamaged[2] == 1 and ConvoyDamaged[3] == 1 and ConvoyDamaged[4] == 1 and ConvoyDamaged[5] == 1 and ConvoyDamaged[6] == 1) then
	Rule_Remove("Rule_intelevent_convoysDamaged")
	end
end

function Rule_intelevent_frigateAttack()
	if (NIS02B_Playing == 0) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_frigateAttack")
	else
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_EnableToggle(0)
	Event_Start("intelevent_frigateAttack")
	end
	Rule_Remove("Rule_intelevent_frigateAttack")
	end
end

function Rule_intelevent_melarnDamaged()
	if (EventPlaying == 0 and SobGroup_HealthPercentage("MelarnSoban") < 0.7 and tellMelarnToHyperspaceOut == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_melarnDamaged")
	Rule_Add("Rule_intelevent_melarnDestroyed")
	Rule_Remove("Rule_intelevent_melarnDamaged")
	end
end

function Rule_intelevent_melarnCriticallyDamaged()
	if (EventPlaying == 0 and SobGroup_HealthPercentage("MelarnSoban") < 0.3 and tellMelarnToHyperspaceOut == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_melarnCriticallyDamaged")
	Rule_Remove("Rule_intelevent_melarnCriticallyDamaged")
	end
end

function Rule_intelevent_melarnDestroyed()
	if (EventPlaying == 0 and SobGroup_Empty("MelarnSoban") == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_melarnDestroyed")
	Rule_Remove("Rule_intelevent_melarnDestroyed")
	end
end

function Rule_intelevent_carrierFleeing()
	if (EventPlaying == 0) then
	if (NIS02B_Playing == 0) then
	if (SobGroup_HealthPercentage("EnemyCarrier") > 0.15) then
	if (SobGroup_Empty("EnemyCarrier") == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_carrierFleeing")
	Rule_AddInterval("Rule_convoyAttackerEndWatch", 5)
	Rule_Remove("Rule_intelevent_carrierFleeing")
	end
	end
	end
	end
end

function Rule_intelevent_carrierEscaped()
	if (EventPlaying == 0 and SobGroup_IsInVolume("EnemyCarrier", "CarrierFleeSphere") == 1) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	print("Enemy Carrier is in the escape volume!!!!!!!")
	SobGroup_EnterHyperSpaceOffMap("EnemyCarrier")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Rule_AddInterval("Rule_intelevent_carrierEscapedSTARTEVENT", 1)
	Rule_Remove("Rule_intelevent_carrierEscaped")
	else
	Sensors_EnableToggle(0)
	print("Enemy Carrier is in the escape volume!!!!!!!")
	SobGroup_EnterHyperSpaceOffMap("EnemyCarrier")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Rule_AddInterval("Rule_intelevent_carrierEscapedSTARTEVENT", 1)
	Rule_Remove("Rule_intelevent_carrierEscaped")
	end
	end
end

function Rule_intelevent_carrierEscapedSTARTEVENT()
	Event_Start("intelevent_carrierEscaped")
	Rule_Remove("Rule_intelevent_carrierEscapedSTARTEVENT")
end

function Rule_intelevent_fighterFacilityDestroyed()
	if (EventPlaying == 0) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0) then
	if (NIS02B_Playing == 0) then
	if (SobGroup_Empty("EnemyCarrier") == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_fighterFacilityDestroyed")
	Rule_Remove("Rule_intelevent_fighterFacilityDestroyed")
	end
	end
	end
	end
end

function Rule_intelevent_carrierDestroyed()
	if (EventPlaying == 0 and carrierFlee == 1 and SobGroup_Empty("EnemyCarrier") == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Rule_Add("Rule_PlayStagingMusic")
	Event_Start("intelevent_carrierDestroyed")
	Rule_Add("Rule_checkFighterFacilityDestroyed")
	Rule_Remove("Rule_intelevent_carrierDestroyed")
	end
end

function Rule_checkFighterFacilityDestroyed()
	if (carrierDestroyed == 1) then
	if (Objective_GetState(obj_sec_destroyFighterFacility_id) ~= OS_Complete) then
	Objective_SetState(obj_sec_destroyFighterFacility_id, OS_Off)
	Rule_Remove("Rule_checkFighterFacilityDestroyed")
	end
	end
end

function Rule_intelevent_sobanLeaving()
	if (EventPlaying == 0 and carrierDestroyedHasPlayed == 1 and SobGroup_Empty("FrigateAttackers") == 1) then
	if (Sensors_ManagerIsUp() == 1) then
	Rule_Remove("Rule_melarnAttackWatch2_CaptainSoban")
	Rule_Remove("Rule_melarnAttackWatch3_CaptainSoban")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	SobGroup_SetInvulnerability("Player_Ships0", 1)
	Rule_AddInterval("Rule_intelevent_sobanLeaving2", 1)
	else
	Rule_Remove("Rule_melarnAttackWatch2_CaptainSoban")
	Rule_Remove("Rule_melarnAttackWatch3_CaptainSoban")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_EnableToggle(0)
	SobGroup_SetInvulnerability("Player_Ships0", 1)
	Rule_Add("Rule_intelevent_sobanLeaving2")
	end
	Rule_Remove("Rule_intelevent_sobanLeaving")
	end
end

function Rule_intelevent_sobanLeaving2()
	Event_Start("intelevent_sobanLeaving")
	Rule_Remove("Rule_intelevent_sobanLeaving2")
end

function Rule_intelevent_standbyForHyperspace()
	if (EventPlaying == 0) then
	if (convoy1_docked_and_launched == 1 or convoy1LostONCE == 1) then
	if (convoy2_docked_and_launched == 1 or convoy2LostONCE == 1) then
	if (convoy3_docked_and_launched == 1 or convoy3LostONCE == 1) then
	if (convoy4_docked_and_launched == 1 or convoy4LostONCE == 1) then
	if (convoy5_docked_and_launched == 1 or convoy5LostONCE == 1) then
	if (convoy6_docked_and_launched == 1 or convoy6LostONCE == 1) then
	if (tellMelarnToHyperspaceOut == 1) then
	if (Sensors_ManagerIsUp() == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	Objective_SetState(obj_prim_saveconvoys_id, OS_Complete)
	Rule_AddInterval("Rule_intelevent_standbyForHyperspace2", 1)
	Rule_Remove("Rule_intelevent_standbyForHyperspace")
	else
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	Objective_SetState(obj_prim_saveconvoys_id, OS_Complete)
	Event_Start("intelevent_standbyForHyperspace")
	Rule_Remove("Rule_intelevent_standbyForHyperspace")
	end
	end
	end
	end
	end
	end
	end
	end
	end
end

function Rule_intelevent_standbyForHyperspace2()
	Event_Start("intelevent_standbyForHyperspace")
	Rule_Remove("Rule_intelevent_standbyForHyperspace2")
end

convoyGroups = {"Convoy_1", "Convoy_2", "Convoy_3", "Convoy_4", "Convoy_5", "Convoy_6"}

function Rule_convoySetup()
	for i = 1, 6 do
	SobGroup_DockSobGroupAndStayDocked(convoyGroups[i], "PlayerMothership")
	end
	Rule_AddInterval("Rule_convoyDisableCommands", 1)
	Rule_Remove("Rule_convoySetup")
end

function Rule_convoyDisableCommands()
	local abilityList = {AB_Move, AB_Attack, AB_Guard, AB_Stop, AB_Hyperspace, AB_Retire, AB_Scuttle, AB_Parade}
	for i = 1, 6 do
	for j = 1, 8 do
	SobGroup_AbilityActivate(convoyGroups[i], abilityList[j], 0)
	end	
	end
	Rule_Remove("Rule_convoyDisableCommands")
end

function Rule_convoyDockWatch()
	if (convoy1LostONCE == 0 and convoy1_dockedONCE == 0 and SobGroup_IsDocked("Convoy_1") == 1) then
	print("Convoy 1 has docked!")
	convoy1_dockedONCE = 1
	convoy1_docked = 1
	convoys_docked = (convoys_docked + 1)
	SobGroup_SetHealth("Convoy_1", 1)
	SobGroup_SetHealth("Convoy_1", 1)
	Rule_AddInterval("Rule_Convoy1DockedAndLaunched", 10)
	end
	if (convoy2LostONCE == 0 and convoy2_dockedONCE == 0 and SobGroup_IsDocked("Convoy_2") == 1) then
	print("Convoy 2 has docked!")
	convoy2_dockedONCE = 1
	convoy2_docked = 1
	convoys_docked = (convoys_docked + 1)
	SobGroup_SetHealth("Convoy_2", 1)
	SobGroup_SetHealth("Convoy_2", 1)
	Rule_AddInterval("Rule_Convoy2DockedAndLaunched", 10)
	end
	if (convoy3LostONCE == 0 and convoy3_dockedONCE == 0 and SobGroup_IsDocked("Convoy_3") == 1) then
	print("Convoy 3 has docked!")
	convoy3_dockedONCE = 1
	convoy3_docked = 1
	convoys_docked = (convoys_docked + 1)
	SobGroup_SetHealth("Convoy_3", 1)
	SobGroup_SetHealth("Convoy_3", 1)
	Rule_AddInterval("Rule_Convoy3DockedAndLaunched", 10)
	end
	if (convoy4LostONCE == 0 and convoy4_dockedONCE == 0 and SobGroup_IsDocked("Convoy_4") == 1) then
	print("Convoy 4 has docked!")
	convoy4_dockedONCE = 1
	convoy4_docked = 1
	convoys_docked = (convoys_docked + 1)
	SobGroup_SetHealth("Convoy_4", 1)
	SobGroup_SetHealth("Convoy_4", 1)
	Rule_AddInterval("Rule_Convoy4DockedAndLaunched", 15)
	end
	if (convoy5LostONCE == 0 and convoy5_dockedONCE == 0 and SobGroup_IsDocked("Convoy_5") == 1) then
	print("Convoy 5 has docked!")
	convoy5_dockedONCE = 1
	convoy5_docked = 1
	convoys_docked = (convoys_docked + 1)
	SobGroup_SetHealth("Convoy_5", 1)
	SobGroup_SetHealth("Convoy_5", 1)
	Rule_AddInterval("Rule_Convoy5DockedAndLaunched", 10)
	end
	if (convoy6LostONCE == 0 and convoy6_dockedONCE == 0 and SobGroup_IsDocked("Convoy_6") == 1) then
	print("Convoy 6 has docked!")
	convoy6_dockedONCE = 1
	convoy6_docked = 1
	convoys_docked = (convoys_docked + 1)
	SobGroup_SetHealth("Convoy_6", 1)
	SobGroup_SetHealth("Convoy_6", 1)
	Rule_AddInterval("Rule_Convoy6DockedAndLaunched", 10)
	end
end

function Rule_Convoy1DockedAndLaunched()
	convoy1_docked_and_launched = 1
	Rule_Remove("Rule_Convoy1DockedAndLaunched")
end

function Rule_Convoy2DockedAndLaunched()
	convoy2_docked_and_launched = 1
	Rule_Remove("Rule_Convoy2DockedAndLaunched")
end

function Rule_Convoy3DockedAndLaunched()
	convoy3_docked_and_launched = 1
	Rule_Remove("Rule_Convoy3DockedAndLaunched")
end

function Rule_Convoy4DockedAndLaunched()
	convoy4_docked_and_launched = 1
	Rule_Remove("Rule_Convoy4DockedAndLaunched")
end

function Rule_Convoy5DockedAndLaunched()
	convoy5_docked_and_launched = 1
	Rule_Remove("Rule_Convoy5DockedAndLaunched")
end

function Rule_Convoy6DockedAndLaunched()
	convoy6_docked_and_launched = 1
	Rule_Remove("Rule_Convoy6DockedAndLaunched")
end

function Rule_convoyLaunchWatch()
	if (convoy1_launchedONCE == 0 and convoy1_dockedONCE == 1 and rewardEventHasStarted == 1 and rewardEventPlaying == 0) then
	Rule_AddInterval("Rule_convoy1Launch", 1)
	convoy1_launchedONCE = 1
	end
	if (convoy2_launchedONCE == 0 and convoy2_dockedONCE == 1 and rewardEventHasStarted == 1 and rewardEventPlaying == 0) then
	Rule_AddInterval("Rule_convoy2Launch", 1)
	convoy2_launchedONCE = 1
	end
	if (convoy3_launchedONCE == 0 and convoy3_dockedONCE == 1 and rewardEventHasStarted == 1 and rewardEventPlaying == 0) then
	Rule_AddInterval("Rule_convoy3Launch", 1)
	convoy3_launchedONCE = 1
	end
	if (convoy4_launchedONCE == 0 and convoy4_dockedONCE == 1 and rewardEventHasStarted == 1 and rewardEventPlaying == 0) then
	Rule_AddInterval("Rule_convoy4Launch", 1)
	convoy4_launchedONCE = 1
	end
	if (convoy5_launchedONCE == 0 and convoy5_dockedONCE == 1 and rewardEventHasStarted == 1 and rewardEventPlaying == 0) then
	Rule_AddInterval("Rule_convoy5Launch", 1)
	convoy5_launchedONCE = 1
	end
	if (convoy6_launchedONCE == 0 and convoy6_dockedONCE == 1 and rewardEventHasStarted == 1 and rewardEventPlaying == 0) then
	Rule_AddInterval("Rule_convoy6Launch", 1)
	convoy6_launchedONCE = 1
	end
end

function Rule_convoy1Launch()
	print("Telling Convoy 1 to launch!")
	SobGroup_Launch("Convoy_1", "PlayerMothership")
	Rule_Remove("Rule_convoy1Launch")
end

function Rule_convoy2Launch()
	print("Telling Convoy 2 to launch!")
	SobGroup_Launch("Convoy_2", "PlayerMothership")
	Rule_Remove("Rule_convoy2Launch")
end

function Rule_convoy3Launch()
	print("Telling Convoy 3 to launch!")
	SobGroup_Launch("Convoy_3", "PlayerMothership")
	Rule_Remove("Rule_convoy3Launch")
end

function Rule_convoy4Launch()
	print("Telling Convoy 4 to launch!")
	SobGroup_Launch("Convoy_4", "PlayerMothership")
	Rule_Remove("Rule_convoy4Launch")
end

function Rule_convoy5Launch()
	print("Telling Convoy 5 to launch!")
	SobGroup_Launch("Convoy_5", "PlayerMothership")
	Rule_Remove("Rule_convoy5Launch")
end

function Rule_convoy6Launch()
	print("Telling Convoy 6 to launch!")
	SobGroup_Launch("Convoy_6", "PlayerMothership")
	Rule_Remove("Rule_convoy6Launch")
end

function Rule_convoysReturnHome()
	for i = 1, 6 do
	if (SobGroup_Empty("Convoy_" ..i) == 0) then
	SobGroup_AbilityActivate("Convoy_" ..i, AB_Move, 1)
	SobGroup_Move(0, "Convoy_" ..i, "ConvoyExit" ..i)
	SobGroup_SwitchOwner("Convoy_" ..i, 3)
	end
	end
end

function Rule_combatSetup()
	SobGroup_GuardSobGroup("Convoy2Interceptors2", "Convoy2Bombers2")
	SobGroup_GuardSobGroup("Convoy2Interceptors3", "Convoy2Bombers3")
	SobGroup_DockSobGroupInstant("Convoy3Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy3Interceptors1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy4Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy4Interceptors1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy5Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy5Interceptors1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy6Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy6Interceptors1", "EnemyCarrier")
	SobGroup_Move(1, "EnemyCarrier", "CarrierMovePoint")
	Rule_Remove("Rule_combatSetup")
end

function Rule_carrierGuardWatch()
	if (SobGroup_Empty("FrigateAttackers") == 1 or SobGroup_HealthPercentage("EnemyCarrier") < 0.4) then
	print("Telling Carrier to FLEE!!! !!! !!! !!! !!!")
	SobGroup_SetSpeed("EnemyCarrier", 1.35)
	SobGroup_Move(1, "EnemyCarrier", "CarrierFleeSphere")
	carrierFlee = 1
	Rule_AddInterval("Rule_intelevent_carrierFleeing", 8)
	Rule_Remove("Rule_carrierGuardWatch")
	end
end

function Rule_slowCarrierDown()
	if (SobGroup_IsShipNearPoint("EnemyCarrier", "CarrierFleeSphere", 8500)) then
	SobGroup_SetSpeed("EnemyCarrier", 1)
	Rule_Add("Rule_slowCarrierDown2")
	Rule_Remove("Rule_slowCarrierDown")
	end
end

function Rule_slowCarrierDown2()
	if (SobGroup_IsShipNearPoint("EnemyCarrier", "CarrierFleeSphere", 3500)) then
	SobGroup_SetSpeed("EnemyCarrier", 0.75)
	Rule_Remove("Rule_slowCarrierDown2")
	end
end

function Rule_launchFirstCarrierGuard()
	if (carrierUnderAttack == 1 and SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0) then
	print("Creating **FIRST** Carrier Guard squadron!!")
	CarrierGuard = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
	Rule_AddInterval("Rule_carrierGuardSetup", 1)
	carrierUnderAttack = 0
	carrierGuardLaunch = (carrierGuardLaunch + 1)
	Rule_AddInterval("Rule_watchForCarrierUnderAttack", 1)
	Rule_Remove("Rule_launchFirstCarrierGuard")
	end
end

function Rule_watchForCarrierUnderAttack()
	if (carrierGuardLaunch < 4) then
	if (carrierUnderAttack == 1) then
	if (SobGroup_Empty("EnemyCarrier") == 0) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0) then
	if (HW2_IsRunTimeSobGroupEmpty(CarrierGuard) == 1) then
	print("Creating new Carrier Guard squadron!!")
	CarrierGuard = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
	Rule_AddInterval("Rule_carrierGuardSetup", 1)
	carrierUnderAttack = 0
	carrierGuardLaunch = (carrierGuardLaunch + 1)
	end
	end
	end
	end
	elseif (carrierGuardLaunch == 3) then
	print("Not creating any more Carrier Guard squadrons ever again!!")
	Rule_Remove("Rule_watchForCarrierUnderAttack")
	end
end

function Rule_carrierGuardSetup()
	if (SobGroup_Empty("EnemyCarrier") == 0) then
	SobGroup_GuardSobGroup(CarrierGuard, "EnemyCarrier")
	SobGroup_SetTactics(CarrierGuard, AggressiveTactics)
	end
	Rule_Remove("Rule_carrierGuardSetup")
end

function Rule_checkCarrierHealth()
	oldCarrierHealth = SobGroup_HealthPercentage("EnemyCarrier")
	oldSubsystemHealth = SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1")
	Rule_AddInterval("Rule_checkCarrierHealthLater", 5)
	Rule_Remove("Rule_checkCarrierHealth")
end

function Rule_checkCarrierHealthLater()
	newCarrierHealth = SobGroup_HealthPercentage("EnemyCarrier")
	newSubsystemHealth = SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1")
	if (newCarrierHealth < oldCarrierHealth or newSubsystemHealth < oldSubsystemHealth) then
	carrierUnderAttack = 1
	else
	carrierUnderAttack = 0
	end
	Rule_Add("Rule_checkCarrierHealth")
	Rule_Remove("Rule_checkCarrierHealthLater")
end

function Rule_startAttackOnConvoy1()
	if (Universe_GameTime() >= (g_now_time + 5)) then
	SobGroup_Attack(1, "Convoy1Bombers1", "Convoy_1")
	SobGroup_Attack(1, "Convoy1Bombers2", "Convoy_1")
	SobGroup_Attack(1, "Convoy1Bombers3", "Convoy_1")
	SobGroup_Attack(1, "Convoy2Bombers2", "Convoy_2")
	SobGroup_Attack(1, "Convoy2Bombers3", "Convoy_2")
	Rule_AddInterval("Rule_ConvoyAttackWatch", 3)
	Rule_Remove("Rule_startAttackOnConvoy1")
	end
end

interceptorGroups = {"Convoy2Interceptors2", "Convoy2Interceptors3"}
targetGroups = {"Convoy2Bombers2", "Convoy2Bombers3"}

function Rule_InitializeInterceptorTargets()
	for i = 1, 2 do
	SobGroup_GuardSobGroup(interceptorGroups[i], targetGroups[i])
	end
	Rule_AddInterval("Rule_CheckInterceptorTargets", 3)
	Rule_Remove("Rule_InitializeInterceptorTargets")
end

function FindNextAvailableTarget()
	for i = 1, 2 do
	if (SobGroup_Empty(targetGroups[i]) == 0) then
	return i
	end
	end
	return -1
end

function Rule_CheckInterceptorTargets()
	for i = 1, 2 do
	if (SobGroup_Empty(targetGroups[i]) == 1) then
	local newTarget = FindNextAvailableTarget(i)
	if (newTarget == -1 or convoy2_docked == 1) then
	SobGroup_ParadeSobGroup("Convoy2Interceptors2", "EnemyCarrier", 0)
	SobGroup_ParadeSobGroup("Convoy2Interceptors3", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy2Interceptors2", AggressiveTactics)
	SobGroup_SetTactics("Convoy2Interceptors3", AggressiveTactics)
	Rule_Remove("Rule_CheckInterceptorTargets")
	return
	end
	targetGroups[i] = targetGroups[newTarget]
	SobGroup_GuardSobGroup(interceptorGroups[i], targetGroups[i])
	end
	end
end

function Rule_InitializeInterceptor3Targets()
	for i = 1, 3 do
	SobGroup_GuardSobGroup(interceptor3Groups[i], target3Groups[i])
	end
	Rule_AddInterval("Rule_CheckInterceptorTargets3", 3)
	Rule_Remove("Rule_InitializeInterceptor3Targets")
end

function Rule_FindNextAvailableTarget3()
	for i = 1, 3 do
	if (SobGroup_Empty(target3Groups[i]) == 0) then
	return i
	end
	end
	return -1
end

function Rule_CheckInterceptorTargets3()
	for i = 1, 3 do
	if (SobGroup_Empty(target3Groups[i]) == 1) then
	local newTarget = Rule_FindNextAvailableTarget3(i)
	if (newTarget == -1 or convoy3_docked == 1) then
	SobGroup_ParadeSobGroup("Convoy3Interceptors1", "EnemyCarrier", 0)
	SobGroup_ParadeSobGroup("Convoy3Interceptors2", "EnemyCarrier", 0)
	SobGroup_ParadeSobGroup("Convoy3Interceptors3", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy3Interceptors1", AggressiveTactics)
	SobGroup_SetTactics("Convoy3Interceptors2", AggressiveTactics)
	SobGroup_SetTactics("Convoy3Interceptors3", AggressiveTactics)
	Rule_Remove("Rule_CheckInterceptorTargets3")
	return
	end
	target3Groups[i] = target3Groups[newTarget]
	SobGroup_GuardSobGroup(interceptor3Groups[i], target3Groups[i])
	end
	end
end

function Rule_InitializeInterceptor4Targets()
	for i = 1, 3 do
	SobGroup_GuardSobGroup(interceptor4Groups[i], target4Groups[i])
	end
	Rule_AddInterval("Rule_CheckInterceptorTargets4", 3)
	Rule_Remove("Rule_InitializeInterceptor4Targets")
end

function Rule_FindNextAvailableTarget4()
	for i = 1, 3 do
	if (SobGroup_Empty(target4Groups[i]) == 0) then
	return i
	end
	end
	return -1
end

function Rule_CheckInterceptorTargets4()
	for i = 1, 3 do
	if (SobGroup_Empty(target4Groups[i]) == 1) then
	local newTarget = Rule_FindNextAvailableTarget4(i)
	if (newTarget == -1 or convoy4_docked == 1) then
	SobGroup_ParadeSobGroup("Convoy4Interceptors1", "EnemyCarrier", 0)
	SobGroup_ParadeSobGroup("Convoy4Interceptors2", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy4Interceptors2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy4Interceptors3", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy4Interceptors3", AggressiveTactics)
	SobGroup_SetTactics("Convoy4Interceptors1", AggressiveTactics)
	Rule_Remove("Rule_CheckInterceptorTargets4")
	return
	end
	target4Groups[i] = target4Groups[newTarget]
	SobGroup_GuardSobGroup(interceptor4Groups[i], target4Groups[i])
	end
	end
end

function Rule_InitializeInterceptor5Targets()
	for i = 1, 3 do
	SobGroup_GuardSobGroup(interceptor5Groups[i], target5Groups[i])
	end
	Rule_AddInterval("Rule_CheckInterceptorTargets5", 3)
	Rule_Remove("Rule_InitializeInterceptor5Targets")
end

function Rule_FindNextAvailableTarget5()
	for i = 1, 3 do
	if (SobGroup_Empty(target5Groups[i]) == 0) then
	return i
	end
	end
	return -1
end

function Rule_CheckInterceptorTargets5()
	for i = 1, 3 do
	if (SobGroup_Empty(target5Groups[i]) == 1) then
	local newTarget = Rule_FindNextAvailableTarget5(i)
	if (newTarget == -1 or convoy5_docked == 1) then
	SobGroup_ParadeSobGroup("Convoy5Interceptors1", "EnemyCarrier", 0)
	SobGroup_ParadeSobGroup("Convoy5Interceptors2", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy5Interceptors2", AggressiveTactics)
	if (HW2_IsRunTimeSobGroupAlive(Convoy5Interceptors3) == 1) then
	SobGroup_ParadeSobGroup(Convoy5Interceptors3, "EnemyCarrier", 0)
	SobGroup_SetTactics(Convoy5Interceptors3, AggressiveTactics)
	end
	SobGroup_SetTactics("Convoy5Interceptors1", AggressiveTactics)
	Rule_Remove("Rule_CheckInterceptorTargets5")
	return
	end
	target5Groups[i] = target5Groups[newTarget]
	SobGroup_GuardSobGroup(interceptor5Groups[i], target5Groups[i])
	end
	end
end

function Rule_InitializeInterceptor6Targets()
	for i = 1, 3 do
	SobGroup_GuardSobGroup(interceptor6Groups[i], target6Groups[i])
	end
	Rule_AddInterval("Rule_CheckInterceptorTargets6", 3)
	Rule_Remove("Rule_InitializeInterceptor6Targets")
end

function Rule_FindNextAvailableTarget6()
	for i = 1, 3 do
	if (SobGroup_Empty(target6Groups[i]) == 0) then
	return i
	end
	end
	return -1
end

function Rule_CheckInterceptorTargets6()
	for i = 1, 3 do
	if (SobGroup_Empty(target6Groups[i]) == 1) then
	local newTarget = Rule_FindNextAvailableTarget6(i)
	if (newTarget == -1 or convoy6_docked == 1) then
	SobGroup_ParadeSobGroup("Convoy6Interceptors1", "EnemyCarrier", 0)
	if (HW2_IsRunTimeSobGroupAlive(Convoy6Interceptors1) == 1) then
	SobGroup_ParadeSobGroup(Convoy6Interceptors1, "EnemyCarrier", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy6Interceptors3) == 1) then
	SobGroup_ParadeSobGroup(Convoy6Interceptors3, "EnemyCarrier", 0)
	end
	SobGroup_SetTactics("Convoy6Interceptors1", AggressiveTactics)
	SobGroup_SetTactics(Convoy6Interceptors1, AggressiveTactics)
	SobGroup_SetTactics(Convoy6Interceptors3, AggressiveTactics)
	Rule_Remove("Rule_CheckInterceptorTargets6")
	return
	end
	target6Groups[i] = target6Groups[newTarget]
	SobGroup_GuardSobGroup(interceptor6Groups[i], target6Groups[i])
	end
	end
end

function Rule_ConvoyAttackWatch()
	if (convoy1DeadONCE == 0 and SobGroup_Empty("Convoy_1") == 1 or convoy1_docked == 1) then
	SobGroup_SetTactics("Convoy1Bombers1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy1Bombers1", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy1Bombers2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy1Bombers2", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy1Bombers3", AggressiveTactics)
	convoy1DeadONCE = 1
	end
	if (convoy2DeadONCE == 0 and SobGroup_Empty("Convoy_2") == 1 or convoy2_docked == 1) then
	SobGroup_SetTactics("Convoy2Bombers2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy2Bombers2", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy2Interceptors2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy2Interceptors2", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy2Bombers3", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy2Bombers3", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy2Interceptors3", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy2Interceptors3", "EnemyCarrier", 0)
	convoy2DeadONCE = 1
	end
	if (convoy3DeadONCE == 0 and SobGroup_Empty("Convoy_3") == 1 or convoy3_docked == 1) then
	convoy3DeadONCE = 1
	SobGroup_SetTactics("Convoy3Bombers1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy3Bombers1", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy3Interceptors1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy3Interceptors1", "EnemyCarrier", 0)
	if (HW2_IsRunTimeSobGroupAlive(Convoy3Bombers2) == 1) then
	SobGroup_SetTactics(Convoy3Bombers2, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy3Bombers2, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy3Interceptors2") ~= 1) then
	SobGroup_SetTactics("Convoy3Interceptors2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy3Interceptors2", "EnemyCarrier", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy3Bombers3) == 1) then
	SobGroup_SetTactics(Convoy3Bombers3, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy3Bombers3, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy3Interceptors3") ~= 1) then
	SobGroup_SetTactics("Convoy3Interceptors3", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy3Interceptors3", "EnemyCarrier", 0)
	end
	end
	if (convoy4DeadONCE == 0 and SobGroup_Empty("Convoy_4") == 1 or convoy4_docked == 1) then
	convoy4DeadONCE = 1
	SobGroup_SetTactics("Convoy4Bombers1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy4Bombers1", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy4Interceptors1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy4Interceptors1", "EnemyCarrier", 0)
	if (HW2_IsRunTimeSobGroupAlive(Convoy4Bombers2) == 1) then
	SobGroup_SetTactics(Convoy4Bombers2, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy4Bombers2, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy4Interceptors2") ~= 1) then
	SobGroup_SetTactics("Convoy4Interceptors2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy4Interceptors2", "EnemyCarrier", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy4Bombers3) == 1) then
	SobGroup_SetTactics(Convoy4Bombers3, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy4Bombers3, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy4Interceptors3") ~= 1) then
	SobGroup_SetTactics("Convoy4Interceptors3", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy4Interceptors3", "EnemyCarrier", 0)
	end
	end
	if (convoy5DeadONCE == 0 and SobGroup_Empty("Convoy_5") == 1 or convoy5_docked == 1) then
	SobGroup_SetTactics("Convoy5Bombers1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy5Bombers1", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy5Interceptors1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy5Interceptors1", "EnemyCarrier", 0)
	if (HW2_IsRunTimeSobGroupAlive(Convoy5Bombers2) == 1) then
	SobGroup_SetTactics(Convoy5Bombers2, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy5Bombers2, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy5Interceptors2") ~= 1) then
	SobGroup_SetTactics("Convoy5Interceptors2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy5Interceptors2", "EnemyCarrier", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy5Bombers3) == 1) then
	SobGroup_SetTactics(Convoy5Bombers3, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy5Bombers3, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy5Interceptors3") ~= 1) then
	SobGroup_SetTactics("Convoy5Interceptors3", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy5Interceptors3", "EnemyCarrier", 0)
	end
	convoy5DeadONCE = 1
	end
	if (convoy6DeadONCE == 0 and SobGroup_Empty("Convoy_6") == 1 or convoy6_docked == 1) then
	SobGroup_SetTactics("Convoy6Bombers1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy6Bombers1", "EnemyCarrier", 0)
	SobGroup_SetTactics("Convoy6Interceptors1", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy6Interceptors1", "EnemyCarrier", 0)
	if (HW2_IsRunTimeSobGroupAlive(Convoy6Bombers2) == 1) then
	SobGroup_SetTactics(Convoy6Bombers2, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy6Bombers2, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy6Interceptors2") ~= 1) then
	SobGroup_SetTactics("Convoy6Interceptors2", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy6Interceptors2", "EnemyCarrier", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy6Bombers3) == 1) then
	SobGroup_SetTactics(Convoy6Bombers3, AggressiveTactics)
	SobGroup_ParadeSobGroup(Convoy6Bombers3, "EnemyCarrier", 0)
	end
	if (SobGroup_Empty("Convoy6Interceptors3") ~= 1) then
	SobGroup_SetTactics("Convoy6Interceptors3", AggressiveTactics)
	SobGroup_ParadeSobGroup("Convoy6Interceptors3", "EnemyCarrier", 0)
	end
	convoy6DeadONCE = 1
	end
	if (convoy3ReinforceONCE == 0) then
	if (SobGroup_Empty("Convoy3Bombers1") == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15) then
	Convoy3Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	Convoy3Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	if (Convoy3Interceptors2Alive == 1) then
	SobGroup_Launch("Convoy3Interceptors2", "EnemyCarrier")
	end
	if (Convoy3Interceptors3Alive == 1) then
	SobGroup_Launch("Convoy3Interceptors3", "EnemyCarrier")
	end
	convoy3ReinforceONCE = 1
	Rule_AddInterval("Rule_Convoy3Setup", 8)
	end
	end
	end
	if (convoy4ReinforceONCE == 0) then
	if (SobGroup_Empty("Convoy4Bombers1") == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15) then
	Convoy4Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	Convoy4Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	if (Convoy4Interceptors2Alive == 1) then
	SobGroup_Launch("Convoy4Interceptors2", "EnemyCarrier")
	end
	if (Convoy4Interceptors3Alive == 1) then
	SobGroup_Launch("Convoy4Interceptors3", "EnemyCarrier")
	end
	convoy4ReinforceONCE = 1
	Rule_AddInterval("Rule_Convoy4Setup", 8)
	end
	end
	end
	if (convoy5ReinforceONCE == 0) then
	if (SobGroup_Empty("Convoy5Bombers1") == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15) then
	Convoy5Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	Convoy5Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	if (Convoy5Interceptors2Alive == 1) then
	SobGroup_Launch("Convoy5Interceptors2", "EnemyCarrier")
	end
	if (Convoy5Interceptors3Alive == 1) then
	SobGroup_Launch("Convoy5Interceptors3", "EnemyCarrier")
	end
	convoy5ReinforceONCE = 1
	Rule_AddInterval("Rule_Convoy5Setup", 8)
	end
	end
	end
	if (convoy6ReinforceONCE == 0) then
	if (SobGroup_Empty("Convoy6Bombers1") == 1) then
	if (SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15) then
	Convoy6Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	Convoy6Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
	if (Convoy6Interceptors2Alive == 1) then
	SobGroup_Launch("Convoy6Interceptors2", "EnemyCarrier")
	end
	if (Convoy6Interceptors3Alive == 1) then
	SobGroup_Launch("Convoy6Interceptors3", "EnemyCarrier")
	end
	convoy6ReinforceONCE = 1
	Rule_AddInterval("Rule_Convoy6Setup", 8)
	end
	end
	end
end

function Rule_Convoy3Setup()
	SobGroup_GuardSobGroup("Convoy3Interceptors2", Convoy3Bombers2)
	SobGroup_GuardSobGroup("Convoy3Interceptors3", Convoy3Bombers3)
	SobGroup_Attack(1, Convoy3Bombers2, "Convoy_3")
	SobGroup_Attack(1, Convoy3Bombers3, "Convoy_3")
	convoy3Reinforcements = 1
	interceptor3Groups = {"Convoy3Interceptors1", "Convoy3Interceptors2", "Convoy3Interceptors3"}
	target3Groups = {"Convoy3Bombers1", Convoy3Bombers2, Convoy3Bombers3}
	Rule_Add("Rule_InitializeInterceptor3Targets")
	Rule_Add("Rule_FindNextAvailableTarget3")
	Rule_Remove("Rule_Convoy3Setup")
end

function Rule_Convoy4Setup()
	SobGroup_GuardSobGroup("Convoy4Interceptors2", Convoy4Bombers2)
	SobGroup_GuardSobGroup("Convoy4Interceptors3", Convoy4Bombers3)
	SobGroup_Attack(1, Convoy4Bombers2, "Convoy_4")
	SobGroup_Attack(1, Convoy4Bombers3, "Convoy_4")
	convoy4Reinforcements = 1
	interceptor4Groups = {"Convoy4Interceptors1", "Convoy4Interceptors2", "Convoy4Interceptors3"}
	target4Groups = {"Convoy4Bombers1", Convoy4Bombers2, Convoy4Bombers3}
	Rule_Add("Rule_InitializeInterceptor4Targets")
	Rule_Add("Rule_FindNextAvailableTarget4")
	Rule_Remove("Rule_Convoy4Setup")
end

function Rule_Convoy5Setup()
	SobGroup_GuardSobGroup("Convoy5Interceptors2", Convoy5Bombers2)
	SobGroup_GuardSobGroup("Convoy5Interceptors3", Convoy5Bombers3)
	SobGroup_Attack(1, Convoy5Bombers2, "Convoy_5")
	SobGroup_Attack(1, Convoy5Bombers3, "Convoy_5")
	convoy5Reinforcements = 1
	interceptor5Groups = {"Convoy5Interceptors1", "Convoy5Interceptors2", "Convoy5Interceptors3"}
	target5Groups = {"Convoy5Bombers1", Convoy5Bombers2, Convoy5Bombers3}
	Rule_Add("Rule_InitializeInterceptor5Targets")
	Rule_Add("Rule_FindNextAvailableTarget5")
	Rule_Remove("Rule_Convoy5Setup")
end

function Rule_Convoy6Setup()
	SobGroup_GuardSobGroup("Convoy6Interceptors2", Convoy6Bombers2)
	SobGroup_GuardSobGroup("Convoy6Interceptors3", Convoy6Bombers3)
	SobGroup_Attack(1, Convoy6Bombers2, "Convoy_6")
	SobGroup_Attack(1, Convoy6Bombers3, "Convoy_6")
	convoy6Reinforcements = 1
	interceptor6Groups = {"Convoy6Interceptors1", "Convoy6Interceptors2", "Convoy6Interceptors3"}
	target6Groups = {"Convoy6Bombers1", Convoy6Bombers2, Convoy6Bombers3}
	Rule_Add("Rule_InitializeInterceptor6Targets")
	Rule_Add("Rule_FindNextAvailableTarget6")
	Rule_Remove("Rule_Convoy6Setup")
end

function Rule_convoyAttackerEndWatch()
	if (SobGroup_Empty("EnemyCarrier") == 1) then
	if (convoy1_docked == 1 or convoy1DestroyedONCE == 1) then
	for i = 1, 3 do
	if (SobGroup_Empty("Convoy1Bombers"..i) == 0) then
	SobGroup_AttackPlayer("Convoy1Bombers"..i, 0)
	end
	end
	end
	if (convoy2_docked == 1 or convoy2DestroyedONCE == 1) then
	if (SobGroup_Empty("Convoy2Bombers2") == 0) then
	SobGroup_AttackPlayer("Convoy2Bombers2", 0)
	end
	if (SobGroup_Empty("Convoy2Interceptors2") == 0) then
	SobGroup_AttackPlayer("Convoy2Interceptors2", 0)
	end
	end
	if (convoy3_docked == 1 or convoy3DestroyedONCE == 1) then
	if (SobGroup_Empty("Convoy3Bombers1") == 0) then
	SobGroup_AttackPlayer("Convoy3Bombers1", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy3Bombers2) == 1) then
	SobGroup_AttackPlayer(Convoy3Bombers2, 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy3Bombers3) == 1) then
	SobGroup_AttackPlayer(Convoy3Bombers3, 0)
	end
	if (SobGroup_Empty("Convoy3Interceptors1") == 0) then
	SobGroup_AttackPlayer("Convoy3Interceptors1", 0)
	end
	if (SobGroup_Empty("Convoy3Interceptors2") == 0) then
	SobGroup_AttackPlayer("Convoy3Interceptors2", 0)
	end
	if (SobGroup_Empty("Convoy3Interceptors3") == 0) then
	SobGroup_AttackPlayer("Convoy3Interceptors3", 0)
	end
	end
	if (convoy4_docked == 1 or convoy4DestroyedONCE == 1) then
	if (SobGroup_Empty("Convoy4Bombers1") == 0) then
	SobGroup_AttackPlayer("Convoy4Bombers1", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy4Bombers2) == 1) then
	SobGroup_AttackPlayer(Convoy4Bombers2, 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy4Bombers3) == 1) then
	SobGroup_AttackPlayer(Convoy4Bombers3, 0)
	end
	if (SobGroup_Empty("Convoy4Interceptors1") == 0) then
	SobGroup_AttackPlayer("Convoy4Interceptors1", 0)
	end
	if (SobGroup_Empty("Convoy4Interceptors2") == 0) then
	SobGroup_AttackPlayer("Convoy4Interceptors2", 0)
	end
	if (SobGroup_Empty("Convoy4Interceptors3") == 0) then
	SobGroup_AttackPlayer("Convoy4Interceptors3", 0)
	end
	end
	if (convoy5_docked == 1 or convoy5DestroyedONCE == 1) then
	if (SobGroup_Empty("Convoy5Bombers1") == 0) then
	SobGroup_AttackPlayer("Convoy5Bombers1", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy5Bombers2) == 1) then
	SobGroup_AttackPlayer(Convoy5Bombers2, 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy5Bombers3) == 1) then
	SobGroup_AttackPlayer(Convoy5Bombers3, 0)
	end
	if (SobGroup_Empty("Convoy5Interceptors1") == 0) then
	SobGroup_AttackPlayer("Convoy5Interceptors1", 0)
	end
	if (SobGroup_Empty("Convoy5Interceptors2") == 0) then
	SobGroup_AttackPlayer("Convoy5Interceptors2", 0)
	end
	if (SobGroup_Empty("Convoy5Interceptors3") == 0) then
	SobGroup_AttackPlayer("Convoy5Interceptors3", 0)
	end
	end
	if (convoy6_docked == 1 or convoy6DestroyedONCE == 1) then
	if (SobGroup_Empty("Convoy6Bombers1") == 0) then
	SobGroup_AttackPlayer("Convoy6Bombers1", 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy6Bombers2) == 1) then
	SobGroup_AttackPlayer(Convoy6Bombers2, 0)
	end
	if (HW2_IsRunTimeSobGroupAlive(Convoy6Bombers3) == 1) then
	SobGroup_AttackPlayer(Convoy6Bombers3, 0)
	end
	if (SobGroup_Empty("Convoy6Interceptors1") == 0) then
	SobGroup_AttackPlayer("Convoy6Interceptors1", 0)
	end
	if (SobGroup_Empty("Convoy6Interceptors2") == 0) then
	SobGroup_AttackPlayer("Convoy6Interceptors2", 0)
	end
	if (SobGroup_Empty("Convoy6Interceptors3") == 0) then
	SobGroup_AttackPlayer("Convoy6Interceptors3", 0)
	end
	end
	end
end

function Rule_callInTheFrigates()
	if (convoys_saved == 3 or convoys_docked == 3 or SobGroup_HealthPercentage("EnemyCarrier") < 0.7) then
	Rule_AddInterval("Rule_frigateHyperspaceIn", 10)
	Rule_Remove("Rule_callInTheFrigates")
	end
end

function Rule_frigateHyperspaceIn()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	if (SobGroup_Empty("Convoy_4") == 0 and convoy4SavedONCE == 0 and convoy4_docked == 0) then
	print("telling Frigates to hyperspace in next to Convoy 4!!!!!!!")
	SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS1", "Convoy_4", 1500)
	SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS2", "Convoy_4", 1500)
	frigatesAttackingConvoy4 = 1
	elseif (SobGroup_Empty("Convoy_5") == 0 and convoy5SavedONCE == 0 and convoy5_docked == 0) then
	print("telling Frigates to hyperspace in next to Convoy 5!!!!!!!")
	SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS1", "Convoy_5", 1500)
	SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS2", "Convoy_5", 1500)
	frigatesAttackingConvoy5 = 1
	elseif (SobGroup_Empty("Convoy_6") == 0 and convoy6SavedONCE == 0 and convoy6_docked == 0) then
	print("telling Frigates to hyperspace in next to Convoy 6!!!!!!!")
	SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS1", "Convoy_6", 1500)
	SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS2", "Convoy_6", 1500)
	frigatesAttackingConvoy6 = 1
	end
	Rule_Add("Rule_intelevent_frigateAttack")
	Rule_AddInterval("Rule_frigateAttack", 1)
	Rule_Remove("Rule_frigateHyperspaceIn")
	end
end

function Rule_frigateAttack()
	print("===== in frigateAttack function ======")
	SobGroup_SetTactics("FrigateAttackers", AggressiveTactics)
	if (frigatesAttackingConvoy6 == 1) then
	print("telling Frigates to attack Convoy 6!!!!!!!")
	SobGroup_Attack(1, "FrigateAttackers", "Convoy_6")
	Rule_AddInterval("AssFrigGuardFrigateAttackers", 20)
	frigatesAttackingConvoy6 = 1
	elseif (frigatesAttackingConvoy5 == 1) then
	print("telling Frigates to attack Convoy 5!!!!!!!")
	SobGroup_Attack(1, "FrigateAttackers", "Convoy_5")
	Rule_AddInterval("AssFrigGuardFrigateAttackers", 20)
	frigatesAttackingConvoy5 = 1
	elseif (frigatesAttackingConvoy4 == 1) then
	print("telling Frigates to attack Convoy 4!!!!!!!")
	SobGroup_Attack(1, "FrigateAttackers", "Convoy_4")
	Rule_AddInterval("AssFrigGuardFrigateAttackers", 20)
	frigatesAttackingConvoy4 = 1
	else
	SobGroup_GuardSobGroup("FrigateAttackers", "EnemyCarrier")
	end
	Rule_AddInterval("Rule_retaliateAgainstMelarn", 4)
	Rule_AddInterval("Rule_callInMelarn", 3)
	Timer_Start("callInMelarnTIMER", 120)
	Rule_Remove("Rule_frigateAttack")
end

function AssFrigGuardFrigateAttackers()
	SobGroup_GuardSobGroup("FrigateGuard", "FrigateAttackersToGuard")
	Rule_Remove("AssFrigGuardFrigateAttackers")
end

function Rule_retaliateAgainstMelarn()
	if (NIS02BCompleted == 1 and SobGroup_FillProximitySobGroup("tempSobGroup", "MelarnFleet", "FrigateAttackers", 6000) == 1) then
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships3", "Hgn_TorpedoFrigate")
	SobGroup_Attack(1, "FrigateAttackers", "tempSobGroup")
	frigatesAttackingMelarnFleet = 1
	Rule_Remove("Rule_retaliateAgainstMelarn")
	end
end

function Rule_callInMelarn()
	if (Timer_GetRemaining("callInMelarnTIMER") >= 1) then
	if (convoys_destroyed ~= 2) then
	if (convoys_docked ~= 3) then
	if (SobGroup_HealthPercentage("EnemyCarrier") >= 0.5) then
	if (SobGroup_Count("FrigateAttackers") >= 4) then
	if (frigatesAttackingConvoy6 ~= 1 or SobGroup_HealthPercentage("Convoy_6") >= 0.5) then
	if (frigatesAttackingConvoy5 ~= 1 or SobGroup_HealthPercentage("Convoy_5") >= 0.5) then
	if (frigatesAttackingConvoy4 == 1 and SobGroup_HealthPercentage("Convoy_4") < 0.5) then
	end
	end
	end
	end
	end
	end
	end
	Rule_Add("Rule_callInMelarn2")
	Rule_Remove("Rule_callInMelarn")
	end
end

function Rule_callInMelarn2()
	if (EventPlaying == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_MelarnIsComing")
	Rule_AddInterval("Rule_callInMelarn3", 1)
	Rule_Remove("Rule_callInMelarn2")
	end
end

function Rule_callInMelarn3()
	if (EventPlaying == 0 and MelarnIsComingEventFinished == 1) then
	if (Sensors_ManagerIsUp() == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	Rule_AddInterval("Rule_callInMelarn4", 1)
	Rule_Remove("Rule_callInMelarn3")
	else
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Sensors_EnableToggle(0)
	Rule_Add("Rule_callInMelarn4")
	Rule_Remove("Rule_callInMelarn3")
	end
	end
end

function Rule_callInMelarn4()
	NIS02B_Playing = 1
	Camera_SetLetterboxStateNoUI(1, 3)
	print("trying to bring down letterbox bars!!!!!!!!!!!!!!!!!!!!!!!!!!")
	Rule_AddInterval("Rule_playMelarnArrivalNIS", 4)
	Rule_Remove("Rule_callInMelarn4")
end

function Rule_playMelarnArrivalNIS()
	SetAlliance(0, 3)
	SetAlliance(3, 0)
	SetAlliance(0, 4)
	SetAlliance(4, 0)
	SetAlliance(3, 4)
	SetAlliance(4, 3)
	print("playing nis!!!!!")
	NISLoad("nis/NIS02B")
	SobGroup_SetInvulnerability("Player_Ships0", 1)
	if (frigatesAttackingConvoy6 == 1) then
	k_currentNISPlaying_id = NISPlayFromGroup("nis/NIS02B", "Convoy_6")
	elseif (frigatesAttackingConvoy5 == 1) then
	k_currentNISPlaying_id = NISPlayFromGroup("nis/NIS02B", "Convoy_5")
	elseif (frigatesAttackingConvoy4 == 1) then
	k_currentNISPlaying_id = NISPlayFromGroup("nis/NIS02B", "Convoy_4")
	end
	Rule_Add("Rule_watchForNIS02BDone")
	Rule_Remove("Rule_playMelarnArrivalNIS")
end

function Rule_watchForNIS02BDone()
	if (NISComplete(k_currentNISPlaying_id) == 1) then
	print("NIS has completed!!")
	NIS02BCompleted = 1
	Sensors_EnableToggle(1)
	SobGroup_SetInvulnerability("Player_Ships0", 0)
	Rule_Add("Rule_PlayBattleMusic")
	Rule_AddInterval("Rule_turnUIBackOn", 1)
	Rule_AddInterval("Rule_melarnSetup", 1)
	Rule_AddInterval("Rule_intelevent_WithHelpOfMelarn", 4)
	Rule_Remove("Rule_watchForNIS02BDone")
	end
end

function Rule_turnUIBackOn()
	Camera_SetLetterboxStateNoUI(0, 0)
	Rule_Remove("Rule_turnUIBackOn")
end

function Rule_intelevent_WithHelpOfMelarn()
	print("Trying to play event WithHelpOfMelarn!!!!!!")
	print("playing event WithHelpOfMelarn!!!!!!")
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_WithHelpOfMelarn")
	Rule_AddInterval("Rule_intelevent_frigatesDestroyed", 4)
	Rule_Remove("Rule_intelevent_WithHelpOfMelarn")
end

function Rule_intelevent_frigatesDestroyed()
	if (EventPlaying == 0 and SobGroup_Empty("FrigateAttackers") == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_frigatesDestroyed")
	Rule_Remove("Rule_intelevent_frigatesDestroyed")
	end
end

function Rule_melarnSetup()
	print("Doing melarn set-up!")
	Player_SetPlayerName(3, "$40008")
	Player_SetPlayerName(4, "$40009")
	SobGroup_SetTactics("MelarnSoban", PassiveTactics)
	SobGroup_SetTactics("MelarnFleet", PassiveTactics)
	SobGroup_FillUnion("MelarnFleetAll", "MelarnSoban", "MelarnFleet")
	FOW_RevealGroup("MelarnFleet", 1)
	FOW_RevealGroup("MelarnSoban", 1)
	Rule_AddInterval("Rule_intelevent_melarnDamaged", 3)
	Rule_AddInterval("Rule_intelevent_melarnCriticallyDamaged", 4)
	Rule_AddInterval("Rule_melarnSetHealth", 2)
	Rule_AddInterval("Rule_melarnAttack", 1)
	Rule_Remove("Rule_melarnSetup")
end

function Rule_melarnAttack()
	SobGroup_Attack(3, "MelarnFleet", "FrigateAttackers")
	SobGroup_SetTactics("MelarnFleet", DefensiveTactics)
	SobGroup_Attack(4, "MelarnSoban", "FrigateAttackers")
	SobGroup_SetTactics("MelarnSoban", DefensiveTactics)
	Rule_AddInterval("Rule_melarnAttackWatch", 3)
	print("going into melarnAttackWatch")
	Rule_Remove("Rule_melarnAttack")
end

function Rule_melarnAttackWatch()
	if (SobGroup_Empty("FrigateAttackers") == 1) then
	SobGroup_Attack(4, "MelarnSoban", "EnemyCarrier")
	SobGroup_Attack(3, "MelarnFleet", "EnemyCarrier")
	Rule_AddInterval("Rule_melarnAttackWatch2_CaptainSoban", 4)
	Rule_AddInterval("Rule_melarnAttackWatch3_CaptainSoban", 3)
	Rule_Add("Rule_melarnAttackWatch2")
	Rule_Remove("Rule_melarnAttackWatch")
	end
end

function Rule_melarnAttackWatch2_CaptainSoban()
	if (MelarnAttacking == 0 and SobGroup_UnderAttack("MelarnSoban") == 1) then
	print("Melarn is under attack!!")
	SobGroup_GetAttackers("MelarnSoban", "AttackingMelarn")
	SobGroup_FillShipsByType("BombersAttackingMelarn", "AttackingMelarn", "Vgr_Bomber")
	if (MelarnAttacking == 0 and SobGroup_Empty("BombersAttackingMelarn") == 0) then
	MelarnAttacking = 1
	print("Melarn Attacking Bombers!")
	SobGroup_Attack(4, "MelarnSoban", "BombersAttackingMelarn")
	end
	end
end

function Rule_melarnAttackWatch3_CaptainSoban()
	if (MelarnAttacking == 1 and SobGroup_Empty("BombersAttackingMelarn") == 0) then
	print("Melarn has killed all the Bombers, going back to attacking the Carrier!")
	SobGroup_Attack(4, "MelarnSoban", "EnemyCarrier")
	MelarnAttacking = 0
	end
end

function Rule_melarnAttackWatch2()
	if (SobGroup_Empty("EnemyCarrier") == 1) then
	SobGroup_GuardSobGroup("MelarnSoban", "PlayerMothership")
	SobGroup_GuardSobGroup("MelarnFleet", "PlayerMothership")
	Rule_Remove("Rule_melarnAttackWatch2")
	end
end

function Rule_melarnHyperspaceOut()
	if (tellMelarnToHyperspaceOut == 1) then
	SobGroup_EnterHyperSpaceOffMap("MelarnSoban")
	SobGroup_EnterHyperSpaceOffMap("MelarnFleet")
	Rule_Remove("Rule_melarnHyperspaceOut")
	Rule_Remove("Rule_melarnAttackWatch2")
	end
end

function Rule_melarnSetHealth()
	if (SobGroup_HealthPercentage("MelarnSoban") <= 0.15 and melarnSaved<5) then
	print("Saving Melarn from certain death!!!!!")
	melarnSaved = (melarnSaved + 1)
	SobGroup_SetHealth("MelarnSoban", 0.25)
	end
end

function Rule_PlayerLoses()
	if (EventPlaying == 0 and SobGroup_Empty("PlayerMothership") == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_PlayerLoses")
	end
end

function Rule_playEffects1()
	local curTime = Universe_GameTime()
	if (curTime >= s_nextFxTime) then
	local randomScale = RandomRange(800, 2200)
	local randomPointIndex = RandomIntMax(21) + 1
	FX_PlayEffect("death_generic_capital", "EffectPoint"..randomPointIndex, randomScale)
	s_nextFxTime = (curTime + RandomRange(0.9, 2))
	end
end

function Rule_playEffects2()
	local curTime = Universe_GameTime()
	if (curTime >= r_nextFxTime) then
	local randomScale = RandomRange(1000, 2400)
	local randomPointIndex = RandomIntMax(21) + 1
	FX_PlayEffect("death_generic_capital", "EffectPoint"..randomPointIndex, randomScale)
	r_nextFxTime = (curTime + RandomRange(0.9, 1.5))
	end
end

function Rule_playEffectsSurface()
	local curTime = Universe_GameTime()
	if (curTime >= t_nextFxTime) then
	local randomScale = RandomRange(3000, 3800)
	local randomPointIndex = RandomIntMax(17) + 1
	FX_PlayEffect("black_smoke_sparkle_spray", "EffectPointSurface"..randomPointIndex, randomScale)
	t_nextFxTime = (curTime + RandomRange(1.2, 2.5))
	end
end

function Rule_playEffectsBig()
	local curTime = Universe_GameTime()
	if (curTime >= q_nextFxTime) then
	local randomScale = RandomRange(6000, 9000)
	local randomPointIndex = RandomIntMax(21) + 1
	FX_PlayEffect("death_generic_capital", "EffectPoint"..randomPointIndex, randomScale)
	q_nextFxTime = (curTime + RandomRange(5, 9))
	end
end

function Rule_playEffectsSmall()
	local curTime = Universe_GameTime()
	if (curTime >= w_nextFxTime) then
	local randomScale = RandomRange(1500, 2500)
	local randomPointIndex = RandomIntMax(33) + 1
	FX_PlayEffect("flash_sparks_spray", "EffectPointSmall"..randomPointIndex, randomScale)
	w_nextFxTime = (curTime + RandomRange(0.1, 0.2))
	end
end

function Rule_playEffectsSmall2()
	local curTime = Universe_GameTime()
	if (curTime >= v_nextFxTime) then
	local randomScale = RandomRange(1500, 2500)
	local randomPointIndex = RandomIntMax(33) + 1
	FX_PlayEffect("flash_sparks_spray", "EffectPointSmall"..randomPointIndex, randomScale)
	v_nextFxTime = (curTime + RandomRange(0.1, 0.2))
	end
end

function Rule_playEffectsSmallLow()
	local curTime = Universe_GameTime()
	if (curTime >= x_nextFxTime) then
	local randomScale = RandomRange(1500, 2500)
	local randomPointIndex = RandomIntMax(21) + 1
	FX_PlayEffect("flash_sparks_spray", "EffectPointSmallLow"..randomPointIndex, randomScale)
	x_nextFxTime = (curTime + RandomRange(0.1, 0.2))
	end
end

function Rule_PlayAmbientMusic()
	print("trying to play ambient music!")
	Sound_MusicPlayType("data:sound/music/ambient/amb_02", MUS_Ambient)
	Rule_Remove("Rule_PlayAmbientMusic")
end

function Rule_PlayStagingMusic()
	print("trying to play staging music!")
	Sound_MusicPlayType("data:sound/music/staging/staging_01", MUS_Staging)
	Rule_Remove("Rule_PlayStagingMusic")
end

function Rule_PlayBattleMusic()
	print("trying to play Battle music!")
	Sound_MusicPlayType("data:sound/music/battle/battle_01", MUS_Battle)
	Rule_Remove("Rule_PlayBattleMusic")
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

Events = {}
Events["intelevent_convoysUnderAttack"] = {{{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6403')", ""},}, {HW2_Wait(2)}, {HW2_LocationCardEvent("$40020", 6), {"Sound_EnableAllSpeech(1)", ""}, {"Camera_UsePanning(1)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40024", 8)}, {HW2_Wait(1.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40018", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40025", 10)}, {HW2_Wait(2)}, {HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Sensors_Toggle(1)", ""}, {"FOW_RevealGroup('Convoy3Bombers1', 1)", ""}, {"FOW_RevealGroup('Convoy3Interceptors1', 1)", ""}, {"FOW_RevealGroup('Convoy4Bombers1', 1)", ""}, {"FOW_RevealGroup('Convoy4Interceptors1', 1)", ""}, {"FOW_RevealGroup('Convoy5Bombers1', 1)", ""}, {"FOW_RevealGroup('Convoy5Interceptors1', 1)", ""}, {"FOW_RevealGroup('Convoy6Bombers1', 1)", ""}, {"FOW_RevealGroup('Convoy6Interceptors1', 1)", ""}, {"FOW_ForceUpdate()", ""},}, {{"Camera_Interpolate('here', 'camera3', 1)", ""}, HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40039", 8), {"ping_Convoy_1_id = Ping_AddSobGroup(ping_Convoy_1, 'anomaly', 'Convoy_1')", ""}, {"Ping_AddDescription(ping_Convoy_1_id, 0, '$40425')", ""}, {"ping_Convoy_2_id = Ping_AddSobGroup(ping_Convoy_2, 'anomaly', 'Convoy_2')", ""}, {"Ping_AddDescription(ping_Convoy_2_id, 0, '$40425')", ""}, {"ping_Convoy_3_id = Ping_AddSobGroup(ping_Convoy_3, 'anomaly', 'Convoy_3')", ""}, {"Ping_AddDescription(ping_Convoy_3_id, 0, '$40425')", ""}, {"ping_Convoy_4_id = Ping_AddSobGroup(ping_Convoy_4, 'anomaly', 'Convoy_4')", ""}, {"Ping_AddDescription(ping_Convoy_4_id, 0, '$40425')", ""}, {"ping_Convoy_5_id = Ping_AddSobGroup(ping_Convoy_5, 'anomaly', 'Convoy_5')", ""}, {"Ping_AddDescription(ping_Convoy_5_id, 0, '$40425')", ""}, {"ping_Convoy_6_id = Ping_AddSobGroup(ping_Convoy_6, 'anomaly', 'Convoy_6')", ""}, {"Ping_AddDescription(ping_Convoy_6_id, 0, '$40425')", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40019", 8), {"pointer_enemyCarrier_id = HW2_CreateEventPointerSobGroup('EnemyCarrier')", ""},}, {HW2_Wait(2)}, {{"EventPointer_Remove(pointer_enemyCarrier_id)", ""}, {"Camera_FocusSobGroup('Convoy_1', 1, 13000, 1)", ""},}, {HW2_Wait(1.5)}, {{"pointer_convoy1_id = HW2_CreateEventPointerSobGroup('Convoy_1')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40027", 10)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40029", 10), {"obj_prim_saveconvoys_id = Objective_Add(obj_prim_saveconvoys , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_saveconvoys_id, '$40450')", ""}, {"Objective_AddDescription(obj_prim_saveconvoys_id, '$40451')", ""},}, {HW2_Wait(1)}, {{"EventPointer_Remove(pointer_convoy1_id)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, HW2_Pause(0), HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""},}, {HW2_Wait(2)}, {{"OpeningEventFinished = 1", ""}, {"EventPlaying = 0", ""}, {"Rule_Add ('Rule_IntelEvent_RecommendCollectors')", ""},},}
Events["intelevent_RecommendCollectors"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40023", 8), {"obj_sec_buildCollectors_id = Objective_Add(obj_sec_buildCollectors , OT_Secondary)", ""}, {"Objective_AddDescription(obj_sec_buildCollectors_id, '$40475')", ""},}, {{"UI_FlashButton('NewTaskbar', 'btnBuild', 10)", ""}, {"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_firstMSMove"] = {{HW2_SubTitleEvent(Actor_FleetCommand, "$40090", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40091", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_corvetteSubsystemComplete"] = {{{"Objective_SetState(obj_sec_buildCorvetteFacility_id, OS_Complete)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40230", 5), {"Objective_SetState(obj_sec_buildCorvetteFacility_id, OS_Complete)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40231", 8), {"UI_FlashButton('NewTaskbar', 'btnBuild', 10)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40232", 8)}, {{"Rule_AddInterval ('Rule_intelevent_recommendCorvettes', 3)", ""}, HW2_Wait(0.5)}, {{"Sound_SetMuteActor('')", ""}, {"evt_corvetteSubsystemComplete_started = 1", ""}, {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_pulsarCorvetteAvailable"] = {{HW2_Wait(0.5)}, {{"Player_UnrestrictBuildOption(0, 'Hgn_PulsarCorvette')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40235", 8)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40236", 8)}, {{"Sound_SetMuteActor('')", ""}, {"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_recommendCorvettes"] = {{HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40239", 8)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_1_Lost"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40030", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_2_Lost"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40040", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_3_Lost"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40050", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_4_Lost"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40060", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_5_Lost"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40070", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_6_Lost"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40080", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_3convoys_Lost"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40150", 10), {"Objective_SetState(obj_prim_saveconvoys_id, OS_Failed)", ""},}, {HW2_LocationCardEvent("$40021", 4)}, {{"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""}, {"setMissionComplete(0)", ""},},}
Events["intelevent_convoy_1_Saved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40031", 6), {"Ping_Remove(ping_Convoy_1_id)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_2_Saved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40041", 6), {"Ping_Remove(ping_Convoy_2_id)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_3_Saved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40051", 6), {"Ping_Remove(ping_Convoy_3_id)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_4_Saved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40061", 6), {"Ping_Remove(ping_Convoy_4_id)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_5_Saved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40071", 6), {"Ping_Remove(ping_Convoy_5_id)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_6_Saved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40081", 6), {"Ping_Remove(ping_Convoy_6_id)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_CriticalDamage_1"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40034", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40035", 6)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_CriticalDamage_2"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40044", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40045", 6)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_CriticalDamage_3"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40054", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40055", 6)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_CriticalDamage_4"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40064", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40065", 6)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_convoy_CriticalDamage_5"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40074", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40075", 6)}, {HW2_Wait(2)}, {{"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_convoy_CriticalDamage_6"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40084", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40085", 6)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_enemyReinforcements"] = {{HW2_Wait(0.5)}, {{"Rule_Add ('Rule_PlayBattleMusic')", ""}, HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, HW2_Wait(4)}, {{"Camera_FocusSobGroup('EnemyCarrier', 1, 1500, 1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40200", 8)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40201", 10), {"pointer_fighterFacility_id = HW2_CreateEventPointerSubSystem('Vgr_C_Production_Fighter', 'EnemyCarrier')", ""}, {"obj_sec_destroyFighterFacility_id = Objective_Add(obj_sec_destroyFighterFacility , OT_Secondary)", ""}, {"Objective_AddDescription(obj_sec_destroyFighterFacility_id, '$40455')", ""}, {"Objective_AddDescription(obj_sec_destroyFighterFacility_id, '$40456')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40202", 8)}, {HW2_Wait(3)}, {{"EventPointer_Remove(pointer_fighterFacility_id)", ""}, HW2_Wait(0.5)}, {HW2_Letterbox(0)}, {{"Universe_EnableSkip(0)", ""}, {"Sensors_EnableToggle(1)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6404')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"FighterFacilityEventHasPlayed = 1", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_TEST_UNLOCK"] = {{{"Player_UnrestrictBuildOption(0, 'Hgn_Probe')", ""}, {"Player_UnrestrictBuildOption(0, 'Hgn_ResourceController')", ""}, {"Player_UnrestrictBuildOption(0, 'CorvetteProduction')", ""},}, {HW2_Wait(5)}, {{"Player_UnrestrictResearchOption(0, 'SensorsBackToNormal1')", ""}, {"Player_UnrestrictResearchOption(0, 'SensorsBackToNormal2')", ""}, {"Player_UnrestrictResearchOption(0, 'SensorsBackToNormal3')", ""}, {"Player_GrantResearchOption(0, 'SensorsBackToNormal1')", ""}, {"Player_GrantResearchOption(0, 'SensorsBackToNormal2')", ""}, {"Player_GrantResearchOption(0, 'SensorsBackToNormal3')", ""},},}
Events["intelevent_Reward1"] = {{{"rewardEventHasStarted = 1", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$40100", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40101", 3)}, {HW2_Wait(0.5)}, {{"rewardEventPlaying = 0", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40103", 6), {"UI_FlashButton('NewTaskbar', 'btnBuild', 10)", ""}, {"Rule_AddInterval ('Rule_checkCorvetteSubsystemComplete', 3)", ""}, {"Player_UnrestrictBuildOption(0, 'CorvetteProduction')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40104", 8), {"obj_sec_buildCorvetteFacility_id = Objective_Add(obj_sec_buildCorvetteFacility , OT_Secondary)", ""}, {"Objective_AddDescription(obj_sec_buildCorvetteFacility_id, '$40465')", ""}, {"Objective_AddDescription(obj_sec_buildCorvetteFacility_id, '$40466')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(3)}, {{"rewardEventHasStarted = 0", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_Reward2"] = {{{"rewardEventHasStarted = 1", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$40100", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40111", 3)}, {HW2_Wait(0.5)}, {{"rewardEventPlaying = 0", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40113", 10), {"UI_FlashButton('NewTaskbar', 'btnResearch', 10)", ""}, {"print ('unlocking research now!!!!!!!!!!!!!!!!!!!!!!!')", ""}, {"Enable_ResearchOptions()", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(3)}, {{"rewardEventHasStarted = 0", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_Reward3"] = {{{"rewardEventHasStarted = 1", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$40100", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40106", 3)}, {HW2_Wait(0.5)}, {{"rewardEventPlaying = 0", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40108", 6), {"Player_UnrestrictResearchOption(0, 'SensorsBackToNormal1')", ""}, {"Player_UnrestrictResearchOption(0, 'SensorsBackToNormal2')", ""}, {"Player_UnrestrictResearchOption(0, 'SensorsBackToNormal3')", ""}, {"Player_GrantResearchOption(0, 'SensorsBackToNormal1')", ""}, {"Player_GrantResearchOption(0, 'SensorsBackToNormal2')", ""}, {"Player_GrantResearchOption(0, 'SensorsBackToNormal3')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(3)}, {{"rewardEventHasStarted = 0", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_Reward4"] = {{{"rewardEventHasStarted = 1", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$40100", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40121", 3)}, {HW2_Wait(0.5)}, {{"rewardEventPlaying = 0", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40123", 6), {"SobGroup_SetSpeed('PlayerMothership', 1.0)", ""},}, {HW2_Wait(10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40126", 8)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(3)}, {{"rewardEventHasStarted = 0", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_Reward5"] = {{{"rewardEventHasStarted = 1", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$40100", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40131", 3)}, {HW2_Wait(0.5)}, {{"rewardEventPlaying = 0", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40134", 3), {"Rule_Add ('Rule_spawnEliteFighters1')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(3)}, {{"rewardEventHasStarted = 0", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_Reward6"] = {{{"rewardEventHasStarted = 1", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$40100", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40141", 3)}, {HW2_Wait(0.5)}, {{"rewardEventPlaying = 0", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40144", 8), {"Rule_Add ('Rule_spawnEliteCorvettes1')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(3)}, {{"rewardEventHasStarted = 0", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_frigateAttack"] = {{HW2_SubTitleEvent(Actor_FleetCommand, "$40160", 3), {"FOW_RevealGroup('FrigateAttackers', 1)", ""},}, {HW2_Wait(0.5)}, {HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, HW2_Wait(4)}, {{"Camera_FocusSobGroup('FrigateGuardFocus', 1, 500, 1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40161", 8), {"ping_frigateAttackers_id = Ping_AddSobGroup(ping_frigateAttackers, 'anomaly', 'FrigateAttackers')", ""}, {"Ping_AddDescription(ping_frigateAttackers_id, 0, '$40427')", ""},}, {HW2_Wait(3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40162", 8)}, {HW2_Wait(1)}, {HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Sensors_EnableToggle(1)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_MelarnIsComing"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40167", 8)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40168", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(1)}, {{"MelarnIsComingEventFinished = 1", ""}, {"EventPlaying = 0", ""},},}
Events["intelevent_WithHelpOfMelarn"] = {{{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6405')", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40170", 8)}, {HW2_Wait(1)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""}, {"NIS02B_Playing = 0", ""},},}
Events["intelevent_frigatesDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40165", 8)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_melarnDamaged"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40240", 8)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40241", 8), {"ping_melarnSoban_id = Ping_AddSobGroup(ping_melarnSoban, 'anomaly', 'MelarnSoban')", ""}, {"Ping_AddDescription(ping_melarnSoban_id, 0, '$40426')", ""}, {"obj_prim_saveMelarn_id = Objective_Add(obj_prim_saveMelarn , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_saveMelarn_id, '$40470')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40242", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_melarnCriticallyDamaged"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40243", 8)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40242", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_melarnDestroyed"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40245", 8)}, {HW2_LocationCardEvent("$40021", 4)}, {{"setMissionComplete(0)", ""},},}
Events["intelevent_carrierFleeing"] = {{{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1)}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(3)}, {{"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40175", 6), {"pointer_enemyCarrier_id = HW2_CreateEventPointerSobGroup('EnemyCarrier')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40176", 10), {"obj_prim_destroycarrier_id = Objective_Add(obj_prim_destroycarrier , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_destroycarrier_id, '$40460')", ""}, {"Objective_AddDescription(obj_prim_destroycarrier_id, '$40461')", ""}, {"Objective_AddDescription(obj_prim_destroycarrier_id, '$40462')", ""}, {"ping_enemyCarrier_id = Ping_AddSobGroup(ping_enemyCarrier, 'anomaly', 'EnemyCarrier')", ""}, {"Ping_AddDescription(ping_enemyCarrier_id, 0, '$40420')", ""}, {"ping_carrierExitPoint_id = Ping_AddPoint(ping_carrierExitPoint, 'anomaly', 'CarrierFleeSphere')", ""}, {"Ping_AddDescription(ping_carrierExitPoint_id, 0, '$40420')", ""},}, {{"EventPointer_Remove(pointer_enemyCarrier_id)", ""}, HW2_Wait(2)}, {{"Universe_EnableSkip(0)", ""}, HW2_Pause(0), HW2_Letterbox(0), {"Sensors_Toggle(0)", ""}, {"Rule_AddInterval('Rule_intelevent_carrierEscaped',3)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6406')", ""},}, {HW2_Wait(2), {"Sound_ExitIntelEvent()", ""},}, {{"EventPlaying = 0", ""},},}
Events["intelevent_carrierEscaped"] = {{HW2_Letterbox(1), HW2_Wait(4)}, {{"Camera_FocusSobGroup('EnemyCarrier', 1, 1500, 1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40177", 7), {"Objective_SetState(obj_sec_destroyFighterFacility_id, OS_Failed)", ""}, {"Ping_Remove(ping_enemyCarrier_id)", ""}, {"Ping_Remove(ping_carrierExitPoint_id)", ""},}, {HW2_Wait(2)}, {HW2_Fade(2), HW2_Wait(2)}, {HW2_LocationCardEvent("$40021", 4)}, {{"setMissionComplete(0)", ""},},}
Events["intelevent_carrierDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40178", 6), {"carrierDestroyed = 1", ""}, {"Objective_SetState(obj_prim_destroycarrier_id, OS_Complete)", ""}, {"Ping_Remove(ping_carrierExitPoint_id)", ""}, HW2_Wait(4)}, {{"Sound_ExitIntelEvent()", ""}, {"Rule_AddInterval ('Rule_intelevent_sobanLeaving', 2)", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""}, {"carrierDestroyedHasPlayed = 1", ""},},}
Events["intelevent_sobanLeaving"] = {{{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(4)}, {HW2_Wait(0.5)}, {{"Camera_FocusSobGroup('MelarnSoban', 1, 250, 1)", ""}, {"SobGroup_SetTactics('MelarnSoban', PassiveTactics)", ""}, {"SobGroup_SetTactics('MelarnFleet', PassiveTactics)", ""}, {"SobGroup_Stop(4, 'MelarnSoban')", ""}, {"SobGroup_Stop(3, 'MelarnFleet')", ""}, {"Ping_Remove(ping_melarnSoban_id)", ""}, {"SobGroup_FormStrikeGroup('MelarnFleetAll', 'tortoise')", ""}, {"SobGroup_Move(4, 'MelarnSoban', 'MelarnMovePoint')", ""}, {"SobGroup_Move(3, 'MelarnFleet', 'MelarnMovePoint')", ""}, HW2_SubTitleEvent(Actor_Talorn, "$40179", 2)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_Talorn, "$40180", 7)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_Talorn, "$40181", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_Talorn, "$40182", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_Talorn, "$40183", 8)}, {{"Rule_Add ('Rule_melarnHyperspaceOut')", ""}, HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_Talorn, "$40185", 3), {"tellMelarnToHyperspaceOut = 1", ""},}, {HW2_Wait(0.5)}, {{"Rule_Add('Rule_intelevent_standbyForHyperspace')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40190", 8)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$40191", 7)}, {HW2_Wait(1)}, {{"SobGroup_SetInvulnerability('Player_Ships0', 0)", ""}, HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Sensors_EnableToggle(1)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6407')", ""},}, {HW2_Wait(2), {"Sound_ExitIntelEvent()", ""},}, {{"EventPlaying = 0", ""},},}
Events["intelevent_standbyForHyperspace"] = {{HW2_Letterbox(1), HW2_Wait(4)}, {{"Sound_SetMuteActor('Fleet')", ""}, {"Camera_FocusSobGroup('PlayerMothership', 1, 2500, 1)", ""}, HW2_Wait(1)}, {{"Rule_Add ('Rule_convoysReturnHome')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$40197", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40192", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40193", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40195", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$40194", 6), {"Universe_AllowPlayerOrders(0)", ""},}, {HW2_Wait(0.5)}, {{"Universe_Fade(1, 1.5)", ""},}, {HW2_Wait(2.5)}, {{"Rule_Remove ('Rule_convoyLostWatch')", ""}, {"Rule_Remove ('Rule_intelevent_convoysDamaged')", ""}, {"SobGroup_Despawn('Convoy_1')", ""}, {"SobGroup_Despawn('Convoy_2')", ""}, {"SobGroup_Despawn('Convoy_3')", ""}, {"SobGroup_Despawn('Convoy_4')", ""}, {"SobGroup_Despawn('Convoy_5')", ""}, {"SobGroup_Despawn('Convoy_6')", ""}, {"Player_InstantDockAndParade(0, 'PlayerMothership', 0)", "", 0}, {"Player_InstantlyGatherAllResources(0)", ""}, {"Camera_FocusSobGroup('PlayerMothership', 1, 4000, 0)", ""},}, {{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {HW2_Wait(0.5)}, {{"Universe_Fade(0, 1.5)", ""},}, {HW2_Wait(1.5)}, {{"SobGroup_EnterHyperSpaceOffMap('PlayerMothership')", ""},}, {HW2_Wait(12)}, {{"Universe_Fade(1, 1.5)", ""},}, {HW2_Wait(1.5)}, {HW2_LocationCardEvent("$40022", 2), {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},}, {HW2_Wait(0.5)}, {{"setMissionComplete(1)", ""},},}
Events["intelevent_fighterFacilityDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$40252", 8), {"Objective_SetState(obj_sec_destroyFighterFacility_id, OS_Complete)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_playerloses"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$40021", 4)}, {{"setMissionComplete(0)", ""},},}
