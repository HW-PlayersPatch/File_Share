--  SCAR SCRIPT  ------------------------------------------------------------------------------
--  Name: M13_Balcora_Gate
--  Purpose:  Mission 13 Mission Script
--
----------------------------------------------------------------------------------
-- import library files
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:scripts/scar/restrict.lua")


Chunk1DeadONCE = 0
Chunk2DeadONCE = 0
Chunk3DeadONCE = 0

StartGateFX = 0

-- MISSION RULES

-- BEGIN GAME: START
-- play NIS and opening intelevent
function OnInit()
	SPRestrict()
	-- Chunk attacker variables
	
	Rule_Add( "Rule_Init_1" )
end

-- pre-load stuff here
function OnStartOrLoad()
	print ("OnStartOrLoad is working!!")
	print ("Chunk1DeadONCE = "..Chunk1DeadONCE)
	print ("Chunk2DeadONCE = "..Chunk2DeadONCE)
	print ("Chunk3DeadONCE = "..Chunk3DeadONCE)
	if ( StartGateFX == 1) then
		RingTrenchGlow=FX_StartEvent( "Balcora_Gate", "Trench" )
		
		if ( Chunk1DeadONCE == 0 ) then
			print ("Trying to play beam1")
			Chunk1Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint1", "EffectPoint1", 5 )
			Chunk1Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint1", 1 )
			Chunk1sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint1",5 )
			Chunk1BurnRing = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint1", 5 )
			Chunk1RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint1", 5 )
		end
		
		if ( Chunk2DeadONCE == 0 ) then
			print ("Trying to play beam2")
			Chunk2Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint2", "EffectPoint2", 5 )
			Chunk2Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint2", 1 )
			Chunk2sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint2",5 )
			Chunk2Ring = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint2", 5 )
			Chunk2RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint2", 5 )
		end
		
		if ( Chunk3DeadONCE == 0 ) then
			print ("Trying to play beam2")
			Chunk3Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint3", "EffectPoint3", 5 )
			Chunk3Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint3", 1 )
			Chunk3sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint3",5 )
			Chunk3Ring = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint3", 5 )
			Chunk3RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint3", 5 )
		end
	end
end


function Rule_Init_1()
	Rule_Add ("Rule_DisableSpeech")
	Rule_AddInterval ("Rule_StartGateFX", 29)
	
	print ("trying to play beam effects now!")
	
	-- disable CPU player so NIS ships don't shoot at Balcora Gate
	CPU_Enable( 1, 0 )
--        Player_OverrideUnitCaps(1, 150 )			-- give the CPU more unit caps to account for the Balcora attack forces

	-- create temp sobgroups
	SobGroup_Create("ResourceSphereShips")
	SobGroup_Create("PlayerCollectors")
	SobGroup_Create("tempSobGroup")

	NISOver = 0
	isOk = 0
	
	--NISLoad( "nis/NIS13" )						-- load the NIS
	--g_currentNISPlaying_id = NISPlay( "nis/NIS13" )	-- play the NIS

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
	
	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS13")
	NISDisableInterface(1) -- this disables the interface when the NIS is done playing, it needs to be re-enabled by scar

--	g_currentNISPlaying_id = NISPlayFromGroup( "nis/NIS13", "Balcora_Gate" )	-- play the NIS relative to the gate

--	Rule_Add ("Rule_Init")

	Rule_AddInterval ("Rule_watchForNISDoneFromTimer", 52)
	Rule_Add ("Rule_watchForNISDone")
	
	Rule_Remove( "Rule_Init_1" )
end

function Rule_DisableSpeech()
--	Sound_EnterIntelEvent()					-- turn off regular gameplay speech to avoid hearing speech right at the beginning of mission
	Sound_EnableAllSpeech( 0 )
	Rule_Remove ("Rule_DisableSpeech")
end

function Rule_StartGateFX()
	if ( NISOver == 0) then
		StartGateFX = 1
		-- start effects of power generators
		Chunk1Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint1", "EffectPoint1", 5 )
		Chunk1Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint1", 1 )
		Chunk1sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint1",5 )
		Chunk1BurnRing = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint1", 5 )
		Chunk1RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint1", 5 )
	
		Chunk2Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint2", "EffectPoint2", 5 )
		Chunk2Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint2", 1 )
		Chunk2sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint2",5 )
		Chunk2Ring = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint2", 5 )
		Chunk2RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint2", 5 )
	
		Chunk3Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint3", "EffectPoint3", 5 )
		Chunk3Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint3", 1 )
		Chunk3sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint3",5 )
		Chunk3Ring = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint3", 5 )
		Chunk3RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint3", 5 )

		Rule_Remove ("Rule_StartGateFX")
	else
		Rule_Remove ("Rule_StartGateFX")
	end
end



-- watch for the NIS to be far enough along that you can load the persistent fleet et al
function Rule_watchForNISDoneFromTimer()
        if ( NISOver == 0 ) then
		NISOver = 1
--		Camera_SetLetterboxStateNoUI(0, 0 )					-- turn UI back on
		SobGroup_LoadPersistantData("Hgn_Mothership")
		RingTrenchGlow=FX_StartEvent( "Balcora_Gate", "Trench" )
		Rule_Add ("Rule_setAlliances")
                Rule_AddInterval ("Rule_Init", 12)
		print ("Adding rule INIT FROM DoneFromTimer NOW!!!!!!!!!!!!")
		Rule_AddInterval ("Rule_NISHasFinished", 11)					-- intro intel event

                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
        elseif ( NISOver == 1) then
                Rule_Remove( "Rule_watchForNISDoneFromTimer" )
	end
end



-- watch for the NIS to be complete so you can start the level
function Rule_watchForNISDone()
        if ( NISOver == 0 ) and ( NISComplete( g_currentNISPlaying_id ) == 1 )  then
		NISOver = 1
		
		-- start effects of power generators
		Chunk1Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint1", "EffectPoint1", 5 )
		Chunk1Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint1", 1 )
		Chunk1sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint1",5 )
		Chunk1BurnRing = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint1", 5 )
		Chunk1RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint1", 5 )
	
		Chunk2Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint2", "EffectPoint2", 5 )
		Chunk2Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint2", 1 )
		Chunk2sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint2",5 )
		Chunk2Ring = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint2", 5 )
		Chunk2RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint2", 5 )
	
		Chunk3Beam = FX_PlayEffectBetweenPoints ( "pro_tech_beam_combo", "ChunkPoint3", "EffectPoint3", 5 )
		Chunk3Ring = FX_PlayEffect ( "pro_tech_gate_glow_channel", "EffectPoint3", 1 )
		Chunk3sparks = FX_PlayEffect ( "pro_tech_flare_spray", "EffectPoint3",5 )
		Chunk3Ring = FX_PlayEffect ( "pro_tech_beam_channel_loop", "EffectPoint3", 5 )
		Chunk3RingLoop = FX_PlayEffect ( "pro_tech_beam_burn_ring_loop", "ChunkPoint3", 5 )
		
--		Camera_SetLetterboxStateNoUI(0, 0 )					-- turn UI back on
		SobGroup_LoadPersistantData("Hgn_Mothership")
		Rule_Add ("Rule_setAlliances")
                Rule_AddInterval ("Rule_Init", 1)
		print ("Adding rule INIT NOW!!!!!!!!!!!!")
		Rule_AddInterval ("Rule_NISHasFinished", 3)					-- intro intel event
                Rule_Remove( "Rule_watchForNISDone" )
        elseif ( NISOver == 1) then
                Rule_Remove( "Rule_watchForNISDone" )
	end
end


function Rule_setAlliances()
        if ( NISComplete( g_currentNISPlaying_id ) == 1 )  then
		SetAlliance( 0, 2 )							-- Ally the player with the Balcora gate so you can check its health
		SetAlliance( 2, 0 )
		SetAlliance( 1, 3 )							-- Ally the AI with the Gate attackers
		SetAlliance( 3, 1 )							-- Ally the Gate attackers with the AI
		SetAlliance( 1, 2 )							-- Ally the Vaygr with Balcora Gate so the AI doesn't attack it
		SetAlliance( 2, 1 )							-- Ally Balcora Gate with the Vaygr so the AI doesn't attack it

		-- add all reactive Gate attackers to the master "Chunk Attackers" sobgroup
		for i = 1, 3 do
			SobGroup_SobGroupAdd("ChunkAttackers"..i, "ChunkAttackersLarge"..i)
			SobGroup_SobGroupAdd("ChunkAttackers"..i, "ChunkAttackersSmall"..i)
		end
		-- reveal fog of war on Gate attackers
		FOW_RevealGroup("ChunkAttackers1", 1)						-- Reveal fog of war for chunk w/ inhibitor installed
		FOW_RevealGroup("ChunkAttackers2", 1)						-- Reveal fog of war for chunk w/ inhibitor installed
		FOW_RevealGroup("ChunkAttackers3", 1)						-- Reveal fog of war for chunk w/ inhibitor installed

		
		Rule_Remove ("Rule_setAlliances")
	end
end


function Rule_Init()
	print ("Running INIT NOW!!!!!!!!!!")
	-- re-enable CPU player now that NIS is over
	CPU_Enable( 1, 1 )

--	SobGroup_LoadPersistantData("Hgn_Mothership")

	Rule_Add ("Rule_PlayStagingMusic")

	ShipToParadeRoundTypeName = "Hgn_MotherShip"

	-- set player names
	Player_SetPlayerName(0, "$46010")			-- Hiigaran Navy
	Player_SetPlayerName(1, "$46011")			-- Vaygr
	Player_SetPlayerName(2, "$46012")			-- Progenitor (Balcora Gate / Gate power generators)
	Player_SetPlayerName(3, "$46011")			-- Vaygr

	-- disable CPU player for the player's fleet (needed for proper CTRL+X'ing)
	CPU_Enable( 0, 0 )
	CPU_Enable( 2, 0 )		-- disable CPU for Balcora Gate (??)
	CPU_Enable( 3, 0 )		-- disable CPU for Gate Attackers


	-- set speech pathname
	Sound_SpeechSubtitlePath("speech:missions/m_13/")

