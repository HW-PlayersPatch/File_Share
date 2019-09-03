--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M010_Bentus
--  Purpose:  Mission 10 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
--dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")
dofilepath("data:scripts/playerspatch_util.lua")
dofilepath("data:scripts/SCAR/SCAR_Util.lua")

-- objectives
obj_prim_destroykeepers = "$44500"
obj_prim_destroykeepers_id = 0

obj_prim_repairdread = "$44501"
obj_prim_repairdread_id = 0

obj_prim_defendbentus = "$44502"
obj_prim_defendbentus_id = 0

-- global vars

-- GLOBAL VARIABLES FOR ME TO STORE STUFF GENERATED DURING THE GAME

-- Number of times the keeper destroyers have phased out, total.
g_keepers_out = 0

-- Better version of the above
g_keepers_time_phased_out = 0

-- Number of times phased out *after* the repair of the Dreadnaught
g_keepers_time_phased_out_post_repair = 0

-- Name of the Keeper that just phased out.
g_Keeper_Phase_Out = ""


g_ships_in_volume = ""
g_test_group = ""

g_Dreadnaught_Repair_Status = 0

g_run = 0

g_keeper_final_scene_play_once = 0

-- Setup savegame state
g_save_id = 0

g_difficulty = 0

-- GLOBAL VARIABLES TO ASSIST GAME TUNING
-- This stores the actual time taken to restore the Dreadnaught to full working order once it has been docked w/ Bentus
g_time_to_repair_dread = 300

