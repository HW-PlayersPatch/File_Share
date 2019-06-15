--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M05_Gehenna
--  Purpose:  Mission 5 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/playerspatch_util.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")


function OnInit()
	SPRestrict()
        -- set starting camera position
	Camera_UseCameraPoint("camera1")
	
--	Sound_EnterIntelEvent()					-- turn off regular gameplay speech to avoid hearing speech right at the beginning of mission
	Sound_EnableAllSpeech( 0 )
	
	Rule_Add ("Rule_PlayAmbientMusic")			-- plays ambient music right away

	-- set research level
        HW2_SetResearchLevel( 5 )      
	
        Rule_Add("Rule_Init")
end

function Rule_Init()

    -- create the groups we need from persistent fleet information
    -- GBX:pdeupree - Moved this to Rule_Init so the hyperspace sound effects will play.
    SobGroup_LoadPersistantData("Hgn_Mothership")
	
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

	Rule_Add("Rule_FrigateDockHack")
	
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType( Players_Mothership, "Player_Ships0", "Hgn_MotherShip" )        

	-- focus on the Player's MS
--	Camera_FocusSobGroup( Players_Mothership, 1, 4000, 0 )

--        DeployPlatforms()
        Sound_SpeechSubtitlePath("speech:missions/m_05/")
	
	-- OBJECTIVES
	
	obj_prim_retrieveOracle = "$42004"
	obj_prim_retrieveOracle_id = 0

	obj_sec_destroyGarrisons = "$42000"
	obj_sec_destroyGarrisons_id = 0
	
	obj_sec_destroyShipyard = "$42005"
	obj_sec_destroyShipyard_id = 0
	
	-- PINGS
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

	
        -- pointers
	pointer_oracle_id = 0
	pointer_dustVein1_id = 0
	pointer_dustVein2_id = 0
	pointer_dustVein3_id = 0
	pointer_enemyShipyard_id = 0
	pointer_garrison1_id = 0
	pointer_garrison2_id = 0
	pointer_garrison3_id = 0
	
	-- events
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
	
	-- GLOBAL VARIABLES
	g_pointer_default_1 = 0
	g_pointer_default_2 = 0
	g_pointer_default_3 = 0
	g_pointer_default_4 = 0
	
	g_now_time = Universe_GameTime()
	g_playerID = Universe_CurrentPlayer()
	g_save_id = 0											-- counter for savegames
	
	ShipToParadeRoundTypeName = "Hgn_MotherShip"
	
	-- temporary sobgroups used for query
	SobGroup_Create("VaygrShipsInProbeRange")
	SobGroup_Create("VaygrProbesInProbeRange")
	SobGroup_Create("PlayerShipsInProbeRange")
	SobGroup_Create("CarriersInProbeRange")
	SobGroup_Create("MothershipsInProbeRange")

	-- temporary sobgroups used at very end of mission
	SobGroup_Create("AllPlayerScouts")
	SobGroup_Create("AllPlayerInterceptors")
	SobGroup_Create("AllPlayerBombers")
	SobGroup_Create("AllPlayerEliteBombers")
	SobGroup_Create("AllPlayerAssCorvs")
	SobGroup_Create("AllPlayerPulseCorvs")
	SobGroup_Create("AllPlayerMinelayerCorvs")
	SobGroup_Create("AllPlayerEliteAssCorvs")
	SobGroup_Create("AllPlayerResCollectors")
	
	
	-- time stamp of when the proximity to gehenna was broken
	g_proximity_brokentime = 0
	-- whether player is still in proximity to gehenna
	g_proximity_brokenstate = 0
	PlayerLeftFieldEVENTONCE = 0
	PlayerLeftFieldEVENTPLAYED = 0
	PlayStagingMusicONCE = 0
	
	-- change this to modify how long the player has to get back into the cover of the asteroid field
	g_proximity_timeplayerhastoleaveproximity = 45
	g_timetoleaveproxofgehenna = g_proximity_timeplayerhastoleaveproximity
	
	-- change to 1 when you want to alert Gehenna and start the attack
	g_gehenna_alerted = 0
	
	RemovePlayerLeftDustField = 0			-- used for removing the rule that players the "Alert!" speech event (so we can play a different once on subsequent occasions)
	
	-- disable the CPU player (it will be enabled when the player goes outside the dust field, or gets to Gehenna)
	CPU_Enable( 1, 0 )

	
	g_attacktime_2 = 0
	g_attacktime_3 = 0
	g_attacktime_4 = 0
	g_attacktime_5 = 0
		
	
	-- garrison variables
	garrisons_destroyed = 0
	garrisonsObjectiveComplete = 0
	garrison1DestroyedONCE = 0
	garrison2DestroyedONCE = 0
	garrison3DestroyedONCE = 0
	garrison1DestroyedEventONCE = 0
	garrison2DestroyedEventONCE = 0
	garrison3DestroyedEventONCE = 0
	
	-- gehenna variables
	MarineFrigateDockedWithGehenna = 0
	SobGroup_Create( "ShipsDockedWithGehenna" )					-- create sob group for ships that will eventually dock with Gehenna
	SobGroup_SetAutoLaunch( "Gehenna", ShipHoldStayDockedAlways )		-- make Gehenna keep everything that docks with it

	
	-- probe variables
	ProbeNumber = 0
	CheckForMSONCE = 0
	CheckedProbeVol1 = 0
	CheckedProbeVol2 = 0
	CheckedProbeVol3 = 0
	CheckedProbeVol4 = 0
	CheckedProbeVol5 = 0
	CheckedProbeVol6 = 0
	
	
	-- remove all script-critical sob groups from the AI control
	for i = 1, 3 do
		CPU_RemoveSobGroup( 1, "Garrison_"..i )
		CPU_RemoveSobGroup( 1, "Patrol"..i )
	end
	for j = 1, 5 do
		CPU_RemoveSobGroup( 1, "Vgr_Wave"..j )
	end
	
	-- variables for vaygr AI routines
	VaygrShipList =         {
					{"Vgr_Bomber", 20, 11},
					{"Vgr_Interceptor", 21, 11},
					{"Vgr_LaserCorvette", 22, 11},
					{"Vgr_LanceFighter", 23, 11},
					{"Vgr_MissileCorvette", 24, 11},
					{"Vgr_HeavyMissileFrigate", 30, 10},
					{"Vgr_AssaultFrigate", 25, 10},
				}
	
	g_vaygrShipLastBuilt = ""
	g_maxVaygrShips = 300
	g_vaygrPrimaryBuilder = "Vgr_Shipyard_1"
	g_vaygrID = 1
	g_vaygrCurrentOrder = "VO_Nothing"



	-- turn off sensors for Gehenna so you don't see the Vaygr around it
	SobGroup_AbilityActivate( "Gehenna", AB_Sensors, 0 );
	
	-- set up alliances
        SetAlliance( 0, 2 )				-- Set alliance between player and Gehenna (so they can dock with it)
        SetAlliance( 2, 0 )
        SetAlliance( 1, 2 )				-- Set alliance between Vgr and Gehenna (so they don't attack it)
        SetAlliance( 2, 1 )

	
	-- Restrict Ion Cannon Frigate until later in the mission
--	Player_RestrictBuildOption(0, "Hgn_IonCannonFrigate")

	
	-- create all the subsystems needed for production on the Vgr Shipyard:

	SobGroup_CreateSubSystem( "Vgr_Shipyard_1", "Vgr_MS_Production_Fighter" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard_1", "Vgr_MS_Production_Corvette" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard_1", "Vgr_MS_Production_Frigate" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard_1", "Vgr_MS_Module_PlatformControl" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard_1", "Vgr_MS_Module_Research" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard_1", "Vgr_MS_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vgr_Shipyard_1", "Vgr_MS_Sensors_AdvancedArray" )

	
	-- create a Fighter subsystem on the Vgr Carrier:
--	SobGroup_CreateSubSystem( "Vgr_PrimaryCarrier", "FighterProduction" )

--	SobGroup_CreateSubSystem( "Vgr_PrimaryCarrier", "Hgn_C_Production_Fighter" )
	
	
	-- give Vgr Shipyard and Carrier a big health upgrade to make them more formidable targets
	Player_GrantResearchOption( 1, "SuperCapHealthUpgradeSPGAME" )

	-- give Vgr all chassis tech's so they can build whatever subsystems they want
	Player_GrantResearchOption( 1, "CorvetteTech" )
	Player_GrantResearchOption( 1, "FrigateTech" )
	Player_GrantResearchOption( 1, "LanceBeams" )
	Player_GrantResearchOption( 1, "PlasmaBombs" )
	Player_GrantResearchOption( 1, "CorvetteLaser" )
	Player_GrantResearchOption( 1, "PlatformHeavyMissiles" )
	Player_GrantResearchOption( 1, "FrigateAssault" )
	Player_GrantResearchOption( 1, "FrigateInfiltrationTech" )
	Player_GrantResearchOption( 1, "RepairAbility" )

	Player_GrantResearchOption( 1, "UtilityHealthUpgrade1" )
	Player_GrantResearchOption( 1, "PlatformHealthUpgrade1" )
	Player_GrantResearchOption( 1, "FrigateHealthUpgrade1" )	

	Player_GrantResearchOption( 1, "StrongerGunPlats" )
	Player_GrantResearchOption( 1, "StrongerMissilePlats" )
	
	-- Give the Vaygr Shipyard a speed downgrade so it can't move around

	SobGroup_AbilityActivate( "Vgr_Shipyard_1", AB_Move, 0)			-- disable move ability so shipyard stays put
	SobGroup_AbilityActivate( "Vgr_Shipyard_1", AB_Hyperspace, 0)		-- disable hyperspace ability so shipyard stays put

	-- set all the Garrisons to aggressive so they'll attack the player
	SobGroup_SetROE("Garrison_1", OffensiveROE)
		SobGroup_SetStance("Garrison_1", AggressiveStance)
	SobGroup_SetROE("Garrison_2", OffensiveROE)
		SobGroup_SetStance("Garrison_2", AggressiveStance)
	SobGroup_SetROE("Garrison_3", OffensiveROE)
		SobGroup_SetStance("Garrison_3", AggressiveStance)

	-- set all the turrets to aggressive tactics to they'll attack the player
	SobGroup_SetROE("AllTurrets", OffensiveROE)
		SobGroup_SetStance("AllTurrets", AggressiveStance)

	-- set all the turrets to deployed so the CPU player won't move 'em around
	SobGroup_SetAsDeployed( "AllTurrets" )
	
	-- set tactics for all Vaygr to aggressive so they'll go after the player
	Player_SetGlobalROE( 1, OffensiveROE )
	Player_SetGlobalStance( 1, AggressiveStance )
	
	
	-- we use this variable to keep track of whether g_vaygrShipLastBuilt has changed or not
	g_vaygrShipLastBuiltChanged = ""
	
        
        

	
--        Enable_ResearchOptions()
        
        Player_SetPlayerName( 0,"$42391" )
        Player_SetPlayerName( 1,"$42390" )
        Player_SetPlayerName( 2,"$42392")

        
        -- create a dummy group to keep track of vaygr in
        SobGroup_Create( "Dummy_Vaygr" )
--        Rule_Add( "Rule_TrackVaygr" )


	Rule_AddInterval ("Rule_PlayStagingMusic", 3)		-- checks for when to play staging music

        
	-------------------------------------------------------------------------------------------------
	-- Intel events
	-------------------------------------------------------------------------------------------------

        Rule_Add("Rule_IntelEvent_situationreport")          -- Intro event

	Timer_Start("Garrison_Timer", 90)				-- start timer for Garrison objective


	Rule_AddInterval ("Rule_IntelEvent_playerLeftDustField", 2)		-- Alert...

        Rule_AddInterval ( "Rule_IntelEvent_DestroyGarrisons", 1)

	Rule_AddInterval ("Rule_checkGarrisonsDestroyed", 1)

	Rule_AddInterval ("Rule_IntelEvent_GarrisonDestroyed", 1)
	
	Rule_AddInterval ("Rule_IntelEvent_PatrolDetected", 1)
	
	Rule_AddInterval ("Rule_IntelEvent_PatrolDestroyed", 1)
	
        Rule_AddInterval ( "Rule_PlayerCanBuildIonCannonFrigates", 3)
	Timer_Start("IonCannonTimer", 160)		-- start timer


	Rule_AddInterval ("Rule_checkForShipsDockedWithGehenna", 1)
	
	-- create temp SobGroup
	SobGroup_Create("tempSobGroup")
	
	-------------------------------------------------------------------------------------------------

        
        -- setup all of the rules that this mission needs post init
        Rule_AddInterval( "Rule_PlayerInProximityOfGehenna", 5 )
        Rule_AddInterval ( "Rule_GehennaAttackOn", 2 )
        
	
	-- Vaygr probe volley
	Timer_Start("Probe_Timer", 1560)				-- start timer for Vaygr to send probes out to find the player
	
	Rule_AddInterval ("Rule_VaygrSendProbes", 10)		-- send out probes to find the player

--        Rule_Add( "Rule_AddShipToAttackGroup" )

	Rule_Add ("Rule_PatrolSetup")
	
	
	-- check if the player's MS dies
        Rule_AddInterval ( "Rule_PlayerLose",1 )
        
        

--        Rule_AddInterval( "HW2_VaygrBuildShips", 30 )

	Rule_Add ("Rule_GetReactiveFleetRatio")				-- used for Scaling the AI

        
	Rule_AddInterval( "Rule_DisableBuilderInterval", 20 )
	
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
	if ( ReactiveFleetRatio > 1 ) and ( ReactiveFleetRatio < 1.3 ) then
		Player_SetRU(1, 3000)
	elseif ( ReactiveFleetRatio >= 1.3 ) and ( ReactiveFleetRatio < 1.6 ) then
		Player_SetRU(1, 6000)
	elseif ( ReactiveFleetRatio >= 1.6 ) then
		Player_SetRU(1, 9000)
	end

	Rule_Remove ("Rule_GetReactiveFleetRatio")
end



function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end


-- ANDREW enable research after opening intelevent
function Rule_EnableResearchOptionsAfterIntelevent()
	if ( Event_IsDone( "intelevent_situationreport" ) == 1 ) then
		Enable_ResearchOptions()
		Rule_Remove( "Rule_EnableResearchOptionsAfterIntelevent" )
	end
end



function Rule_FrigateDockHack()

	Player_AllowDockFromUIOverride( 0 , "Hgn_MarineFrigate");

end


-- ANDREW reenabled this
function Enable_ResearchOptions()
	-----BUILD DATA----- 

	-----RESEARCH DATA----- 
	Player_UnrestrictResearchOption( 0, "ScoutPingAbility" ) --ScoutPingAbility 
	Player_UnrestrictResearchOption( 0, "ImprovedTorpedo" ) --ImprovedTorpedo 
	Player_UnrestrictResearchOption( 0, "AssaultCorvetteHealthUpgrade1" ) --AssaultCorvetteHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "AssaultCorvetteMAXSPEEDUpgrade1" ) --AssaultCorvetteMAXSPEEDUpgrade1 
	Player_UnrestrictResearchOption( 0, "PulsarCorvetteHealthUpgrade1" ) --PulsarCorvetteHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "PulsarCorvetteMAXSPEEDUpgrade1" ) --PulsarCorvetteMAXSPEEDUpgrade1 
	Player_UnrestrictResearchOption( 0, "GunTurretHealthUpgrade1" ) --GunTurretHealthUpgrade2 
	Player_UnrestrictResearchOption( 0, "IonTurretHealthUpgrade1" ) --IonTurretHealthUpgrade2 	
	
