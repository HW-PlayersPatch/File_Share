--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M02_AngelMoon
--  Purpose:  Mission 02 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")


-- ===== INIT =====================================================================
function OnInit()
	SPRestrict()

	UI_ClearEventScreen()
        HW2_SetResearchLevel( 2 )
	
	Rule_Add( "Rule_Init" )
end


-- pre-load stuff here
function OnStartOrLoad()
	-- start playing explosion fx in the background (distant battle @ hiigara)
	FX_PlayEffectOnBackground( "m02_explosion_spray", {-1.5, -0.1, -1}, 10 )
end


-- had to recreate the RUle_Init because otherwise the timers were being called too early, ie, before the animatic had finished playing.
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

	Rule_Add ("Rule_DisableSpeech")
	
        -- set speech pathname
        Sound_SpeechSubtitlePath("speech:missions/m_02/")

	-- despawn Convoy escorts that will spawn later if the player doesn't have enough ships
	SobGroup_Despawn( "EscortInterceptors1" )
	SobGroup_Despawn( "EscortInterceptors2" )
	SobGroup_Despawn( "EscortBombers1" )
	SobGroup_Despawn( "EscortBombers2" )
	
	SobGroup_SetSwitchOwnerFlag ( "EscortInterceptors1", 0)
	SobGroup_SetSwitchOwnerFlag ( "EscortInterceptors2", 0)
	SobGroup_SetSwitchOwnerFlag ( "EscortBombers1", 0)
	SobGroup_SetSwitchOwnerFlag ( "EscortBombers2", 0)

	NISOver = 0
	InterceptorEscortsGiven = 0
	BomberEscortsGiven = 0

	Camera_UsePanning(0)						-- disable camera panning so player doesn't get themselves screwed up

        NISLoad( "nis/NIS02A" )                                         -- load the NIS
        g_currentNISPlaying_id = NISPlay( "nis/NIS02A" )        -- play the NIS
	
--~ 	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS02A")
	NISDisableInterface(1) -- this disables the interface when the NIS is done playing, it needs to be re-enabled by scar

	-- create temp sobgroups
	SobGroup_Create("tempSobGroup")
	SobGroup_Create("BombersNearEnemyCarrier")
	SobGroup_Create("MelarnFleetAll")
	
	Rule_AddInterval ("Rule_watchForNISDoneFromTimer", 41)
        Rule_Add ("Rule_watchForNISDone")
	
	Rule_Remove( "Rule_Init" )
end

function Rule_DisableSpeech()
--	Sound_EnterIntelEvent()					-- turn off regular gameplay speech to avoid hearing speech right at the beginning of mission
	Sound_EnableAllSpeech( 0 )
	Rule_Remove ("Rule_DisableSpeech")
end


-- watch for the NIS to be far enough along that you can load the persistent fleet et al
function Rule_watchForNISDoneFromTimer()
        if ( NISOver == 0 ) then
		NISOver = 1
--		Camera_SetLetterboxStateNoUI(0, 0 )					-- turn UI back on
		SobGroup_LoadPersistantData("Hgn_Mothership")
		UI_ClearEventScreen()
		Rule_AddInterval ("Rule_spawnEscorts", 1)
                Rule_AddInterval ("Rule_Init2", 10)
                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
        elseif ( NISOver == 1) then
                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
	end
end



-- watch for the NIS to be complete so you can start the level
function Rule_watchForNISDone()
        if ( NISOver == 0 ) and ( NISComplete( g_currentNISPlaying_id ) == 1 )  then
		NISOver = 1
--		Camera_SetLetterboxStateNoUI(0, 0 )					-- turn UI back on
		SobGroup_LoadPersistantData("Hgn_Mothership")
		UI_ClearEventScreen()
		Rule_AddInterval ("Rule_spawnEscorts", 1)
                Rule_AddInterval ("Rule_Init2", 10)
                Rule_Remove( "Rule_watchForNISDone" )
        elseif ( NISOver == 1) then
                Rule_Remove( "Rule_watchForNISDone" )
	end
end

-- ANDREW: this is a function that i use to just seperate this research out of the Event Table, so the research is easier to modify.
function Enable_ResearchOptions()
	Player_UnrestrictResearchOption( 0, "AssaultCorvetteHealthUpgrade1" )
	Player_UnrestrictResearchOption( 0, "AssaultCorvetteMAXSPEEDUpgrade1" )
	Player_UnrestrictResearchOption( 0, "PulsarCorvetteHealthUpgrade1" )
	Player_UnrestrictResearchOption( 0, "PulsarCorvetteMAXSPEEDUpgrade1" )
	Player_UnrestrictResearchOption( 0, "MothershipHealthUpgrade1" )
	Player_UnrestrictResearchOption( 0, "MothershipMAXSPEEDUpgrade1" )
	Player_UnrestrictResearchOption( 0, "InterceptorMAXSPEEDUpgrade1" )
	Player_UnrestrictResearchOption( 0, "AttackBomberMAXSPEEDUpgrade1" )
	Player_UnrestrictResearchOption( 0, "ResourceCollectorHealthUpgrade1" )
end

function Rule_Init2()

	print ("starting Init2 !!!!! !!!!!!!! !!!!!!!! !!!!!!!! !!!!!!!")

--	Rule_AddInterval ("Rule_TurnSpeechBackOn", 3)
	
	-- disable the CPU player
	CPU_Enable( 0, 0 )
	CPU_Enable( 1, 0 )
--	CPU_Enable( 2, 0 )
	CPU_Enable( 3, 0 )
	CPU_Enable( 4, 0 )
	CPU_Enable( 5, 0 )

        -- set player names
        Player_SetPlayerName(0, "$40005")
        Player_SetPlayerName(1, "$40006")

        -- set starting camera position
--        Camera_UseCameraPoint("camera1")


        FighterFacilityCount = 0

        -- objectives
        obj_prim_saveconvoys = "$40000"				-- Save at least four crew transports
        obj_prim_saveconvoys_id = 0

        obj_sec_destroyFighterFacility = "$40001"			-- SECONDARY: Destroy Vaygr Fighter Facility
        obj_sec_destroyFighterFacility_id = 0

        obj_prim_destroycarrier = "$40002"				-- Destroy Vaygr Carrier before it escapes
        obj_prim_destroycarrier_id = 0

        obj_sec_buildCorvetteFacility = "$40003"			-- SECONDARY: Build a Corvette Facility
        obj_sec_buildCorvetteFacility_id = 0

        obj_prim_saveMelarn = "$40004"				-- Do not allow Captain Soban's ship to be destroyed
        obj_prim_saveMelarn_id = 0

        obj_sec_buildCollectors = "$40010"				-- SECONDARY: Build Resource Collectors
        obj_sec_buildCollectors_id = 0


        -- pings
        ping_enemyCarrier = "$40390"                                    -- Vaygr Carrier
        ping_enemyCarrier_id = 0

        ping_carrierExitPoint = "$40400"                                        -- Carrier exit point
        ping_carrierExitPoint_id = 0

        ping_Convoy_1 = "$40391"                                        -- Transport Bishop One
        ping_Convoy_1_id = 0

        ping_Convoy_2 = "$40392"                                        -- Transport Bishop Two
        ping_Convoy_2_id = 0

        ping_Convoy_3 = "$40393"                                        -- Transport Bishop Three
        ping_Convoy_3_id = 0

        ping_Convoy_4 = "$40394"                                        -- Transport Bishop Four
        ping_Convoy_4_id = 0

        ping_Convoy_5 = "$40395"                                        -- Transport Bishop Five
        ping_Convoy_5_id = 0

        ping_Convoy_6 = "$40396"                                        -- Transport Bishop Six
        ping_Convoy_6_id = 0

        ping_melarnSoban = "$40397"					-- Captain Soban
        ping_melarnSoban_id = 0

        ping_frigateAttackers = "$40398"				-- Vaygr Frigates
        ping_frigateAttackers_id = 0


        -- pointers
        pointer_enemyCarrier_id = 0

        pointer_convoy1_id = 0
        pointer_convoy2_id = 0
        pointer_convoy3_id = 0
        pointer_convoy4_id = 0
        pointer_convoy5_id = 0
        pointer_convoy6_id = 0

        pointer_fighterFacility_id = 0


        -- convoy variables
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
			
        -- attacker vars
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


        -- frigate attacker vars
        callInTheFrigates = 0

        frigatesAttackingConvoy6 = 0
        frigatesAttackingConvoy5 = 0
        frigatesAttackingConvoy4 = 0
        frigatesAttackingMS = 0
        frigatesAttackingMelarnFleet = 0

        -- melarn vars
        melarnArrived = 0
        melarnSaved = 0
        melarnDamaged = 0
	tellMelarnToHyperspaceOut = 0
	MelarnAttacking = 0
	
        -- resource variables
        PlayerStartingRUs = Player_GetRU( 0 )

        -- global vars
        g_now_time = Universe_GameTime()
        g_playerID = Universe_CurrentPlayer()
        g_save_id = 0



	-- sob group setup

	SobGroup_Create( "PlayerMothership" )
    	SobGroup_Create( "PlayerCollectors" )
	SobGroup_Create( "BombersAttackingMelarn" )
	
	Player_FillShipsByType( "PlayerMothership", 0, "Hgn_Mothership" )         -- Put the player's Mothership into a sob group
	SobGroup_SetSpeed("PlayerMothership", 0.2)                                                -- Set the speed really low (until they rescue the convoy ship that gives them full engine power)
	--SobGroup_SetSpeed("Convoy_1", 1.0)
		
      SobGroup_CreateSubSystem( "EnemyCarrier", "FighterProduction" )     -- Add a Fighter production facility to the Vaygr Carrier

	--SobGroup_SetSpeed("Convoy_1", 1.0)
	--SobGroup_SetSpeed("Convoy_1", 1.0)

	SobGroup_Create ("AttackingMelarn")
	
	SobGroup_TakeDamage( "Convoy_3", 0.25 )
	SobGroup_TakeDamage( "Convoy_4", 0.05 )
	SobGroup_TakeDamage( "Convoy_5", 0.07 )
	SobGroup_TakeDamage( "Convoy_6", 0.25 )
	SobGroup_FillBattleScar( "Convoy_3", "Bullet/Bullet" )
	SobGroup_FillBattleScar( "Convoy_4", "Plasma_Bomb/Plasma_Bomb" )
	SobGroup_FillBattleScar( "Convoy_5", "Plasma_Bomb/Plasma_Bomb" )
	SobGroup_FillBattleScar( "Convoy_6", "Plasma_Bomb/Plasma_Bomb" )
	
	
	-- check for status of reactive fleet squads
	Convoy3Interceptors2Alive = 0
	Convoy3Interceptors3Alive = 0
	
	Convoy4Interceptors2Alive = 0
	Convoy4Interceptors3Alive = 0
	
	Convoy5Interceptors2Alive = 0
	Convoy5Interceptors3Alive = 0
	
	Convoy6Interceptors2Alive = 0
	Convoy6Interceptors3Alive = 0

	-- convoy 3 reactive reinforcements
	if ( SobGroup_Empty ("Convoy3Interceptors2") ~= 1 ) then
		print ("Convoy3Interceptors2 are alive!!!!!")
		Convoy3Interceptors2Alive = 1
		SobGroup_DockSobGroupInstant("Convoy3Interceptors2", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end

	if ( SobGroup_Empty ("Convoy3Interceptors3") ~= 1 ) then
		print ("Convoy3Interceptors3 are alive!!!!!")
		Convoy3Interceptors3Alive = 1
		SobGroup_DockSobGroupInstant("Convoy3Interceptors3", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end

	-- convoy 4 reactive reinforcements
	if ( SobGroup_Empty ("Convoy4Interceptors2") ~= 1 ) then
		print ("Convoy4Interceptors2 are alive!!!!!")
		Convoy4Interceptors2Alive = 1
		SobGroup_DockSobGroupInstant("Convoy4Interceptors2", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end

	if ( SobGroup_Empty ("Convoy4Interceptors3") ~= 1 ) then
		print ("Convoy4Interceptors3 are alive!!!!!")
		Convoy4Interceptors3Alive = 1
		SobGroup_DockSobGroupInstant("Convoy4Interceptors3", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end

	-- convoy 5 reactive reinforcements
	if ( SobGroup_Empty ("Convoy5Interceptors2") ~= 1 ) then
		print ("Convoy5Interceptors2 are alive!!!!!")
		Convoy5Interceptors2Alive = 1
		SobGroup_DockSobGroupInstant("Convoy5Interceptors2", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end

	if ( SobGroup_Empty ("Convoy5Interceptors3") ~= 1 ) then
		print ("Convoy5Interceptors3 are alive!!!!!")
		Convoy5Interceptors3Alive = 1
		SobGroup_DockSobGroupInstant("Convoy5Interceptors3", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end

	-- convoy 6 reactive reinforcements
	if ( SobGroup_Empty ("Convoy6Interceptors2") ~= 1 ) then
		print ("Convoy6Interceptors2 are alive!!!!!")
		Convoy6Interceptors2Alive = 1
		SobGroup_DockSobGroupInstant("Convoy6Interceptors2", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end

	if ( SobGroup_Empty ("Convoy6Interceptors3") ~= 1 ) then
		print ("Convoy6Interceptors3 are alive!!!!!")
		Convoy6Interceptors3Alive = 1
		SobGroup_DockSobGroupInstant("Convoy6Interceptors3", "EnemyCarrier")		-- put reactive reinforcements inside Carrier
	end
	


	
	-- Vaygr Carrier upgrades
--	Player_GrantResearchOption( 1, "SuperCapHealthUpgradeSPGAME" )		-- Give the Vaygr Carrier a health upgrade to make it more challenging to kill

-- GBX_Cole// Old Carrier Health: 192500, Fighter: 98000, Engine: 70000
-- New math: h110000, f56000, e50000// Fighter production Regen: 98000: 350, 56000: 200
-- Diff: h82500, f42000, e20000
-- Mults: 

	Player_GrantResearchOption( 1, "SuperCapDamageAppliedSPGAME" )		-- GBX_Cole// Subsystems inherit MAXHEALTH but regen doesn't change. Using new mult here to make stronger ships
	Player_GrantResearchOption( 1, "VaygrCarrierHealthRegenDowngrade" )	-- Give the Vaygr Carrier a health regen downgrade so the player can kill it easier


        -- research & construction restrictions
	    Player_RestrictBuildOption(0, "CorvetteProduction")

	-- Give Vagygr hyperspace upgrades so the Frigates won't suffer any recovery time when they HS in
	Player_GrantResearchOption( 1, "HyperspaceRecoveryTimeUpgradeSPGAME" )
	
	-- Give Vaygr Frigates some health upgrades so they last a bit longer
	Player_GrantResearchOption( 1, "FrigateHealthUpgrade1" )

	-- Give Sobani Frigates some health upgrades so they last longer
	Player_GrantResearchOption( 3, "FrigateHealthUpgradeSPGAME" )
	
	
	-- Give the player an upgrade to the Elite Assault Corvette & Elite Bomber's weapons (to make them "Elite", so we don't need separate .wepn files)
	Player_GrantResearchOption( 0, "AssaultCorvetteEliteWeaponUpgrade" )
	Player_GrantResearchOption( 0, "AttackBomberEliteWeaponUpgrade" )

        Player_RestrictResearchOption( 0, "SensorsBackToNormal1" )
        Player_RestrictResearchOption( 0, "SensorsBackToNormal2" )
        Player_RestrictResearchOption( 0, "SensorsBackToNormal3" )
	



        -- unit caps setup
--        Player_OverrideUnitCaps(0, 15 )                                                 -- set unit caps


        -- focus on the Player's Mothership because we can't set a starting camera position
--      Camera_FocusSobGroup( "PlayerMothership", 1, 0, 1.5 )


        g_now_time = Universe_GameTime()


--      Player_SetGlobalROE( 1, OffensiveROE )
	
        -- Set up the convoy orders (dock with the MS)
        Rule_AddInterval("Rule_convoySetup", 5)

        -- Watch the convoy ships to see when they dock with the MS
        Rule_AddInterval("Rule_convoyDockWatch", 3)

	-- Watch to see when reward speech events are over and launch the convoys
        Rule_AddInterval("Rule_convoyLaunchWatch", 2)
	
        -- Watch the convoy ships to see when to trigger the rewards
        Rule_AddInterval("Rule_convoyRewardWatch", 1)

	-- Watch for end of mission where convoys should return to base
--	Rule_Add ("Rule_convoysReturnHome")
	
        -- Do all required set-up for the combat behaviour (setting up guard orders, etc.)
        Rule_Add("Rule_combatSetup")

        -- Have the Vaygr Carrier move with the convoy ships (by guarding them)
        Rule_AddInterval("Rule_carrierGuardWatch", 6)

	-- Check for Carrier under attack and launch Interceptor squads to defend it
--	Rule_Add ("Rule_launchFirstCarrierGuard")
--	Rule_Add ("Rule_checkCarrierHealth")

        -- Set up Interceptor / Bomber guard behaviour
        Rule_Add("Rule_InitializeInterceptorTargets")

        -- Start combat!
        Rule_Add("Rule_startAttackOnConvoy1")

        -- Watch for when to bring in the Vgr Frigates that attack the Convoy
        Rule_AddInterval("Rule_callInTheFrigates", 4)

	-- Check to see if the Mothership dies
        Rule_AddInterval ( "Rule_PlayerLoses",2 )


        -- special effects (explosions around Hiigara)
--	Rule_Add ("Rule_playEffects1")
--	Rule_Add ("Rule_playEffects2")
--	Rule_Add ("Rule_playEffectsSurface")
--	Rule_Add ("Rule_playEffectsBig")
--	Rule_Add ("Rule_playEffectsSmall")
--      Rule_Add ("Rule_playEffectsSmallLow")

        s_nextFxTime = 0
        r_nextFxTime = 0
        t_nextFxTime = 0
        q_nextFxTime = 0
        w_nextFxTime = 0
        v_nextFxTime = 0
        x_nextFxTime = 0

	
        -- Intel events
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

-------------------------------------------------------------------------------------------------
-- Intel events
-------------------------------------------------------------------------------------------------

        Rule_Add("Rule_IntelEvent_convoysUnderAttack")          -- Intro event

--	Rule_Add ("Rule_IntelEvent_RecommendCollectors")		-- Recommend construction of additional Resource Collectors...
	
        Rule_AddInterval ("Rule_IntelEvent_mothershipMoved", 4)             -- Engine crews running at minimal capacity. / Engine performance at twenty percent.

--        Rule_Add ("Rule_intelevent_corvetteSubsystemComplete")  -- Corvette Subsystem complete.  etc..

--        Rule_Add ("Rule_intelevent_recommendCorvettes")                 -- Recommend using Corvettes to defeat the Vaygr bombers attacking our transports.

        Rule_AddInterval ("Rule_convoyLostWatch", 3)                                        -- Convoy dies = convoy lost event

        Rule_AddInterval ("Rule_convoyDeathWatch", 4)                                       -- watch for 3 convoys lost

        Rule_AddInterval ("Rule_IntelEvent_3convoys_Lost", 3)                       -- 3 convoys lost = mission fail event

	Rule_AddInterval ("Rule_intelevent_convoysDamaged", 3.5)			-- Transport Bishop <x> sustaining critical damage...
	
        Rule_AddInterval ("Rule_convoySavedWatch", 3)                                        -- Convoy attackers killed = convoy saved event

        Rule_AddInterval ("Rule_reinforcementWatch", 3)                             -- First reinforcements = 'enemy reinforcement' event

--        Rule_Add("Rule_intelevent_frigateAttack")                   -- Hyperspace entry detected. / The Vaygr are using Frigates to attack the transports. / It’s doubtful we have enough firepower to defeat all of them.

--        Rule_Add("Rule_intelevent_melarnDamaged")                       -- Captain Soban’s ship is sustaining heavy damage.  We cannot afford to lose him.

--        Rule_Add("Rule_intelevent_melarnDestroyed")             -- Captain Soban is lost.

--        Rule_Add("Rule_intelevent_carrierEscaped")                   -- The Vaygr Carrier has escaped.  MISSION FAILED.

        Rule_AddInterval ("Rule_intelevent_carrierDestroyed", 2.5)            -- The Carrier has been destroyed.  ... etc.

--	Rule_Add ("Rule_intelevent_sobanLeaving")

        Rule_Add("Rule_intelevent_fighterFacilityDestroyed")            -- Vaygr Fighter Facility Destroyed.

--        Rule_Add("Rule_intelevent_sobanToHiigaranFleet")                -- Fleet, this is Captain Soban...
		
--        Rule_Add("Rule_intelevent_standbyForHyperspace")                -- All ships, standby for hyperspace.


-------------------------------------------------------------------------------------------------


--	Rule_Add ("Rule_testReactiveFleets")

	HW2_ReactiveInfo()

        Rule_Remove( "Rule_Init2" )

end


-- ===== INIT ===================================================================================


function Rule_testReactiveFleets()
	if ( SobGroup_Empty ("ReactiveTest") ~= 1) then
		print ("Reactive sob group is working!!!!")
	end
end


-- turn speech back on 2 seconds after the mission starts
function Rule_TurnSpeechBackOn()
	Sound_ExitIntelEvent()
	Rule_Remove ("Rule_TurnSpeechBackOn")
end






-- ===== INTEL EVENTS ==========================================================================

-- Convoys are under attack: Intro event
function Rule_IntelEvent_convoysUnderAttack()
		EventPlaying = 1
		FOW_RevealGroup("EnemyCarrier", 1)				-- reveal FOW for Vaygr carrier as well (needed for intro event)
		
		Sound_EnterIntelEvent()
		Event_Start("intelevent_convoysUnderAttack")            -- Play intro event: Convoys under attack

		Rule_Remove("Rule_IntelEvent_convoysUnderAttack")
--        end
end


-- if the player doesn't have many Interceptors, give them some "escorts" from the transports
function Rule_spawnEscorts()

	-- Interceptors
	NumPlayerInterceptors = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping( 0, "Hgn_Interceptor" )
	if ( NumPlayerInterceptors < 30 ) then -- Previously checked for squadrons, I'm overwriting this to just give Ints without being so strict on population
		SobGroup_Spawn( "EscortInterceptors1", "EscortSpawnSphere" )	-- spawn ships to help player out
		SobGroup_Spawn( "EscortInterceptors2", "EscortSpawnSphere" )	-- spawn ships to help player out
		SobGroup_SwitchOwner( "EscortInterceptors1", 0 )				-- hand it over to the player
		SobGroup_SwitchOwner( "EscortInterceptors2", 0 )				-- hand it over to the player
		InterceptorEscortsGiven = 2
	elseif ( NumPlayerInterceptors < 3) then
		SobGroup_Spawn( "EscortInterceptors1", "EscortSpawnSphere" )	-- spawn ships to help player out
		SobGroup_SwitchOwner( "EscortInterceptors1", 0 )				-- hand it over to the player
		InterceptorEscortsGiven = 1
	elseif ( NumPlayerInterceptors == 0) then
		SobGroup_Spawn( "EscortInterceptors1", "EscortSpawnSphere" )		-- spawn ships to help player out
		SobGroup_Spawn( "EscortInterceptors2", "EscortSpawnSphere" )		-- spawn ships to help player out
		SobGroup_SwitchOwner( "EscortInterceptors1", 0 )					-- hand it over to the player
		SobGroup_SwitchOwner( "EscortInterceptors2", 0 )					-- hand it over to the player
		InterceptorEscortsGiven = 2
	end
	
	-- Bombers
	NumPlayerBombers = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping( 0, "Hgn_AttackBomber" )
	if ( NumPlayerBombers < 30 ) then -- Previously checked for squadrons, I'm overwriting this to just give Ints without being so strict on population
		SobGroup_Spawn( "EscortBombers1", "EscortSpawnSphere" )	-- spawn ships to help player out
		SobGroup_SwitchOwner( "EscortBombers1", 0 )				-- hand it over to the player
		BomberEscortsGiven = 1
													-- if the player has NO Bombers
	elseif ( NumPlayerBombers == 0 ) then
		SobGroup_Spawn( "EscortBombers1", "EscortSpawnSphere" )		-- spawn ships to help player out
		SobGroup_Spawn( "EscortBombers2", "EscortSpawnSphere" )		-- spawn ships to help player out
		SobGroup_SwitchOwner( "EscortBombers1", 0 )					-- hand it over to the player
		SobGroup_SwitchOwner( "EscortBombers2", 0 )					-- hand it over to the player
		BomberEscortsGiven = 2
	end
	
	-- trigger setup on newly-created ships
	if ( InterceptorEscortsGiven > 0) or ( BomberEscortsGiven > 0) then
		Rule_AddInterval ("EscortSetup", 1)								-- do setup on newly-created ships
		Rule_Remove ("Rule_spawnEscorts")
	end

end


function EscortSetup()

	-- Interceptors
	if ( InterceptorEscortsGiven == 2) then
		print ("Doing Escort setup on 2 Interceptor squadrons!!")
		
		SobGroup_SetTeamColours( "EscortInterceptors1", {0.365, 0.553, 0.667}, {0.8,0.8,0.8}, "DATA:Badges/Hiigaran.tga" )		-- set Hiigaran teamcolours
		SobGroup_ParadeSobGroup( "EscortInterceptors1", "PlayerMothership", 0)	-- tell it to parade with player's MS

		SobGroup_SetTeamColours( "EscortInterceptors2", {0.365, 0.553, 0.667}, {0.8,0.8,0.8}, "DATA:Badges/Hiigaran.tga" )		-- set Hiigaran teamcolours
		SobGroup_ParadeSobGroup( "EscortInterceptors2", "PlayerMothership", 0)	-- tell it to parade with player's MS

	elseif ( InterceptorEscortsGiven == 1) then
		print ("Doing Escort setup on 1 Interceptor squadron!!")
		
		SobGroup_SetTeamColours( "EscortInterceptors1", {0.365, 0.553, 0.667}, {0.8,0.8,0.8}, "DATA:Badges/Hiigaran.tga" )		-- set Hiigaran teamcolours
		SobGroup_ParadeSobGroup( "EscortInterceptors1", "PlayerMothership", 0)	-- tell it to parade with player's MS
	end


	-- Bombers
	if ( BomberEscortsGiven == 2) then
		print ("Doing Escort setup on 2 Bomber squadrons!!")
		
		SobGroup_SetTeamColours( "EscortBombers1", {0.365, 0.553, 0.667}, {0.8,0.8,0.8}, "DATA:Badges/Hiigaran.tga" )		-- set Hiigaran teamcolours
		SobGroup_ParadeSobGroup( "EscortBombers1", "PlayerMothership", 0)	-- tell it to parade with player's MS

		SobGroup_SetTeamColours( "EscortBombers2", {0.365, 0.553, 0.667}, {0.8,0.8,0.8}, "DATA:Badges/Hiigaran.tga" )		-- set Hiigaran teamcolours
		SobGroup_ParadeSobGroup( "EscortBombers2", "PlayerMothership", 0)	-- tell it to parade with player's MS

	elseif ( BomberEscortsGiven == 1) then
		print ("Doing Escort setup on 1 Bomber squadron!!")
		
		SobGroup_SetTeamColours( "EscortBombers1", {0.365, 0.553, 0.667}, {0.8,0.8,0.8}, "DATA:Badges/Hiigaran.tga" )		-- set Hiigaran teamcolours
		SobGroup_ParadeSobGroup( "EscortBombers1", "PlayerMothership", 0)	-- tell it to parade with player's MS
	end
	
	
	
	Rule_Remove ("EscortSetup")
end


-- if the player only has 1 collector, tell them to build more
function Rule_IntelEvent_RecommendCollectors()
	NumPlayerCollectors = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping( 0, "Hgn_ResourceCollector" )
	if ( OpeningEventFinished == 1 ) and							-- if the opening event is over
	   ( NumPlayerCollectors < 2 ) then
		Rule_AddInterval ("Rule_IntelEvent_RecommendCollectorsPLAYEVENT", 7)
		Rule_Remove ("Rule_IntelEvent_RecommendCollectors")
	elseif ( OpeningEventFinished == 1 ) and						-- if the opening event is over
		 ( NumPlayerCollectors == 0 ) then
		Rule_AddInterval ("Rule_IntelEvent_RecommendCollectorsPLAYEVENT", 7)
		Rule_Remove ("Rule_IntelEvent_RecommendCollectors")
	end
end

function Rule_IntelEvent_RecommendCollectorsPLAYEVENT()
	if ( EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_RecommendCollectors")			-- play event: recommend building more collectors
		Rule_AddInterval ("Rule_checkForPlayerBuildingCollectors", 5)
		Rule_Remove ("Rule_IntelEvent_RecommendCollectorsPLAYEVENT")
	end
end


function Rule_checkForPlayerBuildingCollectors()
	SobGroup_FillShipsByType( "PlayerCollectors", "Player_Ships0", "Hgn_ResourceCollector" )		-- get Player's Resource Collectors
	if ( SobGroup_Count ("PlayerCollectors") > 1 ) then				-- and there are more than x Collectors
		Objective_SetState( obj_sec_buildCollectors_id, OS_Complete )	-- set objective to complete
		Rule_Remove ("Rule_checkForPlayerBuildingCollectors")
	end
end

-- If the player tries to move the Mothership, play a speech event explaining why it's moving so slowly
function Rule_IntelEvent_mothershipMoved()

        if (EventPlaying == 0) and ( SobGroup_IsDoingAbility( "PlayerMothership", AB_Move ) == 1 ) then               -- if the Mothership has a move order
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_firstMSMove")                           -- play event: engines @ 20%
                Rule_Remove("Rule_IntelEvent_mothershipMoved")
        end
end


function Rule_checkCorvetteSubsystemComplete()
        if ( SobGroup_GetHardPointHealth("PlayerMothership", "Production 2") > 0) then    -- if the Corvette hardpoint has any health
		print ("Corvette hardpoint has some health!")
		Sound_SetMuteActor("Fleet")										-- mute FC so she doesn't say regular AllShips lines
		Player_UnrestrictBuildOption(0, "Hgn_AssaultCorvette")
	        Rule_Add ("Rule_intelevent_corvetteSubsystemComplete")  -- Corvette Subsystem complete.  etc..
		Rule_Remove ("Rule_checkCorvetteSubsystemComplete")
	end
end


-- When the player builds a Corvette subsystem on the Mothership
function Rule_intelevent_corvetteSubsystemComplete()
        if (EventPlaying == 0) and ( SobGroup_GetHardPointHealth("PlayerMothership", "Production 2") > 0) then    -- if the Corvette hardpoint has any health
		print ("Playing Corvette subsystem event!")
                EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_corvetteSubsystemComplete")		-- play event: Corvette subsystem complete
		Timer_Start("PulsarCorvetteTimer", 100)					-- start timer for unlocking Pulsar Corvettes
		Rule_Add ("Rule_intelevent_pulsarCorvetteAvailable")		-- add event telling player about Pulsar Corvettes
                Rule_Remove("Rule_intelevent_corvetteSubsystemComplete")
        end
end


-- When Pulsar Corvettes are available
function Rule_intelevent_pulsarCorvetteAvailable()
        if (EventPlaying == 0) and ( Timer_GetRemaining("PulsarCorvetteTimer") < 1) then    -- if the Pulsar Corvette timer is up
                EventPlaying = 1
		Sound_EnterIntelEvent()
		Sound_SetMuteActor("Fleet")										-- mute FC so she doesn't say regular AllShips lines
		Event_Start("intelevent_pulsarCorvetteAvailable")		-- play event: Pulsar Corvette available for construction
                Rule_Remove("Rule_intelevent_pulsarCorvetteAvailable")
        end
end




-- if the above event has completed and there are any bombers left attacking the transports, play the event recommending use of Corvettes against bombers
function Rule_intelevent_recommendCorvettes()
        if (EventPlaying == 0) and
	   ( evt_corvetteSubsystemComplete_started == 1) and
	   ( NIS02B_Playing == 0) and
           ( ( SobGroup_Empty ("Convoy1Bombers1") ~= 1) or
             ( SobGroup_Empty ("Convoy1Bombers2") ~= 1) or
             ( SobGroup_Empty ("Convoy1Bombers3") ~= 1) or
             ( SobGroup_Empty ("Convoy2Bombers2") ~= 1) or
             ( SobGroup_Empty ("Convoy2Bombers3") ~= 1) or
	     ( ( initialReinforcementsLaunched == 1 ) and
             ( SobGroup_Empty ("Convoy3Bombers1") ~= 1) or
             ( SobGroup_Empty ("Convoy4Bombers1") ~= 1) or
             ( SobGroup_Empty ("Convoy5Bombers1") ~= 1) ) or
             (( convoy3ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy3Bombers2) == 1)) or
             (( convoy3ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy3Bombers3) == 1)) or
             (( convoy4ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy4Bombers2) == 1)) or
             (( convoy4ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy4Bombers3) == 1)) or
             (( convoy5ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy5Bombers2) == 1)) or
             (( convoy5ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy5Bombers3) == 1)) or
             (( convoy6ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy6Bombers2) == 1)) or
             (( convoy6ReinforceONCE == 1) and ( HW2_IsRunTimeSobGroupAlive (Convoy6Bombers3) == 1)) )  then
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_recommendCorvettes")                            -- play event: recommend using Corvettes to defeat the Bombers attacking the transports
                Rule_Remove("Rule_intelevent_recommendCorvettes")
        end