--	Universe_Pause(1, 30)
	
	-- objectives
	obj_prim_stopvaygr = "$46000"							-- Stop the Vaygr from destroying the Gate
	obj_prim_stopvaygr_id = 0
	
	obj_prim_destroyshipyard = "$46001"					-- Destroy Vaygr shipyard
	obj_prim_destroyshipyard_id = 0
	
	obj_prim_findshipyard = "$46002"						-- Investigate power signature
	obj_prim_findshipyard_id = 0

	obj_prim_activategate = "$46003"						-- Use Dreadnaught to activate Balcora Gate
	obj_prim_activategate_id = 0

	obj_prim_protectdreadnaught = "$46004"					-- Protect the Dreadnaught
	obj_prim_protectdreadnaught_id = 0

	-- pings
	ping_gate_attackers1 = "$46400"							-- Gate attack force 1
	ping_gate_attackers1_id = 0
	
	ping_gate_attackers2 = "$46401"							-- Gate attack force 2
	ping_gate_attackers2_id = 0
	
	ping_gate_attackers3 = "$46402"							-- Gate attack force 3
	ping_gate_attackers3_id = 0
	
	ping_shipyard = "$46403"									-- Vaygr Shipyard
	ping_shipyard_id = 0
	
	ping_shipyardLocation = "$46404"							-- Power signature
	ping_shipyardLocation_id = 0

	pingRemoveChunk1AttackersONCE = 0
	pingRemoveChunk2AttackersONCE = 0
	pingRemoveChunk3AttackersONCE = 0


	
	-- pointers
	pointer_gate_attackers1_id = 0
	pointer_gate_attackers2_id = 0
	pointer_gate_attackers3_id = 0

	pointer_chunk1_id = 0
	pointer_chunk2_id = 0
	pointer_chunk3_id = 0

	pointer_vaygrshipyard_id = 0
	pointer_powersignature_id = 0

	
	-- global vars
	g_now_time = Universe_GameTime()
	g_save_id = 0
	
	EventPlaying = 0
	NIS13BOver = 0
	
	g_attack_1 = 60
	g_attack_2 = 120
	g_attack_3 = 260
	
	-- bc group
	g_attack_4 = 400
	g_attack_5 = 440
	g_attack_6 = 500
	g_attack_7 = 610
	
	-- bc group
	g_attack_8 = 100
	
	
	-- initial attack variables
	startInitialAttack = 0
	
	
	
	
	-- chunk variables
	chunksDestroyedOnce = {0,0,0} 
	chunks_destroyed = 0
	chunks_saved = 0
	
	print ("Print 7")
	
	SobGroup_Create( "AttackingLarge1" )					-- create sob group for ships attacking the chunk attackers
	SobGroup_Create( "AttackingSmall1" )					-- create sob group for ships attacking the chunk attackers

	SobGroup_Create( "AttackingLarge2" )					-- create sob group for ships attacking the chunk attackers
	SobGroup_Create( "AttackingSmall2" )					-- create sob group for ships attacking the chunk attackers

	SobGroup_Create( "AttackingLarge3" )					-- create sob group for ships attacking the chunk attackers
	SobGroup_Create( "AttackingSmall3" )					-- create sob group for ships attacking the chunk attackers

	SobGroup_Create( "LargeTargets1" )						-- create sob group for chunk attackers to retaliate against
	SobGroup_Create( "LargeTargets2" )						-- create sob group for chunk attackers to retaliate against
	SobGroup_Create( "LargeTargets3" )						-- create sob group for chunk attackers to retaliate against

	SobGroup_Create( "SmallTargets1" )						-- create sob group for chunk attackers to retaliate against
	SobGroup_Create( "SmallTargets2" )						-- create sob group for chunk attackers to retaliate against
	SobGroup_Create( "SmallTargets3" )						-- create sob group for chunk attackers to retaliate against

	print ("Print 8")

	
	chunk1SavedONCE = 0
	chunk2SavedONCE = 0
	chunk3SavedONCE = 0
	
	shipyardDiscovered = 0


	
--	SetAlliance( 1, 2 )							-- Ally the Vaygr with Balcora Gate so the AI doesn't attack it
--	SetAlliance( 2, 1 )

	print ("Print 8")


	-- remove all script-critical sob groups from the AI control
	CPU_RemoveSobGroup( 1, "InitialAttack_Bombers1" )
	CPU_RemoveSobGroup( 1, "InitialAttack_Interceptors1" )
	CPU_RemoveSobGroup( 1, "InitialAttack_HeavyMissileFrigates1" )
	CPU_RemoveSobGroup( 1, "InitialAttack_LaserCorvettes1" )
	CPU_RemoveSobGroup( 1, "InitialAttack_Battlecruiser" )
	CPU_RemoveSobGroup( 1, "InitialAttack_InfiltrationFrigates1" )
	CPU_RemoveSobGroup( 3, "ChunkAttackers1" )
	CPU_RemoveSobGroup( 3, "ChunkAttackersLarge1" )
	CPU_RemoveSobGroup( 3, "ChunkAttackersSmall1" )
	CPU_RemoveSobGroup( 3, "ChunkAttackers2" )
	CPU_RemoveSobGroup( 3, "ChunkAttackersLarge2" )
	CPU_RemoveSobGroup( 3, "ChunkAttackersSmall2" )
	CPU_RemoveSobGroup( 3, "ChunkAttackers3" )
	CPU_RemoveSobGroup( 3, "ChunkAttackersLarge3" )
	CPU_RemoveSobGroup( 3, "ChunkAttackersSmall3" )

	
	-- create all the subsystems needed for production on the Vgr Shipyard:
	SobGroup_CreateSubSystem( "VaygrShipyard", "FighterProduction" )
	SobGroup_CreateSubSystem( "VaygrShipyard", "CorvetteProduction" )
	SobGroup_CreateSubSystem( "VaygrShipyard", "FrigateProduction" )
	SobGroup_CreateSubSystem( "VaygrShipyard", "CapShipProduction" )
	SobGroup_CreateSubSystem( "VaygrShipyard", "PlatformProduction" )
	SobGroup_CreateSubSystem( "VaygrShipyard", "Research" )
	--SobGroup_CreateSubSystem( "VaygrShipyard", "Hyperspace" )
	Player_RestrictBuildOption(1, "Vgr_MS_Module_Hyperspace")
	SobGroup_CreateSubSystem( "VaygrShipyard", "AdvancedArray" )

	
	
	-- set research level
	HW2_SetResearchLevel( 13 )
--	Player_Research( 1, "ShipyardSpeedDowngradeSPGAME" )			-- Give the Vaygr Shipyard a speed downgrade so it can't move around
	SobGroup_AbilityActivate( "VaygrShipyard", AB_Move, 0)			-- disable move ability so shipyard stays put
	SobGroup_AbilityActivate( "VaygrShipyard", AB_Hyperspace, 0)		-- disable hyperspace ability so shipyard stays put
	
	-- vaygr research items
	Player_GrantAllResearch(1)		-- give CPU player all research so it can start building high-level ships right away

	Player_GrantResearchOption( 1, "SuperCapHealthUpgradeSPGAME" )	-- Give Vaygr capships a health upgrade to make them tougher targets