end


-- this function makes all the weapon platforms deploy once.
function DeployPlatforms()
        for i=1, 12 do
                SobGroup_MoveToSobGroup( "platform_"..i, "platform_"..i )
        end
end


function Rule_TrackVaygr()      
        SobGroup_SobGroupAdd( "Dummy_Vaygr", "Player_Ships1" )
        SobGroup_RemoveType( "Dummy_Vaygr", "Gehenna" )
        SobGroup_RemoveType( "Dummy_Vaygr", "Vgr_WeaponPlatform_gun" )
end









-- ===== INTEL EVENTS ==========================================================================


-- here we play the opening intelevent
function Rule_IntelEvent_situationreport()
        if ( Universe_GameTime() >= g_now_time + 12 ) then               -- after 12 seconds
		Sound_EnableAllSpeech( 1 )
		Sound_EnterIntelEvent()
		EventPlaying = 1
		Event_Start("intelevent_situationreport")            -- Play intro event: Convoys under attack
		
		-- adding this to enable research options after intelevent
		Rule_Add( "Rule_EnableResearchOptionsAfterIntelevent" )

		Rule_Remove("Rule_IntelEvent_situationreport")
	end
end


-- tell the player they've left the dust field
function Rule_IntelEvent_playerLeftDustField()
	if ( RemovePlayerLeftDustField == 1) then						-- if this event has played once already, remove it forever (the REPEAT version will play from now on)
		Rule_Remove ("Rule_IntelEvent_playerLeftDustField")
	elseif (EventPlaying == 0) and (g_proximity_brokenstate == 1) and (PlayerLeftFieldEVENTONCE == 0) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		PlayerLeftFieldEVENTONCE = 1
                Event_Start( "autofocus_leftfield" )
	end