end


-- spawn Elite Fighters in stages
function Rule_spawnEliteFighters1()
        EliteFighters1 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite")  -- spawn Elite Fighters
	SobGroup_SetTeamColours( EliteFighters1, {1,1,1}, {0,0,0}, "DATA:Badges/Hiigaran.tga" )		-- set custom teamcolours
        Rule_AddInterval ("Rule_spawnEliteFighters2", 7)
        Rule_Remove ("Rule_spawnEliteFighters1")
end

function Rule_spawnEliteFighters2()
        EliteFighters2 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite")  -- spawn Elite Fighters
	SobGroup_SetTeamColours( EliteFighters2, {1,1,1}, {0,0,0}, "DATA:Badges/Hiigaran.tga" )		-- set custom teamcolours
--        Rule_AddInterval ("Rule_spawnEliteFighters3", 7)
        Rule_Remove ("Rule_spawnEliteFighters2")
end

function Rule_spawnEliteFighters3()
        EliteFighters3 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite") -- spawn Elite Fighters
	SobGroup_SetTeamColours( EliteFighters3, {1,1,1}, {0,0,0}, "DATA:Badges/Hiigaran.tga" )		-- set custom teamcolours
        Rule_AddInterval ("Rule_spawnEliteFighters4", 7)
        Rule_Remove ("Rule_spawnEliteFighters3")
end

function Rule_spawnEliteFighters4()
        EliteFighters4 = SobGroup_CreateShip("PlayerMothership", "Hgn_AttackBomberElite") -- spawn Elite Fighters
	SobGroup_SetTeamColours( EliteFighters4, {1,1,1}, {0,0,0}, "DATA:Badges/Hiigaran.tga" )		-- set custom teamcolours
        Rule_Remove ("Rule_spawnEliteFighters4")
end



-- spawn Elite Corvettes in stages
function Rule_spawnEliteCorvettes1()
        EliteCorvettes1 = SobGroup_CreateShip("PlayerMothership", "Hgn_AssaultCorvetteElite")       -- spawn Elite Corvettes
	SobGroup_SetTeamColours( EliteCorvettes1, {1,1,1}, {0,0,0}, "DATA:Badges/Hiigaran.tga" )	-- set custom teamcolours
        Rule_AddInterval ("Rule_spawnEliteCorvettes2", 7)
        Rule_Remove ("Rule_spawnEliteCorvettes1")
end

function Rule_spawnEliteCorvettes2()
        EliteCorvettes2 = SobGroup_CreateShip("PlayerMothership", "Hgn_AssaultCorvetteElite")       -- spawn Elite Corvettes
	SobGroup_SetTeamColours( EliteCorvettes2, {1,1,1}, {0,0,0}, "DATA:Badges/Hiigaran.tga" )	-- set custom teamcolours
        Rule_Remove ("Rule_spawnEliteCorvettes2")
end

-------------------------------------------------------------------------------------------------
-- Convoy lost: when a convoy dies, play the appropriate speech event
-------------------------------------------------------------------------------------------------
function Rule_convoyLostWatch()
        if ( convoy1LostONCE == 0 ) and (EventPlaying == 0) and ( SobGroup_Empty( "Convoy_1" ) == 1 ) and ( NIS02B_Playing == 0) then
                print ("Convoy 1 is lost!  Setting convoy1LostONCE to 1")
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_1_Lost")                         -- play "Convoy lost" event
                convoy1LostONCE = 1                                                             -- set one-time variable so check doesn't happen again
        end
        if ( convoy2LostONCE == 0 ) and (EventPlaying == 0) and ( SobGroup_Empty( "Convoy_2" ) == 1 ) and ( NIS02B_Playing == 0) then
                print ("Convoy 2 is lost!  Setting convoy2LostONCE to 1")
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_2_Lost")                         -- play "Convoy lost" event
                convoy2LostONCE = 1                                                             -- set one-time variable so check doesn't happen again
        end
        if ( convoy3LostONCE == 0 ) and (EventPlaying == 0) and ( SobGroup_Empty( "Convoy_3" ) == 1 ) and ( NIS02B_Playing == 0) then
                print ("Convoy 3 is lost!  Setting convoy3LostONCE to 1")
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_3_Lost")                         -- play "Convoy lost" event
                convoy3LostONCE = 1                                                             -- set one-time variable so check doesn't happen again
        end
        if ( convoy4LostONCE == 0 ) and (EventPlaying == 0) and ( SobGroup_Empty( "Convoy_4" ) == 1 ) and ( NIS02B_Playing == 0) then
                print ("Convoy 4 is lost!  Setting convoy4LostONCE to 1")
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_4_Lost")                         -- play "Convoy lost" event
                convoy4LostONCE = 1                                                             -- set one-time variable so check doesn't happen again
        end
        if ( convoy5LostONCE == 0 ) and (EventPlaying == 0) and ( SobGroup_Empty( "Convoy_5" ) == 1 ) and ( NIS02B_Playing == 0) then
                print ("Convoy 5 is lost!  Setting convoy5LostONCE to 1")
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_5_Lost")                         -- play "Convoy lost" event
                convoy5LostONCE = 1                                                             -- set one-time variable so check doesn't happen again
        end
        if ( convoy6LostONCE == 0 ) and (EventPlaying == 0) and ( SobGroup_Empty( "Convoy_6" ) == 1 ) and ( NIS02B_Playing == 0) then
                print ("Convoy 6 is lost!  Setting convoy6LostONCE to 1")
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_6_Lost")                         -- play "Convoy lost" event
                convoy6LostONCE = 1                                                             -- set one-time variable so check doesn't happen again
        end
end
-------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------
-- Three Convoys lost (watches to see when three convoy ships have died and then plays MISSION FAILED event)
-------------------------------------------------------------------------------------------------
function Rule_convoyDeathWatch()

        if (convoy1_docked == 0) and (convoy1DestroyedONCE == 0) and (SobGroup_Empty("Convoy_1") == 1) then     -- If the Convoy ship is dead
                convoys_destroyed = convoys_destroyed + 1                                                       -- Increment the convoys_destroyed variable
                print( "convoys destroyed: "..convoys_destroyed )
                convoy1DestroyedONCE = 1                                                                                -- Set the one-time variable so it doesn't happen again
        end
        if (convoy2_docked == 0) and (convoy2DestroyedONCE == 0) and (SobGroup_Empty("Convoy_2") == 1) then     -- If the Convoy ship is dead
                convoys_destroyed = convoys_destroyed + 1                                                       -- Increment the convoys_destroyed variable
                print( "convoys destroyed: "..convoys_destroyed )
                convoy2DestroyedONCE = 1                                                                                -- Set the one-time variable so it doesn't happen again
        end
        if (convoy3_docked == 0) and (convoy3DestroyedONCE == 0) and (SobGroup_Empty("Convoy_3") == 1) then     -- If the Convoy ship is dead
                convoys_destroyed = convoys_destroyed + 1                                                       -- Increment the convoys_destroyed variable
                print( "convoys destroyed: "..convoys_destroyed )
                convoy3DestroyedONCE = 1                                                                                -- Set the one-time variable so it doesn't happen again
        end
        if (convoy4_docked == 0) and (convoy4DestroyedONCE == 0) and (SobGroup_Empty("Convoy_4") == 1) then     -- If the Convoy ship is dead
                convoys_destroyed = convoys_destroyed + 1                                                       -- Increment the convoys_destroyed variable
                print( "convoys destroyed: "..convoys_destroyed )
                convoy4DestroyedONCE = 1                                                                                -- Set the one-time variable so it doesn't happen again
        end
        if (convoy5_docked == 0) and (convoy5DestroyedONCE == 0) and (SobGroup_Empty("Convoy_5") == 1) then     -- If the Convoy ship is dead
                convoys_destroyed = convoys_destroyed + 1                                                       -- Increment the convoys_destroyed variable
                print( "convoys destroyed: "..convoys_destroyed )
                convoy5DestroyedONCE = 1                                                                                -- Set the one-time variable so it doesn't happen again
        end
        if (convoy6_docked == 0) and (convoy6DestroyedONCE == 0) and (SobGroup_Empty("Convoy_6") == 1) then     -- If the Convoy ship is dead
                convoys_destroyed = convoys_destroyed + 1                                                       -- Increment the convoys_destroyed variable
                print( "convoys destroyed: "..convoys_destroyed )
                convoy6DestroyedONCE = 1                                                                                -- Set the one-time variable so it doesn't happen again
        end
        if ( (convoys_destroyed < 3) and ( ( convoys_saved + convoys_destroyed ) == 6 ) ) then
                Objective_SetState( obj_prim_saveconvoys_id, OS_Complete )			-- GBX:pdeupree - if all convoys are saved or not too many are destroyed go ahead and set save convoys objective to complete
        end
end

function Rule_IntelEvent_3convoys_Lost()
        if (EventPlaying == 0) and ( convoys_destroyed >= 3 ) and ( NIS02B_Playing == 0) then                                              -- If all convoys are dead
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_3convoys_Lost")                         -- Play Intel event re: MISSION FAILED
                Rule_Remove("Rule_IntelEvent_3convoys_Lost")
        end
end
-------------------------------------------------------------------------------------------------





-------------------------------------------------------------------------------------------------
-- Convoy saved: when a convoy is saved, play the appropriate speech event
-------------------------------------------------------------------------------------------------
function Rule_convoySavedWatch()

        -- Convoy 1
        if (EventPlaying == 0) and
	   ( convoy1SavedONCE == 0 ) and
	   ( NIS02B_Playing == 0) and
	   ( SobGroup_Empty( "Convoy1Bombers1" ) == 1 ) and
           ( SobGroup_Empty( "Convoy1Bombers2" ) == 1) and
           ( SobGroup_Empty( "Convoy1Bombers3" ) == 1) and
           ( SobGroup_Empty( "Convoy_1" ) == 0)
            then
                convoys_saved = convoys_saved + 1                                               -- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_1_Saved")                         -- play "Convoy saved" event
                convoy1SavedONCE = 1                                                             -- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_1", 3.0)

        end

        -- Convoy 2
        if (EventPlaying == 0) and
	   ( convoy2SavedONCE == 0 ) and
	   ( NIS02B_Playing == 0) and