--~ 	Player_GrantResearchOption( 1, "LanceBeams" )
--~ 	Player_GrantResearchOption( 1, "PlasmaBombs" )
--~ 	Player_GrantResearchOption( 1, "CorvetteGraviticAttraction" )
--~ 	Player_GrantResearchOption( 1, "CorvetteLaser" )
--~ 	Player_GrantResearchOption( 1, "CorvetteCommand" )
--~ 	Player_GrantResearchOption( 1, "PlatformHeavyMissiles" )
--~ 	Player_GrantResearchOption( 1, "FrigateInfiltrationTech" )
--~ 	Player_GrantResearchOption( 1, "BattlecruiserIonWeapons" )
--~ 	Player_GrantResearchOption( 1, "DestroyerGuns" )
--~ 	Player_GrantResearchOption( 1, "HyperspaceGateTech" )
--~ 	Player_GrantResearchOption( 1, "RepairAbility" )
--~ 	Player_GrantResearchOption( 1, "ScoutEMPAbility" )
--~ 	Player_GrantResearchOption( 1, "BomberImprovedBombs" )
--~ 	Player_GrantResearchOption( 1, "SuperCapHealthUpgrade2" )
--~ 	Player_GrantResearchOption( 1, "SuperCapSpeedUpgrade2" )
--~ 	Player_GrantResearchOption( 1, "FighterHealthUpgrade2" )
--~ 	Player_GrantResearchOption( 1, "CorvetteHealthUpgrade2" )
--~ 	Player_GrantResearchOption( 1, "FrigateHealthUpgrade2" )
--~ 	Player_GrantResearchOption( 1, "PlatformHealthUpgrade2" )
--~ 	Player_GrantResearchOption( 1, "UtilityHealthUpgrade2" )

	Player_GrantResearchOption( 3, "VaygrFrigateHealthUpgradeSPGAME" )	-- Give Gate Attackers a health upgrade to make them tougher targets
	Player_GrantResearchOption( 3, "VaygrFrigateHealthRegenDowngradeSPGAME" )	-- Downgrade the Gate Attackers' health regen rate so they can't get back to full health so easily
	Player_GrantResearchOption( 3, "ExtraStrongVgrHeavyMissilesSPGAME" )		-- Give Gate Attackers stronger weapons (they're l33t)
	Player_GrantResearchOption( 3, "CorvetteHealthUpgradeSPGAME" )	-- Give Gate Attackers a health upgrade to make them tougher targets

	
	-- set all ship to aggressive
--	Player_SetGlobalROE( 1, OffensiveROE )

	g_now_time = Universe_GameTime()
	

	-- Set up the initial attack group
	Rule_Add ("Rule_initialAttackSetup")
	Rule_Add ("Rule_initialAttackBombersFullSpeed")


	-- Set up the gate attackers
	Rule_Add ("Rule_gateAttackSetup")

	-- logic for gate attackers to retaliate against anyone who attacks them
	Rule_AddInterval ("Rule_chunkAttackerRetaliate", 10)
	Rule_AddInterval ("Rule_chunkAttackerRetaliateWATCH", 3)

	-- Set up the shipyard
	Rule_Add ("Rule_shipyardSetup")

	-- set up the resource pocket attackers
	Rule_Add ("Rule_watchResourcePocket")


	
--	Rule_Add( "Rule_Attack_1" )
--	Rule_Add( "Rule_Attack_2" )
--	Rule_Add( "Rule_Attack_3" )
--	Rule_Add( "Rule_Attack_4" )
--	Rule_Add( "Rule_Attack_5" )
--	Rule_Add( "Rule_Attack_6" )
--	Rule_Add( "Rule_Attack_7" )
--	Rule_Add( "Rule_Attack_8" )



-------------------------------------------------------------------------------------------------
-- SobGroup creation / setup
-------------------------------------------------------------------------------------------------
	
	-- create various SobGroups of the player's ships
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	Player_FillShipsByType( Players_Mothership, 0, "Hgn_MotherShip" )		-- get Player's Mothership
	
	Players_Carrier = "Players_Carrier"
	SobGroup_Create(Players_Carrier)
	Player_FillShipsByType( Players_Carrier, 0, "Hgn_Carrier" )			-- get Player's Carrier
	
	Players_Battlecruiser = "Players_Battlecruiser"
	SobGroup_Create(Players_Battlecruiser)
	Player_FillShipsByType( Players_Battlecruiser, 0, "Hgn_Battlecruiser" )	-- get Player's Battlecruiser
	
	Players_Dreadnaught = "Players_Dreadnaught"
	SobGroup_Create(Players_Dreadnaught)
	Player_FillShipsByType( Players_Dreadnaught, 0, "Hgn_Dreadnaught" )	-- get Player's Dreadnaught
	
	Players_Shipyard = "Players_Shipyard"
	SobGroup_Create(Players_Shipyard)
	Player_FillShipsByType( Players_Shipyard, 0, "Hgn_Shipyard" )			-- get Player's Shipyard
	
	SobGroup_SetDisplayedRestrictedHardpoint(Players_Mothership,0)
	
--	SobGroup_ParadeSobGroup( "Player_Ships0", Players_Mothership, 1)

	-- focus on the Player's Mothership
--	Camera_FocusSobGroup( Players_Mothership, 1, 0, 0 )
-------------------------------------------------------------------------------------------------

-- play the NIS13



-------------------------------------------------------------------------------------------------
-- Intel events
-------------------------------------------------------------------------------------------------

	Rule_Add( "Rule_chunkDestroyedWatch" )			-- Watch for Balcora Gate chunks to be destroyed 

	Rule_Add( "Rule_chunkSavedWatch" )				-- Watch for Balcora Gate chunks to be saved

	Rule_Add( "Rule_speechevent_generatorLowHealthNoGeneratorsSaved" )	-- if health of any chunk drops below 50%, play a speech event letting the player know they must save at least 1

	Rule_Add( "Rule_speechevent_dreadnaughtDamaged")			-- Dreadnaught hull integrity at 20 percent and falling..

	Rule_Add( "Rule_speechevent_lost1GeneratorNoneSaved" )	-- if one chunk has died and none have been saved, player a speech event letting the player know they must save at least 1
	Rule_Add( "Rule_speechevent_saved1Generator" )			-- if the player saves one chunk, play a speech event about it
	Rule_Add( "Rule_speechevent_lost1GeneratorSavedOne" )		-- Vaygr forces have destroyed one of the Balcora Gate power generators.

	Rule_Add( "Rule_speechevent_lost2GeneratorsNoneSaved" )	-- if two chunks die and no chunks have been saved
	Rule_Add( "Rule_speechevent_saved2Generators" )			-- if the player saves a second chunk, play a speech event about it
	Rule_Add( "Rule_speechevent_lost2GeneratorsSavedOne" )		-- Vaygr forces have destroyed a second power generator.

	Rule_Add( "Rule_speechevent_lost3Generators" )			-- if the player loses all 3 chunks
	Rule_Add( "Rule_speechevent_saved3Generators" )			-- if the player saves all 3 chunks

	Rule_Add( "Rule_destroyGateAttackersOBJECTIVE" )			-- Watch for the objective to be completed 
	Rule_Add( "Rule_pingRemoveWhenChunksDestroyed" )			-- Watch for pings to be removed on chunk attackers

	Rule_Add( "Rule_seenShipyardWatch" )					-- Watch for when the player's ships are within sensors range of the Vaygr Shipyard
	Rule_Add( "Rule_speechevent_shipyardDestroyed" )			-- When the shipyard is destroyed, play a speech event about it

	Rule_Add( "Rule_speechevent_sendScoutToInvestigate" )		-- When a chunk is saved or destroyed, tell player to investigate shipyard location

	Rule_Add("Rule_intelevent_mothershipDestroyed")			-- MISSION FAILED

	Rule_Add("Rule_intelevent_dreadnaughtDestroyed")		-- MISSION FAILED


-------------------------------------------------------------------------------------------------


	
--	SobGroup_Create( "AttackingBattlecruiser" )

--	Rule_Add ("Rule_testGetAttackers")

--	Rule_Add ("Rule_testVolumes")
	
	Rule_AddInterval( "Rule_DisableBuilderInterval", 20 )

	HW2_ReactiveInfo()


	Rule_Remove( "Rule_Init" )
	
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

-- END GAME: START

function Rule_testVolumes()
	if ( SobGroup_IsShipNearPoint( "ChunkAttackersLarge3", "ChunkPoint3", 2500 ) == 1) then
		print ("IsShipNearPoint check is working!!!!!!!!!!!!!!")
	end
end






function Rule_testGetAttackers()
	if ( SobGroup_UnderAttack( "InitialAttack_Battlecruiser" ) == 1) then
		print ("Battlecruiser is under attack!!")
		SobGroup_GetAttackers( "InitialAttack_Battlecruiser", "AttackingBattlecruiser")
		if ( SobGroup_Empty ("AttackingBattlecruiser") ~= 1) then
			print ("Attacker group has ships in it!!")
		end
	end
end


-- ===== INTEL EVENTS ===========================================================================

-- After the NIS is done, play the intro event
function Rule_NISHasFinished()
	
--	if ( Universe_GameTime() >= g_now_time + 2 ) then
--		Sound_EnableAllSpeech( 1 )
	
		Event_Start( "intelevent_stopthem" )
						
		--   Tell the gate attackers to begin attacking
--		SobGroup_Attack( 1, "Vgr_GateAttackers", "Balcora_Gate" )
		
		--   Tell the gate attackers bombers to begin attacking the gates subsystems
--		SobGroup_AttackSobGroupHardPoint("Vgr_SubsystemAttackers_1", "Balcora_Gate", "PowerGen1")
--		SobGroup_AttackSobGroupHardPoint("Vgr_SubsystemAttackers_2", "Balcora_Gate", "PowerGen2")
--		SobGroup_AttackSobGroupHardPoint("Vgr_SubsystemAttackers_3", "Balcora_Gate", "PowerGen3")
		
		
		Rule_Remove( "Rule_NISHasFinished" )
		
--	end

end



-- Dreadnaught damaged
function Rule_speechevent_dreadnaughtDamaged()
	if (EventPlaying == 0) and ( SobGroup_HealthPercentage(Players_Dreadnaught) < 0.25 ) then		-- if the Dreadnaught is low on health
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_dreadnaughtDamaged" )
		Rule_Remove ("Rule_speechevent_dreadnaughtDamaged")
	end
end



-- Watch to see when chunks are destroyed and increment the chunks_destroyed variable
function Rule_chunkDestroyedWatch()
	-- process each chunk 1 through 3
	for i=1, 3 do
--		if (SobGroup_Empty ("BalcoraGate_Chunk"..i) == 1)  and (chunksDestroyedOnce[i] == 0) then
		if ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator"..i) == 0)  and (chunksDestroyedOnce[i] == 0) then
			chunks_destroyed = chunks_destroyed + 1;			-- increment chunks_destroyed variable
			print ("chunks destroyed = "..chunks_destroyed)
			chunksDestroyedOnce[i] = 1;						-- set one-time variable so check doesn't happen again
		end
	end
end

function Rule_pingRemoveWhenChunksDestroyed()

	-- chunk 1
--	if ( SobGroup_Empty ("BalcoraGate_Chunk1") == 1) and			-- if chunk1 is dead 
	if ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") == 0) and			-- if chunk1 is dead 
	   ( SobGroup_Empty ("ChunkAttackers1") ~= 1)	and				-- but the chunk1 attackers are still alive
	   ( pingRemoveChunk1AttackersONCE == 0) then
		Ping_Remove( ping_gate_attackers1_id )	                                -- remove the ping on the chunk 1 attackers
		pingRemoveChunk1AttackersONCE = 1					-- set the one-time variable so the check doesn't happen again
	end

	-- chunk 2
--	if ( SobGroup_Empty ("BalcoraGate_Chunk2") == 1) and			-- if chunk2 is dead 
	if ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") == 0) and			-- if chunk2 is dead 
	   ( SobGroup_Empty ("ChunkAttackers2") ~= 1)	and				-- but the chunk2 attackers are still alive
	   ( pingRemoveChunk2AttackersONCE == 0) then
		Ping_Remove( ping_gate_attackers2_id )	                                -- remove the ping on the chunk 2 attackers
		pingRemoveChunk2AttackersONCE = 1					-- set the one-time variable so the check doesn't happen again
	end

	-- chunk 3
--	if ( SobGroup_Empty ("BalcoraGate_Chunk3") == 1) and			-- if chunk3 is dead 
	if ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") == 0) and			-- if chunk2 is dead 
	   ( SobGroup_Empty ("ChunkAttackers3") ~= 1)	and				-- but the chunk3 attackers are still alive
	   ( pingRemoveChunk3AttackersONCE == 0) then
		Ping_Remove( ping_gate_attackers3_id )	                                -- remove the ping on the chunk 3 attackers
		pingRemoveChunk3AttackersONCE = 1					-- set the one-time variable so the check doesn't happen again
	end

end

-- Watch to see when chunks are saved and increment the chunks_saved variable
function Rule_chunkSavedWatch()

	-- chunk 1
	if ( SobGroup_Empty ("ChunkAttackers1") == 1) and		-- if all chunk 1 attackers are dead
--	   ( SobGroup_Empty ("BalcoraGate_Chunk1") ~= 1) and		-- and chunk 1 is still alive
	   ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") > 0) and	-- and chunk 1 is still alive
	   (chunk1SavedONCE == 0) then	
		chunks_saved = chunks_saved + 1					-- increment chunks_saved variable
		print ("chunks SAVED = "..chunks_saved)
		chunk1SavedONCE = 1							-- set one-time variable so check doesn't happen again
	end

	-- chunk 2
	if ( SobGroup_Empty ("ChunkAttackers2") == 1) and		-- if all chunk 2 attackers are dead
--	   ( SobGroup_Empty ("BalcoraGate_Chunk2") ~= 1) and		-- and chunk 2 is still alive
	   ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") > 0) and	-- and chunk 2 is still alive
	   (chunk2SavedONCE == 0) then	
		chunks_saved = chunks_saved + 1					-- increment chunks_saved variable
		print ("chunks SAVED = "..chunks_saved)
		chunk2SavedONCE = 1							-- set one-time variable so check doesn't happen again
	end

	-- chunk 3
	if ( SobGroup_Empty ("ChunkAttackers3") == 1) and		-- if all chunk 3 attackers are dead
--	   ( SobGroup_Empty ("BalcoraGate_Chunk3") ~= 1) and		-- and chunk 3 is still alive
	   ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") > 0) and	-- and chunk 3 is still alive
	   (chunk3SavedONCE == 0) then	
		chunks_saved = chunks_saved + 1					-- increment chunks_saved variable
		print ("chunks SAVED = "..chunks_saved)
		chunk3SavedONCE = 1							-- set one-time variable so check doesn't happen again
	end

end


-- if health of any chunk drops below 50%, play a speech event letting the player know they must save at least 1
function Rule_speechevent_generatorLowHealthNoGeneratorsSaved()
--	if (( SobGroup_HealthPercentage("BalcoraGate_Chunk1") < 0.5) or		-- if the health of any chunk is <50%
	if (( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") < 0.5) or		-- if the health of any chunk is <50%
--	   ( SobGroup_HealthPercentage("BalcoraGate_Chunk2") < 0.5) or
	   ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") < 0.5) or
--	   ( SobGroup_HealthPercentage("BalcoraGate_Chunk3") < 0.5)) and
	   ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") < 0.5)) and
	   ( EventPlaying == 0) and
	   ( chunks_saved == 0 ) then									-- and no chunks have been saved
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_generatorLowHealthNoGeneratorsSaved" )
		Rule_Remove ("Rule_speechevent_generatorLowHealthNoGeneratorsSaved")
	end
end


-- 1 lost 0 saved
function Rule_speechevent_lost1GeneratorNoneSaved()
	if (EventPlaying == 0) and ( chunks_destroyed == 1 ) and ( chunks_saved == 0) then		-- if one chunk has died and none have been saved
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_lost1GeneratorNoneSaved" )
		Rule_Remove ("Rule_speechevent_lost1GeneratorNoneSaved")
	end
end


-- 1 saved
function Rule_speechevent_saved1Generator()
	if (EventPlaying == 0) and ( chunks_saved == 1) then
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_saved1Generator" )
		Rule_Remove ("Rule_speechevent_saved1Generator")
	end
end

-- 1 lost 1 saved
function Rule_speechevent_lost1GeneratorSavedOne()
	-- chunk 1
--	if (EventPlaying == 0) and ( SobGroup_Empty ("BalcoraGate_Chunk1") == 1 ) and		-- if chunk 1 is dead
	if (EventPlaying == 0) and ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") == 0) and		-- if chunk 1 is dead
	   ( SobGroup_Empty ("ChunkAttackers1") ~= 1) and			-- and the chunk1 attackers are still alive
	   ( chunks_saved == 1) then							-- but another chunk has been saved
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_lost1GeneratorSavedOne" )
		Rule_Remove ("Rule_speechevent_lost1GeneratorSavedOne")
	end
	
	-- chunk 2
--	if (EventPlaying == 0) and ( SobGroup_Empty ("BalcoraGate_Chunk2") == 1 ) and		-- if chunk 2 is dead
	if (EventPlaying == 0) and ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") == 0) and		-- if chunk 2 is dead
	   ( SobGroup_Empty ("ChunkAttackers2") ~= 1) and			-- and the chunk2 attackers are still alive
	   ( chunks_saved == 1) then							-- but another chunk has been saved
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_lost1GeneratorSavedOne" )
		Rule_Remove ("Rule_speechevent_lost1GeneratorSavedOne")
	end

	-- chunk 3
--	if (EventPlaying == 0) and ( SobGroup_Empty ("BalcoraGate_Chunk3") == 1 ) and		-- if chunk 3 is dead
	if (EventPlaying == 0) and ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") == 0) and		-- if chunk 3 is dead
	   ( SobGroup_Empty ("ChunkAttackers3") ~= 1) and			-- and the chunk3 attackers are still alive
	   ( chunks_saved == 1) then							-- but another chunk has been saved
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_lost1GeneratorSavedOne" )
		Rule_Remove ("Rule_speechevent_lost1GeneratorSavedOne")
	end
end

-- 2 lost 0 saved
function Rule_speechevent_lost2GeneratorsNoneSaved()
	if (EventPlaying == 0) and ( chunks_destroyed == 2) and (chunks_saved == 0) then		-- if two chunks are dead and none have been saved
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_lost2GeneratorsNoneSaved" )
		Rule_Remove ("Rule_speechevent_lost2GeneratorsNoneSaved")
	end
end

-- 2 saved
function Rule_speechevent_saved2Generators()
	if (EventPlaying == 0) and ( chunks_saved == 2) then								-- if two chunks are saved
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_saved2Generators" )
		Rule_Remove ("Rule_speechevent_saved2Generators")
	end
end

-- 2 lost 1 saved
function Rule_speechevent_lost2GeneratorsSavedOne()
	if (EventPlaying == 0) and ( chunks_destroyed == 2) and ( chunks_saved == 1) then		-- if 2 chunks have been destroyed but another chunk has been saved
 		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "speechevent_lost2GeneratorsSavedOne" )
		Rule_Remove ("Rule_speechevent_lost2GeneratorsSavedOne")
	end
end

-- 3 lost
function Rule_speechevent_lost3Generators()
	if (EventPlaying == 0) and ( chunks_destroyed == 3) then								-- if three chunks are dead
 		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "speechevent_lost3Generators" )
		Rule_Remove ("Rule_speechevent_lost3Generators")
	end
end

-- 3 saved
function Rule_speechevent_saved3Generators()
	if (EventPlaying == 0) and ( chunks_saved == 3) then								-- if three chunks are saved
 		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "speechevent_saved3Generators" )
		Rule_Remove ("Rule_speechevent_saved3Generators")
	end