end

-- tell the player they've left the dust field
function Rule_IntelEvent_playerLeftDustFieldREPEAT()
        if (EventPlaying == 0) and (g_proximity_brokenstate == 1) and (PlayerLeftFieldEVENTONCE == 0) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		PlayerLeftFieldEVENTONCE = 1
                Event_Start( "autofocus_leftfieldREPEAT" )
	end
end




-- tell player to destroy Garrisons
function Rule_IntelEvent_DestroyGarrisons()
	if (EventPlaying == 0)  and ( Timer_GetRemaining("Garrison_Timer") < 1 ) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "intelevent_DestroyGarrisons" )
		Rule_Remove("Rule_IntelEvent_DestroyGarrisons")
	end
end



function Rule_checkGarrisonsDestroyed()
	-- check to see when garrisons are destroyed
	if ( g_gehenna_alerted == 0) and ( SobGroup_Empty ("Garrison_1") == 1) and ( garrison1DestroyedONCE == 0 ) then
		garrison1DestroyedONCE = 1
		garrisons_destroyed = garrisons_destroyed + 1
	end
	if ( g_gehenna_alerted == 0) and ( SobGroup_Empty ("Garrison_2") == 1) and ( garrison2DestroyedONCE == 0 ) then
		garrison2DestroyedONCE = 1
		garrisons_destroyed = garrisons_destroyed + 1
	end
	if ( g_gehenna_alerted == 0) and ( SobGroup_Empty ("Garrison_3") == 1) and ( garrison3DestroyedONCE == 0 ) then
		garrison3DestroyedONCE = 1
		garrisons_destroyed = garrisons_destroyed + 1
	end
	if ( g_gehenna_alerted == 1) or ( garrisons_destroyed == 3) then
		Rule_Remove ("Rule_checkGarrisonsDestroyed")
	end
end


-- when the player destroys a Garrison play an event about it
function Rule_IntelEvent_GarrisonDestroyed()

        if (EventPlaying == 0) and ( garrisons_destroyed == 1) and ( garrison1DestroyedEventONCE == 0 ) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		garrison1DestroyedEventONCE = 1
                Event_Start( "intelevent_garrison1destroyed" )
	end
        if (EventPlaying == 0) and ( garrisons_destroyed == 2) and ( garrison2DestroyedEventONCE == 0 ) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		garrison2DestroyedEventONCE = 1
                Event_Start( "intelevent_garrison2destroyed" )
	end
        if (EventPlaying == 0) and ( garrisons_destroyed == 3) and ( garrison3DestroyedEventONCE == 0 ) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		garrison3DestroyedEventONCE = 1
                Event_Start( "intelevent_garrison3destroyed" )
		Rule_Remove ("Rule_IntelEvent_GarrisonDestroyed")
	end

	
end


-- tell the player when they encounter a patrol
function Rule_IntelEvent_PatrolDetected()

	-- if the CPU has been alerted, the patrols have been handed over so remove the rule
	if ( g_gehenna_alerted == 1) then
		Rule_Remove ("Rule_IntelEvent_PatrolDetected")
	end

	-- increment variable when patrol is detected
	if (g_gehenna_alerted == 0) and ( Patrol1FoundONCE == 0) and ( PatrolDetected[1] == 1) then
		PatrolsFound = PatrolsFound + 1
		Patrol1FoundONCE = 1
	elseif (g_gehenna_alerted == 0) and ( Patrol2FoundONCE == 0) and ( PatrolDetected[2] == 1) then
		PatrolsFound = PatrolsFound + 1
		Patrol2FoundONCE = 1
	elseif (g_gehenna_alerted == 0) and ( Patrol3FoundONCE == 0) and ( PatrolDetected[3] == 1) then
		PatrolsFound = PatrolsFound + 1
		Patrol3FoundONCE = 1
	end
	
	
	-- play event when patrols are detected
	if (g_gehenna_alerted == 0) and ( EventPlaying == 0) and ( Patrol1EventONCE == 0) and ( PatrolsFound == 1 ) then
                Patrol1EventONCE = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "intelevent_FirstPatrolFound" )
	elseif (g_gehenna_alerted == 0) and ( EventPlaying == 0) and ( Patrol2EventONCE == 0) and ( PatrolsFound == 2 ) then
                Patrol2EventONCE = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "intelevent_SecondPatrolFound" )
	elseif (g_gehenna_alerted == 0) and ( EventPlaying == 0) and ( Patrol3EventONCE == 0) and ( PatrolsFound == 3 ) then
                Patrol3EventONCE = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "intelevent_ThirdPatrolFound" )
	end
	
	-- remove Rule when all events have played
	if ( PatrolsFound == 3) and ( Patrol3EventONCE == 1) then
		Rule_Remove ("Rule_IntelEvent_PatrolDetected")
	end
	
end



-- when the patrols are destroyed, play an event about it
function Rule_IntelEvent_PatrolDestroyed()

	-- if the CPU hasn't been alerted and there's no event playing and the patrol group has been destected, and the patrol group is dead
	if ( g_gehenna_alerted == 0) and ( EventPlaying == 0) and ( PatrolDetected[1] == 1) and ( SobGroup_Empty ("Patrol1") == 1) then
		PatrolDestroyedEventsPlayed = PatrolDestroyedEventsPlayed + 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "intelevent_FirstPatrolDestroyed" )
	elseif ( g_gehenna_alerted == 0) and ( EventPlaying == 0) and ( PatrolDetected[2] == 1) and ( SobGroup_Empty ("Patrol2") == 1) then
		PatrolDestroyedEventsPlayed = PatrolDestroyedEventsPlayed + 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "intelevent_SecondAndThirdPatrolDestroyed" )
	elseif ( g_gehenna_alerted == 0) and ( EventPlaying == 0) and ( PatrolDetected[3] == 1) and ( SobGroup_Empty ("Patrol3") == 1) then
		PatrolDestroyedEventsPlayed = PatrolDestroyedEventsPlayed + 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "intelevent_SecondAndThirdPatrolDestroyed" )
	end

	-- if the CPU has been alerted or all the Patrols have been destroyed, remove the rule
	if ( g_gehenna_alerted ==1) or (PatrolDestroyedEventsPlayed == 3) then
		Rule_Remove ("Rule_IntelEvent_PatrolDestroyed")
	end
		
end





-- tell the player they have been detected by the Vaygr
function Rule_IntelEvent_detectedByVaygr()
        if (EventPlaying == 0) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_detectedbyvaygr" )
		Rule_Remove("Rule_IntelEvent_detectedByVaygr")
	end
end


