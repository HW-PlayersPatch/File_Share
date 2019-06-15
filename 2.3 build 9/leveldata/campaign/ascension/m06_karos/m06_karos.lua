--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M06_Karos
--  Purpose:  Mission 6 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/playerspatch_util.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")

-- objectives
obj_prim_startresourcing = "$42500"
obj_prim_startresourcing_id = 0

obj_prim_investigatehulk  = "$42501"
obj_prim_investigatehulk_id = 0

obj_prim_defendfleet  = "$42502"
obj_prim_defendfleet_id = 0

obj_prim_salvagederelict = "$42503"
obj_prim_salvagederelict_id = 0

obj_prim_performresearch = "$42504"
obj_prim_performresearch_id = 0

-- pings
ping_hulktoinvestigate = "$42900"
ping_hulktoinvestigate_id = 0

ping_aliencraft = "$42901"
ping_aliencraft_id = 0

-- global vars
g_now_time = Universe_GameTime( )
g_playerID = Universe_CurrentPlayer()
g_pointer_default = 0

g_delaytofirsthyperspace = 480
g_delaytosecondhyperspace = 580
g_delaytothirdhyperspace = 0

g_delaytomoversemerge = 81

g_playersalvagingmover = 0

g_speedofmothershiptolighthouse = 0.25

g_speedofcollectorsalvagingmover = 0.8

ShipToParadeRoundTypeName = "Hgn_MotherShip"

g_stage = 0
g_nisState = 0

g_movermax = 0
g_minmoverstoattack = 0

g_movermax_1 = 0
g_minmoverstoattack_1 = 0
g_build_rate_1 = 0

g_movermax_2 = 0
g_minmoverstoattack_2 = 0
g_build_rate_2 = 0

g_movermax_salvaged = 0
g_minmoverstoattack_salvaged = 0
g_build_rate_salvaged = 0

g_movermax_3 = 0
g_minmoverstoattack_3 = 0
g_build_rate_3 = 0

g_playersRUs = 0

g_save_id = 0

-- MISSION RULES

-- BEGIN GAME: BEGIN
-- here we display the intro intelevents
function OnInit()
	SPRestrict()
	Rule_Add("Rule_Init")	
end

-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end

function Enable_ResearchOptions()
 	-----BUILD DATA-----
	Player_UnrestrictBuildOption( 0, "Hgn_DefenseFieldFrigate" ) --Hgn_DefenseFieldFrigate
	Player_UnrestrictBuildOption( 0, "Hgn_ECMProbe" ) --Hgn_ECMProbe
	-----RESEARCH DATA-----
	Player_UnrestrictResearchOption( 0, "ECMProbe" ) --ECMProbe
	Player_UnrestrictResearchOption( 0, "ScoutEMPAbility" ) --ScoutEMPAbility
	Player_UnrestrictResearchOption( 0, "DefenseFieldFrigateShield" ) --DefenseFieldFrigateShield
	Player_UnrestrictResearchOption( 0, "MothershipHealthUpgrade1" ) --MothershipHealthUpgrade1
	Player_UnrestrictResearchOption( 0, "MothershipMAXSPEEDUpgrade1" ) --MothershipMAXSPEEDUpgrade1
	Player_UnrestrictResearchOption( 0, "MothershipBUILDSPEEDUpgrade1" ) --MothershipBUILDSPEEDUpgrade1
	Player_UnrestrictResearchOption( 0, "CarrierHealthUpgrade1" ) --CarrierHealthUpgrade1
	Player_UnrestrictResearchOption( 0, "CarrierMAXSPEEDUpgrade1" ) --CarrierMAXSPEEDUpgrade1
	Player_UnrestrictResearchOption( 0, "CarrierBUILDSPEEDUpgrade1" ) --CarrierBUILDSPEEDUpgrade1
	Player_UnrestrictResearchOption( 0, "ResourceControllerHealthUpgrade1" ) --ResourceControllerHealthUpgrade1
end

function DisableMothership()
	SobGroup_SetSpeed( Players_Mothership , 0)
	SobGroup_AbilityActivate( Players_Mothership, AB_Move, 0 )
	SobGroup_AbilityActivate( Players_Mothership, AB_Stop, 0 )
	SobGroup_AbilityActivate( Players_Mothership, AB_Attack, 0 )
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
	if ( ReactiveFleetRatio <= 1.2 ) then
		-- easy		
		print("SCAR: going easy")
		-- here are values for each stage
		g_movermax_1 = 10
		g_minmoverstoattack_1 = 7
		g_build_rate_1 = 15
		
		g_movermax_2 = 10
		g_minmoverstoattack_2 = 6
		g_build_rate_2 = 15
		
		g_movermax_salvaged = 20
		g_minmoverstoattack_salvaged = 4
		g_build_rate_salvaged = 15
		
		g_movermax_3 = 20
		g_minmoverstoattack_3 = 1
		g_build_rate_3 = 15
	
	elseif ( ReactiveFleetRatio >= 1.2 ) and ( ReactiveFleetRatio < 1.9 ) then
		-- normal
		print("SCAR: going normal")
		-- here are values for each stage
		g_movermax_1 = 12
		g_minmoverstoattack_1 = 5
		g_build_rate_1 = 12
		
		g_movermax_2 = 16
		g_minmoverstoattack_2 = 4
		g_build_rate_2 = 12
		
		g_movermax_salvaged = 20
		g_minmoverstoattack_salvaged = 2
		g_build_rate_salvaged = 12
		
		g_movermax_3 = 20
		g_minmoverstoattack_3 = 1
		g_build_rate_3 = 12
	
	elseif ( ReactiveFleetRatio >= 1.9 ) then
		-- hard
		print("SCAR: going hard")
		-- here are values for each stage
		g_movermax_1 = 16
		g_minmoverstoattack_1 = 4
		g_build_rate_1 = 10
		
		g_movermax_2 = 22
		g_minmoverstoattack_2 = 4
		g_build_rate_2 = 10
		
		g_movermax_salvaged = 25
		g_minmoverstoattack_salvaged = 4
		g_build_rate_salvaged = 10
		
		g_movermax_3 = 25
		g_minmoverstoattack_3 = 1
		g_build_rate_3 = 10
	
	end

	
	g_movermax = g_movermax_1
	g_minmoverstoattack = g_minmoverstoattack_1

	Rule_AddInterval( "Rule_BuildFromHulk", g_build_rate_1 )
	
	Rule_Remove ("Rule_GetReactiveFleetRatio")
	