end


-- watch to see when the "destroy Vaygr forces attacking the gate" objective should be complete
function Rule_destroyGateAttackersOBJECTIVE()
	if ( chunks_saved == 3) then								-- if three chunks are saved
                Objective_SetState( obj_prim_stopvaygr_id, OS_Complete )	-- set objective to complete
		Rule_Remove ("Rule_destroyGateAttackersOBJECTIVE")
	end
	
	if ( chunks_saved == 2) and ( chunks_destroyed == 1) then		-- if 2 chunks are saved and 1 destroyed
                Objective_SetState( obj_prim_stopvaygr_id, OS_Complete )	-- set objective to complete
		Rule_Remove ("Rule_destroyGateAttackersOBJECTIVE")
	end

	if ( chunks_saved == 1) and ( chunks_destroyed == 2) then		-- if 1 chunk is saved and 2 destroyed
                Objective_SetState( obj_prim_stopvaygr_id, OS_Complete )	-- set objective to complete
		Rule_Remove ("Rule_destroyGateAttackersOBJECTIVE")
	end

end



-- Watch for when the player's ships are within sensors range of the Vaygr Shipyard
function Rule_seenShipyardWatch()

	if ( SobGroup_PlayerIsInSensorRange("VaygrShipyard", 0) == 1) then
		if (EventPlaying == 0) then			
			shipyardDiscovered = 1
			if ( obj_prim_findshipyard_id ~= 0) then				-- if objective exists, set findshipyard objective to complete
		                Objective_SetState( obj_prim_findshipyard_id, OS_Complete )	-- set objective to complete
			end			
			if ( ping_shipyardLocation_id ~= 0) then				-- if ping exists, remove it
				Ping_Remove( ping_shipyardLocation_id )				-- if it exists, remove the ping on the power signature
			end
			EventPlaying = 1
			Sound_EnterIntelEvent()
			Event_Start( "intelevent_shipyardDetected" )
			Rule_Remove ("Rule_seenShipyardWatch")
		end
	end
end


-- when shipyard is destroyed play a speech event about it
function Rule_speechevent_shipyardDestroyed()
	if (EventPlaying == 0) and ( SobGroup_Empty ("VaygrShipyard") == 1 ) then						-- if the shipyard is dead
		EventPlaying = 1
		Sound_EnterIntelEvent()
 		Event_Start( "speechevent_shipyardDestroyed" )
		Rule_Remove ("Rule_speechevent_shipyardDestroyed")
	end
end


-- when one chunk is saved or destroyed, tell player to send a scout to investigate shipyard location
function Rule_speechevent_sendScoutToInvestigate()
	if (( chunks_saved == 1 ) or ( chunks_destroyed == 1 )) and (shipyardDiscovered == 0) then
                Rule_AddInterval("Rule_speechevent_sendScoutToInvestigateSTART", 50 )				-- have speech event start in <x> seconds
		Rule_Remove ("Rule_speechevent_sendScoutToInvestigate")
	end
end

-- function for actually playing the speech event once the timer (rule_addInterval) has expired
function Rule_speechevent_sendScoutToInvestigateSTART()
	if ( ( chunks_saved == 1 ) or ( chunks_destroyed == 1 ) ) and
	     (EventPlaying == 0) and
	     (shipyardDiscovered == 0) then		-- do the check again just to make sure the shipyard hasn't been discovered
		EventPlaying = 1
		Sound_EnterIntelEvent()
		Event_Start( "speechevent_sendScoutToInvestigate" )
		Rule_Remove ("Rule_speechevent_sendScoutToInvestigateSTART")
	end