--	   ( SobGroup_Empty( "Convoy2Bombers1" ) == 1 ) and
           ( SobGroup_Empty( "Convoy2Bombers2" ) == 1 ) and
           ( SobGroup_Empty( "Convoy2Bombers3" ) == 1 ) and
           ( SobGroup_Empty( "Convoy_2" )  == 0)
            then
                convoys_saved = convoys_saved + 1                                               -- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_2_Saved")                         -- play "Convoy saved" event
                convoy2SavedONCE = 1                                                             -- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_2", 3.0)
        end

	
	
        -- Convoy 3 ---------------------------------------------------------------------------
        -- if reinforcements have been called in, check to see that all attackers are dead:

        if (EventPlaying == 0) and
	   ( convoy3Reinforcements == 1) and
	   ( convoy3SavedONCE == 0 ) and
	   ( NIS02B_Playing == 0) and
	   ( SobGroup_Empty( "Convoy3Bombers1" ) == 1 ) and
           ( HW2_IsRunTimeSobGroupEmpty( Convoy3Bombers2 ) == 1) and
           ( HW2_IsRunTimeSobGroupEmpty( Convoy3Bombers3 ) == 1) and
           ( SobGroup_Empty( "Convoy_3" ) == 0)
            then
                convoys_saved = convoys_saved + 1                                               -- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_3_Saved")                         -- play "Convoy saved" event
                convoy3SavedONCE = 1                                                             -- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_3", 5.0)
		Rule_Add ("Rule_SlowConvoy3Down")
        end

        -- Convoy 3
        -- if Vaygr Fighter Facility is dead and the reinforcements never launched,
        -- check to see that the initial attack force is dead:
        if (EventPlaying == 0) and
	   ( convoy3ReinforceONCE == 0) and
           ( convoy3SavedONCE == 0 ) and
	   ( NIS02B_Playing == 0) and
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and
           ( SobGroup_Empty( "Convoy3Bombers1" ) == 1 ) and
           ( SobGroup_Empty( "Convoy_3" ) == 0)
	   then
                convoys_saved = convoys_saved + 1                                               -- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_3_Saved")                         -- play "Convoy saved" event
                convoy3SavedONCE = 1                                                             -- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_3", 5.0)
		Rule_Add ("Rule_SlowConvoy3Down")
        end

	-------------------------------------------------------------------------------------------


        -- Convoy 4 ---------------------------------------------------------------------------
        if (EventPlaying == 0) and
	   ( convoy4SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy4ReinforceONCE == 1) and						-- and the reinforcements HAVE launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy4 == 0) and					-- and the Vgr Frigates aren't attacking you
	   ( SobGroup_Empty( "Convoy4Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy4Bombers2 ) == 1) and			-- and the reinforcements are dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy4Bombers3 ) == 1) and			-- and the reinforcements are dead
           ( SobGroup_Empty( "Convoy_4" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_4_Saved")			-- play "Convoy saved" event
                convoy4SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_4", 3.0)
        end

        if (EventPlaying == 0) and
	   ( convoy4SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy4ReinforceONCE == 0) and						-- and the reinforcements HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy4 == 0) and					-- and the Vgr Frigates aren't attacking you
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
	   ( SobGroup_Empty( "Convoy4Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( SobGroup_Empty( "Convoy_4" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_4_Saved")			-- play "Convoy saved" event
                convoy4SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_4", 3.0)
        end

        if (EventPlaying == 0) and
	   ( convoy4SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy4ReinforceONCE == 0) and						-- and the reinforcements HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy4 == 1) and					-- and the Vgr Frigates ARE attacking you
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
	   ( SobGroup_Empty( "Convoy4Bombers1" ) == 1 ) and		-- and the initial attack force is dead
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
           ( SobGroup_Empty( "Convoy_4" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_4_Saved")			-- play "Convoy saved" event
                convoy4SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_4", 3.0)
        end

        if (EventPlaying == 0) and
	   ( convoy4SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy4ReinforceONCE == 1) and						-- and the reinforcements HAVE launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy4 == 1) and					-- and the Vgr Frigates ARE attacking you
	   ( SobGroup_Empty( "Convoy4Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy4Bombers2 ) == 1) and			-- and the reinforcements are dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy4Bombers3 ) == 1) and			-- and the reinforcements are dead
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
           ( SobGroup_Empty( "Convoy_4" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_4_Saved")			-- play "Convoy saved" event
                convoy4SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_4", 3.0)
        end
	-------------------------------------------------------------------------------------------

	
	
        -- Convoy 5 ---------------------------------------------------------------------------
        if (EventPlaying == 0) and
	   ( convoy5SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy5ReinforceONCE == 1) and						-- and the reinforcements HAVE launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy5 == 0) and					-- and the Vgr Frigates aren't attacking you
	   ( SobGroup_Empty( "Convoy5Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy5Bombers2 ) == 1) and			-- and the reinforcements are dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy5Bombers3 ) == 1) and			-- and the reinforcements are dead
           ( SobGroup_Empty( "Convoy_5" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_5_Saved")			-- play "Convoy saved" event
                convoy5SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_5", 5.0)
		Rule_Add ("Rule_SlowConvoy5Down")
        end

        if (EventPlaying == 0) and
	   ( convoy5SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy5ReinforceONCE == 0) and						-- and the reinforcements HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy5 == 0) and					-- and the Vgr Frigates aren't attacking you
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
	   ( SobGroup_Empty( "Convoy5Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( SobGroup_Empty( "Convoy_5" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_5_Saved")			-- play "Convoy saved" event
                convoy5SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_5", 5.0)
		Rule_Add ("Rule_SlowConvoy5Down")
        end

        if (EventPlaying == 0) and
	   ( convoy5SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy5ReinforceONCE == 0) and						-- and the reinforcements HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy5 == 1) and					-- and the Vgr Frigates ARE attacking you
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
	   ( SobGroup_Empty( "Convoy5Bombers1" ) == 1 ) and		-- and the initial attack force is dead
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
           ( SobGroup_Empty( "Convoy_5" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_5_Saved")			-- play "Convoy saved" event
                convoy5SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_5", 5.0)
		Rule_Add ("Rule_SlowConvoy5Down")
        end

        if (EventPlaying == 0) and
	   ( convoy5SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( convoy5ReinforceONCE == 1) and						-- and the reinforcements HAVE launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy5 == 1) and					-- and the Vgr Frigates ARE attacking you
	   ( SobGroup_Empty( "Convoy5Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy5Bombers2 ) == 1) and			-- and the reinforcements are dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy5Bombers3 ) == 1) and			-- and the reinforcements are dead
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
           ( SobGroup_Empty( "Convoy_5" ) == 0) 					-- and the convoy isn't dead
            then
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_5_Saved")			-- play "Convoy saved" event
                convoy5SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_5", 5.0)
		Rule_Add ("Rule_SlowConvoy5Down")
        end
	-------------------------------------------------------------------------------------------

	
        -- Convoy 6 ---------------------------------------------------------------------------
        if (EventPlaying == 0) and
	   ( convoy6SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( Convoy6InitialAttackLaunched == 1 ) and				-- and the initial attackers HAVE launched
	   ( convoy6ReinforceONCE == 0) and						-- and the reinforcements HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy6 == 0) and					-- and the Vgr Frigates ARE NOT attacking you
	   ( SobGroup_Empty( "Convoy6Bombers1" ) == 1 ) and		-- and the initial attack force is dead
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
           ( SobGroup_Empty( "Convoy_6" ) == 0) 					-- and the convoy isn't dead
            then
		print ("Convoy 6 saved in FIRST check")
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_6_Saved")			-- play "Convoy saved" event
                convoy6SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_6", 5.0)
		Rule_Add ("Rule_SlowConvoy6Down")
        end

        if (EventPlaying == 0) and
	   ( convoy6SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( Convoy6InitialAttackLaunched == 1 ) and				-- and the initial attackers HAVE launched
	   ( convoy6ReinforceONCE == 0) and						-- and the reinforcements HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy6 == 1) and					-- and the Vgr Frigates ARE attacking you
	   ( SobGroup_Empty( "Convoy6Bombers1" ) == 1 ) and		-- and the initial attack force is dead
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
           ( SobGroup_Empty( "Convoy_6" ) == 0) 					-- and the convoy isn't dead
            then
		print ("Convoy 6 saved in SECOND check")
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_6_Saved")			-- play "Convoy saved" event
                convoy6SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_6", 5.0)
		Rule_Add ("Rule_SlowConvoy6Down")
        end

        if (EventPlaying == 0) and
	   ( convoy6SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( Convoy6InitialAttackLaunched == 1 ) and				-- and the initial attackers HAVE launched
	   ( convoy6ReinforceONCE == 1) and						-- and the reinforcements HAVE launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy6 == 0) and					-- and the Vgr Frigates ARE NOT attacking you
	   ( SobGroup_Empty( "Convoy6Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy6Bombers2 ) == 1) and			-- and the reinforcements are dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy6Bombers3 ) == 1) and			-- and the reinforcements are dead
           ( SobGroup_Empty( "Convoy_6" ) == 0) 					-- and the convoy isn't dead
            then
		print ("Convoy 6 saved in THIRD check")
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_6_Saved")			-- play "Convoy saved" event
                convoy6SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_6", 5.0)
		Rule_Add ("Rule_SlowConvoy6Down")
        end

        if (EventPlaying == 0) and
	   ( convoy6SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( Convoy6InitialAttackLaunched == 1 ) and				-- and the initial attackers HAVE launched
	   ( convoy6ReinforceONCE == 1) and						-- and the reinforcements HAVE launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy6 == 1) and					-- and the Vgr Frigates ARE attacking you
	   ( SobGroup_Empty( "Convoy6Bombers1" ) == 1 ) and		-- and the initial attack force is dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy6Bombers2 ) == 1) and			-- and the reinforcements are dead
           ( HW2_IsRunTimeSobGroupEmpty( Convoy6Bombers3 ) == 1) and			-- and the reinforcements are dead
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
           ( SobGroup_Empty( "Convoy_6" ) == 0) 					-- and the convoy isn't dead
            then
		print ("Convoy 6 saved in FOURTH check")
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_convoy_6_Saved")			-- play "Convoy saved" event
                convoy6SavedONCE = 1							-- set one-time variable so check doesn't happen again
SobGroup_SetSpeed("Convoy_6", 5.0)
		Rule_Add ("Rule_SlowConvoy6Down")
        end

        if ( convoy6SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( Convoy6InitialAttackLaunched == 0 ) and				-- and the initial attackers HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy6 == 1) and					-- and the Vgr Frigates ARE attacking you
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
           ( SobGroup_Empty( "Convoy_6" ) == 0) 					-- and the convoy isn't dead
            then
		print ("Convoy 6 saved in FIFTH check")
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
                convoy6SavedONCE = 1							-- set one-time variable so check doesn't happen again
                Ping_Remove( ping_Convoy_6_id )					-- remove the ping on the safe ship
SobGroup_SetSpeed("Convoy_6", 5.0)
		Rule_Add ("Rule_SlowConvoy6Down")
        end

        if ( convoy6SavedONCE == 0 ) and						-- if the convoy hasn't already been saved
	   ( Convoy6InitialAttackLaunched == 0 ) and				-- and the initial attackers HAVE NOT launched
	   ( NIS02B_Playing == 0) and							-- and the NIS isn't playing
	   ( frigatesAttackingConvoy6 == 0) and					-- and the Vgr Frigates ARE NOT attacking you
--	   ( SobGroup_Empty( "FrigateAttackers") == 1) and		-- and the Frigate attackers are dead
	   ( frigatesAttackingMelarnFleet == 1) and					-- Frigates have been distracted by Melarn
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and	-- and the Fighter Facility is dead (no possibility of reinforcements)
           ( SobGroup_Empty( "Convoy_6" ) == 0) 					-- and the convoy isn't dead
            then
		print ("Convoy 6 saved in SIXTH check")
                convoys_saved = convoys_saved + 1					-- increment the convoys_saved variable
                convoy6SavedONCE = 1							-- set one-time variable so check doesn't happen again
                Ping_Remove( ping_Convoy_6_id )					-- remove the ping on the safe ship
SobGroup_SetSpeed("Convoy_6", 5.0)
		Rule_Add ("Rule_SlowConvoy6Down")
        end


--	if ( SobGroup_Empty ("FrigateAttackers") == 1) then
--		print ("FrigateAttackers are DEAD!!!!!!!!!!!!!!!!!!!!!!!!")
--	end
	
end


-- if the convoy is within 3000m of the Mothership, slow it down for nice-looking docking
function Rule_SlowConvoy3Down()
	if ( SobGroup_FillProximitySobGroup( "tempSobGroup", "PlayerMothership", "Convoy_3", 3000) == 1) then
SobGroup_SetSpeed("Convoy_3", 3.0)
		Rule_Remove ("Rule_SlowConvoy3Down")
	end
end

-- if the convoy is within 3000m of the Mothership, slow it down for nice-looking docking
function Rule_SlowConvoy5Down()
	if ( SobGroup_FillProximitySobGroup( "tempSobGroup", "PlayerMothership", "Convoy_5", 3000) == 1) then
SobGroup_SetSpeed("Convoy_5", 3.0)
		Rule_Remove ("Rule_SlowConvoy5Down")
	end
end

-- if the convoy is within 3000m of the Mothership, slow it down for nice-looking docking
function Rule_SlowConvoy6Down()
	if ( SobGroup_FillProximitySobGroup( "tempSobGroup", "PlayerMothership", "Convoy_6", 3000) == 1) then
SobGroup_SetSpeed("Convoy_6", 3.0)
		Rule_Remove ("Rule_SlowConvoy6Down")
	end
end


-------------------------------------------------------------------------------------------------





-------------------------------------------------------------------------------------------------
-- Check how many convoys have docked and trigger the reward events
-------------------------------------------------------------------------------------------------
function Rule_convoyRewardWatch()
--         print( "convoys docked: "..convoys_docked )
        -- Convoy 1
        if ( convoyReward1ONCE == 0) and (EventPlaying == 0) and ( convoys_docked == 1) and ( NIS02B_Playing == 0) then                                    -- If one convoy ship has docked
		rewardEventPlaying = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_Reward1")                                                                               -- Play Intel event re: first reward
                convoyReward1ONCE = 1                                                                                           -- set the one-time variable so the check doesn't happen again
        end

        -- Convoy 2
        if ( convoyReward2ONCE == 0) and (EventPlaying == 0) and ( convoys_docked == 2) and ( NIS02B_Playing == 0) then                                    -- If one convoy ship has docked
		rewardEventPlaying = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_Reward2")                                                                               -- Play Intel event re: first reward
                convoyReward2ONCE = 1                                                                                           -- set the one-time variable so the check doesn't happen again
        end

        -- Convoy 3
        if ( convoyReward3ONCE == 0) and (EventPlaying == 0) and ( convoys_docked == 3) and ( NIS02B_Playing == 0) then                                    -- If one convoy ship has docked
		rewardEventPlaying = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_Reward3")                                                                               -- Play Intel event re: first reward
                convoyReward3ONCE = 1                                                                                           -- set the one-time variable so the check doesn't happen again
        end

        -- Convoy 4
        if ( convoyReward4ONCE == 0) and (EventPlaying == 0) and ( convoys_docked == 4) and ( NIS02B_Playing == 0) then                                    -- If one convoy ship has docked
		rewardEventPlaying = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_Reward4")                                                                               -- Play Intel event re: first reward
                convoyReward4ONCE = 1                                                                                           -- set the one-time variable so the check doesn't happen again
        end

        -- Convoy 5
        if ( convoyReward5ONCE == 0) and (EventPlaying == 0) and ( convoys_docked == 5) and ( NIS02B_Playing == 0) then                                    -- If one convoy ship has docked
		rewardEventPlaying = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_Reward5")                                                                               -- Play Intel event re: first reward
                convoyReward5ONCE = 1                                                                                           -- set the one-time variable so the check doesn't happen again
        end

        -- Convoy 6
        if ( convoyReward6ONCE == 0) and (EventPlaying == 0) and ( convoys_docked == 6) and ( NIS02B_Playing == 0) then                                    -- If one convoy ship has docked
		rewardEventPlaying = 1
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_Reward6")                                                                               -- Play Intel event re: first reward
                convoyReward6ONCE = 1                                                                                           -- set the one-time variable so the check doesn't happen again
        end
end
-------------------------------------------------------------------------------------------------



-- Trigger reinforcements from Vaygr Carrier
function Rule_reinforcementWatch()

	
	-- get all player ships near the enemy carrier
	if ( Player_FillProximitySobGroup( "tempSobGroup", 0, "EnemyCarrier", 5000) == 1) then							-- if there are any
		SobGroup_FillShipsByType( "BombersNearEnemyCarrier", "tempSobGroup", "Hgn_AttackBomber" )	-- filter for Bombers
		print ("Found some ships near the Carrier!")
	end


	if ( convoys_saved == 2) or 											-- if the first 2 convoys have been saved
	   ( ( convoys_saved == 1) and ( convoys_destroyed == 1) ) or					-- one convoy has been saved and one destroyed
	   ( convoys_destroyed == 2) or											-- 2 convoys have been destroyed
	   ( convoys_docked == 1) and											-- one convoy has docked
	   ( ReinforcementEventHasPlayed == 0 ) then								-- and this event hasn't played yet
		print ("Playing reinforcement event from FIRST check!")
		ReinforcementEventHasPlayed = 1
		Rule_AddInterval ("Rule_launchReinforcements", 8)						-- launch the reinforcements
                Rule_Remove ("Rule_reinforcementWatch")
	end

	if ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") < 0.9 ) or		-- if the Fighter Facility is damaged
	   ( SobGroup_Empty("BombersNearEnemyCarrier") == 0 ) or	-- or there are Bombers near the Carrier
	   ( SobGroup_HealthPercentage("EnemyCarrier") < 0.8 ) and					-- or the Carrier itself is heavily damaged
	   ( ReinforcementEventHasPlayed == 0 ) then								-- and this event hasn't played yet
		Rule_Add("Rule_lockFighterFacilityHealth")							-- if the Fighter Facility is going to die before the initial reinforcements have finished launching, lock its health until they've finished launching
		
		print ("Playing reinforcement event from SECOND check!")
		ReinforcementEventHasPlayed = 1
		Rule_Add ("Rule_launchReinforcements")								-- launch the reinforcements IMMEDIATELY
                Rule_Remove ("Rule_reinforcementWatch")
	end
end

-- Actually launch the Reinforcements
function Rule_launchReinforcements()

	if (EventPlaying == 0) then
		if ( Sensors_ManagerIsUp() == 1 ) then							-- if player is in the sensors manager
			Sensors_Toggle(0)									-- take them out
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start("intelevent_enemyReinforcements")			-- Play Intel event re: enemy reinforcements
		else
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			Event_Start("intelevent_enemyReinforcements")			-- Play Intel event re: enemy reinforcements
		end
		
		-- launch Bombers & Interceptors to attack Convoys 3, 4, 5
		Rule_AddInterval ("Rule_StaggerLaunch1",1)
	
		initialReinforcementsLaunched = 1										-- set variable so rest of the script knows these guys have launched
		
		Rule_AddInterval ("Rule_AttackRemainingConvoys", 1)						-- start watching for when to attack remaining convoys
		Timer_Start("AttackRemainingConvoysTIMER", 100)								-- start a timer to attack remaining convoys
		Rule_Remove ("Rule_launchReinforcements")
		
	end
	
end

-- stagger the launches of the Vgr Fighters
function Rule_StaggerLaunch1()
	SobGroup_Launch("Convoy3Bombers1", "EnemyCarrier" )
--	Rule_AddInterval ("Rule_StaggerLaunch2", 1)							-- do some setup on the freshly-launched ships
	Rule_AddInterval ("Rule_reinforcementSetup1", 6)							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_StaggerLaunch1")
end

function Rule_StaggerLaunch2()
	SobGroup_Launch("Convoy3Interceptors1", "EnemyCarrier" )
--	Rule_AddInterval ("Rule_StaggerLaunch3", 1)							-- do some setup on the freshly-launched ships
	Rule_AddInterval ("Rule_reinforcementSetup2", 6)							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_StaggerLaunch2")
end

function Rule_StaggerLaunch3()
	SobGroup_Launch("Convoy4Bombers1", "EnemyCarrier" )
--	Rule_AddInterval ("Rule_StaggerLaunch4", 1)							-- do some setup on the freshly-launched ships
	Rule_AddInterval ("Rule_reinforcementSetup3", 6)							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_StaggerLaunch3")
end

function Rule_StaggerLaunch4()
	SobGroup_Launch("Convoy4Interceptors1", "EnemyCarrier" )
--	Rule_AddInterval ("Rule_StaggerLaunch5", 1)							-- do some setup on the freshly-launched ships
	Rule_AddInterval ("Rule_reinforcementSetup4", 6)							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_StaggerLaunch4")
end

function Rule_StaggerLaunch5()
	SobGroup_Launch("Convoy5Bombers1", "EnemyCarrier" )
--	Rule_AddInterval ("Rule_StaggerLaunch6", 1)							-- do some setup on the freshly-launched ships
	Rule_AddInterval ("Rule_reinforcementSetup5", 6)							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_StaggerLaunch5")
end

function Rule_StaggerLaunch6()
	SobGroup_Launch("Convoy5Interceptors1", "EnemyCarrier" )
	Rule_AddInterval ("Rule_reinforcementSetup6", 6)							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_StaggerLaunch6")
end



-- Give freshly-launched ships the proper orders
function Rule_reinforcementSetup1()
	SobGroup_Attack( 1, "Convoy3Bombers1", "Convoy_3" )
	SobGroup_SetROE("Convoy3Bombers1", PassiveROE)
	Rule_Add ("Rule_StaggerLaunch2")							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_reinforcementSetup1")
end

function Rule_reinforcementSetup2()
	SobGroup_GuardSobGroup("Convoy3Interceptors1", "Convoy3Bombers1")
	Rule_Add ("Rule_StaggerLaunch3")							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_reinforcementSetup2")
end

function Rule_reinforcementSetup3()
	SobGroup_Attack( 1, "Convoy4Bombers1", "Convoy_4" )
	SobGroup_SetROE("Convoy4Bombers1", PassiveROE)
	Rule_Add ("Rule_StaggerLaunch4")							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_reinforcementSetup3")
end

function Rule_reinforcementSetup4()
	SobGroup_GuardSobGroup("Convoy4Interceptors1", "Convoy4Bombers1")
	Rule_Add ("Rule_StaggerLaunch5")							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_reinforcementSetup4")
end

function Rule_reinforcementSetup5()
	SobGroup_Attack( 1, "Convoy5Bombers1", "Convoy_5" )
	SobGroup_SetROE("Convoy5Bombers1", PassiveROE)
	Rule_Add ("Rule_StaggerLaunch6")							-- do some setup on the freshly-launched ships
	Rule_Remove ("Rule_reinforcementSetup5")
end

function Rule_reinforcementSetup6()
	SobGroup_GuardSobGroup("Convoy5Interceptors1", "Convoy5Bombers1")
	Rule_AddInterval ("Rule_setLaunchFinishedVariable", 10)
	Rule_Remove ("Rule_reinforcementSetup6")
end

function Rule_setLaunchFinishedVariable()
	Rule_Remove ("Rule_lockFighterFacilityHealth")					-- remove health lock on Fighter Facility subsystem
	Rule_Remove ("Rule_setLaunchFinishedVariable")
end



-- locks health of Fighter Facility so initial reinforcements can launch
function Rule_lockFighterFacilityHealth()

--	print ("lockHealth rule is working!!!!!!!!!")
	-- puts the health of Fighter Facility in a variable
	if ( getFighterFacilityHealthONCE == 0) and								-- if one-time variable hasn't been set
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") < 0.15 ) then	-- and the Fighter Facility is at <15% health
		print ("Fighter Facility health is too low!!")
		getFighterFacilityHealthONCE = 1									-- set one-time variable so check doesn't happen again
		CurrentFighterFacilityHealth = SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1")	-- put the current health in a variable
	end

	-- re-sets health of Fighter Facility over and over
	if ( getFighterFacilityHealthONCE == 1) then								-- if Fighter Facility health was low and has been checked
--		print ("re-setting Fighter Facility health!!")
		SobGroup_SetHardPointHealth( "EnemyCarrier", "Production 1", CurrentFighterFacilityHealth)	-- keep re-setting health to the existing health
	end
	
end


-- removes the lock (on subsequent launches)
function Rule_lockFighterFacilityHealthREMOVE()
	Rule_Remove ("Rule_lockFighterFacilityHealth")
	Rule_Remove ("Rule_lockFighterFacilityHealthREMOVE")
end

-- Launch attacks on remaining convoys
function Rule_AttackRemainingConvoys()
	if  ( ( convoys_saved == 3 ) or 											-- if 4 convoys have been saved
	    ( Timer_GetRemaining("AttackRemainingConvoysTIMER") < 5) ) and			-- or timer is up
            ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.1 ) then	-- and Fighter Facility is still alive
		
		-- launch Bombers & Interceptors to attack Convoy 6
		SobGroup_Launch("Convoy6Bombers1", "EnemyCarrier" )
		SobGroup_Launch("Convoy6Interceptors1", "EnemyCarrier" )
		Convoy6InitialAttackLaunched = 1

		Rule_AddInterval ("Rule_reinforcementSetup7", 10)							-- do some setup on the freshly-launched ships
                Rule_Remove ("Rule_AttackRemainingConvoys")
        end
end

-- Give freshly-launched Bombers an attack order
function Rule_reinforcementSetup7()

	-- make bombers attack Convoys
	SobGroup_Attack( 1, "Convoy6Bombers1", "Convoy_6" )
	
        -- make Interceptors guard Bombers
	SobGroup_GuardSobGroup("Convoy6Interceptors1", "Convoy6Bombers1")
	
	Rule_Remove ("Rule_reinforcementSetup7")
end


ConvoyDamaged = {0, 0, 0, 0, 0, 0}

-- lets the player know a transport has been heavily damaged and they better get their butt over there to help
function Rule_intelevent_convoysDamaged()

	for i = 1, 6 do
		if (EventPlaying == 0) and ( ConvoyDamaged[i] == 0) and ( SobGroup_HealthPercentage("Convoy_"..i) < 0.30) then		-- if the one-time variable hasn't been set, and the health of the transport is < x %
			ConvoyDamaged[i] = 1
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start("intelevent_convoy_CriticalDamage_"..i)
		end
	end

	if ( ConvoyDamaged[1] == 1) and ( ConvoyDamaged[2] == 1) and ( ConvoyDamaged[3] == 1) and ( ConvoyDamaged[4] == 1) and ( ConvoyDamaged[5] == 1) and ( ConvoyDamaged[6] == 1) then
		Rule_Remove ("Rule_intelevent_convoysDamaged")
	end
end


-- check for when Vaygr Frigates arrive and play an event
function Rule_intelevent_frigateAttack()
	if ( NIS02B_Playing == 0) then
		if ( Sensors_ManagerIsUp() == 1 ) then					-- if player is in the sensors manager
			Sensors_Toggle(0)								-- take them out
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start("intelevent_frigateAttack")
		else
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			Event_Start("intelevent_frigateAttack")
		end
                Rule_Remove ("Rule_intelevent_frigateAttack")
	end
end


-- if Melarn gets damaged, play an event about it, and create secondary objective to protect Melarn
function Rule_intelevent_melarnDamaged()
        if (EventPlaying == 0) and ( SobGroup_HealthPercentage("MelarnSoban") < 0.7 ) and ( tellMelarnToHyperspaceOut == 0 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_melarnDamaged")
--		melarnDamaged = 1
		Rule_Add ("Rule_intelevent_melarnDestroyed")		-- start checking to see whether melarn has been destroyed
                Rule_Remove ("Rule_intelevent_melarnDamaged")
        end
end


-- if Melarn gets really damaged, play another event about it
function Rule_intelevent_melarnCriticallyDamaged()
        if (EventPlaying == 0) and ( SobGroup_HealthPercentage("MelarnSoban") < 0.3 ) and ( tellMelarnToHyperspaceOut == 0 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_melarnCriticallyDamaged")
                Rule_Remove ("Rule_intelevent_melarnCriticallyDamaged")
        end
end




-- if Melarn is destroyed, play the event & call MISSION FAILED
function Rule_intelevent_melarnDestroyed()
--      MelarnCount = SobGroup_Count ("MelarnSoban")
--      print ("MelarnSoban = "..MelarnCount)
--        if ( melarnDamaged == 1) and ( SobGroup_Empty("MelarnSoban") == 1 ) then
        if (EventPlaying == 0) and ( SobGroup_Empty("MelarnSoban") == 1 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start("intelevent_melarnDestroyed")
                Rule_Remove ("Rule_intelevent_melarnDestroyed")
        end
end


-- play an event when the Carrier is fleeing
function Rule_intelevent_carrierFleeing()
	if (EventPlaying == 0) and
	   ( NIS02B_Playing == 0) and
	   ( SobGroup_HealthPercentage("EnemyCarrier") > 0.15 ) and
	   ( SobGroup_Empty ("EnemyCarrier") == 0) then			-- check that the Carrier isn't dead
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_carrierFleeing")
		Rule_AddInterval ("Rule_convoyAttackerEndWatch", 5)
		Rule_Remove ("Rule_intelevent_carrierFleeing")
	end
end

-- tell the player when the Carrier reaches the exit point and hyperspaces out
function Rule_intelevent_carrierEscaped()

        if (EventPlaying == 0) and ( SobGroup_IsInVolume( "EnemyCarrier", "CarrierFleeSphere" ) == 1) then
		if ( Sensors_ManagerIsUp() == 1 ) then							-- if player is in the sensors manager
			Sensors_Toggle(0)									-- take them out
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			print ("Enemy Carrier is in the escape volume!!!!!!!")
			SobGroup_EnterHyperSpaceOffMap("EnemyCarrier")                  -- tell the Carrier to hyperspace out
			EventPlaying = 1
			Sound_EnterIntelEvent()
--			Event_Start("intelevent_carrierEscaped")                                -- start the intel event
			Rule_AddInterval ("Rule_intelevent_carrierEscapedSTARTEVENT", 1)
			Rule_Remove ("Rule_intelevent_carrierEscaped")
		else
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			print ("Enemy Carrier is in the escape volume!!!!!!!")
			SobGroup_EnterHyperSpaceOffMap("EnemyCarrier")                  -- tell the Carrier to hyperspace out
			EventPlaying = 1
			Sound_EnterIntelEvent()
--			Event_Start("intelevent_carrierEscaped")                                -- start the intel event
			Rule_AddInterval ("Rule_intelevent_carrierEscapedSTARTEVENT", 1)
			Rule_Remove ("Rule_intelevent_carrierEscaped")
		end
        end
end

function Rule_intelevent_carrierEscapedSTARTEVENT()
	Event_Start("intelevent_carrierEscaped")                                -- start the intel event
	Rule_Remove ("Rule_intelevent_carrierEscapedSTARTEVENT")
end

-- when the Vaygr Fighter Facility is destroyed, play an event telling the player about it
function Rule_intelevent_fighterFacilityDestroyed()
        if (EventPlaying == 0) and
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") == 0 ) and 	-- if the Fighter Facility is destroyed
	   ( NIS02B_Playing == 0) and											-- and the NIS isn't playing
	   ( SobGroup_Empty ("EnemyCarrier") == 0) then							-- and the Carrier is still alive
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start ("intelevent_fighterFacilityDestroyed")
                Rule_Remove ("Rule_intelevent_fighterFacilityDestroyed")
        end
end



-- start the big long event when the Carrier is dead
function Rule_intelevent_carrierDestroyed()
        if (EventPlaying == 0) and ( carrierFlee == 1) and ( SobGroup_Empty ( "EnemyCarrier") == 1 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Rule_Add ("Rule_PlayStagingMusic")
                Event_Start("intelevent_carrierDestroyed")                              -- start the intel event
		Rule_Add ("Rule_checkFighterFacilityDestroyed")
                Rule_Remove ("Rule_intelevent_carrierDestroyed")
        end
end

-- checks to see if Fighter Facility objective
function Rule_checkFighterFacilityDestroyed()
	if ( carrierDestroyed == 1) and 											-- if the carrier has been destroyed
	   ( Objective_GetState( obj_sec_destroyFighterFacility_id ) ~= OS_Complete) then	-- and the Fighter Facility objective has not been completed yet
		Objective_SetState( obj_sec_destroyFighterFacility_id, OS_Off )				-- turn off Fighter Facility objective
		Rule_Remove ("Rule_checkFighterFacilityDestroyed")
	end
end



-- Captain Soban to Hiigaran fleet
--~ function Rule_intelevent_sobanToHiigaranFleet()
--~ 	if ( EventPlaying == 0) and ( carrierDestroyedHasPlayed == 1 ) and ( SobGroup_Empty( "FrigateAttackers") == 1) then
--~ 		Rule_Remove ("Rule_melarnAttackWatch2_CaptainSoban")					-- remove the Soban retaliation rules
--~ 		Rule_Remove ("Rule_melarnAttackWatch3_CaptainSoban")
--~ 		EventPlaying = 1
--~ 		Sound_EnterIntelEvent()
--~                 Event_Start("intelevent_sobanToHiigaranFleet")
--~ 		Rule_Remove ("Rule_intelevent_sobanToHiigaranFleet")
--~ 	end
--~ end


function Rule_intelevent_sobanLeaving()
--	if ( EventPlaying == 0) and ( sobanToHiigaranFleetHasPlayed == 1) then
	if ( EventPlaying == 0) and ( carrierDestroyedHasPlayed == 1 ) and ( SobGroup_Empty( "FrigateAttackers") == 1) then
		if ( Sensors_ManagerIsUp() == 1 ) then					-- if player is in the sensors manager
			Rule_Remove ("Rule_melarnAttackWatch2_CaptainSoban")					-- remove the Soban retaliation rules
			Rule_Remove ("Rule_melarnAttackWatch3_CaptainSoban")
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_Toggle(0)								-- take them out
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			SobGroup_SetInvulnerability( "Player_Ships0", 1 )				-- set all player ships to invulnerable while this long-ass autofocus event plays
			Rule_AddInterval ("Rule_intelevent_sobanLeaving2",1)
		else
			Rule_Remove ("Rule_melarnAttackWatch2_CaptainSoban")					-- remove the Soban retaliation rules
			Rule_Remove ("Rule_melarnAttackWatch3_CaptainSoban")
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			SobGroup_SetInvulnerability( "Player_Ships0", 1 )				-- set all player ships to invulnerable while this long-ass autofocus event plays
			Rule_Add ("Rule_intelevent_sobanLeaving2")
		end
		Rule_Remove ("Rule_intelevent_sobanLeaving")
	end
end


function Rule_intelevent_sobanLeaving2()
	Event_Start ("intelevent_sobanLeaving")
	Rule_Remove ("Rule_intelevent_sobanLeaving2")
end


-- when all transports have docked or are dead, play the final speech event ("All ships, standby for hyperspace.")
function Rule_intelevent_standbyForHyperspace()
        if (EventPlaying == 0) and
	   ( (convoy1_docked_and_launched  == 1) or (convoy1LostONCE == 1) ) and				-- all the convoys are dead or docked
           ( (convoy2_docked_and_launched  == 1) or (convoy2LostONCE == 1) ) and
           ( (convoy3_docked_and_launched  == 1) or (convoy3LostONCE == 1) ) and
           ( (convoy4_docked_and_launched  == 1) or (convoy4LostONCE == 1) ) and
           ( (convoy5_docked_and_launched  == 1) or (convoy5LostONCE == 1) ) and
           ( (convoy6_docked_and_launched  == 1) or (convoy6LostONCE == 1) ) and
	   ( tellMelarnToHyperspaceOut == 1) then								-- melarn has left the building
		if ( Sensors_ManagerIsUp() == 1 ) then					-- if player is in the sensors manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_Toggle(0)								-- take them out
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			Objective_SetState( obj_prim_saveconvoys_id, OS_Complete )			-- set save convoys objective to complete
			Rule_AddInterval ("Rule_intelevent_standbyForHyperspace2",1)
			Rule_Remove ("Rule_intelevent_standbyForHyperspace")
		else
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_Toggle(0)								-- take them out
			Sensors_EnableToggle(0)							-- Disallow going in and out of the Sensors Manager
			Objective_SetState( obj_prim_saveconvoys_id, OS_Complete )			-- set save convoys objective to complete
			Event_Start ("intelevent_standbyForHyperspace")
			Rule_Remove ("Rule_intelevent_standbyForHyperspace")
		end
        end
end


function Rule_intelevent_standbyForHyperspace2()
	Event_Start ("intelevent_standbyForHyperspace")
	Rule_Remove ("Rule_intelevent_standbyForHyperspace2")
end

-- ===== INTEL EVENTS ==========================================================================













-- ===== CONVOY ================================================================================

-------------------------------------------------------------------------------------------------
-- Give the Convoy ships orders to dock with the player's Mothership
-------------------------------------------------------------------------------------------------
convoyGroups = {"Convoy_1", "Convoy_2", "Convoy_3", "Convoy_4", "Convoy_5", "Convoy_6"};

function Rule_convoySetup()
        -- tell each convoy to dock with the Mothership
        for i = 1, 6 do
		SobGroup_DockSobGroupAndStayDocked(convoyGroups[i], "PlayerMothership");
        end

	Rule_AddInterval ("Rule_convoyDisableCommands", 1)
	Rule_Remove( "Rule_convoySetup" )
end


function Rule_convoyDisableCommands()

local abilityList = {AB_Move, AB_Attack, AB_Guard, AB_Stop, AB_Hyperspace, AB_Retire, AB_Scuttle};

        -- disable all commands the player could give the convoys
        for i = 1, 6 do
                for j = 1, 7 do
			SobGroup_AbilityActivate( convoyGroups[i], abilityList[j], 0 );
		end
        end

	-- disable all commands the player could give the convoys
--	SobGroup_AbilityActivate( "Convoy_1", AB_Move, 0 )
--	SobGroup_AbilityActivate( "Convoy_1", AB_Attack, 0 )
--	SobGroup_AbilityActivate( "Convoy_1", AB_Guard, 0 )
--	SobGroup_AbilityActivate( "Convoy_1", AB_Stop, 0 )
--	SobGroup_AbilityActivate( "Convoy_1", AB_Hyperspace, 0 )
--	SobGroup_AbilityActivate( "Convoy_1", AB_Retire, 0 )
	
	Rule_Remove ("Rule_convoyDisableCommands")
end

-------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------
-- Check whether the convoy ships have docked with the Mothership
-------------------------------------------------------------------------------------------------
function Rule_convoyDockWatch()

        -- Convoy 1
        if ( convoy1LostONCE == 0 ) and ( convoy1_dockedONCE == 0) and ( SobGroup_IsDocked("Convoy_1") == 1) then            -- If the convoy ship has docked
                print ("Convoy 1 has docked!")
                convoy1_dockedONCE = 1                                                                                          -- set the one-time variable so the check doesn't happen again
                convoy1_docked = 1                                                                                                      -- set the docked variable to true; used for telling the Vaygr attackers to break off
                convoys_docked = convoys_docked + 1                                                                     -- Increment the convoys_docked variable so we can unlock the proper rewards
                SobGroup_SetHealth("Convoy_1", 1)                                                                               -- set transport health to 100% to speed up docking
                SobGroup_SetHealth("Convoy_1", 1)                                                                               -- set transport health to 100% to speed up docking
		Rule_AddInterval ("Rule_Convoy1DockedAndLaunched", 10)
        end

        -- Convoy 2
        if ( convoy2LostONCE == 0 ) and ( convoy2_dockedONCE == 0) and ( SobGroup_IsDocked("Convoy_2") == 1) then            -- If the convoy ship has docked
                print ("Convoy 2 has docked!")
                convoy2_dockedONCE = 1                                                                                          -- set the one-time variable so the check doesn't happen again
                convoy2_docked = 1                                                                                                      -- set the docked variable to true; used for telling the Vaygr attackers to break off
                convoys_docked = convoys_docked + 1                                                                     -- Increment the convoys_docked variable so we can unlock the proper rewards
                SobGroup_SetHealth("Convoy_2", 1)                                                                               -- set transport health to 100% to speed up docking
                SobGroup_SetHealth("Convoy_2", 1)                                                                               -- set transport health to 100% to speed up docking
		Rule_AddInterval ("Rule_Convoy2DockedAndLaunched", 10)
        end

        -- Convoy 3
        if ( convoy3LostONCE == 0 ) and ( convoy3_dockedONCE == 0) and ( SobGroup_IsDocked("Convoy_3") == 1) then            -- If the convoy ship has docked
                print ("Convoy 3 has docked!")
                convoy3_dockedONCE = 1                                                                                          -- set the one-time variable so the check doesn't happen again
                convoy3_docked = 1                                                                                                      -- set the docked variable to true; used for telling the Vaygr attackers to break off
                convoys_docked = convoys_docked + 1                                                                     -- Increment the convoys_docked variable so we can unlock the proper rewards
                SobGroup_SetHealth("Convoy_3", 1)                                                                               -- set transport health to 100% to speed up docking
                SobGroup_SetHealth("Convoy_3", 1)                                                                               -- set transport health to 100% to speed up docking
		Rule_AddInterval ("Rule_Convoy3DockedAndLaunched", 10)
        end

        -- Convoy 4
        if ( convoy4LostONCE == 0 ) and ( convoy4_dockedONCE == 0) and ( SobGroup_IsDocked("Convoy_4") == 1) then            -- If the convoy ship has docked
                print ("Convoy 4 has docked!")
                convoy4_dockedONCE = 1                                                                                          -- set the one-time variable so the check doesn't happen again
                convoy4_docked = 1                                                                                                      -- set the docked variable to true; used for telling the Vaygr attackers to break off
                convoys_docked = convoys_docked + 1                                                                     -- Increment the convoys_docked variable so we can unlock the proper rewards
                SobGroup_SetHealth("Convoy_4", 1)                                                                               -- set transport health to 100% to speed up docking
                SobGroup_SetHealth("Convoy_4", 1)                                                                               -- set transport health to 100% to speed up docking
		Rule_AddInterval ("Rule_Convoy4DockedAndLaunched", 15)
        end

        -- Convoy 5
        if ( convoy5LostONCE == 0 ) and ( convoy5_dockedONCE == 0) and ( SobGroup_IsDocked("Convoy_5") == 1) then            -- If the convoy ship has docked
                print ("Convoy 5 has docked!")
                convoy5_dockedONCE = 1                                                                                          -- set the one-time variable so the check doesn't happen again
                convoy5_docked = 1                                                                                                      -- set the docked variable to true; used for telling the Vaygr attackers to break off
                convoys_docked = convoys_docked + 1                                                                     -- Increment the convoys_docked variable so we can unlock the proper rewards
                SobGroup_SetHealth("Convoy_5", 1)                                                                               -- set transport health to 100% to speed up docking
                SobGroup_SetHealth("Convoy_5", 1)                                                                               -- set transport health to 100% to speed up docking
		Rule_AddInterval ("Rule_Convoy5DockedAndLaunched", 10)
        end

        -- Convoy 6
        if ( convoy6LostONCE == 0 ) and ( convoy6_dockedONCE == 0) and ( SobGroup_IsDocked("Convoy_6") == 1) then            -- If the convoy ship has docked
                print ("Convoy 6 has docked!")
                convoy6_dockedONCE = 1                                                                                          -- set the one-time variable so the check doesn't happen again
                convoy6_docked = 1                                                                                                      -- set the docked variable to true; used for telling the Vaygr attackers to break off
                convoys_docked = convoys_docked + 1                                                                     -- Increment the convoys_docked variable so we can unlock the proper rewards
                SobGroup_SetHealth("Convoy_6", 1)                                                                               -- set transport health to 100% to speed up docking
                SobGroup_SetHealth("Convoy_6", 1)                                                                               -- set transport health to 100% to speed up docking
		Rule_AddInterval ("Rule_Convoy6DockedAndLaunched", 10)
        end
        if ( ( convoys_saved + convoys_destroyed ) == 6 ) then
                Objective_SetState( obj_prim_saveconvoys_id, OS_Complete )			-- if all convoys are saved or destroyed then go ahead and set save convoys objective to complete
        end
end


function Rule_Convoy1DockedAndLaunched()
	convoy1_docked_and_launched = 1
--    SobGroup_ParadeSobGroup( "Convoy_1", "PlayerMothership", 1)
	Rule_Remove ("Rule_Convoy1DockedAndLaunched")
end

function Rule_Convoy2DockedAndLaunched()
	convoy2_docked_and_launched = 1
--    SobGroup_ParadeSobGroup( "Convoy_2", "PlayerMothership", 1)
	Rule_Remove ("Rule_Convoy2DockedAndLaunched")
end

function Rule_Convoy3DockedAndLaunched()
	convoy3_docked_and_launched = 1
--    SobGroup_ParadeSobGroup( "Convoy_3", "PlayerMothership", 1)
	Rule_Remove ("Rule_Convoy3DockedAndLaunched")
end

function Rule_Convoy4DockedAndLaunched()
	convoy4_docked_and_launched = 1
--    SobGroup_ParadeSobGroup( "Convoy_4", "PlayerMothership", 1)
	Rule_Remove ("Rule_Convoy4DockedAndLaunched")
end

function Rule_Convoy5DockedAndLaunched()
	convoy5_docked_and_launched = 1
--    SobGroup_ParadeSobGroup( "Convoy_5", "PlayerMothership", 1)
	Rule_Remove ("Rule_Convoy5DockedAndLaunched")
end

function Rule_Convoy6DockedAndLaunched()
	convoy6_docked_and_launched = 1
--    SobGroup_ParadeSobGroup( "Convoy_6", "PlayerMothership", 1)
	Rule_Remove ("Rule_Convoy6DockedAndLaunched")
end

-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Check whether the reward speech events have finished and tell the convoys to launch
-------------------------------------------------------------------------------------------------
function Rule_convoyLaunchWatch()

--	print ("watching for convoy to dock with MS!")

        -- Convoy 1
        if ( convoy1_launchedONCE == 0) and ( convoy1_dockedONCE == 1 ) and ( rewardEventHasStarted == 1) and ( rewardEventPlaying == 0 ) then		-- If the convoy ship has docked and the speech event is finished
		Rule_AddInterval ("Rule_convoy1Launch", 1)
		convoy1_launchedONCE = 1								-- set one-time variable to check doesn't happen again
        end

        -- Convoy 2
        if ( convoy2_launchedONCE == 0) and ( convoy2_dockedONCE == 1 ) and ( rewardEventHasStarted == 1) and ( rewardEventPlaying == 0 ) then		-- If the convoy ship has docked and the speech event is finished
		Rule_AddInterval ("Rule_convoy2Launch", 1)
		convoy2_launchedONCE = 1								-- set one-time variable to check doesn't happen again
        end

        -- Convoy 3
        if ( convoy3_launchedONCE == 0) and ( convoy3_dockedONCE == 1 ) and ( rewardEventHasStarted == 1) and ( rewardEventPlaying == 0 ) then		-- If the convoy ship has docked and the speech event is finished
		Rule_AddInterval ("Rule_convoy3Launch", 1)
		convoy3_launchedONCE = 1								-- set one-time variable to check doesn't happen again
        end

        -- Convoy 4
        if ( convoy4_launchedONCE == 0) and ( convoy4_dockedONCE == 1 ) and ( rewardEventHasStarted == 1) and ( rewardEventPlaying == 0 ) then		-- If the convoy ship has docked and the speech event is finished
		Rule_AddInterval ("Rule_convoy4Launch", 1)
		convoy4_launchedONCE = 1								-- set one-time variable to check doesn't happen again
        end

        -- Convoy 5
        if ( convoy5_launchedONCE == 0) and ( convoy5_dockedONCE == 1 ) and ( rewardEventHasStarted == 1) and ( rewardEventPlaying == 0 ) then		-- If the convoy ship has docked and the speech event is finished
		Rule_AddInterval ("Rule_convoy5Launch", 1)
		convoy5_launchedONCE = 1								-- set one-time variable to check doesn't happen again
        end

        -- Convoy 6
        if ( convoy6_launchedONCE == 0) and ( convoy6_dockedONCE == 1 ) and ( rewardEventHasStarted == 1) and ( rewardEventPlaying == 0 ) then		-- If the convoy ship has docked and the speech event is finished
		Rule_AddInterval ("Rule_convoy6Launch", 1)
		convoy6_launchedONCE = 1								-- set one-time variable to check doesn't happen again
        end

end


function Rule_convoy1Launch()
	print ("Telling Convoy 1 to launch!")
	SobGroup_Launch("Convoy_1", "PlayerMothership") 				-- tell convoy to launch
	Rule_Remove ("Rule_convoy1Launch")
end

function Rule_convoy2Launch()
	print ("Telling Convoy 2 to launch!")
	SobGroup_Launch("Convoy_2", "PlayerMothership") 				-- tell convoy to launch
	Rule_Remove ("Rule_convoy2Launch")
end

function Rule_convoy3Launch()
	print ("Telling Convoy 3 to launch!")
	SobGroup_Launch("Convoy_3", "PlayerMothership") 				-- tell convoy to launch
	Rule_Remove ("Rule_convoy3Launch")
end

function Rule_convoy4Launch()
	print ("Telling Convoy 4 to launch!")
	SobGroup_Launch("Convoy_4", "PlayerMothership") 				-- tell convoy to launch
	Rule_Remove ("Rule_convoy4Launch")
end

function Rule_convoy5Launch()
	print ("Telling Convoy 5 to launch!")
	SobGroup_Launch("Convoy_5", "PlayerMothership") 				-- tell convoy to launch
	Rule_Remove ("Rule_convoy5Launch")
end

function Rule_convoy6Launch()
	print ("Telling Convoy 6 to launch!")
	SobGroup_Launch("Convoy_6", "PlayerMothership") 				-- tell convoy to launch
	Rule_Remove ("Rule_convoy6Launch")
end


-- tells transports to start heading back to base when mission is over
function Rule_convoysReturnHome()
	for i = 1, 6 do
		if (SobGroup_Empty ("Convoy_"..i) == 0) then				-- if transport is still alive
			SobGroup_AbilityActivate( "Convoy_"..i, AB_Move, 1)		-- turn on move ability
			SobGroup_Move( 0, "Convoy_"..i, "ConvoyExit"..i )		-- move to the sphere at edge of map
			SobGroup_SwitchOwner( "Convoy_"..i, 3 )				-- switch all Convoys to player 3 so they don't hyperspace out with the player
--			SobGroup_AbilityActivate( "Convoy_"..i, AB_Move, 0)		-- turn off move ability
		end
	end
end

-- ===== CONVOY ==================================================================================










-- ===== CONVOY ATTACK ==========================================================================

-------------------------------------------------------------------------------------------------
-- Do various combat setup for the convoy attack
-------------------------------------------------------------------------------------------------
function Rule_combatSetup()

        -- Convoy 2: make Interceptors guard Bombers
        SobGroup_GuardSobGroup("Convoy2Interceptors2", "Convoy2Bombers2")
        SobGroup_GuardSobGroup("Convoy2Interceptors3", "Convoy2Bombers3")

	-- Tell all other convoy attackers to insta-dock with the Vgr Carrier
	SobGroup_DockSobGroupInstant("Convoy3Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy3Interceptors1", "EnemyCarrier")

	SobGroup_DockSobGroupInstant("Convoy4Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy4Interceptors1", "EnemyCarrier")

	SobGroup_DockSobGroupInstant("Convoy5Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy5Interceptors1", "EnemyCarrier")

	SobGroup_DockSobGroupInstant("Convoy6Bombers1", "EnemyCarrier")
	SobGroup_DockSobGroupInstant("Convoy6Interceptors1", "EnemyCarrier")
	
	
        -- Convoy 4: make Interceptors guard Bombers
--        SobGroup_GuardSobGroup("Convoy4Interceptors1", "Convoy4Bombers1")                               -- Interceptors guard bombers

        -- Convoy 5: make Interceptors guard Bombers
--        SobGroup_GuardSobGroup("Convoy5Interceptors1", "Convoy5Bombers1")                               -- Interceptors guard bombers

        -- Convoy 6: make Interceptors guard Bombers
--        SobGroup_GuardSobGroup("Convoy6Interceptors1", "Convoy6Bombers1")                               -- Interceptors guard bombers


	-- Tell Carrier to move to a point a ways out from the player's Mothership
	SobGroup_Move( 1, "EnemyCarrier", "CarrierMovePoint" )
	



        Rule_Remove( "Rule_combatSetup" )
end
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Trigger for Carrier fleeing the map
-------------------------------------------------------------------------------------------------
function Rule_carrierGuardWatch()

        -- If all the Frigate reinforcements are dead, or the Carrier is below 40% health, flee the map
        if ( SobGroup_Empty ("FrigateAttackers") == 1) or ( SobGroup_HealthPercentage("EnemyCarrier") < 0.4) then
                print ("Telling Carrier to FLEE!!! !!! !!! !!! !!!")
--              SobGroup_SetSpeed("EnemyCarrier", 1.35)					-- Crank up the Carrier's speed

                SobGroup_SetSpeed("EnemyCarrier", 1.0)					-- GBX_Cole //making this a bit easier. OG carrier speed 75,new 81.
                SobGroup_Move( 1, "EnemyCarrier", "CarrierFleeSphere" )                 -- move to the sphere at edge of map

                carrierFlee = 1                                                                                         -- set carrier flee var to 1 so other parts of the script know it's fleeing
                Rule_AddInterval("Rule_intelevent_carrierFleeing", 8 )

                Rule_Remove ("Rule_carrierGuardWatch")
        end
	
end


function Rule_slowCarrierDown()
	if ( SobGroup_IsShipNearPoint( "EnemyCarrier", "CarrierFleeSphere", 8500) ) then		-- if Carrier is within x km of flee point
                SobGroup_SetSpeed("EnemyCarrier", 1)									-- Slow the Carrier down
		Rule_Add ("Rule_slowCarrierDown2")
		Rule_Remove ("Rule_slowCarrierDown")
	end
end

function Rule_slowCarrierDown2()
	if ( SobGroup_IsShipNearPoint( "EnemyCarrier", "CarrierFleeSphere", 3500) ) then		-- if Carrier is within x km of flee point
                SobGroup_SetSpeed("EnemyCarrier", 0.75)								-- Slow the Carrier down
		Rule_Remove ("Rule_slowCarrierDown2")
	end
end

------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Triggers for Vgr Fighters that launch from Carrier to protect it
-------------------------------------------------------------------------------------------------
function Rule_launchFirstCarrierGuard()
	if ( carrierUnderAttack == 1 ) and ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0 ) then 						-- and the Carrier is still under attack
		print ("Creating **FIRST** Carrier Guard squadron!!")
		CarrierGuard = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")		-- spawn some Interceptors
		Rule_AddInterval ("Rule_carrierGuardSetup", 1)
		carrierUnderAttack = 0											-- set Carrier to NOT under attack anymore (even though it may be.. the health check will re-set it every 5 seconds if it is)
		carrierGuardLaunch = carrierGuardLaunch + 1							-- increment the squadron counter
		Rule_AddInterval ("Rule_watchForCarrierUnderAttack", 1)
		Rule_Remove ("Rule_launchFirstCarrierGuard")
	end
end

function Rule_watchForCarrierUnderAttack()
	if ( carrierGuardLaunch < 4 ) and 						-- if less than 4 Interceptor squads have been created
	   ( carrierUnderAttack == 1 ) and 						-- and the Carrier is still under attack
	   ( SobGroup_Empty ("EnemyCarrier") == 0) and			-- and the Carrier is still alive!
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0 ) and	-- and the Fighter Facility is still alive
	   ( HW2_IsRunTimeSobGroupEmpty( CarrierGuard ) == 1) then	-- and the newly-created squadron is dead
		print ("Creating new Carrier Guard squadron!!")
		CarrierGuard = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")		-- spawn some Interceptors
		Rule_AddInterval ("Rule_carrierGuardSetup", 1)						-- create a rule to give them a guard order
		carrierUnderAttack = 0											-- set Carrier to NOT under attack anymore (even though it may be.. the health check will re-set it every 5 seconds if it is)
		carrierGuardLaunch = carrierGuardLaunch + 1							-- increment the squadron counter
	elseif ( carrierGuardLaunch == 3) then									-- if 3 Interceptor squads have been created
		print ("Not creating any more Carrier Guard squadrons ever again!!")
		Rule_Remove ("Rule_watchForCarrierUnderAttack")						-- don't ever make any more
	end
end

-- do setup on newly-created squadrons
function Rule_carrierGuardSetup()
	if ( SobGroup_Empty ("EnemyCarrier") == 0) then							-- if the Carrier is alive
		SobGroup_GuardSobGroup( CarrierGuard, "EnemyCarrier")					-- guard it
		SobGroup_SetROE(CarrierGuard, OffensiveROE)
		SobGroup_SetStance(CarrierGuard, AggressiveStance)
	end
	Rule_Remove ("Rule_carrierGuardSetup")
end



function Rule_checkCarrierHealth()
	oldCarrierHealth = SobGroup_HealthPercentage("EnemyCarrier")						-- find out what the current health is
	oldSubsystemHealth = SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1")	-- get health of Fighter Facility
	Rule_AddInterval ("Rule_checkCarrierHealthLater", 5)
	Rule_Remove ("Rule_checkCarrierHealth")
end

function Rule_checkCarrierHealthLater()
	newCarrierHealth = SobGroup_HealthPercentage("EnemyCarrier")					-- find out what the current health is
	newSubsystemHealth = SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1")	-- get health of Fighter Facility
	
	-- if the Carrier or its Fighter Facility is losing health
	if ( newCarrierHealth < oldCarrierHealth) or ( newSubsystemHealth < oldSubsystemHealth) then	
		carrierUnderAttack = 1									-- set carrierUnderAttack variable to TRUE
	else
		carrierUnderAttack = 0									-- otherwise, set it to FALSE
	end
	
	Rule_Add ("Rule_checkCarrierHealth")
	Rule_Remove ("Rule_checkCarrierHealthLater")
end
-------------------------------------------------------------------------------------------------





-------------------------------------------------------------------------------------------------
-- Make all Bombers attack the Convoy
-------------------------------------------------------------------------------------------------
function Rule_startAttackOnConvoy1()
        if ( Universe_GameTime() >= g_now_time + 5 ) then                                      -- after 10 seconds
--                print ("Trying to attack Convoy_1!!!!!!!!!")

                -- Convoy 1
                SobGroup_Attack( 1, "Convoy1Bombers1", "Convoy_1" )                             -- attack the Convoy_1 ship
                SobGroup_Attack( 1, "Convoy1Bombers2", "Convoy_1" )
                SobGroup_Attack( 1, "Convoy1Bombers3", "Convoy_1" )

		--SobGroup_SetSpeed("Convoy_1", 2.0) -- GBX_Cole // speeding up Bishop1 to get to corvs faster in an attempt to [improve the research timing in this mission]


                -- Convoy 2
--                SobGroup_Attack( 1, "Convoy2Bombers1", "Convoy_2" )                             -- attack the Convoy_2 ship
                SobGroup_Attack( 1, "Convoy2Bombers2", "Convoy_2" )
                SobGroup_Attack( 1, "Convoy2Bombers3", "Convoy_2" )

                -- Convoy 3
--                SobGroup_Attack( 1, "Convoy3Bombers1", "Convoy_3" )                             -- attack the Convoy_3 ship

                -- Convoy 4
--                SobGroup_Attack( 1, "Convoy4Bombers1", "Convoy_4" )                             -- attack the Convoy_4 ship

                -- Convoy 5
--                SobGroup_Attack( 1, "Convoy5Bombers1", "Convoy_5" )                             -- attack the Convoy_5 ship

                -- Convoy 6
--                SobGroup_Attack( 1, "Convoy6Bombers1", "Convoy_6" )                             -- attack the Convoy_6 ship


                Rule_AddInterval ("Rule_ConvoyAttackWatch", 3)

                Rule_Remove( "Rule_startAttackOnConvoy1" )
        end
end
-------------------------------------------------------------------------------------------------





-------------------------------------------------------------------------------------------------
-- Convoy 2: Interceptor guard logic (written by SHELBY)
-------------------------------------------------------------------------------------------------
interceptorGroups = {"Convoy2Interceptors2","Convoy2Interceptors3"};
--targetGroups = {"Convoy2Bombers1","Convoy2Bombers2","Convoy2Bombers3"};
targetGroups = {"Convoy2Bombers2","Convoy2Bombers3"};

function Rule_InitializeInterceptorTargets()

        -- tell each interceptor to guard the associated bomber
        for i = 1, 2 do
                SobGroup_GuardSobGroup(interceptorGroups[i], targetGroups[i]);
        end

        Rule_AddInterval ("Rule_CheckInterceptorTargets", 3);
        Rule_Remove( "Rule_InitializeInterceptorTargets" )
end

-- given the interceptor determine what the next target should be
-- this is simply newTarget = mod(target+1,MAX_targets)
function FindNextAvailableTarget( )

        -- this 'for' loop cycles through all the 3 groups
        for i = 1, 2 do

                -- if this sobgroup has anyone left then return this as an available target
                if (SobGroup_Empty(targetGroups[i]) == 0) then
                        return i
                end
        end

        -- return -1 which is an invalid number that symbolizes that there is no targets left
        return -1
end

function Rule_CheckInterceptorTargets()
        --
        -- check each interceptor target - if its dead reassign
        --

        for i = 1, 2 do
                if (SobGroup_Empty(targetGroups[i]) == 1) then
                        local newTarget = FindNextAvailableTarget( i );

                        -- no targets left - end this rule!
                        if (newTarget == -1) or (convoy2_docked == 1) then
                                -- end rule
--				SobGroup_MoveToSobGroup( "Convoy2Interceptors2", "EnemyCarrier" )
--				SobGroup_MoveToSobGroup( "Convoy2Interceptors3", "EnemyCarrier" )
--				SobGroup_GuardSobGroup("Convoy2Interceptors2", "EnemyCarrier")
--				SobGroup_GuardSobGroup("Convoy2Interceptors3", "EnemyCarrier")
				SobGroup_ParadeSobGroup("Convoy2Interceptors2", "EnemyCarrier", 0)
				SobGroup_ParadeSobGroup("Convoy2Interceptors3", "EnemyCarrier", 0)
				SobGroup_SetROE("Convoy2Interceptors2", OffensiveROE)
					SobGroup_SetStance("Convoy2Interceptors2", AggressiveStance)
				SobGroup_SetROE("Convoy2Interceptors3", OffensiveROE)
					SobGroup_SetStance("Convoy2Interceptors3", AggressiveStance)
                                Rule_Remove("Rule_CheckInterceptorTargets")
                                --  and get out of here
                                return
                        end

                        -- give this interceptor a new target
                        targetGroups[i] = targetGroups[newTarget];

                        -- order interceptor to attack this target
                        SobGroup_GuardSobGroup(interceptorGroups[i], targetGroups[i]);
                end
        end

end
-------------------------------------------------------------------------------------------------











-------------------------------------------------------------------------------------------------
-- Convoy 3: Interceptor guard logic (written by SHELBY)
-------------------------------------------------------------------------------------------------

function Rule_InitializeInterceptor3Targets()

        -- tell each interceptor to attack the associated bomber
        for i = 1, 3 do
                SobGroup_GuardSobGroup(interceptor3Groups[i], target3Groups[i]);
        end

        Rule_AddInterval("Rule_CheckInterceptorTargets3", 3);
        Rule_Remove( "Rule_InitializeInterceptor3Targets" )
end

-- given the interceptor determine what the next target should be
-- this is simply newTarget = mod(target+1,MAX_targets)
function Rule_FindNextAvailableTarget3( )

        -- this 'for' loop cycles through all the 3 groups
        for i = 1, 3 do

                -- if this sobgroup has anyone left then return this as an available target
                if (SobGroup_Empty(target3Groups[i]) == 0) then
                        return i
                end
        end

        -- return -1 which is an invalid number that symbolizes that there is no targets left
        return -1
end

function Rule_CheckInterceptorTargets3()
        --
        -- check each interceptor target - if its dead reassign
        --

        for i = 1, 3 do
                if (SobGroup_Empty(target3Groups[i]) == 1) then
                        local newTarget = Rule_FindNextAvailableTarget3( i );

                        -- no targets left - end this rule!
                        if (newTarget == -1) or (convoy3_docked == 1) then
                                -- end rule
--				SobGroup_MoveToSobGroup( "Convoy3Interceptors1", "EnemyCarrier" )
--				SobGroup_MoveToSobGroup( Convoy3Interceptors2, "EnemyCarrier" )
--				SobGroup_MoveToSobGroup( Convoy3Interceptors3, "EnemyCarrier" )
--				SobGroup_GuardSobGroup("Convoy3Interceptors1", "EnemyCarrier")          -- Have all remaining Int's guard the Carrier
--				SobGroup_GuardSobGroup(Convoy3Interceptors2, "EnemyCarrier")
--				SobGroup_GuardSobGroup(Convoy3Interceptors3, "EnemyCarrier")
				SobGroup_ParadeSobGroup("Convoy3Interceptors1", "EnemyCarrier", 0)
				SobGroup_ParadeSobGroup("Convoy3Interceptors2", "EnemyCarrier", 0)
				SobGroup_ParadeSobGroup("Convoy3Interceptors3", "EnemyCarrier", 0)
				SobGroup_SetROE("Convoy3Interceptors1", OffensiveROE)
					SobGroup_SetStance("Convoy3Interceptors1", AggressiveStance)
				SobGroup_SetROE("Convoy3Interceptors2", OffensiveROE)
					SobGroup_SetStance("Convoy3Interceptors2", AggressiveStance)
				SobGroup_SetROE("Convoy3Interceptors3", OffensiveROE)
					SobGroup_SetStance("Convoy3Interceptors3", AggressiveStance)
                                Rule_Remove("Rule_CheckInterceptorTargets3")
                                --  and get out of here
                                return
                        end

                        -- give this interceptor a new target
                        target3Groups[i] = target3Groups[newTarget];

                        -- order interceptor to attack this target
                        SobGroup_GuardSobGroup(interceptor3Groups[i], target3Groups[i]);
                end
        end

end
-------------------------------------------------------------------------------------------------








-------------------------------------------------------------------------------------------------
-- Convoy 4: Interceptor guard logic (written by SHELBY)
-------------------------------------------------------------------------------------------------

function Rule_InitializeInterceptor4Targets()

        -- tell each interceptor to attack the associated bomber
        for i = 1, 3 do
                SobGroup_GuardSobGroup(interceptor4Groups[i], target4Groups[i]);
        end

        Rule_AddInterval("Rule_CheckInterceptorTargets4", 3);
        Rule_Remove( "Rule_InitializeInterceptor4Targets" )
end

-- given the interceptor determine what the next target should be
-- this is simply newTarget = mod(target+1,MAX_targets)
function Rule_FindNextAvailableTarget4( )

        -- this 'for' loop cycles through all the 3 groups
        for i = 1, 3 do

                -- if this sobgroup has anyone left then return this as an available target
                if (SobGroup_Empty(target4Groups[i]) == 0) then
                        return i
                end
        end

        -- return -1 which is an invalid number that symbolizes that there is no targets left
        return -1
end

function Rule_CheckInterceptorTargets4()
        --
        -- check each interceptor target - if its dead reassign
        --

        for i = 1, 3 do
                if (SobGroup_Empty(target4Groups[i]) == 1) then
                        local newTarget = Rule_FindNextAvailableTarget4( i );

                        -- no targets left - end this rule!
                        if (newTarget == -1) or (convoy4_docked == 1) then
                                -- end rule
--				SobGroup_MoveToSobGroup( "Convoy4Interceptors1", "EnemyCarrier" )
--                                SobGroup_GuardSobGroup("Convoy4Interceptors1", "EnemyCarrier")          -- Have all remaining Int's guard the Carrier
				SobGroup_ParadeSobGroup("Convoy4Interceptors1", "EnemyCarrier", 0)
--				SobGroup_MoveToSobGroup( Convoy4Interceptors2, "EnemyCarrier" )
--				SobGroup_GuardSobGroup(Convoy4Interceptors2, "EnemyCarrier")
				SobGroup_ParadeSobGroup("Convoy4Interceptors2", "EnemyCarrier", 0)
				SobGroup_SetROE("Convoy4Interceptors2", OffensiveROE)
					SobGroup_SetStance("Convoy4Interceptors2", AggressiveStance)
--				SobGroup_MoveToSobGroup( Convoy4Interceptors3, "EnemyCarrier" )
--				SobGroup_GuardSobGroup(Convoy4Interceptors3, "EnemyCarrier")
				SobGroup_ParadeSobGroup("Convoy4Interceptors3", "EnemyCarrier", 0)
				SobGroup_SetROE("Convoy4Interceptors3", OffensiveROE)
					SobGroup_SetStance("Convoy4Interceptors3", AggressiveStance)
				SobGroup_SetROE("Convoy4Interceptors1", OffensiveROE)
					SobGroup_SetStance("Convoy4Interceptors1", AggressiveStance)
                                Rule_Remove("Rule_CheckInterceptorTargets4")
                                --  and get out of here
                                return
                        end

                        -- give this interceptor a new target
                        target4Groups[i] = target4Groups[newTarget];

                        -- order interceptor to attack this target
                        SobGroup_GuardSobGroup(interceptor4Groups[i], target4Groups[i]);
                end
        end

end
-------------------------------------------------------------------------------------------------










-------------------------------------------------------------------------------------------------
-- Convoy 5: Interceptor guard logic (written by SHELBY)
-------------------------------------------------------------------------------------------------

function Rule_InitializeInterceptor5Targets()

        -- tell each interceptor to attack the associated bomber
        for i = 1, 3 do
                SobGroup_GuardSobGroup(interceptor5Groups[i], target5Groups[i]);
        end

        Rule_AddInterval("Rule_CheckInterceptorTargets5", 3);
        Rule_Remove( "Rule_InitializeInterceptor5Targets" )
end

-- given the interceptor determine what the next target should be
-- this is simply newTarget = mod(target+1,MAX_targets)
function Rule_FindNextAvailableTarget5( )

        -- this 'for' loop cycles through all the 3 groups
        for i = 1, 3 do

                -- if this sobgroup has anyone left then return this as an available target
                if (SobGroup_Empty(target5Groups[i]) == 0) then
                        return i
                end
        end

        -- return -1 which is an invalid number that symbolizes that there is no targets left
        return -1
end

function Rule_CheckInterceptorTargets5()
        --
        -- check each interceptor target - if its dead reassign
        --

        for i = 1, 3 do
                if (SobGroup_Empty(target5Groups[i]) == 1) then
                        local newTarget = Rule_FindNextAvailableTarget5( i );

                        -- no targets left - end this rule!
                        if (newTarget == -1) or (convoy5_docked == 1) then
                                -- end rule
--				SobGroup_MoveToSobGroup( "Convoy5Interceptors1", "EnemyCarrier" )
--                                SobGroup_GuardSobGroup("Convoy5Interceptors1", "EnemyCarrier")          -- Have all remaining Int's guard the Carrier
				SobGroup_ParadeSobGroup("Convoy5Interceptors1", "EnemyCarrier", 0)
--				SobGroup_MoveToSobGroup( "Convoy5Interceptors2", "EnemyCarrier" )
--				SobGroup_GuardSobGroup(Convoy5Interceptors2, "EnemyCarrier")
				SobGroup_ParadeSobGroup("Convoy5Interceptors2", "EnemyCarrier", 0)
				SobGroup_SetROE("Convoy5Interceptors2", OffensiveROE)
					SobGroup_SetStance("Convoy5Interceptors2", AggressiveStance)
--				SobGroup_MoveToSobGroup( Convoy5Interceptors3, "EnemyCarrier" )
--				SobGroup_GuardSobGroup(Convoy5Interceptors3, "EnemyCarrier")
				if ( HW2_IsRunTimeSobGroupAlive( Convoy5Interceptors3 ) == 1) then
					SobGroup_ParadeSobGroup(Convoy5Interceptors3, "EnemyCarrier", 0)
					SobGroup_SetROE(Convoy5Interceptors3, OffensiveROE)
						SobGroup_SetStance("Convoy5Interceptors3", AggressiveStance)
				end
				SobGroup_SetROE("Convoy5Interceptors1", OffensiveROE)
					SobGroup_SetStance("Convoy5Interceptors1", AggressiveStance)
                                Rule_Remove("Rule_CheckInterceptorTargets5")
                                --  and get out of here
                                return
                        end

                        -- give this interceptor a new target
                        target5Groups[i] = target5Groups[newTarget];

                        -- order interceptor to attack this target
                        SobGroup_GuardSobGroup(interceptor5Groups[i], target5Groups[i]);
                end
        end

end
-------------------------------------------------------------------------------------------------












-------------------------------------------------------------------------------------------------
-- Convoy 6: Interceptor guard logic (written by SHELBY)
-------------------------------------------------------------------------------------------------

function Rule_InitializeInterceptor6Targets()

        -- tell each interceptor to attack the associated bomber
        for i = 1, 3 do
                SobGroup_GuardSobGroup(interceptor6Groups[i], target6Groups[i]);
        end

        Rule_AddInterval("Rule_CheckInterceptorTargets6", 3);
        Rule_Remove( "Rule_InitializeInterceptor6Targets" )
end

-- given the interceptor determine what the next target should be
-- this is simply newTarget = mod(target+1,MAX_targets)
function Rule_FindNextAvailableTarget6( )

        -- this 'for' loop cycles through all the 3 groups
        for i = 1, 3 do

                -- if this sobgroup has anyone left then return this as an available target
                if (SobGroup_Empty(target6Groups[i]) == 0) then
                        return i
                end
        end

        -- return -1 which is an invalid number that symbolizes that there is no targets left
        return -1
end

function Rule_CheckInterceptorTargets6()
        --
        -- check each interceptor target - if its dead reassign
        --

        for i = 1, 3 do
                if (SobGroup_Empty(target6Groups[i]) == 1) then
                        local newTarget = Rule_FindNextAvailableTarget6( i );

                        -- no targets left - end this rule!
                        if (newTarget == -1) or (convoy6_docked == 1) then
                                -- end rule
--				SobGroup_MoveToSobGroup( "Convoy6Interceptors1", "EnemyCarrier" )
--                                SobGroup_GuardSobGroup("Convoy6Interceptors1", "EnemyCarrier")          -- Have all remaining Int's guard the Carrier
				SobGroup_ParadeSobGroup("Convoy6Interceptors1", "EnemyCarrier", 0)
                                if ( HW2_IsRunTimeSobGroupAlive( Convoy6Interceptors1 ) == 1 ) then
--					SobGroup_MoveToSobGroup( Convoy6Interceptors1, "EnemyCarrier" )
--					SobGroup_GuardSobGroup(Convoy6Interceptors1, "EnemyCarrier")
					SobGroup_ParadeSobGroup(Convoy6Interceptors1, "EnemyCarrier", 0)
				end
                                if ( HW2_IsRunTimeSobGroupAlive( Convoy6Interceptors3 ) == 1 ) then
--					SobGroup_MoveToSobGroup( Convoy6Interceptors3, "EnemyCarrier" )
--					SobGroup_GuardSobGroup(Convoy6Interceptors3, "EnemyCarrier")
					SobGroup_ParadeSobGroup(Convoy6Interceptors3, "EnemyCarrier", 0)
				end
				SobGroup_SetROE("Convoy6Interceptors1", OffensiveROE)
					SobGroup_SetStance("Convoy6Interceptors1", AggressiveStance)
				SobGroup_SetROE(Convoy6Interceptors1, OffensiveROE)
					SobGroup_SetStance("Convoy6Interceptors1", AggressiveStance)
				SobGroup_SetROE(Convoy6Interceptors3, OffensiveROE)
					SobGroup_SetStance("Convoy6Interceptors3", AggressiveStance)
                                Rule_Remove("Rule_CheckInterceptorTargets6")
                                --  and get out of here
                                return
                        end

                        -- give this interceptor a new target
                        target6Groups[i] = target6Groups[newTarget];

                        -- order interceptor to attack this target
                        SobGroup_GuardSobGroup(interceptor6Groups[i], target6Groups[i]);
                end
        end

end
-------------------------------------------------------------------------------------------------















-------------------------------------------------------------------------------------------------
-- Variety of watches for the convoy attackers
-------------------------------------------------------------------------------------------------
function Rule_ConvoyAttackWatch()

        --
        -- If Convoy ship dies or docks, tell the Bombers that were attacking it to guard the Carrier
        --
        if (convoy1DeadONCE == 0) and ( (SobGroup_Empty ("Convoy_1") == 1) or ( convoy1_docked == 1) ) then             -- If the Convoy ship is dead or docked
		SobGroup_SetROE("Convoy1Bombers1", OffensiveROE)
				SobGroup_SetStance("Convoy1Bombers1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy1Bombers1", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy1Bombers2", OffensiveROE)
				SobGroup_SetStance("Convoy1Bombers2", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy1Bombers2", "EnemyCarrier", 0)
--		SobGroup_ParadeSobGroup("Convoy1Interceptors2", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy1Bombers3", OffensiveROE)
				SobGroup_SetStance("Convoy1Bombers3", AggressiveStance)
                convoy1DeadONCE = 1                                                                                     -- Set the one-time variable so it doesn't happen again
        end
        if (convoy2DeadONCE == 0) and ( (SobGroup_Empty ("Convoy_2") == 1) or ( convoy2_docked == 1) ) then             -- If the Convoy ship is dead or docked
		SobGroup_SetROE("Convoy2Bombers2", OffensiveROE)
				SobGroup_SetStance("Convoy2Bombers2", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy2Bombers2", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy2Interceptors2", OffensiveROE)
				SobGroup_SetStance("Convoy2Interceptors2", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy2Interceptors2", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy2Bombers3", OffensiveROE)
				SobGroup_SetStance("Convoy2Bombers3", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy2Bombers3", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy2Interceptors3", OffensiveROE)
				SobGroup_SetStance("Convoy2Interceptors3", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy2Interceptors3", "EnemyCarrier", 0)
                convoy2DeadONCE = 1                                                                                     -- Set the one-time variable so it doesn't happen again
        end
        if (convoy3DeadONCE == 0) and ( (SobGroup_Empty ("Convoy_3") == 1) or ( convoy3_docked == 1) ) then             -- If the Convoy ship is dead or docked
                convoy3DeadONCE = 1                                                                                     -- Set the one-time variable so it doesn't happen again
		SobGroup_SetROE("Convoy3Bombers1", OffensiveROE)
				SobGroup_SetStance("Convoy3Bombers1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy3Bombers1", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy3Interceptors1", OffensiveROE)
				SobGroup_SetStance("Convoy3Interceptors1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy3Interceptors1", "EnemyCarrier", 0)
                if (HW2_IsRunTimeSobGroupAlive ( Convoy3Bombers2 ) == 1) then
			SobGroup_SetROE(Convoy3Bombers2, OffensiveROE)
				SobGroup_SetStance("Convoy3Bombers2", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy3Bombers2, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy3Interceptors2 ) == 1) then
                if (SobGroup_Empty ( "Convoy3Interceptors2" ) ~= 1) then
			SobGroup_SetROE("Convoy3Interceptors2", OffensiveROE)
				SobGroup_SetStance("Convoy3Interceptors2", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy3Interceptors2", "EnemyCarrier", 0)
                end
                if (HW2_IsRunTimeSobGroupAlive( Convoy3Bombers3 ) == 1) then
			SobGroup_SetROE(Convoy3Bombers3, OffensiveROE)
				SobGroup_SetStance("Convoy3Bombers3", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy3Bombers3, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy3Interceptors3 ) == 1) then
                if (SobGroup_Empty ( "Convoy3Interceptors3" ) ~= 1) then
			SobGroup_SetROE("Convoy3Interceptors3", OffensiveROE)
				SobGroup_SetStance("Convoy3Interceptors3", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy3Interceptors3", "EnemyCarrier", 0)
                end
        end
        if (convoy4DeadONCE == 0) and ( (SobGroup_Empty ("Convoy_4") == 1) or ( convoy4_docked == 1) ) then             -- If the Convoy ship is dead or docked
                convoy4DeadONCE = 1                                                                                     -- Set the one-time variable so it doesn't happen again
		SobGroup_SetROE("Convoy4Bombers1", OffensiveROE)
				SobGroup_SetStance("Convoy4Bombers1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy4Bombers1", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy4Interceptors1", OffensiveROE)
				SobGroup_SetStance("Convoy4Interceptors1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy4Interceptors1", "EnemyCarrier", 0)
                if (HW2_IsRunTimeSobGroupAlive( Convoy4Bombers2 ) == 1) then
			SobGroup_SetROE(Convoy4Bombers2, OffensiveROE)
				SobGroup_SetStance("Convoy4Bombers2", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy4Bombers2, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy4Interceptors2 ) == 1) then
                if (SobGroup_Empty ( "Convoy4Interceptors2" ) ~= 1) then
			SobGroup_SetROE("Convoy4Interceptors2", OffensiveROE)
				SobGroup_SetStance("Convoy4Interceptors2", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy4Interceptors2", "EnemyCarrier", 0)
                end
                if (HW2_IsRunTimeSobGroupAlive( Convoy4Bombers3 ) == 1) then
			SobGroup_SetROE(Convoy4Bombers3, OffensiveROE)
				SobGroup_SetStance("Convoy4Bombers3", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy4Bombers3, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy4Interceptors3 ) == 1) then
                if (SobGroup_Empty ( "Convoy4Interceptors3" ) ~= 1) then
			SobGroup_SetROE("Convoy4Interceptors3", OffensiveROE)
				SobGroup_SetStance("Convoy4Interceptors3", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy4Interceptors3", "EnemyCarrier", 0)
                end
        end
        if (convoy5DeadONCE == 0) and ( (SobGroup_Empty ("Convoy_5") == 1) or ( convoy5_docked == 1) ) then             -- If the Convoy ship is dead or docked
		SobGroup_SetROE("Convoy5Bombers1", OffensiveROE)
				SobGroup_SetStance("Convoy5Bombers1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy5Bombers1", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy5Interceptors1", OffensiveROE)
				SobGroup_SetStance("Convoy5Interceptors1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy5Interceptors1", "EnemyCarrier", 0)
                if (HW2_IsRunTimeSobGroupAlive( Convoy5Bombers2 ) == 1) then
			SobGroup_SetROE(Convoy5Bombers2, OffensiveROE)
				SobGroup_SetStance("Convoy5Bombers2", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy5Bombers2, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy5Interceptors2 ) == 1) then
                if (SobGroup_Empty ( "Convoy5Interceptors2" ) ~= 1) then
			SobGroup_SetROE("Convoy5Interceptors2", OffensiveROE)
				SobGroup_SetStance("Convoy5Interceptors2", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy5Interceptors2", "EnemyCarrier", 0)
                end
                if (HW2_IsRunTimeSobGroupAlive( Convoy5Bombers3 ) == 1) then
			SobGroup_SetROE(Convoy5Bombers3, OffensiveROE)
				SobGroup_SetStance("Convoy5Bombers3", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy5Bombers3, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy5Interceptors3 ) == 1) then
                if (SobGroup_Empty ( "Convoy5Interceptors3" ) ~= 1) then
			SobGroup_SetROE("Convoy5Interceptors3", OffensiveROE)
				SobGroup_SetStance("Convoy5Interceptors3", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy5Interceptors3", "EnemyCarrier", 0)
                end
                convoy5DeadONCE = 1                                                                                     -- Set the one-time variable so it doesn't happen again
        end
        if (convoy6DeadONCE == 0) and ( (SobGroup_Empty ("Convoy_6") == 1) or ( convoy6_docked == 1) ) then             -- If the Convoy ship is dead or docked
		SobGroup_SetROE("Convoy6Bombers1", OffensiveROE)
				SobGroup_SetStance("Convoy6Bombers1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy6Bombers1", "EnemyCarrier", 0)
		SobGroup_SetROE("Convoy6Interceptors1", OffensiveROE)
				SobGroup_SetStance("Convoy6Interceptors1", AggressiveStance)
		SobGroup_ParadeSobGroup("Convoy6Interceptors1", "EnemyCarrier", 0)
                if (HW2_IsRunTimeSobGroupAlive( Convoy6Bombers2 ) == 1) then
			SobGroup_SetROE(Convoy6Bombers2, OffensiveROE)
				SobGroup_SetStance("Convoy6Bombers2", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy6Bombers2, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy6Interceptors2 ) == 1) then
                if (SobGroup_Empty ( "Convoy6Interceptors2" ) ~= 1) then
			SobGroup_SetROE("Convoy6Interceptors2", OffensiveROE)
				SobGroup_SetStance("Convoy6Interceptors2", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy6Interceptors2", "EnemyCarrier", 0)
                end
                if (HW2_IsRunTimeSobGroupAlive( Convoy6Bombers3 ) == 1) then
			SobGroup_SetROE(Convoy6Bombers3, OffensiveROE)
				SobGroup_SetStance("Convoy6Bombers3", AggressiveStance)
			SobGroup_ParadeSobGroup(Convoy6Bombers3, "EnemyCarrier", 0)
                end
--                if (HW2_IsRunTimeSobGroupAlive( Convoy6Interceptors3 ) == 1) then
                if (SobGroup_Empty ( "Convoy6Interceptors3" ) ~= 1) then
			SobGroup_SetROE("Convoy6Interceptors3", OffensiveROE)
				SobGroup_SetStance("Convoy6Interceptors3", AggressiveStance)
			SobGroup_ParadeSobGroup("Convoy6Interceptors3", "EnemyCarrier", 0)
                end
                convoy6DeadONCE = 1                                                                                     -- Set the one-time variable so it doesn't happen again
        end

        --
        -- If 'small' attack groups die, spawn reinforcements & do setup (guard orders, attack convoys, etc.)
        --
        -- Convoy 3 reinforcements
        if (convoy3ReinforceONCE == 0) and
	   ( SobGroup_Empty ("Convoy3Bombers1") == 1) and                                                       -- small group of bombers die
           ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15 ) then           -- subsystem health is > x%

--~ 		-- lock Fighter Facility health
--~ 		getFighterFacilityHealthONCE = 0
--~ 		Rule_Add ("Rule_lockFighterFacilityHealth")
--~ 		
--~ 		-- removes lock on Fighter Facilty health after giving reinforcements enough time to launch (very confusing)
--~ 		if ( Convoy3Interceptors2Alive == 1) or ( Convoy3Interceptors3Alive == 1)	then	-- if either of the reactive squads is alive
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 30)			-- keep the lock on for <x> seconds
--~ 		else															-- otherwise
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 16)			-- <x> seconds is enough
--~ 		end

		-- runtime-created Bomber groups
                Convoy3Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")                             -- spawn reinforcements
                Convoy3Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")
		
		-- reactive fleet Interceptor groups (very confusing)
--                Convoy3Interceptors2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
--                Convoy3Interceptors3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
		if ( Convoy3Interceptors2Alive == 1) then
			SobGroup_Launch("Convoy3Interceptors2", "EnemyCarrier" )						-- launch reinforcements
		end
		if ( Convoy3Interceptors3Alive == 1) then
			SobGroup_Launch("Convoy3Interceptors3", "EnemyCarrier" )						-- launch reinforcements
		end
                convoy3ReinforceONCE = 1                                                                                                -- set the one-time variable

                Rule_AddInterval("Rule_Convoy3Setup", 8 )
        end
        -- Convoy 4 reinforcements
        if (convoy4ReinforceONCE == 0) and
	   ( SobGroup_Empty ("Convoy4Bombers1") == 1) and                                                       -- small group of bombers die
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15 ) then           -- subsystem health is > 10%

--~ 		-- lock Fighter Facility health
--~ 		getFighterFacilityHealthONCE = 0
--~ 		Rule_Add ("Rule_lockFighterFacilityHealth")
--~ 		
--~ 		-- removes lock on Fighter Facilty health after giving reinforcements enough time to launch (very confusing)
--~ 		if ( Convoy4Interceptors2Alive == 1) or ( Convoy4Interceptors3Alive == 1)	then	-- if either of the reactive squads is alive
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 30)			-- keep the lock on for <x> seconds
--~ 		else															-- otherwise
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 16)			-- <x> seconds is enough
--~ 		end

		-- runtime-created Bomber groups
                Convoy4Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")                             -- spawn reinforcements
                Convoy4Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")

		-- reactive fleet Interceptor groups (very confusing)
--                Convoy4Interceptors2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
--                Convoy4Interceptors3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
		if ( Convoy4Interceptors2Alive == 1) then
			SobGroup_Launch("Convoy4Interceptors2", "EnemyCarrier" )						-- launch reinforcements
		end
		if ( Convoy4Interceptors3Alive == 1) then
			SobGroup_Launch("Convoy4Interceptors3", "EnemyCarrier" )						-- launch reinforcements
		end
                convoy4ReinforceONCE = 1                                                                                                -- set the one-time variable

                Rule_AddInterval("Rule_Convoy4Setup", 8 )
        end
        -- Convoy 5 reinforcements
        if (convoy5ReinforceONCE == 0) and
	   ( SobGroup_Empty ("Convoy5Bombers1") == 1) and                                                       -- small group of bombers die
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15 ) then           -- subsystem health is > 10%

--~ 		-- lock Fighter Facility health
--~ 		getFighterFacilityHealthONCE = 0
--~ 		Rule_Add ("Rule_lockFighterFacilityHealth")
--~ 		
--~ 		-- removes lock on Fighter Facilty health after giving reinforcements enough time to launch (very confusing)
--~ 		if ( Convoy5Interceptors2Alive == 1) or ( Convoy5Interceptors3Alive == 1)	then	-- if either of the reactive squads is alive
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 30)			-- keep the lock on for <x> seconds
--~ 		else															-- otherwise
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 16)			-- <x> seconds is enough
--~ 		end

		-- runtime-created Bomber groups
		Convoy5Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")                             -- spawn reinforcements
                Convoy5Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")

		
		-- reactive fleet Interceptor groups (very confusing)
--                Convoy5Interceptors2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
--                Convoy5Interceptors3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
		if ( Convoy5Interceptors2Alive == 1) then
			SobGroup_Launch("Convoy5Interceptors2", "EnemyCarrier" )						-- launch reinforcements
		end
		if ( Convoy5Interceptors3Alive == 1) then
			SobGroup_Launch("Convoy5Interceptors3", "EnemyCarrier" )						-- launch reinforcements
		end
		
                convoy5ReinforceONCE = 1                                                                                                -- set the one-time variable

                Rule_AddInterval("Rule_Convoy5Setup", 8 )
        end
        -- Convoy 6 reinforcements
        if (convoy6ReinforceONCE == 0) and
	   ( SobGroup_Empty ("Convoy6Bombers1") == 1) and                                                       -- small group of bombers die
	   ( SobGroup_GetHardPointHealth("EnemyCarrier", "Production 1") > 0.15 ) then           -- subsystem health is > 10%

--~ 		-- lock Fighter Facility health
--~ 		getFighterFacilityHealthONCE = 0
--~ 		Rule_Add ("Rule_lockFighterFacilityHealth")
--~ 		
--~ 		-- removes lock on Fighter Facilty health after giving reinforcements enough time to launch (very confusing)
--~ 		if ( Convoy6Interceptors2Alive == 1) or ( Convoy6Interceptors3Alive == 1)	then	-- if either of the reactive squads is alive
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 30)			-- keep the lock on for <x> seconds
--~ 		else															-- otherwise
--~ 			Rule_AddInterval ("Rule_lockFighterFacilityHealth", 16)			-- <x> seconds is enough
--~ 		end

		-- runtime-created Bomber groups
                Convoy6Bombers2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")                         -- spawn reinforcements
                Convoy6Bombers3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Bomber")


		-- reactive fleet Interceptor groups (very confusing)
--                Convoy6Interceptors2 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
--                Convoy6Interceptors3 = SobGroup_CreateShip("EnemyCarrier", "Vgr_Interceptor")
		if ( Convoy6Interceptors2Alive == 1) then
			SobGroup_Launch("Convoy6Interceptors2", "EnemyCarrier" )						-- launch reinforcements
		end
		if ( Convoy6Interceptors3Alive == 1) then
			SobGroup_Launch("Convoy6Interceptors3", "EnemyCarrier" )						-- launch reinforcements
		end


                convoy6ReinforceONCE = 1                                                                                                -- set the one-time variable

                Rule_AddInterval("Rule_Convoy6Setup", 8 )
        end



end


function Rule_Convoy3Setup()
        -- Convoy 3: Interceptors guard Bombers
        SobGroup_GuardSobGroup("Convoy3Interceptors2", Convoy3Bombers2)
        SobGroup_GuardSobGroup("Convoy3Interceptors3", Convoy3Bombers3)

        -- Convoy 3: Bombers attack convoys
        SobGroup_Attack( 1, Convoy3Bombers2, "Convoy_3" )                               -- attack the Convoy_3 ship
        SobGroup_Attack( 1, Convoy3Bombers3, "Convoy_3" )                               -- attack the Convoy_3 ship

        convoy3Reinforcements = 1
        interceptor3Groups = {"Convoy3Interceptors1","Convoy3Interceptors2","Convoy3Interceptors3"};
        target3Groups = {"Convoy3Bombers1",Convoy3Bombers2,Convoy3Bombers3};
        Rule_Add ("Rule_InitializeInterceptor3Targets")
        Rule_Add ("Rule_FindNextAvailableTarget3")

        Rule_Remove ("Rule_Convoy3Setup")

end

function Rule_Convoy4Setup()
        -- Convoy 4: Interceptors guard Bombers
        SobGroup_GuardSobGroup("Convoy4Interceptors2", Convoy4Bombers2)
        SobGroup_GuardSobGroup("Convoy4Interceptors3", Convoy4Bombers3)

        -- Convoy 4: Bombers attack convoys
        SobGroup_Attack( 1, Convoy4Bombers2, "Convoy_4" )                               -- attack the Convoy_3 ship
        SobGroup_Attack( 1, Convoy4Bombers3, "Convoy_4" )                               -- attack the Convoy_3 ship

        convoy4Reinforcements = 1
        interceptor4Groups = {"Convoy4Interceptors1","Convoy4Interceptors2","Convoy4Interceptors3"};
        target4Groups = {"Convoy4Bombers1",Convoy4Bombers2,Convoy4Bombers3};
        Rule_Add ("Rule_InitializeInterceptor4Targets")
        Rule_Add ("Rule_FindNextAvailableTarget4")

        Rule_Remove ("Rule_Convoy4Setup")

end

function Rule_Convoy5Setup()
--        print ("doing convoy 5 setup!!!!!!!!!!!!!!!!!!!")
        -- Convoy 5: Interceptors guard Bombers
        SobGroup_GuardSobGroup("Convoy5Interceptors2", Convoy5Bombers2)
        SobGroup_GuardSobGroup("Convoy5Interceptors3", Convoy5Bombers3)

        -- Convoy 5: Bombers attack convoys
        SobGroup_Attack( 1, Convoy5Bombers2, "Convoy_5" )                               -- attack the Convoy_3 ship
        SobGroup_Attack( 1, Convoy5Bombers3, "Convoy_5" )                               -- attack the Convoy_3 ship

        convoy5Reinforcements = 1
        interceptor5Groups = {"Convoy5Interceptors1","Convoy5Interceptors2","Convoy5Interceptors3"};
        target5Groups = {"Convoy5Bombers1",Convoy5Bombers2,Convoy5Bombers3};
        Rule_Add ("Rule_InitializeInterceptor5Targets")
        Rule_Add ("Rule_FindNextAvailableTarget5")

        Rule_Remove ("Rule_Convoy5Setup")

end

function Rule_Convoy6Setup()
        -- Convoy 6: Interceptors guard Bombers
        SobGroup_GuardSobGroup("Convoy6Interceptors2", Convoy6Bombers2)
        SobGroup_GuardSobGroup("Convoy6Interceptors3", Convoy6Bombers3)

        -- Convoy 6: Bombers attack convoys
        SobGroup_Attack( 1, Convoy6Bombers2, "Convoy_6" )                               -- attack the Convoy_3 ship
        SobGroup_Attack( 1, Convoy6Bombers3, "Convoy_6" )                               -- attack the Convoy_3 ship

        convoy6Reinforcements = 1
        interceptor6Groups = {"Convoy6Interceptors1","Convoy6Interceptors2","Convoy6Interceptors3"};
        target6Groups = {"Convoy6Bombers1",Convoy6Bombers2,Convoy6Bombers3};
        Rule_Add ("Rule_InitializeInterceptor6Targets")
        Rule_Add ("Rule_FindNextAvailableTarget6")

        Rule_Remove ("Rule_Convoy6Setup")

end
-------------------------------------------------------------------------------------------------



-- used for the end of the mission - watches to see if Carrier dies, so ships that are hanging around don't just sit idly
function Rule_convoyAttackerEndWatch()
	if ( SobGroup_Empty ("EnemyCarrier") == 1) then						-- if Carrier is dead
		if ( convoy1_docked == 1) or ( convoy1DestroyedONCE ==1 ) then		-- and transport X has docked or is dead
			for i = 1, 3 do
				if ( SobGroup_Empty ("Convoy1Bombers"..i) == 0) then		-- if attackers are alive
					SobGroup_AttackPlayer( "Convoy1Bombers"..i, 0)			-- tell them to attack the player
				end
			end
		end

		if ( convoy2_docked == 1) or ( convoy2DestroyedONCE ==1 ) then		-- and transport X has docked or is dead
--			for i = 1, 2 do
				if ( SobGroup_Empty ("Convoy2Bombers2") == 0) then		-- if attackers are alive
					SobGroup_AttackPlayer( "Convoy2Bombers2", 0)			-- tell them to attack the player
				end
--			end
			if ( SobGroup_Empty ("Convoy2Interceptors2") == 0) then		-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy2Interceptors2", 0)			-- tell them to attack the player
			end
		end
		

		if ( convoy3_docked == 1) or ( convoy3DestroyedONCE ==1 ) then			-- and transport X has docked or is dead
			if ( SobGroup_Empty ("Convoy3Bombers1") == 0) then				-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy3Bombers1", 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy3Bombers2 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy3Bombers2, 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy3Bombers3 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy3Bombers3, 0)					-- tell them to attack the player
			end
			if ( SobGroup_Empty ("Convoy3Interceptors1") == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy3Interceptors1", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy3Interceptors2" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy3Interceptors2", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy3Interceptors3" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy3Interceptors3", 0)				-- tell them to attack the player
			end
		end

		if ( convoy4_docked == 1) or ( convoy4DestroyedONCE ==1 ) then			-- and transport X has docked or is dead
			if ( SobGroup_Empty ("Convoy4Bombers1") == 0) then				-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy4Bombers1", 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy4Bombers2 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy4Bombers2, 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy4Bombers3 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy4Bombers3, 0)					-- tell them to attack the player
			end
			if ( SobGroup_Empty ("Convoy4Interceptors1") == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy4Interceptors1", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy4Interceptors2" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy4Interceptors2", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy4Interceptors3" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy4Interceptors3", 0)				-- tell them to attack the player
			end
		end

		if ( convoy5_docked == 1) or ( convoy5DestroyedONCE ==1 ) then			-- and transport X has docked or is dead
			if ( SobGroup_Empty ("Convoy5Bombers1") == 0) then				-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy5Bombers1", 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy5Bombers2 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy5Bombers2, 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy5Bombers3 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy5Bombers3, 0)					-- tell them to attack the player
			end
			if ( SobGroup_Empty ("Convoy5Interceptors1") == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy5Interceptors1", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy5Interceptors2" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy5Interceptors2", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy5Interceptors3" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy5Interceptors3", 0)				-- tell them to attack the player
			end
		end


		if ( convoy6_docked == 1) or ( convoy6DestroyedONCE ==1 ) then			-- and transport X has docked or is dead
			if ( SobGroup_Empty ("Convoy6Bombers1") == 0) then				-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy6Bombers1", 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy6Bombers2 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy6Bombers2, 0)					-- tell them to attack the player
			end
			if ( HW2_IsRunTimeSobGroupAlive( Convoy6Bombers3 ) == 1) then		-- if attackers are alive
				SobGroup_AttackPlayer( Convoy6Bombers3, 0)					-- tell them to attack the player
			end
			if ( SobGroup_Empty ("Convoy6Interceptors1") == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy6Interceptors1", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy6Interceptors2" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy6Interceptors2", 0)				-- tell them to attack the player
			end
			if ( SobGroup_Empty ( "Convoy6Interceptors3" ) == 0) then			-- if attackers are alive
				SobGroup_AttackPlayer( "Convoy6Interceptors3", 0)				-- tell them to attack the player
			end
		end

		
	end
end
	
		


-------------------------------------------------------------------------------------------------
-- Frigate Reinforcements
-------------------------------------------------------------------------------------------------

-- watch for the right time to hyperspace in the Frigate attack group
function Rule_callInTheFrigates()
--        print( "callInTheFrigates: "..callInTheFrigates )
--        if ( callInTheFrigates == 1) and ( callInTheFrigatesONCE == 0)  then            -- if it's time to call in the frigates (variable set by timer after intel event of Bomber reinforcements)
--        if ( Universe_GameTime() >= g_now_time + 10 ) then

        -- if the player has saved x convoys or the Vaygr Carrier's health is less than 70%
        if ( convoys_saved == 3 ) or ( convoys_docked == 3) or ( SobGroup_HealthPercentage("EnemyCarrier") < 0.7) then
                Rule_AddInterval("Rule_frigateHyperspaceIn", 10)                -- call function to hyperspace in the Frigates
                Rule_Remove ("Rule_callInTheFrigates")
        end
end

-- hyperspace in Frigate attack group
function Rule_frigateHyperspaceIn()

	if (EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		-- hyperspace in the Frigate attack group
--		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackers", "EnemyCarrier", 1500 )
--		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS1", "EnemyCarrier", 1500 )
--		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS2", "EnemyCarrier", 1500 )

        -- determine which convoy ship to hyperspace in next to
        if ( SobGroup_Empty ("Convoy_4") == 0) and ( convoy4SavedONCE == 0) and (convoy4_docked == 0 ) then  -- if convoy 4 is still alive and hasn't been saved and hasn't docked
                print ("telling Frigates to hyperspace in next to Convoy 4!!!!!!!")
		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS1", "Convoy_4", 1500 )
		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS2", "Convoy_4", 1500 )
                frigatesAttackingConvoy4 = 1
	elseif ( SobGroup_Empty ("Convoy_5") == 0) and ( convoy5SavedONCE == 0) and (convoy5_docked == 0 ) then      -- if convoy 5 is still alive and hasn't been saved and hasn't docked
                print ("telling Frigates to hyperspace in next to Convoy 5!!!!!!!")
		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS1", "Convoy_5", 1500 )
		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS2", "Convoy_5", 1500 )
                frigatesAttackingConvoy5 = 1
	elseif ( SobGroup_Empty ("Convoy_6") == 0) and ( convoy6SavedONCE == 0) and (convoy6_docked == 0 ) then  -- if convoy 6 is still alive and hasn't been saved and hasn't docked
                print ("telling Frigates to hyperspace in next to Convoy 6!!!!!!!")
		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS1", "Convoy_6", 1500 )
		SobGroup_ExitHyperSpaceSobGroup("FrigateAttackersHS2", "Convoy_6", 1500 )
                frigatesAttackingConvoy6 = 1
        end

		
	--        callInTheFrigates = 1                                                   -- set variable so the events know when to trigger
		Rule_Add("Rule_intelevent_frigateAttack")		-- Hyperspace entry detected. / The Vaygr are using Frigates to attack the transports.
		
		-- begin the attack in <x> seconds
		Rule_AddInterval("Rule_frigateAttack", 1 )
	
		Rule_Remove ("Rule_frigateHyperspaceIn")
	end
end

-- attack logic for deciding which convoy ship to attack
function Rule_frigateAttack()
        print (" = = = = = in frigateAttack function = = = = = =")
	SobGroup_SetROE("FrigateAttackers", OffensiveROE)                                              -- Set his tactics to passive so he doesn't start auto-retaliating
		SobGroup_SetStance("FrigateAttackers", AggressiveStance)

        -- determine which convoy ship to attack
	if ( frigatesAttackingConvoy6 == 1 ) then						-- if frigates decided to hyperspace in next to convoy 6
                print ("telling Frigates to attack Convoy 6!!!!!!!")
                SobGroup_Attack( 1, "FrigateAttackers", "Convoy_6" )                            -- attack the Convoy_6 ship
		Rule_AddInterval ("AssFrigGuardFrigateAttackers", 20)
                frigatesAttackingConvoy6 = 1
	elseif ( frigatesAttackingConvoy5 == 1 ) then						-- if frigates decided to hyperspace in next to convoy 5
                print ("telling Frigates to attack Convoy 5!!!!!!!")
                SobGroup_Attack( 1, "FrigateAttackers", "Convoy_5" )			-- attack the Convoy_5 ship
		Rule_AddInterval ("AssFrigGuardFrigateAttackers", 20)
                frigatesAttackingConvoy5 = 1
	elseif ( frigatesAttackingConvoy4 == 1 ) then						-- if frigates decided to hyperspace in next to convoy 4
                print ("telling Frigates to attack Convoy 4!!!!!!!")
                SobGroup_Attack( 1, "FrigateAttackers", "Convoy_4" )                            -- attack the Convoy_4 ship
		Rule_AddInterval ("AssFrigGuardFrigateAttackers", 20)
                frigatesAttackingConvoy4 = 1
        else                                                                                                                                            -- otherwise, guard the Carrier
                SobGroup_GuardSobGroup("FrigateAttackers", "EnemyCarrier")              -- tell Frigates to guard the Vgr Carrier
--              SobGroup_Attack( 2, "FrigateAttackers", "MelarnFleet" )                         -- attack Melarn's fleet
        end

        -- set up a rule to start attacking Melarn's fleet once they're attacking FrigateAttackers
	Rule_AddInterval("Rule_retaliateAgainstMelarn", 4 )

	-- Watch for right conditions to call in Melarn and company
	Rule_AddInterval("Rule_callInMelarn", 3)

        -- start timer telling Melarn's fleet to come in
	Timer_Start("callInMelarnTIMER", 120)								-- start a timer to attack remaining convoys

	Rule_Remove ("Rule_frigateAttack")
end


function AssFrigGuardFrigateAttackers()
	SobGroup_GuardSobGroup( "FrigateGuard", "FrigateAttackersToGuard")	-- tell Ass Frig to guard FrigateAttackers
	Rule_Remove ("AssFrigGuardFrigateAttackers")
end


-- attack Melarn's fleet (who is by this time attacking us)
function Rule_retaliateAgainstMelarn()
	-- if Melarn's guys are attacking the Vaygr Frigates, start attacking them back!
	if ( NIS02BCompleted == 1) and ( SobGroup_FillProximitySobGroup("tempSobGroup","MelarnFleet", "FrigateAttackers", 6000) == 1) then
		SobGroup_FillShipsByType( "tempSobGroup", "Player_Ships3", "Hgn_TorpedoFrigate" )		-- filter for Soban's Torpedo Frigates and put in SobGroup
		SobGroup_Attack( 1, "FrigateAttackers", "tempSobGroup" )				-- attack only the Torpedo Frigates
		frigatesAttackingMelarnFleet = 1
--		Rule_AddInterval ("AssFrigGuardFrigateAttackers", 10)
		Rule_Remove ("Rule_retaliateAgainstMelarn")
	end

end

-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Melarn's fleet
-------------------------------------------------------------------------------------------------

-- logic to determine when to play the Melarn arrival NIS
function Rule_callInMelarn()
	if ( ( Timer_GetRemaining("callInMelarnTIMER") < 1) or			-- if timer is up
	   ( convoys_destroyed == 2 ) or							-- or two transports have been killed
	   ( convoys_docked == 3 ) or								-- or three transports have docked
	   ( SobGroup_HealthPercentage("EnemyCarrier") < 0.5 ) or		-- or the Carrier's health is too low
	   ( SobGroup_Count ("FrigateAttackers") < 4 ) or				-- or if the Frigate Attackers have lost 1 Frigates
	   ( ( frigatesAttackingConvoy6 == 1) and ( SobGroup_HealthPercentage("Convoy_6") < 0.5 ) ) or	-- if the Convoy being attacked by the Frigates is down to 50% health
	   ( ( frigatesAttackingConvoy5 == 1) and ( SobGroup_HealthPercentage("Convoy_5") < 0.5 ) ) or	-- if the Convoy being attacked by the Frigates is down to 50% health
	   ( ( frigatesAttackingConvoy4 == 1) and ( SobGroup_HealthPercentage("Convoy_4") < 0.5 ) ) ) then
		Rule_Add ("Rule_callInMelarn2")
		Rule_Remove ("Rule_callInMelarn")
	end
end


-- plays "Melarn is on his way" event before NIS starts
function Rule_callInMelarn2()
	if (EventPlaying == 0) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_MelarnIsComing" )
		Rule_AddInterval ("Rule_callInMelarn3", 1)
		Rule_Remove ("Rule_callInMelarn2")
	end
end


-- checks if the player is in the SM and takes them out if they are
function Rule_callInMelarn3()
	if (EventPlaying == 0) and ( MelarnIsComingEventFinished == 1) then
		if ( Sensors_ManagerIsUp() == 1) then			-- if the player is in the SM
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_Toggle( 0 )						-- take them out
			Sensors_EnableToggle(0)									-- Disallow going in and out of the Sensors Manager
			Rule_AddInterval ("Rule_callInMelarn4", 1)
			Rule_Remove ("Rule_callInMelarn3")
		else
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_EnableToggle(0)									-- Disallow going in and out of the Sensors Manager
			Rule_Add ("Rule_callInMelarn4")
			Rule_Remove ("Rule_callInMelarn3")
		end
	end
end


function Rule_callInMelarn4()
	NIS02B_Playing = 1
	Camera_SetLetterboxStateNoUI(1, 3 )
	print ("trying to bring down letterbox bars!!!!!!!!!!!!!!!!!!!!!!!!!!")
	Rule_AddInterval ("Rule_playMelarnArrivalNIS",4)	-- wait 1 second after LBX bars are down to start NIS
	Rule_Remove ("Rule_callInMelarn4")
end




function Rule_playMelarnArrivalNIS()
	-- alliances
        SetAlliance( 0, 3 )                                                     -- Set alliance between player and Melarn's ships (player 3)
        SetAlliance( 3, 0 )
        SetAlliance( 0, 4 )                                                     -- Set alliance between player and Melarn himself (player 4)
        SetAlliance( 4, 0 )
        SetAlliance( 3, 4 )                                                     -- Set alliance between Melarn himself and his own fleet (!)
        SetAlliance( 4, 3 )
--	SetAlliance( 3, 2 )                                                     -- Set alliance between Melarn's fleet and the Convoys
--	SetAlliance( 2, 3 )
--	SetAlliance( 4, 2 )                                                     -- Set alliance between Melarn himself and the Convoys
--	SetAlliance( 2, 4 )


	
	print ("playing nis!!!!!")

        NISLoad( "nis/NIS02B" )                                         -- load the NIS
	

	SobGroup_SetInvulnerability( "Player_Ships0", 1 )				-- set all player ships to invulnerable while the NIS plays
	if ( frigatesAttackingConvoy6 == 1) then
		k_currentNISPlaying_id = NISPlayFromGroup( "nis/NIS02B", "Convoy_6" )        -- play the NIS around the convoy
	elseif ( frigatesAttackingConvoy5 == 1) then
		k_currentNISPlaying_id = NISPlayFromGroup( "nis/NIS02B", "Convoy_5" )        -- play the NIS around the convoy
	elseif ( frigatesAttackingConvoy4 == 1) then
		k_currentNISPlaying_id = NISPlayFromGroup( "nis/NIS02B", "Convoy_4" )       -- play the NIS around the convoy
	end


        Rule_Add ("Rule_watchForNIS02BDone")
	
	Rule_Remove ("Rule_playMelarnArrivalNIS")
end


-- watch for the NIS to be complete so you can tell melarn & co to attack
function Rule_watchForNIS02BDone()
        if ( NISComplete( k_currentNISPlaying_id ) == 1 ) then
		print ("NIS has completed!!")
		NIS02BCompleted = 1
		Sensors_EnableToggle(1)									-- Allow going in and out of the Sensors Manager
		SobGroup_SetInvulnerability( "Player_Ships0", 0 )				-- turn off invulnerability
--		Camera_SetLetterboxStateNoUI(0, 3 )
		Rule_Add ("Rule_PlayBattleMusic")
		Rule_AddInterval ("Rule_turnUIBackOn", 1)
		Rule_AddInterval ("Rule_melarnSetup", 1)
		Rule_AddInterval ("Rule_intelevent_WithHelpOfMelarn", 4)
		Rule_Remove( "Rule_watchForNIS02BDone" )
        end
end

function Rule_turnUIBackOn()
	Camera_SetLetterboxStateNoUI(0, 0 )
	Rule_Remove ("Rule_turnUIBackOn")
end

function Rule_intelevent_WithHelpOfMelarn()
	print ("Trying to play event WithHelpOfMelarn!!!!!!")
--	if (EventPlaying == 0) then						-- removed because this speech event has to happen after NIS
		print ("playing event WithHelpOfMelarn!!!!!!")
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_WithHelpOfMelarn")
		Rule_AddInterval ("Rule_intelevent_frigatesDestroyed", 4)
		Rule_Remove ("Rule_intelevent_WithHelpOfMelarn")
--	end
end


-- let the player know when the Vaygr Frigates have been destroyed
function Rule_intelevent_frigatesDestroyed()
	if ( EventPlaying == 0) and ( SobGroup_Empty ("FrigateAttackers") == 1) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_frigatesDestroyed")
		Rule_Remove ("Rule_intelevent_frigatesDestroyed")
	end
end


-- do a bunch of setup on the ships that have just arrived from the NIS
function Rule_melarnSetup()

	print ("Doing melarn set-up!")
	-- Set player names for Melarn and his fleet
        Player_SetPlayerName(3, "$40008")
        Player_SetPlayerName(4, "$40009")

	-- Give Melarn's Frigates some health upgrades so they last a bit longer
--	Player_GrantResearchOption( 3, "TorpedoFrigateHealthUpgrade3" )
--	Player_GrantResearchOption( 3, "IonCannonFrigateHealthUpgrade3" )

	-- tactics
        SobGroup_SetROE("MelarnSoban", PassiveROE)                                              -- Set his tactics to passive so he doesn't start auto-retaliating
        SobGroup_SetROE("MelarnFleet", PassiveROE)                                              -- Set their tactics to passive so they doesn't start auto-retaliating

	SobGroup_FillUnion( "MelarnFleetAll", "MelarnSoban", "MelarnFleet" )					-- Create a sob group that contains Melarn and his fleet (used later for forming a Strike Group before he hyperspaces out)
	
        FOW_RevealGroup("MelarnFleet", 1)                               -- Reveal fog of war for all of Melarn's ships
        FOW_RevealGroup("MelarnSoban", 1)                               -- Reveal fog of war for all of Melarn's ships

	
	-- check whether melarn is damaged
	Rule_AddInterval ("Rule_intelevent_melarnDamaged", 3)							-- start checking to see whether Melarn has been damaged
	Rule_AddInterval ("Rule_intelevent_melarnCriticallyDamaged", 4)


	-- Keep melarn alive
        Rule_AddInterval ("Rule_melarnSetHealth", 2)

	-- tell melarn to attack the Vgr Frigates
        Rule_AddInterval("Rule_melarnAttack", 1)

        Rule_Remove ("Rule_melarnSetup")
end


-- attack logic for deciding what Melarn's fleet should attack
function Rule_melarnAttack()
        SobGroup_Attack( 3, "MelarnFleet", "FrigateAttackers" )         -- attack the Frigate attackers
        SobGroup_SetROE("MelarnFleet", DefensiveROE)                    -- Set tactics back to normal

	SobGroup_Attack( 4, "MelarnSoban", "FrigateAttackers" )         -- attack the Frigate attackers
--        SobGroup_GuardSobGroup("MelarnSoban", "MelarnFleet")                    -- have Melarn guard his fleet so he moves with it
        SobGroup_SetROE("MelarnSoban", DefensiveROE)                    -- Set tactics back to normal
--      SobGroup_MoveToSobGroup( 3, "MelarnSoban", "EnemyCarrier" )     -- tell Melarn to move to the enemy Frigates just for looks

        Rule_AddInterval ("Rule_melarnAttackWatch", 3)             -- go into a watch state to watch for the Frigates dying
        print ("going into melarnAttackWatch")
        Rule_Remove ("Rule_melarnAttack")
end

-- watch for Frigates to die, then go attack the Carrier
function Rule_melarnAttackWatch()
        if ( SobGroup_Empty ("FrigateAttackers") == 1) then
--                Ping_Remove( ping_melarnSoban_id )
                SobGroup_Attack( 4, "MelarnSoban", "EnemyCarrier" )		-- attack the Vaygr Carrier
                SobGroup_Attack( 3, "MelarnFleet", "EnemyCarrier" )		-- attack the Vaygr Carrier
		Rule_AddInterval ("Rule_melarnAttackWatch2_CaptainSoban", 4)-- special watch state for Captain Soban
		Rule_AddInterval ("Rule_melarnAttackWatch3_CaptainSoban", 3)-- special watch state for Captain Soban
		Rule_Add ("Rule_melarnAttackWatch2")             			-- go into a watch state to watch for Enemy Carrier dying
                Rule_Remove ("Rule_melarnAttackWatch")
        end
end


-- if Soban is within range of the Carrier, and is being attacked by Bombers, kill them!
function Rule_melarnAttackWatch2_CaptainSoban()
	if (MelarnAttacking == 0) and ( SobGroup_UnderAttack( "MelarnSoban" ) == 1) then					-- if Melarn is being attacked
		print ("Melarn is under attack!!")
		SobGroup_GetAttackers( "MelarnSoban", "AttackingMelarn")			-- put Melarn's attackers into a SobGroup
		SobGroup_FillShipsByType( "BombersAttackingMelarn", "AttackingMelarn", "Vgr_Bomber" )	-- filter all Bombers
		if (MelarnAttacking == 0) and ( SobGroup_Empty("BombersAttackingMelarn") == 0 ) then	-- if there are Bombers attacking
			MelarnAttacking = 1
			print ("Melarn Attacking Bombers!")
			SobGroup_Attack( 4, "MelarnSoban", "BombersAttackingMelarn" )		-- attack the Bombers
		end
        end
end

-- if Bombers are dead, go back to attacking Carrier
function Rule_melarnAttackWatch3_CaptainSoban()
	if (MelarnAttacking == 1) and ( SobGroup_Empty( "BombersAttackingMelarn" ) == 0) then	-- if the Bombers are dead
		print ("Melarn has killed all the Bombers, going back to attacking the Carrier!")
		SobGroup_Attack( 4, "MelarnSoban", "EnemyCarrier")									-- attack the Carrier
		MelarnAttacking = 0
        end
end



-- if enemy Carrier dies, go guard the player's Mothership
function Rule_melarnAttackWatch2()
        if ( SobGroup_Empty ("EnemyCarrier") == 1) then
		SobGroup_GuardSobGroup("MelarnSoban", "PlayerMothership")	-- have Melarn guard the player's MS
		SobGroup_GuardSobGroup("MelarnFleet", "PlayerMothership")	-- have Melarn's fleet guard the player's MS
                Rule_Remove ("Rule_melarnAttackWatch2")
        end
end


-- watch for Melarn to finish yapping and hyperspace him and his merry band of Sobani out of here
function Rule_melarnHyperspaceOut()
        if ( tellMelarnToHyperspaceOut == 1) then
                SobGroup_EnterHyperSpaceOffMap("MelarnSoban")                  -- tell the Melarn to hyperspace out
                SobGroup_EnterHyperSpaceOffMap("MelarnFleet")                  -- tell the Melarn's fleet to hyperspace out

                Rule_Remove ("Rule_melarnHyperspaceOut")
                Rule_Remove ("Rule_melarnAttackWatch2")
        end
end



-- keep Melarn's health up if he's dying to allow the player to save him
function Rule_melarnSetHealth()

        if (SobGroup_HealthPercentage("MelarnSoban") <= 0.15 ) and (melarnSaved < 5) then
                print ("Saving Melarn from certain death!!!!!")
                melarnSaved = melarnSaved + 1
                SobGroup_SetHealth("MelarnSoban", 0.25)
        end
end


-------------------------------------------------------------------------------------------------



-- ===== CONVOY ATTACK ===========================================================================


-- BEGIN STANDARD WIN/LOSE STUFF
function Rule_PlayerLoses()
        if (EventPlaying == 0) and ( SobGroup_Empty( "PlayerMothership" ) == 1 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
                Event_Start( "speechevent_playerloses" )
                Rule_Remove( "Rule_PlayerLoses" )
        end
end
-- END STANDARD WIN/LOSE STUFF











-- ===== EFFECTS =================================================================================

-- Play effects with random timing and scale, among a set of points (randomly chosen) (Written by SHELBY)
-- medium sized explosions 1
function Rule_playEffects1()
        local curTime = Universe_GameTime()

        -- do effect
        if (curTime >= s_nextFxTime) then

                -- Calculate random parameters
                local randomScale = RandomRange( 800, 2200 );
                local randomPointIndex = RandomIntMax( 21 )+1;

                --
                -- Play a new effect
                --
                FX_PlayEffect("death_generic_capital", "EffectPoint"..randomPointIndex, randomScale )

                -- determine next time to play effect
                s_nextFxTime = curTime + RandomRange(0.9, 2.0)

        end
end


-- medium sized explosions 2
function Rule_playEffects2()
        local curTime = Universe_GameTime()

        -- do effect
        if (curTime >= r_nextFxTime) then

                -- Calculate random parameters
                local randomScale = RandomRange( 1000, 2400 );
                local randomPointIndex = RandomIntMax( 21 )+1;

                --
                -- Play a new effect
                --
                FX_PlayEffect("death_generic_capital", "EffectPoint"..randomPointIndex, randomScale )

                -- determine next time to play effect
                r_nextFxTime = curTime + RandomRange(0.9, 1.5)

        end
end

-- explosions on the surface of Hiigara
function Rule_playEffectsSurface()
        local curTime = Universe_GameTime()

        -- do effect
        if (curTime >= t_nextFxTime) then

                -- Calculate random parameters
                local randomScale = RandomRange( 3000, 3800 );
                local randomPointIndex = RandomIntMax( 17 )+1;

                --
                -- Play a new effect
                --
                FX_PlayEffect("black_smoke_sparkle_spray", "EffectPointSurface"..randomPointIndex, randomScale )

                -- determine next time to play effect
                t_nextFxTime = curTime + RandomRange(1.2, 2.5)

        end
end

-- really large explosions that don't happen too often
function Rule_playEffectsBig()
        local curTime = Universe_GameTime()

        -- do effect
        if (curTime >= q_nextFxTime) then

                -- Calculate random parameters
                local randomScale = RandomRange( 6000, 9000 );
                local randomPointIndex = RandomIntMax( 21 )+1;

                --
                -- Play a new effect
                --
                FX_PlayEffect("death_generic_capital", "EffectPoint"..randomPointIndex, randomScale )

                -- determine next time to play effect
                q_nextFxTime = curTime + RandomRange(5, 9)

        end
end

-- tiny fighter explosions that go off all the time
function Rule_playEffectsSmall()
        local curTime = Universe_GameTime()

        -- do effect
        if (curTime >= w_nextFxTime) then

                -- Calculate random parameters
                local randomScale = RandomRange( 1500, 2500 );
                local randomPointIndex = RandomIntMax( 33 )+1;

                --
                -- Play a new effect
                --
                FX_PlayEffect("flash_sparks_spray", "EffectPointSmall"..randomPointIndex, randomScale )

                -- determine next time to play effect
                w_nextFxTime = curTime + RandomRange(0.1, 0.2)

        end
end

-- MORE tiny fighter explosions that go off all the time
function Rule_playEffectsSmall2()
        local curTime = Universe_GameTime()

        -- do effect
        if (curTime >= v_nextFxTime) then

                -- Calculate random parameters
                local randomScale = RandomRange( 1500, 2500 );
                local randomPointIndex = RandomIntMax( 33 )+1;

                --
                -- Play a new effect
                --
                FX_PlayEffect("flash_sparks_spray", "EffectPointSmall"..randomPointIndex, randomScale )

                -- determine next time to play effect
                v_nextFxTime = curTime + RandomRange(0.1, 0.2)

        end
end


-- Lower Battle: tiny fighter explosions that go off all the time
function Rule_playEffectsSmallLow()
        local curTime = Universe_GameTime()

        -- do effect
        if (curTime >= x_nextFxTime) then

                -- Calculate random parameters
                local randomScale = RandomRange( 1500, 2500 );
                local randomPointIndex = RandomIntMax( 21 )+1;

                --
                -- Play a new effect
                --
                FX_PlayEffect("flash_sparks_spray", "EffectPointSmallLow"..randomPointIndex, randomScale )

                -- determine next time to play effect
                x_nextFxTime = curTime + RandomRange(0.1, 0.2)

        end
end

-- ===== EFFECTS =================================================================================





-- ===== MUSIC ==================================================================================

function Rule_PlayAmbientMusic()
	print ("trying to play ambient music!")
	Sound_MusicPlayType( "data:sound/music/ambient/amb_02", MUS_Ambient )
	Rule_Remove ("Rule_PlayAmbientMusic")
end

function Rule_PlayStagingMusic()
	print ("trying to play staging music!")
	Sound_MusicPlayType( "data:sound/music/staging/staging_01", MUS_Staging )
	Rule_Remove ("Rule_PlayStagingMusic")
end

function Rule_PlayBattleMusic()
	print ("trying to play Battle music!")
	Sound_MusicPlayType( "data:sound/music/battle/battle_01", MUS_Battle )
	Rule_Remove ("Rule_PlayBattleMusic")
end



-- ===== MUSIC ==================================================================================







-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end





-- ===== EVENT TABLES =============================================================================

-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_convoysUnderAttack =
{
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
	{
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6403' )",""}, -- Mission Start
	},
        {
                HW2_Wait ( 2 ),
	},
	{
                HW2_LocationCardEvent( "$40020", 6 ),						-- HIIGARA - HOMEWORLD SYSTEM
		{"Sound_EnableAllSpeech( 1 )",""},
		{"Camera_UsePanning(1)",""},								-- re-enable camera panning
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40024", 8 ),			-- Hyperspace Jump successful, the Core is operating at full capacity.
        },
        {
                HW2_Wait ( 1.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40018", 4 ),			-- We made it.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40025", 10 ),				-- We have reached the Hiigaran system. Vaygr forces are being reported in all sectors. They will know we have arrived.
        },
        {
                HW2_Wait ( 2 ),
        },
        {
                HW2_Letterbox ( 1 ),
                { "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
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

                -- Set alliance between player and convoy ships as you go into the SM
--                {"SetAlliance( 0, 2 )",""},
--                {"SetAlliance( 2, 0 )",""},

                -- Tell Convoy ships to dock
--                {"Rule_Add('Rule_convoySetup')",""},

                -- Reveal fog of war for all Convoy ships
--		{"FOW_RevealGroup('Convoy_1', 1)",""},
--		{"FOW_RevealGroup('Convoy_2', 1)",""},
--		{"FOW_RevealGroup('Convoy_3', 1)",""},
--		{"FOW_RevealGroup('Convoy_4', 1)",""},
--		{"FOW_RevealGroup('Convoy_5', 1)",""},
--		{"FOW_RevealGroup('Convoy_6', 1)",""},
		{"FOW_RevealGroup('Convoy3Bombers1', 1)",""},		-- reveal FOW for all the reinforcements that will be launching
		{"FOW_RevealGroup('Convoy3Interceptors1', 1)",""},	-- reveal FOW for all the reinforcements that will be launching
		{"FOW_RevealGroup('Convoy4Bombers1', 1)",""},		-- reveal FOW for all the reinforcements that will be launching
		{"FOW_RevealGroup('Convoy4Interceptors1', 1)",""},	-- reveal FOW for all the reinforcements that will be launching
		{"FOW_RevealGroup('Convoy5Bombers1', 1)",""},		-- reveal FOW for all the reinforcements that will be launching
		{"FOW_RevealGroup('Convoy5Interceptors1', 1)",""},	-- reveal FOW for all the reinforcements that will be launching
		{"FOW_RevealGroup('Convoy6Bombers1', 1)",""},		-- reveal FOW for all the reinforcements that will be launching
		{"FOW_RevealGroup('Convoy6Interceptors1', 1)",""},	-- reveal FOW for all the reinforcements that will be launching
		{"FOW_ForceUpdate()",""},
        },
        {
		{ "Camera_Interpolate( 'here', 'camera3', 1)",""},
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40039", 8 ),                                                                     -- Six Crew transports are inbound to dock with the Mothership.
--                 {"Camera_FocusSobGroup( 'AllConvoys', 1, 5000, 1 )", "" },
                {"ping_Convoy_1_id = Ping_AddSobGroup( ping_Convoy_1, 'anomaly', 'Convoy_1' )",""},     -- add pings to convoys
                {"Ping_AddDescription(ping_Convoy_1_id, 0, '$40425')",""},
                {"ping_Convoy_2_id = Ping_AddSobGroup( ping_Convoy_2, 'anomaly', 'Convoy_2' )",""},
                {"Ping_AddDescription(ping_Convoy_2_id, 0, '$40425')",""},
                {"ping_Convoy_3_id = Ping_AddSobGroup( ping_Convoy_3, 'anomaly', 'Convoy_3' )",""},
                {"Ping_AddDescription(ping_Convoy_3_id, 0, '$40425')",""},
                {"ping_Convoy_4_id = Ping_AddSobGroup( ping_Convoy_4, 'anomaly', 'Convoy_4' )",""},
                {"Ping_AddDescription(ping_Convoy_4_id, 0, '$40425')",""},
                {"ping_Convoy_5_id = Ping_AddSobGroup( ping_Convoy_5, 'anomaly', 'Convoy_5' )",""},
                {"Ping_AddDescription(ping_Convoy_5_id, 0, '$40425')",""},
                {"ping_Convoy_6_id = Ping_AddSobGroup( ping_Convoy_6, 'anomaly', 'Convoy_6' )",""},
                {"Ping_AddDescription(ping_Convoy_6_id, 0, '$40425')",""},
--              {"pointer_convoy1_id = EventPointer_AddSobGroup('Convoy_1', 65280, 0.05)",""},          -- add pointers to convoys
--              {"pointer_convoy2_id = EventPointer_AddSobGroup('Convoy_2', 65280, 0.05)",""},
--              {"pointer_convoy3_id = EventPointer_AddSobGroup('Convoy_3', 65280, 0.05)",""},
--              {"pointer_convoy4_id = EventPointer_AddSobGroup('Convoy_4', 65280, 0.05)",""},
--              {"pointer_convoy5_id = EventPointer_AddSobGroup('Convoy_5', 65280, 0.05)",""},
--              {"pointer_convoy6_id = EventPointer_AddSobGroup('Convoy_6', 65280, 0.05)",""},
        },
        {
                HW2_Wait ( 1 ),
        },
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$40019", 8 ),									-- A Vaygr Carrier has been detected in the area.
                {"pointer_enemyCarrier_id = HW2_CreateEventPointerSobGroup('EnemyCarrier')",""},        -- Add a pointer to the Carrier
	},
        {
                HW2_Wait ( 2 ),
        },
        {
		{"EventPointer_Remove(pointer_enemyCarrier_id)",""},                    -- remove pointer
		{"Camera_FocusSobGroup( 'Convoy_1', 1, 13000, 1 )", "" },
	},
        {
                HW2_Wait ( 1.5 ),
        },
	{
		{"pointer_convoy1_id = HW2_CreateEventPointerSobGroup('Convoy_1')",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$40027", 10 ),                                                                     -- The transports are under attack and require immediate assistance.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		HW2_SubTitleEvent( Actor_FleetIntel, "$40029", 10 ),                                                                     -- At least four transports must dock with the Mothership to meet minimum crew requirements.
                {"obj_prim_saveconvoys_id =  Objective_Add( obj_prim_saveconvoys , OT_Primary )",""},
                { "Objective_AddDescription( obj_prim_saveconvoys_id, '$40450')", "" },
                { "Objective_AddDescription( obj_prim_saveconvoys_id, '$40451')", "" },
        },
        {
--              {"EventPointer_Remove(pointer_convoy2_id)",""},
--              {"EventPointer_Remove(pointer_convoy3_id)",""},
--              {"EventPointer_Remove(pointer_convoy4_id)",""},
--              {"EventPointer_Remove(pointer_convoy5_id)",""},
--              {"EventPointer_Remove(pointer_convoy6_id)",""},
                HW2_Wait ( 1 ),
	},
	{
		{"EventPointer_Remove(pointer_convoy1_id)",""},                 -- remove pointers
--              { "Camera_FocusSobGroup( "PlayerMothership", 1, 0, 0 )", "" },            -- focus on player's MS before coming out of SM
                {"Sensors_Toggle( 0 )","" },
		{"Camera_FocusRestore()",""},
--                {"Camera_UseCameraPoint('camera1')",""},                                                -- focus on starting camera position
                HW2_Pause ( 0 ),
                HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },                                                      -- Disable Intel event skipping
		{"Sound_ExitIntelEvent()",""},
        },
        {
                HW2_Wait ( 2 ),
        },
        {
		{"OpeningEventFinished = 1",""},
		{"EventPlaying = 0",""},
		{"Rule_Add ('Rule_IntelEvent_RecommendCollectors')",""},		-- Recommend construction of additional Resource Collectors...
        },
}


Events.intelevent_RecommendCollectors =
{
        {
		HW2_SubTitleEvent( Actor_FleetIntel, "$40023", 8 ),                   -- ** PICKUP SPEECH ** Recommend construction of additional Resource Collectors to increase harvesting efficiency.
		{"obj_sec_buildCollectors_id =  Objective_Add( obj_sec_buildCollectors , OT_Secondary )",""},
		{ "Objective_AddDescription( obj_sec_buildCollectors_id, '$40475')", "" },
        },
        {
		{ "UI_FlashButton('NewTaskbar', 'btnBuild', 10)", "" },
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



Events.intelevent_firstMSMove =
{
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40090", 4 ),                   -- Engine crews running at minimal capacity.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40091", 4 ),                   -- Engine performance at twenty percent.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



Events.intelevent_corvetteSubsystemComplete =
{
	{
		{"Objective_SetState( obj_sec_buildCorvetteFacility_id, OS_Complete )",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40230", 5 ),                     -- Corvette Subsystem complete.
		{"Objective_SetState( obj_sec_buildCorvetteFacility_id, OS_Complete )",""},
	},
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40231", 8 ),                     -- Gunship Corvettes now available for construction.
		{ "UI_FlashButton('NewTaskbar', 'btnBuild', 10)", "" },
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40232", 8 ),                     -- These ships are effective when used against fighter-class vessels.
        },
        {
		{"Rule_AddInterval ('Rule_intelevent_recommendCorvettes', 3)",""},
                HW2_Wait ( 0.5 ),
        },
        {
		{"Sound_SetMuteActor('')",""},										-- un-mute FC
                {"evt_corvetteSubsystemComplete_started = 1",""},
		{"Sound_ExitIntelEvent()",""},
		{"EventPlaying = 0",""},
        },
}


Events.intelevent_pulsarCorvetteAvailable =
{
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"Player_UnrestrictBuildOption(0, 'Hgn_PulsarCorvette')",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$40235", 8 ),                     -- ** PICKUP SPEECH ** Pulsar Gunships now available for construction.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40236", 8 ),                     -- ** PICKUP SPEECH ** These ships are effective when used against Corvette-class vessels.
        },
        {
		{"Sound_SetMuteActor('')",""},										-- un-mute FC
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_recommendCorvettes =
{
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40239", 8 ),                     -- *** PICKUP REQUIRED *** Recommend using Gunships to defeat the Vaygr bombers attacking our transports.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-------------------------------------------------------------------------------------------------
-- Convoy lost events
-------------------------------------------------------------------------------------------------
Events.intelevent_convoy_1_Lost =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40030", 4 ),                                                                     -- Transport Bishop One lost.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_2_Lost =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40040", 4 ),                                                                     -- Transport Bishop Two lost.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_3_Lost =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40050", 4 ),                                                                     -- Transport Bishop Three lost.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_4_Lost =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40060", 4 ),                                                                     -- Transport Bishop Four lost.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_5_Lost =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40070", 4 ),                                                                     -- Transport Bishop Five lost.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_6_Lost =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40080", 4 ),                                                                     -- Transport Bishop Six lost.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_3convoys_Lost =
{
        {
                HW2_Pause( 1 ),
                HW2_Letterbox( 1 ),
                HW2_Fade( 1 ),
                HW2_Wait(2),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40150", 10 ),                                                            -- Three crew transports lost.
                {"Objective_SetState( obj_prim_saveconvoys_id, OS_Failed )",""},
        },
        {
                HW2_LocationCardEvent( "$40021", 4 ),
        },
        {
		{"Sound_ExitIntelEvent()",""},
		{"EventPlaying = 0",""},
                { "setMissionComplete( 0 )","" },
        },
}
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Convoy saved events
-------------------------------------------------------------------------------------------------
Events.intelevent_convoy_1_Saved =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40031", 6 ),                             -- Threat eliminated.  Transport Bishop One is safe.
                {"Ping_Remove( ping_Convoy_1_id )",""},                                         -- remove the ping on the safe ship
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_2_Saved =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40041", 6 ),                             -- Threat eliminated.  Transport Bishop Two is safe.
                {"Ping_Remove( ping_Convoy_2_id )",""},                                         -- remove the ping on the safe ship
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_3_Saved =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40051", 6 ),                             -- Threat eliminated.  Transport Bishop Three is safe.
                {"Ping_Remove( ping_Convoy_3_id )",""},                                         -- remove the ping on the safe ship
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_4_Saved =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40061", 6 ),                             -- Threat eliminated.  Transport Bishop Four is safe.
                {"Ping_Remove( ping_Convoy_4_id )",""},                                         -- remove the ping on the safe ship
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_5_Saved =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40071", 6 ),                             -- Threat eliminated.  Transport Bishop Five is safe.
                {"Ping_Remove( ping_Convoy_5_id )",""},                                         -- remove the ping on the safe ship
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_6_Saved =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40081", 6 ),                             -- Threat eliminated.  Transport Bishop Six is safe.
                {"Ping_Remove( ping_Convoy_6_id )",""},                                         -- remove the ping on the safe ship
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------
-- Convoy damaged events
-------------------------------------------------------------------------------------------------

Events.intelevent_convoy_CriticalDamage_1 =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40034", 6 ),				-- ** PICKUP SPEECH ** Transport Bishop One sustaining critical damage.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40035", 6 ),				-- ** PICKUP SPEECH ** Send Interceptors immediately to defend Bishop One.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_CriticalDamage_2 =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40044", 6 ),				-- ** PICKUP SPEECH ** Transport Bishop Two sustaining critical damage.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40045", 6 ),				-- ** PICKUP SPEECH ** Send Interceptors immediately to defend Bishop Two.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_CriticalDamage_3 =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40054", 6 ),				-- ** PICKUP SPEECH ** Transport Bishop Three sustaining critical damage.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40055", 6 ),				-- ** PICKUP SPEECH ** Send Interceptors immediately to defend Bishop Three.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_CriticalDamage_4 =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40064", 6 ),				-- ** PICKUP SPEECH ** Transport Bishop Four sustaining critical damage.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40065", 6 ),				-- ** PICKUP SPEECH ** Send Interceptors immediately to defend Bishop Four.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_CriticalDamage_5 =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40074", 6 ),				-- ** PICKUP SPEECH ** Transport Bishop Five sustaining critical damage.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40075", 6 ),				-- ** PICKUP SPEECH ** Send Interceptors immediately to defend Bishop Five.
        },
        {
                HW2_Wait ( 2 ),
        },
	{
		{"Sound_ExitIntelEvent()",""},
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_convoy_CriticalDamage_6 =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40084", 6 ),				-- ** PICKUP SPEECH ** Transport Bishop Six sustaining critical damage.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40085", 6 ),				-- ** PICKUP SPEECH ** Send Interceptors immediately to defend Bishop Six.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-------------------------------------------------------------------------------------------------


Events.intelevent_enemyReinforcements =
{
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"Rule_Add ('Rule_PlayBattleMusic')",""},
                HW2_Letterbox( 1 ),
                { "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
                HW2_Wait ( 4 ),
        },
        {
                {"Camera_FocusSobGroup( 'EnemyCarrier', 1, 1500, 1 )", "" },
                HW2_SubTitleEvent( Actor_FleetIntel, "$40200", 8 ),                             -- The Vaygr Carrier is launching reinforcements.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40201", 10 ),                             -- Use Bombers to destroy the Carrier's Fighter Facility.
                {"pointer_fighterFacility_id = HW2_CreateEventPointerSubSystem('Vgr_C_Production_Fighter', 'EnemyCarrier')",""},
                {"obj_sec_destroyFighterFacility_id =  Objective_Add( obj_sec_destroyFighterFacility , OT_Secondary )",""},
                { "Objective_AddDescription( obj_sec_destroyFighterFacility_id, '$40455')", "" },
                { "Objective_AddDescription( obj_sec_destroyFighterFacility_id, '$40456')", "" },
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40202", 8 ),                             -- This will prevent it from sending further reinforcements.
        },
        {
                HW2_Wait ( 3 ),
        },
        {
                {"EventPointer_Remove(pointer_fighterFacility_id)",""},                 -- remove pointer
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_Letterbox( 0 ),
        },
        {
                { "Universe_EnableSkip(0)", "" },                                                       -- Disable Intel event skipping
		{"Sensors_EnableToggle(1)",""},							-- Allow going in and out of the Sensors Manager
        },
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6404' )",""}, -- Destroy Fighter Facility
	},
	{
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
	},
        {
		{"FighterFacilityEventHasPlayed = 1",""},
		{"EventPlaying = 0",""},
	},
}



Events.intelevent_TEST_UNLOCK =
{
        {
		{"Player_UnrestrictBuildOption(0, 'Hgn_Probe')",""},
		{"Player_UnrestrictBuildOption(0, 'Hgn_ResourceController')",""},
		{"Player_UnrestrictBuildOption(0, 'CorvetteProduction')",""},
        },
        {
                HW2_Wait ( 5 ),
        },
        {
--		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal2' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal3' )",""},
		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal1' )",""},
		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal2' )",""},
		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal3' )",""},
		{"Player_GrantResearchOption( 0, 'SensorsBackToNormal1' )",""},	-- set Sensors back to normal
		{"Player_GrantResearchOption( 0, 'SensorsBackToNormal2' )",""},	-- set Sensors back to normal
		{"Player_GrantResearchOption( 0, 'SensorsBackToNormal3' )",""},	-- set Sensors back to normal

--		{"print ('unlocking research now!!!!!!!!!!!!!!!!!!!!!!!')",""},
--		{"Player_UnrestrictResearchOption( 0, 'MothershipHealthUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'CarrierHealthUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'CarrierMAXSPEEDUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'InterceptorHealthUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'AttackBomberHealthUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'AttackBomberMAXSPEEDUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'AssaultCorvetteHealthUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'AssaultCorvetteMAXSPEEDUpgrade1' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'CorvettePulsarWeapons' )",""},
--		{"Player_UnrestrictResearchOption( 0, 'ResourceCollectorHealthUpgrade1' )",""},
        },
}


-------------------------------------------------------------------------------------------------
-- Convoy docked events
-------------------------------------------------------------------------------------------------
Events.intelevent_Reward1 =
{
        {
		{"rewardEventHasStarted = 1",""},							-- used to check whether to launch the convoys
                HW2_SubTitleEvent( Actor_FleetCommand, "$40100",  3),                   -- Crew transport docked.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40101",  3),                   -- Subsystem and Engineering personnel transferring.
        },
--        {
--                HW2_Wait ( 8 ),
--        },
--        {
--                HW2_SubTitleEvent( Actor_FleetCommand, "$40102",  3),                   -- Crew transfer complete.
--        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"rewardEventPlaying = 0",""},							-- reset the variable so other convoys can use it
                HW2_SubTitleEvent( Actor_FleetIntel, "$40103",  6),                             -- The Mothership now has additional construction capabilities.
		{ "UI_FlashButton('NewTaskbar', 'btnBuild', 10)", "" },
		{"Rule_AddInterval ('Rule_checkCorvetteSubsystemComplete', 3)",""},
                {"Player_UnrestrictBuildOption(0, 'CorvetteProduction')",""},
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40104",  8),                             -- Corvette Facility available for construction.
                {"obj_sec_buildCorvetteFacility_id =  Objective_Add( obj_sec_buildCorvetteFacility , OT_Secondary )",""},
                { "Objective_AddDescription( obj_sec_buildCorvetteFacility_id, '$40465')", "" },
                { "Objective_AddDescription( obj_sec_buildCorvetteFacility_id, '$40466')", "" },
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 3 ),
        },
        {
		{"rewardEventHasStarted = 0",""},							-- reset the variable so other convoys can use it
		{"EventPlaying = 0",""},
        },
}

Events.intelevent_Reward2 =
{
        {
		{"rewardEventHasStarted = 1",""},							-- used to check whether to launch the convoys
                HW2_SubTitleEvent( Actor_FleetCommand, "$40100",  3),                   -- Crew transport docked.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40111",  3),                   -- Research staff and science teams transferring.
        },
--        {
--                HW2_Wait ( 8 ),
--        },
--        {
--                HW2_SubTitleEvent( Actor_FleetCommand, "$40102",  3),                   -- Crew transfer complete.
--        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"rewardEventPlaying = 0",""},							-- used to tell the convoys to launch
                HW2_SubTitleEvent( Actor_FleetIntel, "$40113",  10),                             -- New research options available.
		{ "UI_FlashButton('NewTaskbar', 'btnResearch', 10)", "" },
		{"print ('unlocking research now!!!!!!!!!!!!!!!!!!!!!!!')",""},
--                {"SobGroup_UnRestrictBuildOption("PlayerMothership", 'Hgn_Research')",""},
		-- ANDREW: replacing with proper restriction
--~                 {"Player_UnrestrictResearchOption( 0, 'MothershipHealthUpgrade1' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'CarrierHealthUpgrade1' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'CarrierMAXSPEEDUpgrade1' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'InterceptorHealthUpgrade1' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'AttackBomberHealthUpgrade1' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'AttackBomberMAXSPEEDUpgrade1' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'AssaultCorvetteHealthUpgrade1' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'AssaultCorvetteMAXSPEEDUpgrade1' )",""},
--~ --                {"Player_UnrestrictResearchOption( 0, 'CorvettePulsarWeapons' )",""},
--~                 {"Player_UnrestrictResearchOption( 0, 'ResourceCollectorHealthUpgrade1' )",""},
		{ "Enable_ResearchOptions()", "" },
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 3 ),
        },
        {
		{"rewardEventHasStarted = 0",""},							-- reset the variable so other convoys can use it
		{"EventPlaying = 0",""},
        },
}

Events.intelevent_Reward3 =
{
        {
		{"rewardEventHasStarted = 1",""},							-- used to check whether to launch the convoys
                HW2_SubTitleEvent( Actor_FleetCommand, "$40100",  3),                   -- Crew transport docked.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40106",  3),                   -- Sensor crews transferring.
        },
--        {
--                HW2_Wait ( 8 ),
--        },
--        {
--                HW2_SubTitleEvent( Actor_FleetCommand, "$40102",  3),                   -- Crew transfer complete.
--        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"rewardEventPlaying = 0",""},							-- used to tell the convoys to launch
                HW2_SubTitleEvent( Actor_FleetIntel, "$40108",  6),                             -- Mothership sensors systems are now operating at full capacity.
--                {"Player_OverrideUnitCaps(0, 40 )",""},                                 -- set unit caps back to normal
		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal1' )",""},
		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal2' )",""},
		{"Player_UnrestrictResearchOption( 0, 'SensorsBackToNormal3' )",""},
		{"Player_GrantResearchOption( 0, 'SensorsBackToNormal1' )",""},	-- set Sensors back to normal
		{"Player_GrantResearchOption( 0, 'SensorsBackToNormal2' )",""},	-- set Sensors back to normal
		{"Player_GrantResearchOption( 0, 'SensorsBackToNormal3' )",""},	-- set Sensors back to normal
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 3 ),
        },
        {
		{"rewardEventHasStarted = 0",""},							-- reset the variable so other convoys can use it
		{"EventPlaying = 0",""},
        },
}



Events.intelevent_Reward4 =
{
        {
		{"rewardEventHasStarted = 1",""},							-- used to check whether to launch the convoys
                HW2_SubTitleEvent( Actor_FleetCommand, "$40100",  3),                   -- Crew transport docked.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40121",  3),                   -- Engine and powerplant crews transferring.
        },
--        {
--                HW2_Wait ( 8 ),
--        },
--        {
--                HW2_SubTitleEvent( Actor_FleetCommand, "$40102",  3),                   -- Crew transfer complete.
--        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"rewardEventPlaying = 0",""},							-- used to tell the convoys to launch
                HW2_SubTitleEvent( Actor_FleetIntel, "$40123",  6),                             -- Engine performance increased to normal level.
                {"SobGroup_SetSpeed('PlayerMothership', 1.0)",""},                                -- set speed of MS back to normal
--                {"Player_UnrestrictResearchOption( 0, 'MothershipMAXSPEEDUpgrade1' )",""},         -- unlock speed upgrades for MS
        },
        {
                HW2_Wait ( 10 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40126",  8),                             -- Four crew transports docked.  We have met minimum crew requirements.
--                {"Objective_SetState( obj_prim_saveconvoys_id, OS_Complete )",""},
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 3 ),
        },
        {
		{"rewardEventHasStarted = 0",""},							-- reset the variable so other convoys can use it
		{"EventPlaying = 0",""},
        },
}


Events.intelevent_Reward5 =
{
        {
		{"rewardEventHasStarted = 1",""},							-- used to check whether to launch the convoys
                HW2_SubTitleEvent( Actor_FleetCommand, "$40100",  3),                   -- Crew transport docked.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40131",  3),                   -- Elite Fighter pilots transferring.
        },
--        {
--                HW2_Wait ( 8 ),
--        },
--        {
--                HW2_SubTitleEvent( Actor_FleetCommand, "$40102",  3),                   -- Crew transfer complete.
--        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"rewardEventPlaying = 0",""},							-- used to tell the convoys to launch
                HW2_SubTitleEvent( Actor_FleetIntel, "$40134",  3),                             -- *** WAITING ON PICKUP *** Elite Bomber squadrons launching from Mothership.
                {"Rule_Add ('Rule_spawnEliteFighters1')",""},
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 3 ),
        },
        {
		{"rewardEventHasStarted = 0",""},							-- reset the variable so other convoys can use it
		{"EventPlaying = 0",""},
        },
}

