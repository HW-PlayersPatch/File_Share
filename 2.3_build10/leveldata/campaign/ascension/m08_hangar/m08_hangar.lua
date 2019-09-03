--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M08_Progenitor_Hangar
--  Purpose:  Mission 8 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/playerspatch_util.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")

KeeperTrapFXStarted = 0
Inhibitor1Installed = 0
Inhibitor2Installed = 0
Inhibitor3Installed = 0


-- ===== INIT =====================================================================
function OnInit()
	SPRestrict()
	-- turn off speech so you don't hear wacky stuff when the fleet hyperspaces in
	Sound_EnableAllSpeech( 0 )
	
	Rule_Add ("Rule_PlayAmbientMusic")
	Rule_Add("Rule_Init")
	Camera_UseCameraPoint("camera1")
end

-- pre-load stuff here
function OnStartOrLoad()
	print ("KeeperTrapFXStarted = "..KeeperTrapFXStarted)
	print ("Inhibitor1Installed = "..Inhibitor1Installed)
	print ("Inhibitor2Installed = "..Inhibitor2Installed)
	print ("Inhibitor3Installed = "..Inhibitor3Installed)
	
	NISLoad( "nis/NIS08" )					-- load the NIS here so there's no stutter when we play it later
	if ( KeeperTrapFXStarted == 1 ) then
		print ("trying to play trap fx!")
--		Rule_Add ("Rule_playeffect_hyperspaceTrap1")
		FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "EffectPoint02", "EffectPoint01", 10 )
		FX_PlayEffect ( "pro_tech_beam_burn_ring", "EffectPoint02", 10 )
		FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "EffectPoint02", 10 )
		
		FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "EffectPoint03", "EffectPoint01", 10 )
		FX_PlayEffect ( "pro_tech_beam_burn_ring", "EffectPoint03", 10 )
		FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "EffectPoint03", 10 )
		FX_StartEvent( "InhibitorChunk1", "Activate" )

		FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "EffectPoint04", "EffectPoint01", 10 )
		FX_PlayEffect ( "pro_tech_beam_burn_ring", "EffectPoint04", 10 )
		FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "EffectPoint04", 10 )
		FX_PlayEffect ( "pro_tech_trap_combo", "EffectPoint01", 10 )
		FX_StartEvent( "InhibitorChunk3", "Activate" )
		FX_StartEvent( "InhibitorChunk2", "Activate" )
		FX_StartEvent( "InhibitorChunk1", "Activate" )
		
	end
	if ( Inhibitor1Installed == 1 ) then
		Rule_Add ("Rule_playeffect_inhibitor1Attached")
	end
	if ( Inhibitor2Installed == 1 ) then
		Rule_Add ("Rule_playeffect_inhibitor2Attached")
	end
	if ( Inhibitor3Installed == 1 ) then
		Rule_Add ("Rule_playeffect_inhibitor3Attached")
	end
end


function Enable_ResearchOptions()
	-----BUILD DATA----- 
	-----RESEARCH DATA----- 
	Player_UnrestrictResearchOption( 0, "TorpedoFrigateHealthUpgrade1" ) --TorpedoFrigateHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "TorpedoFrigateMAXSPEEDUpgrade1" ) --TorpedoFrigateMAXSPEEDUpgrade1 
end

function Rule_Init()

   --set the player fleet's team colour to that of the player's profile
    local baseColour = {}
    local stripeColour = {}
    local badgeName = ""
    baseColour = Profile_GetTeamColourBase()
    stripeColour = Profile_GetTeamColourStripe()
    badgeName = Profile_GetTeamColourBadge()
    if (badgeName ~= "") then
        print("singlePlayerLevelLoaded: found profile team colours - setting now")
        print("WARNING: badge: "..badgeName)
        Player_SetTeamColourTheme(0, baseColour, stripeColour, badgeName, baseColour, "")
    end

	SobGroup_LoadPersistantData("Hgn_Mothership")


	-- set player names
	Player_SetPlayerName(0, "$43803")			-- Hiigaran Navy
	Player_SetPlayerName(1, "$43804")			-- Progenitor (Keeper Destroyer / Attack Droids)
	Player_SetPlayerName(2, "$43804")			-- Progenitor (Dreadnaught)
	Player_SetPlayerName(3, "$43804")			-- Progenitor (Veil Chunks)
	Player_SetPlayerName(4, "")				-- Progenitor (Inhibitors)

	
	-- reveal fog of war on Dreadnaught Berth
	FOW_RevealGroup("Berth", 1)						-- Reveal fog of war for chunk w/ inhibitor installed

	-- disable the CPU player
	CPU_Enable( 1, 0 )
	CPU_Enable( 2, 0 )
	CPU_Enable( 3, 0 )
	CPU_Enable( 4, 0 )


	-- Allow passive actions (i.e. docking with a latched ship) for the Dreadnaught so the Movers can dock with it
	SobGroup_AllowPassiveActionsAlways ("Dreadnaught", 1)
	
	-- Allow Dreadnaught to remain in sobgroup after switching owner
	SobGroup_SetSwitchOwnerFlag ( "Dreadnaught", 0)
	
	-- Turn off engine glow on Dreadnaught
	SobGroup_ManualEngineGlow ( "Dreadnaught", 0)

	-- set starting camera position
	

	-- set speech pathname
	Sound_SpeechSubtitlePath("speech:missions/m_08/")

	-- create temporary sobgroup
	SobGroup_Create("NISTriggerShips")
	SobGroup_Create("tempSobGroup")
	SobGroup_Create("tempSobGroupOne")
	SobGroup_Create("tempSobGroupTwo")
	

	-- objectives
	obj_prim_investigatePowerSignature = "$43500"			-- Investigate power signature
	obj_prim_investigatePowerSignature_id = 0
	
	obj_prim_retrieveDreadnaught = "$43501"				-- Use Movers to retrieve the Dreadnaught
	obj_prim_retrieveDreadnaught_id = 0
	
	obj_prim_protectFleet = "$43502"					-- Protect the Fleet
	obj_prim_protectFleet_id = 0
	
	obj_prim_installInhibitors = "$43503"					-- Use Movers to install Hyperspace Inhibitors on derelicts
	obj_prim_installInhibitors_id = 0

	obj_prim_sendProbes = "$43504"					-- Send probes to scan for trigger devices.
	obj_prim_sendProbes_id = 0

	
	
	-- pings
	ping_powerSignature = "$43900"					-- Power Signature
	ping_powerSignature_id = 0

	ping_dreadnaught = "$43901"						-- Dreadnaught
	ping_dreadnaught_id = 0
	
	ping_keeper = "$43902"							-- Keeper
	ping_keeper_id = 0
	
	ping_derelict1 = "$43903"							-- Inhibitor location 1
	ping_derelict1_id = 0

	ping_derelict2 = "$43904"							-- Inhibitor location 2
	ping_derelict2_id = 0

	ping_derelict3 = "$43905"							-- Inhibitor location 3
	ping_derelict3_id = 0

	ping_inhibitor1 = "$43906"						-- Inhibitor location 1
	ping_inhibitor1_id = 0

	ping_inhibitor2 = "$43906"						-- Inhibitor location 2
	ping_inhibitor2_id = 0

	ping_inhibitor3 = "$43906"						-- Inhibitor location 3
	ping_inhibitor3_id = 0

	ping_inhibitorfield ="$43906"						-- Devices
	ping_inhibitorfield_id = 0

	ping_probeLocation1 ="$43907"						-- Scan area
	ping_probeLocation_id1 = 0

	ping_probeLocation2 ="$43907"						-- Scan area
	ping_probeLocation_id2 = 0

	ping_probeLocation3 ="$43907"						-- Scan area
	ping_probeLocation_id3 = 0

	ping_probeLocation4 ="$43907"						-- Scan area
	ping_probeLocation_id4 = 0

	ping_probeLocation5 ="$43907"						-- Scan area
	ping_probeLocation_id5 = 0

	ping_probeLocation6 ="$43907"						-- Scan area
	ping_probeLocation_id6 = 0

	
	
	-- pointers
	pointer_powerSignature_id = 0
	pointer_dreadnaught_id = 0
	pointer_keeper_id = 0
	pointer_inhibitor1_id = 0

	pointer_derelict1_id = 0
	pointer_derelict2_id = 0
	pointer_derelict3_id = 0

	-- global vars
	g_now_time = Universe_GameTime()
	g_playerID = Universe_CurrentPlayer()
	g_save_id = 0

	-- Dreadnaught vars
	PlayerHasDreadnaught = 0
	DreadnaughtDockedWithMS = 0
	DreadnaughtIsMoving = 0
	DreadnaughtInProximityOfMS = 0

	-- Inhibitor vars

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
	
	
	-- effect vars
	playEffect2ONCE = 0
	playEffect3ONCE = 0

	test_01 = 0
	test_02 = 1


	-- Keeper vars
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
	
	SobGroup_Create ("AttackDroid_Dreadnaught")
	SobGroup_Create ("AttackDroid_Inhibitor")
	SobGroup_Create ("MoversLatchedToInhibitor1")
	SobGroup_Create ("MoversLatchedToInhibitor2")
	SobGroup_Create ("MoversLatchedToInhibitor3")
	SobGroup_Create ("InhibitorDroidTargets")


	-- Intel events
	
	intelevent_meetTheKeeperISDONE = 0
	intelevent_dreadnaughtAnalysisISDONE = 0
	intelevent_keeperTrappedISDONE = 0
	EventPlaying = 0
	PlayDroidAnalysisONCE = 0
	
	-- Research
	HW2_SetResearchLevel( 8 )

--	Player_GrantBuildOption( 0, "Hgn_MoverControlSubsystem" )

 	Hyperspace_SetStateForPlayer( 0, 0 )							-- Disable hyperspace in this mission

	-- Sob Group setup
	PlayerMothership = "PlayerMothership"
	SobGroup_Create(PlayerMothership)
	Player_FillShipsByType( PlayerMothership, 0, "Hgn_Mothership" )         -- Put the player's Mothership into a sob group
	
	PlayerCarriers = "PlayerCarriers"
	SobGroup_Create(PlayerCarriers)
	Player_FillShipsByType( PlayerCarriers, 0, "Hgn_Carrier" )         -- Put the player's Carriers into a sob group
	
	PlayerBattlecruisers = "PlayerBattlecruisers"
	SobGroup_Create(PlayerBattlecruisers)
	Player_FillShipsByType( PlayerBattlecruisers, 0, "Hgn_BattleCruiser" )         -- Put the player's Battlecruisers into a sob group
	
	PlayerShipyards = "PlayerShipyards"
	SobGroup_Create(PlayerShipyards)
	Player_FillShipsByType( PlayerShipyards, 0, "Hgn_Shipyard" )         -- Put the player's Shipyards into a sob group

	-- Hyperspace player 4's ship off the map permanently (player 4 needs a ship so the HSInhibitors can be switched to player 4 later in the mission)
	SobGroup_EnterHyperSpaceOffMap("Player4Ship")				-- hyperspace out


	SobGroup_SetDisplayedRestrictedHardpoint("PlayerMothership", 0)

	-------------------------------------------------------------------------------------------------
	-- Game logic


	-- Keeper
	
	SetAlliance( 1, 2 )								-- Set alliance between Keeper and Dreadnaught
	SetAlliance( 2, 1 )
	SetAlliance( 1, 3 )								-- Set alliance between Keeper and Megaliths
	SetAlliance( 3, 1 )

--	Rule_Add ("Rule_testKeeperBuildAbility")
--	Rule_AddInterval ("Rule_keeperStart", 8)


	-- start the logic for the Dreadnaught retrieval
	Rule_Add ("Rule_startDreadnaughtRetrieval")

--	Rule_Add ("Rule_launchDreadnaughtFromMS")



	-- start logic for Inhibitor installation
	Rule_AddInterval ("Rule_startInhibitorInstall", 1)

	-- special effects (testing)
--	Rule_Add ("Rule_playeffect_hyperspaceTrap")




--	Rule_AddInterval ("Rule_testStatements", 10)

	-------------------------------------------------------------------------------------------------




	-------------------------------------------------------------------------------------------------
	-- Intel events
	-------------------------------------------------------------------------------------------------
	Rule_Add("Rule_intelevent_intro")					-- intro event: power signature detected / invetigate / etc.

	Rule_AddInterval ("Rule_intelevent_meetTheKeeper", 2)			-- Local hyperspace drives are offline.

--	Rule_Add ("Rule_intelevent_NISDone")				-- After NIS is done, start 'retrieve the Dreadnaught' intel event

	Rule_AddInterval ("Rule_intelevent_raisingTheDreadnaught", 2)	-- Movers locked on / We have the Dreadnaught

--	Rule_Add("Rule_intelevent_dreadnaughtMoverLost")	-- Mover lost / Assign additional movers to retrieve the Dreadnaught

--	Rule_Add("Rule_intelevent_dreadnaughtDocked")		-- Dreadnaught docked / Science teams and crew transferring / ...

	
--	Rule_Add("Rule_intelevent_keeperTrapped")			-- The Keeper is trapped...


--	Rule_Add("Rule_intelevent_inhibitorsEnRoute")		-- Inhibitor One en route / Inhibitor Two en route / ...

--	Rule_Add ("Rule_intelevent_inhibitorsInstalled")		-- Inhibitor 1 installed / Inhibitor 2 installed / ... 

--	Rule_Add ("Rule_watchForTOTALInhibitorsInstalled")	-- watches for TOTALInhibitorsInstalled variable to increment
	
--	Rule_Add ("Rule_intelevent_distortionFieldActive")	-- Hyperspace distortion field active.


	Rule_AddInterval ("Rule_intelevent_mothershipDestroyed", 3)		-- MISSION FAILED

--	Rule_Add ("Rule_intelevent_letsGo")				-- Hyperspace module charged / Initiating hyperspace


	-------------------------------------------------------------------------------------------------

--	Rule_Add ("Rule_testTimer")


	-- for testing
--	Rule_AddInterval ("Rule_intelevent_cannotDefeatKeeper", 25)	-- after some time, play event about having a plan for the trap

--	Rule_AddInterval ("Rule_testDeSpawn", 45)

--	SobGroup_Despawn( "SpawnGroup" )
	Rule_Add ("Rule_GetReactiveFleetRatio")
	
	HW2_ReactiveInfo()

	
	Rule_Remove( "Rule_Init" )
	
end

function Rule_GetReactiveFleetRatio()
	ReactiveFleetSize = GetReactiveFleetSizeInRU()
	print ("Reactive fleet size = "..ReactiveFleetSize)
	PlayerFleetSize = GetActualPlayerFleetSizeInRU()
	print ("Player fleet size = "..PlayerFleetSize)

	--Load expanded options
	--dofilepath("data:scripts/playerspatch_util.lua")
	RefMissionDifficultyScale = GetMissionDifficultyScale()
	
	ReactiveFleetRatio = ((PlayerFleetSize / ReactiveFleetSize) * RefMissionDifficultyScale)  --Multiplied with difficulty value
	print ("Reactive fleet ratio = "..ReactiveFleetRatio)

	-- grant various upgrades based on player's reactive fleet ratio
	if ( ReactiveFleetRatio > 0.75 ) and ( ReactiveFleetRatio < 1 ) then
		print("SCAR: going low")
		Player_GrantResearchOption( 1, "KeeperHealthUpgradeSPGAME_LOW" )		-- Give Keeper a health upgrade to make him challenging to kill
		Player_GrantResearchOption( 1, "AttackDroidHealthUpgradeSPGAME_LOW" )	-- Give Attack Droids a health upgrade to make them more challenging to kill
		Player_GrantResearchOption( 1, "AttackDroidWeaponUpgradeSPGAME_LOW" )	-- Give Attack Droids a health upgrade to make them more challenging to kill
	elseif ( ReactiveFleetRatio >= 1 ) and ( ReactiveFleetRatio < 1.25 ) then
		print("SCAR: going medium")
		Player_GrantResearchOption( 1, "KeeperHealthUpgradeSPGAME_MED" )		-- Give Keeper a health upgrade to make him challenging to kill
		Player_GrantResearchOption( 1, "AttackDroidHealthUpgradeSPGAME_MED" )	-- Give Attack Droids a health upgrade to make them more challenging to kill
		Player_GrantResearchOption( 1, "AttackDroidWeaponUpgradeSPGAME_MED" )	-- Give Attack Droids a health upgrade to make them more challenging to kill
	elseif ( ReactiveFleetRatio >= 1.25 ) then
		print("SCAR: going high")
		Player_GrantResearchOption( 1, "KeeperHealthUpgradeSPGAME_HIGH" )		-- Give Keeper a health upgrade to make him challenging to kill
		Player_GrantResearchOption( 1, "AttackDroidHealthUpgradeSPGAME_HIGH" )	-- Give Attack Droids a health upgrade to make them more challenging to kill
		Player_GrantResearchOption( 1, "AttackDroidWeaponUpgradeSPGAME_HIGH" )	-- Give Attack Droids a health upgrade to make them more challenging to kill
	end

	Rule_Remove ("Rule_GetReactiveFleetRatio")
end

function Rule_testHyperspace1()
	SobGroup_EnterHyperSpaceOffMap("PlayerMothership")
	Rule_Add ("Rule_testHyperspace2")
	Rule_Remove ("Rule_testHyperspace1")
end

function Rule_testHyperspace2()
	if ( SobGroup_AreAllInHyperspace ("PlayerMothership") == 1) then
		print ("AreAllInHyperspace is working!!!!!!!!")
		Rule_Add ("Rule_testHyperspace3")
		Rule_Remove ("Rule_testHyperspace2")
	end
end

function Rule_testHyperspace3()
	print ("Telling Mothership to come out of hyperspace now")
	SobGroup_ExitHyperSpace("PlayerMothership", "ProbeSphere6" )
	Rule_Add ("Rule_testHyperspace4")
	Rule_Remove ("Rule_testHyperspace3")
end


function Rule_testHyperspace4()
	if ( SobGroup_AreAllInRealSpace ("PlayerMothership") == 1) then
		print ("AreAllInRealSpace is working!!!!!!!!")
	end
end