end



-- when the shipyard objective and gate objectives are complete, play speech event
function Rule_speechevent_gateReadyForUse()
	if ( Objective_GetState( obj_prim_stopvaygr_id ) == OS_Complete ) and ( Objective_GetState( obj_prim_destroyshipyard_id ) == OS_Complete ) then
		if (EventPlaying == 0) then
			if ( Sensors_ManagerIsUp() == 1 ) then							-- if player is in the sensors manager
				Sensors_Toggle(0)									-- take them out
				Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
				EventPlaying = 1
				Sound_EnterIntelEvent()
				Rule_Add ("Rule_PlayAmbientMusic")
				Event_Start( "speechevent_gateReadyForUse" )
				SobGroup_MoveToSobGroup( Players_Dreadnaught, "Balcora_Gate" )	-- tell DN to move to Gate so it will point at it
				Rule_AddInterval ("Rule_stopDreadnaught", 5)					-- after x seconds tell DN to stop moving
				Rule_Remove ("Rule_speechevent_gateReadyForUse")
			else
				Sensors_EnableToggle(0)								-- Disallow going in and out of the Sensors Manager
				EventPlaying = 1
				Sound_EnterIntelEvent()
				Rule_Add ("Rule_PlayAmbientMusic")
				Event_Start( "speechevent_gateReadyForUse" )
				SobGroup_MoveToSobGroup( Players_Dreadnaught, "Balcora_Gate" )	-- tell DN to move to Gate so it will point at it
				Rule_AddInterval ("Rule_stopDreadnaught", 5)					-- after x seconds tell DN to stop moving
				Rule_Remove ("Rule_speechevent_gateReadyForUse")
			
			end
		end
	end
end


function Rule_watchForNIS13BDone()
	if ( NIS13BOver == 0) and ( NISComplete( k_currentNISPlaying_id ) == 1 ) then
		NIS13BOver = 1
--		setMissionComplete( 1 )
		Event_Start( "speechevent_missionComplete" )
		Rule_Remove ("Rule_watchForNIS13BDone")
	elseif ( NIS13BOver == 1) then
		NIS13BOver = 1
		Rule_Remove ("Rule_watchForNIS13BDone")
	end
end

function Rule_watchForNIS13BDoneFromTimer()
	if ( NIS13BOver == 0 ) then
		NIS13BOver = 1
		setMissionComplete( 1 )
--		Event_Start( "speechevent_missionComplete" )
		Rule_Remove ("Rule_watchForNIS13BDoneFromTimer")
	elseif ( NIS13BOver == 1) then
		NIS13BOver = 1
		Rule_Remove ("Rule_watchForNIS13BDoneFromTimer")
	end
end


function Rule_stopDreadnaught()
	SobGroup_Stop( 0, Players_Dreadnaught)
	Rule_Remove ("Rule_stopDreadnaught")
end


-- Watch for Mothership to be destroyed
function Rule_intelevent_mothershipDestroyed()
	if ( SobGroup_Empty( Players_Mothership ) == 1 ) then
		Event_Start( "speechevent_playerloses" )
		Rule_Remove( "Rule_intelevent_mothershipDestroyed" )
	end
end

-- Watch for Dreadnaught to be destroyed
function Rule_intelevent_dreadnaughtDestroyed()
	if ( SobGroup_Empty( Players_Dreadnaught ) == 1 ) then
		Event_Start( "speechevent_playerlosesDreadnaught" )
		Rule_Remove( "Rule_intelevent_dreadnaughtDestroyed" )
	end
end


-- ===== INTEL EVENTS ===========================================================================






-- here we have functions that ensure the player gets attacked as time goes by
function Rule_Attack_1()	
	if ( Universe_GameTime() >= g_attack_1 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_1_A", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_1" )
	end
end

function Rule_Attack_2()	
	if ( Universe_GameTime() >= g_attack_2 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_1_B", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_2" )
	end
end

function Rule_Attack_3()	
	if ( Universe_GameTime() >= g_attack_3 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_1_C", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_3" )
	end
end

function Rule_Attack_4()	
	if ( Universe_GameTime() >= g_attack_4 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_1", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_4" )
	end
end

function Rule_Attack_5()	
	if ( Universe_GameTime() >= g_attack_5 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_2_A", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_5" )
	end
end

function Rule_Attack_6()	
	if ( Universe_GameTime() >= g_attack_6 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_2_B", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_6" )
	end
end

function Rule_Attack_7()	
	if ( Universe_GameTime() >= g_attack_7 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_2_C", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_7" )
	end
end

function Rule_Attack_8()	
	if ( Universe_GameTime() >= g_attack_8 ) then	
		SobGroup_Attack( 1, "Vgr_AttackGroup_2", "Players_Ships" )	
		Rule_Remove( "Rule_Attack_8" )
	end
end
-- END GAME: DEFEND THE GATE





-- ===== INITIAL ATTACK =============================================================================

-------------------------------------------------------------------------------------------------
-- Setup Initial Attack
-------------------------------------------------------------------------------------------------
function Rule_initialAttackSetup()

--	if ( Event_IsDone("intelevent_stopthem") ) then				-- After the intro intel event is over
        if ( Universe_GameTime() >= g_now_time + 30 ) then               -- after x seconds

		-- Battlecruiser
		if ( HW2_IsRunTimeSobGroupEmpty ( Players_Battlecruiser) ~= 1) then				-- If player has a BC
			SobGroup_Attack( 1, "InitialAttack_Battlecruiser", Players_Battlecruiser )		-- attack it
		elseif ( HW2_IsRunTimeSobGroupEmpty  ( Players_Carrier) ~= 1) then								-- If not
			SobGroup_Attack( 1, "InitialAttack_Battlecruiser", Players_Carrier )			-- attack the Carrier
		else																	-- If not
			SobGroup_Attack( 1, "InitialAttack_Battlecruiser", Players_Mothership )		-- attack the Mothership
		end
		
		-- Bomber groups
		if ( HW2_IsRunTimeSobGroupEmpty ( Players_Carrier) ~= 1) then							-- If player has a Carrier
			SobGroup_Attack( 1, "InitialAttack_Bombers1", Players_Carrier )			-- attack it
		elseif ( HW2_IsRunTimeSobGroupEmpty ( Players_Battlecruiser) ~= 1) then					-- If player has a Battlecruiser
			SobGroup_Attack( 1, "InitialAttack_Bombers1", Players_Battlecruiser )		-- attack it
		else
			SobGroup_Attack( 1, "InitialAttack_Bombers1", Players_Mothership )		-- attack Mothership
		end
		SobGroup_SetSpeed("InitialAttack_Bombers1", 0.28)		-- slow Bombers down so they move with the Battlecruiser

		-- Heavy Missile groups
--	        SobGroup_GuardSobGroup("InitialAttack_HeavyMissileFrigates1", "InitialAttack_Battlecruiser")	-- guard Vaygr Battlecruiser
		if ( HW2_IsRunTimeSobGroupEmpty  ( Players_Carrier) ~= 1) then								-- If not
			SobGroup_Attack( 1, "InitialAttack_HeavyMissileFrigates1", Players_Carrier )			-- attack the Carrier
		elseif ( HW2_IsRunTimeSobGroupEmpty ( Players_Battlecruiser) ~= 1) then				-- If player has a BC
			SobGroup_Attack( 1, "InitialAttack_HeavyMissileFrigates1", Players_Battlecruiser )		-- attack it
		else																	-- If not
			SobGroup_Attack( 1, "InitialAttack_HeavyMissileFrigates1", Players_Mothership )		-- attack the Mothership
		end
		
		-- Laser Corvettes
		if ( SobGroup_Empty ("InitialAttack_Battlecruiser") ~= 1) then							-- if there is anything in the Battlecruiser slot
			SobGroup_GuardSobGroup("InitialAttack_LaserCorvettes1", "InitialAttack_Battlecruiser")	-- guard Vaygr Battlecruiser
		elseif ( HW2_IsRunTimeSobGroupEmpty  ( Players_Carrier) ~= 1) then						-- If not
			SobGroup_Attack( 1, "InitialAttack_LaserCorvettes1", Players_Carrier )					-- attack the Carrier
		elseif ( HW2_IsRunTimeSobGroupEmpty ( Players_Battlecruiser) ~= 1) then					-- If player has a BC
			SobGroup_Attack( 1, "InitialAttack_LaserCorvettes1", Players_Battlecruiser )				-- attack it
		else																			-- If not
			SobGroup_Attack( 1, "InitialAttack_LaserCorvettes1", Players_Mothership )				-- attack the Mothership
		end
		

		-- Infiltration Frigates
		if ( HW2_IsRunTimeSobGroupEmpty ( Players_Shipyard) ~= 1) then										-- If player has a Shipyard
		        SobGroup_CaptureSobGroup("InitialAttack_InfiltrationFrigates1", Players_Shipyard )		-- try to capture it
		elseif ( HW2_IsRunTimeSobGroupEmpty ( Players_Carrier) ~= 1) then										-- If not
		        SobGroup_CaptureSobGroup("InitialAttack_InfiltrationFrigates1", Players_Carrier )		-- try to capture it
		else																			-- If there's no Carrier
		        SobGroup_CaptureSobGroup("InitialAttack_InfiltrationFrigates1", Players_Mothership )	-- try to capture it
		end

		-- Interceptor groups
	        SobGroup_GuardSobGroup("InitialAttack_Interceptors1", "InitialAttack_Bombers1")			-- guard Vaygr Bombers

--		Rule_AddInterval ("Rule_PlayBattleMusic", 25)
		Rule_Add ("Rule_watchForInitialAttackToDie")
		
		Rule_Remove ("Rule_initialAttackSetup")

	end
end


function Rule_watchForInitialAttackToDie()
	if ( SobGroup_Empty ("InitialAttack_Battlecruiser") == 1) and
	   ( SobGroup_Empty ("InitialAttack_Bombers1") == 1) and
	   ( SobGroup_Empty ("InitialAttack_HeavyMissileFrigates1") == 1) and
	   ( SobGroup_Empty ("InitialAttack_LaserCorvettes1") == 1) and
--	   ( SobGroup_Empty ("InitialAttack_InfiltrationFrigates1") == 1) and
	   ( SobGroup_Empty ("InitialAttack_LaserCorvettes1") == 1) then