Events.intelevent_Reward6 =
{
        {
		{"rewardEventHasStarted = 1",""},							-- used to check whether to launch the convoys
                HW2_SubTitleEvent( Actor_FleetCommand, "$40100",  3),                   -- Crew transport docked.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40141",  3),                   -- Elite Corvette crews transferring.
        },
--        {
--                HW2_Wait ( 8 ),
--        },
--        {
--                HW2_SubTitleEvent( Actor_FleetCommand, "$40102",  3),                   -- Crew transfer complete.
--        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"rewardEventPlaying = 0",""},							-- used to tell the convoys to launch
                HW2_SubTitleEvent( Actor_FleetIntel, "$40144",  8),                             -- *** WAITING ON PICKUP *** Elite Corvette squadrons launching from Mothership.
                {"Rule_Add ('Rule_spawnEliteCorvettes1')",""},
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 3 ),
        },
        {
		{"rewardEventHasStarted = 0",""},							-- reset the variable so other convoys can use it
		{"EventPlaying = 0",""},
        },
}


-- when Vgr Frigates hyperspace in
Events.intelevent_frigateAttack =
{
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40160",  3),		-- Hyperspace signature detected.
                {"FOW_RevealGroup('FrigateAttackers', 1)",""},			-- reveal FOW for Vaygr Frigates (needed for auto-focus event)
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_Letterbox( 1 ),
                { "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
                HW2_Wait ( 4 ),
        },
        {
                {"Camera_FocusSobGroup( 'FrigateGuardFocus', 1, 500, 1 )", "" },
                HW2_SubTitleEvent( Actor_FleetIntel, "$40161", 8 ),                             -- The Vaygr are using Frigates to attack the transports.
                {"ping_frigateAttackers_id = Ping_AddSobGroup( ping_frigateAttackers, 'anomaly', 'FrigateAttackers' )",""}, -- Add ping to Vaygr Frigates
                {"Ping_AddDescription(ping_frigateAttackers_id, 0, '$40427')",""},
        },
        {
                HW2_Wait ( 3 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40162", 8 ),                             -- Some appear to be equipped with heavy anti-Fighter weaponry.
        },
        {
                HW2_Wait ( 1 ),
        },
        {
                HW2_Letterbox( 0 ),
                { "Universe_EnableSkip(0)", "" },                                                       -- Disable Intel event skipping
		{"Sensors_EnableToggle(1)",""},							-- Allow going in and out of the Sensors Manager
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


-- just before Melarn hyperspaces in
Events.intelevent_MelarnIsComing =
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40167", 8 ),                     -- Receiving transmission from Hiigaran Defence Grid.
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40168", 4 ),                     -- Allied forces are arriving.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 1 ),
        },
	{
		{"MelarnIsComingEventFinished = 1",""},
		{"EventPlaying = 0",""},
	},
}




-- when Melarn hyperspaces in
Events.intelevent_WithHelpOfMelarn =
{
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6405' )",""}, -- Captain Soban Arrives
	},
        {
                HW2_Wait ( 1 ),
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40170", 8 ),                     -- With the help of Captain Soban’s mercenaries we should be able to save the rest of the transports.
	},
        {
                HW2_Wait ( 1 ),
        },
	{
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
	},
        {
		{"EventPlaying = 0",""},
		{"NIS02B_Playing = 0",""},
        },
}