--~ function Rule_testDeSpawn()
--~ 	print ("Despawning fake inhibitors!")
--~ 	SobGroup_Despawn( "FakeInhibitors" )
--~ 	print ("Spawning real inhibitors!")
--~ 	SobGroup_Spawn( "HSInhibitor1", "SpawnSphere1" )
--~ 	SobGroup_Spawn( "HSInhibitor2", "SpawnSphere2" )
--~ 	SobGroup_Spawn( "HSInhibitor3", "SpawnSphere3" )
--~ 	Rule_Remove ("Rule_testDeSpawn")
--~ end


function Rule_testTimer()
--	Timer_Start("TEST_TIMER", 5)		-- start timer
--	Timer_Display("TEST_TIMER")		-- display timer on screen
--	Rule_Add ("Rule_checkTimer")
	Rule_AddInterval ("Rule_testIntervalRules", 30)
	Rule_Remove ("Rule_testTimer")
end

function Rule_testIntervalRules()
	print ("this should be 30 seconds late!")
	Rule_Remove ("Rule_testIntervalRules")
end

function Rule_checkTimer()
--	Timer_Display("TEST_TIMER")
	if ( Timer_GetRemaining("TEST_TIMER") == 0) then
		print ("timer has ended!")
		Rule_Remove ("Rule_checkTimer")
	end
end





function Rule_testStatements()
	if ( test_01 == 0) then
		print ("first one has come true - removing rule!")
		Rule_Remove ("Rule_testStatements")
	elseif ( test_02 == 1) then
		print ("second part has come true - this is very bad!")
		Rule_Remove ("Rule_testStatements")
	end
end



-- ===== INTEL EVENTS ==========================================================================