-- shipyard has been discovered: destroy it
function Rule_IntelEvent_ShipyardDiscovered()
        if (EventPlaying == 0) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_ShipyardDiscovered" )
		Rule_Add ("Rule_IntelEvent_ShipyardDestroyed")
		Rule_Remove("Rule_IntelEvent_ShipyardDiscovered")
	end
end


-- shipyard has been discovered: destroy it
function Rule_IntelEvent_ShipyardDestroyed()
        if (EventPlaying == 0) and ( SobGroup_Empty ("Vgr_Shipyard_1") == 1) then
                EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_ShipyardDestroyed" )
		Rule_Remove("Rule_IntelEvent_ShipyardDestroyed")
	end
end



-- BEGIN GAME: PLAYER CAN BUILD ION CANNON
function Rule_PlayerCanBuildIonCannonFrigates()
        if (EventPlaying == 0) and (Timer_GetRemaining ("IonCannonTimer") < 1) then
                EventPlaying = 1
		Sound_SetMuteActor("Fleet")										-- mute FC so she doesn't say regular AllShips line when Ion Frigs are unlocked
		Event_Start( "speechevent_ioncannonsavailable" )                
		Rule_Remove( "Rule_PlayerCanBuildIonCannonFrigates" )
	end
end
-- END GAME: PLAYER CAN BUILD ION CANNON



-------------------------------------------------------------------------------------------------
-- Retrieving the Oracle
-------------------------------------------------------------------------------------------------

function Rule_checkForShipsDockedWithGehenna()
	SobGroup_GetSobGroupDockedWithGroup( "Gehenna", "ShipsDockedWithGehenna" )	-- get all ships docked with Gehenna
	if ( SobGroup_Empty ("ShipsDockedWithGehenna") ~= 1) then					-- if there are any
		SobGroup_FillShipsByType( "tempSobGroup", "ShipsDockedWithGehenna", "Hgn_MarineFrigate" )		-- filter for Marine Frigates
		if  ( SobGroup_Empty ("tempSobGroup") ~= 1 ) then			-- if there are any Marine Frigs docked
			MarineFrigateDockedWithGehenna = 1								-- set the variable so the end event can play
			SobGroup_SetInvulnerability( "Player_Ships0", 1 )					-- set all player ships to invulnerable for the end of the mission
			Rule_Add ("Rule_IntelEvent_MissionEnd")
			Rule_Remove ("Rule_checkForShipsDockedWithGehenna")
		end
	end
end


function Rule_IntelEvent_MissionEnd()
        if (EventPlaying == 0) and (MarineFrigateDockedWithGehenna == 1) then
                EventPlaying = 1
		Event_Start( "intelevent_MissionEnd" )                
		Rule_Remove( "Rule_IntelEvent_MissionEnd" )
	end
end

-------------------------------------------------------------------------------------------------






-- ===== INTEL EVENTS ==========================================================================






-- BEGIN GAME: LEAVING AREA
-- this function gets all of the ships that are in the various nebulas, and returns true or false if there are
-- any player ships that are not in nebulas
function ShipsInNebula()
--        if  ( SobGroup_AreAnySquadronsOutsideNebula("Player_Ships0", "Nebula4_OLD, Nebula5_OLD, Nebula7_OLD, Nebula3_OLD, Nebula2_OLD, Nebula8_OLD") == 1) then
        if  ( SobGroup_AreAnySquadronsOutsideDustCloud("Player_Ships0", "Nebula4_OLD, Nebula4_OLD1, Nebula2_OLD1, Nebula2_OLD2, Nebula2_OLD3, Nebula2_OLD4, Nebula2_OLD5, Nebula2_OLD7, Nebula5_OLD, Nebula7_OLD, Nebula3_OLD, Nebula2_OLD, Nebula8_OLD") == 1) then
                return 1
        else
                return 0
        end
end


-- here we check for the player has entered the proximity of Gehenna
function Rule_PlayerInProximityOfGehenna()

	-- if the player comes within proximity of Gehenna and the Vgr shipyard, turn on the CPU player
	if ( Player_IsShipInVolume( 0 , "GehennaSphere" ) == 1) then
		if ( g_gehenna_alerted == 0) then
			g_gehenna_alerted = 1									-- set alerted variable so rest of script will do its stuff
			Rule_Add ("Rule_PlayerProximityToGehennaAlerted")
			Rule_Remove ("Rule_IntelEvent_playerLeftDustField")			-- remove rule that creates timer / etc. when player goes outside dust field
		end
		Rule_AddInterval ("Rule_IntelEvent_ShipyardDiscovered", 5)		-- play event: enemy shipyard disovered
                Rule_Remove( "Rule_PlayerInProximityOfGehenna" )
	end
		
	if ( g_gehenna_alerted == 0) then
		if ( ShipsInNebula() == 1 ) and ( g_proximity_brokenstate == 0 ) then	-- if there are ships outside the dust field, and the variable has not been set
	
			Rule_Add ("Rule_checkPlayerReturnedToField")			-- add a rule that checks to see if the player has returned back inside the dust field
			g_proximity_brokenstate = 1
			
		end
	end
end

-- checks if player has returned back inside the dust field
function Rule_checkPlayerReturnedToField()
	
	-- if player returns to dust field
	if ( g_proximity_brokenstate == 1 ) and 			-- if the player has gone outside the dust field
	   ( PlayerLeftFieldEVENTPLAYED == 1) and			-- and the event has played
	   ( ShipsInNebula() == 0 ) then				-- and there are no more ships outside the dust field
		Subtitle_TimeCounterEnd()				-- remove the subtitle
		print ("Trying to remove on-screen timer NOW!!!!!!!!!")
--		Timer_End(0)							-- end the timer
--		Timer_Pause(0)							-- pause the timer
		g_proximity_brokenstate = 0				-- re-set variable that indicates if player has gone outside the dust field
		PlayerLeftFieldEVENTONCE = 0				-- re-set one-time event variable so speech event / timer event will play again if the player leaves the dust field again
		PlayerLeftFieldEVENTPLAYED = 0				-- re-set one-time variable so logic will work right (I hope?)
		Rule_Remove ("Rule_checkPlayerReturnedToField")
	end

	-- if timer runs out and player is detected
	if ( PlayerLeftFieldEVENTPLAYED == 1) and			-- if the event has played
	   ( ShipsInNebula() == 1 ) and					-- and there are still ships outside the nebula
	   ( Timer_GetRemaining(0) < 0.1 ) then			-- and the timer has run out
		Subtitle_TimeCounterEnd()				-- remove the subtitle
--		Timer_End(0)							-- end the timer
--		Timer_Pause(0)							-- pause the timer
		g_gehenna_alerted = 1					-- set variable so the rest of the script knows Gehenna has been alerted
		Rule_Add ("Rule_PlayerProximityToGehennaAlerted")
		Rule_Remove ("Rule_IntelEvent_playerLeftDustField")			-- remove rule that creates timer / etc. when player goes outside dust field
		Rule_Remove ("Rule_checkPlayerReturnedToField")
	end

end


       
-- here the player has actually alerted Gehenna.
function Rule_PlayerProximityToGehennaAlerted()

                
		CPU_Enable( 1, 1 )										-- turn on the CPU player
		
		-- give Garrisons to CPU player
--		CPU_AddSobGroup( 1, "Garrison_1" )									-- hand the ships over to the AI
--		CPU_AddSobGroup( 1, "Garrison_2" )									-- hand the ships over to the AI
--		CPU_AddSobGroup( 1, "Garrison_3" )									-- hand the ships over to the AI


		-- tell the CPU to start defending the Gehenna dig site where the Oracle is
		DefendGehenna = CPU_AddDefendTarget( 1, "GehennaSphere", 300 )
		-- tell the CPU to put a priority on attacking capturers around this defend target
		CPU_SetDefendTargetCapturePriority( 1, DefendGehenna )
		-- increase radius default is 4000
		CPU_SetDefendTargetRadius( 1, DefendGehenna, 15000 )
		

		-- other cleanup
		if ( garrisonsObjectiveComplete == 0) then							-- if garrisons objective has not been met
			print ("setting Garrisons objective to off!!!!!")
			Objective_SetState( obj_sec_destroyGarrisons_id, OS_Off )				-- turn off garrison objective, 
			Rule_Remove ("Rule_IntelEvent_DestroyGarrisons")				-- remove the intel event if it hasn't played already
		end
		print ("Removing pings!!!!!")
		Ping_Remove( ping_garrison1_id )								-- remove the pings
		Ping_Remove( ping_garrison2_id )								-- remove the pings
		Ping_Remove( ping_garrison3_id )								-- remove the pings

		
		-- tell Garrisons to Move to Shipyard