--		Rule_AddInterval ("Rule_PlayAmbientMusic", 5)
		Rule_Remove ("Rule_watchForInitialAttackToDie")
	end
end


-- after <x> seconds, make the initial attack Bombers go full speed
function Rule_initialAttackBombersFullSpeed()
        if ( Universe_GameTime() >= g_now_time + 65 ) then               -- after 65 seconds
		SobGroup_SetSpeed("InitialAttack_Bombers1", 1)		-- bring Bombers back up to full speed
		Rule_Remove ("Rule_initialAttackBombersFullSpeed")
	end
end



-----------------------------------------------------------------------------------------------------

-- ===== INITIAL ATTACK =============================================================================







-- ===== GATE ATTACK ================================================================================

-----------------------------------------------------------------------------------------------------
-- Setup Gate Attack
-----------------------------------------------------------------------------------------------------
function Rule_gateAttackSetup()

	-- chunk 1
--	SobGroup_Attack( 3, "ChunkAttackersLarge1", "BalcoraGate_Chunk1" )			-- attack chunk 1
	SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge1", "Balcora_Gate", "Generator1")			-- attack chunk 1
	SobGroup_GuardSobGroup( "ChunkAttackersSmall1", "ChunkAttackersLarge1")		-- have Assault Frigates guard attackers
	
	-- chunk 2
--	SobGroup_Attack( 3, "ChunkAttackersLarge2", "BalcoraGate_Chunk2" )			-- attack chunk 2
	SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge2", "Balcora_Gate", "Generator2")			-- attack chunk 2
	SobGroup_GuardSobGroup( "ChunkAttackersSmall2", "ChunkAttackersLarge2")		-- have Assault Frigates guard attackers

	-- chunk 3
--	SobGroup_Attack( 3, "ChunkAttackersLarge3", "BalcoraGate_Chunk3" )			-- attack chunk 3
	SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge3", "Balcora_Gate", "Generator3")			-- attack chunk 3
	SobGroup_GuardSobGroup( "ChunkAttackersSmall3", "ChunkAttackersLarge3")		-- have Assault Frigates guard attackers

	Rule_Add ("Rule_chunkAttackerWatch")

	Rule_Remove ("Rule_gateAttackSetup")
end
-----------------------------------------------------------------------------------------------------








-----------------------------------------------------------------------------------------------------
-- Watch gate attackers for various conditions (e.g. gate chunks being destroyed)
-----------------------------------------------------------------------------------------------------

function Rule_chunkAttackerWatch()

	-- chunk 1
--	if ( SobGroup_Empty ("BalcoraGate_Chunk1") == 1 ) and ( Chunk1DeadONCE == 0 ) then	-- if chunk 1 is destroyed
	if ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") == 0) and ( Chunk1DeadONCE == 0 ) then	-- if chunk 1 is destroyed
		if (SobGroup_Empty ("VaygrShipyard") ~= 1) then							-- if shipyard is alive
	        	SobGroup_GuardSobGroup("ChunkAttackers1", "VaygrShipyard")				-- guard Vaygr shipyard
			CPU_AddSobGroup( 3, "ChunkAttackers1" )									-- hand the ships over to the AI
			Chunk1DeadONCE = 1												-- set one-time var so check doesn't happen again
			FX_StopEffect( Chunk1Beam )										-- stop beam fx on gate
			FX_StopEffect( Chunk1Ring )										-- stop beam fx on gate
			FX_StopEffect( Chunk1RingLoop )									-- stop beam fx on gate
		else																-- if not
			SobGroup_Attack( 3, "ChunkAttackers1", Players_Mothership )					-- attack player's MS
			Chunk1DeadONCE = 1												-- set one-time var so check doesn't happen again
			FX_StopEffect( Chunk1Beam )										-- stop beam fx on gate
			FX_StopEffect( Chunk1Ring )										-- stop beam fx on gate
			FX_StopEffect( Chunk1RingLoop )									-- stop beam fx on gate
		end
	end

	-- chunk 2
--	if ( SobGroup_Empty ("BalcoraGate_Chunk2") == 1 ) and ( Chunk2DeadONCE == 0 ) then	-- if chunk 2 is destroyed
	if ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") == 0) and ( Chunk2DeadONCE == 0 ) then	-- if chunk 2 is destroyed
		if (SobGroup_Empty ("VaygrShipyard") ~= 1) then							-- if shipyard is alive
	        	SobGroup_GuardSobGroup("ChunkAttackers2", "VaygrShipyard")				-- guard Vaygr shipyard
			CPU_AddSobGroup( 3, "ChunkAttackers2" )									-- hand the ships over to the AI
			Chunk2DeadONCE = 1												-- set one-time var so check doesn't happen again
			FX_StopEffect( Chunk2Beam )										-- stop beam fx on gate
			FX_StopEffect( Chunk2Ring )										-- stop beam fx on gate
			FX_StopEffect( Chunk2RingLoop )									-- stop beam fx on gate
		else																-- if not
			SobGroup_Attack( 3, "ChunkAttackers2", Players_Mothership )					-- attack player's MS
			Chunk2DeadONCE = 1												-- set one-time var so check doesn't happen again
			FX_StopEffect( Chunk2Beam )										-- stop beam fx on gate
			FX_StopEffect( Chunk2Ring )										-- stop beam fx on gate
			FX_StopEffect( Chunk2RingLoop )									-- stop beam fx on gate
		end
	end

	-- chunk 3
