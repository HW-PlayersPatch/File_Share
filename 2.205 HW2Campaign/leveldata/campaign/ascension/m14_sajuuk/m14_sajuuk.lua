--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M14_Sajuuk
--  Purpose:  Mission 14 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")

ShipToParadeRoundTypeName = "Hgn_MotherShip"

-- objectives
obj_prim_destroymakaan = "$46500"
obj_prim_destroymakaan_id = 0

obj_sec_destroyShipyard = "$46501"
obj_sec_destroyShipyard_id = 0

obj_prim_protectMothership = "$46502"
obj_prim_protectMothership_id = 0


-- pings
ping_makaan = "$46900"
ping_makaan_id = 0

ping_shipyard = "$46901"
ping_shipyard_id = 0

-- pointers
pointer_makaan_id = 0
pointer_shipyard_id = 0

EventPlaying = 0
NIS14BOver = 0

-- Makaan vars
letMakaanDie = 0
startMakaanFinalWordsONCE = 0

-- global vars
g_now_time = Universe_GameTime()
g_save_id = 0

g_attack_1 = 50
g_attack_2 = 50
g_attack_4 = 150
g_attack_5 = 200

g_shipyard_timer = 400
g_carrier_timer = 200
g_makaan_desperate = 600

PlayerHasDiscoveredShipyard = 0
PlayerHasDiscoveredCarrier = 0

initialAttackDestroyed = 0
shipyardDestroyed = 0

RemoveKamikazeRule = 0

KillMakaan = 0

-- MISSION RULES