-- It is this long after the Bentusi arrive that the Keepers return with friends (actually, it's from the start of the Bentus arrival intelevent, so make sure it's about 60 seconds longer than otherwise)
-- (actually, at the moment it's this long after you dock the dread.  which is cheap, because if you never dock, the mission never ends.  I should fix it.  And I did.  How about that)
g_keepers_mad_time = 150


-- This is the number of times you need to force a Keeper to phase out after the Dreadnaught has been repaired in order to trigger stage 3 (the bentusi requiem)
g_keepers_phase_threshold = 3

-- After this many drones are built, the Keepers will not build any more
g_drone_cap = 5

-- Drone cap for wave two, where there are four Keepers to deal with
g_drone_cap_phase_2 = 8

-- Defines Mover cap 
g_mover_cap = 8

-- Defines Mover cap for phase two 
g_mover_cap_phase_2 = 14

-- Number of Movers who hyperspace in each time they do so
g_movers_per_build = 2

-- SobGroup of latest Keeper drones built
g_KeeperDroneLastBuilt = ""

-- SobGroup of latest Mover built
g_MoverLastBuilt = ""

-- Number of drones to build each build phase
g_drones_per_build = 2

-- This defines which location the Keepers will attack
g_spawn_location = "Far_"

-- Keepers will run through their behaviour (build/hyperspace) this often
g_Keeper_Behaviour_Interval = 50

-- Random factor to add to the interval
g_Keeper_Behaviour_Random = 10

-- Keepers will run through the behaviour interval this many times before deciding to hyperspace out and come back in someplace else
-- DO NOT SET THIS TO 1 OR ELSE!
g_Keeper_Hyperspace_Out_Frequency = 3

-- How much you have to hurt a keeper before it phases out (at this percentage of health they will phase out)
g_keeper_pain_tolerance = 0.5

-- Pain tolerance for round 2, in case you want to make any changes
g_keeper_pain_tolerance_phase_2 = 0.75

-- Keepers will phase back in this long after phasing out
g_Keeper_Phaseback_Time = 25

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After_Phaseouts values will be initialised in order to add Bentus as a target
g_Add_Bentus_To_Attack_Priorities = 1

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After__More_Phaseouts values will be initialised in order to Make Bentus a more attractive target
g_Increase_Bentus_In_Attack_Priorities = 7

-- The Bentus priority in the target list is set to this when the above g_Add_Bentus_To_Attack_Priorities number of phaseouts have occured The lower it is, the more times Bentus will be attacked before moving on to other target selections
g_Bentus_Attack_Priority_After_Phaseouts = 5

-- The Bentus priority will increase by this much each time its attacked.  Which is to say, the lower it is, the more often they will come under attack 
g_Bentus_Attack_Increment_After_Phaseouts =5

-- The same functions, but these are initialised after the g_Increase_Bentus_In_Attack_Priorities phase out in the second wave
g_Bentus_Attack_Increment_After_More_Phaseouts =2

-- Storage for Keeper phase FX
g_Keeper_Phase_Effect_id = 0

-- Name of the Keeper that survived the first phase out in phase 1
g_Keeper_Alive = ""

-- tallys to keep track of how many times the keepers have been through their behaviour 
g_Keeper_1_Tally_Before_Hyperspace = 1
g_Keeper_2_Tally_Before_Hyperspace = 0
g_Keeper_3_Tally_Before_Hyperspace = 1
g_Keeper_4_Tally_Before_Hyperspace = 1
g_Keeper_5_Tally_Before_Hyperspace = 0

-- event pointers
g_pointer_default_1 = 0
g_pointer_default_2 = 0
g_pointer_default_3 = 0
g_pointer_default_4 = 0

-- as described
g_time_until_bentus_arrival = 60

-- pings
ping_escape_marker = "$44504"
ping_escape_marker_id = 0


-- List of Targets and weightings for the Keepers

KeeperTargetList = {
				{"Bentus", 10000, 4},
				{"Players_Mothership_Sob", 8, 5},
				{"Dreadnaught_Sob", 6, 4},
				{"Carriers_Sob", 2, 5},
				{"Destroyers_Sob", 3, 5},
				{"Battlecruisers_Sob", 4, 6},
				{"Movers_Sob", 8, 6},
				{"IonFrigates_Sob", 6, 6},
				{"MobileRefinerys_Sob", 4, 4},		
}

-- The list they use once the dread is repaired
KeeperTargetList_2 = 	{
				{"Bentus", 4, 4},
				{"Players_Mothership_Sob", 3, 4},
				{"Dreadnaught_Sob", 2, 4},	
}

-- MISSION RULES
g_nisstate = 0
-- BEGIN GAME: BEGIN
-- here we display the intro intelevents

function cheat()
	Event_Start( "intelevent_missioncomplete" )
--~ 	Rule_Add( "Rule_Keepers_Mad" )
	
end

function cheat_bentusi()
	Event_Start( "intelevent_bentusiarrive" )
end

function OnInit()
	SPRestrict()
--~ 	UI_BindKeyEvent( IKEY, 'cheat' )	
--~ 	UI_BindKeyEvent( KKEY,'cheat_bentusi' )
	Rule_Add("Rule_Init")
--~ 	Rule_Add( "Rule_CheckForNISComplete" )
	Camera_Interpolate( 'here', 'Camera_Startpos', 0)
	Preload_Ship( "Meg_Bentus" )
end



function Enable_ResearchOptions()

	Player_UnrestrictResearchOption( 0, "DestroyerHealthUpgrade1" ) --DestroyerHealthUpgrade1 
	Player_UnrestrictResearchOption( 0, "DestroyerMAXSPEEDUpgrade1" ) --DestroyerMAXSPEEDUpgrade1 

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
	
	HW2_SetResearchLevel( 10 )
	
        -- Sob Group setup
	SobGroup_LoadPersistantData("Hgn_Mothership")
	
	-- Set up the groups that will never change	
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType( Players_Mothership, "Player_Ships0", "Hgn_MotherShip" )	
	
	Dreadnaught = "Dreadnaught"
	SobGroup_Create(Dreadnaught)
	SobGroup_FillShipsByType( Dreadnaught, "Player_Ships0", "Hgn_Dreadnaught" )
	
	-- Unrestrict the mover hardpoint
	SobGroup_SetDisplayedRestrictedHardpoint("Players_Mothership",0)
	
	SobGroup_SetMadState("Droid_1", "Docked" )
	SobGroup_SetMadState("Droid_2", "Docked" )
	
	-- Disable panning
--~ 	Camera_UsePanning(0)	
	
	-- Sobgroup Create
	SobGroup_Create("Carriers_Sob")
	SobGroup_Create("Destroyers_Sob")
	SobGroup_Create("Dreadnaught_Sob")
	SobGroup_Create("Players_Mothership_Sob")
	SobGroup_Create("Battlecruisers_Sob")
	SobGroup_Create("Movers_Sob")
	SobGroup_Create("IonFrigates_Sob")
	SobGroup_Create("MobileRefinerys_Sob")
	SobGroup_Create("Bombers_Sob")
	SobGroup_Create("Gunships_Sob")
	SobGroup_Create("Collectors_Sob")
	SobGroup_Create("TorpedoFrigates_Sob")
	SobGroup_Create("Minelayers_Sob")
	
	
	-- Again, set up these groups as they are static
	SobGroup_SobGroupAdd("Players_Mothership_Sob", Players_Mothership)
	SobGroup_SobGroupAdd("Dreadnaught_Sob", Dreadnaught)
	
	
	-- One to store built Movers
	SobGroup_Create("All_Movers")
	
	-- Get attack priority groups from players ships
	Get_Players_Fleet_Groups()
	
	
	-- Tell me about the reactive settings
	HW2_ReactiveInfo()
	
	-- Music time	
	Sound_SpeechSubtitlePath("speech:missions/m_10/")

	ShipToParadeRoundTypeName = "Players_Mothership"
	
	-- Create SobGroup to store drones in
	SobGroup_Create("g_all_drones")
	SobGroup_Create("g_Drone_Built")	
	SobGroup_Create("g_KeeperDroneLastBuilt")
	SobGroup_Create("g_MoverLastBuilt")
	
	-- Create SobGroup to store movers in
	SobGroup_Create("g_all_movers")
	SobGroup_Create("g_mover_built")	
	SobGroup_Create("g_MoverLastBuilt")
	
	
 	SetAlliance( 0, 2 )
	SetAlliance( 2, 0 )
	
	
		
	
	
	-- Disable Dreadnaught main gun
	SobGroup_ChangePower( Dreadnaught, "Weapon_Triton1", 0 )
	
	-- This section sets the game to be very hard.  Will be driven from reactive fleet
	-- Rule_Add("Rule_Set_Difficulty")
	
	-- Setup Player Names
	Player_SetPlayerName( 0,"$44505" )
	Player_SetPlayerName( 1,"$44506" )
	Player_SetPlayerName( 2,"$44507" )

	Rule_Add("Rule_PlayerLose")
	Rule_Add("Rule_Dreadnaught_Destroyed")
	Rule_Add("Rule_Dreadnaught_Damaged")
	Rule_Add("Rule_Start")
	
	Rule_Remove( "Rule_Init" )
end
-- END GAME: BEGIN
-- This sets an inordinate number of variables on the basis of fleet size
function Rule_Set_Difficulty()
	
	-- Set_Keepers_Test()
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
	if ( ReactiveFleetRatio < 0.8 ) then
		g_difficulty = 1
		Set_Keepers_Easy()
		print("Set Difficulty to easy")
	elseif ( ReactiveFleetRatio < 1.4 ) then
		g_difficulty = 2
		Set_Keepers_Medium()
		print("Set Difficulty to medium")
	else
		g_difficulty = 3
		Set_Keepers_Hard()
		print("Set Difficulty to hard")
	end

	Rule_Remove ("Rule_Set_Difficulty")
end

function Rule_Start()
	
	Event_Start("intelevent_pulledout")
	Rule_Add( "Rule_EnableResearchAfterIntelevent" )
	Sound_EnterIntelEvent()	
	
	-- This means the Keepers will hyperspace in at the far points
	g_spawn_location = "Far_"
		
	Rule_Add("Rule_Keeper_Down_First_Wave")
		
	Rule_Remove("Rule_Start")
end

function Rule_EnableResearchAfterIntelevent()
	if ( Event_IsDone( "intelevent_pulledout" ) == 1 ) then
		Enable_ResearchOptions()
		Rule_Remove( "Rule_EnableResearchAfterIntelevent" )		
	end
end


function Rule_Open_Droid_Wings_1()
	if (  SobGroup_AreAllInRealSpace("Droid_1") == 1) then
		
		SobGroup_SetMadState("Droid_1", "Launched" )
	
		Rule_Remove("Rule_Open_Droid_Wings_1")
	end
end

function Rule_Open_Droid_Wings_2()
	if (  SobGroup_AreAllInRealSpace("Droid_2") == 1) then
		
		SobGroup_SetMadState("Droid_2", "Launched" )
	
		Rule_Remove("Rule_Open_Droid_Wings_2")
	end
end

-- Check to see if a Keeper has reached phase point
function Rule_Keeper_Down_First_Wave()
	if (SobGroup_HealthPercentage("Keeper_1") <= 0.5) or (SobGroup_HealthPercentage("Keeper_2") <= 0.5) then
		if (SobGroup_HealthPercentage("Keeper_1") <= 0.5)  then
			Event_Start("intelevent_onedown")
			SobGroup_SetInvulnerability ("Keeper_1", 1)
			SobGroup_SetInvulnerability ("Keeper_2", 1)
			Rule_Remove("Rule_Keeper_1_Act")
			g_Keeper_Phase_Out = "Keeper_1"
			g_Keeper_Alive="Keeper_2"
		end
		if (SobGroup_HealthPercentage("Keeper_2") <= 0.5) then
			Event_Start("intelevent_onedown")
			SobGroup_SetInvulnerability ("Keeper_2", 1)
			SobGroup_SetInvulnerability ("Keeper_1", 1)
			Rule_Remove("Rule_Keeper_2_Act")
			g_Keeper_Phase_Out = "Keeper_2"
			g_Keeper_Alive="Keeper_1"
		end
		Rule_Add("Rule_Keeper_Both_First_Wave")
		Rule_Remove("Rule_Keeper_Down_First_Wave")
	end
end

-- Both of the keepers in the first wave have phased out
function Rule_Keeper_Both_First_Wave()
	if (SobGroup_HealthPercentage(g_Keeper_Alive) <= 0.5) then
		SobGroup_SetInvulnerability (g_Keeper_Alive, 1)
		print("Rule 2 run")
		Event_Start("intelevent_secondkeeperdestroyed")
		
		Rule_Remove("Rule_Keeper_1_Act")
		Rule_Remove("Rule_Keeper_2_Act")
		Rule_Remove("Rule_Keeper_Both_First_Wave")
	end	
end	



function Rule_Bentus_Arrive()
	
	Rule_Add("Rule_Dread_Docked")
	Rule_Add("Rule_Bentus_Wounded")
	Rule_Add("Rule_Bentus_Destroyed")
	
	
	Event_Start("intelevent_bentusiarrive")
	
	Rule_Remove("Rule_Bentus_Arrive")
	
end

-- Dreadnaught is docked w/ bentus
function Rule_Dread_Docked()

	if ( SobGroup_IsDockedSobGroup( Dreadnaught, "Bentus" ) == 1 ) then

		SobGroup_ForceStayDockedIfDocking( Dreadnaught )
		
		Rule_Add("Rule_Start_Timer")
		-- Rule_AddInterval("Rule_Dread_Repairs_Complete", g_time_to_repair_dread)
		
		-- Rule_Add("Rule_Bentus_Lightly_Wounded")
		
		Event_Start("intelevent_dreadrepairstart")
		
		KeeperTargetList[3][2] = 10000
				
		Rule_Remove("Rule_Dread_Docked")
	end
end

function Rule_Start_Timer()

		Timer_Start( 0, g_time_to_repair_dread)
		
		g_timer_started = 1
		
		Timer_Display( 0 )
		Subtitle_TimeCounter( 0, 44685 )
		
		Rule_Add("Rule_Dread_Repairs_Complete")
				
		Rule_Remove("Rule_Start_Timer")

end


-- Dread is in the middle of repairs, Keepers get pissed off and kick some arse
function Rule_Keepers_Mad()

	SobGroup_SetInvulnerability ("Keeper_1", 0)
	SobGroup_SetInvulnerability ("Keeper_2", 0)
	Event_Start("intelevent_morekeepers")
	SobGroup_SetHealth("Keeper_1", 1)
	SobGroup_SetHealth("Keeper_2", 1)
	
	Rule_AddInterval("Rule_Keeper_1_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))
	Rule_AddInterval("Rule_Keeper_2_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))	
	Rule_AddInterval("Rule_Keeper_3_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))	
	Rule_AddInterval("Rule_Keeper_4_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))	

	Rule_Add("Rule_Keeper_1_Phaseout")
	Rule_Add("Rule_Keeper_2_Phaseout")
	Rule_Add("Rule_Keeper_3_Phaseout")
	Rule_Add("Rule_Keeper_4_Phaseout")
	
	g_spawn_location = "Close_"
	g_drone_cap = g_drone_cap_phase_2
	g_mover_cap = g_mover_cap_phase_2
	g_keeper_pain_tolerance = g_keeper_pain_tolerance_phase_2
	
	if (g_difficulty == 1) then
		
		Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_2" )
		
	elseif (g_difficulty == 2) then
		
		Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_3" )
		
	elseif (g_difficulty == 3) then
		
		Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_4" )
		
	end	

	Rule_Remove("Rule_Keepers_Mad")

end

-- Bentusi takes light damage
function Rule_Bentus_Lightly_Wounded()
	if ( SobGroup_HealthPercentage('Bentus') <= 0.95 ) then
		Event_Start("speechevent_bentusscratched")
		Rule_Remove("Rule_Bentus_Lightly_Wounded")
	end
end


-- Bentusi are copping a beating
function Rule_Bentus_Wounded()
	if ( SobGroup_HealthPercentage('Bentus') <= 0.5 ) then
		Event_Start("speechevent_bentusdamaged")
		Rule_Remove("Rule_Bentus_Wounded")
	end
end

-- The player lets the bentusi get destroyed.  You've destroyed a civilisation that has lasted millenia, and taught the ways of peace to millions. Well done.
function Rule_Bentus_Destroyed()
	if ( SobGroup_Count("Bentus") == 0 ) then
		Event_Start("intelevent_bentusdestroyed")
		Rule_Remove("Rule_Bentus_Destroyed")
	end
end

-- Repairs on the Dreadnaught are complete
function Rule_Dread_Repairs_Complete()
	if ( Timer_GetRemaining( 0 )  <= 0 ) then
	
		g_Dreadnaught_Repair_Status = 1
		-- Bring Keepers back up to speed
		Event_Start("intelevent_dreadrepaired")
		Objective_SetState(obj_prim_repairdread_id , OS_Complete )
		SobGroup_ChangePower( Dreadnaught, "Weapon_Triton1", 1 )
		
		Timer_Pause( 0 )
		Subtitle_TimeCounterEnd()
		
		KeeperTargetList = KeeperTargetList_2 
		
		if (g_difficulty == 1) then
		
			Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_3" )
		
		elseif (g_difficulty == 2) then
		
			Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_4" )
		
		elseif (g_difficulty == 3) then
		
			Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_5" )
		
		end
		
		Rule_Remove("Rule_Dread_Repairs_Complete")
	end

end

-- Dreadnaught has been destroyed
function Rule_Dreadnaught_Destroyed()

	if ( SobGroup_HealthPercentage(Dreadnaught) <= 0 ) then
		
		Event_Start("intelevent_dreaddestroyed")
		
		Objective_SetState(obj_prim_repairdread_id , OS_Failed )
		
		Rule_Remove("Rule_Dreadnaught_Destroyed")
		
	end
	
end

-- Dread damaged

function Rule_Dreadnaught_Damaged()
		
	if ( SobGroup_HealthPercentage(Dreadnaught) <= 0.5 ) then
	
		Event_Start("speechevent_dreaddamaged")
		
		Rule_Remove("Rule_Dreadnaught_Damaged")
	end
end
	
-- Player has lost the mothership
function Rule_PlayerLose()
	
	if ( SobGroup_Count( Players_Mothership ) == 0 ) then
		
		Event_Start( "speechevent_playerloses" )
		
		Rule_Remove( "Rule_PlayerLose" )
		
	end
	
end

-- Play NIS - this is called from the final Intel Event, once the player has cleared minimum safe distance
function Rule_PlayNIS()
	NISLoad( "nis/NIS10" )
	g_currentNISPlaying_id = NISPlay( "nis/NIS10" )
--~ 	g_currentNISPlaying_id = NISPlayFromGroup( "nis/NIS10", "Bentus" )
	Rule_Add( "Rule_NISCompleted" )
	Rule_Remove( "Rule_PlayNIS" )
end

-- Once the NIS is complete, finish the mission
function Rule_NISCompleted()
	if ( NISComplete( g_currentNISPlaying_id ) == 1 ) then
		setMissionComplete( 1 )
		Rule_Remove( "Rule_NISCompleted" )
	end
end

-- This is the somewhat nasty part of the script, with rampant cut and paste.  Reason being, each component is on a discrete timer
-----------------------------------------------------------------------------------------

function Rule_Keeper_1_Act()
	
	g_Keeper_1_Tally_Before_Hyperspace = g_Keeper_1_Tally_Before_Hyperspace + 1

	if (g_Keeper_1_Tally_Before_Hyperspace == g_Keeper_Hyperspace_Out_Frequency) then
		print("Keeper 1 Entering Hyperspace")
		SobGroup_SetInvulnerability("Keeper_1", 1)
		SobGroup_EnterHyperSpaceOffMap("Keeper_1")
		g_Keeper_1_Tally_Before_Hyperspace = 0
	else
		Keeper_Behaviour_Core(1)
	end

end

function Rule_Keeper_1_Phaseout()

	if (SobGroup_HealthPercentage("Keeper_1") <= g_keeper_pain_tolerance) then
		g_Keeper_Phase_Out = "Keeper_1"
		
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh", "Keeper_1", 1)
		
		Keeper_Phase_2_Has_Run()
		
		SobGroup_Despawn("Keeper_1")
		
		Rule_AddInterval("Rule_Keeper_1_Phaseback", g_Keeper_Phaseback_Time)
		
		Rule_Remove("Rule_Keeper_1_Act")
		
		Rule_Remove("Rule_Keeper_1_Phaseout")
		
	end
	
end

function Rule_Keeper_1_Phaseback()

	SobGroup_SetHealth("Keeper_1", 1)
	SobGroup_ExitHyperSpace("Keeper_1" , "Keeper_Spawn_"..g_spawn_location..RandomIntMax(10) )
	-- Gives the Keeper a target	
	Keeper_Select_Attack_Target(1)
	g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_1", 1)
	Rule_AddInterval("Rule_Keeper_1_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))
	Rule_Add("Rule_Keeper_1_Phaseout")
	
	Rule_Remove("Rule_Keeper_1_Phaseback")
end

function Rule_Keeper_2_Act()
	
	g_Keeper_2_Tally_Before_Hyperspace = g_Keeper_2_Tally_Before_Hyperspace + 1

	if (g_Keeper_2_Tally_Before_Hyperspace == g_Keeper_Hyperspace_Out_Frequency) then
		print("Keeper 2 Entering Hyperspace")
		SobGroup_SetInvulnerability("Keeper_2", 1)
		SobGroup_EnterHyperSpaceOffMap("Keeper_2")
		g_Keeper_2_Tally_Before_Hyperspace = 0
	else
		Keeper_Behaviour_Core(2)
	end

end

function Rule_Keeper_2_Phaseout()

	if (SobGroup_HealthPercentage("Keeper_2") <= g_keeper_pain_tolerance) then
		g_Keeper_Phase_Out = "Keeper_2"
		
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh", "Keeper_2", 1)
		
		Keeper_Phase_2_Has_Run()
				
		SobGroup_Despawn("Keeper_2")
		
		Rule_AddInterval("Rule_Keeper_2_Phaseback", g_Keeper_Phaseback_Time)
		
		Rule_Remove("Rule_Keeper_2_Act")
		
		Rule_Remove("Rule_Keeper_2_Phaseout")
		
	end
	
end

function Rule_Keeper_2_Phaseback()

	SobGroup_SetHealth("Keeper_2", 1)
	SobGroup_ExitHyperSpace("Keeper_2" , "Keeper_Spawn_"..g_spawn_location..RandomIntMax(10) )
	-- Gives the Keeper a target	
	Keeper_Select_Attack_Target(2)
	g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_2", 1)
	Rule_AddInterval("Rule_Keeper_2_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))
	Rule_Add("Rule_Keeper_2_Phaseout")
	
	Rule_Remove("Rule_Keeper_2_Phaseback")
end


function Rule_Keeper_3_Act()
	
	g_Keeper_3_Tally_Before_Hyperspace = g_Keeper_3_Tally_Before_Hyperspace + 1

	if (g_Keeper_3_Tally_Before_Hyperspace == g_Keeper_Hyperspace_Out_Frequency) then
		print("Keeper 3 Entering Hyperspace")
		SobGroup_SetInvulnerability("Keeper_3", 1)
		SobGroup_EnterHyperSpaceOffMap("Keeper_3")
		g_Keeper_3_Tally_Before_Hyperspace = 0
	else
		Keeper_Behaviour_Core(3)
	end

end

function Rule_Keeper_3_Phaseout()

	if (SobGroup_HealthPercentage("Keeper_3") <= g_keeper_pain_tolerance) then
		g_Keeper_Phase_Out = "Keeper_3"
		
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh", "Keeper_3", 1)
		
		Keeper_Phase_2_Has_Run()		
		
		SobGroup_Despawn("Keeper_3")
		
		Rule_AddInterval("Rule_Keeper_3_Phaseback", g_Keeper_Phaseback_Time)
		
		Rule_Remove("Rule_Keeper_3_Act")
		
		Rule_Remove("Rule_Keeper_3_Phaseout")
		
	end
	
end

function Rule_Keeper_3_Phaseback()

	SobGroup_SetHealth("Keeper_3", 1)
	SobGroup_ExitHyperSpace("Keeper_3" , "Keeper_Spawn_"..g_spawn_location..RandomIntMax(10) )
	-- Gives the Keeper a target	
	Keeper_Select_Attack_Target(3)
	g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_3", 1)
	Rule_AddInterval("Rule_Keeper_3_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))
	Rule_Add("Rule_Keeper_3_Phaseout")
	
	Rule_Remove("Rule_Keeper_3_Phaseback")
end

function Rule_Keeper_4_Act()
	
	g_Keeper_4_Tally_Before_Hyperspace = g_Keeper_4_Tally_Before_Hyperspace + 1

	if (g_Keeper_4_Tally_Before_Hyperspace == g_Keeper_Hyperspace_Out_Frequency) then
		print("Keeper 4 Entering Hyperspace")
		SobGroup_SetInvulnerability("Keeper_4", 1)
		SobGroup_EnterHyperSpaceOffMap("Keeper_4")
		g_Keeper_4_Tally_Before_Hyperspace = 0
	else
		Keeper_Behaviour_Core(4)
	end

end

function Rule_Keeper_4_Phaseout()

	if (SobGroup_HealthPercentage("Keeper_4") <= g_keeper_pain_tolerance) then
		g_Keeper_Phase_Out = "Keeper_4"
		
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh", "Keeper_4", 1)
		
		Keeper_Phase_2_Has_Run()
		
		SobGroup_Despawn("Keeper_4")
		
		Rule_AddInterval("Rule_Keeper_4_Phaseback", g_Keeper_Phaseback_Time)
		
		Rule_Remove("Rule_Keeper_4_Act")
		
		Rule_Remove("Rule_Keeper_4_Phaseout")
		
	end
	
end

function Rule_Keeper_4_Phaseback()

	SobGroup_SetHealth("Keeper_4", 1)
	SobGroup_ExitHyperSpace("Keeper_4" , "Keeper_Spawn_"..g_spawn_location..RandomIntMax(10) )
	-- Gives the Keeper a target	
	Keeper_Select_Attack_Target(4)
	g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_4", 1)
	Rule_AddInterval("Rule_Keeper_4_Act", g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random)))
	Rule_Add("Rule_Keeper_4_Phaseout")
	
	Rule_Remove("Rule_Keeper_4_Phaseback")
end

-- End of the great big nasty cut and past-y bits
-----------------------------------------------------------------------------

-- HELPER FUNCTIONS FOR KEEPER BEHAVIOUR, CALLED FROM RULES
-----------------------------------------------------------------------------

-- This is the regular check to see if the Keeper needs to do something
function Keeper_Behaviour_Core(Keeper_Number)
	-- If in Hyperspace, Emerge and select a target
	if (SobGroup_AreAllInHyperspace("Keeper_"..Keeper_Number) == 1) then
		
		Keeper_Hyperspace_In(Keeper_Number)
		print ("Keeper_"..Keeper_Number.." exiting hyperspace")
	-- Otherwise, check to see if any drones need building
	elseif (SobGroup_Count("All_Drones") < g_drone_cap) then
		
		Keeper_Build_Drones(Keeper_Number)
		print ("Keeper_"..Keeper_Number.." Building Drones")
	end
end



-- This function grabs an attack target from the KeeperTargetList and assigns it to a Keeper to attack
function Keeper_Select_Attack_Target(Keeper_Number)

        local lowestTargetValue = 1000000
        local shipToAttack = 0
        local currentTargetValue = 0
        
        -- Refresh groups to make sure we're up to date
       Get_Players_Fleet_Groups()
	
        -- attack the ship with the lowest weight (second value)
        for i=1, getn(KeeperTargetList) do
                -- get the value of the current target
                currentTargetValue = KeeperTargetList[i][2]
                -- compare it to the value of the last ship
                if (currentTargetValue < lowestTargetValue) then
                        -- this is the lowest ship so make it the lowest ship
                        lowestTargetValue = currentTargetValue
                        -- this is now the ship we want to build
                        shipToAttack = i
                end

        end

        -- we now have the lowest target
        -- attack the lowest
        
        print("Attack Target is "..shipToAttack)
        print(KeeperTargetList[shipToAttack][1])
        if (SobGroup_Empty(KeeperTargetList[shipToAttack][1]) ~= 1) then
        
        	SobGroup_Attack(1, "Keeper_"..Keeper_Number, KeeperTargetList[shipToAttack][1])
                -- increase this ships weight by the specified value
                KeeperTargetList[shipToAttack][2] = KeeperTargetList[shipToAttack][2] + KeeperTargetList[shipToAttack][3]
                
                print ("Keeper_"..Keeper_Number.." attacking "..shipToAttack)
        else
        	-- Just attack the player
        	SobGroup_AttackPlayer( "Keeper_"..Keeper_Number , 0 )
        	
        	print ("Keeper_"..Keeper_Number.." defaulting to attacking player")
        	
        	-- Triple the reweighting on the now empty group
        	KeeperTargetList[shipToAttack][2] = KeeperTargetList[shipToAttack][2] + KeeperTargetList[shipToAttack][3] + KeeperTargetList[shipToAttack][3] + KeeperTargetList[shipToAttack][3]
        end

end

function Get_Players_Fleet_Groups()

	-- Get attack priority groups from players ships

	SobGroup_FillShipsByType("Carriers_Sob", "Player_Ships0", "Hgn_Carrier" )
	SobGroup_FillShipsByType("Destroyers_Sob", "Player_Ships0", "Hgn_Destroyer" )
	SobGroup_FillShipsByType("Battlecruisers_Sob", "Player_Ships0", "Hgn_Battlecruiser" )
	SobGroup_FillShipsByType("Movers_Sob", "Player_Ships0", "Kpr_Mover" )
	SobGroup_FillShipsByType("IonFrigates_Sob", "Player_Ships0", "Hgn_IonCannonFrigate" )
	SobGroup_FillShipsByType("MobileRefinerys_Sob", "Player_Ships0", "Hgn_ResourceController" )
	SobGroup_FillShipsByType("Bombers_Sob", "Player_Ships0", "Hgn_AttackBomber" )
	SobGroup_FillShipsByType("Gunships_Sob", "Player_Ships0", "Hgn_AssaultCorvette" )
	SobGroup_FillShipsByType("Collectors_Sob", "Player_Ships0", "Hgn_ResourceCollector" )
	SobGroup_FillShipsByType("TorpedoFrigates_Sob", "Player_Ships0", "Hgn_TorpedoFrigate" )
	SobGroup_FillShipsByType("Minelayers_Sob", "Player_Ships0", "Hgn_MinelayerCorvette" )

end


function Keeper_Build_Drones(Keeper_Number)
	
	for i=1, g_drones_per_build do

		SobGroup_Clear(g_KeeperDroneLastBuilt)
		-- Build drone
		g_KeeperDroneLastBuilt = SobGroup_CreateShip( "Keeper_"..Keeper_Number, "Kpr_AttackDroid" )
		-- Add drone to the all drones group
		SobGroup_SobGroupAdd("All_Drones", g_KeeperDroneLastBuilt)
		SobGroup_AttackPlayer("All_Drones", 0)
	end
end

function Keeper_Hyperspace_In(Keeper_Number)
	
--	local random_number = RandomIntMax(2)
--	if (random_number == 0) then
--	
--		g_spawn_location = "Far_"
--	
--	elseif (random_number == 1) then
--
--		g_spawn_location = "Close_"
--	
--	elseif (random_number == 2) then
--	
--		g_spawn_location = "Bentus_"
--	
--	end
	
	local random_location = RandomIntMax(10)

	-- Spawns a keeper at the random selection within the currently defined location
	SobGroup_ExitHyperSpace("Keeper_"..Keeper_Number , "Keeper_Spawn_"..g_spawn_location..random_location )
	
	-- Resets the Keeper to sane health levels
	SobGroup_SetInvulnerability("Keeper_"..Keeper_Number, 0)
	
	-- Builds Movers, if Needed
	if (SobGroup_Count("All_Movers") < g_mover_cap) then
	
		--print ("Keeper bringing in Movers at Keeper_Spawn_"..g_spawn_location..random_location )
		-- Keeper_Build_Movers(random_location)
	
	end
	
	-- Gives the Keeper a target
	Keeper_Select_Attack_Target(Keeper_Number)
end


function Keeper_Build_Movers(random_location)

	for i=1, g_movers_per_build do
		
		SobGroup_Clear("g_MoverLastBuilt")
		-- Spawn the Mover at the same position as the Keeper who ordered it
		SobGroup_SpawnNewShipInSobGroup (1,"Kpr_Mover", "g_MoverLastBuilt", "g_MoverLastBuilt", "Keeper_Spawn_"..g_spawn_location..random_location)
		SobGroup_SobGroupAdd("All_Movers", "g_MoverLastBuilt")
		SobGroup_AttackPlayer("All_Movers", 0)
		
	end

end

function Initial_Intel_Keeper_Build()
	
	for i=1,2 do
		g_KeeperDroneLastBuilt = SobGroup_CreateShip( "Keeper_1", "Kpr_AttackDroid" )
		-- Add drone to the all drones group
		FOW_RevealGroup("g_KeeperDroneLastBuilt", 1)
		SobGroup_SobGroupAdd("All_Drones", "g_KeeperDroneLastBuilt")
	end
	
	for i=1,2 do

		SobGroup_Clear(g_KeeperDroneLastBuilt)
		g_KeeperDroneLastBuilt = SobGroup_CreateShip( "Keeper_2", "Kpr_AttackDroid" )
		-- Add drone to the all drones group
		FOW_RevealGroup("g_KeeperDroneLastBuilt", 1)
		SobGroup_SobGroupAdd("All_Drones", "g_KeeperDroneLastBuilt")
	end
	Rule_Add("Rule_Set_Difficulty")
	SobGroup_AttackPlayer("All_Drones", 0)
end

-- This function is called everytime a Keeper phases out and handles the various logic involved
function Keeper_Phase_2_Has_Run()
	
	-- Increase the keeper phase out tally
	g_keepers_time_phased_out = g_keepers_time_phased_out + 1
	
	Set_Bentus_Attack_Priorities()

	-- Check to see if we've hit the number of phase outs required to trigger the next event.  Only applies if the Dreadnaught has been repaired.
	
	-- Start the counter after the Dreadnaughts repair that keeps track of how many more phases til done
	if (g_Dreadnaught_Repair_Status == 1) then
		g_keepers_time_phased_out_post_repair = g_keepers_time_phased_out_post_repair + 1
		
		if (g_keepers_time_phased_out_post_repair == 1 ) then
			-- Make the Keepers pick on Bentus now
			g_spawn_location = "Bentus_"
		
			-- Make Bentus a very attractive proposition
			KeeperTargetList[1][3] = g_Bentus_Attack_Increment_After_More_Phaseouts
		
			Event_Start("speechevent_bentusscratched")
		
			Objective_AddDescription( obj_prim_destroykeepers_id, "$44700")
		end
		
		if (g_keepers_time_phased_out_post_repair == 2 ) then
			Event_Start("speechevent_keepers_cannot_be_stopped")
		end
	
		if (g_keepers_time_phased_out_post_repair >= 4) then
			Keepers_Phase_Threshold_Reached()	
		end
	-- Unless we've already heard all six avaliable pieces of "Keeper has phased out" then play it again, sam.
	elseif (g_keepers_time_phased_out == 1) then
		Event_Start("speechevent_keepersphase_2")
		
	elseif (g_keepers_time_phased_out == 3) then
		Event_Start("speechevent_keepersphase_1")
		
	elseif (g_keepers_time_phased_out == 5) then
		Event_Start("speechevent_keepersphase_3")
		
		-- Make the Keepers come in close to fight now
		g_spawn_location = "Close_"
		
	elseif (g_keepers_time_phased_out == 7) then
		Event_Start("speechevent_keepersphase_4")
		
	
	elseif (g_keepers_time_phased_out == 9) then
		
		Event_Start("speechevent_keepersphase_5")
	
	end
		
	
	

end


function Set_Bentus_Attack_Priorities()

	if (g_keepers_time_phased_out == g_Add_Bentus_To_Attack_Priorities) then
		-- Add Bentus into the target priorities.
		KeeperTargetList[1][2] = g_Bentus_Attack_Priority_After_Phaseouts
		KeeperTargetList[1][3] = g_Bentus_Attack_Increment_After_Phaseouts

	end
end

---- Trigger NIS
--
--g_ipressed = 0
--UI_BindKeyEvent( IKEY, 'cheat_i' )
--
--
--function cheat_i()
--	if g_ipressed > 1 then
--		NISLoad( "nis/NIS10" )
--		g_NISState = NISPlay( "nis/NIS10" )
--	end
--end
	


function Keepers_Phase_Threshold_Reached()
	
	if (g_keeper_final_scene_play_once == 0) then
	
		g_keeper_final_scene_play_once = 1
		-- This really should do a few things.  Make Bentus invulnerable.  Hyperspace Every Keeper off the map.  Re-enter them in attack vectors all around Bentus, and order them to attack.
		SobGroup_Despawn("Keeper_1")
		SobGroup_Despawn("Keeper_2")
		SobGroup_Despawn("Keeper_3")
		SobGroup_Despawn("Keeper_4")

		
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_1", 1)
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_2", 1)
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_3", 1)
		g_Keeper_Phase_Effect_id = FX_PlayEffect( "kpr_phase_destroyer_mesh_phaseout", "Keeper_4", 1)
	
		-- Make sure the player can't lose now
		Rule_Remove("Rule_Bentus_Destroyed")
		Rule_Remove("Rule_Bentus_Wounded")
		Rule_Remove("Keeper_Phase_2_Has_Run")
		Rule_Remove("Rule_Keeper_1_Phaseout")
		Rule_Remove("Rule_Keeper_2_Phaseout")
		Rule_Remove("Rule_Keeper_3_Phaseout")
		Rule_Remove("Rule_Keeper_4_Phaseout")
	
		Rule_Remove("Rule_Keeper_1_Phaseback")
		Rule_Remove("Rule_Keeper_2_Phaseback")
		Rule_Remove("Rule_Keeper_3_Phaseback")
		Rule_Remove("Rule_Keeper_4_Phaseback")
	
		SobGroup_SetInvulnerability ("Bentus", 1)
	
		Event_Start("intelevent_missioncomplete")

	end
end

-- Different profiles to elicit different difficulties
function Set_Keepers_Easy()

	-- GLOBAL VARIABLES TO ASSIST GAME TUNING
-- This stores the actual time taken to restore the Dreadnaught to full working order once it has been docked w/ Bentus
g_time_to_repair_dread = 300

-- It is this long after the Bentusi arrive that the Keepers return with friends (actually, it's from the start of the Bentus arrival intelevent, so make sure it's about 60 seconds longer than otherwise)
-- (actually, at the moment it's this long after you dock the dread.  which is cheap, because if you never dock, the mission never ends.  I should fix it.  And I did.  How about that)
g_keepers_mad_time = 600


-- This is the number of times you need to force a Keeper to phase out after the Dreadnaught has been repaired in order to trigger stage 3 (the bentusi requiem)
g_keepers_phase_threshold = 3

-- After this many drones are built, the Keepers will not build any more
g_drone_cap = 7

-- Drone cap for wave two, where there are four Keepers to deal with
g_drone_cap_phase_2 = 7

-- Defines Mover cap 
g_mover_cap = 4

-- Defines Mover cap for phase two 
g_mover_cap_phase_2 = 6

-- Number of Movers who hyperspace in each time they do so
g_movers_per_build = 1

-- Number of drones to build each build phase
g_drones_per_build = 1

-- Keepers will run through their behaviour (build/hyperspace) this often
g_Keeper_Behaviour_Interval = 60

-- Random factor to add to the interval
g_Keeper_Behaviour_Random = 10

-- Keepers will run through the behaviour interval this many times before deciding to hyperspace out and come back in someplace else
g_Keeper_Hyperspace_Out_Frequency = 2

-- How much you have to hurt a keeper before it phases out (at this percentage of health they will phase out)
g_keeper_pain_tolerance = 0.5

-- Pain tolerance for round 2, in case you want to make any changes
g_keeper_pain_tolerance_phase_2 = 0.75

-- Keepers will phase back in this long after phasing out
g_Keeper_Phaseback_Time = 30

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After_Phaseouts values will be initialised in order to add Bentus as a target
g_Add_Bentus_To_Attack_Priorities = 1

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After__More_Phaseouts values will be initialised in order to Make Bentus a more attractive target
g_Increase_Bentus_In_Attack_Priorities = 3

-- The Bentus priority in the target list is set to this when the above g_Add_Bentus_To_Attack_Priorities number of phaseouts have occured The lower it is, the more times Bentus will be attacked before moving on to other target selections
g_Bentus_Attack_Priority_After_Phaseouts = 5

-- The Bentus priority will increase by this much each time its attacked.  Which is to say, the lower it is, the more often they will come under attack 
g_Bentus_Attack_Increment_After_Phaseouts =5

-- The same functions, but these are initialised after the g_Increase_Bentus_In_Attack_Priorities phase out in the second wave
g_Bentus_Attack_Increment_After_More_Phaseouts =3

-- The first entry MUST be bentus
-- the third MUST be the Dreadnaught
-- First Value is current weight, second is amount to increase the demand by each time it is built.  Lowest weight is attacked each time.
-- Allowed groups are

--Carriers_Sob
--Destroyers_Sob
--Dreadnaught_Sob
--Players_Mothership_Sob
--Battlecruisers_Sob
--Movers_Sob
--IonFrigates_Sob
--MobileRefinerys_Sob
--Bombers_Sob
--Gunships_Sob
--Collectors_Sob
--TorpedoFrigates_Sob


	KeeperTargetList = 
	{
				{"Bentus", 10000, 4},
				{"Players_Mothership_Sob", 8, 6},
				{"Dreadnaught_Sob", 8, 4},
				{"Carriers_Sob", 8, 8},
				{"Bombers_Sob", 3, 3},
				{"Collectors_Sob", 4, 3},
				{"Movers_Sob", 3, 2},
				{"Gunships_Sob", 5, 3},
				{"MobileRefinerys_Sob", 6, 4},		
	}
	
	KeeperTargetList_2 = 
	{
				{"Bentus", 4, 4},
				{"Players_Mothership_Sob", 3, 4},
				{"Dreadnaught_Sob", 2, 4},	
	}

	Player_GrantResearchOption( 1, "KeeperHealthUpgradeSPGAME_M10_LVL_1" )
	Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_1" )
	

end

function Set_Keepers_Hard()

	-- GLOBAL VARIABLES TO ASSIST GAME TUNING
-- This stores the actual time taken to restore the Dreadnaught to full working order once it has been docked w/ Bentus
g_time_to_repair_dread = 600

-- It is this long after the Bentusi arrive that the Keepers return with friends (actually, it's from the start of the Bentus arrival intelevent, so make sure it's about 60 seconds longer than otherwise)
-- (actually, at the moment it's this long after you dock the dread.  which is cheap, because if you never dock, the mission never ends.  I should fix it.  And I did.  How about that)
g_keepers_mad_time = 120


-- This is the number of times you need to force a Keeper to phase out after the Dreadnaught has been repaired in order to trigger stage 3 (the bentusi requiem)
g_keepers_phase_threshold = 3

-- After this many drones are built, the Keepers will not build any more
g_drone_cap = 10

-- Drone cap for wave two, where there are four Keepers to deal with
g_drone_cap_phase_2 = 12

-- Defines Mover cap 
g_mover_cap = 8

-- Defines Mover cap for phase two 
g_mover_cap_phase_2 = 14

-- Number of Movers who hyperspace in each time they do so
g_movers_per_build = 3

-- Number of drones to build each build phase
g_drones_per_build = 3

-- Keepers will run through their behaviour (build/hyperspace) this often
g_Keeper_Behaviour_Interval = 60

-- Random factor to add to the interval
g_Keeper_Behaviour_Random = 10

-- Keepers will run through the behaviour interval this many times before deciding to hyperspace out and come back in someplace else
g_Keeper_Hyperspace_Out_Frequency = 3

-- How much you have to hurt a keeper before it phases out (at this percentage of health they will phase out)
g_keeper_pain_tolerance = 0.25

-- Pain tolerance for round 2, in case you want to make any changes
g_keeper_pain_tolerance_phase_2 = 0.50

-- Keepers will phase back in this long after phasing out
g_Keeper_Phaseback_Time = 10

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After_Phaseouts values will be initialised in order to add Bentus as a target
g_Add_Bentus_To_Attack_Priorities = 1

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After__More_Phaseouts values will be initialised in order to Make Bentus a more attractive target
g_Increase_Bentus_In_Attack_Priorities = 7

-- The Bentus priority in the target list is set to this when the above g_Add_Bentus_To_Attack_Priorities number of phaseouts have occured The lower it is, the more times Bentus will be attacked before moving on to other target selections
g_Bentus_Attack_Priority_After_Phaseouts = 5

-- The Bentus priority will increase by this much each time its attacked.  Which is to say, the lower it is, the more often they will come under attack 
g_Bentus_Attack_Increment_After_Phaseouts =3

-- The same functions, but these are initialised after the g_Increase_Bentus_In_Attack_Priorities phase out in the second wave
g_Bentus_Attack_Increment_After_More_Phaseouts =2

-- The first entry MUST be bentus
-- First Value is current weight, second is amount to increase the demand by each time it is built.  Lowest weight is attacked each time.
-- Allowed groups are

--Carriers_Sob
--Destroyers_Sob
--Dreadnaught_Sob
--Players_Mothership_Sob
--Battlecruisers_Sob
--Movers_Sob
--IonFrigates_Sob
--MobileRefinerys_Sob
--Bombers_Sob
--Gunships_Sob
--Collectors_Sob
--TorpedoFrigates_Sob

	KeeperTargetList = 
	{
				{"Bentus", 10000, 3},
				{"Players_Mothership_Sob", 8, 6},
				{"Dreadnaught_Sob", 6, 3},
				{"Carriers_Sob", 2, 2},
				{"Destroyers_Sob", 3, 4},
				{"Battlecruisers_Sob", 1, 2},
				{"Movers_Sob", 8, 6},
				{"IonFrigates_Sob", 6, 6},
				{"MobileRefinerys_Sob", 4, 6},		
	}

	KeeperTargetList_2 = 
	{
				{"Bentus", 4, 4},
				{"Players_Mothership_Sob", 3, 4},
				{"Dreadnaught_Sob", 2, 4},	
	}
	
	Player_GrantResearchOption( 1, "KeeperHealthUpgradeSPGAME_M10_LVL_2" )
	Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_3" )

end

function Set_Keepers_Medium()

	-- GLOBAL VARIABLES TO ASSIST GAME TUNING
-- This stores the actual time taken to restore the Dreadnaught to full working order once it has been docked w/ Bentus
g_time_to_repair_dread = 420

-- It is this long after the Bentusi arrive that the Keepers return with friends (actually, it's from the start of the Bentus arrival intelevent, so make sure it's about 60 seconds longer than otherwise)
-- (actually, at the moment it's this long after you dock the dread.  which is cheap, because if you never dock, the mission never ends.  I should fix it.  And I did.  How about that)
g_keepers_mad_time = 200


-- This is the number of times you need to force a Keeper to phase out after the Dreadnaught has been repaired in order to trigger stage 3 (the bentusi requiem)
g_keepers_phase_threshold = 3

-- After this many drones are built, the Keepers will not build any more
g_drone_cap = 12

-- Drone cap for wave two, where there are four Keepers to deal with
g_drone_cap_phase_2 = 12

-- Defines Mover cap 
g_mover_cap = 6

-- Defines Mover cap for phase two 
g_mover_cap_phase_2 = 8

-- Number of Movers who hyperspace in each time they do so
g_movers_per_build = 2

-- Number of drones to build each build phase
g_drones_per_build = 2

-- Keepers will run through their behaviour (build/hyperspace) this often
g_Keeper_Behaviour_Interval = 20

-- Random factor to add to the interval
g_Keeper_Behaviour_Random = 30

-- Keepers will run through the behaviour interval this many times before deciding to hyperspace out and come back in someplace else
g_Keeper_Hyperspace_Out_Frequency = 4

-- How much you have to hurt a keeper before it phases out (at this percentage of health they will phase out)
g_keeper_pain_tolerance = 0.3

-- Pain tolerance for round 2, in case you want to make any changes
g_keeper_pain_tolerance_phase_2 = 0.5

-- Keepers will phase back in this long after phasing out
g_Keeper_Phaseback_Time = 20

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After_Phaseouts values will be initialised in order to add Bentus as a target
g_Add_Bentus_To_Attack_Priorities = 2

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After__More_Phaseouts values will be initialised in order to Make Bentus a more attractive target
g_Increase_Bentus_In_Attack_Priorities = 4

-- The Bentus priority in the target list is set to this when the above g_Add_Bentus_To_Attack_Priorities number of phaseouts have occured The lower it is, the more times Bentus will be attacked before moving on to other target selections
g_Bentus_Attack_Priority_After_Phaseouts = 5

-- The Bentus priority will increase by this much each time its attacked.  Which is to say, the lower it is, the more often they will come under attack 
g_Bentus_Attack_Increment_After_Phaseouts = 4

-- The same functions, but these are initialised after the g_Increase_Bentus_In_Attack_Priorities phase out in the second wave
g_Bentus_Attack_Increment_After_More_Phaseouts = 2

-- The first entry MUST be bentus
-- First Value is current weight, second is amount to increase the demand by each time it is built.  Lowest weight is attacked each time.
-- Allowed groups are

--Carriers_Sob
--Destroyers_Sob
--Dreadnaught_Sob
--Players_Mothership_Sob
--Battlecruisers_Sob
--Movers_Sob
--IonFrigates_Sob
--MobileRefinerys_Sob
--Bombers_Sob
--Gunships_Sob
--Collectors_Sob
--TorpedoFrigates_Sob

	KeeperTargetList = 
	{
				{"Bentus", 10000, 3},
				{"Players_Mothership_Sob", 8, 6},
				{"Dreadnaught_Sob", 6, 3},
				{"Carriers_Sob", 2, 2},
				{"Destroyers_Sob", 3, 4},
				{"Battlecruisers_Sob", 1, 2},
				{"Movers_Sob", 8, 6},
				{"IonFrigates_Sob", 6, 6},
				{"MobileRefinerys_Sob", 4, 6},
				{"Bombers_Sob", 3, 3},
				{"Collectors_Sob", 4, 3},
				{"Movers_Sob", 3, 2},
				{"Gunships_Sob", 5, 3},
				{"MobileRefinerys_Sob", 6, 4},			
	}


	KeeperTargetList_2 = 
	{
				{"Bentus", 4, 4},
				{"Players_Mothership_Sob", 3, 4},
				{"Dreadnaught_Sob", 2, 4},	
	}
	
	Player_GrantResearchOption( 1, "KeeperHealthUpgradeSPGAME_M10_LVL_2" )
	Player_GrantResearchOption( 1, "KeeperWeaponUpgradeSPGAME_M10_LVL_2" )
end

function Set_Keepers_Test()

	-- GLOBAL VARIABLES TO ASSIST GAME TUNING
-- This stores the actual time taken to restore the Dreadnaught to full working order once it has been docked w/ Bentus
g_time_to_repair_dread = 300

-- It is this long after the Bentusi arrive that the Keepers return with friends (actually, it's from the start of the Bentus arrival intelevent, so make sure it's about 60 seconds longer than otherwise)
-- (actually, at the moment it's this long after you dock the dread.  which is cheap, because if you never dock, the mission never ends.  I should fix it.  And I did.  How about that)
g_keepers_mad_time = 30


-- This is the number of times you need to force a Keeper to phase out after the Dreadnaught has been repaired in order to trigger stage 3 (the bentusi requiem)
g_keepers_phase_threshold = 3

-- After this many drones are built, the Keepers will not build any more
g_drone_cap = 1

-- Drone cap for wave two, where there are four Keepers to deal with
g_drone_cap_phase_2 = 1

-- Defines Mover cap 
g_mover_cap = 6

-- Defines Mover cap for phase two 
g_mover_cap_phase_2 = 8

-- Number of Movers who hyperspace in each time they do so
g_movers_per_build = 2

-- Number of drones to build each build phase
g_drones_per_build = 1

-- Keepers will run through their behaviour (build/hyperspace) this often
g_Keeper_Behaviour_Interval = 60

-- Random factor to add to the interval
g_Keeper_Behaviour_Random = 1

-- Keepers will run through the behaviour interval this many times before deciding to hyperspace out and come back in someplace else
g_Keeper_Hyperspace_Out_Frequency = 2

-- How much you have to hurt a keeper before it phases out (at this percentage of health they will phase out)
g_keeper_pain_tolerance = 0.75

-- Pain tolerance for round 2, in case you want to make any changes
g_keeper_pain_tolerance_phase_2 = 0.75

-- Keepers will phase back in this long after phasing out
g_Keeper_Phaseback_Time = 20

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After_Phaseouts values will be initialised in order to add Bentus as a target
g_Add_Bentus_To_Attack_Priorities = 2

-- After this many Keepers in the second wave have been forced out, g_Bentus_Attack_Priority_After__More_Phaseouts values will be initialised in order to Make Bentus a more attractive target
g_Increase_Bentus_In_Attack_Priorities = 4

-- The Bentus priority in the target list is set to this when the above g_Add_Bentus_To_Attack_Priorities number of phaseouts have occured The lower it is, the more times Bentus will be attacked before moving on to other target selections
g_Bentus_Attack_Priority_After_Phaseouts = 5

-- The Bentus priority will increase by this much each time its attacked.  Which is to say, the lower it is, the more often they will come under attack 
g_Bentus_Attack_Increment_After_Phaseouts = 4

-- The same functions, but these are initialised after the g_Increase_Bentus_In_Attack_Priorities phase out in the second wave
g_Bentus_Attack_Increment_After_More_Phaseouts = 2

-- The first entry MUST be bentus
-- First Value is current weight, second is amount to increase the demand by each time it is built.  Lowest weight is attacked each time.
-- Allowed groups are

--Carriers_Sob
--Destroyers_Sob
--Dreadnaught_Sob
--Players_Mothership_Sob
--Battlecruisers_Sob
--Movers_Sob
--IonFrigates_Sob
--MobileRefinerys_Sob
--Bombers_Sob
--Gunships_Sob
--Collectors_Sob
--TorpedoFrigates_Sob

	KeeperTargetList = 
	{
				{"Bentus", 10000, 3},
				{"Players_Mothership_Sob", 8, 6},
				{"Dreadnaught_Sob", 6, 3},
				{"Carriers_Sob", 2, 2},
				{"Destroyers_Sob", 3, 4},
				{"Battlecruisers_Sob", 1, 2},
				{"Movers_Sob", 8, 6},
				{"IonFrigates_Sob", 6, 6},
				{"MobileRefinerys_Sob", 4, 6},
				{"Bombers_Sob", 3, 3},
				{"Collectors_Sob", 4, 3},
				{"Movers_Sob", 3, 2},
				{"Gunships_Sob", 5, 3},
				{"MobileRefinerys_Sob", 6, 4},			
	}


	KeeperTargetList_2 = 
	{
				{"Bentus", 4, 4},
				{"Players_Mothership_Sob", 3, 4},
				{"Dreadnaught_Sob", 2, 4},	
	}
	
	Player_GrantResearchOption( 1, "KeeperHealthUpgradeSPGAME_M10_LVL_1" )
end


-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end

--- END OF THE HELPER FUNCTIONS
----------------------------------------------------------------------------------------
-- EVENTS
-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_pulledout = 
{
--~ 	{
--~ 		HW2_Wait(5),
--~ 	},
	{	
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_LocationCardEvent( "$44510", 6 ),
	},
	{
		HW2_Wait ( 3 ),
	},
	{		
		{"Sound_MusicPlayType( 'data:sound/music/staging/STAGING_08', MUS_Staging )","" },
		HW2_SubTitleEvent( Actor_FleetCommand, "$44540", 5 ),	-- Something's wrong.
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$44541", 5 ),	-- We've been pulled out of Hyperspace
	},
	{
		HW2_Letterbox ( 1 ),
		{ "Universe_EnableSkip(1)", "" },
        },
        {
        	{"Sensors_Toggle( 0 )","" },
		HW2_Wait ( 1 ),
        },
        {
	        { "Camera_Interpolate( 'here', 'Camera_MassiveAnomaly', 2)",""},
	        HW2_Wait ( 2 ),
	},
	{
		{"g_pointer_default_1 = HW2_CreateEventPointerVolume( 'Keeper_1_Entry' )",""},
--~ 		HW2_Wait( 1 ),
		HW2_SubTitleEvent( Actor_FleetIntel, "$44542", 5 ),	-- Massive anomaly detected.
	},
	{
--~ 		{ "Camera_Interpolate( 'here', 'Camera_Keeper_1_Longshot', 3)",""},
		{"EventPointer_Remove(g_pointer_default_1)",""},
		{"SobGroup_ExitHyperSpace('Keeper_1', 'Keeper_1_Entry')", ""},
		{"SobGroup_ExitHyperSpace('Droid_1', 'Keeper_1_Entry')", ""},
		{"FOW_RevealGroup('Keeper_1', 1)",""},
		{"FOW_RevealGroup('Droid_1', 1)",""},
		{"Rule_Add('Rule_Open_Droid_Wings_1')", ""},
		HW2_Wait(2),
		{"Player_SetGlobalROE( 1, PassiveROE )", ""},
	},
	{
		{"Camera_Interpolate( 'here', 'Camera_Keeper_1_Closeup', 3)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44543", 5 ),	-- (repeating something over and over)
	},
	{
		HW2_Wait(1),
	},
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44544", 5 ),	-- Alert!
--~ 	},
	{
		{ "Camera_Interpolate( 'here', 'Camera_Keeper_2_Incoming', 3)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44545", 5 ),	-- Second hyperspace signature detected.
	},
	{
		{"SobGroup_ExitHyperSpace('Keeper_2', 'Keeper_Spawn_Intro')", ""},
		{"SobGroup_ExitHyperSpace('Droid_2', 'Keeper_Spawn_Intro')", ""},
		{"Rule_Add('Rule_Open_Droid_Wings_2')", ""},
		{"FOW_RevealGroup('Keeper_2', 1)",""},
		{"FOW_RevealGroup('Droid_2', 1)",""},
		{"Player_SetGlobalROE( 1, PassiveROE )", ""},
		HW2_Wait(3),
	},
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44546", 5 ),	-- There are now two Keepers.
--~ 	},
	{
		{ "Camera_Interpolate( 'here', 'Camera_Keeper_Both', 4)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44547", 5 ),	-- (repeating something over and over)
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44548", 5 ),	-- Translating:
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44549", 5 ),	-- "We are the Keepers of Abassid.
	},
	{
--~ 		{"Camera_Interpolate( 'here', 'Camera_Keeper_1_Attack', 3)",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44550", 5 ),	-- We are the servants of Sajuuk"
	},
	{
		{"Initial_Intel_Keeper_Build()", ""},
		HW2_Wait (2),
	},
	{
		{"Player_SetGlobalROE( 1, OffensiveROE )", ""},
		{"Sound_MusicPlayType( 'data:sound/music/battle/Battle_Keeper', MUS_Battle )","" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$44551", 5 ),	-- The Keepers are assuming attack formation and launching attack drones
	},
	{
		{"SobGroup_AttackPlayer( 'Droid_1', 0 )", ""},
		{"SobGroup_AttackPlayer( 'Droid_2', 0 )", ""},
		{"Keeper_Select_Attack_Target(1)", ""},
		{"Keeper_Select_Attack_Target(2)", ""},
		HW2_Wait(1),
	},
	{
		{ "Camera_FocusSobGroupWithBuffer( 'Keeper_1', 600, 0, 3)",""},
		HW2_Wait(3),
	},
	{
		{ "Camera_UseCameraPoint( 'Camera_Recede' )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$44552", 5 ),	-- Full combat alert!

        },
	{
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
--~ 		{"Camera_UsePanning(1)", ""},	
		{"Universe_EnableSkip(0)", "" },
		{"Sensors_EnableCameraZoom( 1 )","" },
		{"obj_prim_destroykeepers_id = Objective_Add( obj_prim_destroykeepers , OT_Primary )",""},
		{"Objective_AddDescription( obj_prim_destroykeepers_id, '$44680')", "" },
		{"Rule_AddInterval('Rule_Keeper_1_Act', (g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random))))", ""},
		{"Rule_AddInterval('Rule_Keeper_2_Act', (g_Keeper_Behaviour_Interval + (RandomIntMax(g_Keeper_Behaviour_Random))))", ""},
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
	{
		{"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
		HW2_Wait ( 1 ),
		{"g_save_id = g_save_id + 1",""},
	},
	{
		{"Campaign_QuickSaveNb( g_save_id, '$6440' )",""}, -- ..' Mission Start'
	},
}


Events.intelevent_onedown =
{
	{
		 HW2_Letterbox( 1 ),
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		{"Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 0 )","" },
		{ "Camera_FocusSobGroupWithBuffer( g_Keeper_Phase_Out, 500, 100, 2 )", "" },
                { "Universe_EnableSkip(1)", "" },                                                       -- Enable Intel event skipping
	        HW2_Wait ( 2 ),
        },
	{
		{"Sensors_EnableCameraZoom( 1 )","" },
		{"SobGroup_Despawn(g_Keeper_Phase_Out)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_destroyer_mesh', g_Keeper_Phase_Out, 1)", ""},
		HW2_Wait(7),
	},
	{
		{ "Sensors_Toggle( 1 )","" },
		HW2_Pause(1),
		HW2_SubTitleEvent( Actor_FleetIntel, "$44555", 5 ),	-- A Keeper has vanished.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44556", 5 ),	-- Sensors indicate there was a major energy distortion in the vessel before it disappeared.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44557", 5 ),	-- There are no signs of debris.
	},
	{	
                HW2_Pause(0),
        	{ "Sensors_Toggle( 0 )","" },
        	{ "SobGroup_SetInvulnerability (g_Keeper_Alive, 0)", ""},
		HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },
		HW2_Wait(2),	                                                    
        },
        {        	
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

-- Keepers using freeze rays
-- Line currently unused
Events.speechevent_stunned = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44560", 5 ),	-- The Keepers are using an unknown energy weapon.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

-- Keepers stealing dread
-- Line currently unused
Events.speechevent_captureattempt = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44565", 5 ),	-- The Keeper is using Movers to capture the Dreadnaught.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44566", 5 ),	-- They must be stopped!
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

-- Keepers steal dread
-- Line currently unused
Events.speechevent_capturesuccess = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44570", 5 ),	-- The Keeper has seized control of the Dreadnaught.  Recapture it immediately!
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44571", 5 ),	-- Critical alert!
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

-- Player gets Dread back
-- Line currently unused
Events.speechevent_recapture = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44575", 5 ),	-- The Dreadnaught is back under our control.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

-- Keepers immune to dread
-- Line currently unused
Events.speechevent_keepershields = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44580", 5 ),	-- The Dreadnaught cannon seems useless against the Keepers.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44581", 5 ),	-- They have been designed to withstand it.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_secondkeeperdestroyed = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		HW2_Letterbox( 1 ),
		HW2_Wait(3),
	},
	{
		{"Universe_EnableSkip(1)",""},
		{ "Sensors_Toggle( 0 )","" },
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Camera_FocusSobGroupWithBuffer( g_Keeper_Alive, 300, 100, 3 )", "" },
		HW2_Wait(3),
	},
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_destroyer_mesh', g_Keeper_Alive, 1)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_attackdroid_mesh', 'All_Drones', 1)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_attackdroid_mesh', 'Droid_1', 1)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_attackdroid_mesh', 'Droid_2', 1)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_attackdroid_mesh', 'All_Drones', 1)", ""},
		{"SobGroup_Despawn(g_Keeper_Alive)", ""},
		{"SobGroup_Despawn('All_Drones')", ""},
		{"SobGroup_Despawn('Droid_1')", ""},
		{"SobGroup_Despawn('Droid_2')", ""},	
		HW2_SubTitleEvent( Actor_FleetIntel, "$44585", 5 ),	-- The Keepers have simply disappeared!
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44586", 5 ),	-- No known cloaking field signature was detected.
		{"SobGroup_Clear('All_Drones')", ""},
	},
	{
		HW2_Letterbox( 0 ),
		{"Universe_EnableSkip(0)",""},
		HW2_Wait(3),
		{"Rule_AddInterval('Rule_Bentus_Arrive', g_time_until_bentus_arrival)", ""},
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_bentusiarrive = 	
{	
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
--~ 	COMMENTING THIS OUT FOR NOW
--~ 		HW2_SubTitleEvent( Actor_FleetCommand, "$43046", 5 ), --  Hyperspace signature detected
		--MJJ 43046
	},
	{
		HW2_Letterbox(1),
		HW2_Wait(2),
		{ "Sensors_Toggle( 0 )","" },
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{"Universe_EnableSkip(1)",""},
--~ 		{ "Camera_Interpolate( 'here', 'Camera_Bentusi_Anticipation', 3)",""},
	},
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{"Sound_MusicPlayType( 'data:sound/music/battle/BENTUS_ARRIVAL', MUS_Staging )","" },
		HW2_SubTitleEvent( Actor_FleetCommand, "$44587", 5 ),
	},
	{
		HW2_Wait(1),
	},
	{
		{"SobGroup_ExitHyperSpace('Bentus', 'bentus_spawn' )", ""},
		{"FOW_RevealGroup('Bentus', 1)",""},
		{ "Camera_Interpolate( 'here', 'Camera_Bentusi', 6)",""},
		HW2_Wait(28),
	},
	{
		HW2_SubTitleEvent( Actor_Bentusi, "$44588", 5 ),	-- We see you have acquired a Progenitor Dreadnaught.
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_Bentusi, "$44589", 5 ),	-- This is a most powerful weapon.
	},
	{
		HW2_Wait(1),
	},
	{
		{ "Sensors_Toggle( 1 )","" },
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Camera_Interpolate( 'here', 'Camera_Bentusi_Anticipation', 3)",""},
--~ 		{ "Camera_Interpolate( 'here', 'Camera_Bentus_Dread', 3)",""},
		{"g_pointer_default_1 = HW2_CreateEventPointerSobGroup( 'Bentus' )",""},
		{"g_pointer_default_2 = HW2_CreateEventPointerSobGroup( Dreadnaught )",""},
		HW2_SubTitleEvent( Actor_Bentusi, "$44590", 5 ),	-- Bring it to us and we will repair the Great Cannon.
	},
	{
		HW2_Wait(1),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		
		{"EventPointer_Remove(g_pointer_default_1)",""},
		{"EventPointer_Remove(g_pointer_default_2)",""},
		{ "Camera_FocusSobGroupWithBuffer( Dreadnaught, 600, 0, 2 )", "" },
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{"obj_prim_repairdread_id = Objective_Add( obj_prim_repairdread , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_repairdread_id, '$44681')", "" },
		
		HW2_Wait(2),
	},
	{
		
		{ "Sensors_EnableCameraZoom( 1 )","" },
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{"Universe_EnableSkip(0)",""},
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
		{"Rule_AddInterval('Rule_Keepers_Mad', g_keepers_mad_time)", ""},
	},
	{
		{"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
		HW2_Wait ( 1 ),
		{"g_save_id = g_save_id + 1",""},
	},
	{
		{"Campaign_QuickSaveNb( g_save_id, '$6441' )",""}, -- ..' Bentusi Arrival'
	},
}

Events.intelevent_dreadrepairstart = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$44645", 5 ),	
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_morekeepers = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
		{"Universe_EnableSkip(1)",""},
		HW2_Letterbox( 1 ),
		HW2_Wait(2)
	},
	{
		 { "Sensors_EnableCameraZoom( 0 )","" },
		{ "Sensors_Toggle( 1 )","" },
		HW2_Wait( 1 ),

	},
	{	
		{"SobGroup_ExitHyperSpace('Keeper_1', 'Keeper_Spawn_Return_1' )", ""},
		{"SobGroup_SetHealth('Keeper_1', 1)",""},
		{"SobGroup_ExitHyperSpace('Keeper_2', 'Keeper_Spawn_Return_2' )", ""},
		{"SobGroup_SetHealth('Keeper_2', 1)",""},
		{"SobGroup_ExitHyperSpace('Keeper_3', 'Keeper_Spawn_Return_3' )", ""},
		{"SobGroup_SetHealth('Keeper_3', 1)",""},
		{"SobGroup_ExitHyperSpace('Keeper_4', 'Keeper_Spawn_Return_4' )", ""},
		{"SobGroup_SetHealth('Keeper_4', 1)",""},
		{"SobGroup_ExitHyperSpace('Droid_3', 'Keeper_Spawn_Return_1' )", ""},
		{"SobGroup_ExitHyperSpace('Droid_4', 'Keeper_Spawn_Return_2' )", ""},
		{"SobGroup_ExitHyperSpace('Droid_5', 'Keeper_Spawn_Return_3' )", ""},
		{"SobGroup_SobGroupAdd('All_Drones', 'Droid_3')", ""},
		{"SobGroup_SobGroupAdd('All_Drones', 'Droid_4')", ""},
		{"SobGroup_SobGroupAdd('All_Drones', 'Droid_5')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44600", 5 ),	-- Alert! Four inbound contacts acquired.
		{"Sound_MusicPlayType( 'data:sound/music/battle/Battle_Keeper', MUS_Battle )","" },
	},
	{
		{ "Camera_Interpolate( 'here', 'Camera_Keepers_Return', 3)",""},
		{"g_pointer_default_1 = HW2_CreateEventPointerSobGroup( 'Keeper_1' )",""},
		{"g_pointer_default_2 = HW2_CreateEventPointerSobGroup( 'Keeper_2' )",""},
		{"g_pointer_default_3 = HW2_CreateEventPointerSobGroup( 'Keeper_3' )",""},
		{"g_pointer_default_4 = HW2_CreateEventPointerSobGroup( 'Keeper_4' )",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$44601", 5 ),	-- The Keepers have returned.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44602", 5 ),	-- We must defend Bentus at all costs.
	},
	{

		{"Universe_EnableSkip(0)",""},
		{ "Sensors_Toggle( 0 )","" },
		HW2_Letterbox( 0 ),
		HW2_Wait(2),
		{"Keeper_Select_Attack_Target(1)", ""},
		{"Keeper_Select_Attack_Target(2)", ""},
		{"Keeper_Select_Attack_Target(3)", ""},
		{"Keeper_Select_Attack_Target(4)", ""},
		{"SobGroup_AttackPlayer( 'Droid_3', 0 )", ""},
		{"SobGroup_AttackPlayer( 'Droid_4', 0 )", ""},
		{"SobGroup_AttackPlayer( 'Droid_5', 0 )", ""},
		{"EventPointer_Remove(g_pointer_default_1)",""},
		{"EventPointer_Remove(g_pointer_default_2)",""},
		{"EventPointer_Remove(g_pointer_default_3)",""},
		{"EventPointer_Remove(g_pointer_default_4)",""},
		{"obj_prim_defendbentus_id = Objective_Add( obj_prim_defendbentus , OT_Primary )", ""},
		{"Objective_AddDescription( obj_prim_defendbentus_id, '$44682')", ""},
		 { "Sensors_EnableCameraZoom( 1 )","" },
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}


Events.intelevent_dreadrepaired = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		{"Universe_EnableSkip(1)",""},
		HW2_Letterbox( 1 ),
		HW2_Pause( 1 ),
		HW2_Wait(2),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		{ "Sensors_EnableCameraZoom( 0 )","" },
		{ "Camera_Interpolate( 'here', 'Camera_Dread_Repairs', 3)",""},
		HW2_SubTitleEvent( Actor_Bentusi, "$44622", 5 ),	-- We have repaired the Great Cannon.
	},
	{
		{"SobGroup_Launch(Dreadnaught, 'Bentus')", ""},
		HW2_SubTitleEvent( Actor_Bentusi, "$44623", 5 ),	-- You will find it requires time to recharge after it has been fired.
	},
	{
		{"Universe_EnableSkip(0)",""},
		HW2_Letterbox( 0 ),
		HW2_Wait(3),
	},
	{
		HW2_Pause( 0 ),
	},
	{
		{ "Sensors_EnableCameraZoom( 1 )","" },
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
	{
		{"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
		HW2_Wait ( 1 ),
		{"g_save_id = g_save_id + 1",""},
	},
	{
		{"Campaign_QuickSaveNb( g_save_id, '$6442' )",""}, -- ..' Dreadnaught Repaired'
	},
	{
		{"SobGroup_AbilityActivate('Bentus', AB_AcceptDocking, 0)", ""},
	},
}




Events.speechevent_keepersphase_1 = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44655", 5 ),	-- The Keeper has phased out to avoid destruction.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44656", 5 ),	-- Analysis confirms the Keepers energy profile is gaining in power
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44667", 5 ),	-- It appears they're getting stronger with each Hyperspace jump.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_keepersphase_4 = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44668", 5 ),	-- The Keepers are avoiding our weapon fire by phasing out.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_keepersphase_3 = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44615", 5 ),	-- A Keeper has phased out
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_keepersphase_2 = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44692", 5 ),	-- Keeper Phase Out Detected.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}
Events.speechevent_keepers_cannot_be_stopped = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44669", 5 ),	-- The Keepers cannot be stopped.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}
	

Events.intelevent_dreaddestroyed = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_Letterbox ( 1 ),
	},
	{
		{ "Sensors_Toggle( 0 )","" },
		{ "Sensors_EnableCameraZoom( 0 )","" },		
		{ "Camera_FocusSobGroupWithBuffer( Dreadnaught, 100, 100, 1 )", "" },
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44691", 5 ),	-- The Dreadnaught has been destroyed
	},
	{
		HW2_Wait(2)
	},
	{
		HW2_Wait(1),
		HW2_Fade( 1 ),
	},
	{
		HW2_LocationCardEvent( "$44671", 4 ),
	},
	{
		{"setMissionComplete(0)", ""},
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_bentusdestroyed = 
{
	{
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_Letterbox ( 1 ),
		{ "Sensors_Toggle( 0 )","" },
	},
	{
		{ "Camera_Interpolate( 'here', 'Camera_Final_Bentus', 3)",""},
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44640", 5 ),	-- Bentus is going critical!
	},
	{		
		HW2_Fade( 1 ),
	},
	{
		HW2_LocationCardEvent( "$44670", 4 ),
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}


Events.speechevent_bentusscratched = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44603", 5 ),	-- The Keepers are focusing their attacks on Bentus.
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44606", 5 ),	-- Bentus and the Dreadnaught must be defended.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_dreaddamaged = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44690", 5 ),	-- PICKUP REQUIRED The Dreadnaught is taking heavy damage.  We cannot afford to lose it! PICKUP REQUIRED - LINE CAN BE STOLEN FROM MISSION 9 IF NEEDED
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.speechevent_bentusdamaged = 
{
	{
		{"Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44610", 5 ),	-- Bentus is taking heavy damage.  We must defend it from the Keepers.
	},
	{
		{"Sound_ExitIntelEvent()",""},
		{ "Sound_SetMuteActor('')", ""},
	},
}

Events.intelevent_missioncomplete = 
{
	{
		{ "Sound_EnterIntelEvent()",""},
		{ "Sound_SetMuteActor('Fleet')", ""},
	},
--~ 	{
--~ 		{"SobGroup_Spawn('Keeper_1', 'Keeper_Spawn_Finale_1_Setup' )",""},
--~ 		{"SobGroup_Spawn('Keeper_2', 'Keeper_Spawn_Finale_2_Setup' )",""},
--~ 		{"SobGroup_Spawn('Keeper_3', 'Keeper_Spawn_Finale_3_Setup' )",""},
--~ 		{"SobGroup_Spawn('Keeper_4', 'Keeper_Spawn_Finale_4_Setup' )",""},
--~ 	},
	{
		HW2_Letterbox( 1 ),
		HW2_Wait(3),
		{ "Sensors_Toggle( 0 )","" },
		{ "Universe_AllowPlayerOrders( 0 )", "" },		
		{ "SobGroup_DeSelectAll()",""},
	},
	{
		{ "Camera_AllowControl(0)",""},
		{"SobGroup_Despawn('Keeper_1')",""},
		{"SobGroup_Despawn('Keeper_2')",""},
		{"SobGroup_Despawn('Keeper_3')",""},
		{"SobGroup_Despawn('Keeper_4')",""},	
		{ "Camera_Interpolate( 'here', 'Camera_Final_Bentus', 3)",""},
		HW2_SubTitleEvent( Actor_Bentusi, "$44625", 5 ),	-- There is only one way to destroy the Keepers.		
	},
	{
		{"SobGroup_Spawn('Keeper_1', 'Keeper_Spawn_Finale_1' )",""},
		{"SobGroup_Spawn('Keeper_2', 'Keeper_Spawn_Finale_2' )",""},
		{"SobGroup_Spawn('Keeper_3', 'Keeper_Spawn_Finale_3' )",""},
		{"SobGroup_Spawn('Keeper_4', 'Keeper_Spawn_Finale_4' )",""},		
		HW2_Wait(0.2),
	},
	{		
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_destroyer_mesh', 'Keeper_1', 1)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_destroyer_mesh', 'Keeper_2', 1)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_destroyer_mesh', 'Keeper_3', 1)", ""},
		{"g_Keeper_Phase_Effect_id = FX_PlayEffect( 'kpr_phase_destroyer_mesh', 'Keeper_4', 1)", ""},
		{"SobGroup_AttackPlayer( 'Keeper_1', 2 )", ""},
		{"SobGroup_AttackPlayer( 'Keeper_2', 2 )", ""},
		{"SobGroup_AttackPlayer( 'Keeper_3', 2 )", ""},
		{"SobGroup_AttackPlayer( 'Keeper_4', 2 )", ""},
		HW2_SubTitleEvent( Actor_Bentusi, "$44626", 5 ),	-- They will come with us.
	},
	{		
		HW2_Wait(2),
	},
	{
		HW2_SubTitleEvent( Actor_Bentusi, "$44627", 5 ),	-- Our task is done. Yours remains.
	},
	{		
		HW2_Wait(2),
	},
	{		
		
		HW2_SubTitleEvent( Actor_FleetCommand, "$44630", 5 ),	-- Power surge detected on Bentus
--~ 		{"SobGroup_Despawn (Players_Mothership)",""},
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$44631", 5 ),	-- They are collapsing their quantum wave field to consume the Keepers in its blast.
--~ 		{"SobGroup_Spawn( Players_Mothership, 'Hyperspace_Here' )",""},
	},
	
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44633", 5 ),	-- We must move away from Bentus or we will be caught in the explosion.
--~ 	},
--~ 	{
--~ 		HW2_Fade( 1 ),
--~ 	},
--~ 	{
		
--~ 		HW2_Wait( 1),
--~ 	},
--~ 	{
		
--~ 		HW2_Wait( 1),
--~ 	},
--~ 	{
		
--~ 		{ "Player_InstantDockAndParade( 0, Players_Mothership, 0 )", "", 0 },
--~ 	},
--~ 	{
--~ 		HW2_Wait( 1),
--~ 	},
--~ 	{
--~ 		HW2_Fade( 0 ),
--~ 	},
--~ 	{
--~ 		{ "Camera_Interpolate( 'here', 'Camera_Bentus_Longview', 0)",""},
--~ 	},
	
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$44640", 5 ),	-- Bentus is going critical!
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
	},
	{
		{ "Camera_Interpolate( 'here', 'camera_MSExitsMap', 0)",""},
--~ 		{ "Camera_FocusSobGroupWithBuffer( Players_Mothership, 3000, 0, 2 )", "" },
		HW2_SubTitleEvent( Actor_FleetCommand, "$44632", 5 ),	-- They will not survive
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$44641", 5 ),	-- Hyperspace initiated.
		{ "SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", "" },
	},