--	if ( SobGroup_Empty ("BalcoraGate_Chunk3") == 1 ) and ( Chunk3DeadONCE == 0 ) then	-- if chunk 3 is destroyed
	if ( SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") == 0) and ( Chunk3DeadONCE == 0 ) then	-- if chunk 2 is destroyed
		if (SobGroup_Empty ("VaygrShipyard") ~= 1) then							-- if shipyard is alive
	        	SobGroup_GuardSobGroup("ChunkAttackers3", "VaygrShipyard")				-- guard Vaygr shipyard
			CPU_AddSobGroup( 3, "ChunkAttackers3" )									-- hand the ships over to the AI
			Chunk3DeadONCE = 1												-- set one-time var so check doesn't happen again
			FX_StopEffect( Chunk3Beam )										-- stop beam fx on gate
			FX_StopEffect( Chunk3Ring )										-- stop beam fx on gate
			FX_StopEffect( Chunk3RingLoop )									-- stop beam fx on gate
		else																-- if not
			SobGroup_Attack( 3, "ChunkAttackers3", Players_Mothership )					-- attack player's MS
			Chunk3DeadONCE = 1												-- set one-time var so check doesn't happen again
			FX_StopEffect( Chunk3Beam )										-- stop beam fx on gate
			FX_StopEffect( Chunk3Ring )										-- stop beam fx on gate
			FX_StopEffect( Chunk3RingLoop )									-- stop beam fx on gate
		end
	end
	
end


EnemiesAttackingLarge = {0, 0, 0}
EnemiesAttackingSmall = {0, 0, 0}
--LargeTargets = {"LG1", "LG2", "LG3"}
--SmallTargets = {"ST1", "ST1", "ST2"}

-- tells chunk attackers to retaliate if they're being attacked
function Rule_chunkAttackerRetaliate()

	-- watches for chunk attackers to be attacked
	for i = 1, 3 do
		-- logic for Capship-killaz
		if ( SobGroup_UnderAttack( "ChunkAttackersLarge"..i ) == 1) and					-- if a Frigate-killing group is under attack
		   (EnemiesAttackingLarge[i] == 0 ) then										-- and the variable hasn't been set
			print ("This large group under attack: "..i)
			SobGroup_GetAttackers( "ChunkAttackersLarge"..i, "AttackingLarge"..i )			-- get a list of the ships attacking
			if (SobGroup_Empty ("AttackingLarge"..i) ~= 1) then
				print ("This large group has ships in its AttackingLarge group: "..i)
			end
			print ("This large group is doing target filtering: "..i)
				
			SobGroup_FillShipsByType( "tempSobGroup", "AttackingLarge"..i, "Hgn_AssaultFrigate" )		-- filter all Frigates from the attackers
			if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
				print ("This large group found some Assault Frigates: "..i)
				SobGroup_SobGroupAdd( "LargeTargets"..i, "tempSobGroup")		-- Add all the large targets to the target list
			end
			
			SobGroup_FillShipsByType( "tempSobGroup", "AttackingLarge"..i, "Hgn_TorpedoFrigate" )		-- filter all Frigates from the attackers
			if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
				print ("This large group found some Torpedo Frigates: "..i)
				SobGroup_SobGroupAdd( "LargeTargets"..i, "tempSobGroup")		-- Add all the large targets to the target list
			end
			
			SobGroup_FillShipsByType( "tempSobGroup", "AttackingLarge"..i, "Hgn_MarineFrigate" )			-- filter all Frigates from the attackers
			if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
				print ("This large group found some Marine Frigates: "..i)
				SobGroup_SobGroupAdd( "LargeTargets"..i, "tempSobGroup")		-- Add all the large targets to the target list
			end

			SobGroup_FillShipsByType( "tempSobGroup", "AttackingLarge"..i, "Hgn_IonCannonFrigate" )	-- filter all Frigates from the attackers			
			if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
				print ("This large group found some Ion Cannon Frigates: "..i)
				SobGroup_SobGroupAdd( "LargeTargets"..i, "tempSobGroup")		-- Add all the large targets to the target list
			end

			SobGroup_FillShipsByType( "tempSobGroup", "AttackingLarge"..i, "Hgn_Destroyer" )				-- filter all Destoyers from the attackers
			if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
				print ("This large group found some Destroyers: "..i)
				SobGroup_SobGroupAdd( "LargeTargets"..i, "tempSobGroup")		-- Add all the large targets to the target list
			end

			SobGroup_FillShipsByType( "tempSobGroup", "AttackingLarge"..i, "Hgn_BattleCruiser" )			-- filter all Battlecruisers from the attackers
			if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
				print ("This large group found some Battlecruisers: "..i)
				SobGroup_SobGroupAdd( "LargeTargets"..i, "tempSobGroup")		-- Add all the large targets to the target list
			end
			
			SobGroup_FillShipsByType( "tempSobGroup", "AttackingLarge"..i, "Hgn_IonTurret" )					-- filter all Platforms from the attackers			
			if ( SobGroup_Empty( "tempSobGroup" ) == 0) then
				print ("This large group found some Platforms: "..i)
				SobGroup_SobGroupAdd( "LargeTargets"..i, "tempSobGroup")		-- Add all the large targets to the target list
			end
			
			if ( SobGroup_Empty ( "LargeTargets"..i ) ~= 1) then					-- if there are any ships in the large target list
				print ("Telling this large group to attack: "..i)
				EnemiesAttackingLarge[i] = 1										-- set the variable telling the chunk attackers to retaliate against their attackers
				SobGroup_Attack( 3, "ChunkAttackersLarge"..i, "LargeTargets"..i )				-- attack the targets
			end
		end	
	end	
end


-- go back to attacking Balcora Gate if the targets are dead or you stray too far from the Gate
function Rule_chunkAttackerRetaliateWATCH()

	-- watches for chunk attackers (LARGE) to kill the ships they're attacking
	for i = 1, 3 do
		if ( EnemiesAttackingLarge[i] == 1) and										-- if the variable has been set
		   ( ( SobGroup_Empty( "LargeTargets"..i ) == 1) or					-- and the targets are dead
		   ( SobGroup_IsShipNearPoint( "ChunkAttackersLarge"..i, "ChunkPoint"..i, 2500 ) ~= 1) ) then	-- or you're too far from the Gate
			print ("This large group is too far from gate or has killed their attackers, telling them to attack Balcora Gate: "..i)
--			SobGroup_Attack( 3, "ChunkAttackersLarge"..i, "BalcoraGate_Chunk"..i )				-- go back to attacking the Gate
			SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge"..i, "Balcora_Gate","Generator"..i)
			EnemiesAttackingLarge[i] = 0											-- set the variable
		end
	end


	-- watches for chunk attackers (SMALL) to kill the ships they're attacking
--	for i = 1, 3 do
--		if ( EnemiesAttackingSmall[i] == 1) and										-- if the variable has been set
--		   ( ( SobGroup_Empty( "SmallTargets"..i ) == 1) or					-- and the targets are dead
--		   ( SobGroup_IsShipNearPoint( "ChunkAttackersSmall"..i, "ChunkPoint"..i, 2500 ) ~= 1) ) then	-- or you're too far from the Gate
--			print ("This small group is too far from gate or has killed their attackers, telling them to attack Balcora Gate: "..i)
--			SobGroup_Attack( 3, "ChunkAttackersSmall"..i, "BalcoraGate_Chunk"..i )				-- go back to attacking the Gate
--			EnemiesAttackingSmall[i] = 0											-- set the variable
--		end
--	end

	
end
-----------------------------------------------------------------------------------------------------

-- ===== GATE ATTACK ================================================================================







-- ===== SHIPYARD ===================================================================================
-------------------------------------------------------------------------------------------------
-- Setup Shipyard guard et al
-------------------------------------------------------------------------------------------------
function Rule_shipyardSetup()
        SobGroup_GuardSobGroup("ShipyardGuard", "VaygrShipyard")			-- guard Vaygr Shipyard
	
	Rule_Remove ("Rule_shipyardSetup")
end
-------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------
-- Watch to see if player starts harvesting from 'contested' resource pocket.  If so, send bombers
-------------------------------------------------------------------------------------------------
function Rule_watchResourcePocket()

	Player_FillSobGroupInVolume("ResourceSphereShips", 0, "ResourceCollectorSphere")		-- get ships in the resource collector volume
	
	SobGroup_FillShipsByType("PlayerCollectors", "ResourceSphereShips", "Hgn_ResourceCollector" )	-- filter for Resource Collectors and put in SobGroup

	if ( SobGroup_Empty ( "PlayerCollectors" ) ~= 1) then			-- if there are any Res Collectors in the sphere
			Rule_Add ("Rule_attackPlayerCollectors")			-- add the rule to attack them
			Rule_Remove ("Rule_watchResourcePocket")
	end
end

-- have Shipyard create an attack group and send it to attack Collectors
function Rule_attackPlayerCollectors()
	if ( SobGroup_Empty ("VaygrShipyard") ~= 1) then		-- if the shipyard is still alive
		-- spawn the collector attack group
		CollectorBombers1 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Bomber")
		CollectorInterceptors1 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Interceptor")
		CollectorBombers2 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Bomber")
		CollectorInterceptors2 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Interceptor")
	
		-- do setup on the newly-spawned ships
		Rule_AddInterval("Rule_collectorAttackSetup", 8 )
	
		Rule_Remove ("Rule_attackPlayerCollectors")
	end
end

-- do setup on newly-spawned ships
function Rule_collectorAttackSetup()
	if ( SobGroup_Empty ("VaygrShipyard") ~= 1) then		-- if the shipyard is still alive

		-- set tactics to aggressive again so newly-created ships will be aggressive
	--	Player_SetGlobalROE( 1, OffensiveROE )
	
		-- Interceptors guard Bombers
		SobGroup_GuardSobGroup(CollectorInterceptors1, CollectorBombers1)
		SobGroup_GuardSobGroup(CollectorInterceptors2, CollectorBombers2)
	
		-- Bombers attack collectors
		SobGroup_Attack( 0, CollectorBombers1, PlayerCollectors )
		SobGroup_Attack( 0, CollectorBombers2, PlayerCollectors )
	
		-- 200 seconds later, start the resource pocket watch again
		Rule_AddInterval("Rule_watchResourcePocket", 200 )
	
		Rule_Remove ("Rule_collectorAttackSetup")
	end
end


-----------------------------------------------------------------------------------------------------

-- ===== SHIPYARD ===================================================================================






-- ===== MUSIC ==================================================================================

function Rule_PlayAmbientMusic()
	print ("trying to play ambient music!")
	Sound_MusicPlayType( "data:sound/music/ambient/amb_13", MUS_Ambient )
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




-- EVENTS
-- create the events table
Events = {} -- the name of this table must always be Events - this is what the game looks for

-- this is the intro intelevent
Events.intelevent_stopthem = 
{
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6451' )",""}, -- ..' Mission Start'
	},
	{
                HW2_Wait ( 2 ),
	},
	{
		HW2_LocationCardEvent( "$46020", 6 ),						-- BALCORA GATE
	},
	{
                HW2_Wait ( 1.5 ),
	},
	{
		{"Sound_EnableAllSpeech( 1 )",""},
		HW2_SubTitleEvent( Actor_FleetCommand, "$46029", 6 ),				-- Makaan has used a Progenitor Dreadnaught to open Balcora Gate.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46025", 4 ),				-- Beyond lies Sajuuk, the Great Maker.
	},
	{
		{ "Universe_EnableSkip(1)", "" },							-- Enable Intel event skipping
                HW2_Letterbox( 1 ),
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_Pause ( 1 ),
	},
	{
--		{"SetAlliance( 0, 2 )",""},							-- Ally with the Balcora gate so you can check its health
--		{"SetAlliance( 2, 0 )",""},
                HW2_Wait ( 2 ),
	},
	{
		{"Camera_FocusSave()",""},
		{"Sensors_Toggle( 1 )",""},
	},
	{
		{ "Camera_Interpolate( 'here', 'camera2', 1.5)",""},
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46030", 8 ),				-- The Vaygr are concentrating fire on three power subsystems located here.
--		{"pointer_chunk1_id = HW2_CreateEventPointerSubSystem('Meg_ProgenitorPowerGen', 'Balcora_Gate')",""},
--		{"pointer_chunk2_id = HW2_CreateEventPointerSubSystem('Meg_ProgenitorPowerGen', 'Balcora_Gate')",""},
--		{"pointer_chunk3_id = HW2_CreateEventPointerSubSystem('Meg_ProgenitorPowerGen', 'Balcora_Gate')",""},
		{"pointer_chunk1_id = HW2_CreateEventPointerVolume('ChunkPoint1')",""},
		{"pointer_chunk2_id = HW2_CreateEventPointerVolume('ChunkPoint2')",""},
		{"pointer_chunk3_id = HW2_CreateEventPointerVolume('ChunkPoint3')",""},

	},
	{
                HW2_Wait ( 1 ),
	},
	{
--		{ "Camera_FocusSobGroup( 'Balcora_Gate', 1, 0, 0 )", "" },
		HW2_SubTitleEvent( Actor_FleetIntel, "$46031", 6 ),				-- We must stop them before they disable the Gate.
		{"ping_gate_attackers1_id = HW2_PingCreateWithLabel( ping_gate_attackers1, 'ChunkAttackers1' )",""},
		{"Ping_AddDescription(ping_gate_attackers1_id, 0, '$46420')",""},
		{"ping_gate_attackers2_id = HW2_PingCreateWithLabel( ping_gate_attackers2, 'ChunkAttackers2' )",""},
		{"Ping_AddDescription(ping_gate_attackers2_id, 0, '$46420')",""},
		{"ping_gate_attackers3_id = HW2_PingCreateWithLabel( ping_gate_attackers3, 'ChunkAttackers3' )",""},
		{"Ping_AddDescription(ping_gate_attackers3_id, 0, '$46420')",""},
		{"obj_prim_stopvaygr_id = Objective_Add(obj_prim_stopvaygr, OT_Primary)",""},		-- Add primary objective: prevent Vaygr from disabling Balcora Gate
		{ "Objective_AddDescription( obj_prim_stopvaygr_id, '$46450')", "" },
	},
	{
                HW2_Wait ( 3 ),
	},
	{
		{"EventPointer_Remove(pointer_chunk1_id)",""},
		{"EventPointer_Remove(pointer_chunk2_id)",""},
		{"EventPointer_Remove(pointer_chunk3_id)",""},
		HW2_Letterbox( 0 ),
--		{ "Camera_FocusSobGroup( Players_Mothership, 1, 0, 0 )", "" },
		{ "Sensors_Toggle( 0 )","" },
		{"Camera_FocusRestore()",""},
		{ "Universe_EnableSkip(0)", "" },							-- Disable Intel event skipping
		HW2_Pause ( 0 ),
	},
--~         {
--~                 {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
--~                 HW2_Wait ( 1 ),
--~ 	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}



Events.speechevent_generatorLowHealthNoGeneratorsSaved = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46038", 5 ),				-- Sensors indicate heavy damage to the Gate power generators.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46037", 12 ),				-- According to the data provided by the Oracle, at least one generator must remain intact for the Gate to function.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.speechevent_lost1GeneratorNoneSaved = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46040", 4 ),				-- The Vaygr have destroyed one power generator.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46041", 6 ),				-- We need at least one operational generator for the Gate to function.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46042", 5 ),				-- Prevent the Vaygr from destroying the remaining generators at all costs.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.speechevent_saved1Generator = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46045", 2 ),				-- Vaygr forces destroyed.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46046", 2 ),				-- One generator is safe.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.speechevent_lost1GeneratorSavedOne = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46050", 4 ),				-- Gate power generator lost.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.speechevent_lost2GeneratorsNoneSaved = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46055", 4 ),				-- The gate has lost a second generator.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46056", 4 ),				-- The last power subsystem must survive.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.speechevent_saved2Generators = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46060", 3 ),				-- Vaygr forces destroyed.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46061", 3 ),				-- Two of the generators are safe.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.speechevent_lost2GeneratorsSavedOne = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46065", 4 ),				-- Vaygr forces have destroyed two power generators.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.speechevent_lost3Generators = 
{
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46070", 4 ),				-- All three generators are destroyed.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46071", 5 ),				-- The Gate is lost.
	},
	{
                HW2_Wait ( 3 ),
	},
	{
		{"Event_Start( 'speechevent_playerloses')",""},
	},
}