end



function cheat()
	Event_Start( "intelevent_derelictmoverdetected" )
end

function Rule_Init()
	
--~ 	UI_BindKeyEvent( IKEY, 'cheat' )
	
	Sound_SpeechSubtitlePath("speech:missions/m_06/")

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
		
	CPU_Enable( 1, 0 )
	CPU_Enable( 2, 0 )
	
	CPU_Enable( 3, 0 )
	
	SobGroup_SetSwitchOwnerFlag( "Derelict_Mover", 0 )
	--SobGroup_TakeDamage( "Derelict_Mover", .9 )
	SobGroup_Despawn( "Derelict_Mover" )
	
	-- set research level
	HW2_SetResearchLevel( 6 )
	
--~ 	Rule_AddInterval( "Rule_UnlockResearchAndBuild", g_delaytomoversemerge/2 )
	
	-- set the AI's to aggressive
	Player_SetGlobalROE( 1, OffensiveROE )
	Player_SetGlobalStance( 1, AggressiveStance )
	--Player_SetGlobalROE( 2, OffensiveROE )
	
	Player_GrantResearchOption( 2, "MoverHealthUpgrade" )
	
	Player_SetPlayerName( 0, "$42890" )
	Player_SetPlayerName( 1, "$42892" )
	Player_SetPlayerName( 2, "$42891" )		
	Player_SetPlayerName( 3, "$42891" )
	
	-- commenting out the opening NIS cause it really doesnt make much sense anymore.
	--NISLoad( "nis/NIS06A" )
	--g_nisState = NISPlay( "nis/NIS06A" )
	
	g_nisState = NISGetPlayingHandle("nis/NIS06A")
	NISDisableInterface(1) -- this disables the interface when the NIS is done playing, it needs to be re-enabled by scar
	
	-- NISDisableInterface(1) -- this disables the interface when the NIS is done playing, it needs to be re-enabled by scar
	
	SobGroup_Create("g_Players_Ships_To_Attack")
	
	SobGroup_Create( "NewlyCreatedMovers" )
	SobGroup_Create( "NewlyCreatedMovers_1" )
	SobGroup_Create( "NewlyCreatedMovers_2" )
	SobGroup_Create( "NewlyCreatedMovers_3" )
	SobGroup_Create( "NewlyCreatedMovers_4" )
	
	SobGroup_Create( "Collector_Salvaging_Mover" )
	SobGroup_Create( "tempSobGroup" )
	SobGroup_Create( "tempSobGroupOne" )
	
	--SobGroup_GuardSobGroup( "Derelict_Protectors", "Derelict_Mover" )
	
	Rule_Add( "Rule_NIS06AComplete" )
	
	SetAlliance( 1, 2 )
	SetAlliance( 2, 1 )
	
	-- set an alliance between player and derelict mover
	SetAlliance( 3, 0 )
	SetAlliance( 3, 1 )
	SetAlliance( 3, 2 )
	SetAlliance( 0, 3 )
	SetAlliance( 1, 3 )
	SetAlliance( 2, 3 )
	
	
	Rule_AddInterval( "Rule_Movers_Attack", 5 )
	
	Rule_Remove( "Rule_Init" )
	
	Sound_EnableAllSpeech( 0 )
	
end