-- when Vaygr Frigates are destoyed
Events.intelevent_frigatesDestroyed =
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$40165", 8 ),                     -- ** PICKUP SPEECH ** The Vaygr Frigates have been destroyed.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-- if Melarn gets damaged
Events.intelevent_melarnDamaged =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40240",  8),                     -- Captain Soban’s ship is sustaining heavy damage.  We cannot afford to lose him.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40241",  8),                     -- Do not allow his ship to be destroyed.
                {"ping_melarnSoban_id = Ping_AddSobGroup( ping_melarnSoban, 'anomaly', 'MelarnSoban' )",""}, -- Add ping to Melarn Soban's ship
                {"Ping_AddDescription(ping_melarnSoban_id, 0, '$40426')",""},
                {"obj_prim_saveMelarn_id =  Objective_Add( obj_prim_saveMelarn , OT_Primary )",""},
                { "Objective_AddDescription( obj_prim_saveMelarn_id, '$40470')", "" },
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40242",  3),                     -- Deploy additional Fighters to assist.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-- if Melarn gets really damaged
Events.intelevent_melarnCriticallyDamaged =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40243",  8),                     -- ** PICKUP SPEECH ** Captain Soban's ship is sustaining critical damage.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40242",  3),                     -- Deploy additional Fighters to assist.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