Events.speechevent_saved3Generators = 
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46051", 4 ),				-- Vaygr forces eliminated.  Balcora Gate is under our control.
	},
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6452' )",""}, -- ..' Balcora Gate Safe'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}

Events.intelevent_shipyardDetected = 
{
	{
                HW2_Letterbox( 1 ),
		{ "Universe_EnableSkip(1)", "" },							-- Enable Intel event skipping
--		{"Rule_AddInterval ('Rule_PlayStagingMusic', 0.5)",""},
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
		{"Sensors_Toggle( 1 )",""},
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
--		{ "Camera_FocusSobGroup( 'VaygrShipyard', 1, 0, 0 )", "" },
		{"pointer_vaygrshipyard_id = HW2_CreateEventPointerSobGroup('VaygrShipyard')",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$46100", 3 ),				-- Vaygr Shipyard detected.
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46101", 7 ),				-- It must be destroyed to prevent the Vaygr from launching further attacks on the Gate.
		{"ping_shipyard_id = HW2_PingCreateWithLabel( ping_shipyard, 'VaygrShipyard' )",""},		-- Add ping to the shipyard
		{"Ping_AddDescription(ping_shipyard_id, 0, '$46425')",""},
		{"obj_prim_destroyshipyard_id = Objective_Add(obj_prim_destroyshipyard, OT_Primary)",""},	-- Add primary objective: destroy Vaygr shipyard
		{ "Objective_AddDescription( obj_prim_destroyshipyard_id, '$46455')", "" },
		{"Rule_Add( 'Rule_speechevent_gateReadyForUse' )",""},			-- Start checking for all objectives complete so Gate can be activated
	},
	{
		{"EventPointer_Remove(pointer_vaygrshipyard_id)",""},			-- remove pointer
                HW2_Wait ( 0.5 ),
	},
        {
		HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },							-- Disable Intel event skipping
		HW2_Pause ( 0 ),
                {"Sensors_Toggle( 0 )","" },
        },
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6453' )",""}, -- ..' Destroy Vaygr Shipyard'
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
		HW2_SubTitleEvent( Actor_FleetIntel, "$46105", 5 ),				-- The Vaygr shipyard has been destroyed.
        	{"Objective_SetState( obj_prim_destroyshipyard_id, OS_Complete )",""},	-- set objective to complete
	},
        {
                {"Rule_Add ('Rule_PlaySaveGameLocationCard')",""},
                HW2_Wait ( 1 ),
	},
        {
		{"g_save_id = g_save_id + 1",""},
		{"Campaign_QuickSaveNb( g_save_id, '$6454' )",""}, -- ..' Vaygr Shipyard Destroyed'
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.speechevent_dreadnaughtDamaged = 
{
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46120", 7 ),				-- Dreadnaught hull integrity at 20 percent and falling.
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46121", 5 ),				-- We cannot lose the Dreadnaught.
		{"obj_prim_protectdreadnaught_id = Objective_Add(obj_prim_protectdreadnaught, OT_Primary)",""},	-- Add primary objective: protect the Dreadnaught
		{ "Objective_AddDescription( obj_prim_protectdreadnaught_id, '$46467')", "" },
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46122", 5 ),				-- Allocate combat vessels to protect it.
	},
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}


Events.speechevent_sendScoutToInvestigate = 
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
		{"Sensors_Toggle( 1 )",""},
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
--		{ "Camera_FocusSobGroup( 'VaygrShipyard', 1, 0, 0 )", "" },
		{"pointer_powersignature_id = HW2_CreateEventPointerSobGroup('VaygrShipyard')",""},
		HW2_SubTitleEvent( Actor_FleetIntel, "$46106", 4 ),				-- Sensors are detecting a large power signature in this area.
		{"ping_shipyardLocation_id = HW2_PingCreateWithLabel( ping_shipyardLocation, 'VaygrShipyard' )",""},		-- Add ping to the shipyard location
		{"Ping_AddDescription(ping_shipyardLocation_id, 0, '$46425')",""},
	},
	{
                HW2_Wait ( 0.5 ),
	},
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46107", 3 ),				-- Send a Scout to investigate.
		{"obj_prim_findshipyard_id = Objective_Add(obj_prim_findshipyard, OT_Primary)",""},	-- Add primary objective: investigate power signature
		{ "Objective_AddDescription( obj_prim_findshipyard_id, '$46460')", "" },
	},
	{
		{"EventPointer_Remove(pointer_powersignature_id)",""},			-- remove pointer
                HW2_Wait ( 0.5 ),
	},
        {
		HW2_Letterbox( 0 ),
		{ "Universe_EnableSkip(0)", "" },							-- Disable Intel event skipping
		HW2_Pause ( 0 ),
                {"Sensors_Toggle( 0 )","" },
        },
        {
		{"Sound_ExitIntelEvent()",""},
                HW2_Wait ( 2 ),
        },
	{
		{"EventPlaying = 0",""},
	},
}




Events.speechevent_gateReadyForUse = 
{
        {
                HW2_Wait ( 0.5 ),
        },
        {
                HW2_Letterbox( 1 ),
                HW2_Wait ( 4 ),
        },
        {
                {"Camera_FocusSobGroup( Players_Dreadnaught, 1, 1200, 1 )", "" },	-- Focus on Dreadnaught
		HW2_SubTitleEvent( Actor_FleetCommand, "$46110", 7 ),					-- The Dreadnaught is communicating with the Gate. The initialization sequence has begun.
        },
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"FX_StartEvent( Players_Dreadnaught, 'Trigger' )",""},
        },
        {
                HW2_Wait ( 3 ),
        },
        {
		{ "Camera_Interpolate( 'here', 'camera3', 1)",""},				-- focus on Gate
                HW2_Wait ( 1 ),
        },
        {
--		{"FX_PlayEffect('sp_placeholder1', 'EffectPoint4', 1000 )",""},
		{"FX_StartEvent( 'Balcora_Gate', 'Gate_Trigger' )",""},
        },
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46115", 3 ),				-- The gate is open...
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
		HW2_SubTitleEvent( Actor_FleetCommand, "$46116", 3 ),				-- ...stand by...
	},
        {
                HW2_Wait ( 0.5 ),
        },
        {
		{"Universe_Fade( 1, 1.5 )",""},									-- fade to black
        },
        {
                HW2_Wait ( 1.5 ),
        },
        {
		{"Rule_Remove ('Rule_speechevent_lost3Generators')",""},	-- remove rule that checks if generators are destroyed
		{"SobGroup_Despawn( Players_Mothership )",""},			-- despawn player MS (so the NIS can make it go through the gate)
		{"SobGroup_Despawn( 'Balcora_Gate' )",""},				-- despawn Balcora Gate so the NIS can use its own Balcora Gate
		{"SobGroup_Despawn( 'Player_Ships1' )",""},				-- despawn all enemy ships
		{ "Player_InstantlyGatherAllResources( 0 )", "" },
		{"NISLoad( 'nis/NIS13B' )",""},									-- load the NIS
                HW2_Wait ( 1 ),
        },
        {
		{"Universe_Fade( 0, 1.5 )",""},									-- fade back in
		{"k_currentNISPlaying_id = NISPlay( 'nis/NIS13B' )",""},				-- play the NIS
		{"Rule_Add ('Rule_watchForNIS13BDone')",""},						-- start rule that watches for NIS to be over
--		{"Rule_AddInterval ('Rule_watchForNIS13BDoneFromTimer', 36)",""},		-- start rule that watches for NIS to be almost over
        },
}


Events.speechevent_missionComplete = 
{
	{
		{ "Subtitle_Message( '$3652', 2 )", "" },							-- RESOURCES COLLECTED
		HW2_Wait( 2 ),
	},
        {
                HW2_Wait ( 0.5 ),
        },
	{
                HW2_LocationCardEvent( "$46022", 2 ),								-- MISSION SUCCESSFUL
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
		HW2_LocationCardEvent( "$46023", 4 ),						-- MISSION FAILED
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}


-- this is an event to say the player has lost because the Dreadnaught has died
Events.speechevent_playerlosesDreadnaught =
{
	{
		HW2_SubTitleEvent( Actor_FleetIntel, "$46125", 5 ),				-- The Dreadnaught has been destroyed.
	},
        {
                HW2_Wait ( 1 ),
        },
	{
		HW2_Pause( 1 ),
		HW2_Letterbox( 1 ),
		HW2_Fade( 1 ),
		HW2_Wait(2),		
	},
	{
		HW2_LocationCardEvent( "$46023", 4 ),						-- MISSION FAILED
	},
	{
		{ "setMissionComplete( 0 )","" },
	},
}