--function Rule_MSCoreAt25()
	--if ( g_delaytofirsthyperspace
--end

function Rule_UnlockResearchAndBuild()
	Enable_ResearchOptions()
	
	Rule_Remove( "Rule_UnlockResearchAndBuild" )
end

function Rule_NIS06AComplete()
	
	if ( NISComplete( g_nisState ) == 1 ) then
	--if ( g_nisState == 1 ) then
		  -- Sob Group setup
		SobGroup_LoadPersistantData("Hgn_Mothership")	
		-- get the players MS
		Players_Mothership = "Players_Mothership"
		SobGroup_Create(Players_Mothership)	
		SobGroup_FillShipsByType( Players_Mothership, "Player_Ships0", "Hgn_MotherShip" )
		
		g_playersRUs = Player_GetRU( g_playerID )
		Rule_Add( "Rule_PlayerStartedCollecting" )
		
		Rule_Add( "Rule_GetReactiveFleetRatio" )
		
		
		
		DisableMothership()
		
		Rule_Add( "Rule_PlayerLoses" )
		
		Event_Start( "intelevent_oracleinincontrol" )
		Rule_Add( "Rule_OpeningIEIsComplete" )
		
--~ 		Sound_MusicPlay( "data:sound/music/ambient/AMB_06" )
		Sound_MusicPlayType( "data:sound/music/ambient/AMB_06", MUS_Ambient )
		
		g_nisState = 0		
		
		Rule_Remove( "Rule_NIS06AComplete" )	

		Rule_AddInterval( "Rule_InvestigateHulks", g_delaytomoversemerge )
		
		Rule_AddInterval( "Rule_MothershipIsJumpingToStageTwo", g_delaytofirsthyperspace )		
		
		
				
	end
	
end

function Rule_OpeningIEIsComplete()
	if ( Event_IsDone( "intelevent_oracleinincontrol" ) == 1 ) then
		Rule_Add( "Rule_UnlockResearchAndBuild" )
		Camera_SetLetterboxStateNoUI(0,0)
		Rule_Remove( "Rule_OpeningIEIsComplete" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameMissionStart", 1 )
		
	end
end

function Rule_SaveTheGameMissionStart()
	Rule_Remove ("Rule_SaveTheGameMissionStart")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6422" ) --.." Mission Start" )
end
-- END GAME: BEGIN

function Rule_PlayerStartedCollecting()
	if ( Stats_GatheredRUAsteroid( 0 )  >= 1 ) then
		Objective_SetState( obj_prim_startresourcing_id, OS_Complete )
		Rule_Remove( "Rule_PlayerStartedCollecting" )
	end
end

-- BEGIN GAME: TURN ON HULKS
-- these functions handle the turning on and off of the hulks, as well as setting the rate of construction for the movers as well as actually building them
function Rule_BuildFromHulk()
	Player_FillShipsByType( "tempSobGroup", 2, "Kpr_Mover")
	if ( SobGroup_Count( "tempSobGroup" ) >= g_movermax ) then
		--print( "weve reached the limit" )
		-- we are at the limit, so order all of the movers to attack the player.  dont want movers sitting around bored.
		BuildAttackList()		
		SobGroup_Attack( 2, "tempSobGroup", "g_Players_Ships_To_Attack" )
		return
	end
	
	if ( g_stage == 1 ) then
		-- build a mover from the hulk
		BuildMover( "DebrisHulk_StageOne_1" )
		--Rule_Add( "Rule_AttackPlayerWithNewMovers" )
		
	elseif ( g_stage == 2 ) then
		
		--if (bits < 2 ) then
			BuildMover( "DebrisHulk_StageTwo_1" )
	--	else
			BuildMover( "DebrisHulk_StageTwo_2" )
	--	end
		--Rule_Add( "Rule_AttackPlayerWithNewMovers" )
		
	elseif ( g_stage == 3 ) then		
		
	--	if (bits < 2 ) then
			BuildMover( "DebrisHulk_StageThree_1" )
	--	elseif ( bits == 2 ) then
			BuildMover( "DebrisHulk_StageThree_2" )
	--	else
			BuildMover( "DebrisHulk_StageThree_3" )
			
			BuildMover( "Lighthouse" )
		--end
		--Rule_Add( "Rule_AttackPlayerWithNewMovers" )
	end
	
end

function BuildMover( hulk )
	temp = SobGroup_CreateShip( hulk, "Kpr_Mover")
	if ( g_stage == 1 ) then
		
		SobGroup_SobGroupAdd( "NewlyCreatedMovers", temp )
		--MoversAttack( "NewlyCreatedMovers" )
		
	elseif ( g_stage == 2 ) then
		if ( hulk == "DebrisHulk_StageTwo_1" ) then
			
			SobGroup_SobGroupAdd( "NewlyCreatedMovers_1", temp )
			
		else
			SobGroup_SobGroupAdd( "NewlyCreatedMovers_2", temp )
			--MoversAttack( "NewlyCreatedMovers_2" )
		end
	else		
		if ( hulk == "DebrisHulk_StageThree_1" ) then
			SobGroup_SobGroupAdd( "NewlyCreatedMovers_1", temp )
			--MoversAttack( "NewlyCreatedMovers_1" )
		elseif ( hulk == "DebrisHulk_StageThree_2" ) then
			SobGroup_SobGroupAdd( "NewlyCreatedMovers_2", temp )
			--MoversAttack( "NewlyCreatedMovers_2" )
		elseif ( hulk == "DebrisHulk_StageThree_3" ) then
			SobGroup_SobGroupAdd( "NewlyCreatedMovers_3", temp )
			--MoversAttack( "NewlyCreatedMovers_3" )
		else
			SobGroup_SobGroupAdd( "NewlyCreatedMovers_4", temp )
			--SobGroup_Remove
			--SobGroup_Attack( 2, "NewlyCreatedMovers_4", Players_Mothership )
		end
	end
end

-- just in case we decide to use more than one formation
AvailableStrikeGroups = { "Vgr_Dart", "wall", "Vgr_Cross", "Vgr_Wedge" }

function MoversAttack( groupToAttack )
	if ( SobGroup_Empty( groupToAttack ) == 0 ) and ( SobGroup_Count(  groupToAttack ) >= g_minmoverstoattack ) then -- and ( SobGroup_IsDocked( groupToAttack ) == 0 ) then
		-- form strikegroup
		print( "SCAR - ordering group to attack:"..groupToAttack )
		
		if ( g_stage ~= 3 ) then
			SobGroup_FormStrikeGroup( groupToAttack, AvailableStrikeGroups[1] )
		end
		
		SobGroup_AttackPlayer( groupToAttack, 0 )
		
		SobGroup_Clear( groupToAttack )
	else
		print( "SCAR - cannot order attack for group:"..groupToAttack )
	
	end
end

-- this function goes through and culls the things we dont want to attack from the players group
function BuildAttackList()
	
	local nonAttackList = { "Hgn_Probe", "Hgn_Scout", "Hgn_ProximitySensor", "Hgn_ECMProbe", "Vgr_HyperSpace_Platform" }
	SobGroup_SobGroupAdd('g_Players_Ships_To_Attack', 'Player_Ships0')
	
	for i=1,getn(nonAttackList) do
		SobGroup_RemoveType( "g_Players_Ships_To_Attack", nonAttackList[i] )
	end	
	
end

-- trying out some new logic for making the movers attack when they get built from the hulks
function Rule_Movers_Attack()
	-- here we are actually going to grab the movers that are in proximity to the hulks that are building, based on the stage, and order them to attack the player.
	-- what is the stage?	
	local hulks_to_test = ""
	
	if ( g_stage == 1 ) then
		--define the hulks that we are building from
		hulks_to_test = "DebrisHulk_StageOne_1"
		
	elseif ( g_stage == 2 ) then
		hulks_to_test = { "DebrisHulk_StageTwo_1", "DebrisHulk_StageTwo_2" }
		
	elseif ( g_stage == 3 ) then
		hulks_to_test = { "DebrisHulk_StageThree_1", "DebrisHulk_StageThree_2",  "DebrisHulk_StageThree_2", "Lighthouse" }
		
	else
		-- its 0, so bug out
		return
	end
	--print(hulks_to_test)
	-- now we have either a single element if its stage 1, or a list if its stage 2 >, so slightly different logic for each
	if ( g_stage == 1 ) then
		-- get all the movers in proximity to the hulk
		Player_FillProximitySobGroup( "tempSobGroup", 2, hulks_to_test, 4000 )
		SobGroup_FillShipsByType( "tempSobGroupOne", "tempSobGroup", "Kpr_Mover")
		-- we arent empty, so go ahead and attack
		if ( SobGroup_Empty( "tempSobGroupOne" ) == 0 ) then
			if ( SobGroup_Count( "tempSobGroupOne" ) < g_minmoverstoattack ) then
				SobGroup_FormStrikeGroup( "tempSobGroupOne", AvailableStrikeGroups[1] )
			end
--~ 			SobGroup_AttackPlayer( newmovers, 0 )
			BuildAttackList()
			SobGroup_Attack( 2, "tempSobGroupOne", "g_Players_Ships_To_Attack" )
		end
	else
		-- now we have a list of hulks to check, so we need to loop through them
		for i=1,getn(hulks_to_test) do
			-- get all the movers in proximity to the hulk
			Player_FillProximitySobGroup( "tempSobGroup", 2, hulks_to_test[i], 4000 )
			SobGroup_FillShipsByType(  "tempSobGroupOne", "tempSobGroup" , "Kpr_Mover")
			-- we arent empty, so go ahead and attack
			if ( SobGroup_Empty( "tempSobGroupOne" ) == 0 ) then
				if ( SobGroup_Count( "tempSobGroupOne" ) < g_minmoverstoattack ) then
					SobGroup_FormStrikeGroup( "tempSobGroupOne", AvailableStrikeGroups[1] )				
				end
				if ( g_stage == 3 ) and ( hulks_to_test[i] == "Lighthouse" ) then
					SobGroup_Attack( 2, "tempSobGroupOne", Players_Mothership )
				else
--~ 					SobGroup_AttackPlayer( newmovers, 0 )	
					BuildAttackList()
					SobGroup_Attack( 2, "tempSobGroupOne", "g_Players_Ships_To_Attack" )
				end
			end
		end
	end
end
-- END GAME: TURN ON HULKS

-- BEGIN GAME: INVESTIGATE HULKS
function Rule_InvestigateHulks()
	
	Event_Start( "intelevent_debrishulks" )
	Rule_Remove( "Rule_InvestigateHulks" )
	
	Rule_Add( "Rule_PlayNIS06B" )
end

function Rule_BeginCheckForProximityToHulk()
	if ( Event_IsDone( "intelevent_debrishulks" ) == 1 ) then
		Rule_Add( "Rule_PlayerScoutedDebrisHulk" )
		Rule_Remove( "Rule_BeginCheckForProximityToHulk" )
	end
end

function Rule_PlayerScoutedDebrisHulk()
	if ( SobGroup_PlayerIsInSensorRange( "DebrisHulk_StageOne_1", 0 ) == 1 ) then
		Objective_SetState( obj_prim_investigatehulk_id, OS_Complete )
		Ping_Remove( ping_hulktoinvestigate_id )
		
		NISLoad( "nis/NIS06B" )
		
		Sensors_EnableCameraZoom( 0 )
		Sensors_Toggle( 0 )
		
		g_nisState = NISPlay( "nis/NIS06B" )
		
		Rule_Remove( "Rule_PlayerScoutedDebrisHulk" )
		Rule_Add( "Rule_NIS06BComplete" )
	end
end

function Rule_PlayNIS06B()
	if ( Event_IsDone( "intelevent_debrishulks" ) == 1 ) then
		NISLoad( "nis/NIS06B" )
		Sensors_EnableCameraZoom( 0 )
		Sensors_Toggle( 0 )
		Sensors_EnableToggle( 0 )
		g_nisState = NISPlay( "nis/NIS06B" )
		
		
		
		Rule_Remove( "Rule_PlayNIS06B" )
		Rule_Add( "Rule_NIS06BComplete" )
	end
end

function Rule_NIS06BComplete()
	if ( NISComplete( g_nisState ) == 1 ) then
		
		Sensors_EnableCameraZoom( 1 )
		Sensors_EnableToggle( 1 )
		
--~ 		Sound_StingerPlay( "data:sound/music/battle/battle_06" )
		Sound_MusicPlayType( "data:sound/music/BATTLE/BATTLE_MOVERS", MUS_Battle )
		-- create some movers to attack the player with to begin with		
		g_stage = 1
		--for i=1,8 do
			--temp = SobGroup_CreateShip( "DebrisHulk_StageOne_1", "Kpr_Mover")	
		FOW_RevealGroup( "NIS_Movers", 1 )
		SobGroup_SobGroupAdd( "NewlyCreatedMovers", "NIS_Movers" )
--~ 		SobGroup_AttackPlayer( "NIS_Movers", 0 )
		BuildAttackList()
		SobGroup_Attack( 2, "NIS_Movers", "g_Players_Ships_To_Attack" )
		--end		
		
		Event_Start( "intelevent_moversattack" )
		
		g_nisState = 0
		Rule_Remove( "Rule_NIS06BComplete" )		
		Rule_Add( "Rule_SaveAfterMoversAttackEvent" )
	end
end

function Rule_SaveAfterMoversAttackEvent()
	if ( Event_IsDone( "intelevent_moversattack" ) == 1 ) then
		Rule_Remove( "Rule_SaveAfterMoversAttackEvent" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		Rule_AddInterval( "Rule_SaveTheGameMoversAttack", 1 )		
	end
end

function Rule_SaveTheGameMoversAttack()
	Rule_Remove ("Rule_SaveTheGameMoversAttack")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6423" ) --.." Movers Attack" )
end
-- END GAME: INVESTIGATE HULKS

-- BEGIN GAME: MOTHERSHIP JUMPS TO STAGE TWO
-- timer is counted down, make the mothership jump
function Rule_MothershipIsJumpingToStageTwo()

	BuildAttackList()
	Player_FillShipsByType( "tempSobGroup", 2, "Kpr_Mover")
	SobGroup_Attack( 2, "tempSobGroup", "g_Players_Ships_To_Attack" )
	
	-- stop building from the hulk, give chance to get rid of remainder of movers
	Rule_Remove( "Rule_BuildFromHulk" )
	
	Subtitle_TimeCounterEnd()
	Event_Start( "intelevent_mothershipisjumping" )
	Rule_Remove( "Rule_MothershipIsJumpingToStageTwo" )
	Rule_AddInterval( "Rule_MothershipReturnsToStageTwo", 60 )
end
-- END GAME: MOTHERSHIP JUMPS TO STAGE TWO

-- BEGIN GAME: MOTHERSHPI RETURNS TO STAGE TWO
-- MS returns after a short period of time
function Rule_MothershipReturnsToStageTwo()
	g_stage = 0
	
	Event_Start( "intelevent_mothershiphasreturned" )
	SobGroup_ExitHyperSpace( Players_Mothership, "vol_MSJump_1" )
	Rule_Remove( "Rule_MothershipReturnsToStageTwo" )
	
	Rule_AddInterval( "Rule_DebrisHulks_StageTwo_PowerUp", 40 )	
	Rule_AddInterval( "Rule_MothershipIsJumpingToStageThree", g_delaytosecondhyperspace )
	
	Rule_Add( "Rule_SaveAfterMothershipArriveAtStageTwoEvent" )
	
end

function Rule_SaveAfterMothershipArriveAtStageTwoEvent()
	if ( Event_IsDone( "intelevent_mothershiphasreturned" ) == 1 ) then
		Rule_Remove( "Rule_SaveAfterMothershipArriveAtStageTwoEvent" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		Rule_AddInterval( "Rule_SaveTheGameMothershipReturned", 1 )
	end
end

function Rule_SaveTheGameMothershipReturned()
	Rule_Remove ("Rule_SaveTheGameMothershipReturned")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6424" ) -- .." Mothership Returned" )	
end

-- we use this to give the player a breather
function Rule_DebrisHulks_StageTwo_PowerUp()
	-- order all of the stage 1 movers to attack
	BuildAttackList()
	Player_FillShipsByType( "tempSobGroup", 2, "Kpr_Mover")
	SobGroup_Attack( 2, "tempSobGroup", "g_Players_Ships_To_Attack" )
	-- now change the stage
	g_stage = 2
	g_minmoverstoattack = g_minmoverstoattack_2
	--Rule_Remove( "Rule_BuildFromHulk" )
	Rule_AddInterval( "Rule_BuildFromHulk", g_build_rate_2 )
	g_movermax = g_movermax_2
	Rule_AddInterval( "Rule_SalvageMover", 60 )
	Rule_Remove( "Rule_DebrisHulks_StageTwo_PowerUp" )
end
-- END GAME: MOTHERSHPI RETURNS TO STAGE TWO

-- BEGIN GAME: SALVAGE MOVER
function Rule_SalvageMover()
	SobGroup_Spawn( "Derelict_Mover", "vol_SpawnMover" )
	
	Event_Start( "intelevent_derelictmoverdetected" )
	FOW_RevealGroup("Derelict_Mover", 1)
	Rule_Remove( "Rule_SalvageMover" )
	Rule_Add( "Rule_MoverSalvaged" )
	Rule_Add( "Rule_SlowDownCollector" )
end

-- this function slows down the collector that is salvaging the derelict mover
function Rule_SlowDownCollector()
	SobGroup_GetSobGroupSalvagingGroup( "Derelict_Mover", "Collector_Salvaging_Mover" )
	if ( SobGroup_Empty( "Collector_Salvaging_Mover" ) == 0 ) then
		SobGroup_SetSpeed( "Collector_Salvaging_Mover", g_speedofcollectorsalvagingmover )
	else
		SobGroup_Clear( "Collector_Salvaging_Mover" )
	end
end

function Rule_MoverSalvaged()
	if ( SobGroup_SalvagedByPlayer( "Derelict_Mover", 0 ) == 1 ) then
		-- hopefully this wont crash it completely.
		SobGroup_SwitchOwner ( "Derelict_Mover", 2 )
		
		Rule_Remove( "Rule_SlowDownCollector" )
		SobGroup_SetSpeed( "Collector_Salvaging_Mover", 1 )
		Ping_Remove( ping_aliencraft_id )
		g_minmoverstoattack = g_minmoverstoattack_salvaged
		Rule_Remove( "Rule_BuildFromHulk" )
		Rule_AddInterval( "Rule_BuildFromHulk", g_build_rate_salvaged )
		g_movermax = g_movermax_salvaged
		Objective_SetState( obj_prim_salvagederelict_id, OS_Complete )
		g_playersalvagingmover = 0
		Event_Start( "speechevent_derelictsalvaged" )
		Rule_Remove( "Rule_MoverSalvaged" )
		
		Rule_AddInterval( "Rule_MoverReengineered", 20 )
		
		Rule_Add( "Rule_SaveAfterMoverSalvagedEvent" )
	end
end

function Rule_SaveAfterMoverSalvagedEvent()
	if ( Event_IsDone( "speechevent_derelictsalvaged" ) == 1 ) then
		Rule_Remove( "Rule_SaveAfterMoverSalvagedEvent" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameMoverSalvaged", 1 )
		
		
	end
end

function Rule_SaveTheGameMoverSalvaged()
	Rule_Remove ("Rule_SaveTheGameMoverSalvaged")
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6425" ) --.." Mover Salvaged" )
end

function Rule_MoverReengineered()
		
		Event_Start( "intelevent_derelictengineered" )
		Rule_Remove( "Rule_MoverReengineered" )
		
		
		Rule_Add( "Rule_SaveAfterMoverReengineerdEvent" )
		Rule_Add( "Rule_MoverResearchComplete" )
	
end

function Rule_SaveAfterMoverReengineerdEvent()
	if ( Event_IsDone( "intelevent_derelictengineered" ) == 1 ) then
		Player_UnrestrictResearchOption( 0, "DamageMoverTech" )
		Rule_Remove( "Rule_SaveAfterMoverReengineerdEvent" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameMoverReengineered", 1 )
		
	end
end

function Rule_SaveTheGameMoverReengineered()
	Rule_Remove ("Rule_SaveTheGameMoverReengineered")
	
	g_save_id = g_save_id + 1	
	Campaign_QuickSaveNb( g_save_id, "$6426" ) --.." Mover Reengineered" )
end

function Rule_MoverResearchComplete()
	if ( Player_HasResearch (0, "DamageMoverTech") == 1 ) then
		Objective_SetState( obj_prim_performresearch_id, OS_Complete )
		Player_GrantResearchOption( 2, "MoverHealthDowngrade" )
		Event_Start( "intelevent_researchcomplete" )
		Rule_Add( "Rule_SaveAfterMoverResearchCompleteEvent" )
		
		Rule_Remove( "Rule_MoverResearchComplete" )
	end
end

function Rule_SaveAfterMoverResearchCompleteEvent()
	if ( Event_IsDone( "intelevent_researchcomplete" ) == 1 ) then
		Rule_Remove( "Rule_SaveAfterMoverResearchCompleteEvent" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameAntiMoverComplete", 1 )
		
	end
end

function Rule_SaveTheGameAntiMoverComplete()
	Rule_Remove ("Rule_SaveTheGameAntiMoverComplete")
	
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6427" ) --.." AntiMover Research Complete" )
end
-- END GAME: SALVAGE MOVER

-- BEGIN GAME: MOTHERSHIP JUMPS TO STAGE THREE
function Rule_MothershipIsJumpingToStageThree()

	BuildAttackList()	
	Player_FillShipsByType( "tempSobGroup", 2, "Kpr_Mover")
	SobGroup_Attack( 2, "tempSobGroup", "g_Players_Ships_To_Attack" )
	
	-- stop building from the hulk, give chance to get rid of remainder of movers
	Rule_Remove( "Rule_BuildFromHulk" )

	Subtitle_TimeCounterEnd()
	Event_Start( "intelevent_mothershipjumpsagain" )
	Rule_Remove( "Rule_MothershipIsJumpingToStageThree" )
	Rule_AddInterval( "Rule_MothershipReturnsToStageThree", 60 )
end
-- END GAME: MOTHERSHIP JUMPS TO STAGE THREE

-- BEGIN GAME: MOTHERSHIP RETURNS TO STAGE THREE
function Rule_MothershipReturnsToStageThree()
	Rule_AddInterval( "Rule_DebrisHulks_StageThree_PowerUp", 60 )
	
	Event_Start( "intelevent_mothershipreenters" )
	SobGroup_ExitHyperSpace( Players_Mothership, "vol_MSJump_2" )
	Rule_Remove( "Rule_MothershipReturnsToStageThree" )
	
	Rule_Add( "Rule_SaveAfterMothershipArriveAtStageThreeEvent" )
end

function Rule_SaveAfterMothershipArriveAtStageThreeEvent()
	if ( Event_IsDone( "intelevent_mothershipreenters" ) == 1 ) then
		Rule_Remove( "Rule_SaveAfterMothershipArriveAtStageThreeEvent" )
		Rule_Add( "Rule_PlaySaveGameLocationCard" )
		
		Rule_AddInterval( "Rule_SaveTheGameMothershipReturnedAgain", 1 )
		
	end
end

function Rule_SaveTheGameMothershipReturnedAgain()
	Rule_Remove ("Rule_SaveTheGameMothershipReturnedAgain")	
	g_save_id = g_save_id + 1
	Campaign_QuickSaveNb( g_save_id, "$6428" ) -- .." Mothership Returned Again" )
end

-- we use this to give the player a breather
function Rule_DebrisHulks_StageThree_PowerUp()
	-- order all currently existing Movers to attack player so we can get rid of them
	BuildAttackList()
	Player_FillShipsByType( "tempSobGroup", 2, "Kpr_Mover")
	SobGroup_Attack( 2, "tempSobGroup", "g_Players_Ships_To_Attack" )
	-- change to stage 3
	g_stage = 3
	g_minmoverstoattack = g_minmoverstoattack_3
	--Rule_Remove( "Rule_BuildFromHulk" )
	Rule_AddInterval( "Rule_BuildFromHulk", g_build_rate_3 )
	
	g_movermax = g_movermax_3
	
	-- make MS move to lighthouse
	Rule_AddInterval( "Rule_MoveToLighthouse", 5 )
	
	Rule_Remove( "Rule_DebrisHulks_StageThree_PowerUp" )
end
-- END GAME: MOTHERSHIP RETURNS TO STAGE THREE

-- BEGIN GAME: MOTHERSHIP REACHES LIGHTHOUSE
function Rule_MoveToLighthouse()
	SobGroup_AbilityActivate( Players_Mothership, AB_Move, 1 )
	
	SobGroup_SetSpeed( Players_Mothership , g_speedofmothershiptolighthouse)
	SobGroup_Move( 0, Players_Mothership, "vol_LighthouseMove" )
	
	SobGroup_AbilityActivate( Players_Mothership, AB_Move, 0 )
	
	--SobGroup_MoveToSobGroup( Players_Mothership, "Lighthouse" )
	Rule_Remove( "Rule_MoveToLighthouse" )
	Rule_Add( "Rule_MothershipAtLighthouse" )
end

function Rule_MothershipAtLighthouse()
	if ( SobGroup_FillSobGroupInVolume( "tempSobGroup", Players_Mothership, "vol_Lighthouse" ) == 1 ) then
		-- make players ships invulnerable now.
		SobGroup_SetInvulnerability( "Player_Ships0", 1 )
		
		g_stage = 0
		
		Event_Start( "intelevent_mothershipreacheslighthouse" )
		Rule_Remove( "Rule_MothershipAtLighthouse" )
		
	end
end
-- END GAME: MOTHERSHIP REACHES LIGHTHOUSE

-- BEGIN STANDARD WIN/LOSE STUFF
function Rule_PlayerLoses()	
	if ( SobGroup_Empty( Players_Mothership ) == 1 ) then
		Subtitle_TimeCounterEnd()
		Event_Start( "speechevent_playerloses" )
		Rule_Remove( "Rule_PlayerLoses" )
	end
end
-- END STANDARD WIN/LOSE STUFF

-- turn off movers when the oracle has contacted the lighthouse
abilityList = {AB_Move, AB_Attack, AB_Steering, AB_Targeting, AB_Sensors, AB_Lights};

function PowerOffMovers()
	
	Player_FillShipsByType( "tempSobGroup", 2, "Kpr_Mover")
	
	for i = 1, getn(abilityList) do
		SobGroup_AbilityActivate( "tempSobGroup", abilityList[i], 0 )
	end
	
	SobGroup_Stop( 2, "tempSobGroup" )
	
end

-- EVENTS
-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_oracleinincontrol =
{
	{
		{ "Sound_EnableAllSpeech( 1 )",""},
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		--{ "Camera_Interpolate( 'here', 'camera_focusOnMothership', 2)",""},
		{ "Universe_EnableSkip(1)", "" },
		HW2_LocationCardEvent( "$42520", 5 ),
	},
	{
		HW2_Wait( 15 ),
	},
	{		
		HW2_Letterbox( 1 ),
		HW2_Wait( 4 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42530", 5 ),
	},
	{
		HW2_Wait( 1 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetCommand, "$42531", 5 ),
		{ "Timer_Start( 0, g_delaytofirsthyperspace )",""},
		{ "Timer_Pause( 0 )","" },
		{ "Subtitle_TimeCounter( 0, 42523 )",""},
	},
	{
		HW2_Wait( 1 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42533", 7 ),
	},
	{
		HW2_Wait( 1 ),
	},
	{
		{ "obj_prim_startresourcing_id = Objective_Add( obj_prim_startresourcing, OT_Primary )", "" },		
		{ "Objective_AddDescription( obj_prim_startresourcing_id, '$42800')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$42534", 4 ),
	},
	{		
		HW2_Wait(1),
	},
	{
		--{ "Sensors_Toggle( 0 )","" },
		{ "Timer_Resume(0)",""},
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_mscorestatus_1 =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$42560", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_mscorestatus_2 =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$42561", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_mscorestatus_3 =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$42562", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_debrishulks =
{
	
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait( 2 ),
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_focusOnHulk', 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$42540", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_moversattack =
{	
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait( 2 ),
		HW2_Pause( 1 ),
	},
	{
		{ "Sensors_Toggle( 1 )",""},
		HW2_Wait( 2 ),
	},
	{
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup(  'NIS_Movers' )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$42550", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42551", 5 ),
	},
	{		
		{ "obj_prim_defendfleet_id = Objective_Add( obj_prim_defendfleet, OT_Primary )", "" },		
		{ "Objective_AddDescription( obj_prim_defendfleet_id, '$42810')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$42552", 5 ),
	},
	{		
		{ "EventPointer_Remove(g_pointer_default)", "" },
		HW2_Wait(0.1),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		HW2_Pause( 0 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_mothershipisjumping =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42570", 5 ),
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_returnCameraToMothership', 2)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$42571", 5 ),
		{ "SobGroup_EnterHyperSpaceOffMap( Players_Mothership )","" },
	},
	{
		HW2_Wait( 2 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$42572", 5 ),
	},
	{		
		HW2_Wait(3),
	},
	{
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_mothershiphasreturned =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait( 2 ),
	},
	{
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 0 )",""},
		{ "Camera_Interpolate( 'here', 'camera_MothershipExitsHyperspace_1', 2)",""},
		HW2_Wait( 4 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42580", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42581", 5 ),
	},
	{
--~ 		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 1 )",""},
		{ "Camera_Interpolate( 'here', 'camera_MSLocationInSensorsManager', 2)",""},
		HW2_Wait( 2 ),
	},	
	{		
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup(  'DebrisHulk_StageTwo_1' )", "" },
		{ "g_pointer_default_1 = HW2_CreateEventPointerSobGroup(  'DebrisHulk_StageTwo_2' )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$42583", 5 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$42584", 5 ),
	},
	{		
		{ "EventPointer_Remove(g_pointer_default)", "" },
		{ "EventPointer_Remove(g_pointer_default_1)", "" },
		HW2_Wait(0.1),
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{ "Sensors_Toggle( 0 )",""},
	},
	{
		{ "Timer_Start( 0, g_delaytosecondhyperspace )",""},
		{ "Subtitle_TimeCounter( 0, 42523 )",""},
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_derelictmoverdetected =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Wait(1),
	},
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$42590", 5 ),
--~ 	},
	{
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait( 2 ),
		HW2_Pause( 1 ),
	},	
	{
		--{ "Camera_Interpolate( 'here', 'camera_focusOnDebrisMover', 2)",""},
		{ "Camera_FocusSobGroupWithBuffer ('Derelict_Mover', 1000, 1000, 2)", "" },
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 0 )",""},
		HW2_Wait( 4 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42591", 5 ),
	},
	{
		HW2_Wait( 2 ),
	},	
	{
		{ "ping_aliencraft_id = Ping_AddSobGroup( ping_aliencraft, 'anomaly', 'Derelict_Mover' )",""},
		{ "Ping_AddDescription(ping_aliencraft_id, 0, '$42930')",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$42592", 5 ),
	},
	{
--~ 		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 1 )",""},
		HW2_Wait( 2 ),
	},
	{		
		{ "obj_prim_salvagederelict_id = Objective_Add( obj_prim_salvagederelict, OT_Primary )", "" },	
		{ "g_playersalvagingmover = 1",""},
		{ "Objective_AddDescription( obj_prim_salvagederelict_id, '$42815')", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$42593", 5 ),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{ "Camera_Interpolate( 'here', 'camera_focusOnFleet2', 2)",""},
		HW2_Wait( 2 ),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		HW2_Pause( 0 ),
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_derelictsalvaged =
{
    {
		{ "", "Event_IsRunning('intelevent_mothershipreacheslighthouse') == 0" },
    },
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42610", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42611", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_derelictengineered =
{
    {
		{ "", "Event_IsRunning('intelevent_mothershipreacheslighthouse') == 0" },
    },
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" },
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42620", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42621", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42622", 5 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$42623", 5 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$42624", 5 ),
		{ "obj_prim_performresearch_id = Objective_Add( obj_prim_performresearch, OT_Primary )", "" },	
		{ "Objective_AddDescription( obj_prim_performresearch_id, '$42820')", "" },
	},
	{
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_researchcomplete =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_Wait(4),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42600", 5 ),
	},
	{		
		HW2_SubTitleEvent( Actor_FleetIntel, "$42601", 5 ),
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_mothershipjumpsagain =
{
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42630", 5 ),
	},
	{
		{ "SobGroup_EnterHyperSpaceOffMap( Players_Mothership )","" },
	},
	{
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_mothershipreenters =
{
	{
		HW2_Wait( 3 ),	
	},
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait( 2 ),		
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_FocusOnMSExitingHS_3', 2)",""},
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42640", 5 ),
	},
	{
		HW2_Wait( 2 ),
	},
	{
		
		HW2_SubTitleEvent( Actor_FleetCommand, "$42641", 5 ),
	},
	{
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 1 )",""},
		{ "Camera_Interpolate( 'here', 'camera_focusOnLighthouse', 2)",""},
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42642", 5 ),
		{ "g_pointer_default = HW2_CreateEventPointerSobGroup(  'Lighthouse' )", "" },		
	},
	{
		HW2_Wait( 1 ),
	},
	{
		{ "EventPointer_Remove(g_pointer_default)", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$42643", 5 ),
	},
	{		
		{ "Camera_Interpolate( 'here', 'camera_focusOnFleet_3', 2)",""},
		HW2_Wait( 2 ),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		{ "Sensors_EnableCameraZoom( 1 )","" },
		HW2_Letterbox( 0 ),
		HW2_Wait(2),		
		{ "Universe_EnableSkip(0)", "" },
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_mothershipreacheslighthouse =
{
    {
		{ "", "Event_IsRunning('speechevent_derelictsalvaged') == 0 and Event_IsRunning('intelevent_derelictengineered') == 0" },
    },
	{
		{ "Sound_EnterIntelEvent()","" },
		{ "Sound_SetMuteActor('Fleet')", ""},
		{ "Universe_EnableSkip(1)", "" },
		HW2_Letterbox( 1 ),
		HW2_Wait( 2 ),
		--HW2_Pause( 1 ),
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_focusOnMSCommunicating', 2)",""},
		{ "PowerOffMovers()","" },
		HW2_SubTitleEvent( Actor_FleetCommand, "$42650", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42651", 5 ),
	},
	{	
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$42652", 5 ),
	},
	{
		--{ "FX_PlayEffectBetweenPoints( 'pro_tech_beam_combo', 'point_Beam01', 'point_Beam02', 10 )", "" },
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42653", 5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42655", 5 ),
	},
	{
		{ "Universe_AllowPlayerOrders( 0 )", "" },
		HW2_Fade( 1 ),
		HW2_Wait( 2 ),
	},	
	{
		--{ "SobGroup_Despawn( 'Lighthouse' )", "" },
		HW2_Wait( 0.2 ),
	},
	{		
		
		{ "SobGroup_Spawn( 'Lighthouse', 'vol_LighthouseMoveToAfterMission' )",""},
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		{ "Player_InstantDockAndParade( 0, Players_Mothership, 0 )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$42656", 5 ),
		{ "Camera_Interpolate( 'here', 'camera_msenteresHSAtEnd', 0)",""},
		{ "Subtitle_Message( '$3652', 2 )", "" },
	},
	{	
		HW2_Fade( 0 ),
		HW2_Wait( 2 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$42654", 5 ),
	},
	{
		{ "SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", "" },
		HW2_Wait( 12 ),
	},
	{
		{ "Universe_Fade( 1, 2 )","" },
		HW2_Wait( 3 ),
	},
	{
		HW2_LocationCardEvent( "$42524", 4 ),
	},
	{
		HW2_Wait( 2 ),
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
		HW2_LocationCardEvent( "$42522", 4 ),
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}