--~ 	{
--~ 		
--~ 		HW2_Wait( 1 ),
--~ 	},	
	{
		
		HW2_Wait( 3 ),
	},
	{
		{"SobGroup_Despawn ('Bentus')",""},		
		{"Rule_Add('Rule_PlayNIS')", ""},
	},	
}


Events.speechevent_playerloses =
{
	{
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		HW2_Wait(1),		
	},
	{
		HW2_Fade( 1 ),
		HW2_Wait( 1.2 ),
	},
	
	{
		HW2_LocationCardEvent( "$44672", 4 ),
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}



--~ -- Old event, is never triggered thesedays
--~ Events.intelevent_keepersindestructable = 
--~ {
--~ 	{
--~ 		{"Universe_EnableSkip(1)",""},
--~ 		{ "Sensors_Toggle( 0 )","" },
--~ 		HW2_Letterbox( 1 ),
--~ 		HW2_Pause( 1 ),
--~ 		{ "Camera_FocusSobGroup( 'Bentus', 1, 100, 1 )", "" },
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44655", 5 ),	-- The Keeper entered Hyperspace to avoid destruction.
--~ 	},
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44656", 5 ),	-- Analysis confirms the Keepers energy profile is gaining in power
--~ 	},
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44667", 5 ),	-- It appears they're getting stronger with Hyperspace jump.
--~ 	},
--~ 	{
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44668", 5 ),	-- The Keepers are avoiding our weapon fire by Hyperspacing away.
--~ 	},
--~ 	{
--~ 		{"Universe_EnableSkip(0)",""},
--~ 		HW2_Letterbox( 0 ),
--~ 		HW2_Pause( 0 ),
--~ 		{ "Sensors_Toggle( 0 )","" },
--~ 		HW2_SubTitleEvent( Actor_FleetIntel, "$44669", 5 ),	-- The Keepers cannot be stopped. 
--~ 	},
--~ }