--		SobGroup_MoveToSobGroup( "Garrison_1", "Vgr_Shipyard_1" )
--		SobGroup_MoveToSobGroup( "Garrison_2", "Vgr_Shipyard_1" )
--		SobGroup_MoveToSobGroup( "Garrison_3", "Vgr_Shipyard_1" )

		-- form the Garrisons into Strike Groups and have them attack the player
		for i = 1, 3 do
			SobGroup_FormStrikeGroup("Garrison_"..i, "wall")
			SobGroup_AttackPlayer( "Garrison_"..i, 0 )
			SobGroup_AttackPlayer( "Patrol"..i, 0 )
		end

--                Rule_Remove( "Rule_PlayerLeftProximityOfGehenna" )
                
                Rule_Remove( "Rule_PlayerProximityToGehennaAlerted" )           
        
--        end

end
-- END GAME: LEAVING AREA


-- BEGIN GAME: GARRISON ALERTED
-- we need to keep track of all of the ships that the Vaygr are building, and put them in the different groups
-- Vgr_Wave1
-- Vgr_Wave2
-- Vgr_Wave3
-- Vgr_Wave4
-- Vgr_Wave5
-- Dummy : this is a Dummy group that holds everything once weve filled up all the other groups.
VaygrFleetWaveSize =
{
        { "Vgr_Wave1", 30 },
        { "Vgr_Wave2", 40 },
        { "Vgr_Wave3", 50 },
        { "Vgr_Wave4", 60 },
        { "Vgr_Wave5", 70 },
}
SobGroup_Create( "Dummy" )

-- this function takes the table that contains all of the groups, and finds the one with the least number of units in it
-- it then compares that unit number to its limit
-- if group that isnt at its max, it adds it to that group
function Rule_AddShipToAttackGroup()
        if ( g_vaygrShipLastBuiltChanged ~= g_vaygrShipLastBuilt ) then
        
                local currentShipCount = 0
                local lowestShipCount = 100000000
                local waveToAddTo = 0
                
                -- we have a new ship built
                -- find the group with the fewest ships.
                for i=1, getn(VaygrFleetWaveSize) do
                        -- get the value of the current ship
                        currentShipCount = SobGroup_Count( VaygrFleetWaveSize[i][1] )
                        --print(currentShipCount)
                        --print(VaygrFleetWaveSize[i][2])
                        -- compare it to the value of the last ship
                        if (currentShipCount < lowestShipCount) and ( currentShipCount < VaygrFleetWaveSize[i][2] ) then
                                -- this is the group with the lowest number of ships
                                lowestShipCount = currentShipCount
                                -- this is now the group we want to add to
                                waveToAddTo = i
                        end
                end
                
                -- now we add this ship to that group
                if ( waveToAddTo ~= 0 ) then
                        SobGroup_SobGroupAdd( VaygrFleetWaveSize[waveToAddTo][1], g_vaygrShipLastBuilt )
                        --print( "adding to "..VaygrFleetWaveSize[waveToAddTo][1] )
                else
                        -- oops, all waves full, so add this to a dummy group
                        SobGroup_SobGroupAdd( "Dummy", g_vaygrShipLastBuilt )
                        --print( "adding to Dummy" )
                end
                
                -- now update the one we just built to the one we keep track of
                g_vaygrShipLastBuiltChanged = g_vaygrShipLastBuilt
        end
end

-- this is where we decide when to attack the player
function Rule_CreateAttackTimes()
	g_attacktime_2 = Universe_GameTime()
	g_attacktime_3 = Universe_GameTime() + 50
	g_attacktime_4 = Universe_GameTime() + 100
	g_attacktime_5 = Universe_GameTime() + 200
--	Rule_AddInterval( "HW2_VaygrBuildShips", 30 )
--	Rule_AddInterval ( "HW2_VaygrOrder", 31 )
	Rule_Remove ("Rule_CreateAttackTimes")
end

-- here is where we order all of the ships to attack the player progressively
function Rule_GehennaAttackOn()
        
        if ( g_gehenna_alerted == 1 ) then
        
                -- set the AI's to aggressive
                Player_SetGlobalROE( 1, OffensiveROE )
		Player_SetGlobalStance( 1, AggressiveStance )
        
                g_vaygrCurrentOrder = "VO_AttackPlayer"
                
                Rule_Add ("Rule_CreateAttackTimes")

		-- play event telling the player they've been detected
                Rule_AddInterval ("Rule_IntelEvent_detectedByVaygr", 2)
        
		-- tell Wave 1 to attack
                SobGroup_Attack( 1 , "Vgr_Wave1", "Player_Ships0" )
                
                -- dummy group stays at home and protects the shipyard
                SobGroup_GuardSobGroup( "Dummy", "Vgr_Shipyard_1" )    
                
                -- Objective_SetState( obj_sec_avoiddetect_id, OS_Failed )
                
                -- stop checking to see if player has left nebula cause we dont care anymore
--                Rule_Remove( "Rule_PlayerInProximityOfGehenna" )
                Rule_Remove( "Rule_CountdownTimeToLeaveProxOfGehenna" )
                Rule_Remove( "Rule_PlayerLeftProximityOfGehenna" )
--                Rule_Remove( "Rule_PlayerProximityToGehennaAlerted" )
                
              
                -- stop adding new units to waves just make them attack
--                Rule_Remove( "Rule_AddShipToAttackGroup" )
                -- we need to adjust how fast the vaygr are building
--                Rule_Remove( "HW2_VaygrBuildShips" )
                -- we need to change the default order when ships are built.
                
                Rule_Add( "Rule_AttackWave_2" )
                Rule_Add( "Rule_AttackWave_3" )
                Rule_Add( "Rule_AttackWave_4" )
                Rule_Add( "Rule_AttackWave_5" )
                
--                Rule_Add( "Rule_GehennaInTrouble" )

                -- turn off all of the old patrols and order the vgr to attack
                Rule_Remove( "Rule_GehennaAttackOn" )           
                
        end
        
end


-- these are the rules that order the vaygr back at Gehenna (the ones not using the hs gates) to attack
function Rule_AttackWave_2()
        if ( Universe_GameTime() >= g_attacktime_2 ) then       
                SobGroup_AttackPlayer( "Vgr_Wave2", g_playerID )
                Rule_Remove( "Rule_AttackWave_2" )
        end
end

function Rule_AttackWave_3()
        if ( Universe_GameTime() >= g_attacktime_3 ) then
                SobGroup_AttackPlayer( "Vgr_Wave3", g_playerID )
                Rule_Remove( "Rule_AttackWave_3" )
        end
end

function Rule_AttackWave_4()
        if ( Universe_GameTime() >= g_attacktime_4 ) then
                SobGroup_AttackPlayer( "Vgr_Wave4", g_playerID )
                Rule_Remove( "Rule_AttackWave_4" )
        end
end

function Rule_AttackWave_5()
        if ( Universe_GameTime() >= g_attacktime_5 ) then
                SobGroup_AttackPlayer( "Vgr_Wave5", g_playerID )
                Rule_Remove( "Rule_AttackWave_5" )
        end
end

-- this rule accounts for when the vaygr are down to minimal forces, what will they do?
function Rule_GehennaInTrouble()
        if (SobGroup_Count( "Player_Ships1" ) <= 20 ) then
                g_vaygrCurrentOrder = "VO_Retreat"
                SobGroup_GuardSobGroup( "Player_Ships1", "Gehenna" )
                Rule_Remove( "Rule_GehennaInTrouble" )
        end