-- BEGIN GAME: MAKAAN IS ATTACKING
-- play NIS
function OnInit()
	SPRestrict()
	-- Despawn Hyperspace Core (which is spawned when Makaan dies
	SobGroup_Despawn( "HSCore" )
	
	-- disable Makaan's ability to move & hyperspace
	SobGroup_AbilityActivate( "Vgr_Makaan", AB_Move, 0)
	SobGroup_AbilityActivate( "Vgr_Makaan", AB_Hyperspace, 0)
	SobGroup_AbilityActivate( "Vgr_Sob_Shipyard", AB_Hyperspace, 0)

	SobGroup_SetTeamColours( "Vgr_Makaan", {0.047, 0.047, 0.047}, {0.561,0.0,0.043}, "DATA:Badges/Vaygr.tga" )		-- set Makaan to default teamcolours

	Rule_Add( "Rule_Init_1" )
end

function Rule_Init_1()

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
	Rule_Add ("Rule_setAlliances")
	
	Sound_SpeechSubtitlePath("speech:missions/m_14/")

	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS14A")
	NISDisableInterface(1) -- this disables the interface when the NIS is done playing, it needs to be re-enabled by scar
	
	NISOver = 0
	
	-- temp SobGroup
	SobGroup_Create("tempSobGroup")

	Rule_AddInterval ("Rule_watchForNISDoneFromTimer", 55)
	Rule_Add ("Rule_watchForNISDone")
	Rule_Remove ("Rule_PlayNIS")
	
	Rule_Remove( "Rule_Init_1" )
end


function Rule_DisableSpeech()
--	Sound_EnterIntelEvent()					-- turn off regular gameplay speech to avoid hearing speech right at the beginning of mission
	Sound_EnableAllSpeech( 0 )
	Rule_Remove ("Rule_DisableSpeech")
end

function Rule_setAlliances()
        if ( NISComplete( g_currentNISPlaying_id ) == 1 )  then
		-- Ally Vaygr with Sajuuk so they do line-of-sight checks around him
		SetAlliance( 1, 3 )
		SetAlliance( 3, 1 )

		-- Ally Vaygr with other Vaygr
		SetAlliance( 1, 2 )
		SetAlliance( 2, 1 )
		
		-- Ally the player with Sajuuk so they can't attack it
		SetAlliance( 0, 3 )
		SetAlliance( 3, 0 )

		-- reveal Fog of war on Sajuuk & initial attackers
		FOW_RevealGroup("Sajuuk", 1)
		FOW_RevealGroup("Vgr_Group_1", 1)
		
		Rule_Remove ("Rule_setAlliances")
	end
end

-- watch for the NIS to be far enough along that you can load the persistent fleet et al
function Rule_watchForNISDoneFromTimer()
        if ( NISOver == 0 ) then
		NISOver = 1
		SobGroup_LoadPersistantData("Hgn_Mothership")
		Rule_AddInterval ("Rule_NIS14AHasFinished", 31)				-- play intro speech event
                Rule_AddInterval ("Rule_Init", 32)
                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
                Rule_Remove( "Rule_watchForNISDone" )
        elseif ( NISOver == 1) then
                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
                Rule_Remove( "Rule_watchForNISDone" )
	end
end



-- watch for the NIS to be complete so you can start the level
function Rule_watchForNISDone()
        if ( NISOver == 0 ) and ( NISComplete( g_currentNISPlaying_id ) == 1 )  then
		NISOver = 1
--		Camera_SetLetterboxStateNoUI(0, 0 )					-- turn UI back on
		SobGroup_LoadPersistantData("Hgn_Mothership")
                Rule_AddInterval ("Rule_Init", 1)
		Rule_AddInterval ("Rule_NIS14AHasFinished", 5)				-- play intro speech event
                Rule_Remove( "Rule_watchForNISDone" )
                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
        elseif ( NISOver == 1) then
                Rule_Remove( "Rule_watchForNISDone" )
                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
	end
end






-- watch for the **FINAL ** NIS to be complete so you can end the level
function Rule_watchForLastNISDone()
	if ( NIS14BOver == 0 ) and ( NISComplete( n_currentNISPlaying_id ) == 1 ) then
		NIS14BOver = 1
		Event_Start( "intelevent_endLevel" )
		Rule_Remove( "Rule_watchForLastNISDone" )
	end
end

function Rule_watchForLastNISDoneFromTimer()
	if ( NIS14BOver == 0 ) then
		NIS14BOver = 1
		setMissionComplete( 1 )
		Rule_Remove ("Rule_watchForLastNISDoneFromTimer")
	elseif ( NIS14BOver == 1) then
		NIS14BOver = 1
		Rule_Remove ("Rule_watchForLastNISDoneFromTimer")
	end
end




function Rule_Init()


	-- set player names
	Player_SetPlayerName(0, "$46801")			-- Hiigaran Navy
	Player_SetPlayerName(1, "$46802")			-- Vaygr
	Player_SetPlayerName(2, "$46802")			-- Vaygr
	Player_SetPlayerName(3, "$46803")			-- Progenitor (Sajuuk)


	-- set research level
	HW2_SetResearchLevel( 14 )


	-- Give Vaygr Shipyard and Makaan's Mothership all the production subsystems
	SobGroup_CreateSubSystem( "Vgr_Makaan", "FighterProduction" )
	SobGroup_CreateSubSystem( "Vgr_Makaan", "CorvetteProduction" )
	SobGroup_CreateSubSystem( "Vgr_Makaan", "FrigateProduction" )
	SobGroup_CreateSubSystem( "Vgr_Makaan", "CapShipProduction" )
	SobGroup_CreateSubSystem( "Vgr_Makaan", "PlatformProduction" )
	SobGroup_CreateSubSystem( "Vgr_Makaan", "Research" )
	SobGroup_CreateSubSystem( "Vgr_Makaan", "AdvancedArray" )
	SobGroup_CreateSubSystem( "Vgr_Makaan", "Vgr_MS_Module_FireControl" )

	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "FighterProduction" )
	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "CorvetteProduction" )
	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "FrigateProduction" )
	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "CapShipProduction" )
	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "PlatformProduction" )
	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "Research" )
	Player_RestrictBuildOption(1, "Vgr_MS_Module_Hyperspace")
	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "AdvancedArray" )
	SobGroup_CreateSubSystem( "Vgr_Sob_Shipyard", "Vgr_MS_Module_FireControl" )

	SobGroup_CreateSubSystem( "Vgr_Carrier_1", "FighterProduction" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_1", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_1", "AdvancedArray" )

	SobGroup_CreateSubSystem( "Vgr_Carrier_2", "CorvetteProduction" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_2", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_2", "AdvancedArray" )

	SobGroup_CreateSubSystem( "Vgr_Carrier_3", "FrigateProduction" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_3", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_3", "AdvancedArray" )

	SobGroup_CreateSubSystem( "Vgr_Carrier_4", "FrigateProduction" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_4", "Vgr_C_Module_FireControl" )
	SobGroup_CreateSubSystem( "Vgr_Carrier_4", "AdvancedArray" )

	
	-- give Vaygr all upgrades
--	Player_GrantAllResearch(1)		-- give both CPU players all research so they can start building high-level ships right away
--	Player_GrantAllResearch(2)
	


-- // There are better ways of doing this but there are two missions which GrantAllResearch and I'm taking this opportunity to write out all the upgrades for copying and pasting // --GBX_SCole
-- // Player 1 upgrades (Vaygr)
	Player_GrantResearchOption( 1, "RepairAbility" )
	Player_GrantResearchOption( 1, "ScoutEMPAbility" )
	Player_GrantResearchOption( 1, "BomberImprovedBombs" )

	Player_GrantResearchOption( 1, "CorvetteTech" )
	Player_GrantResearchOption( 1, "FrigateTech" )
	Player_GrantResearchOption( 1, "ProbeSensorDisruption" )
	Player_GrantResearchOption( 1, "ProbeProxSensor" )
	Player_GrantResearchOption( 1, "LanceBeams" )
	Player_GrantResearchOption( 1, "PlasmaBombs" )
	Player_GrantResearchOption( 1, "CorvetteGraviticAttraction" )
	Player_GrantResearchOption( 1, "CorvetteLaser" )
	Player_GrantResearchOption( 1, "CorvetteCommand" )
	Player_GrantResearchOption( 1, "PlatformHeavyMissiles" )
	Player_GrantResearchOption( 1, "FrigateAssault" )
	Player_GrantResearchOption( 1, "FrigateInfiltrationTech" )
	Player_GrantResearchOption( 1, "BattlecruiserIonWeapons" )
	Player_GrantResearchOption( 1, "DestroyerGuns" )
	Player_GrantResearchOption( 1, "HyperspaceGateTech" )

	Player_GrantResearchOption( 1, "FighterspeedUpgrade1" )

	Player_GrantResearchOption( 1, "CorvetteHealthUpgrade1" )
	Player_GrantResearchOption( 1, "CorvetteSpeedUpgrade1" )

	Player_GrantResearchOption( 1, "FrigateHealthUpgrade1" )
	Player_GrantResearchOption( 1, "FrigateSpeedUpgrade1" )

	Player_GrantResearchOption( 1, "PlatformHealthUpgrade1" )

	Player_GrantResearchOption( 1, "UtilityHealthUpgrade1" )

	Player_GrantResearchOption( 1, "SuperCapHealthUpgrade1" )
	Player_GrantResearchOption( 1, "SuperCapSpeedUpgrade1" )

	Player_GrantResearchOption( 1, "MothershipBUILDSPEEDUpgrade1" )
	Player_GrantResearchOption( 1, "CarrierBUILDSPEEDUpgrade1" )
	Player_GrantResearchOption( 1, "ShipyardBUILDSPEEDUpgrade1" )

-- //Standard Upgrade Stuff
	Player_GrantResearchOption( 1, "HyperspaceRecoveryTimeUpgradeSPGAME" )
	Player_GrantResearchOption( 1, "HyperspaceTransitionTimeUpgradeSPGAME" )
	Player_GrantResearchOption( 1, "ShipyardSpeedDowngradeSPGAME" )
	Player_GrantResearchOption( 1, "VaygrRadiationImmunityHack" )
	Player_GrantResearchOption( 1, "ExtraStrongVgrHeavyMissilesSPGAME" )

--//My Custom Makaan Health Bumps
	Player_GrantResearchOption( 1, "MakaanCarrierHealth" )
	Player_GrantResearchOption( 1, "MakaanDestroyerHealth" )
	Player_GrantResearchOption( 1, "MakaanShipyardHealth" )
	Player_GrantResearchOption( 1, "MakaanBattleCruiserHealth" )
	Player_GrantResearchOption( 1, "MakaanFrigateHealth" )
	Player_GrantResearchOption( 1, "MakaanCorvetteHealth" )
	Player_GrantResearchOption( 1, "MakaanFighterHealth" )
	Player_GrantResearchOption( 1, "MakaanUtilityHealth" )
	Player_GrantResearchOption( 1, "MakaanPlatformHealth" )


-- // Player 2 upgrades 
	Player_GrantResearchOption( 2, "RepairAbility" )
	Player_GrantResearchOption( 2, "ScoutEMPAbility" )
	Player_GrantResearchOption( 2, "BomberImprovedBombs" )

	Player_GrantResearchOption( 2, "CorvetteTech" )
	Player_GrantResearchOption( 2, "FrigateTech" )
	Player_GrantResearchOption( 2, "ProbeSensorDisruption" )
	Player_GrantResearchOption( 2, "ProbeProxSensor" )
	Player_GrantResearchOption( 2, "LanceBeams" )
	Player_GrantResearchOption( 2, "PlasmaBombs" )
	Player_GrantResearchOption( 2, "CorvetteGraviticAttraction" )
	Player_GrantResearchOption( 2, "CorvetteLaser" )
	Player_GrantResearchOption( 2, "CorvetteCommand" )
	Player_GrantResearchOption( 2, "PlatformHeavyMissiles" )
	Player_GrantResearchOption( 2, "FrigateAssault" )
	Player_GrantResearchOption( 2, "FrigateInfiltrationTech" )
	Player_GrantResearchOption( 2, "BattlecruiserIonWeapons" )
	Player_GrantResearchOption( 2, "DestroyerGuns" )
	Player_GrantResearchOption( 2, "HyperspaceGateTech" )

	Player_GrantResearchOption( 2, "FighterspeedUpgrade1" )

	Player_GrantResearchOption( 2, "CorvetteHealthUpgrade1" )
	Player_GrantResearchOption( 2, "CorvetteSpeedUpgrade1" )

	Player_GrantResearchOption( 2, "FrigateHealthUpgrade1" )
	Player_GrantResearchOption( 2, "FrigateSpeedUpgrade1" )

	Player_GrantResearchOption( 2, "PlatformHealthUpgrade1" )

	Player_GrantResearchOption( 2, "UtilityHealthUpgrade1" )

	Player_GrantResearchOption( 2, "SuperCapHealthUpgrade1" )
	Player_GrantResearchOption( 2, "SuperCapSpeedUpgrade1" )

	Player_GrantResearchOption( 2, "MothershipBUILDSPEEDUpgrade1" )
	Player_GrantResearchOption( 2, "CarrierBUILDSPEEDUpgrade1" )
	Player_GrantResearchOption( 2, "ShipyardBUILDSPEEDUpgrade1" )

-- //Standard Upgrade Stuff
	Player_GrantResearchOption( 2, "HyperspaceRecoveryTimeUpgradeSPGAME" )
	Player_GrantResearchOption( 2, "HyperspaceTransitionTimeUpgradeSPGAME" )
	Player_GrantResearchOption( 2, "ShipyardSpeedDowngradeSPGAME" )
	Player_GrantResearchOption( 2, "VaygrRadiationImmunityHack" )
	Player_GrantResearchOption( 2, "ExtraStrongVgrHeavyMissilesSPGAME" )

--//My Custom Makaan Health Bumps
	Player_GrantResearchOption( 2, "MakaanCarrierHealth" )
	Player_GrantResearchOption( 2, "MakaanDestroyerHealth" )
	Player_GrantResearchOption( 2, "MakaanShipyardHealth" )
	Player_GrantResearchOption( 2, "MakaanBattleCruiserHealth" )
	Player_GrantResearchOption( 2, "MakaanFrigateHealth" )
	Player_GrantResearchOption( 2, "MakaanCorvetteHealth" )
	Player_GrantResearchOption( 2, "MakaanFighterHealth" )
	Player_GrantResearchOption( 2, "MakaanUtilityHealth" )
	Player_GrantResearchOption( 2, "MakaanPlatformHealth" )

--// My Custom Damage Bumps



	-- Turn AI on
	CPU_Enable( 1, 1 )
	
	-- Switch off AI for specific sobgroups
	CPU_RemoveSobGroup( 1, "Vgr_Group_1" )
	CPU_RemoveSobGroup( 1, "Vgr_Group_2" )

	
	-- initial attack
	SobGroup_FormStrikeGroup("Vgr_Group_1", "wall")
	Rule_AddInterval ("Rule_StartInitialAttack", 5)
	
	SobGroup_FormStrikeGroup("Vgr_Group_2", "Vgr_Cross")
	Rule_AddInterval ("Rule_StartInitialAttack", 5)

	SobGroup_FormStrikeGroup("Vgr_Group_3", "wall")
	Rule_AddInterval ("Rule_StartInitialAttack", 5)

	-- Make AI defend Makaan's MS above all
	DefendMakaanCPU1 = CPU_AddDefendSobGroup( 1, "Vgr_Makaan", 20000 )
	
	-- increase radius, default is 4000
	CPU_SetDefendTargetRadius( 1, DefendMakaanCPU1, 8000 )


	-- set the AI's to aggressive
	Player_SetGlobalROE( 1, OffensiveROE )
 		Player_SetGlobalStance( 1, AggressiveStance )
	Player_SetGlobalROE( 2, OffensiveROE )
 		Player_SetGlobalStance( 2, AggressiveStance )
	
	g_now_time = Universe_GameTime()

	
	SobGroup_SetInvulnerability( "Sajuuk", 1 )				-- set Sajuuk to invulnerable so he can't be hurt by random fire



	-- create various SobGroups of the player's ships (needed for persistent fleets)
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	Player_FillShipsByType( Players_Mothership, 0, "Hgn_Mothership" )         -- Put the player's Mothership into a sob group
	
	Players_Dreadnaught = "Players_Dreadnaught"
	SobGroup_Create(Players_Dreadnaught)
	Player_FillShipsByType( Players_Dreadnaught, 0, "Hgn_Dreadnaught" )         -- Put the player's Mothership into a sob group

	SobGroup_SetDisplayedRestrictedHardpoint(Players_Mothership,0)
	

	-- watch for player ships to come near the Shipyard to trigger shipyard discovered event
	Rule_AddInterval ("Rule_CheckForShipsNearShipyard", 5)
	
	Rule_Add ("Rule_checkObjectives")

	Rule_AddInterval ("Rule_makaanKamikazeDefense", 5)
	
	SobGroup_Create( "KamikazeTargets" )						-- create sob group for makaan to kamikaze his ships into
	SobGroup_Create( "KamikazeAttackers" )						-- create sob group for kamikaze attackers

	
	-------------------------------------------------------------------------------------------------
	-- Intel events
	-------------------------------------------------------------------------------------------------

	
	Rule_AddInterval ( "Rule_PlayerLoses", 3 )							-- MISSION FAILED


	Rule_AddInterval ("Rule_makaanDamaged", 3)							-- Makaan’s Flagship is heavily damaged.

	Rule_AddInterval ("Rule_makaanCriticallyDamaged", 3)					-- Makaan’s Flagship is critically damaged.

	
	-------------------------------------------------------------------------------------------------

--	Rule_Add ("Rule_testHealth")


	Rule_AddInterval( "Rule_DisableBuilderInterval", 20 )

	HW2_ReactiveInfo()

	Rule_Remove( "Rule_Init" )

	
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

-- END GAME: START

-- 

function Rule_testDespawn()
	SobGroup_Despawn( "Player_Ships0" )
	Rule_Remove ("Rule_testDespawn")
end

function Rule_testHealth()
	makaanHealth = SobGroup_HealthPercentage("Vgr_Makaan")		-- check Makaan's health
	print ("Makaan's health"..makaanHealth)
end



function Rule_StartInitialAttack()
	SobGroup_AttackPlayer( "Vgr_Group_1", 0 )
	SobGroup_AttackPlayer( "Vgr_Group_2", 0 )
	SobGroup_AttackPlayer( "Vgr_Group_3", 0 )

	Rule_Remove ("Rule_StartInitialAttack")
end


function Rule_keepMakaanAlive()
	-- if Makaan is dead, don't need to do these checks anymore
	if ( SobGroup_Empty ("Vgr_Makaan") == 1) then
		Event_Start( "intelevent_makaanHasBeenDefeated" )
		Rule_Remove ("Rule_keepMakaanAlive")
	end
	
	if ( SobGroup_HealthPercentage("Vgr_Makaan") < 0.05 ) and ( KillMakaan == 0) then	-- if Makaan's health is below x%
		SobGroup_SetHealth("Vgr_Makaan", 0.05)					-- set it to x%
		if ( startMakaanFinalWordsONCE == 0 ) then				-- if one-time variable hasn't been set
			Rule_Add ("Rule_intelevent_makaansLastWords")		-- start the intel event
			startMakaanFinalWordsONCE = 1					-- set the one-time variable
		end
	elseif ( KillMakaan == 1) then								-- if Makaan's final words have played and KillMakaan variable has been set
		SobGroup_TakeDamage( "Vgr_Makaan", 0.01 )		-- apply some damage to Makaan to make sure he dies
	end

end




-- "I have foreseen this... a dark cloud gathers above the skies of Hiigara"
function Rule_intelevent_makaansLastWords()
	if (EventPlaying == 0) then
		if ( Sensors_ManagerIsUp() == 1 ) then						-- if player is in the sensors manager
			Sensors_Toggle(0)									-- take them out
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start( "intelevent_makaansLastWords" )
			Rule_Remove ("Rule_intelevent_makaansLastWords")
		else
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
			Event_Start( "intelevent_makaansLastWords" )
			Rule_Remove ("Rule_intelevent_makaansLastWords")
		end
	end
end




-- BEGIN GAME: FIGHT MAKAAN
function Rule_NIS14AHasFinished()
	
--	if ( Universe_GameTime() >= g_now_time + 1 ) then
		Sound_EnterIntelEvent()

		Event_Start( "intelevent_eliminatemakaan" )
		
		Rule_Remove( "Rule_NIS14AHasFinished" )
		
		Rule_Add( "Rule_IntelEventEliminateMakaanDone" )
	
--	end
	
end

function Rule_IntelEventEliminateMakaanDone()

	if ( Event_IsDone( "intelevent_eliminatemakaan" ) == 1 ) then
	
		g_now_time = Universe_GameTime()
		
		-- set up shipyard warning and carrier warning
		Rule_AddInterval ("Rule_Shipyard_Warning", 3)
		
		Rule_Remove( "Rule_IntelEventEliminateMakaanDone" )
	
	end

end



function Rule_Shipyard_Warning()	
	if ( EventPlaying == 0) and ( PlayerHasDiscoveredShipyard == 1) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_shipyardDiscovered")
		Rule_Add ("Rule_Shipyard_Destroyed")
		Rule_Remove( "Rule_Shipyard_Warning" )
	end
end

function Rule_Shipyard_Destroyed()
	if ( EventPlaying == 0) and ( shipyardDestroyed == 1) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("speechevent_shipyardDestroyed")
		Rule_Remove( "Rule_Shipyard_Destroyed" )
	end
end



function Rule_Carrier_Warning()	
	if ( Universe_GameTime() >= g_carrier_timer ) then	
		if ( EventPlaying == 0) then
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start("intelevent_carrierDiscovered")
			Rule_Remove( "Rule_Carrier_Warning" )
		end
	end
end

function Rule_Desperate_Makaan()	
	if ( EventPlaying == 0) and ( initialAttackDestroyed == 1) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_desperateMakaan")
		Rule_Remove( "Rule_Desperate_Makaan" )
	end
end


-- let player know when Makaan is hurting
function Rule_makaanDamaged()
	if ( EventPlaying == 0) and ( SobGroup_HealthPercentage("Vgr_Makaan") < 0.65 ) then
		Rule_Remove( "Rule_makaanDamaged" )
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_makaanDamaged")
		CPU_SetDefendTargetRadius( 2, DefendMakaanCPU2, 20000 )
		DefendMakaanCPU2 = CPU_AddDefendSobGroup( 2, "Vgr_Makaan", 99999999 )
	end
end

-- let player know when Makaan is really hurting
function Rule_makaanCriticallyDamaged()
	if ( EventPlaying == 0) and ( SobGroup_HealthPercentage("Vgr_Makaan") < 0.35 ) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start("intelevent_makaanCriticallyDamaged")
		Rule_Add( "Rule_keepMakaanAlive" )							-- Keep's Makaan's health at just above 0 so the autofocus event can play
		Rule_Remove( "Rule_makaanCriticallyDamaged" )
	end
end


-- END GAME: FIGHT MAKAAN






-- check for player ships to come within range of the Vaygr shipyard
function Rule_CheckForShipsNearShipyard()
	Player_FillProximitySobGroup( "tempSobGroup", 0, "Vgr_Sob_Shipyard", 5000 )
	if ( SobGroup_Empty("tempSobGroup") == 0) then
		PlayerHasDiscoveredShipyard = 1
		Rule_Remove ("Rule_CheckForShipsNearShipyard")
	end
end



-- check to see when certain sobgroups have died to set objectives to completed
function Rule_checkObjectives()
	
	-- if all initial attackers are dead, set the Protect Mothership objective to complete
	if ( initialAttackDestroyed == 0) and
	   ( SobGroup_Empty ( "Vgr_Group_1") == 1) and
	   ( SobGroup_Empty ( "Vgr_Group_2") == 1) and
	   ( SobGroup_Empty ( "Vgr_Group_3") == 1) then
		initialAttackDestroyed = 1
		Rule_AddInterval ("Rule_Desperate_Makaan", 4)
                Objective_SetState( obj_prim_protectMothership_id, OS_Complete )	-- set objective to complete
	end

	
	-- if all initial attackers are dead
	if ( shipyardDestroyed == 0) and
	   ( SobGroup_Empty ( "Vgr_Sob_Shipyard") == 1) then
		shipyardDestroyed = 1
                Objective_SetState( obj_sec_destroyShipyard_id, OS_Complete )	-- set objective to complete
	end
		
	-- if both objectives are complete, remove rule
	if ( shipyardDestroyed == 1) and ( initialAttackDestroyed == 1) then
		Rule_Remove ("Rule_checkObjectives")
	end
end


-- when Makaan's health gets too low, it's time to start sacrificing Vaygr for the greater good!
function Rule_makaanKamikazeDefense()
	if ( RemoveKamikazeRule == 1) then
		Rule_Remove ("Rule_makaanKamikazeDefense")
	elseif ( SobGroup_HealthPercentage("Vgr_Makaan") < 0.75 ) and ( SobGroup_UnderAttack( "Vgr_Makaan" ) == 1) then	-- if Makaan is hurting and under attack
		print ("Makaan is under attack!!")
		SobGroup_GetAttackers( "Vgr_Makaan", "AttackingMakaan")
		
		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_AssaultFrigate" )		-- filter all Frigates from the attackers		
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Assault Frigates!")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end

		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_TorpedoFrigate" )		-- filter all Frigates from the attackers		
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Torpedo Frigates!")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end
		
		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_MarineFrigate" )			-- filter all Frigates from the attackers		
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Marine Frigates!")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end

		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_IonCannonFrigate" )	-- filter all Frigates from the attackers			
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Ion Cannon Frigates!")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end

		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_DefenseFieldFrigate" )-- filter all Frigates from the attackers
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Defense Field Frigates!")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end

		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_Destroyer" )				-- filter all Destoyers from the attackers
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Destroyers!")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end
		
		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_BattleCruiser" )			-- filter all Battlecruisers from the attackers
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Battlecruisers!")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end

		SobGroup_FillShipsByType( "tempSobGroup", "AttackingMakaan", "Hgn_IonTurret" )					-- filter all Platforms from the attackers
		if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
			print ("MakaanKamikazeDefense found some Platforms")
			SobGroup_SobGroupAdd( "KamikazeTargets", "tempSobGroup")		-- Add all the large targets to the target list
		end
		
		if ( SobGroup_Empty ( "KamikazeTargets" ) ~= 1) then					-- if there are any ships in the large target list
			print ("MakaanKamikazeDefense creating a squad of suicide bombers")
			KamikazeFreshlyBuilt = SobGroup_CreateShip("Vgr_Makaan", "Vgr_Interceptor")
			Rule_AddInterval ( "Rule_kamikazeSetup", 5)
		end
	end
end


-- do various setup on the freshly-created suicide squads
function Rule_kamikazeSetup()
	SobGroup_SobGroupAdd("KamikazeAttackers", KamikazeFreshlyBuilt)
	SobGroup_Attack( 1, "KamikazeAttackers", "KamikazeTargets" )	-- attack targets before kamikaze'ing into them
	Rule_AddInterval ("Rule_kamikazeIntoTargets", 1)
	Rule_Remove ("Rule_kamikazeSetup")
end

-- actually issue the kamikaze command
function Rule_kamikazeIntoTargets()
	SobGroup_Kamikaze( "KamikazeAttackers", "KamikazeTargets" )
	Rule_Remove ("Rule_kamikazeIntoTargets")
end


-- player has lost
function Rule_PlayerLoses()
	
	if ( SobGroup_Empty( Players_Mothership ) == 1 ) then	
		Sound_EnterIntelEvent()
		Event_Start( "intelevent_mothershipDestroyed" )
		Rule_Remove( "Rule_PlayerLoses" )
	end
	
end







-- ===== MUSIC ==================================================================================

function Rule_PlayAmbientMusic()
	print ("trying to play ambient music!")
	Sound_MusicPlayType( "data:sound/music/ambient/amb_14", MUS_Ambient )
	Rule_Remove ("Rule_PlayAmbientMusic")
end

function Rule_PlayStagingMusic()
	print ("trying to play staging music!")
	Sound_MusicPlayType( "data:sound/music/staging/staging_05", MUS_Staging )
	Rule_Remove ("Rule_PlayStagingMusic")
end

function Rule_PlayBattleMusic()
	print ("trying to play Battle music!")
	Sound_MusicPlayType( "data:sound/music/battle/battle_04", MUS_Battle )
	Rule_Remove ("Rule_PlayBattleMusic")
end



-- ===== MUSIC ==================================================================================






-- displays "SAVING GAME..." subtitle in top middle of screen
function Rule_PlaySaveGameLocationCard()
	Subtitle_Message( "$3651", 3 )						-- SAVING GAME...
	Rule_Remove ("Rule_PlaySaveGameLocationCard")
end




-- EVENTS
-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_eliminatemakaan =
{
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6455' )",""}, -- ..' Mission Start'
	},
        {
                HW2_Wait ( 2 ),
	},
        {
                HW2_LocationCardEvent( "$46520", 6 ),								-- HEART OF BALCORA
        },
	{
		{"Sound_EnableAllSpeech( 1 )",""},
                HW2_Wait ( 1 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46525", 3 ),	-- Makaan cannot be allowed to unite the cores.							
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46526", 3 ),		-- The Prophecy must not end this way.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_Letterbox ( 1 ),
		{ "Universe_EnableSkip(1)", "" },							-- Enable Intel event skipping
	},
	{
                HW2_Wait ( 2 ),
	},
	{
                HW2_Wait ( 1 ),
	},
	{
                {"Camera_FocusSobGroup( 'Vgr_Group_1', 1, 3500, 1.5 )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$46527", 3 ),		-- Multiple incoming Vaygr units detected.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46528", 3 ),			-- 	Protect the Mothership.
		{"obj_prim_protectMothership_id =  Objective_Add( obj_prim_protectMothership , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_protectMothership_id, '$46602')", "" },
	},
	{
                HW2_Wait ( 1 ),
	},
        {
		{ "Universe_EnableSkip(0)", "" },							
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






-- focus on Makaan as he is about to die
Events.intelevent_makaansLastWords =
{
	{
		HW2_Letterbox ( 1 ),
	},
	{
                HW2_Wait ( 3 ),
	},
	{
		{"Camera_FocusSobGroup( 'Vgr_Makaan', 1, 1500, 1 )", "" },	-- Focus on Makaan
		{"RemoveKamikazeRule = 1",""},
	},
	{
                HW2_Wait ( 1 ),
	},
        {
                HW2_SubTitleEvent( Actor_Makaan, "$46570",  4),			-- At this moment a dark cloud gathers above the skies of Hiigara...
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
                HW2_SubTitleEvent( Actor_Makaan, "$46571",  4),			-- The Warriors of the Fringe can never be defeated.
        },
	{
                HW2_Wait ( 1 ),
	},
        {
		{"KillMakaan = 1",""},
        },
}


Events.intelevent_makaanHasBeenDefeated =
{
	{
		{"SobGroup_Spawn( 'HSCore', 'HSCoreSpawnSphere' )",""},	-- spawn Makaan's hyperspace core
                HW2_SubTitleEvent( Actor_FleetCommand, "$46572",  4),		-- Makaan has been defeated.
		{"Objective_SetState( obj_prim_destroymakaan_id, OS_Complete )",""},
	},
	{
                HW2_Wait ( 1 ),
	},
	{
                HW2_SubTitleEvent( Actor_FleetCommand, "$46573",  4),		-- Begin recovery of the Vaygr Core.
               	{"Camera_FocusSobGroup( 'HSCore', 1, 300, 1 )", "" },		-- Focus on hyperspac core
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
                HW2_SubTitleEvent( Actor_FleetCommand, "$46574",  4),		-- The Trinity must be united once more.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
                {"Universe_Fade( 1, 3 )",""},						-- Fade to black
	},
	{
                HW2_Wait ( 3 ),
	},
	{
		{"Rule_Add ('Rule_DisableSpeech')",""},					-- Turn off all speech so NIS soundtrack can play unencumbered
		{"Rule_Remove ('Rule_PlayerLoses')",""},				-- Remove rule checking for player's MS dying (since we're going to switch its player below)
		{"Player_InstantDockAndParade( 0, 'Sajuuk', 0)",""},		-- parade all the player's ships around Sajuuk so they can de-spawn properly
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		{"SobGroup_Despawn( 'Player_Ships0' )",""},				-- despawn all player ships
		{"SobGroup_Despawn( 'Player_Ships1' )",""},				-- despawn all enemy ships
		{"SobGroup_Despawn( 'Player_Ships3' )",""},				-- despawn Sajuuk!
		{"SobGroup_SwitchOwner( Players_Mothership, 3 )",""},		-- switch player's MS to another team so it doesn't get put in the persistent fleets
		{"NISLoad( 'nis/NIS14B' )",""},						-- load the NIS
	},
	{
                HW2_Wait ( 3 ),
	},
	{
		{"n_currentNISPlaying_id = NISPlay( 'nis/NIS14B' )",""},	-- play the NIS
		{"Rule_Add ('Rule_watchForLastNISDone')",""},
	},
}




-- this is an event to say the player has lost
Events.intelevent_mothershipDestroyed =
{
	{
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		HW2_Fade( 1 ),
		HW2_Wait(2),		
	},
	{
		HW2_LocationCardEvent( "$46521", 4 ),						-- MISSION FAILED
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}



-- fades out and sets mission to complete
Events.intelevent_endLevel =
{
	{
		{ "Subtitle_Message( '$3652', 2 )", "" },							-- RESOURCES COLLECTED
		HW2_Wait( 2 ),
	},
        {
                HW2_Wait ( 0.5 ),
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
		{"setMissionComplete(1)",""},
	},
}



-- intelevent_desperateMakaan
Events.intelevent_desperateMakaan =
{
	{
                HW2_Letterbox( 1 ),
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
		{"Sensors_Toggle( 1 )",""},
	},
	{
		{ "Camera_Interpolate( 'here', 'camera3', 1)",""},
                HW2_Wait ( 1 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$46530", 10 ),	-- The Vaygr are regrouping around Makaan's Flagship.
		{"pointer_makaan_id = HW2_CreateEventPointerSobGroup('Vgr_Makaan')",""},
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
		{"ping_makaan_id = HW2_PingCreateWithLabel( ping_makaan, 'Vgr_Makaan' )", ""},
		{"Ping_AddDescription(ping_makaan_id, 0, '$46500')",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$46531", 10 ),	-- He must be destroyed.
		{"obj_prim_destroymakaan_id =  Objective_Add( obj_prim_destroymakaan , OT_Primary )",""},
		{ "Objective_AddDescription( obj_prim_destroymakaan_id, '$46600')", "" },
        },
	{
		{"EventPointer_Remove(pointer_makaan_id)",""},
                HW2_Wait ( 2 ),
	},
	{
		HW2_Letterbox( 0 ),
		{ "Sensors_Toggle( 0 )","" },
		{"Camera_FocusRestore()",""},
		{ "Universe_EnableSkip(0)", "" },							-- Disable Intel event skipping
		HW2_Pause ( 0 ),
	},
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6456' )",""}, -- ..' Destroy Makaan'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_makaanDamaged =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$46533", 10 ),	-- Makaan’s Flagship is heavily damaged.
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
		{"Campaign_QuickSaveNb( g_save_id, '$6457' )",""}, -- ..' Makaan Damaged'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- intelevent_makaanCriticallyDamaged
Events.intelevent_makaanCriticallyDamaged =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$46535", 10 ),	-- Makaan’s Flagship is critically damaged.
	},	
	{
                HW2_Wait ( 0.5 ),
	},
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$46536", 10 ),	-- Concentrate all fire on Makaan!
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- intelevent_makaanRepairing
Events.intelevent_makaanRepairing =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$46540", 10 ),	-- Makaan is repairing his Flagship.
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$46541", 10 ),	-- Target the Vaygr Resource Collectors to prevent repairs.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- intelevent_shipyardDiscovered
Events.intelevent_shipyardDiscovered =
{
	{
                HW2_Letterbox( 1 ),
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
		{"Sensors_Toggle( 1 )",""},
	},
	{
                HW2_Wait ( 0.5 ),
	},
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$46545", 10 ),	-- The Vaygr are using a shipyard to provide reinforcements.
		{"pointer_shipyard_id = HW2_CreateEventPointerSobGroup('Vgr_Sob_Shipyard')",""},
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
		{"ping_shipyard_id = HW2_PingCreateWithLabel( ping_shipyard, 'Vgr_Sob_Shipyard' )", ""},
		{"Ping_AddDescription(ping_shipyard_id, 0, '$46501')",""},
                HW2_SubTitleEvent( Actor_FleetIntel, "$46546", 10 ),	-- It must be destroyed.
		{"obj_sec_destroyShipyard_id =  Objective_Add( obj_sec_destroyShipyard , OT_Primary )",""},
		{ "Objective_AddDescription( obj_sec_destroyShipyard_id, '$46601')", "" },
        },
	{
		{"EventPointer_Remove(pointer_shipyard_id)",""},
                HW2_Wait ( 2 ),
	},
	{
		HW2_Letterbox( 0 ),
		{ "Sensors_Toggle( 0 )","" },
		{"Camera_FocusRestore()",""},
		{ "Universe_EnableSkip(0)", "" },							-- Disable Intel event skipping
		HW2_Pause ( 0 ),
	},
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6458' )",""}, -- ..' Destroy Vaygr Shipyard'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.speechevent_shipyardDestroyed = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46547", 5 ),				-- The Vaygr shipyard has been destroyed.
	},
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6459' )",""}, -- ..' Vaygr Shipyard Destroyed'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}




-- intelevent_carrierDiscovered
Events.intelevent_carrierDiscovered =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$46550", 10 ),	-- Vaygr Carrier detected.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

-- intelevent_kamikazeAttack
Events.intelevent_kamikazeAttack =
{
        {
                HW2_SubTitleEvent( Actor_FleetIntel, "$46555", 10 ),	-- The Vaygr have become desperate.
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$46556", 10 ),	-- Their Fighters are making suicide attacks.
        },
	{
                HW2_Wait ( 0.5 ),
	},
	{
                HW2_SubTitleEvent( Actor_FleetIntel, "$46558", 10 ),	-- *** WAITING ON PICKUP *** Recommend using Flak Frigates to protect against these attacks.
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}