-- Melarn is destroyed
Events.intelevent_melarnDestroyed =
{
        {
                HW2_Pause( 1 ),
                HW2_Letterbox( 1 ),
                HW2_Fade( 1 ),
                HW2_Wait(2),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40245",  8),                             -- Captain Soban is lost.
        },
        {
                HW2_LocationCardEvent( "$40021", 4 ),
        },
        {
                { "setMissionComplete( 0 )","" },
        },
}



-- event for when the Carrier flees
Events.intelevent_carrierFleeing=
{
        {
                { "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
                HW2_Letterbox( 1 ),
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_Pause( 1 ),                                                 -- pause the universe over 3 seconds
        },
        {
                HW2_Wait ( 3 ),
        },
        {
                {"Sensors_Toggle( 1 )","" },
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40175", 6 ),                                                                     -- The Vaygr Carrier is retreating.
                {"pointer_enemyCarrier_id = HW2_CreateEventPointerSobGroup('EnemyCarrier')",""},        -- Add a pointer to the Carrier
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40176", 10 ),                                                                     -- It must be destroyed before it can escape.
                {"obj_prim_destroycarrier_id =  Objective_Add( obj_prim_destroycarrier , OT_Primary )",""},
                { "Objective_AddDescription( obj_prim_destroycarrier_id, '$40460')", "" },
                { "Objective_AddDescription( obj_prim_destroycarrier_id, '$40461')", "" },
                { "Objective_AddDescription( obj_prim_destroycarrier_id, '$40462')", "" },
                {"ping_enemyCarrier_id = Ping_AddSobGroup( ping_enemyCarrier, 'anomaly', 'EnemyCarrier' )",""}, -- Add ping to Carrier
                {"Ping_AddDescription(ping_enemyCarrier_id, 0, '$40420')",""},
                {"ping_carrierExitPoint_id = Ping_AddPoint( ping_carrierExitPoint, 'anomaly', 'CarrierFleeSphere' )",""},       -- Add ping to Carrier Exit Point
                {"Ping_AddDescription(ping_carrierExitPoint_id, 0, '$40420')",""},
        },
        {
                {"EventPointer_Remove(pointer_enemyCarrier_id)",""},                    -- remove pointer
                HW2_Wait ( 2 ),
        },
        {
                { "Universe_EnableSkip(0)", "" },                                                       -- Disable Intel event skipping
                HW2_Pause( 0 ),                                                 -- unpause the universe
                HW2_Letterbox( 0 ),
                {"Sensors_Toggle( 0 )","" },
		{"Rule_AddInterval('Rule_intelevent_carrierEscaped',3)",""},			-- Add rule to check whether Carrier has escaped
	},
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
	{
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6406' )",""}, -- destroy vaygr carrier
	},
        {
                HW2_Wait ( 2 ),
		{"Sound_ExitIntelEvent()",""},
	},
	{
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_carrierEscaped =
{
        {
                HW2_Letterbox( 1 ),
                HW2_Wait ( 4 ),
        },
        {
                {"Camera_FocusSobGroup( 'EnemyCarrier', 1, 1500, 1 )", "" },
                HW2_SubTitleEvent( Actor_FleetIntel, "$40177",  7),                             -- The Vaygr Carrier has escaped.
                {"Objective_SetState( obj_sec_destroyFighterFacility_id, OS_Failed )",""},
                {"Ping_Remove( ping_enemyCarrier_id )",""},                                     -- remove the ping on the Vgr Carrier
                {"Ping_Remove( ping_carrierExitPoint_id )",""},                                         -- remove the ping on the Carrier's exit point
        },
        {
                HW2_Wait ( 2 ),
        },
        {
                HW2_Fade( 2 ),
                HW2_Wait(2),
        },
        {
                HW2_LocationCardEvent( "$40021", 4 ),
        },
        {
                { "setMissionComplete( 0 )","" },
        },
}


Events.intelevent_carrierDestroyed =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40178",  6),					-- The Vaygr Carrier has been destroyed.
		{"carrierDestroyed = 1",""},									-- set variable so Fighter Facility objective can be turned off if it hasn't been completed
                {"Objective_SetState( obj_prim_destroycarrier_id, OS_Complete )",""},   -- Set objective to complete
                {"Ping_Remove( ping_carrierExitPoint_id )",""},                                         -- remove the ping on the Carrier's exit point
                HW2_Wait ( 4 ),
        },
        {
		{"Sound_ExitIntelEvent()",""},
		{"Rule_AddInterval ('Rule_intelevent_sobanLeaving', 2)",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
		{"carrierDestroyedHasPlayed = 1",""},
	},
}


--~ Events.intelevent_sobanToHiigaranFleet =
--~ {
--~         {
--~ 		{"SobGroup_SetROE('MelarnSoban', PassiveROE)",""},	-- Set his tactics to passive so he doesn't start auto-retaliating
--~ 		{"SobGroup_SetROE('MelarnFleet', PassiveROE)",""},	-- Set his tactics to passive so he doesn't start auto-retaliating
--~ 		{"SobGroup_Stop( 4, 'MelarnSoban')",""},					-- stop Melarn in case he's moving around
--~ 		{"SobGroup_Stop( 3, 'MelarnFleet')",""},					-- stop Melarn in case he's moving around
--~                 HW2_SubTitleEvent( Actor_Talorn, "$40179",  2),                         -- Fleet, this is Captain Soban.
--~ --                HW2_Wait ( 2.5 ),
--~         },
--~         {
--~ 		{"Sound_ExitIntelEvent()",""},
--~ --                HW2_Wait ( 2 ),
--~         },
--~ 	{
--~ 		{"EventPlaying = 0",""},
--~ 		{"sobanToHiigaranFleetHasPlayed = 1",""},
--~ 	},
--~ }


Events.intelevent_sobanLeaving =
{
        {
                { "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
                HW2_Letterbox( 1 ),
                HW2_Wait ( 4 ),
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                {"Camera_FocusSobGroup( 'MelarnSoban', 1, 250, 1 )", "" },
		{"SobGroup_SetROE('MelarnSoban', PassiveROE)",""},	-- Set his tactics to passive so he doesn't start auto-retaliating
		{"SobGroup_SetROE('MelarnFleet', PassiveROE)",""},	-- Set his tactics to passive so he doesn't start auto-retaliating
		{"SobGroup_Stop( 4, 'MelarnSoban')",""},					-- stop Melarn in case he's moving around
		{"SobGroup_Stop( 3, 'MelarnFleet')",""},					-- stop Melarn in case he's moving around
                {"Ping_Remove( ping_melarnSoban_id )",""},                                     -- remove the ping on Melarn's ship (he's leaving!)
		{"SobGroup_FormStrikeGroup( 'MelarnFleetAll', 'tortoise')",""},		-- form Melarn's fleet into a strike group so they look cooler when they hyperspace out
		{"SobGroup_Move( 4, 'MelarnSoban', 'MelarnMovePoint' )",""},		-- give Melarn a move order to he doesn't just sit around while he talks
		{"SobGroup_Move( 3, 'MelarnFleet', 'MelarnMovePoint' )",""},		-- give Melarn a move order to he doesn't just sit around while he talks
                HW2_SubTitleEvent( Actor_Talorn, "$40179",  2),                         -- Fleet, this is Captain Soban.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_Talorn, "$40180",  7),                         -- The home system will soon be overrun by Vaygr forces.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_Talorn, "$40181",  6),                         -- Their objective is to capture the Mothership.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_Talorn, "$40182",  6),                         -- You must get the Pride of Hiigara out of here.
--                HW2_Wait ( 3.5 ),
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_Talorn, "$40183",  8),                         -- The enemy will follow and in doing so, you will buy the Homeworld some time.
        },
        {
		{"Rule_Add ('Rule_melarnHyperspaceOut')",""},					-- start watching for cue to hyperspace out
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_Talorn, "$40185",  3),                         -- SOBAN out.
		{"tellMelarnToHyperspaceOut = 1",""},
        },
        {
--                HW2_Letterbox( 0 ),
                HW2_Wait ( 0.5 ),
        },
        {
		{"Rule_Add('Rule_intelevent_standbyForHyperspace')",""},			-- Start checking for end-of-mission conditions

                HW2_SubTitleEvent( Actor_FleetIntel, "$40190",  8),                             	-- Captain Soban’s mission will be to track down the location of the Vaygr Leader.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40191",  7),                             	-- His fleet has been dispatched to do this. He will remain in contact with us.
        },
        {
                HW2_Wait ( 1 ),
        },
        {
		{"SobGroup_SetInvulnerability( 'Player_Ships0', 0 )",""},				-- turn off invulnerability
                HW2_Letterbox( 0 ),
                { "Universe_EnableSkip(0)", "" },                                                       -- Disable Intel event skipping
		{"Sensors_EnableToggle(1)",""},									-- Allow player to go back into the SM
--                HW2_Wait ( 4 ),
        },
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
	{
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6407' )",""}, -- Coordinates set for Sarum
	},
        {
                HW2_Wait ( 2 ),
		{"Sound_ExitIntelEvent()",""},
        },
        {
		{"EventPlaying = 0",""},
	},
}