end
-- END GAME: GARRISON ALERTED


-- BEGIN GAME: LOSE
function Rule_PlayerLose()      
        if ( SobGroup_Empty( Players_Mothership ) == 1 ) then           
                Event_Start( "speechevent_playerloses" )
                Rule_Remove( "Rule_PlayerLose" )                
        end     
end
-- END GAME: LOSE



-- ===== PATROL GROUPS ==========================================================================

-- do setup on Patrol groups
function Rule_PatrolSetup()
        for i = 1, 3 do
		-- form all patrols into strike groups
		SobGroup_FormStrikeGroup("Patrol"..i, "wall")
		-- tell patrols to follow their paths and loop
		SobGroup_FollowPath("Patrol"..i, "DustVeinPath"..i, 1, 1, 1)

		-- set tactics to aggressive so they attack anything that comes near
		SobGroup_SetROE("Patrol"..i, OffensiveROE)
		SobGroup_SetStance("Patrol"..i, AggressiveStance)
	end
--~ 	SobGroup_Create( "AttackingPatrol1" )
--~ 	SobGroup_Create( "AttackingPatrol2" )
--~ 	SobGroup_Create( "AttackingPatrol3" )

	Rule_Remove ("Rule_PatrolSetup")
--	Rule_Add ("Rule_PatrolWatchForEnemies")
--	Rule_Add ("Rule_PatrolAttackWatch")

end

EnemiesNearPatrol = {0, 0, 0}
PatrolDetected = {0, 0, 0}

-- watch for enemies
function Rule_PatrolWatchForEnemies()
        for i = 1, 3 do
		Player_FillProximitySobGroup( "tempSobGroup", 0, "Patrol"..i, 5000 )		-- check for player ships nearby
		if  ( SobGroup_Empty ( "tempSobGroup" ) == 0 )  and					-- and there are ships in the sob group
		   (EnemiesNearPatrol[i] == 0 ) then								-- and the variable hasn't been set
			EnemiesNearPatrol[i] = 1									-- set the variable
			PatrolDetected[i] = 1										-- set the variable used to play the speech event
			SobGroup_Attack( 1, "Patrol"..i, "tempSobGroup" )				-- attack the ships nearby
		end
	end
end

function Rule_PatrolAttackWatch()
	for i = 1, 3 do
		if ( EnemiesNearPatrol[i] == 1) and								-- if the variable has been set 
		   ( SobGroup_GetActualSpeed("Patrol"..i) < 1 ) then				-- and the patrol group has stopped
			SobGroup_FormStrikeGroup("Patrol"..i, "wall")
			SobGroup_FollowPath("Patrol"..i, "DustVeinPath"..i, 1, 1, 0)			-- tell patrol to go back to following the path
			EnemiesNearPatrol[i] = 0									-- re-set the variable so the PatrolWatch rule will start watching for attackers again
		end
	end
end

-- ===== PATROL GROUPS ==========================================================================









-- ===== MUSIC ==================================================================================

function Rule_PlayAmbientMusic()
	print ("Trying to play ambient music!")
	Sound_MusicPlayType( "data:sound/music/ambient/amb_05", MUS_Ambient )
	Rule_Remove ("Rule_PlayAmbientMusic")
end

-- when the Garrison event has played, or the CPU has been alerted, start playing the staging music
function Rule_PlayStagingMusic()
	if ( PlayStagingMusicONCE == 1) then
		print ("Trying to play staging music!")
		Sound_MusicPlayType( "data:sound/music/staging/staging_05", MUS_Staging )
		Rule_Remove ("Rule_PlayStagingMusic")
	end
end

function Rule_PlayBattleMusic()
	print ("Trying to play battle music!")
	Sound_MusicPlayType( "data:sound/music/battle/battle_04_alt", MUS_Battle )
	Rule_Remove ("Rule_PlayBattleMusic")
end

-- ===== MUSIC ==================================================================================





-- ===== VAYGR PROBES ==================================================================================

FreshlyBuiltProbe = {}

function Rule_VaygrSendProbes()
	if ( Timer_GetRemaining ("Probe_Timer") < 1) and ( ProbeNumber < 6 ) then
		print ( "Probe timer is up!  Starting to build probes!")
		if ( CheckForMSONCE == 0) then
			print ( "Starting check for Carriers and Motherships!")
			Rule_AddInterval ("Rule_VaygrCheckForMS", 2)					-- start checking for the player's MS
			Timer_Start ("ProbeSearchTimer", 200)						-- create timer to remove probe search rules if the player's Carrier / MS aren't found in time
			CheckForMSONCE = 1
		end
		ProbeNumber = ProbeNumber + 1
		FreshlyBuiltProbe[ProbeNumber] = SobGroup_CreateShip("Vgr_Shipyard_1", "Vgr_Probe")		-- spawn a probe
		Rule_AddInterval ("Rule_ProbeSetup", 7)							-- tell it to move to proper location
		Rule_AddInterval ("Rule_VaygrSendProbes", 10)						-- create the next probe in x seconds
		Rule_Remove ("Rule_VaygrSendProbes")
	elseif ( ProbeNumber == 6) then
		Rule_Remove ("Rule_VaygrSendProbes")
	end
end

function Rule_ProbeSetup()
	SobGroup_Move( 1, FreshlyBuiltProbe[ProbeNumber], "ProbeVol"..ProbeNumber )		-- move probe to pre-determined spot to check for player
	Rule_Remove ("Rule_ProbeSetup")
end

--ProbeHasStopped = {0, 0, 0, 0, 0, 0}

function Rule_VaygrCheckForMS()
	if ( g_gehenna_alerted == 1) or ( Timer_GetRemaining ("ProbeSearchTimer") < 1 ) then
		Rule_Remove ("Rule_VaygrCheckForMS")
	else
		for i = 1, ProbeNumber do
			-- check for player's Carriers or MS
			Player_FillSobGroupInVolume("VaygrShipsInProbeRange", 1, "ProbeVol"..i)			-- get all ships in the probe volume
			if(SobGroup_Empty("VaygrShipsInProbeRange") == 0) then
				print ("Checking for Vaygr probes in this vol: "..i)
				SobGroup_FillShipsByType("VaygrProbesInProbeRange", "VaygrShipsInProbeRange", "Vgr_Probe" ) -- filter for Probes
				if(SobGroup_Empty("VaygrProbesInProbeRange") == 0) then				
					print ("Checking if there are Carriers or MS's in this probe vol: "..i)
					Player_FillSobGroupInVolume("PlayerShipsInProbeRange",  0, "ProbeVol"..i)			-- get all ships in the probe volume
					if(SobGroup_Empty("PlayerShipsInProbeRange") == 0) then
						SobGroup_FillShipsByType("CarriersInProbeRange","PlayerShipsInProbeRange", "Hgn_Carrier" )	-- filter for Carriers
						SobGroup_FillShipsByType("MothershipsInProbeRange", "PlayerShipsInProbeRange", "Hgn_MotherShip" )	-- filter for Motherships
						if((SobGroup_Empty("CarriersInProbeRange") == 0) or SobGroup_Empty("MothershipsInProbeRange") == 0) then
							print ("Found the player's Carrier or MS!  Alerting Gehenna!")
							g_gehenna_alerted = 1
							CPU_Enable( 1, 1 )										-- turn on the CPU player
							Rule_Add ("Rule_PlayerProximityToGehennaAlerted")
							Rule_Remove ("Rule_IntelEvent_playerLeftDustField")			-- remove rule that creates timer / etc. when player goes outside dust field
							Rule_Remove ("Rule_VaygrCheckForMS")
						end
					end
				end
			end
		end
	end
end

-- ===== VAYGR PROBES ==================================================================================


function Rule_startFadeOut()
	Universe_Fade( 1, 2.5 )			-- fade to black
	Rule_Remove ("Rule_startFadeOut")
end