-- intro event: power signature detected / investigate / etc.
function Rule_intelevent_intro()
	if( Universe_GameTime() >= g_now_time + 8 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_intro" )
		Rule_Add( "Rule_EnableResearchAfterIntelevent" )
		Rule_Remove( "Rule_intelevent_intro" )
	end
end

function Rule_EnableResearchAfterIntelevent()
	if (Event_IsDone( "intelevent_intro" ) == 1 ) then
		Enable_ResearchOptions()
		Rule_Remove( "Rule_EnableResearchAfterIntelevent" )
	end
end


-- When player has ships near the power signature, play the 'NIS'
function Rule_intelevent_meetTheKeeper()
	Player_FillSobGroupInVolume( "NISTriggerShips", 0, "NIS08Sphere")	-- get all player ships in the volume around the Dreadnaught
	
	if (EventPlaying == 0) and ( SobGroup_Empty("NISTriggerShips") == 0 ) then
		if ( Sensors_ManagerIsUp() == 1 ) then					-- if player is in the sensors manager
			Sensors_Toggle(0)								-- take them out
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			SetAlliance( 0, 2 )								-- Set alliance between player and Dreadnaught
			SetAlliance( 2, 0 )
			Sound_EnterIntelEvent()
			Event_Start( "intelevent_meetTheKeeper" )
			Rule_Remove( "Rule_intelevent_meetTheKeeper" )
		else
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			SetAlliance( 0, 2 )								-- Set alliance between player and Dreadnaught
			SetAlliance( 2, 0 )
			Sound_EnterIntelEvent()
			Event_Start( "intelevent_meetTheKeeper" )
			Rule_Remove( "Rule_intelevent_meetTheKeeper" )
		end
	end
	
end



-- After 'NIS' has played, play Intel Event telling the player to retrieve the Dreadnaught
function Rule_intelevent_NISDone()
--	if ( Event_IsDone("intelevent_meetTheKeeper") == 1 ) then
--	if ( intelevent_meetTheKeeperISDONE == 1 ) then
	if ( NISComplete( g_currentNISPlaying_id ) == 1 ) then
--		Camera_SetLetterboxState(0, 0 )
		EventPlaying = 0
		Sensors_EnableToggle(1)							-- Allow going in and out of the Sensors Manager
	        SobGroup_SetSpeed("Keeper", 0.0)							-- slow the Keeper down so he doesn't move too far
		Rule_AddInterval ("Rule_intelevent_retrieveTheDreadnaught", 1)
--		Rule_AddInterval ("Rule_turnUIBackOn", 1)					-- turn the UI back on
--		SobGroup_Move( 1, "Keeper", "KeeperMovePoint" )				-- give Keeper a move order after NIS to make it look more interesting
--	        SobGroup_SetSpeed("Keeper", 0.70)							-- slow the Keeper down so he doesn't move too far
		Rule_AddInterval ("Rule_keeperStart", 20)					-- make the Keeper start building Droids and then go into hiding
		Rule_Remove( "Rule_intelevent_NISDone" )
	end
end

function Rule_turnUIBackOn()
	Camera_SetLetterboxStateNoUI(0, 0 )
	Rule_Remove ("Rule_turnUIBackOn")
end

-- The Progenitor Dreadnaught has been located / Use Movers to retrieve it / ...
function Rule_intelevent_retrieveTheDreadnaught()
	if (EventPlaying == 0) then
	        SobGroup_SetSpeed("Keeper", 0.70)							-- slow the Keeper down so he doesn't move too far
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_retrieveTheDreadnaught" )
		Rule_Remove( "Rule_intelevent_retrieveTheDreadnaught" )
	end
end


function Rule_intelevent_hyperspaceDisabled()
	if (EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_hyperspaceDisabled" )
		Rule_Remove( "Rule_intelevent_hyperspaceDisabled" )
	end
end


-- Movers locked on / We have the Dreadnaught
function Rule_intelevent_raisingTheDreadnaught()
	if (EventPlaying == 0) and ( PlayerHasDreadnaught == 1 ) then							-- if the player has got the dreadnaught
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_raisingTheDreadnaught" )				-- play an event about it
		Rule_AddInterval ("Rule_intelevent_makeKeeperAttackFleet", 60)	-- set timed rule for Keeper to attack fleet
		Rule_Add ("Rule_intelevent_keeperAttacking")				-- watch for Keeper to actually start attacking
		Rule_Remove( "Rule_intelevent_raisingTheDreadnaught" )
	end
end

-- Repeat of above event for the times where the DN has stalled and is re-started
function Rule_intelevent_raisingTheDreadnaughtREPEAT()
	if (EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_raisingTheDreadnaught" )				-- play an event about it
		Rule_Remove( "Rule_intelevent_raisingTheDreadnaughtREPEAT" )
	end
end


-- tell the player that Droids are just corvettes!
function Rule_intelevent_droidAnalysis()
	if (EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_droidAnalysis" )
		Rule_Remove( "Rule_intelevent_droidAnalysis" )
	end
end

-- tells the Keeper to go attack the fleet
function Rule_intelevent_makeKeeperAttackFleet()
	KeeperAttackFleet = 1										-- set variable that makes Keeper attack
	Rule_Remove ("Rule_intelevent_makeKeeperAttackFleet")
end


-- watches for Keeper to start attacking the player's fleet, then plays an event about it
function Rule_intelevent_keeperAttacking()
	if (EventPlaying == 0) and ( KeeperIsAttacking == 1 ) then								-- if Keeper is actually attacking
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_keeperAttacking" )					-- The Keeper is attacking / Protect the fleet
--		Rule_AddInterval ("Rule_intelevent_buildInhibitors", 190)		-- after some time, build some inhibitors and play event about creating the trap
--		Rule_AddInterval ("Rule_intelevent_installInhibitors", 190)		-- after some time, play event about creating the trap
		Rule_Remove ("Rule_intelevent_keeperAttacking")
	end
end




-- Mover lost / Assign additional movers to retrieve the Dreadnaught
function Rule_intelevent_dreadnaughtMoverLost()
	if (EventPlaying == 0) then								-- if the Dreadnaught has stalled
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_dreadnaughtMoverLost" )				-- play an event about it
		Rule_Remove( "Rule_intelevent_dreadnaughtMoverLost" )
	end
end


-- Let player know when the Dreadnaught has docked and the "crew" is transferring
function Rule_intelevent_dreadnaughtDocked()
	if (EventPlaying == 0) and ( DreadnaughtDockedWithMS == 1 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_dreadnaughtDocked" )
		Rule_AddInterval ("Rule_intelevent_dreadnaughtAnalysis", 60)		-- <x> seconds later, do some 'analysis' of the Dreadnaught
		Rule_Remove( "Rule_intelevent_dreadnaughtDocked" )
	end
end


-- Let the player know why the almighty Dreadnaught can't do squat
function Rule_intelevent_dreadnaughtAnalysis()
	if (EventPlaying == 0) and (intelevent_dreadnaughtDockedISDONE == 1) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_dreadnaughtAnalysis" )
		Rule_Remove( "Rule_intelevent_dreadnaughtAnalysis" )
	end
end




-- start creation of Inhibitors at Mothership (needed for Intel event)
--function Rule_intelevent_buildInhibitors()
--	Rule_Add ("Rule_startInhibitorInstall")							-- start building the Inhibitors
--	Rule_AddInterval ("Rule_intelevent_installInhibitors", 4)				-- wait <x> seconds (enough time for Inhibitor to launch) then start the intel event
--	Rule_Remove( "Rule_intelevent_buildInhibitors" )
--end


-- tell player about plan to use progenitor power modules
function Rule_intelevent_cannotDefeatKeeper()
	if (EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_cannotDefeatKeeper" )						-- can't defeat Keeper with conventional weapons..
		Rule_Remove( "Rule_intelevent_cannotDefeatKeeper" )
	end
end

PlayerShipsInVolume = {}
ProbesInSphere = {}
ProbeInPosition = {0, 0, 0, 0, 0, 0}

-- watch for probes to be deployed in pre-defined locations
function Rule_WatchForProbes()
--	print ("Watching for Probes in volume: "..volNumber)
	volNumber = volNumber + 1
	if ( RemoveWatchForProbes == 1) then
		Rule_Remove ("Rule_WatchForProbes")
	else
		-- erin you are not checking if the probes are already in position.
		if ( ProbeInPosition[volNumber] == 0 ) then
			Player_FillSobGroupInVolume( "tempSobGroupOne", 0, "ProbeSphere"..volNumber)			-- get all player ships in probe volume
			if ( SobGroup_Empty("tempSobGroupOne")  == 0) then						-- if there are any player ships in the volume
				print ("Found some player ships in probe volume: "..volNumber)
				SobGroup_FillShipsByType( "tempSobGroupTwo", "tempSobGroupOne", "Hgn_Probe" )	-- filter all Frigates from the attackers
				if ( SobGroup_Empty( "tempSobGroupTwo" ) == 0) and							-- if there are any probes
				   ( SobGroup_GetActualSpeed("tempSobGroupTwo") < 1 ) then							-- and they have come to a stop
					print ("Found STOPPED probes in probe volume: "..volNumber)
					ProbeInPosition[volNumber] = 1														-- set variable to 1 so event will play
				end
			end
			if ( volNumber == 6 ) then						-- if all 6 probe spheres have been checked
				volNumber = 0								-- start at 0 again
			end
			Rule_AddInterval ("Rule_WatchForProbes", 0.25)			-- do the check again in <x> seconds
			Rule_Remove ("Rule_WatchForProbes")
		else
			if ( volNumber == 6 ) then						-- if all 6 probe spheres have been checked
				volNumber = 0								-- start at 0 again
			end
			Rule_AddInterval ("Rule_WatchForProbes", 0.25)			-- do the check again in <x> seconds
			Rule_Remove ("Rule_WatchForProbes")
		end
	end
end


ProbeInPositionONCE = {0, 0, 0, 0, 0, 0}

-- play a speech event when the player gets a probe to each location
function Rule_intelevent_probeInPosition()
	for i = 1, 6 do
		if (EventPlaying == 0) and (ProbeInPosition[i] == 1) and (ProbeInPositionONCE[i] == 0) then
			if (RemoveProbePingONCE1 == 0) and (ProbeInPosition[1] == 1) then
				EventPlaying = 1
				Sound_EnterIntelEvent()
				Event_Start( "intelevent_scansNegative" )
				print ("Removing ping on location 1!")
				RemoveProbePingONCE1 = 1
				Ping_Remove (ping_probeLocation_id1)							-- remove the ping from the location
			end
			if (RemoveProbePingONCE2 == 0) and (ProbeInPosition[2] == 1) then
				EventPlaying = 1
				Sound_EnterIntelEvent()
				Event_Start( "intelevent_noDevicesFound" )
				print ("Removing ping on location 2!")
				RemoveProbePingONCE2 = 1
				Ping_Remove (ping_probeLocation_id2)							-- remove the ping from the location
			end
			if (RemoveProbePingONCE3 == 0) and (ProbeInPosition[3] == 1) then
				EventPlaying = 1
				Sound_EnterIntelEvent()
				Event_Start( "intelevent_scanResultsNegative" )
				print ("Removing ping on location 3!")
				RemoveProbePingONCE3 = 1
				Ping_Remove (ping_probeLocation_id3)							-- remove the ping from the location
			end
			if (RemoveProbePingONCE4 == 0) and (ProbeInPosition[4] == 1) then
				EventPlaying = 1
				Sound_EnterIntelEvent()
				Event_Start( "intelevent_scansNegative" )
				print ("Removing ping on location 4!")
				RemoveProbePingONCE4 = 1
				Ping_Remove (ping_probeLocation_id4)							-- remove the ping from the location
			end
			if (RemoveProbePingONCE5 == 0) and (ProbeInPosition[5] == 1) then
				EventPlaying = 1
				Sound_EnterIntelEvent()
				Event_Start( "intelevent_noDevicesFound" )
				print ("Removing ping on location 5!")
				RemoveProbePingONCE5 = 1
				Ping_Remove (ping_probeLocation_id5)							-- remove the ping from the location
			end
			if (RemoveProbePingONCE6 == 0) and (ProbeInPosition[6] == 1) then
				print ("Removing ping on location 6!")
				RemoveProbePingONCE6 = 1
				Ping_Remove (ping_probeLocation_id6)							-- remove the ping from the location
			end
			ProbeInPositionONCE[i] = 1									-- set one-time variable so check doesn't happen again
		end
	end
end


-- play a speech event when the player gets a probe to the right location
function Rule_intelevent_devicesLocated()
	if (EventPlaying == 0) and ( RemoveProbePingONCE6 == 1) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_devicesLocated" )
		Ping_Remove (ping_probeLocation_id1)							-- remove all the pings
		Ping_Remove (ping_probeLocation_id2)							-- remove all the pings
		Ping_Remove (ping_probeLocation_id3)							-- remove all the pings
		Ping_Remove (ping_probeLocation_id4)							-- remove all the pings
		Ping_Remove (ping_probeLocation_id5)							-- remove all the pings
		Ping_Remove (ping_probeLocation_id6)							-- remove all the pings
		RemoveWatchForProbes = 1
		Rule_Remove ("Rule_WatchForProbes")							-- remove rules to check for probes, because The One has been found!
		Rule_Remove ("Rule_intelevent_probeInPosition")
		Rule_Remove ("Rule_intelevent_devicesLocated")
		
		-- de-spawn fake inhibitors and create the real ones
		print ("Despawning fake inhibitors!")
		SobGroup_Despawn( "FakeInhibitors" )
		print ("Spawning real inhibitors!")
		SobGroup_Spawn( "HSInhibitor1", "SpawnSphere1" )
		SobGroup_Spawn( "HSInhibitor2", "SpawnSphere2" )
		SobGroup_Spawn( "HSInhibitor3", "SpawnSphere3" )
		Rule_AddInterval ("Rule_setInhibitorsToAllowPassiveActions",5)

		-- add rule to play event telling player how to install the inhibitors
		Rule_AddInterval ("Rule_intelevent_installInhibitors", 2)			-- after some time, play event about creating the trap
	end
end

-- allows passive actions on Inhibitors - this makes it possible for the Movers to stay latched to them while they dock
function Rule_setInhibitorsToAllowPassiveActions()
	print ("telling inhibitors to allow passive actions always!!!!  please work!")
	SobGroup_AllowPassiveActionsAlways ("HSInhibitor1", 1)
	SobGroup_AllowPassiveActionsAlways ("HSInhibitor2", 1)
	SobGroup_AllowPassiveActionsAlways ("HSInhibitor3", 1)
	Rule_Remove ("Rule_setInhibitorsToAllowPassiveActions")
end



-- tell player to install inhibitors on veil chunks
function Rule_intelevent_installInhibitors()
	if (EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		
		-- switch inhibitors to player 4
--		SobGroup_SwitchOwner( "HSInhibitor1", 4 )			-- Switch Inhibitor to another player # so the player can't give it orders
--		SobGroup_SwitchOwner( "HSInhibitor2", 4 )			-- Switch Inhibitor to another player # so the player can't give it orders
--		SobGroup_SwitchOwner( "HSInhibitor3", 4 )			-- Switch Inhibitor to another player # so the player can't give it orders
		

		Event_Start( "intelevent_installInhibitors" )						-- install inhibitors on these 3 veil chunks
		
		-- start watching for Movers to latch onto Inhibitors
		Rule_Add ("Rule_watchForMoverDockedToInhibitor1")
		Rule_Add ("Rule_watchForMoverDockedToInhibitor2")
		Rule_Add ("Rule_watchForMoverDockedToInhibitor3")
		
		-- start watching for distortion field to be active
		Rule_Add ("Rule_intelevent_distortionFieldActive")	-- Hyperspace distortion field active.
		
		-- start watching for inhibitors to be en route
		Rule_AddInterval ("Rule_intelevent_inhibitorsEnRoute", 3)		-- Inhibitor One en route / Inhibitor Two en route / ...
		
		--start watching for inhibitors to be installed
		Rule_AddInterval ("Rule_intelevent_inhibitorsInstalled", 2.5)		-- Inhibitor 1 installed / Inhibitor 2 installed / ... 
		
		-- start watching for inhibitors to be installed
		Rule_AddInterval ("Rule_watchForTOTALInhibitorsInstalled", 2)	-- watches for TOTALInhibitorsInstalled variable to increment


		Rule_Remove( "Rule_intelevent_installInhibitors" )
	end
end




-- watch for Inhibitors to start moving
function Rule_intelevent_inhibitorsEnRoute()

	-- inhibitor 1
	if (EventPlaying == 0) and ( Inhibitor1EnRoute == 1 ) and ( Inhibitor1EnRouteONCE == 0) then		-- if inhibitor is moving and one-time variable hasn't been set
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_inhibitor1EnRoute" )
		Inhibitor1EnRouteONCE = 1									-- set one-time variable
	end

	-- inhibitor 2
	if (EventPlaying == 0) and ( Inhibitor2EnRoute == 1 ) and ( Inhibitor2EnRouteONCE == 0) then		-- if inhibitor is moving and one-time variable hasn't been set
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_inhibitor2EnRoute" )
		Inhibitor2EnRouteONCE = 1									-- set one-time variable
	end

	-- inhibitor 3
	if (EventPlaying == 0) and ( Inhibitor3EnRoute == 1 ) and ( Inhibitor3EnRouteONCE == 0) then		-- if inhibitor is moving and one-time variable hasn't been set
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_inhibitor3EnRoute" )
		Inhibitor3EnRouteONCE = 1									-- set one-time variable
	end

	-- all inhibitors installed, remove the rule so it doesn't keep checking
	if ( (Inhibitor1EnRoute == 1) and (Inhibitor2EnRoute == 1) and (Inhibitor3EnRoute == 1) ) then
		Rule_Remove ("Rule_intelevent_inhibitorsEnRoute")
	end
end


function Rule_watchForTOTALInhibitorsInstalled()
	if ( TOTALInhibitorsInstalled == 1) then
		PlayInstalledEvent1 = 1
	elseif ( TOTALInhibitorsInstalled == 2) then
		PlayInstalledEvent2 = 1
	elseif ( TOTALInhibitorsInstalled == 3) then
		PlayInstalledEvent3 = 1
		Rule_Remove ("Rule_watchForTOTALInhibitorsInstalled")
	end
	
end


-- figures out which inhibitor to focus on for first inhibitor installed speech event
function Rule_FocusOnFirstInstalledInhibitor()
	if ( Inhibitor1Installed == 1) then
		Camera_FocusSobGroup( "HSInhibitor1", 1, 500, 1 )
	elseif ( Inhibitor2Installed == 1) then
		Camera_FocusSobGroup( "HSInhibitor2", 1, 500, 1 )
	elseif ( Inhibitor3Installed == 1) then
		Camera_FocusSobGroup( "HSInhibitor3", 1, 500, 1 )
	end
	Rule_Remove ("Rule_FocusOnFirstInstalledInhibitor")
end


-- watch for Inhibitors to be installed
function Rule_intelevent_inhibitorsInstalled()

	-- inhibitor 1
	if (EventPlaying == 0) and ( PlayInstalledEvent1 == 1 ) and (Inhibitor1InstalledONCE == 0) then		-- if inhibitor is installed and one-time variable hasn't been set
		if ( Sensors_ManagerIsUp() == 1 ) then							-- if player is in the sensors manager
			Sensors_Toggle(0)									-- take them out
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start( "intelevent_inhibitor1Installed" )
			Inhibitor1InstalledONCE = 1									-- set one-time variable
		else
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start( "intelevent_inhibitor1Installed" )
			Inhibitor1InstalledONCE = 1									-- set one-time variable
		end
	end

	
	-- inhibitor 2
	if (EventPlaying == 0) and ( PlayInstalledEvent2 == 1 ) and (Inhibitor2InstalledONCE == 0) then		-- if inhibitor is installed and one-time variable hasn't been set
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_inhibitor2Installed" )
		Inhibitor2InstalledONCE = 1									-- set one-time variable
	end

	-- inhibitor 3
	if (EventPlaying == 0) and ( PlayInstalledEvent3 == 1 ) and (Inhibitor3InstalledONCE == 0) then		-- if inhibitor is installed and one-time variable hasn't been set
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_inhibitor3Installed" )
		Inhibitor3InstalledONCE = 1									-- set one-time variable
	end

	-- all inhibitors installed, remove rule so check doesn't happen again
	if ( (Inhibitor1InstalledONCE == 1) and (Inhibitor2InstalledONCE == 1) and (Inhibitor3InstalledONCE == 1) ) then
		Rule_Remove ("Rule_intelevent_inhibitorsInstalled")
	end
end


-- Distortion field active.
function Rule_intelevent_distortionFieldActive()
	if ( TOTALInhibitorsInstalled == 3 ) then									-- if two inhibitors have been installed
		Rule_AddInterval ( "Rule_intelevent_distortionFieldActive_playEvent", 9)	-- delay event for a short time to avoid event overlap
		Rule_AddInterval ( "Rule_intelevent_makeKeeperGetTrapped", 11)			-- set timed rule telling Keeper to fall into trap
		
		Rule_AddInterval ("Rule_intelevent_keeperTrapped", 1)			-- The Keeper is trapped...

		Rule_Remove ("Rule_intelevent_distortionFieldActive")
	end
end


-- sets variable that tells Keeper to hyperspace in to player's trap
function Rule_intelevent_makeKeeperGetTrapped()
--	if ( intelevent_dreadnaughtAnalysisISDONE == 1) then		-- if the Dreadnaught analysis event has played
		print ("Telling Keeper to fall into trap!!!!!")
		KeeperGoGetTrapped = 1								-- set variable telling Keeper to fall into the trap
		Rule_Remove ("Rule_intelevent_makeKeeperGetTrapped")
--	end
end



function Rule_intelevent_keeperTrapped()
	if (EventPlaying == 0) and ( KeeperIsInTrap == 1 ) then
		if ( Sensors_ManagerIsUp() == 1 ) then					-- if player is in the sensors manager
			Sensors_Toggle(0)								-- take them out
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start( "intelevent_keeperTrapped" )
			Rule_Remove ("Rule_intelevent_keeperTrapped")
		else
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			Event_Start( "intelevent_keeperTrapped" )
			Rule_Remove ("Rule_intelevent_keeperTrapped")
		end
	end
end


-- one minute to Keeper self destruct
function Rule_intelevent_oneMinuteToSelfDestruct()
	if (EventPlaying == 0) and ( Timer_GetRemaining(0) < 60) then
		Event_Start( "intelevent_oneMinuteToSelfDestruct" )
		Rule_Add ("Rule_intelevent_thirtySecondsToSelfDestruct")
		Rule_Remove ("Rule_intelevent_oneMinuteToSelfDestruct")
	end
end


-- thirty seconds to Keeper self destruct
function Rule_intelevent_thirtySecondsToSelfDestruct()
	if (EventPlaying == 0) and ( Timer_GetRemaining(0) < 30) then
		Event_Start( "intelevent_thirtySecondsToSelfDestruct" )
		Rule_Remove ("Rule_intelevent_thirtySecondsToSelfDestruct")
	end
end



-- REALLY play event now: Distortion field active.
function Rule_intelevent_distortionFieldActive_playEvent()
	if (EventPlaying == 0) then
		Event_Start( "intelevent_distortionFieldActive" )
		Rule_Remove ("Rule_intelevent_distortionFieldActive_playEvent")
	end
end




-- time to hyperspace out of here
function Rule_intelevent_letsGo()
	if (EventPlaying == 0) and 
	   ( intelevent_dreadnaughtAnalysisISDONE == 1 ) and	-- if the Dreadnaught has docked and been analyzed
	   ( intelevent_keeperTrappedISDONE == 1 ) then		-- and the Keeper self destruct has started
	   	print ("LET'S GET OUT OF HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_letsGo" )						-- let's get outta here!
		Rule_Remove( "Rule_intelevent_letsGo" )
	end
end


-- Watch for Mothership to be destroyed
function Rule_intelevent_mothershipDestroyed()
	if ( SobGroup_Count( "PlayerMothership" ) == 0 ) then
		Event_Start( "intelevent_mothershipDestroyed" )
		Rule_Remove( "Rule_intelevent_mothershipDestroyed" )
	end
end


-- ===== INTEL EVENTS ==========================================================================







-- ===== EFFECTS ===============================================================================
-- wait for variable to be set starting the cascading hyperspace trap effects
function Rule_playeffect_hyperspaceTrap()
	Rule_AddInterval ("Rule_playeffect_hyperspaceTrap1", 2)
	Rule_Remove ("Rule_playeffect_hyperspaceTrap")
end


-- play first effect
function Rule_playeffect_hyperspaceTrap1()
	KeeperTrapFXStarted = 1
	FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "EffectPoint02", "EffectPoint01", 10 )
	FX_PlayEffect ( "pro_tech_beam_burn_ring", "EffectPoint02", 10 )
	FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "EffectPoint02", 10 )
	FX_StartEvent( "InhibitorChunk2", "Activate" )
--	Rule_AddInterval ("Rule_playeffect_hyperspaceTrap1", 1)			-- make effect loop
	if ( playEffect2ONCE == 0 ) then							-- if one-time variable hasn't been set
		Rule_AddInterval ("Rule_playeffect_hyperspaceTrap2", 1.5)		-- start up second effect
		playEffect2ONCE = 1										-- set one-time variable so it doesn't happen again
	end
	Rule_Remove ("Rule_playeffect_hyperspaceTrap1")
end


-- play second effect
function Rule_playeffect_hyperspaceTrap2()
	FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "EffectPoint03", "EffectPoint01", 10 )
	FX_PlayEffect ( "pro_tech_beam_burn_ring", "EffectPoint03", 10 )
	FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "EffectPoint03", 10 )
	FX_StartEvent( "InhibitorChunk1", "Activate" )
--	Rule_AddInterval ("Rule_playeffect_hyperspaceTrap2", 1)			-- make effect loop
	if ( playEffect3ONCE == 0 ) then							-- if one-time variable hasn't been set
		Rule_AddInterval ("Rule_playeffect_hyperspaceTrap3", 1.5)		-- start up third effect
		playEffect3ONCE = 1										-- set one-time variable so it doesn't happen again
	end
	Rule_Remove ("Rule_playeffect_hyperspaceTrap2")
end

-- play third effect
function Rule_playeffect_hyperspaceTrap3()
	FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "EffectPoint04", "EffectPoint01", 10 )
	FX_PlayEffect ( "pro_tech_beam_burn_ring", "EffectPoint04", 10 )
	FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "EffectPoint04", 10 )
	FX_PlayEffect ( "pro_tech_trap_combo", "EffectPoint01", 10 )
	FX_StartEvent( "InhibitorChunk3", "Activate" )
	FX_StartEvent( "InhibitorChunk2", "Activate" )
	FX_StartEvent( "InhibitorChunk1", "Activate" )
--	Rule_AddInterval ("Rule_playeffect_hyperspaceTrap3", 1)			-- make effect loop
	Rule_Remove ("Rule_playeffect_hyperspaceTrap3")
end



-- play an effect at the Inhibitor 
function Rule_playeffect_inhibitor1Attached()
	--FX_PlayEffect( "sp_placeholder1", "EffectPoint03", 100 )
--	Rule_AddInterval ("Rule_playeffect_inhibitor1Attached", 5)
	FX_StartEvent( "HSInhibitor1", "Activate" )
	FX_StartEvent( "InhibitorChunk1", "Activate" )
	FX_StartEvent( "HSInhibitor1", "Pulse" )
	FX_StartEvent( "InhibitorChunk1", "Pulse" )
	Rule_Remove ("Rule_playeffect_inhibitor1Attached")
end

-- play an effect at the Inhibitor 
function Rule_playeffect_inhibitor2Attached()
--	FX_PlayEffect( "sp_placeholder1", "EffectPoint02", 100 )
--	Rule_AddInterval ("Rule_playeffect_inhibitor2Attached", 5)
	FX_StartEvent( "HSInhibitor2", "Activate" )
	FX_StartEvent( "InhibitorChunk2", "Activate" )
	FX_StartEvent( "HSInhibitor2", "Pulse" )
	FX_StartEvent( "InhibitorChunk2", "Pulse" )
	Rule_Remove ("Rule_playeffect_inhibitor2Attached")
end

-- play an effect at the Inhibitor 
function Rule_playeffect_inhibitor3Attached()
--	FX_PlayEffect( "sp_placeholder1", "EffectPoint04", 100 )
--	Rule_AddInterval ("Rule_playeffect_inhibitor3Attached", 5)
	FX_StartEvent( "HSInhibitor3", "Activate" )
	FX_StartEvent( "InhibitorChunk3", "Activate" )
	FX_StartEvent( "HSInhibitor3", "Pulse" )
	FX_StartEvent( "InhibitorChunk3", "Pulse" )
	Rule_Remove ("Rule_playeffect_inhibitor3Attached")
end


-- play an effect for the Dreadnaught launching from the Berth
function Rule_playeffect_dreadnaughtLaunch()
	print ("Trying to play Dreadnaught launch fx!!!!!!!!!!!!")
	FX_StartEvent( "Berth", "Launch" )
	Rule_Remove ("Rule_playeffect_dreadnaughtLaunch")
end


-- ===== EFFECTS ===============================================================================








-- ===== KEEPER LOGIC ==========================================================================

-------------------------------------------------------------------------------------------------
-- PHASE 1 - Retrieving the Dreadnaught
-------------------------------------------------------------------------------------------------

-- start the Keeper's AI
function Rule_keeperStart()						-- /// REAL SPACE \\\
	SobGroup_Create( "KeeperTarget" )				-- create sob group for the ship(s) the Keeper will attack
	SobGroup_Stop( 1, "Keeper")					-- tell Keeper to stop moving
        SobGroup_SetSpeed("Keeper", 1.0)				-- re-set the Keeper's speed back to normal
--	SobGroup_SetROE("Keeper", OffensiveROE)	-- set Keeper's tactics to aggressive


	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
	
	Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
	FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable

	KeeperHealthLocked = 1

	
--	SobGroup_EnterHyperSpaceOffMap("Keeper")				-- hyperspace out

--	Rule_AddInterval ( "Rule_buildDreadnaughtAttackDroidsPhase2", 1)	-- build some attack droids
	Rule_AddInterval ( "Rule_buildDreadnaughtAttackDroids", 1)	-- build some attack droids    -- <<<<<<<<<<<<< DEBUGGING >>>>>>>>>>>>>>>

--	Rule_AddInterval ( "Rule_keeperHide", 1)					-- hide at the retreat points and watch the Dreadnaught
--	Rule_AddInterval ("Rule_keeperDecide", 10)				-- <<<<<<<<<<<<< DEBUGGING >>>>>>>>>>>>>>>
	Rule_Remove ("Rule_keeperStart")
end


-- build Attack Droids at the Dreadnaught
function Rule_buildDreadnaughtAttackDroids()					-- /// REAL SPACE \\\
--	print ("buildDreadnaughtAttackDroids Checking to see if Keeper is out of hyperspace!")
	if ( SobGroup_AreAllInRealSpace( "Keeper" ) == 1) then		-- if the Keeper is out of Hyperspace
		print ("SCAR thinks the Keeper is out of hyperspace now!")
		Rule_Add ("Rule_stopKeeper")						-- stop the Keeper so he doesn't attack the player


--		if ( KeeperHealthLocked == 1) then					-- remove lock on Keeper's health
--			Rule_Remove ("Rule_keeperLockHealth")
--			KeeperHealthLocked = 0
--		end

		-- count how many droids are still alive
		if (CountDroidsExistingONCE == 0) then
			CountDroidsExistingONCE = 1
			numDreadnaughtDroidsBuilt = SobGroup_Count ( "AttackDroid_Dreadnaught" )	-- set built droids counter to number of droids left
		end
	
		if ( numDreadnaughtDroidsBuilt > 5) then						-- if there are enough Droids 
			print ("Keeper has determined there are enough droids - getting out of here")
			Rule_AddInterval ("Rule_keeperHide", 5)					-- go into hiding
			Rule_Remove ("Rule_buildDreadnaughtAttackDroids")
		else
	--		print ("Keeper building one Droid!")
			AttackDroid_DreadnaughtFreshlyBuilt = SobGroup_CreateShip("Keeper", "Kpr_AttackDroid")	-- spawn 1 Keeper Attack Droid
			print ("Keeper BUILDING ONE DROID in Phase 1")
			Rule_AddInterval ("Rule_attackDroidDreadnaughtSobGroupCleanup", 2)
	
			numDreadnaughtDroidsBuilt = numDreadnaughtDroidsBuilt + 1					-- increment the droids built variable
			Rule_AddInterval ("Rule_buildDreadnaughtAttackDroids", 3)					-- go back and do it again
			Rule_Remove ("Rule_buildDreadnaughtAttackDroids")
		end
	end
end





-- hyperspace out and go to retreat point
function Rule_keeperHide()								-- /// TRANSITION STATE \\\

	SobGroup_EnterHyperSpaceOffMap("Keeper")				-- hyperspace out
	print ("Keeper HYPERSPACING out - going into HIDING STATE!")
--	FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
--	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
--	Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
--	KeeperHealthLocked = 1
--	Rule_AddInterval ("Rule_keeperLockHealthRemove", 20)			-- after x seconds remove health lock
	print ("Locking Keeper's health!!!!!")

--	Rule_AddInterval ("Rule_keeperWatchDreadnaught", 20)			-- start watching the Dreadnaught
	Rule_AddInterval ("Rule_keeperWatchDreadnaught", 3)					-- start watching the Dreadnaught
	Rule_Remove ("Rule_keeperHide")
	
end


function Rule_keeperLockHealth()
--	print ("re-setting Keeper's health!")
	SobGroup_SetHealth("Keeper", LockedKeeperHealth)				-- keep re-setting Keeper's health until he's finished hyperspacing
end

function Rule_keeperLockHealthRemove()
	print ("removing lock on keeper's health!")
	print ("setting Keeper's health to 100 percent!")
	SobGroup_SetHealth("Keeper", 1)							-- Keeper heals to full health in hyperspace
	Rule_Remove ("Rule_keeperLockHealth")
	Rule_Remove ("Rule_keeperLockHealthRemove")
end



-- watch for Attack Droids to run out so Keeper can go replenish them
function Rule_keeperWatchDreadnaught()						-- /// HYPERSPACE \\\
--	print ("Keeper in keeperWatchDreadnaught state!")
--	print ("Checking to see if Keeper is in hyperspace!")
	if ( SobGroup_AreAllInHyperspace( "Keeper" ) == 1) then		-- if the Keeper is in Hyperspace
	print ("SCAR thinks the Keeper is in hyperspace now!")
	FX_StopEvent( "Keeper", "Phase_loop" )				-- turn off Keeper "invulnerability" fx

		if ( KeeperHealthLocked == 1) then					-- remove lock on Keeper's health
			Rule_Remove ("Rule_keeperLockHealth")
			SobGroup_SetHealth("Keeper", 1)				-- Keeper heals to full health in hyperspace
			KeeperHealthLocked = 0
		end
	
		if ( KeeperAttackFleet == 1) then						-- if it's time to attack the player's fleet
			SobGroup_Clear( "KeeperTarget" )				-- clear the target list
		
			-- search for targets
			Player_FillShipsByType( "tempSobGroupOne", 0, "Hgn_Destroyer" )         	-- Put the player's Destroyers into a sob group
		
			if ( SobGroup_Empty ( "tempSobGroupOne" ) ~= 1) then	-- if the player has Hgn Destroyers
				print ("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack DESTROYERS!")
				SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroupOne")		-- Add the Destroyers into the target list
				Rule_Add ("Rule_keeperAttack")
				Rule_Remove ("Rule_keeperWatchDreadnaught")
			else
				Player_FillShipsByType( "tempSobGroupOne", 0, "Vgr_Destroyer" )	-- Put the player's captured Destroyers into a sob group
						
				if ( SobGroup_Empty ( "tempSobGroupOne" ) ~= 1) then	-- if the player has Vgr Destroyers
					print ("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack CAPTURED DESTROYERS!")
					SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroupOne")		-- Add the captured Destroyers into the target list
					Rule_Add ("Rule_keeperAttack")
					Rule_Remove ("Rule_keeperWatchDreadnaught")
				else				
					Player_FillShipsByType( "tempSobGroupOne", 0, "Hgn_Carrier" )			-- Put the player's Carriers into a sob group
								
					if( SobGroup_Empty( "tempSobGroupOne" ) ~= 1) then
						print ("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack CARRIERS!")
						SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroupOne")		-- Add the Carriers into the target list
						Rule_Add ("Rule_keeperAttack")
						Rule_Remove ("Rule_keeperWatchDreadnaught")					
					else
						Player_FillShipsByType( "tempSobGroupOne", 0, "Hgn_BattleCruiser" )	-- Put the player's Battlecruisers into a sob group

						if( SobGroup_Empty( "tempSobGroupOne" ) ~= 1) then -- if the player has Battlecruisers	
							print ("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack BATTLECRUISERS!")
							SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroupOne")	-- Add the Battlecruisers into the target list
							Rule_Add ("Rule_keeperAttack")
							Rule_Remove ("Rule_keeperWatchDreadnaught")
						else
							Player_FillShipsByType( "tempSobGroupOne", 0, "Hgn_Shipyard" )			-- Put the player's Shipyards into a sob group				
							
							if( SobGroup_Empty( "tempSobGroupOne" ) ~= 1) then -- if the player has Shipyards
								print ("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack SHIPYARDS!")
								SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroupOne")	-- Add the Shipyards into the target list
								Rule_Add ("Rule_keeperAttack")
								Rule_Remove ("Rule_keeperWatchDreadnaught")
							else
								print ("Keeper in KEEPERWATCHDREADNAUGHT has chosen to attack the MOTHERSHIP!")
								SobGroup_SobGroupAdd( "KeeperTarget", "PlayerMothership")	-- Add the Mothership into the target list
								Rule_Add ("Rule_keeperAttack")
								Rule_Remove ("Rule_keeperWatchDreadnaught")
							end
						end
					end
				end
			end	
		elseif ( SobGroup_Count ( "AttackDroid_Dreadnaught" ) < 5) then
			print ("keeperWatchDreadnaught: not enough droids, going to build some")
			CountDroidsExistingONCE = 0								-- re-set droid counter so droids will be counted again
			Rule_AddInterval ("Rule_keeperSpawnDroidsAtDreadnaught", 1)		-- go spawn some more Attack Droids at the Dreadnaught
			Rule_Remove ("Rule_keeperWatchDreadnaught")
		else
			Rule_Remove ("Rule_keeperWatchDreadnaught")
			Rule_AddInterval ("Rule_keeperWatchDreadnaught", 5)			-- only do this check every x seconds
		end
		
	end
end


-- retreats to one of the veil chunk hiding places and heals the Keeper
function Rule_keeperRetreatPhase1()
	print ("Keeper EXITING HYPERSPACE at the HEAL POINT! (Phase 1)")
	
	-- randomly choose the retreat point
	local randomPointIndex = RandomIntMax( 2 )+1;
	SobGroup_ExitHyperSpace("Keeper", "KeeperRetreat0"..randomPointIndex)		-- hyperspace in at random retreat point
	
	Rule_AddInterval ("Rule_keeperHealPhase1", 20)
	Rule_Remove ("Rule_keeperRetreatPhase1")
	
end


-- heal the keeper slowly over time
function Rule_keeperHealPhase1()
	print ("Keeper HEALING himself! (Phase 1)")

	CurrentKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
	HealedKeeperHealth = CurrentKeeperHealth + 0.01				-- add 1% and put in a variable
	SobGroup_SetHealth("Keeper", HealedKeeperHealth)				-- set new health equal to old health + 1%
	Rule_AddInterval ("Rule_keeperCheckHealthPhase1", 0.5)				-- go check health
	Rule_Remove ("Rule_keeperHealPhase1")
	
end


-- check to see if the Keeper is fully healed
function Rule_keeperCheckHealthPhase1()
	print ("Keeper CHECKING his health! (Phase 1)")

	-- if the Keeper is back up to full health then take him back to decide state
	if ( SobGroup_HealthPercentage("Keeper")	> 0.99) then
		Rule_AddInterval ("Rule_keeperWatchDreadnaught", 20)
		Rule_Remove ("Rule_keeperCheckHealthPhase1")
	else
		Rule_Add ("Rule_keeperHealPhase1")
		Rule_Remove ("Rule_keeperCheckHealthPhase1")
	end
	
end


-- hyperspace in near Dreadnaught and start building Attack Droids
function Rule_keeperSpawnDroidsAtDreadnaught()					-- /// TRANSITION STATE \\\
	SobGroup_ExitHyperSpaceSobGroup("Keeper", "Dreadnaught", 3800 )	-- hyperspace in close to Dreadnaught
	LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
	Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
	FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable

	KeeperHealthLocked = 1
--	Rule_AddInterval ("Rule_keeperLockHealthRemove", 20)			-- after x seconds remove health lock
	print ("Locking Keeper's health!!!!!")
--	Rule_AddInterval ("Rule_stopKeeper", 20)
--	Rule_AddInterval ("Rule_buildDreadnaughtAttackDroids", 20)
	Rule_Add ("Rule_buildDreadnaughtAttackDroids")
	Rule_Remove ("Rule_keeperSpawnDroidsAtDreadnaught")
end




function Rule_stopKeeper()
	SobGroup_SetROE("Keeper", PassiveROE)	-- set Keeper's tactics to passive so he won't move while building
	SobGroup_Stop( 1, "Keeper")				-- stop the Keeper so he doesn't go back to attacking
	Rule_Remove ("Rule_stopKeeper")
end

-------------------------------------------------------------------------------------------------





-------------------------------------------------------------------------------------------------
-- PHASE 2 - Inhibitor Trap
-------------------------------------------------------------------------------------------------

-- hyperspace in near Dreadnaught and start building Attack Droids
function Rule_keeperSpawnDroidsAtDreadnaughtPhase2()			-- /// TRANSITION STATE \\\
--	print ("keeperSpawnDroidsAtDreadnaughtPhase2 is checking to see if Keeper is in hyperspace")
	if ( SobGroup_AreAllInHyperspace( "Keeper" ) == 1) then		-- if the Keeper is in Hyperspace
		FX_StopEvent( "Keeper", "Phase_loop" )						-- turn off Keeper "invulnerability" fx
		print ("SCAR thinks the Keeper is in hyperspace now!")
		SobGroup_ExitHyperSpaceSobGroup("Keeper", "Dreadnaught", 2800 )	-- hyperspace in close to Dreadnaught
		LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
		Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable

		KeeperHealthLocked = 1
		print ("Locking Keeper's health!!!!!")
--		Rule_AddInterval ("Rule_stopKeeper", 25)
--		Rule_AddInterval ("Rule_buildDreadnaughtAttackDroidsPhase2", 20)
		Rule_Add ("Rule_buildDreadnaughtAttackDroidsPhase2")
		Rule_Remove ("Rule_keeperSpawnDroidsAtDreadnaughtPhase2")
	end
end


-- build droids at the Dreadnaught
function Rule_buildDreadnaughtAttackDroidsPhase2()				-- /// REAL SPACE \\\
--	print ("buildDreadnaughtAttackDroidsPhase2 is checking to see if Keeper is out of hyperspace")
	if ( SobGroup_AreAllInRealSpace( "Keeper" ) == 1) then		-- if the Keeper is out of Hyperspace
		print ("SCAR thinks the Keeper is out of hyperspace now!")
--		FX_StopEvent( "Keeper", "Phase_loop" )						-- turn off Keeper "invulnerability" fx
		Rule_Add ("Rule_stopKeeper")
	
		-- count how many droids are still alive
		if (CountDroidsExistingONCE == 0) then
			CountDroidsExistingONCE = 1
			numDreadnaughtDroidsBuilt = SobGroup_Count ( "AttackDroid_Dreadnaught" )	-- set built droids counter to number of droids left
		end
	
	
		if ( numDreadnaughtDroidsBuilt > 5) then						-- if there are enough Droids 
			print ("Keeper has determined there are enough droids - getting out of here")
	--		Rule_AddInterval ("Rule_keeperDecide", 25)					-- go decide what to do again
			SobGroup_EnterHyperSpaceOffMap("Keeper")					-- hyperspace out
--			FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
--			Rule_AddInterval ("Rule_keeperLockHealthRemove", 20)			-- after 10 seconds remove health lock
	--		print ("Locking Keeper's health!!!!!")
	--		Rule_AddInterval ("Rule_keeperRetreat", 20)
--			Rule_AddInterval ("Rule_keeperDecide", 20)
			Rule_Add ("Rule_keeperDecide")
	--		Rule_AddInterval ("Rule_keeperLockHealthRemove", 25)			-- after x seconds remove health lock
			Rule_Remove ("Rule_buildDreadnaughtAttackDroidsPhase2")
		else
	--		print ("Keeper building one Droid!")
			AttackDroid_DreadnaughtFreshlyBuilt = SobGroup_CreateShip("Keeper", "Kpr_AttackDroid")	-- spawn 1 Keeper Attack Droid
			Rule_AddInterval ("Rule_attackDroidDreadnaughtSobGroupCleanup", 2)
	
	--		numDroidsInGroup = SobGroup_Count (AttackDroid_Dreadnaught)
	--		print ("There are this many droids in AttackDroids_Dreadnaught:"..numDroidsInGroup)
			numDreadnaughtDroidsBuilt = numDreadnaughtDroidsBuilt + 1					-- increment the droids built variable
			Rule_AddInterval ("Rule_buildDreadnaughtAttackDroidsPhase2", 3)					-- go back and do it again
			Rule_Remove ("Rule_buildDreadnaughtAttackDroidsPhase2")
		end
	end
end

-- add contents of newly-built sob group to parent sob group
function Rule_attackDroidDreadnaughtSobGroupCleanup()
	SobGroup_SobGroupAdd("AttackDroid_Dreadnaught", AttackDroid_DreadnaughtFreshlyBuilt)
--	SobGroup_Stop (1, "AttackDroid_Dreadnaught")						-- tell Droids to stop (so they won't go into parade formation)
	SobGroup_SetROE("AttackDroid_Dreadnaught", OffensiveROE)		-- set Droid tactics to aggressive
		SobGroup_SetStance("AttackDroid_Dreadnaught", AggressiveStance)
--	SobGroup_MoveToSobGroup( "AttackDroid_Dreadnaught", "Dreadnaught" )
	Rule_AddInterval ("Rule_attackDroidPatrol", 1)
	Rule_AddInterval ("Rule_attackDroidDreadnaughtWatchForStolenDreadnaught", 3)
	DroidCount_Dreadnaught = SobGroup_Count ( "AttackDroid_Dreadnaught" )
	print ("please"..DroidCount_Dreadnaught)
	Rule_Remove ("Rule_attackDroidDreadnaughtSobGroupCleanup")
end


function Rule_attackDroidPatrol()
	SobGroup_FollowPath("AttackDroid_Dreadnaught", "DroidPatrolPath", 1, 1, 1)
	Rule_Remove ("Rule_attackDroidPatrol")
end

-- watch for Movers to take Dreadnaught and attack them
function Rule_attackDroidDreadnaughtWatchForStolenDreadnaught()
	if ( PlayerHasDreadnaught == 1) then							-- if the player has taken the Dreadnaught
		Rule_Add ("Rule_attackDroidDreadnaughtAttackMovers")
		Rule_Remove ("Rule_attackDroidDreadnaughtWatchForStolenDreadnaught")
	end
end

-- watch for Movers to take Dreadnaught and attack them
function Rule_attackDroidDreadnaughtAttackMovers()
	SobGroup_Attack( 1, "AttackDroid_Dreadnaught", "MoversLatchedToDreadnaught" )	-- attack Movers on the Dreadnaught
	if ( PlayDroidAnalysisONCE == 0) then
		Rule_AddInterval ("Rule_intelevent_droidAnalysis", 3)						-- play event about how to kill Droids
		PlayDroidAnalysisONCE = 1
	end
	Rule_Remove ("Rule_attackDroidDreadnaughtAttackMovers")
end

-- hyperspace in near Inhibitor trap and start building Attack Droids
function Rule_keeperSpawnDroidsAtInhibitorTrap()						-- /// TRANSITION STATE \\\
--	print ("keeperSpawnDroidsAtInhibitorTrap checking to see if Keeper is in hyperspace!")
	if ( SobGroup_AreAllInHyperspace( "Keeper" ) == 1) then
		FX_StopEvent( "Keeper", "Phase_loop" )						-- turn off Keeper "invulnerability" fx
		print ("SCAR thinks the Keeper is in hyperspace!")
		
		SobGroup_ExitHyperSpace("Keeper", "EffectPoint01")	-- hyperspace in near center of Inhibitor Trap
		print ("telling Keeper to exit hyperspace at inhibitor trap!")
		LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
		Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable

		KeeperHealthLocked = 1
		print ("Locking Keeper's health!!!!!")
--		Rule_AddInterval ("Rule_stopKeeper", 20)
--		Rule_AddInterval ("Rule_buildInhibitorAttackDroids", 20)
		Rule_Add ("Rule_buildInhibitorAttackDroids")
		Rule_Remove ("Rule_keeperSpawnDroidsAtInhibitorTrap")
	end
end


-- build Droids at the Inhibitor trap
function Rule_buildInhibitorAttackDroids()							-- /// REAL SPACE \\\
--	print ("buildInhibitorAttackDroids checking to see if Keeper is out of hyperspace!")
	if ( SobGroup_AreAllInRealSpace( "Keeper" ) == 1) then
		print ("SCAR thinks the Keeper is out of hyperspace!")
--		FX_StopEvent( "Keeper", "Phase_loop" )						-- turn off Keeper "invulnerability" fx
		
		if ( numInhibitorDroidsBuilt > 7) then						-- if there are enough Droids 
	--		Rule_AddInterval ("Rule_keeperDecide", 25)					-- go decide what to do again
			SobGroup_EnterHyperSpaceOffMap("Keeper")					-- hyperspace out
--			FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
--			Rule_AddInterval ("Rule_keeperLockHealthRemove", 20)			-- after x seconds remove health lock
	--		print ("Locking Keeper's health!!!!!")
	--		Rule_AddInterval ("Rule_keeperRetreat", 20)
--			Rule_AddInterval ("Rule_keeperDecide", 20)
			Rule_Add ("Rule_keeperDecide")
			print ("Keeper has determined there are enough inhibitor droids, going into KeeperDecide!")
	--		Rule_AddInterval ("Rule_keeperLockHealthRemove", 25)			-- after x seconds remove health lock
	
			Rule_Remove ("Rule_buildInhibitorAttackDroids")
		else
			AttackDroid_InhibitorFreshlyBuilt = SobGroup_CreateShip("Keeper", "Kpr_AttackDroid")	-- spawn 1 Keeper Attack Droid
	--		Rule_AddInterval ("Rule_attackDroidsGuardInhibitorSphere", 5)					-- create rule telling droids to 'guard' Inhibitor Sphere
			Rule_AddInterval ("Rule_attackDroidInhibitorSobGroupCleanup", 2)
	
			numInhibitorDroidsBuilt = numInhibitorDroidsBuilt + 1					-- increment the droids built variable
			Rule_AddInterval ("Rule_buildInhibitorAttackDroids", 3)					-- go back and do it again
			Rule_Remove ("Rule_buildInhibitorAttackDroids")
		end
	end
end


-- sets Attack Droids tactics to aggressive
function Rule_attackDroidsGuardInhibitorSphere()
	SobGroup_Stop( 1, AttackDroid_InhibitorFreshlyBuilt)				-- stop the Keeper so he doesn't go back to attacking
	SobGroup_SetROE("AttackDroid_InhibitorFreshlyBuilt", OffensiveROE)		-- set Droid tactics to aggressive
		SobGroup_SetStance("AttackDroid_InhibitorFreshlyBuilt", AggressiveStance)
	Rule_Remove ("Rule_attackDroidsGuardInhibitorSphere")
end


-- add contents of newly-built sob group to parent sob group
function Rule_attackDroidInhibitorSobGroupCleanup()
	SobGroup_SobGroupAdd("AttackDroid_Inhibitor", AttackDroid_InhibitorFreshlyBuilt)
	print ("Inhibitor group has this many ships:"..DroidCount_Inhibitor)
--	SobGroup_Stop (1, "AttackDroid_Inhibitor")						-- tell Droids to stop (so they won't go into parade formation)
	SobGroup_SetROE("AttackDroid_Inhibitor", OffensiveROE)		-- set Droid tactics to aggressive
		SobGroup_SetStance("AttackDroid_Inhibitor", AggressiveStance)
--	DroidCount_Inhibitor = SobGroup_Count ( "AttackDroid_Inhibitor" )
	Rule_AddInterval ("Rule_inhibitorAttackDroidPatrol", 1)
	Rule_AddInterval ("Rule_inhibitorAttackDroidWatchForMovers", 5)
	Rule_Remove ("Rule_attackDroidInhibitorSobGroupCleanup")
end


function Rule_inhibitorAttackDroidPatrol()
	SobGroup_FollowPath("AttackDroid_Inhibitor", "InhibitorDroidPatrolPath", 1, 1, 1)
	Rule_Remove ("Rule_inhibitorAttackDroidPatrol")
end

-- watch for Movers in range of progenitor power modules
function Rule_inhibitorAttackDroidWatchForMovers()
	-- put docked movers into top priority target list
	SobGroup_SobGroupAdd( "InhibitorDroidTargets", "MoversLatchedToInhibitor1")		-- Add all the docked Movers to the target list
	SobGroup_SobGroupAdd( "InhibitorDroidTargets", "MoversLatchedToInhibitor2")		-- Add all the docked Movers to the target list
	SobGroup_SobGroupAdd( "InhibitorDroidTargets", "MoversLatchedToInhibitor3")		-- Add all the docked Movers to the target list

	Player_FillSobGroupInVolume( "tempSobGroupOne", 0, "InhibitorTrapSphere")	-- get all player ships in the Inhibitor Trap sphere
	if ( SobGroup_Empty ("InhibitorDroidTargets") ~= 1) then
		SobGroup_Attack( 1, "AttackDroid_Inhibitor", "InhibitorDroidTargets" )		-- attack Movers latched to inhibitors
		Rule_Add ("Rule_attackDroidInhibitorAttackMoverWatch")
		Rule_Remove ("Rule_inhibitorAttackDroidWatchForMovers")
	elseif ( SobGroup_Empty("tempSobGroupOne") == 0) then 
		SobGroup_FillShipsByType( "tempSobGroupTwo", "tempSobGroupOne", "Kpr_Mover" )		-- filter for Movers
		if ( SobGroup_Empty("tempSobGroupTwo") == 0) then							-- if the player has taken the Dreadnaught
			SobGroup_Attack( 1, "AttackDroid_Inhibitor", "tempSobGroupTwo" )		-- attack Movers
			Rule_Add ("Rule_attackDroidInhibitorAttackMoverWatch")
			Rule_Remove ("Rule_inhibitorAttackDroidWatchForMovers")
		else
			SobGroup_Attack( 1, "AttackDroid_Inhibitor", "tempSobGroupOne" )		-- attack whatever player ships are nearby
			Rule_Add ("Rule_attackDroidInhibitorAttackRegularWatch")
			Rule_Remove ("Rule_inhibitorAttackDroidWatchForMovers")
		end
	end
end


-- watch for Movers to die
function Rule_attackDroidInhibitorAttackMoverWatch()
	if ( HW2_IsRunTimeSobGroupEmpty (MoversNearInhibitorTrap) == 1) then		-- if you've killed all the Movers
		Rule_Add ("Rule_inhibitorAttackDroidPatrol")			-- go back to following the patrol path
		Rule_Remove ("Rule_attackDroidInhibitorAttackMoverWatch")
	end
end

-- watch for targets to die
function Rule_attackDroidInhibitorAttackRegularWatch()
	if ( HW2_IsRunTimeSobGroupEmpty (PlayerShipsNearInhibitorTrap) == 1) then		-- if you've killed all the targets
		Rule_Add ("Rule_inhibitorAttackDroidPatrol")			-- go back to following the patrol path
		Rule_Remove ("Rule_attackDroidInhibitorAttackRegularWatch")
	end
end







-- decides what the keeper should do
function Rule_keeperDecide()						-- *** NOTE *** the keeper is *** IN HYPERSPACE *** now!!!!
--	print ("keeperDecide checking to see if Keeper is in hyperspace!")
	if ( SobGroup_AreAllInHyperspace( "Keeper" ) == 1) then		-- if the Keeper is in Hyperspace
	print ("SCAR thinks the Keeper is in hyperspace now!")
		FX_StopEvent( "Keeper", "Phase_loop" )				-- turn off Keeper "invulnerability" fx
		if ( KeeperHealthLocked == 1) then					-- remove lock on Keeper's health
			Rule_Remove ("Rule_keeperLockHealth")
			SobGroup_SetHealth("Keeper", 1)				-- Keeper heals to full health in hyperspace
			KeeperHealthLocked = 0
		end
		print ("Keeper in DECISION state and should be in hyperspace!")
		SobGroup_Clear( "KeeperTarget" )				-- clear the target list

		-- search for targets
		-- watch for player to move ships into the Inhibitor Trap sphere
		Player_FillSobGroupInVolume( "tempSobGroupOne", 0, "InhibitorTrapSphere")	-- get all player ships in the Inhibitor Trap sphere
	
		if ( KeeperGoGetTrapped == 1) then
			print ("Keeper going to get trapped!!!")
			Rule_AddInterval ("Rule_keeperFallIntoTrap2", 1)
			LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
			Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
			FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable
			KeeperHealthLocked = 1
			Rule_Remove ("Rule_keeperDecide")
		else		
			Player_FillShipsByType( "tempSobGroup", 0, "Hgn_Destroyer" )         	-- Put the player's Destroyers into a sob group
		
			if ( ( DesireToAttackFleet > 2) or ( Timer_GetRemaining("KeeperLastAttackTimer") < 1) ) and 
			     (SobGroup_Empty ( "tempSobGroup" ) ~= 1) then	-- if the player has Destroyers
				print ("Keeper has chosen to attack DESTROYERS!")
				Timer_End("KeeperLastAttackTimer")
				SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroup")	-- Add the Destroyers into the target list
				DesireToAttackFleet = 0								-- re-set Keeper's need to attack fleet to 0 because he's doing it now!
				Rule_AddInterval ("Rule_keeperAttack", 1)				-- go to attack state
				Rule_Remove ("Rule_keeperDecide")
			else		
				Player_FillShipsByType( "tempSobGroup", 0, "Vgr_Destroyer" )	-- Put the player's captured Destroyers into a sob group		
			
				if ( ( DesireToAttackFleet > 2) or ( Timer_GetRemaining("KeeperLastAttackTimer") < 1) ) and 
					 (SobGroup_Empty ( "tempSobGroup" ) ~= 1) then	-- if the player has Destroyers
					print ("Keeper has chosen to attack CAPTURED DESTROYERS!")
					Timer_End("KeeperLastAttackTimer")
					SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroup")	-- Add the captured Destroyers into the target list
					DesireToAttackFleet = 0								-- re-set Keeper's need to attack fleet to 0 because he's doing it now!
					Rule_AddInterval ("Rule_keeperAttack", 1)				-- go to attack state
					Rule_Remove ("Rule_keeperDecide")
				else				
					Player_FillShipsByType( "tempSobGroup", 0, "Hgn_Carrier" )         -- Put the player's Carriers into a sob group
					
					if ( ( DesireToAttackFleet > 2) or ( Timer_GetRemaining("KeeperLastAttackTimer") < 1) ) and 
					     (SobGroup_Empty ( "tempSobGroup" ) ~= 1) then	-- if the player has Carriers
						print ("Keeper has chosen to attack CARRIERS!")
						Timer_End("KeeperLastAttackTimer")
						SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroup")		-- Add the Carriers into the target list
						DesireToAttackFleet = 0								-- re-set Keeper's need to attack fleet to 0 because he's doing it now!
						Rule_AddInterval ("Rule_keeperAttack", 1)				-- go to attack state
						Rule_Remove ("Rule_keeperDecide")
					else		
						Player_FillShipsByType( "tempSobGroup", 0, "Hgn_BattleCruiser" )         -- Put the player's Battlecruisers into a sob group
		
						if ( ( DesireToAttackFleet > 2) or ( Timer_GetRemaining("KeeperLastAttackTimer") < 1) ) and
							 (SobGroup_Empty ( "tempSobGroup" ) ~= 1) then		-- if the player has Battlecruisers
							print ("Keeper has chosen to attack BATTLECRUISERS!")
							Timer_End("KeeperLastAttackTimer")
							SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroup")	-- Add the Battlecruisers into the target list
							DesireToAttackFleet = 0								-- re-set Keeper's need to attack fleet to 0 because he's doing it now!
							Rule_AddInterval ("Rule_keeperAttack", 1)				-- go to attack state
							Rule_Remove ("Rule_keeperDecide")
						else
							Player_FillShipsByType( "tempSobGroup", 0, "Hgn_Shipyard" )         -- Put the player's Shipyards into a sob group
		
							if ( ( DesireToAttackFleet > 2) or ( Timer_GetRemaining("KeeperLastAttackTimer") < 1) ) and
								 (SobGroup_Empty ( "tempSobGroup" ) ~= 1) then	-- if the player has Shipyards
								print ("Keeper has chosen to attack SHIPYARDS!")
								Timer_End("KeeperLastAttackTimer")
								SobGroup_SobGroupAdd( "KeeperTarget", "tempSobGroup")	-- Add the Shipyards into the target list
								DesireToAttackFleet = 0								-- re-set Keeper's need to attack fleet to 0 because he's doing it now!
								Rule_AddInterval ("Rule_keeperAttack", 1)				-- go to attack state
								Rule_Remove ("Rule_keeperDecide")
							elseif ( DesireToAttackFleet > 2) or ( Timer_GetRemaining("KeeperLastAttackTimer") < 1) then						-- if there are no Carriers / BC's / Shipyards and the desire to attack is high enough, just go for the MS
								print ("Keeper has chosen to attack the MOTHERSHIP!")
								Timer_End("KeeperLastAttackTimer")
								SobGroup_SobGroupAdd( "KeeperTarget", "PlayerMothership")	-- Add the Mothership into the target list
								DesireToAttackFleet = 0								-- re-set Keeper's need to attack fleet to 0 because he's doing it now!
								Rule_AddInterval ("Rule_keeperAttack", 1)				-- go to attack state
								Rule_Remove ("Rule_keeperDecide")
							elseif ( CreateFirstInhibitorDroids == 0) and						-- if the one-time variable hasn't been set
									( InhibitorTrapHasStarted == 1 ) and						-- if the Inhibitor trap has begun
									( SobGroup_Empty (  "tempSobGroupOne" ) ~= 1) then		-- and there are ships in the sobgroup
								print ("Keeper Decide is going to build the first set of INHIBITOR droids!")
								CreateFirstInhibitorDroids = 1								-- set one-time variable so this check doesn't happen again
								DesireToAttackFleet = DesireToAttackFleet + 1					-- increase need to attack player's fleet each time the Keeper builds droids
								Rule_AddInterval ("Rule_keeperSpawnDroidsAtInhibitorTrap", 1)	-- go spawn some Attack Droids at Inhibitor Trap
								Rule_Remove ("Rule_keeperDecide")
							elseif ( CreateFirstInhibitorDroids == 1) and						-- if the Inhibitor droids have been created
									( SobGroup_Count ( "AttackDroid_Inhibitor" ) < 8) then
								print ("Keeper Decide has determined there aren't enough INHIBITOR droids.. going to build some")
								numInhibitorDroidsBuilt = SobGroup_Count ( "AttackDroid_Inhibitor" )	-- set built droids counter to number of droids left
								DesireToAttackFleet = DesireToAttackFleet + 1					-- increase need to attack player's fleet each time the Keeper builds droids
								Rule_AddInterval ("Rule_keeperSpawnDroidsAtInhibitorTrap", 1)	-- go spawn some Attack Droids at Inhibitor Trap
								Rule_Remove ("Rule_keeperDecide")
							elseif ( SobGroup_Count ( "AttackDroid_Dreadnaught" ) < 5) and ( DreadnaughtInProximityOfMS == 0 ) then
								print ("Keeper Decide has determined there aren't enough Dreadnaught droids.. going to build some")
								CountDroidsExistingONCE = 0								-- re-set droid counter so droids will be counted again
								DesireToAttackFleet = DesireToAttackFleet + 1					-- increase need to attack player's fleet each time the Keeper builds droids
								Rule_AddInterval ("Rule_keeperSpawnDroidsAtDreadnaughtPhase2", 1)	-- go spawn some more Attack Droids at the Dreadnaught
								Rule_Remove ("Rule_keeperDecide")
							else
								Rule_Remove ("Rule_keeperDecide")
								Rule_AddInterval ("Rule_keeperDecide", 5)				-- start checking every 5 seconds so it's not such a load on the CPU
							end
						end
					end
				end
			end
		end	
	end
end




-- hyperspaces in and sets up to attack target
function Rule_keeperAttack()								-- /// TRANSITION STATE \\\
	print ("Keeper HYPERSPACING IN and GETTING READY TO ATTACK TARGET!")
	if ( KeeperIsAttackingONCE == 0) then							-- if one-time variable hasn't been set
		KeeperIsAttackingONCE = 1								-- set one-time variable so rule never gets added again
		SobGroup_ExitHyperSpaceSobGroup("Keeper", "KeeperTarget", 2300 )	-- hyperspace in close to the target
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
--		Rule_AddInterval ("Rule_keeperAttackTheTargetFIRSTTIME", 20)	-- go into special attack state where Keeper attacks for a minimum amount of time (first time only)
		Rule_Add ("Rule_keeperAttackTheTargetFIRSTTIME")				-- go into special attack state where Keeper attacks for a minimum amount of time (first time only)
		Rule_Remove ("Rule_keeperAttack")
	else
		SobGroup_ExitHyperSpaceSobGroup("Keeper", "KeeperTarget", 2300 )	-- hyperspace in close to the target
--		Rule_AddInterval ("Rule_keeperAttackTheTarget", 20)
		Rule_Add ("Rule_keeperAttackTheTarget")
		Rule_Remove ("Rule_keeperAttack")
	end
end




-- actually attack the target
function Rule_keeperAttackTheTarget()						-- /// REAL SPACE \\\
--	print ("keeperAttackTheTarget checking if Keeper is out of hyperspace")
	if ( SobGroup_AreAllInRealSpace( "Keeper" ) == 1) then		-- if the Keeper is out of Hyperspace
		print ("SCAR thinks the Keeper is out of hyperspace now!")
		print ("telling Keeper to ATTACK THE TARGET!")
		FX_StopEvent( "Keeper", "Phase_loop" )						-- turn off Keeper "invulnerability" fx
		SobGroup_Attack( 1, "Keeper", "KeeperTarget" )					-- attack the target
	
	--	randomAttackTime = RandomRange( 18, 35 );				-- set random time to HS out and come back in
	--	Rule_AddInterval ("Rule_keeperPickNewVectorHSOut", randomAttackTime)
		Timer_Start("KeeperAttackTimer", 40)						-- start timer for Keeper to stay in Attack State
	
		Rule_Add ("Rule_keeperAttackWatch")					-- go to attackWatch state
		Rule_Remove ("Rule_keeperAttackTheTarget")
		print ("Keeper going into Attack Watch state!")
	end
end


-- actually attack the target
function Rule_keeperAttackTheTargetFIRSTTIME()				-- /// REAL SPACE \\\
--	print ("keeperAttackTheTargetFIRSTTIME checking if Keeper is out of hyperspace")
	if ( SobGroup_AreAllInRealSpace( "Keeper" ) == 1) then		-- if the Keeper is out of Hyperspace
		print ("SCAR thinks the Keeper is out of hyperspace now!")
		print ("telling Keeper to ATTACK THE TARGET FOR THE FIRST TIME!")
		FX_StopEvent( "Keeper", "Phase_loop" )						-- turn off Keeper "invulnerability" fx
		KeeperIsAttacking = 1									-- set variable so intel event will play
		SobGroup_Attack( 1, "Keeper", "KeeperTarget" )				-- attack the target
		
		Timer_Start("KeeperFirstAttackTimer", 60)					-- start timer for Keeper's first attack on the player's fleet
	
		Rule_Add ("Rule_keeperFIRSTTIMEAttackWatch")				-- go to FIRST TIME attackWatch state
		print ("Keeper going into FIRST TIME Attack Watch state!")
		Rule_Remove ("Rule_keeperAttackTheTargetFIRSTTIME")
	end
end


-- watch for timer to expire or health to get too low
function Rule_keeperFIRSTTIMEAttackWatch()							-- /// REAL SPACE \\\
	if ( Timer_GetRemaining("KeeperFirstAttackTimer") < 1) then			-- if the Keeper has been attacking for long enough
		print ("Keeper attack timer has ended!  Entering AttackWatch state!")
		Rule_AddInterval ("Rule_keeperAttackWatch", 3)						-- go to attackWatch state
		Rule_AddInterval ("Rule_setKeeperDoneFirstAttack", 45)
		Rule_Remove ("Rule_keeperFIRSTTIMEAttackWatch")
	elseif ( SobGroup_HealthPercentage("Keeper")	< 0.70) then			-- OR if the Keeper's health is getting low
		print ("FIRST TIME says the Keeper's health is too low, Entering Attack Watch state!")
		Rule_AddInterval ("Rule_keeperAttackWatch", 3)						-- go to attackWatch state
		Rule_AddInterval ("Rule_setKeeperDoneFirstAttack", 25)
		Rule_Remove ("Rule_keeperFIRSTTIMEAttackWatch")
	end
end

function Rule_setKeeperDoneFirstAttack()
	KeeperDoneFirstAttack = 1
	Rule_Remove ("Rule_setKeeperDoneFirstAttack")
end








-- watches for various conditions that would take the Keeper out of combat
function Rule_keeperAttackWatch()									-- /// REAL SPACE \\\

	-- watch for player to move ships into the Inhibitor Trap sphere
	Player_FillSobGroupInVolume( "tempSobGroupOne", 0, "InhibitorTrapSphere")	-- get all player ships in the Inhibitor Trap sphere

	if ( SobGroup_HealthPercentage("Keeper")	< 0.70) then			-- if Keeper health gets too low, retreat and heal
		print ("Keeper is below 70 percent health!  Getting out of here!")
		SobGroup_EnterHyperSpaceOffMap("Keeper")					-- hyperspace out
		print ("Telling Keeper to hyperspace out from keeperAttackWatch!!!")
		print ("Keeper should be entering hyperspace NOW")
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
		LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
		Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable
		KeeperHealthLocked = 1
--		Rule_AddInterval ("Rule_keeperLockHealthRemove", 20)			-- after <x> seconds remove health lock
		print ("Locking Keeper's health!!!!!")
--		Rule_AddInterval ("Rule_keeperRetreat", 20)
		Timer_Start("KeeperLastAttackTimer", 170)					-- start timer to measure the last time the Keeper attacked the player
		Rule_Add ("Rule_keeperDecide")
		Rule_Remove ("Rule_keeperAttackWatch")
	elseif ( KeeperGoGetTrapped == 1) then
		print ("Keeper going to get trapped!!!")
--		KeeperIsInTrap = 1								-- set variable telling intel event to play
		Rule_AddInterval ("Rule_keeperFallIntoTrap", 1)
		LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
		Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable
		KeeperHealthLocked = 1
		Timer_Start("KeeperLastAttackTimer", 170)					-- start timer to measure the last time the Keeper attacked the player
		Rule_Remove ("Rule_keeperAttackWatch")
	elseif ( Timer_GetRemaining("KeeperAttackTimer") < 1) and			-- if the attack timer is up
		 ( SobGroup_Count ( "AttackDroid_Dreadnaught" ) < 5) and 		-- and there are less than x droid around the Dreadnaught
		 ( DreadnaughtInProximityOfMS == 0 ) then					-- and the Dreadnaught isn't too close to the MS
		print ("Keeper in AttackWatch - going to build drones!!")
		SobGroup_EnterHyperSpaceOffMap("Keeper")					-- hyperspace out
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
		CountDroidsExistingONCE = 0								-- re-set droid counter so droids will be counted again
--		Rule_AddInterval ("Rule_keeperSpawnDroidsAtDreadnaughtPhase2", 20)	-- go spawn some more Attack Droids at the Dreadnaught
		Timer_Start("KeeperLastAttackTimer", 170)					-- start timer to measure the last time the Keeper attacked the player
		Rule_Add ("Rule_keeperSpawnDroidsAtDreadnaughtPhase2")		-- go spawn some more Attack Droids at the Dreadnaught
		Rule_Remove ("Rule_keeperAttackWatch")
	elseif ( Timer_GetRemaining("KeeperAttackTimer") < 1) and			-- if the attack timer is up
		 ( CreateFirstInhibitorDroids == 0) and						-- if the one-time variable hasn't been set
		 ( InhibitorTrapHasStarted == 1 ) and						-- if the Inhibitor trap has begun
		 ( SobGroup_Empty ( "tempSobGroupOne" ) ~= 1) then		-- and there are ships in the sobgroup
		CreateFirstInhibitorDroids = 1								-- set one-time variable so this check doesn't happen again
		print ("Keeper in AttackWatch - going to build INHIBITOR drones for the first time!")
		SobGroup_EnterHyperSpaceOffMap("Keeper")					-- hyperspace out
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
--		Rule_AddInterval ("Rule_keeperSpawnDroidsAtInhibitorTrap", 20)	-- go spawn some Attack Droids at Inhibitor Trap
		Timer_Start("KeeperLastAttackTimer", 170)					-- start timer to measure the last time the Keeper attacked the player
		Rule_Add ("Rule_keeperSpawnDroidsAtInhibitorTrap")			-- go spawn some Attack Droids at Inhibitor Trap
		Rule_Remove ("Rule_keeperAttackWatch")
	elseif ( Timer_GetRemaining("KeeperAttackTimer") < 1) and			-- if the attack timer is up
		 ( CreateFirstInhibitorDroids == 1) and 						-- if the Inhibitor droids have been created
		 ( SobGroup_Count ( "AttackDroid_Inhibitor" ) < 8) then			-- there are less than <x> droids at the inhibitor trap
		print ("Keeper in AttackWatch - going to build INHIBITOR drones!")
		SobGroup_EnterHyperSpaceOffMap("Keeper")					-- hyperspace out
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
		numInhibitorDroidsBuilt = SobGroup_Count ( "AttackDroid_Inhibitor" )	-- set built droids counter to number of droids left
--		Rule_AddInterval ("Rule_keeperSpawnDroidsAtInhibitorTrap", 20)	-- go spawn some Attack Droids at Inhibitor Trap
		Timer_Start("KeeperLastAttackTimer", 170)					-- start timer to measure the last time the Keeper attacked the player
		Rule_Add ("Rule_keeperSpawnDroidsAtInhibitorTrap")			-- go spawn some Attack Droids at Inhibitor Trap
		Rule_Remove ("Rule_keeperAttackWatch")
	elseif ( SobGroup_Empty ("KeeperTarget") == 1 ) then				-- if all targets are dead, go into wait state and then go back to decide
--		print ("All targets are dead!  Going into wait state!")
		print ("All targets are dead!  Going into Decide state!")
		SobGroup_EnterHyperSpaceOffMap("Keeper")					-- hyperspace out
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx
		LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
		Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable
		KeeperHealthLocked = 1
--		Rule_AddInterval ("Rule_keeperLockHealthRemove", 20)			-- after 10 seconds remove health lock
		print ("Locking Keeper's health!!!!!")
--		Rule_AddInterval ("Rule_keeperRetreat", 20)
--		Rule_AddInterval ("Rule_keeperDecide", 20)
		Timer_Start("KeeperLastAttackTimer", 170)					-- start timer to measure the last time the Keeper attacked the player
		Rule_Add ("Rule_keeperDecide")
		Rule_Remove ("Rule_keeperAttackWatch")
	end


end



-- goes to one of the veil chunk hiding places and waits for some time
function Rule_keeperWait()
	print ("Keeper EXITING HYPERSPACE and WAITING!")
	
	-- randomly choose the retreat point
	local randomPointIndex = RandomIntMax( 2 )+1;
	SobGroup_ExitHyperSpace("Keeper", "KeeperRetreat0"..randomPointIndex)		-- hyperspace in at random retreat point
	
	print ("Waiting for 40 seconds!")
	Rule_AddInterval ("Rule_keeperDecide", 10)				-- wait for <x> seconds
	Rule_Remove ("Rule_keeperWait")
	
end


-- retreats to one of the veil chunk hiding places and heals the Keeper
function Rule_keeperRetreat()
	print ("Keeper EXITING HYPERSPACE at the HEAL POINT!")
	
	-- randomly choose the retreat point
	local randomPointIndex = RandomIntMax( 2 )+1;
	SobGroup_ExitHyperSpace("Keeper", "KeeperRetreat0"..randomPointIndex)		-- hyperspace in at random retreat point
	
	Rule_AddInterval ("Rule_keeperHeal", 10)
	Rule_Remove ("Rule_keeperRetreat")
	
end


-- heal the keeper slowly over time
function Rule_keeperHeal()
	print ("Keeper HEALING himself!")

	if ( KeeperGoGetTrapped == 1) then
		print ("Keeper going to get trapped!!!")
--		KeeperIsInTrap = 1								-- set variable telling intel event to play
		Rule_AddInterval ("Rule_keeperFallIntoTrap", 1)
		LockedKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
		Rule_Add ("Rule_keeperLockHealth")						-- lock the Keeper's health (keep resetting it to the current health)
		FX_StartEvent( "Keeper", "Phase_loop" )						-- play Keeper "invulnerability" fx while Keeper is invulnerable
		KeeperHealthLocked = 1
		Rule_Remove ("Rule_keeperHeal")
	else
		CurrentKeeperHealth = SobGroup_HealthPercentage("Keeper")		-- get the existing health
		HealedKeeperHealth = CurrentKeeperHealth + 0.01				-- add 1% and put in a variable
		SobGroup_SetHealth("Keeper", HealedKeeperHealth)				-- set new health equal to old health + 1%
		Rule_AddInterval ("Rule_keeperCheckHealth", 0.5)				-- go check health
		Rule_Remove ("Rule_keeperHeal")
	end
	
end


-- check to see if the Keeper is fully healed
function Rule_keeperCheckHealth()
	print ("Keeper CHECKING his health!")

	-- if the Keeper is back up to full health then take him back to decide state
	if ( SobGroup_HealthPercentage("Keeper")	> 0.99) then
		Rule_AddInterval ("Rule_keeperDecide", 1)
		Rule_Remove ("Rule_keeperCheckHealth")
	else
		Rule_Add ("Rule_keeperHeal")
		Rule_Remove ("Rule_keeperCheckHealth")
	end
	
end


-- make Keeper hyperspace out
function Rule_keeperFallIntoTrap()
	print ("Keeper hyperspacing out - getting ready to fall into trap!!!")
	SobGroup_EnterHyperSpaceOffMap("Keeper")			-- hyperspace out
	FX_StartEvent( "Keeper", "Phase_loop" )				-- play Keeper "invulnerability" fx
--	Rule_AddInterval ("Rule_keeperFallIntoTrap2", 20)
	Rule_Add ("Rule_keeperFallIntoTrap2")
	Rule_Remove ("Rule_keeperFallIntoTrap")
end


-- make Keeper hyperspace in to the trap
function Rule_keeperFallIntoTrap2()
--	print ("keeperFallIntoTrap2 checking if Keeper is in hyperspace")
	if (SobGroup_AreAllInHyperspace( "Keeper" ) == 1) then
		print ("SCAR thinks the Keeper is in hyperspace!")
		print ("Keeper FALLING INTO TRAP!")
		FX_StopEvent( "Keeper", "Phase_loop" )					-- turn off Keeper "invulnerability" fx
		KeeperIsInTrap = 1
		SobGroup_ExitHyperSpace("Keeper", "EffectPoint01")		-- hyperspace in at trap centerpoint
		print ("Telling keeper to exit hyperspace in middle of trap")
		SobGroup_AbilityActivate( "Keeper", AB_Hyperspace, 0)		-- disable hyperspace ability so he can't go anywhere else
		Rule_AddInterval ("Rule_stopKeeper", 20)					-- tell Keeper to stop, cause he's "trapped"
		Rule_Remove ("Rule_keeperFallIntoTrap2")
	end
end


-- starts self-destruct timer / displays timer on screen / starts rule that damages Keeper
function Rule_StartKeeperSelfDestruct()
	Timer_Start( 0, 90 )									-- start timer
	Subtitle_TimeCounter( 0, 43522 )						-- display timer on screen
	Rule_Remove ("Rule_keeperLockHealth")
	Rule_AddInterval ("Rule_DamageKeeper", 0.5)				-- start killing the Keeper
	Rule_Remove ("Rule_StartKeeperSelfDestruct")
end

function Rule_DamageKeeper()
	SobGroup_TakeDamage( "Keeper", 0.0055 )
	if ( SobGroup_Empty ("Keeper") ) then
		Rule_AddInterval ("Rule_DestroyPlayer", 3)
		Rule_Remove ("Rule_DamageKeeper")
	end
end

function Rule_DestroyPlayer()
	SobGroup_TakeDamage( "Player_Ships0", 1.5 )				-- Give 150% damage to all the player ships
	Rule_Remove ("Rule_DestroyPlayer")
end


-- ===== KEEPER LOGIC ==========================================================================







-- ===== DREADNAUGHT Retrieval ==================================================================

-- set the Dreadnaught's latch paths to stay docked and start the rule(s) for the rest of the retrieval process
function Rule_startDreadnaughtRetrieval()

	-- Dreadnaught berth setup
	SobGroup_SetAutoLaunch( "Berth", ShipHoldStayDockedAlways )	-- set Dreadnaught Berth's latch path to stay docked so the DN will stay put until we want it to move
	SobGroup_DockSobGroupInstant( "Dreadnaught", "Berth")			-- have the Dreadnaught start already in the berth
	SetAlliance( 2, 3 )										-- Set alliance between Berth and Dreadnaught
	SetAlliance( 3, 2 )

	-- Dreadnaught setup
	SobGroup_SetAutoLaunch( "Dreadnaught", ShipHoldStayDockedAlways )	-- set Dreadnaught's latch paths to stay docked
	SobGroup_SetROE("Dreadnaught", PassiveROE)					-- set Dreadnaught's tactics to passive so he'll never auto-retaliate
	SobGroup_Create( "MoversLatchedToDreadnaught" )					-- create sob group for Movers that will eventually latch on

	Rule_AddInterval ("Rule_dreadnaughtLaunch", 3)
	Rule_Remove ("Rule_startDreadnaughtRetrieval")
end

-- watch for all movers to be latched on, then tell the Dreadnaught to launch
function Rule_dreadnaughtLaunch()
	SobGroup_GetSobGroupDockedWithGroup( "Dreadnaught", "MoversLatchedToDreadnaught" )	-- Fill the sobgroup with whatever ships are docked with the DN
	if ( SobGroup_Count ( "MoversLatchedToDreadnaught" ) == 6) then			-- if all latch paths are occupied
		SobGroup_Launch("Dreadnaught", "Berth" )
		
		-- play fx for Dreadnaught launching
		Rule_Add ("Rule_playeffect_dreadnaughtLaunch")
		
		SobGroup_DockSobGroupAndStayDocked("Dreadnaught", "PlayerMothership")			-- tell the Dreadnaught to dock with the MS
		PlayerHasDreadnaught = 1
		
		Rule_Add ("Rule_dreadnaughtRetrievalWatch")						-- watches for Movers to die
		Rule_Add ("Rule_watchForDreadnaughtToDock")						-- watches for DN to dock with MS
		Rule_AddInterval ("Rule_speedUpDreadnaught", 15)					-- increases speed of DN to help with pacing
		Rule_Add ("Rule_slowDreadnaughtDown")							-- slows DN down for nice docking when it's close to the MS
		Rule_Remove ("Rule_dreadnaughtLaunch")
	end
end


function Rule_speedUpDreadnaught()
        SobGroup_SetSpeed("Dreadnaught", 1.35)				-- Increase speed of Dreadnaught so the whole operation goes faster
	Rule_Remove ("Rule_speedUpDreadnaught")
end


-- if the Dreadnaught is within x meters of the Mothership, slow it down for nice-looking docking and remove checks
-- to make Dreadnaught stop moving if Movers are destroyed
function Rule_slowDreadnaughtDown()
	if ( SobGroup_FillProximitySobGroup( "tempSobGroupOne", "PlayerMothership", "Dreadnaught", 1800) == 1) then
		SobGroup_SetSpeed("Dreadnaught", 1.0)				-- slow the transport back down so it doesn't look weird when docking
		DreadnaughtInProximityOfMS = 1
--		SobGroup_DockSobGroupAndStayDocked("Dreadnaught", "PlayerMothership")				-- tell the Dreadnaught to dock with the MS and stay docked
		Rule_Remove ("Rule_slowDreadnaughtDown")
	end
end



-- watch for all the Movers to latch onto the Dreadnaught
function Rule_watchForMoversLatchedToDreadnaught()
	SobGroup_GetSobGroupDockedWithGroup( "Dreadnaught", "MoversLatchedToDreadnaught" )	-- Fill the sobgroup with whatever ships are docked with the DN
	if ( SobGroup_Count ( "MoversLatchedToDreadnaught" ) == 6) then						-- if all latch paths are occupied
--		SobGroup_DockSobGroup("Dreadnaught", "PlayerMothership")						-- tell the Dreadnaught to dock with the MS
		Ping_Remove( ping_dreadnaught_id )											-- remove the ping
		Rule_Add ("Rule_intelevent_raisingTheDreadnaughtREPEAT")						-- play the event about the DN moving again
		SobGroup_DockSobGroupAndStayDocked("Dreadnaught", "PlayerMothership")				-- tell the Dreadnaught to dock with the MS and stay docked
		DreadnaughtIsMoving = 1													-- set variable which tells rest of script that the Dreadnaught is moving
		Rule_AddInterval ("Rule_dreadnaughtRetrievalWatch", 2)
		Rule_Remove ("Rule_watchForMoversLatchedToDreadnaught")
	end
end


-- watch for the Dreadnaught to latch onto the Mothership & watch for Movers to die
function Rule_dreadnaughtRetrievalWatch()
	SobGroup_GetSobGroupDockedWithGroup( "Dreadnaught", "MoversLatchedToDreadnaught" )	-- Fill the sobgroup with whatever ships are docked with the DN
	
	-- watch for Movers to die
	if ( DreadnaughtInProximityOfMS == 0) and ( SobGroup_Count ( "MoversLatchedToDreadnaught" ) < 6) then		-- if the number of movers latched drops below the max,
		Rule_Add ("Rule_intelevent_dreadnaughtMoverLost")			-- play event telling player the dreadnaught is stalled
		SobGroup_Stop( 2, "Dreadnaught")							-- stop the Dreadnaught
		DreadnaughtIsMoving = 0									-- set variable which tells rest of script that the Dreadnaught is stopped
                ping_dreadnaught_id = Ping_AddSobGroup( ping_dreadnaught, "anomaly", "Dreadnaught" )	-- Add ping to Dreadnaught
		Ping_AddDescription(ping_dreadnaught_id, 0, "$43811")

		Rule_Add ("Rule_watchForMoversLatchedToDreadnaught")			-- go back to watching for all Movers to be latched
		Rule_Remove ("Rule_dreadnaughtRetrievalWatch")
	end
end


-- watch for Dreadnaught to latch onto Mothership
function Rule_watchForDreadnaughtToDock()
	if ( SobGroup_IsDocked("Dreadnaught") == 1) then					-- when the Dreadnaught is docked
		SobGroup_SetAutoLaunch( "Dreadnaught", ShipHoldLaunch)		-- tell all Movers to launch
		SobGroup_AllowPassiveActionsAlways ("Dreadnaught", 0)			-- turn off passive actions
		SobGroup_Launch("MoversLatchedToDreadnaught", "Dreadnaught" )	-- tell Movers to launch
		DreadnaughtDockedWithMS = 1
		print ("Dreadnaught has docked with mothership!")
		print ("Dreadnaught docked variable:"..DreadnaughtDockedWithMS)
		
		-- play intel event about it
		Rule_AddInterval ("Rule_intelevent_dreadnaughtDocked", 1)		-- Dreadnaught docked / Science teams and crew transferring / ...
		
		Rule_Remove ("Rule_watchForDreadnaughtToDock")
	end
end

-- watch for "crew" to finish transferring to the Dreadnaught and tell it to launch
function Rule_launchDreadnaughtFromMS()
	SobGroup_GetSobGroupDockedWithGroup( "Dreadnaught", "MoversLatchedToDreadnaught" )	-- Fill the sobgroup with whatever ships are docked with the DN
--	if ( Event_IsDone("intelevent_dreadnaughtDocked") == 1 ) then
	if ( intelevent_dreadnaughtDockedISDONE == 1 ) then
		SobGroup_Launch("Dreadnaught", "PlayerMothership" )			-- Launch the Dreadnaught
		SobGroup_AutoEngineGlow ("Dreadnaught")				-- turn engine glow back on
--		SobGroup_Launch("MoversLatchedToDreadnaught", "Dreadnaught" )		-- tell Movers to launch
		SobGroup_SwitchOwner( "Dreadnaught", 0 )				-- Switch Dreadnaught to the player's fleet so they can control it
		local abilityList = {AB_Attack, AB_Guard, AB_Retire, AB_Scuttle};
                for j = 1, 4 do 
			SobGroup_AbilityActivate( "Dreadnaught", abilityList[j], 0 );	-- Turn off certain abilities on Dreadnaught
		end

		Rule_Remove ("Rule_launchDreadnaughtFromMS")
	end
end

-- ===== DREADNAUGHT Retrieval ==================================================================








-- ===== HS Inhibitors ===========================================================================

-- creates a single Hgn_HSInhibitor ship from the player's MS, then sets its latch paths to stay docked
function Rule_startInhibitorInstall()

	-- set up alliances
	SetAlliance( 0, 4 )							-- Set alliance between player and HS Inhibitor so they can dock with it
	SetAlliance( 4, 0 )
	SetAlliance( 3, 4 )							-- Set alliance between HS Inhibitor and Megaliths so it can dock with the veil chunks
	SetAlliance( 4, 3 )
	SetAlliance( 1, 4 )							-- Set alliance between HS Inhibitor and Keepers so they won't attack the Inhibitors
	SetAlliance( 4, 1 )


	-- Veil chunk setup
	SobGroup_SetAutoLaunch( "InhibitorChunk1", ShipHoldStayDockedAlways )	-- tell veil chunks to keep Inhibitors latched on
	SobGroup_SetAutoLaunch( "InhibitorChunk2", ShipHoldStayDockedAlways )
	SobGroup_SetAutoLaunch( "InhibitorChunk3", ShipHoldStayDockedAlways )

	-- Inhibitor setup
	SobGroup_SetAutoLaunch( "HSInhibitor1", ShipHoldStayDockedAlways )	-- tell Inhibitors to keep Movers latched on
	SobGroup_SetAutoLaunch( "HSInhibitor2", ShipHoldStayDockedAlways )
	SobGroup_SetAutoLaunch( "HSInhibitor3", ShipHoldStayDockedAlways )

	
	Rule_Remove ("Rule_startInhibitorInstall")
end



-------------------------------------------------------------------------------------------------
-- Inhibitor 1
-------------------------------------------------------------------------------------------------

-- watch to see when the player latches onto the Inhibitor & tell it to dock with Veil Chunk
function Rule_watchForMoverDockedToInhibitor1()
	SobGroup_GetSobGroupDockedWithGroup( "HSInhibitor1", "MoversLatchedToInhibitor1" )
	if ( SobGroup_Count ( "MoversLatchedToInhibitor1" ) > 0) then
		Ping_Remove( ping_inhibitor1_id )								-- Remove ping on inhibitor
		SobGroup_DockSobGroup("HSInhibitor1", "InhibitorChunk1")			-- tell the Inhibitor to dock with the Ceil Chunk
		Inhibitor1EnRoute = 1
		Rule_Add ("Rule_inhibitor1InstallWatch")
		Rule_Remove ("Rule_watchForMoverDockedToInhibitor1")
	end
end


-- watch for the Inhibitor to latch onto the Veil Chunk & watch for Mover to die
function Rule_inhibitor1InstallWatch()
	SobGroup_GetSobGroupDockedWithGroup( "HSInhibitor1", "MoversLatchedToInhibitor1" )	-- Fill the sobgroup with whatever ships are docked with the Inhibitor
	
	-- watch for Mover to die
	if ( SobGroup_Count ( "MoversLatchedToInhibitor1" ) == 0) then		-- if the mover latched on dies,
		SobGroup_Stop( 4, "HSInhibitor1")							-- stop the Inhibitor
		ping_inhibitor1_id = Ping_AddSobGroup( ping_inhibitor1, "anomaly", "HSInhibitor1" )	-- Add the ping again
		Ping_AddDescription(ping_inhibitor1_id, 0, "$43814")
		Rule_Add ("Rule_watchForMoverDockedToInhibitor1")			-- go back to watching for Mover to be latched on
		Rule_Remove ("Rule_inhibitor1InstallWatch")
	end

	-- watch for Inhibitor to latch onto Veil Chunk
	if ( SobGroup_IsDocked("HSInhibitor1") == 1) then					-- when the Inhibitor is docked
		SobGroup_SetAutoLaunch( "HSInhibitor1", ShipHoldLaunch)		-- tell Mover to launch
		Ping_Remove( ping_inhibitor1_id )								-- Remove ping on inhibitor
		SobGroup_Launch("MoversLatchedToInhibitor1", "HSInhibitor1" )	-- tell Mover to launch
		Inhibitor1Installed = 1
		SobGroup_AbilityActivate( "HSInhibitor1", AB_AcceptDocking, 0 )	-- disable docking so more Movers can't dock
		Rule_Add ("Rule_playeffect_inhibitor1Attached")					-- play effect
		TOTALInhibitorsInstalled = TOTALInhibitorsInstalled + 1			-- increment variable for speech events
		print ("Inhibitors installed ="..TOTALInhibitorsInstalled)
		FOW_RevealGroup("InhibitorChunk1", 1)						-- Reveal fog of war for chunk w/ inhibitor installed
		Rule_Remove ("Rule_inhibitor1InstallWatch")
	end
end
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Inhibitor 2
-------------------------------------------------------------------------------------------------

-- watch to see when the player latches onto the Inhibitor & tell it to dock with Veil Chunk
function Rule_watchForMoverDockedToInhibitor2()
	SobGroup_GetSobGroupDockedWithGroup( "HSInhibitor2", "MoversLatchedToInhibitor2" )
	if ( SobGroup_Count ( "MoversLatchedToInhibitor2" ) > 0) then
		Ping_Remove( ping_inhibitor2_id )								-- Remove ping on inhibitor
		SobGroup_DockSobGroup("HSInhibitor2", "InhibitorChunk2")			-- tell the Inhibitor to dock with the Ceil Chunk
		Inhibitor2EnRoute = 1
		Rule_Add ("Rule_inhibitor2InstallWatch")
		Rule_Remove ("Rule_watchForMoverDockedToInhibitor2")
	end
end


-- watch for the Inhibitor to latch onto the Veil Chunk & watch for Mover to die
function Rule_inhibitor2InstallWatch()
	SobGroup_GetSobGroupDockedWithGroup( "HSInhibitor2", "MoversLatchedToInhibitor2" )	-- Fill the sobgroup with whatever ships are docked with the Inhibitor
	
	-- watch for Mover to die
	if ( SobGroup_Count ( "MoversLatchedToInhibitor2" ) == 0) then		-- if the mover latched on dies,
		SobGroup_Stop( 4, "HSInhibitor2")							-- stop the Inhibitor
		ping_inhibitor2_id = Ping_AddSobGroup( ping_inhibitor2, "anomaly", "HSInhibitor2" )	-- Add the ping again
		Ping_AddDescription(ping_inhibitor2_id, 0, "$43814")
		Rule_Add ("Rule_watchForMoverDockedToInhibitor2")			-- go back to watching for Mover to be latched on
		Rule_Remove ("Rule_inhibitor2InstallWatch")
	end

	-- watch for Inhibitor to latch onto Veil Chunk
	if ( SobGroup_IsDocked("HSInhibitor2") == 1) then					-- when the Inhibitor is docked
		SobGroup_SetAutoLaunch( "HSInhibitor2", ShipHoldLaunch)		-- tell Mover to launch
		Ping_Remove( ping_inhibitor2_id )							-- Remove ping on inhibitor
		SobGroup_Launch("MoversLatchedToInhibitor2", "HSInhibitor2" )	-- tell Mover to launch
		Inhibitor2Installed = 1
		SobGroup_AbilityActivate( "HSInhibitor2", AB_AcceptDocking, 0 )	-- disable docking so more Movers can't dock
		Rule_Add ("Rule_playeffect_inhibitor2Attached")					-- play effect
		TOTALInhibitorsInstalled = TOTALInhibitorsInstalled + 1			-- increment variable for speech events
		print ("Inhibitors installed ="..TOTALInhibitorsInstalled)
		FOW_RevealGroup("InhibitorChunk2", 1)						-- Reveal fog of war for chunk w/ inhibitor installed
		Rule_Remove ("Rule_inhibitor2InstallWatch")
	end
end
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Inhibitor 3
-------------------------------------------------------------------------------------------------

-- watch to see when the player latches onto the Inhibitor & tell it to dock with Veil Chunk
function Rule_watchForMoverDockedToInhibitor3()
	SobGroup_GetSobGroupDockedWithGroup( "HSInhibitor3", "MoversLatchedToInhibitor3" )
	if ( SobGroup_Count ( "MoversLatchedToInhibitor3" ) > 0) then
		Ping_Remove( ping_inhibitor3_id )								-- Remove ping on inhibitor
		SobGroup_DockSobGroup("HSInhibitor3", "InhibitorChunk3")			-- tell the Inhibitor to dock with the Ceil Chunk
		Inhibitor3EnRoute = 1
		Rule_Add ("Rule_inhibitor3InstallWatch")
		Rule_Remove ("Rule_watchForMoverDockedToInhibitor3")
	end
end


-- watch for the Inhibitor to latch onto the Veil Chunk & watch for Mover to die
function Rule_inhibitor3InstallWatch()
	SobGroup_GetSobGroupDockedWithGroup( "HSInhibitor3", "MoversLatchedToInhibitor3" )	-- Fill the sobgroup with whatever ships are docked with the Inhibitor
	
	-- watch for Mover to die
	if ( SobGroup_Count ( "MoversLatchedToInhibitor3" ) == 0) then		-- if the mover latched on dies,
		ping_inhibitor3_id = Ping_AddSobGroup( ping_inhibitor3, "anomaly", "HSInhibitor3" )	-- Add the ping again
		Ping_AddDescription(ping_inhibitor3_id, 0, "$43814")
		SobGroup_Stop( 4, "HSInhibitor3")							-- stop the Inhibitor
		Rule_Add ("Rule_watchForMoverDockedToInhibitor3")			-- go back to watching for Mover to be latched on
		Rule_Remove ("Rule_inhibitor3InstallWatch")
	end

	-- watch for Inhibitor to latch onto Veil Chunk
	if ( SobGroup_IsDocked("HSInhibitor3") == 1) then					-- when the Inhibitor is docked
		SobGroup_SetAutoLaunch( "HSInhibitor3", ShipHoldLaunch)			-- tell Mover to launch
		Ping_Remove( ping_inhibitor3_id )								-- Remove ping on inhibitor
		SobGroup_Launch("MoversLatchedToInhibitor3", "HSInhibitor3" )		-- tell Mover to launch
		Inhibitor3Installed = 1
		SobGroup_AbilityActivate( "HSInhibitor3", AB_AcceptDocking, 0 )	-- disable docking so more Movers can't dock
		Rule_Add ("Rule_playeffect_inhibitor3Attached")					-- play effect
		TOTALInhibitorsInstalled = TOTALInhibitorsInstalled + 1			-- increment variable for speech events
		print ("Inhibitors installed ="..TOTALInhibitorsInstalled)
		FOW_RevealGroup("InhibitorChunk3", 1)						-- Reveal fog of war for chunk w/ inhibitor installed
		Rule_Remove ("Rule_inhibitor3InstallWatch")
	end
end
-------------------------------------------------------------------------------------------------




-- ===== HS INHIBITORS ==================================================================



-- ===== MUSIC ==================================================================================


function Rule_PlayAmbientMusic()
	print ("trying to play ambient music!")
	Sound_MusicPlayType( "data:sound/music/ambient/amb_08", MUS_Ambient )
	Rule_Remove ("Rule_PlayAmbientMusic")
end

function Rule_PlayStagingMusic()
	print ("trying to play staging music!")
	Sound_MusicPlayType( "data:sound/music/staging/staging_08", MUS_Staging )
	Rule_Remove ("Rule_PlayStagingMusic")
end

function Rule_PlayBattleMusic()
	print ("trying to play Battle music!")
	Sound_MusicPlayType( "data:sound/music/battle/battle_keeper", MUS_Battle )
	Rule_Remove ("Rule_PlayBattleMusic")
end

-- ===== MUSIC ==================================================================================








-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end



-- ===== EVENT TABLES ==========================================================================

-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_intro =
{
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6431' )",""}, -- ..' Mission Start'
	},
        {
                HW2_Wait ( 2 ),
	},
        {
                HW2_LocationCardEvent( "$43520", 6 ),								-- DREADNAUGHT BERTH
        },
	{
		{"Sound_EnableAllSpeech( 1 )",""},
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43530", 3 ),					-- Hyperspace successful.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43531", 2 ),					-- We are alone.
        },
	{
                HW2_Wait ( 1 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43532", 5 ),					-- Telemetry data confirms this is the Engineering section of the wreckage.
        },
	{
		HW2_Letterbox ( 1 ),
		{ "Universe_EnableSkip(1)", "" },							-- Enable Intel event skipping
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_Pause ( 1 ),
	},
	{
                HW2_Wait ( 2 ),
	},
        {
		{"Camera_FocusSave()",""},
                {"Sensors_Toggle( 1 )","" },
        },
	{
		{ "Camera_Interpolate( 'here', 'camera9', 1)",""},
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43536", 4 ),					-- The Dreadnaught is located here.
		{"pointer_powerSignature_id = HW2_CreateEventPointerSobGroup( 'Berth' )",""},
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43537", 8 ),					-- We're detecting intense power fluctuations in the surrounding progenitor derelicts.
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43534", 4 ),					-- Send in scouts to confirm the location of the Dreadnaught.
                {"ping_powerSignature_id = Ping_AddSobGroup( ping_powerSignature, 'anomaly', 'Berth' )",""},	-- Add ping to power signature location (Dreadnaught)
		{"Ping_AddDescription(ping_powerSignature_id, 0, '$43810')",""},
		{"obj_prim_investigatePowerSignature_id =  Objective_Add( obj_prim_investigatePowerSignature , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_investigatePowerSignature_id, '$43810')", "" },
        },
	{
                HW2_Wait ( 1 ),
	},
        {
		{"EventPointer_Remove(pointer_powerSignature_id)",""},		-- remove pointer
        },
        {
		{ "Universe_EnableSkip(0)", "" },								-- Disable Intel event skipping
		HW2_Pause (0),
                {"Sensors_Toggle( 0 )","" },
		{"Camera_FocusRestore()",""},
		HW2_Letterbox ( 0 ),
        },
	{
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
--		{"Rule_AddInterval ('Rule_testHyperspace1', 5)",""},
	},
}



-- placeholder NIS
Events.intelevent_meetTheKeeper =
{
	{
                HW2_Wait ( 1 ),
	},
	{
		{"Ping_Remove( ping_powerSignature_id )",""}, 	                                -- remove power signature ping
                {"Objective_SetState( obj_prim_investigatePowerSignature_id, OS_Complete )",""},	-- investigate power signature: complete
--		HW2_Letterbox ( 1 ),
		{"Camera_SetLetterboxStateNoUI(1, 3 )",""},
	},
	{
                HW2_Wait ( 3.5 ),
	},
        {
--		{"NISLoad( 'nis/NIS08' )",""},						-- load the NIS
		{"g_currentNISPlaying_id = NISPlayFromGroup( 'nis/NIS08', 'Berth' )",""},	-- play the NIS around the Berth
		{"Rule_Add ('Rule_intelevent_NISDone')",""},			-- add rule watching for NIS to be complete
	},
--	{
--		HW2_Letterbox ( 0 ),
--		 {"intelevent_meetTheKeeperISDONE = 1",""},					-- set variable so we know when event is finished
--	},
}




-- Tell the player to retrieve the Dreadnaught
Events.intelevent_retrieveTheDreadnaught =
{
--~ 	{
--~ 		HW2_Letterbox ( 1 ),
--~ 		{ "Universe_EnableSkip(1)", "" },								-- Enable Intel event skipping
--~ 	},
--~ 	{
--~ 		HW2_Wait ( 0.5 ),
--~ 	},
	{
		HW2_Pause ( 1 ),
	},
	{
		HW2_Wait ( 2 ),
	},
        {
		{ "Universe_EnableSkip(1)", "" },								-- Enable Intel event skipping
		{"Sensors_Toggle( 1 )","" },
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43610", 4 ),					-- The Progenitor Dreadnaught has been located.
		{"pointer_dreadnaught_id = HW2_CreateEventPointerSobGroup( 'Dreadnaught' )",""},	-- point to Dreadnaught
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43611", 4 ),					-- Use Movers to retrieve it.
                {"ping_dreadnaught_id = Ping_AddSobGroup( ping_dreadnaught, 'anomaly', 'Dreadnaught' )",""},	-- Add ping to Dreadnaught
		{"Ping_AddDescription(ping_dreadnaught_id, 0, '$43811')",""},
		{"obj_prim_retrieveDreadnaught_id =  Objective_Add( obj_prim_retrieveDreadnaught , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_retrieveDreadnaught_id, '$43812')", "" },
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43612", 4 ),					-- At least SIX Movers will be required to transport the Dreadnaught.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
		{"EventPointer_Remove(pointer_dreadnaught_id)",""},				-- remove pointer
        },
        {
		{ "Universe_EnableSkip(0)", "" },								-- Disable Intel event skipping
		HW2_Pause (0),
                {"Sensors_Toggle( 0 )","" },
		HW2_Letterbox ( 0 ),
--		Camera_SetLetterboxState(0, 0 )
        },
        {
		{"Rule_AddInterval ('Rule_turnUIBackOn', 1)",""},					-- turn the UI back on
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6432' )",""}, -- ..' Retrieve Dreadnaught'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"Rule_AddInterval ('Rule_intelevent_hyperspaceDisabled', 3)",""},
		{"Rule_Add ('Rule_PlayStagingMusic')",""},
		{"EventPlaying = 0",""},
	},
}



-- FC goes krazy because the Keeper has disabled her hyperdrive
Events.intelevent_hyperspaceDisabled =
{
        {
		HW2_SubTitleEvent( Actor_FleetCommand, "$43605",  7),			-- ** PICKUP SPEECH ** The progenitor ship is generating a massive hyperspace interference field.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43606",  5),			-- ** PICKUP SPEECH ** Unable to charge Hyperspace Core.  We are trapped.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-- audio feedback when you have the dreadnaught
Events.intelevent_raisingTheDreadnaught =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43620",  3),			-- Movers locked on.
		{"Ping_Remove( ping_dreadnaught_id )",""},											-- remove the ping
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43621",  4),			-- Dreadnaught retrieval underway.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-- tell player how to defeat Attack Droids
Events.intelevent_droidAnalysis =
{
	{
                HW2_Wait ( 3 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43615",  5),			-- ** PICKUP SPEECH ** Progenitor Drones are attacking the Movers.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43616",  7),			-- ** PICKUP SPEECH ** Scans indicate they are vulnerable to anti-corvette weaponry.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43617",  7),			-- ** PICKUP SPEECH ** Recommend using Torpedo Frigates and Pulsar Gunships to protect the Movers.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





-- feedback for when you lose a Mover and the Dreadnaught stops moving
Events.intelevent_dreadnaughtMoverLost =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43630",  4),			-- Mover lost.  Dreadnaught retrieval halted.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43631",  5),			-- Assign additional movers to retrieve the Dreadnaught.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


-- let player know when Dreadnaught docks / 'crew' transfers, etc.
Events.intelevent_dreadnaughtDocked =
{
        {
                {"print ('trying to play dreadnaught docked event')",""},
		{"Objective_SetState( obj_prim_retrieveDreadnaught_id, OS_Complete )",""},		-- retrieve the Dreadnaught: complete
		{"Ping_Remove( ping_dreadnaught_id )",""},				-- remove Dreadnaught ping
                HW2_SubTitleEvent( Actor_FleetIntel, "$43640",  2.5),		-- Dreadnaught docked.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43641",  4),			-- Science teams and crew transferring to Dreadnaught.
        },
	{
                HW2_Wait ( 8 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43642",  3),			-- Crew transfer complete.
        },
	{
                HW2_Wait ( 1 ),
	},
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6433' )",""}, -- ..' Dreadnaught Retrieved'
	},
	{
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
	},
	{
		{"intelevent_dreadnaughtDockedISDONE = 1",""},			-- set variable so we know when event is finished
		{"Rule_AddInterval ('Rule_launchDreadnaughtFromMS', 1)",""},
		{"EventPlaying = 0",""},
		{"Rule_AddInterval ('Rule_intelevent_cannotDefeatKeeper', 12)",""},				-- play "cannot defeat keeper" event
	},
}




-- let player know why the almighty Dreadnaught can't do squat
Events.intelevent_dreadnaughtAnalysis =
{
	{
                HW2_Wait ( 2 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43650",  5),			-- Science teams have completed an initial analysis of the Dreadnaught.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43651",  6),			-- Scans indicate that the engines and hyperspace drives are operational.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43652",  5),			-- Science teams are working to bring the Dreadnaught's other systems online.
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{"EventPlaying = 0",""},
		{"intelevent_dreadnaughtAnalysisISDONE = 1",""},		-- set variable so we know when event is finished
		{"Rule_AddInterval ('Rule_intelevent_letsGo', 3)",""},				-- Hyperspace module charged / Initiating hyperspace

	},
}





-- let player know the Keeper is attacking their precious ships
Events.intelevent_keeperAttacking =
{
	{
		{"Rule_Add ('Rule_PlayBattleMusic')",""},
		HW2_Letterbox ( 1 ),
		{ "Universe_EnableSkip(1)", "" },									-- Enable Intel event skipping
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_Pause ( 1 ),
	},
	{
                HW2_Wait ( 2 ),
	},
        {
		{"Camera_FocusSave()",""},
                {"Sensors_Toggle( 1 )","" },
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
		{"Camera_FocusSobGroup( 'Keeper', 1, 14000, 1 )",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$43590",  4),						-- The progenitor ship is attacking.
		{"pointer_keeper_id = HW2_CreateEventPointerSobGroup( 'Keeper' )",""},	-- point to Keeper
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43591",  5),					-- The Oracle refers to these ships as "Keepers."
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43592",  6),					-- They are ancient machines dedicated to the protection of the Progenitor Empire.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43593",  4),					-- It will stop at nothing to destroy us.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43594",  5),						-- Defend the fleet against this Keeper.
		{"obj_prim_protectFleet_id =  Objective_Add( obj_prim_protectFleet , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_protectFleet_id, '$43813')", "" },
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
		{"EventPointer_Remove(pointer_keeper_id)",""},						-- remove pointer
        },
        {
		{ "Universe_EnableSkip(0)", "" },									-- Disable Intel event skipping
		HW2_Pause (0),
                {"Sensors_Toggle( 0 )","" },
		{"Camera_FocusRestore()",""},
		HW2_Letterbox ( 0 ),
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





-- let player know the Keeper is attacking their precious ships
Events.intelevent_cannotDefeatKeeper =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43700",  5),						-- Combat data indicates we cannot defeat the Keeper with conventional weapons...
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_Letterbox ( 1 ),
		{ "Universe_EnableSkip(1)", "" },									-- Enable Intel event skipping
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_Pause ( 1 ),
	},
	{
                HW2_Wait ( 2 ),
	},
        {
                {"Sensors_Toggle( 1 )","" },
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43701",  5),						-- ...but we believe we have found a weakness.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43702",  6),						-- We have identified Progenitor Power Modules in the local area.
		{"pointer_derelict1_id = HW2_CreateEventPointerSobGroup( 'InhibitorChunk1' )",""},	-- point to PowerModules
		{"pointer_derelict2_id = HW2_CreateEventPointerSobGroup( 'InhibitorChunk2' )",""},	-- point to PowerModules
		{"pointer_derelict3_id = HW2_CreateEventPointerSobGroup( 'InhibitorChunk3' )",""},	-- point to PowerModules
        },
	{
--		{"Camera_FocusSobGroup( 'InhibitorChunkALL', 1, 17000, 1 )", "" },
                HW2_Wait ( 1 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43709",  8),					-- *** PICKUP REQUIRED *** The Oracle indicates that these modules could be activated and cause the Keeper to overload.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43704",  8),					-- ** PICKUP SPEECH ** The Power Module design indicates they are activated by a trigger device.
        },
	{
		{"EventPointer_Remove(pointer_derelict1_id)",""},					-- remove pointer
		{"EventPointer_Remove(pointer_derelict2_id)",""},					-- remove pointer
		{"EventPointer_Remove(pointer_derelict3_id)",""},					-- remove pointer
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43705",  8),					-- ** PICKUP SPEECH ** Send probes to these locations to scan for trigger devices.
		-- add pings to probe points
                {"ping_probeLocation_id1 = Ping_AddPoint( ping_probeLocation1, 'anomaly', 'ProbeLocation1' )",""},	-- Add ping to point
		{"Ping_AddDescription(ping_probeLocation_id1, 0, '$43816')",""},
                {"ping_probeLocation_id2 = Ping_AddPoint( ping_probeLocation2, 'anomaly', 'ProbeLocation2' )",""},	-- Add ping to point
		{"Ping_AddDescription(ping_probeLocation_id2, 0, '$43816')",""},
                {"ping_probeLocation_id3 = Ping_AddPoint( ping_probeLocation3, 'anomaly', 'ProbeLocation3' )",""},	-- Add ping to point
		{"Ping_AddDescription(ping_probeLocation_id3, 0, '$43816')",""},
                {"ping_probeLocation_id4 = Ping_AddPoint( ping_probeLocation4, 'anomaly', 'ProbeLocation4' )",""},	-- Add ping to point
		{"Ping_AddDescription(ping_probeLocation_id4, 0, '$43816')",""},
                {"ping_probeLocation_id5 = Ping_AddPoint( ping_probeLocation5, 'anomaly', 'ProbeLocation5' )",""},	-- Add ping to point
		{"Ping_AddDescription(ping_probeLocation_id5, 0, '$43816')",""},
                {"ping_probeLocation_id6 = Ping_AddPoint( ping_probeLocation6, 'anomaly', 'ProbeLocation6' )",""},	-- Add ping to point
		{"Ping_AddDescription(ping_probeLocation_id6, 0, '$43816')",""},
		-- add objective
		{"obj_prim_sendProbes_id =  Objective_Add( obj_prim_sendProbes , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_sendProbes_id, '$43816')", "" },
        },
	{
                HW2_Wait ( 3 ),
	},
        {
		{ "Universe_EnableSkip(0)", "" },									-- Disable Intel event skipping
		HW2_Pause (0),
                {"Sensors_Toggle( 0 )","" },
		HW2_Letterbox ( 0 ),
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
		{"Rule_Add ('Rule_WatchForProbes')",""},
		{"Rule_AddInterval ('Rule_intelevent_probeInPosition', 2)",""},
		{"Rule_AddInterval ('Rule_intelevent_devicesLocated',3)",""},
	},
}



-- plays each time the player puts a probe at the proper locations
Events.intelevent_probeInPosition =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43720",  5),			-- ** PICKUP SPEECH ** Probe in position.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- plays when the player's probe is in position but there aren't any devices there
Events.intelevent_scansNegative =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43725",  5),			-- Scans negative.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


-- plays when the player's probe is in position but there aren't any devices there
Events.intelevent_noDevicesFound =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43726",  5),			-- No devices found.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


-- plays when the player's probe is in position but there aren't any devices there
Events.intelevent_scanResultsNegative =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43727",  5),			-- Scan results negative.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





-- plays when player gets probe to the *right* location
Events.intelevent_devicesLocated =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43721",  5),			-- ** PICKUP SPEECH ** Trigger devices located.
                {"Objective_SetState( obj_prim_sendProbes_id, OS_Complete )",""},
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"InhibitorTrapHasStarted = 1",""},
		{"EventPlaying = 0",""},
	},
}



-- tell the player to install the Inhibitors
Events.intelevent_installInhibitors =
{
	{
		HW2_Letterbox ( 1 ),
		{ "Universe_EnableSkip(1)", "" },								-- Enable Intel event skipping
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_Pause ( 1 ),
	},
	{
                HW2_Wait ( 2 ),
	},
        {
                {"Sensors_Toggle( 1 )","" },
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43706", 5 ),					-- We have confirmed that the power modules can be activated using these devices...
                {"pointer_inhibitor1_id = HW2_CreateEventPointerVolume('InhibitorSphere')",""},      -- Add a pointer to the location of inhibitors
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43708", 9 ),					-- ** PICKUP SPEECH ** Use Movers to collect them and install them on the power modules.
		-- pings
		{"ping_inhibitor1_id = Ping_AddSobGroup( ping_inhibitor1, 'anomaly', 'HSInhibitor1' )",""},	-- Add ping to Inhibitor
		{"Ping_AddDescription(ping_inhibitor1_id, 0, '$43814')",""},
		{"ping_inhibitor2_id = Ping_AddSobGroup( ping_inhibitor2, 'anomaly', 'HSInhibitor2' )",""},	-- Add ping to Inhibitor
		{"Ping_AddDescription(ping_inhibitor2_id, 0, '$43814')",""},
		{"ping_inhibitor3_id = Ping_AddSobGroup( ping_inhibitor3, 'anomaly', 'HSInhibitor3' )",""},	-- Add ping to Inhibitor
		{"Ping_AddDescription(ping_inhibitor3_id, 0, '$43814')",""},
--		{"ping_inhibitorfield_id = Ping_AddPoint( ping_inhibitorfield, 'anomaly', 'InhibitorSphere')",""},	-- Add ping to location of inhibitors
--		{"Ping_AddDescription(ping_inhibitorfield_id, 0, '$43814')",""},
		--objectives
		{"obj_prim_installInhibitors_id =  Objective_Add( obj_prim_installInhibitors , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_installInhibitors_id, '$43815')", "" },
        },
	{
                HW2_Wait ( 2 ),
	},
        {
		{"EventPointer_Remove(pointer_inhibitor1_id)",""},				-- remove pointer
        },
        {
		{ "Universe_EnableSkip(0)", "" },								-- Disable Intel event skipping
		HW2_Pause (0),
                {"Sensors_Toggle( 0 )","" },
		HW2_Letterbox ( 0 ),
        },
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6434' )",""}, -- ..' Collect Devices'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}













-- Inhibitor 1 en route
Events.intelevent_inhibitor1EnRoute =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43710",  3),			-- Device en route.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- Inhibitor 2 en route
Events.intelevent_inhibitor2EnRoute =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43710",  3),			-- Device en route.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- Inhibitor 3 en route
Events.intelevent_inhibitor3EnRoute =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43710",  3),			-- Device en route.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-- Inhibitor 1 installed
Events.intelevent_inhibitor1Installed =
{
        {
		{ "Universe_EnableSkip(1)", "" },								-- Enable Intel event skipping
                HW2_Letterbox( 1 ),
                HW2_Wait ( 4 ),
        },
        {
--                {"Camera_FocusSobGroup( 'FrigateGuardFocus', 1, 500, 1 )", "" },
		{"Rule_Add ('Rule_FocusOnFirstInstalledInhibitor')",""},		-- call rule to figure out which inhibitor to focus on
        },
	{
                HW2_Wait ( 1 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43740",  3),			-- Device One installed.
--		{"Ping_Remove( ping_derelict1_id )",""},				-- remove Dreadnaught ping
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43742",  3),			-- ** PICKUP SPEECH ** Power Module activated.
        },
        {
                HW2_Wait ( 1 ),
        },
        {
                HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },								-- Disable Intel event skipping
		{"Sensors_EnableToggle(1)",""},								-- Allow going in and out of the Sensors Manager
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- Inhibitor 2 installed
Events.intelevent_inhibitor2Installed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43745",  3),			-- Device Two installed.
--		{"Ping_Remove( ping_derelict2_id )",""},				-- remove Dreadnaught ping
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43742",  3),			-- ** PICKUP SPEECH ** Power Module activated.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- Inhibitor 3 installed
Events.intelevent_inhibitor3Installed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43750",  3),			-- Device Three installed.
--		{"Ping_Remove( ping_derelict3_id )",""},				-- remove Dreadnaught ping
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43742",  3),			-- ** PICKUP SPEECH ** Power Module activated.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- distortion field active.
Events.intelevent_distortionFieldActive =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43756",  3),			-- ** PICKUP SPEECH ** The distortion field is building.
		{"Objective_SetState( obj_prim_installInhibitors_id, OS_Complete )",""},	-- install inhibitors: complete
        },
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id +1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6435' )",""}, -- ..' Distortion Field Activated'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





-- focus on Keeper as he falls into the deadly hyperspace trap!
Events.intelevent_keeperTrapped =
{
	{
                HW2_Wait ( 1 ),
	},
	{
		HW2_Letterbox ( 1 ),
	},
	{
                HW2_Wait ( 3 ),
	},
	{
--               	 {"Camera_FocusSobGroup( 'Keeper', 1, 1000, 1 )", "" },	-- Focus on Keeper
		{ "Camera_Interpolate( 'here', 'camera2', 1)",""},
		{"Rule_Add ('Rule_playeffect_hyperspaceTrap')",""},
	},
	{
                HW2_Wait ( 7 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43578",  5),			-- ** PICKUP SPEECH ** The Keeper is trapped.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43579",  5),		-- ** PICKUP SPEECH ** The Hyperspace Core is back on-line.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43580",  5),			-- Sensors detect a large power cascade building up inside the Keeper.
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43582",  5),			-- We must escape before the Keeper self-destructs.
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
--		{"Rule_Add ('Rule_StartKeeperSelfDestruct')",""},
--		{"Rule_Add ('Rule_intelevent_oneMinuteToSelfDestruct')",""},
		{"intelevent_keeperTrappedISDONE = 1",""},				-- set variable so we know when event is finished
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



Events.intelevent_oneMinuteToSelfDestruct =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43583",  5),			-- ** PICKUP SPEECH ** Less than one minute to Keeper self-destruct.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_thirtySecondsToSelfDestruct =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43584",  5),			-- ** PICKUP SPEECH ** Less than thirty seconds to Keeper self-destruct.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-- let's blow this popsicle stand
Events.intelevent_letsGo =
{
        {
		{"Sound_SetMuteActor('Fleet')",""},										-- mute FC so she doesn't say regular AllShips lines
                HW2_SubTitleEvent( Actor_FleetCommand, "$43770", 3 ),		-- Hyperspace module charged.
--		{"Rule_Remove ('Rule_DamageKeeper')",""},				-- remove rule that damages Keeper
--		{"Subtitle_TimeCounterEnd()",""},						-- remove the on-screen timer
        },
	{
                HW2_Wait ( 0.5 ),
	},
        {
		{"Universe_Fade( 1, 1.5 )",""},							-- fade to black
        },
        {
                HW2_Wait ( 2.5 ),
        },
        {
		{ "Player_InstantDockAndParade( 0, 'PlayerMothership', 0 )", "", 0 },	
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		{"Camera_FocusSobGroup( 'PlayerMothership', 1, 4000, 0 )", "" },
        },
	{
		{ "Subtitle_Message( '$3652', 2 )", "" },							-- RESOURCES COLLECTED
		HW2_Wait( 2 ),
	},
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"Universe_Fade( 0, 1.5 )",""},								-- fade in
        },
        {
                HW2_Wait ( 1.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$43771", 3 ),		-- Initiating hyperspace.
        },
        {
--		{"SobGroup_EnterHyperSpaceOffMap('PlayerMothership')",""},		-- hyperspace the Mothership out
		{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')",""},				-- hyperspace everything out
        },
        {
                HW2_Wait ( 12 ),
        },
        {
		{"Universe_Fade( 1, 1.5 )",""},								-- fade to black
        },
        {
                HW2_Wait ( 1.5 ),
        },
	{
		{"SobGroup_SwitchOwner( 'Dreadnaught', 3 )",""},					-- Switch Dreadnaught to a different player so it doesn't get put in the persistent fleet file
                HW2_LocationCardEvent( "$43881", 2 ),							-- MISSION SUCCESSFUL
		{"Sound_ExitIntelEvent()",""},
		{"EventPlaying = 0",""},
	},
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"setMissionComplete(1)",""},
	},
}


-- MS destroyed
Events.intelevent_mothershipDestroyed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$43880", 10 ),								-- MISSION FAILED
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
		{"setMissionComplete(0)",""},
	},
}