Events.intelevent_standbyForHyperspace =
{
        {
                HW2_Wait ( 10 ), --allow time for elite gunships to undock
        },
        {
                HW2_Letterbox( 1 ),
                HW2_Wait ( 4 ),
        },
        {
		{"Sound_SetMuteActor('Fleet')",""},										-- mute FC so she doesn't say regular AllShips lines
		{"Camera_FocusSobGroup( 'PlayerMothership', 1, 2500, 1 )",""},			-- Focus on Player's MS
                HW2_Wait ( 1 ),
        },
        {
--		{"TellConvoysToReturnHome = 1",""},
		{"Rule_Add ('Rule_convoysReturnHome')",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$40197",  5),                             -- Crew Transports returning to base.
        },
        {
                HW2_Wait ( 1 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40192",  6),                             -- We cannot allow the Mothership to fall into enemy hands.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40193",  5),                             -- Coordinates set for the Sarum system.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40195",  5),                             -- There we will regroup our forces and mount a counter-offensive.
        },
        {
		HW2_Wait ( 0.5 ),
        },
        {
                HW2_SubTitleEvent( Actor_FleetCommand, "$40194",  6),                           -- All ships, standby for hyperspace.
		{ "Universe_AllowPlayerOrders( 0 )", "" },
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"Universe_Fade( 1, 1.5 )",""},									-- fade to black
        },
        {
                HW2_Wait ( 2.5 ),
        },
        {
		{"Rule_Remove ('Rule_convoyLostWatch')",""},						-- remove watch on transports dying
		{"Rule_Remove ('Rule_intelevent_convoysDamaged')",""},				-- remove watching transport health
		
		{"SobGroup_Despawn( 'Convoy_1' )",""},								-- de-spawn transports so it looks like they've gone home
		{"SobGroup_Despawn( 'Convoy_2' )",""},								-- de-spawn transports so it looks like they've gone home
		{"SobGroup_Despawn( 'Convoy_3' )",""},								-- de-spawn transports so it looks like they've gone home
		{"SobGroup_Despawn( 'Convoy_4' )",""},								-- de-spawn transports so it looks like they've gone home
		{"SobGroup_Despawn( 'Convoy_5' )",""},								-- de-spawn transports so it looks like they've gone home
		{"SobGroup_Despawn( 'Convoy_6' )",""},								-- de-spawn transports so it looks like they've gone home
		
		{ "Player_InstantDockAndParade( 0, 'PlayerMothership', 0 )", "", 0 },	
		{ "Player_InstantlyGatherAllResources( 0 )", "" },

	
		-- focus on MS
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
		{"Universe_Fade( 0, 1.5 )",""},									-- fade in
        },
        {
                HW2_Wait ( 1.5 ),
        },
        {
		{"SobGroup_EnterHyperSpaceOffMap('PlayerMothership')",""},				-- hyperspace the Mothership out
        },
        {
                HW2_Wait ( 12 ),
        },
        {
		{"Universe_Fade( 1, 1.5 )",""},									-- fade to black
        },
        {
                HW2_Wait ( 1.5 ),
        },
	{
                HW2_LocationCardEvent( "$40022", 2 ),								-- MISSION SUCCESSFUL
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


Events.intelevent_fighterFacilityDestroyed =
{

        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$40252",  8),                             -- Vaygr Fighter Facility Destroyed.  The Carrier can no longer build reinforcements.
                {"Objective_SetState( obj_sec_destroyFighterFacility_id, OS_Complete )",""},
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


-- ===== EVENT TABLES ================================================================

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
                HW2_LocationCardEvent( "$40021", 4 ),
        },
        {
                { "setMissionComplete( 0 )","" },
        },
}