function Rule_dockAllStrikeCraft()
	-- get all player dockable ships
	Player_FillShipsByType("AllPlayerScouts", 0, "Hgn_Scout" )
	Player_FillShipsByType("AllPlayerInterceptors", 0, "Hgn_Interceptor" )
	Player_FillShipsByType("AllPlayerBombers", 0, "Hgn_AttackBomber" )
	Player_FillShipsByType("AllPlayerEliteBombers", 0, "Hgn_AttackBomberElite" )
	Player_FillShipsByType("AllPlayerAssCorvs", 0, "Hgn_AssaultCorvette" )
	Player_FillShipsByType("AllPlayerPulseCorvs", 0, "Hgn_PulsarCorvette" )
	Player_FillShipsByType("AllPlayerMinelayerCorvs", 0, "Hgn_MinelayerCorvette" )
	Player_FillShipsByType("AllPlayerEliteAssCorvs", 0, "Hgn_AssaultCorvetteElite" )
	Player_FillShipsByType("AllPlayerResCollectors", 0, "Hgn_ResourceCollector" )
	
	-- tell all player ships to dock with MS
	if ( SobGroup_Empty ("AllPlayerScouts") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerScouts", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerInterceptors") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerInterceptors", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerBombers") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerBombers", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerEliteBombers") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerEliteBombers", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerAssCorvs") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerAssCorvs", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerPulseCorvs") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerPulseCorvs", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerMinelayerCorvs") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerMinelayerCorvs", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerEliteAssCorvs") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerEliteAssCorvs", Players_Mothership)
	end
	if ( SobGroup_Empty ("AllPlayerResCollectors") == 0) then
		SobGroup_DockSobGroupInstant("AllPlayerResCollectors", Players_Mothership)
	end
	
	Rule_Remove ("Rule_dockAllStrikeCraft")

end

-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end



-- EVENTS
-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_situationreport =
{
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
	{
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6417' )",""}, -- ..' Mission Start'
	},
        {
                HW2_Wait ( 2 ),
	},
        {
                HW2_LocationCardEvent( "$42020", 6 ),						-- GEHENNA
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$42030", 4 ),			-- Short Jump coordinates in perfect alignment.
        },
        {
                HW2_Wait ( 1.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$42031", 5 ),			-- A minor disturbance in the Hyperspace core has been detected.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42032", 6 ),				-- We have arrived without alerting the Vaygr.
        },
        {
                HW2_Wait ( 1.5 ),
        },
        {
                HW2_Letterbox ( 1 ),
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
                { "Universe_EnableSkip(1)", "" },                                                       		-- Enable Intel event skipping
                {"Sensors_Toggle( 1 )","" },            
        },
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42033", 6 ),						-- The Oracle is located here.
                {"pointer_oracle_id = HW2_CreateEventPointerSobGroup('Gehenna')",""},      -- Add a pointer to the Oracle
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42040", 10 ),						-- The Vaygr are also searching for the Oracle, but without the information provided to us by the Bentusi they are unlikely to find it.
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42037", 8 ),						-- A Marine Frigate must dock with the dig site in order to retrieve the Oracle.
                {"obj_prim_retrieveOracle_id =  Objective_Add( obj_prim_retrieveOracle , OT_Primary )",""},
                { "Objective_AddDescription( obj_prim_retrieveOracle_id, '$42010')", "" },
                {"ping_gehenna_id = Ping_AddSobGroup( ping_gehenna, 'anomaly', 'Gehenna' )",""}, -- Add ping to Gehenna
                {"Ping_AddDescription(ping_gehenna_id, 0, '$42450')",""},
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42038", 6 ),						-- Prepare for resistance.  The dig site will be well guarded.
	},
        {
                HW2_Wait ( 1.0 ),
        },
	{
		{"EventPointer_Remove(pointer_oracle_id)",""},                    			-- remove pointer
                HW2_SubTitleEvent( Actor_FleetIntel, "$42039", 6 ),						-- *** WAITING ON PICKUP *** Dust fields will interfere with the Vaygr's sensors.
                {"pointer_dustVein1_id = HW2_CreateEventPointerVolume('DustVeinPointer1')",""},      -- Add a pointer to the dust vein
                {"pointer_dustVein2_id = HW2_CreateEventPointerVolume('DustVeinPointer2')",""},      -- Add a pointer to the dust vein
                {"pointer_dustVein3_id = HW2_CreateEventPointerVolume('DustVeinPointer3')",""},      -- Add a pointer to the dust vein
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42035", 7 ),                                                                     -- We must remain hidden inside the field to advance undetected.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"EventPointer_Remove(pointer_dustVein1_id)",""},                    			-- remove pointer
		{"EventPointer_Remove(pointer_dustVein2_id)",""},                    			-- remove pointer
		{"EventPointer_Remove(pointer_dustVein3_id)",""},                    			-- remove pointer
        },
        {
                HW2_Wait ( 0.5 ),
        },
	{
                {"Sensors_Toggle( 0 )","" },
		{"Camera_FocusRestore()",""},
                HW2_Pause ( 0 ),
                HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },                                                      -- Disable Intel event skipping
		{"Sound_ExitIntelEvent()",""},
        },
        {
                HW2_Wait ( 2 ),
        },
        {
		{"EventPlaying = 0",""},
        },
}






Events.intelevent_DestroyGarrisons =
{
        {
                HW2_Letterbox ( 1 ),
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
                { "Universe_EnableSkip(1)", "" },                                                       		-- Enable Intel event skipping
                {"Sensors_Toggle( 1 )","" },            
        },
        {
		{ "Camera_Interpolate( 'here', 'camera2', 1)",""},
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42044", 8 ),						-- Intelligence data indicates Vaygr garrisons are stationed at these locations.
                {"pointer_garrison1_id = HW2_CreateEventPointerSobGroup('Garrison_1')",""},      -- Add a pointer to the garrison
                {"pointer_garrison2_id = HW2_CreateEventPointerSobGroup('Garrison_2')",""},      -- Add a pointer to the garrison
                {"pointer_garrison3_id = HW2_CreateEventPointerSobGroup('Garrison_3')",""},      -- Add a pointer to the garrison
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42042", 8 ),						-- If these Garrisons are alerted to our presence, they will bring reinforcements.
                {"ping_garrison1_id = Ping_AddSobGroup( ping_garrison1, 'anomaly', 'Garrison_1' )",""},
                {"Ping_AddDescription(ping_garrison1_id, 0, '$42420')",""},
                {"ping_garrison2_id = Ping_AddSobGroup( ping_garrison2, 'anomaly', 'Garrison_2' )",""},
                {"Ping_AddDescription(ping_garrison2_id, 0, '$42420')",""},
                {"ping_garrison3_id = Ping_AddSobGroup( ping_garrison3, 'anomaly', 'Garrison_3' )",""},
                {"Ping_AddDescription(ping_garrison3_id, 0, '$42420')",""},
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42043", 5 ),						-- Destroy the Garrison fleets.
		{"GarrisonEventHasPlayed = 1",""},
                {"obj_sec_destroyGarrisons_id =  Objective_Add( obj_sec_destroyGarrisons , OT_Secondary )",""},
                { "Objective_AddDescription( obj_sec_destroyGarrisons_id, '$42012')", "" },
	},
	{
		{"EventPointer_Remove(pointer_garrison1_id)",""},                    			-- remove pointer
		{"EventPointer_Remove(pointer_garrison2_id)",""},                    			-- remove pointer
		{"EventPointer_Remove(pointer_garrison3_id)",""},                    			-- remove pointer
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                {"Sensors_Toggle( 0 )","" },
			{"Camera_FocusRestore()",""},
                HW2_Pause ( 0 ),
                HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },                                                      -- Disable Intel event skipping
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





Events.intelevent_garrison1destroyed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42076", 5 ),				-- Garrison eliminated.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_garrison2destroyed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42080", 4 ),				-- Enemy defeated.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42081", 4 ),				-- There are no survivors.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_garrison3destroyed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42086", 5 ),				-- All Garrisons neutralized.
                {"Objective_SetState( obj_sec_destroyGarrisons_id, OS_Complete )",""},
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
		{"Campaign_QuickSaveNb( g_save_id, '$6418' )",""}, -- ..' Vaygr Garrisons Destroyed'
	},
	{
                HW2_Wait ( 2 ),
		{"Sound_ExitIntelEvent()",""},
	},
        {
		{"EventPlaying = 0",""},
		{"garrisonsObjectiveComplete = 1",""},
	},
}



Events.intelevent_FirstPatrolFound =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42090", 5 ),				-- We have encountered a Vaygr patrol.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42091", 5 ),				-- It must be destroyed.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_SecondPatrolFound =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42110", 5 ),				-- Additional Vaygr patrol detected.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_ThirdPatrolFound =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42116", 5 ),				-- Vaygr patrol detected.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



Events.intelevent_FirstPatrolDestroyed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42100", 5 ),				-- Vaygr patrol destroyed.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42101", 5 ),				-- We remain undetected.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_SecondAndThirdPatrolDestroyed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42126", 5 ),				-- Vaygr patrol destroyed.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





Events.autofocus_leftfield =
{
        {
		{"PlayStagingMusicONCE = 1",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$42146", 4 ),			-- Alert!
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42149", 4 ),			-- Ships have left the dust field and are no longer under cover!
        },
        {
                HW2_Wait(0.5),    
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42148", 4 ),			-- They will soon be detected by the enemy unless they return immediately.
        },
        {
                HW2_Wait(0.5),    
        },
        {
		{ "Timer_Start( 0, 40 )",""},
		{ "Subtitle_TimeCounter( 0, 42025 )",""},
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"PlayerLeftFieldEVENTPLAYED = 1",""},
		{"RemovePlayerLeftDustField = 1",""},			
		{"Rule_AddInterval ('Rule_IntelEvent_playerLeftDustFieldREPEAT', 2)",""},
		{"EventPlaying = 0",""},
	},
}


Events.autofocus_leftfieldREPEAT =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$42149", 4 ),			-- Ships have left the dust field and are no longer under cover!
        },
        {
		{ "Timer_Start( 0, 40 )",""},
		{ "Subtitle_TimeCounter( 0, 42025 )",""},
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"PlayerLeftFieldEVENTPLAYED = 1",""},
		{"RemovePlayerLeftDustField = 1",""},			
		{"EventPlaying = 0",""},
	},
}



Events.intelevent_detectedbyvaygr =
{
	{
		{"Rule_Add ('Rule_PlayBattleMusic')",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$42150", 5 ),						-- We have been detected!
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42151", 7 ),						-- Multiple enemy units detected on intercept course.
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42152", 5 ),						-- Prepare for immediate attack.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





Events.intelevent_ShipyardDiscovered =
{
        {
                HW2_Letterbox ( 1 ),
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
                { "Universe_EnableSkip(1)", "" },                                                       		-- Enable Intel event skipping
                {"Sensors_Toggle( 1 )","" },            
        },
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42170", 7 ),						-- An enemy Shipyard has been identified close to the Oracle dig site.
                {"pointer_enemyShipyard_id = HW2_CreateEventPointerSobGroup('Vgr_Shipyard_1')",""},      -- Add a pointer to the Shipyard
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$42176", 8 ),						-- Destroy the Shipyard to prevent the enemy from building further reinforcements.
                {"obj_sec_destroyShipyard_id =  Objective_Add( obj_sec_destroyShipyard , OT_Secondary )",""},
                { "Objective_AddDescription( obj_sec_destroyShipyard_id, '$42011')", "" },
                {"ping_shipyard_id = Ping_AddSobGroup( ping_shipyard, 'anomaly', 'Vgr_Shipyard_1' )",""}, -- Add ping to Shipyard
                {"Ping_AddDescription(ping_shipyard_id, 0, '$42440')",""},
	},
	{
		{"EventPointer_Remove(pointer_enemyShipyard_id)",""},                    			-- remove pointer
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                {"Sensors_Toggle( 0 )","" },
                HW2_Pause ( 0 ),
                HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },                                                      -- Disable Intel event skipping
        },
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6419' )",""}, -- ..' Destroy Vaygr Shipyard'
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}




Events.intelevent_ShipyardDestroyed =
{
        {
		{"Rule_Add ('Rule_PlayStagingMusic')",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$42177", 5 ),				-- The Vaygr Shipyard has been destroyed.
                {"Objective_SetState( obj_sec_destroyShipyard_id, OS_Complete )",""},
		{"Ping_Remove (ping_gehenna_id)",""},
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
		{"Campaign_QuickSaveNb( g_save_id, '$6420' )",""}, -- ..' Vaygr Shipyard Destroyed'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



Events.speechevent_ioncannonsavailable =
{
        {
		{"Player_UnrestrictBuildOption( 0, 'Hgn_IonCannonFrigate' )",""}, --Hgn_IonCannonFrigate
		-- ANDREW added these new research options
		{ "Player_UnrestrictResearchOption( 0, 'IonCannonFrigateHealthUpgrade1' )","" }, --IonCannonFrigateHealthUpgrade1 
		{"Player_UnrestrictResearchOption( 0, 'IonCannonFrigateMAXSPEEDUpgrade1' )","" }, --IonCannonFrigateMAXSPEEDUpgrade1 	
                HW2_SubTitleEvent( Actor_FleetCommand, "$42130", 5 ),				-- Ion Cannon Frigates available for construction.
        },
        {
		{"Sound_SetMuteActor('')",""},
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}





-- end of mission event (after Marine Frigate docks with Gehenna)
Events.intelevent_MissionEnd =
{
        {
		HW2_Letterbox( 1 ),
        },
        {
		HW2_Wait ( 3 ),
        },
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
	{
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6421' )",""}, -- ..' Oracle Retrieval' 
	},
        {
		HW2_Wait ( 2 ),
        },
        {
		{"Camera_FocusSobGroup( 'Gehenna', 1, 2000, 1 )", "" },
		{"Ping_Remove (ping_gehenna_id)",""},
        },      
        {
		{"Sound_SetMuteActor('Fleet')",""},										-- mute FC so she doesn't say regular AllShips lines
                HW2_Wait ( 0.5 ),
        },
        {
		{"Universe_Fade( 1, 2.5 )",""},							-- fade to black
                HW2_SubTitleEvent( Actor_AllShips, "$42200",  3),                           -- Approaching entry point at One-Zero-Seven.
--		{"Rule_Add ('Rule_startFadeOut')",""},
        },      
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_AllShips, "$42201",  3),                           -- Standby for extraction Fleet.
        },      
        {
                HW2_Wait ( 1 ),
        },
        {
                HW2_SubTitleEvent( Actor_AllShips, "$42202",  3),                           -- The Oracle has been secured.
                {"Objective_SetState( obj_prim_retrieveOracle_id, OS_Complete )",""},
        },      
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_AllShips, "$42203",  3),                           -- Stand by receiving crews.
        },      
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"Rule_Add ('Rule_dockAllStrikeCraft')",""},
--		{ "Player_InstantDockAndParade( 0, Players_Mothership, 0 )", "" },	

		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		{"Camera_FocusSobGroup( Players_Mothership, 1, 4000, 0 )", "" },
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
                HW2_SubTitleEvent( Actor_FleetCommand, "$42204",  4),                           -- The Oracle is secure.
        },      
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$42205",  3),                           -- Integration complete.
        },      
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$42207",  6),                           -- Hyperspace Core anomaly detected! Jump procedures initiated! All units prepare to enter hyperspace!
        },      
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')",""},				-- hyperspace the Mothership out
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
                HW2_LocationCardEvent( "$42024", 2 ),							-- MISSION SUCCESSFUL
		{"Sound_ExitIntelEvent()",""},
		{"EventPlaying = 0",""},
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
		{ "setMissionComplete( 1 )","" },
        },
}






-- this is an event to say the player has lost
Events.speechevent_playerloses =
{
        {
                HW2_Pause( 1 ),
                HW2_Letterbox( 1 ),
                HW2_Fade( 1 ),
                HW2_Wait(2),            
        },
        {
                HW2_LocationCardEvent( "$42023", 4 ),
        },
        {
                { "setMissionComplete( 0 )","" },
        },
}