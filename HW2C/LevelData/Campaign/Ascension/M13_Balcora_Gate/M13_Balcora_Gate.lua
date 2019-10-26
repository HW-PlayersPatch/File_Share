-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
Chunk1DeadONCE = 0
Chunk2DeadONCE = 0
Chunk3DeadONCE = 0
StartGateFX = 0

function OnInit()
	Rule_Add("Rule_Init_1")
end

function OnStartOrLoad()
	print("OnStartOrLoad is working!!")
	print("Chunk1DeadONCE = "..Chunk1DeadONCE)
	print("Chunk2DeadONCE = "..Chunk2DeadONCE)
	print("Chunk3DeadONCE = "..Chunk3DeadONCE)
	if (StartGateFX == 1) then
	RingTrenchGlow = FX_StartEvent("Balcora_Gate", "Trench")
	if (Chunk1DeadONCE == 0) then
	print("Trying to play beam1")
	Chunk1Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint1", "EffectPoint1", 5)
	Chunk1Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint1", 1)
	Chunk1sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint1", 5)
	Chunk1BurnRing = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint1", 5)
	Chunk1RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint1", 5)
	end
	if (Chunk2DeadONCE == 0) then
	print("Trying to play beam2")
	Chunk2Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint2", "EffectPoint2", 5)
	Chunk2Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint2", 1)
	Chunk2sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint2", 5)
	Chunk2Ring = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint2", 5)
	Chunk2RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint2", 5)
	end
	if (Chunk3DeadONCE == 0) then
	print("Trying to play beam2")
	Chunk3Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint3", "EffectPoint3", 5)
	Chunk3Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint3", 1)
	Chunk3sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint3", 5)
	Chunk3Ring = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint3", 5)
	Chunk3RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint3", 5)
	end
	end
end

function Rule_Init_1()
	Rule_Add("Rule_DisableSpeech")
	Rule_AddInterval("Rule_StartGateFX", 29)
	print("trying to play beam effects now!")
	CPU_Enable(1, 0)
	SobGroup_Create("ResourceSphereShips")
	SobGroup_Create("PlayerCollectors")
	SobGroup_Create("tempSobGroup")
	NISOver = 0
	isOk = 0
	g_currentNISPlaying_id = NISGetPlayingHandle("nis/NIS13")
	NISDisableInterface(1)
	Rule_AddInterval("Rule_watchForNISDoneFromTimer", 52)
	Rule_Add("Rule_watchForNISDone")
	Rule_Remove("Rule_Init_1")
end

function Rule_DisableSpeech()
	Sound_EnableAllSpeech(0)
	Rule_Remove("Rule_DisableSpeech")
end

function Rule_StartGateFX()
	if (NISOver == 0) then
	StartGateFX = 1
	Chunk1Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint1", "EffectPoint1", 5)
	Chunk1Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint1", 1)
	Chunk1sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint1", 5)
	Chunk1BurnRing = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint1", 5)
	Chunk1RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint1", 5)
	Chunk2Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint2", "EffectPoint2", 5)
	Chunk2Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint2", 1)
	Chunk2sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint2", 5)
	Chunk2Ring = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint2", 5)
	Chunk2RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint2", 5)
	Chunk3Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint3", "EffectPoint3", 5)
	Chunk3Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint3", 1)
	Chunk3sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint3", 5)
	Chunk3Ring = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint3", 5)
	Chunk3RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint3", 5)
	Rule_Remove("Rule_StartGateFX")
	else
	Rule_Remove("Rule_StartGateFX")
	end
end

function Rule_watchForNISDoneFromTimer()
	if (NISOver == 0) then
	NISOver = 1
	SobGroup_LoadPersistantData("Hgn_Mothership")
	RingTrenchGlow = FX_StartEvent("Balcora_Gate", "Trench")
	Rule_Add("Rule_setAlliances")
	Rule_AddInterval("Rule_Init", 12)
	print("Adding rule INIT FROM DoneFromTimer NOW!!!!!!!!!!!!")
	Rule_AddInterval("Rule_NISHasFinished", 11)
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	elseif (NISOver == 1) then
	Rule_Remove("Rule_watchForNISDoneFromTimer")
	end
end

function Rule_watchForNISDone()
	if (NISOver == 0 and NISComplete(g_currentNISPlaying_id) == 1) then
	NISOver = 1
	Chunk1Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint1", "EffectPoint1", 5)
	Chunk1Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint1", 1)
	Chunk1sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint1", 5)
	Chunk1BurnRing = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint1", 5)
	Chunk1RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint1", 5)
	Chunk2Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint2", "EffectPoint2", 5)
	Chunk2Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint2", 1)
	Chunk2sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint2", 5)
	Chunk2Ring = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint2", 5)
	Chunk2RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint2", 5)
	Chunk3Beam = FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "ChunkPoint3", "EffectPoint3", 5)
	Chunk3Ring = FX_PlayEffect("pro_tech_gate_glow_channel", "EffectPoint3", 1)
	Chunk3sparks = FX_PlayEffect("pro_tech_flare_spray", "EffectPoint3", 5)
	Chunk3Ring = FX_PlayEffect("pro_tech_beam_channel_loop", "EffectPoint3", 5)
	Chunk3RingLoop = FX_PlayEffect("pro_tech_beam_burn_ring_loop", "ChunkPoint3", 5)
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Rule_Add("Rule_setAlliances")
	Rule_AddInterval("Rule_Init", 1)
	print("Adding rule INIT NOW!!!!!!!!!!!!")
	Rule_AddInterval("Rule_NISHasFinished", 3)
	Rule_Remove("Rule_watchForNISDone")
	elseif (NISOver == 1) then
	Rule_Remove("Rule_watchForNISDone")
	end
end

function Rule_setAlliances()
	if (NISComplete(g_currentNISPlaying_id) == 1) then
	SetAlliance(0, 2)
	SetAlliance(2, 0)
	SetAlliance(1, 3)
	SetAlliance(3, 1)
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	for i = 1, 3 do
	SobGroup_SobGroupAdd("ChunkAttackers"..i, "ChunkAttackersLarge"..i)
	SobGroup_SobGroupAdd("ChunkAttackers"..i, "ChunkAttackersSmall"..i)
	end
	FOW_RevealGroup("ChunkAttackers1", 1)
	FOW_RevealGroup("ChunkAttackers2", 1)
	FOW_RevealGroup("ChunkAttackers3", 1)
	Rule_Remove("Rule_setAlliances")
	end
end

function Rule_Init()
	print("Running INIT NOW!!!!!!!!!!")
	CPU_Enable(1, 1)
	Rule_Add("Rule_PlayStagingMusic")
	ShipToParadeRoundTypeName = "Hgn_MotherShip"
	Player_SetPlayerName(0, "$46010")
	Player_SetPlayerName(1, "$46011")
	Player_SetPlayerName(2, "$46012")
	Player_SetPlayerName(3, "$46011")
	CPU_Enable(0, 0)
	CPU_Enable(2, 0)
	CPU_Enable(3, 0)
	Sound_SpeechSubtitlePath("speech:missions/m_13/")
	obj_prim_stopvaygr = "$46000"
	obj_prim_stopvaygr_id = 0
	obj_prim_destroyshipyard = "$46001"
	obj_prim_destroyshipyard_id = 0
	obj_prim_findshipyard = "$46002"
	obj_prim_findshipyard_id = 0
	obj_prim_activategate = "$46003"
	obj_prim_activategate_id = 0
	obj_prim_protectdreadnaught = "$46004"
	obj_prim_protectdreadnaught_id = 0
	ping_gate_attackers1 = "$46400"
	ping_gate_attackers1_id = 0
	ping_gate_attackers2 = "$46401"
	ping_gate_attackers2_id = 0
	ping_gate_attackers3 = "$46402"
	ping_gate_attackers3_id = 0
	ping_shipyard = "$46403"
	ping_shipyard_id = 0
	ping_shipyardLocation = "$46404"
	ping_shipyardLocation_id = 0
	pingRemoveChunk1AttackersONCE = 0
	pingRemoveChunk2AttackersONCE = 0
	pingRemoveChunk3AttackersONCE = 0
	pointer_gate_attackers1_id = 0
	pointer_gate_attackers2_id = 0
	pointer_gate_attackers3_id = 0
	pointer_chunk1_id = 0
	pointer_chunk2_id = 0
	pointer_chunk3_id = 0
	pointer_vaygrshipyard_id = 0
	pointer_powersignature_id = 0
	g_now_time = Universe_GameTime()
	g_save_id = 0
	EventPlaying = 0
	NIS13BOver = 0
	g_attack_1 = 60
	g_attack_2 = 120
	g_attack_3 = 260
	g_attack_4 = 400
	g_attack_5 = 440
	g_attack_6 = 500
	g_attack_7 = 610
	g_attack_8 = 100
	startInitialAttack = 0
	chunksDestroyedOnce = {0, 0, 0}
	chunks_destroyed = 0
	chunks_saved = 0
	print("Print 7")
	SobGroup_Create("AttackingLarge1")
	SobGroup_Create("AttackingSmall1")
	SobGroup_Create("AttackingLarge2")
	SobGroup_Create("AttackingSmall2")
	SobGroup_Create("AttackingLarge3")
	SobGroup_Create("AttackingSmall3")
	SobGroup_Create("LargeTargets1")
	SobGroup_Create("LargeTargets2")
	SobGroup_Create("LargeTargets3")
	SobGroup_Create("SmallTargets1")
	SobGroup_Create("SmallTargets2")
	SobGroup_Create("SmallTargets3")
	print("Print 8")
	chunk1SavedONCE = 0
	chunk2SavedONCE = 0
	chunk3SavedONCE = 0
	shipyardDiscovered = 0
	print("Print 8")
	CPU_RemoveSobGroup(1, "InitialAttack_Bombers1")
	CPU_RemoveSobGroup(1, "InitialAttack_Interceptors1")
	CPU_RemoveSobGroup(1, "InitialAttack_HeavyMissileFrigates1")
	CPU_RemoveSobGroup(1, "InitialAttack_LaserCorvettes1")
	CPU_RemoveSobGroup(1, "InitialAttack_Battlecruiser")
	CPU_RemoveSobGroup(1, "InitialAttack_InfiltrationFrigates1")
	CPU_RemoveSobGroup(3, "ChunkAttackers1")
	CPU_RemoveSobGroup(3, "ChunkAttackersLarge1")
	CPU_RemoveSobGroup(3, "ChunkAttackersSmall1")
	CPU_RemoveSobGroup(3, "ChunkAttackers2")
	CPU_RemoveSobGroup(3, "ChunkAttackersLarge2")
	CPU_RemoveSobGroup(3, "ChunkAttackersSmall2")
	CPU_RemoveSobGroup(3, "ChunkAttackers3")
	CPU_RemoveSobGroup(3, "ChunkAttackersLarge3")
	CPU_RemoveSobGroup(3, "ChunkAttackersSmall3")
	SobGroup_CreateSubSystem("VaygrShipyard", "FighterProduction")
	SobGroup_CreateSubSystem("VaygrShipyard", "CorvetteProduction")
	SobGroup_CreateSubSystem("VaygrShipyard", "FrigateProduction")
	SobGroup_CreateSubSystem("VaygrShipyard", "CapShipProduction")
	SobGroup_CreateSubSystem("VaygrShipyard", "PlatformProduction")
	SobGroup_CreateSubSystem("VaygrShipyard", "Research")
	SobGroup_CreateSubSystem("VaygrShipyard", "Hyperspace")
	SobGroup_CreateSubSystem("VaygrShipyard", "AdvancedArray")
	HW2_SetResearchLevel(13)
	SobGroup_AbilityActivate("VaygrShipyard", AB_Move, 0)
	SobGroup_AbilityActivate("VaygrShipyard", AB_Hyperspace, 0)
	Player_GrantAllResearch(1)
--	Player_GrantResearchOption(1, "SuperCapHealthUpgradeSPGAME")
	Player_GrantResearchOption(3, "VaygrFrigateHealthUpgradeSPGAME")
	Player_GrantResearchOption(3, "VaygrFrigateHealthRegenDowngradeSPGAME")
	Player_GrantResearchOption(3, "ExtraStrongVgrHeavyMissilesSPGAME")
	Player_GrantResearchOption(3, "CorvetteHealthUpgradeSPGAME")
	g_now_time = Universe_GameTime()
	Rule_Add("Rule_initialAttackSetup")
	Rule_Add("Rule_initialAttackBombersFullSpeed")
	Rule_Add("Rule_gateAttackSetup")
	Rule_AddInterval("Rule_chunkAttackerRetaliate", 10)
	Rule_AddInterval("Rule_chunkAttackerRetaliateWATCH", 3)
	Rule_Add("Rule_shipyardSetup")
	Rule_Add("Rule_watchResourcePocket")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	Player_FillShipsByType(Players_Mothership, 0, "Hgn_MotherShip")
	Players_Carrier = "Players_Carrier"
	SobGroup_Create(Players_Carrier)
	Player_FillShipsByType(Players_Carrier, 0, "Hgn_Carrier")
	Players_Battlecruiser = "Players_Battlecruiser"
	SobGroup_Create(Players_Battlecruiser)
	Player_FillShipsByType(Players_Battlecruiser, 0, "Hgn_Battlecruiser")
	Players_Dreadnaught = "Players_Dreadnaught"
	SobGroup_Create(Players_Dreadnaught)
	Player_FillShipsByType(Players_Dreadnaught, 0, "Hgn_Dreadnaught")
	Players_Shipyard = "Players_Shipyard"
	SobGroup_Create(Players_Shipyard)
	Player_FillShipsByType(Players_Shipyard, 0, "Hgn_Shipyard")
	SobGroup_SetDisplayedRestrictedHardpoint(Players_Mothership, 0)
	Rule_Add("Rule_chunkDestroyedWatch")
	Rule_Add("Rule_chunkSavedWatch")
	Rule_Add("Rule_speechevent_generatorLowHealthNoGeneratorsSaved")
	Rule_Add("Rule_speechevent_dreadnaughtDamaged")
	Rule_Add("Rule_speechevent_lost1GeneratorNoneSaved")
	Rule_Add("Rule_speechevent_saved1Generator")
	Rule_Add("Rule_speechevent_lost1GeneratorSavedOne")
	Rule_Add("Rule_speechevent_lost2GeneratorsNoneSaved")
	Rule_Add("Rule_speechevent_saved2Generators")
	Rule_Add("Rule_speechevent_lost2GeneratorsSavedOne")
	Rule_Add("Rule_speechevent_lost3Generators")
	Rule_Add("Rule_speechevent_saved3Generators")
	Rule_Add("Rule_destroyGateAttackersOBJECTIVE")
	Rule_Add("Rule_pingRemoveWhenChunksDestroyed")
	Rule_Add("Rule_seenShipyardWatch")
	Rule_Add("Rule_speechevent_shipyardDestroyed")
	Rule_Add("Rule_speechevent_sendScoutToInvestigate")
	Rule_Add("Rule_intelevent_mothershipDestroyed")
	Rule_Add("Rule_intelevent_dreadnaughtDestroyed")
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	HW2_ReactiveInfo()
	Rule_Remove("Rule_Init")
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_testVolumes()
	if (SobGroup_IsShipNearPoint("ChunkAttackersLarge3", "ChunkPoint3", 2500) == 1) then
	print("IsShipNearPoint check is working!!!!!!!!!!!!!!")
	end
end

function Rule_testGetAttackers()
	if (SobGroup_UnderAttack("InitialAttack_Battlecruiser") == 1) then
	print("Battlecruiser is under attack!!")
	SobGroup_GetAttackers("InitialAttack_Battlecruiser", "AttackingBattlecruiser")
	if (SobGroup_Empty("AttackingBattlecruiser") ~= 1) then
	print("Attacker group has ships in it!!")
	end
	end
end

function Rule_NISHasFinished()
	Event_Start("intelevent_stopthem")
	Rule_Remove("Rule_NISHasFinished")
end

function Rule_speechevent_dreadnaughtDamaged()
	if (EventPlaying == 0 and SobGroup_HealthPercentage(Players_Dreadnaught) < 0.25) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_dreadnaughtDamaged")
	Rule_Remove("Rule_speechevent_dreadnaughtDamaged")
	end
end

function Rule_chunkDestroyedWatch()
	for i = 1, 3 do
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator"..i) == 0 and chunksDestroyedOnce[i] == 0) then
	chunks_destroyed = (chunks_destroyed + 1)
	print("chunks destroyed = "..chunks_destroyed)
	chunksDestroyedOnce[i] = 1
	end
	end
end

function Rule_pingRemoveWhenChunksDestroyed()
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") == 0) then
	if (SobGroup_Empty("ChunkAttackers1") ~= 1) then
	if (pingRemoveChunk1AttackersONCE == 0) then
	Ping_Remove(ping_gate_attackers1_id)
	pingRemoveChunk1AttackersONCE = 1
	end
	end
	end
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") == 0) then
	if (SobGroup_Empty("ChunkAttackers2") ~= 1) then
	if (pingRemoveChunk2AttackersONCE == 0) then
	Ping_Remove(ping_gate_attackers2_id)
	pingRemoveChunk2AttackersONCE = 1
	end
	end
	end
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") == 0) then
	if (SobGroup_Empty("ChunkAttackers3") ~= 1) then
	if (pingRemoveChunk3AttackersONCE == 0) then
	Ping_Remove(ping_gate_attackers3_id)
	pingRemoveChunk3AttackersONCE = 1
	end
	end
	end
end

function Rule_chunkSavedWatch()
	if (SobGroup_Empty("ChunkAttackers1") == 1) then
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") > 0) then
	if (chunk1SavedONCE == 0) then
	chunks_saved = (chunks_saved + 1)
	print("chunks SAVED = "..chunks_saved)
	chunk1SavedONCE = 1
	end
	end
	end
	if (SobGroup_Empty("ChunkAttackers2") == 1) then
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") > 0) then
	if (chunk2SavedONCE == 0) then
	chunks_saved = (chunks_saved + 1)
	print("chunks SAVED = "..chunks_saved)
	chunk2SavedONCE = 1
	end
	end
	end
	if (SobGroup_Empty("ChunkAttackers3") == 1) then
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") > 0) then
	if (chunk3SavedONCE == 0) then
	chunks_saved = (chunks_saved + 1)
	print("chunks SAVED = "..chunks_saved)
	chunk3SavedONCE = 1
	end
	end
	end
end

function Rule_speechevent_generatorLowHealthNoGeneratorsSaved()
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") >= 0.5) then
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") >= 0.5) then
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") < 0.5) then
	end
	end
	if (EventPlaying == 0) then
	if (chunks_saved == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_generatorLowHealthNoGeneratorsSaved")
	Rule_Remove("Rule_speechevent_generatorLowHealthNoGeneratorsSaved")
	end
	end
	end
end

function Rule_speechevent_lost1GeneratorNoneSaved()
	if (EventPlaying == 0 and chunks_destroyed == 1 and chunks_saved == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_lost1GeneratorNoneSaved")
	Rule_Remove("Rule_speechevent_lost1GeneratorNoneSaved")
	end
end

function Rule_speechevent_saved1Generator()
	if (EventPlaying == 0 and chunks_saved == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_saved1Generator")
	Rule_Remove("Rule_speechevent_saved1Generator")
	end
end

function Rule_speechevent_lost1GeneratorSavedOne()
	if (EventPlaying == 0 and SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") == 0) then
	if (SobGroup_Empty("ChunkAttackers1") ~= 1) then
	if (chunks_saved == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_lost1GeneratorSavedOne")
	Rule_Remove("Rule_speechevent_lost1GeneratorSavedOne")
	end
	end
	end
	if (EventPlaying == 0 and SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") == 0) then
	if (SobGroup_Empty("ChunkAttackers2") ~= 1) then
	if (chunks_saved == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_lost1GeneratorSavedOne")
	Rule_Remove("Rule_speechevent_lost1GeneratorSavedOne")
	end
	end
	end
	if (EventPlaying == 0 and SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") == 0) then
	if (SobGroup_Empty("ChunkAttackers3") ~= 1) then
	if (chunks_saved == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_lost1GeneratorSavedOne")
	Rule_Remove("Rule_speechevent_lost1GeneratorSavedOne")
	end
	end
	end
end

function Rule_speechevent_lost2GeneratorsNoneSaved()
	if (EventPlaying == 0 and chunks_destroyed == 2 and chunks_saved == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_lost2GeneratorsNoneSaved")
	Rule_Remove("Rule_speechevent_lost2GeneratorsNoneSaved")
	end
end

function Rule_speechevent_saved2Generators()
	if (EventPlaying == 0 and chunks_saved == 2) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_saved2Generators")
	Rule_Remove("Rule_speechevent_saved2Generators")
	end
end

function Rule_speechevent_lost2GeneratorsSavedOne()
	if (EventPlaying == 0 and chunks_destroyed == 2 and chunks_saved == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_lost2GeneratorsSavedOne")
	Rule_Remove("Rule_speechevent_lost2GeneratorsSavedOne")
	end
end

function Rule_speechevent_lost3Generators()
	if (EventPlaying == 0 and chunks_destroyed == 3) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_lost3Generators")
	Rule_Remove("Rule_speechevent_lost3Generators")
	end
end

function Rule_speechevent_saved3Generators()
	if (EventPlaying == 0 and chunks_saved == 3) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_saved3Generators")
	Rule_Remove("Rule_speechevent_saved3Generators")
	end
end

function Rule_destroyGateAttackersOBJECTIVE()
	if (chunks_saved == 3) then
	Objective_SetState(obj_prim_stopvaygr_id, OS_Complete)
	Rule_Remove("Rule_destroyGateAttackersOBJECTIVE")
	end
	if (chunks_saved == 2 and chunks_destroyed == 1) then
	Objective_SetState(obj_prim_stopvaygr_id, OS_Complete)
	Rule_Remove("Rule_destroyGateAttackersOBJECTIVE")
	end
	if (chunks_saved == 1 and chunks_destroyed == 2) then
	Objective_SetState(obj_prim_stopvaygr_id, OS_Complete)
	Rule_Remove("Rule_destroyGateAttackersOBJECTIVE")
	end
end

function Rule_seenShipyardWatch()
	if (SobGroup_PlayerIsInSensorRange("VaygrShipyard", 0) == 1) then
	if (EventPlaying == 0) then
	shipyardDiscovered = 1
	if (obj_prim_findshipyard_id ~= 0) then
	Objective_SetState(obj_prim_findshipyard_id, OS_Complete)
	end
	if (ping_shipyardLocation_id ~= 0) then
	Ping_Remove(ping_shipyardLocation_id)
	end
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("intelevent_shipyardDetected")
	Rule_Remove("Rule_seenShipyardWatch")
	end
	end
end

function Rule_speechevent_shipyardDestroyed()
	if (EventPlaying == 0 and SobGroup_Empty("VaygrShipyard") == 1) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_shipyardDestroyed")
	Rule_Remove("Rule_speechevent_shipyardDestroyed")
	end
end

function Rule_speechevent_sendScoutToInvestigate()
	if (chunks_saved == 1 or chunks_destroyed == 1 and shipyardDiscovered == 0) then
	Rule_AddInterval("Rule_speechevent_sendScoutToInvestigateSTART", 50)
	Rule_Remove("Rule_speechevent_sendScoutToInvestigate")
	end
end

function Rule_speechevent_sendScoutToInvestigateSTART()
	if (chunks_saved == 1 or chunks_destroyed == 1) then
	if (EventPlaying == 0) then
	if (shipyardDiscovered == 0) then
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Event_Start("speechevent_sendScoutToInvestigate")
	Rule_Remove("Rule_speechevent_sendScoutToInvestigateSTART")
	end
	end
	end
end

function Rule_speechevent_gateReadyForUse()
	if (Objective_GetState(obj_prim_stopvaygr_id) == OS_Complete and Objective_GetState(obj_prim_destroyshipyard_id) == OS_Complete) then
	if (EventPlaying == 0) then
	if (Sensors_ManagerIsUp() == 1) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Rule_Add("Rule_PlayAmbientMusic")
	Event_Start("speechevent_gateReadyForUse")
	SobGroup_MoveToSobGroup(Players_Dreadnaught, "Balcora_Gate")
	Rule_AddInterval("Rule_stopDreadnaught", 5)
	Rule_Remove("Rule_speechevent_gateReadyForUse")
	else
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_EnterIntelEvent()
	Rule_Add("Rule_PlayAmbientMusic")
	Event_Start("speechevent_gateReadyForUse")
	SobGroup_MoveToSobGroup(Players_Dreadnaught, "Balcora_Gate")
	Rule_AddInterval("Rule_stopDreadnaught", 5)
	Rule_Remove("Rule_speechevent_gateReadyForUse")
	end
	end
	end
end

function Rule_watchForNIS13BDone()
	if (NIS13BOver == 0 and NISComplete(k_currentNISPlaying_id) == 1) then
	NIS13BOver = 1
	Event_Start("speechevent_missionComplete")
	Rule_Remove("Rule_watchForNIS13BDone")
	elseif (NIS13BOver == 1) then
	NIS13BOver = 1
	Rule_Remove("Rule_watchForNIS13BDone")
	end
end

function Rule_watchForNIS13BDoneFromTimer()
	if (NIS13BOver == 0) then
	NIS13BOver = 1
	setMissionComplete(1)
	Rule_Remove("Rule_watchForNIS13BDoneFromTimer")
	elseif (NIS13BOver == 1) then
	NIS13BOver = 1
	Rule_Remove("Rule_watchForNIS13BDoneFromTimer")
	end
end

function Rule_stopDreadnaught()
	SobGroup_Stop(0, Players_Dreadnaught)
	Rule_Remove("Rule_stopDreadnaught")
end

function Rule_intelevent_mothershipDestroyed()
	if (SobGroup_Empty(Players_Mothership) == 1) then
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_intelevent_mothershipDestroyed")
	end
end

function Rule_intelevent_dreadnaughtDestroyed()
	if (SobGroup_Empty(Players_Dreadnaught) == 1) then
	Event_Start("speechevent_playerlosesDreadnaught")
	Rule_Remove("Rule_intelevent_dreadnaughtDestroyed")
	end
end

function Rule_Attack_1()
	if (Universe_GameTime() >= g_attack_1) then
	SobGroup_Attack(1, "Vgr_AttackGroup_1_A", "Players_Ships")
	Rule_Remove("Rule_Attack_1")
	end
end

function Rule_Attack_2()
	if (Universe_GameTime() >= g_attack_2) then
	SobGroup_Attack(1, "Vgr_AttackGroup_1_B", "Players_Ships")
	Rule_Remove("Rule_Attack_2")
	end
end

function Rule_Attack_3()
	if (Universe_GameTime() >= g_attack_3) then
	SobGroup_Attack(1, "Vgr_AttackGroup_1_C", "Players_Ships")
	Rule_Remove("Rule_Attack_3")
	end
end

function Rule_Attack_4()
	if (Universe_GameTime() >= g_attack_4) then
	SobGroup_Attack(1, "Vgr_AttackGroup_1", "Players_Ships")
	Rule_Remove("Rule_Attack_4")
	end
end

function Rule_Attack_5()
	if (Universe_GameTime() >= g_attack_5) then
	SobGroup_Attack(1, "Vgr_AttackGroup_2_A", "Players_Ships")
	Rule_Remove("Rule_Attack_5")
	end
end

function Rule_Attack_6()
	if (Universe_GameTime() >= g_attack_6) then
	SobGroup_Attack(1, "Vgr_AttackGroup_2_B", "Players_Ships")
	Rule_Remove("Rule_Attack_6")
	end
end

function Rule_Attack_7()
	if (Universe_GameTime() >= g_attack_7) then
	SobGroup_Attack(1, "Vgr_AttackGroup_2_C", "Players_Ships")
	Rule_Remove("Rule_Attack_7")
	end
end

function Rule_Attack_8()
	if (Universe_GameTime() >= g_attack_8) then
	SobGroup_Attack(1, "Vgr_AttackGroup_2", "Players_Ships")
	Rule_Remove("Rule_Attack_8")
	end
end

function Rule_initialAttackSetup()
	if (Universe_GameTime() >= (g_now_time + 30)) then
	if (HW2_IsRunTimeSobGroupEmpty(Players_Battlecruiser) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_Battlecruiser", Players_Battlecruiser)
	elseif (HW2_IsRunTimeSobGroupEmpty(Players_Carrier) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_Battlecruiser", Players_Carrier)
	else
	SobGroup_Attack(1, "InitialAttack_Battlecruiser", Players_Mothership)
	end
	if (HW2_IsRunTimeSobGroupEmpty(Players_Carrier) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_Bombers1", Players_Carrier)
	elseif (HW2_IsRunTimeSobGroupEmpty(Players_Battlecruiser) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_Bombers1", Players_Battlecruiser)
	else
	SobGroup_Attack(1, "InitialAttack_Bombers1", Players_Mothership)
	end
	SobGroup_SetSpeed("InitialAttack_Bombers1", 0.28)
	if (HW2_IsRunTimeSobGroupEmpty(Players_Carrier) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_HeavyMissileFrigates1", Players_Carrier)
	elseif (HW2_IsRunTimeSobGroupEmpty(Players_Battlecruiser) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_HeavyMissileFrigates1", Players_Battlecruiser)
	else
	SobGroup_Attack(1, "InitialAttack_HeavyMissileFrigates1", Players_Mothership)
	end
	if (SobGroup_Empty("InitialAttack_Battlecruiser") ~= 1) then
	SobGroup_GuardSobGroup("InitialAttack_LaserCorvettes1", "InitialAttack_Battlecruiser")
	elseif (HW2_IsRunTimeSobGroupEmpty(Players_Carrier) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_LaserCorvettes1", Players_Carrier)
	elseif (HW2_IsRunTimeSobGroupEmpty(Players_Battlecruiser) ~= 1) then
	SobGroup_Attack(1, "InitialAttack_LaserCorvettes1", Players_Battlecruiser)
	else
	SobGroup_Attack(1, "InitialAttack_LaserCorvettes1", Players_Mothership)
	end
	if (HW2_IsRunTimeSobGroupEmpty(Players_Shipyard) ~= 1) then
	SobGroup_CaptureSobGroup("InitialAttack_InfiltrationFrigates1", Players_Shipyard)
	elseif (HW2_IsRunTimeSobGroupEmpty(Players_Carrier) ~= 1) then
	SobGroup_CaptureSobGroup("InitialAttack_InfiltrationFrigates1", Players_Carrier)
	else
	SobGroup_CaptureSobGroup("InitialAttack_InfiltrationFrigates1", Players_Mothership)
	end
	SobGroup_GuardSobGroup("InitialAttack_Interceptors1", "InitialAttack_Bombers1")
	Rule_Add("Rule_watchForInitialAttackToDie")
	Rule_Remove("Rule_initialAttackSetup")
	end
end

function Rule_watchForInitialAttackToDie()
	if (SobGroup_Empty("InitialAttack_Battlecruiser") == 1) then
	if (SobGroup_Empty("InitialAttack_Bombers1") == 1) then
	if (SobGroup_Empty("InitialAttack_HeavyMissileFrigates1") == 1) then
	if (SobGroup_Empty("InitialAttack_LaserCorvettes1") == 1) then
	if (SobGroup_Empty("InitialAttack_LaserCorvettes1") == 1) then
	Rule_Remove("Rule_watchForInitialAttackToDie")
	end
	end
	end
	end
	end
end

function Rule_initialAttackBombersFullSpeed()
	if (Universe_GameTime() >= (g_now_time + 65)) then
	SobGroup_SetSpeed("InitialAttack_Bombers1", 1)
	Rule_Remove("Rule_initialAttackBombersFullSpeed")
	end
end

function Rule_gateAttackSetup()
	SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge1", "Balcora_Gate", "Generator1")
	SobGroup_GuardSobGroup("ChunkAttackersSmall1", "ChunkAttackersLarge1")
	SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge2", "Balcora_Gate", "Generator2")
	SobGroup_GuardSobGroup("ChunkAttackersSmall2", "ChunkAttackersLarge2")
	SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge3", "Balcora_Gate", "Generator3")
	SobGroup_GuardSobGroup("ChunkAttackersSmall3", "ChunkAttackersLarge3")
	Rule_Add("Rule_chunkAttackerWatch")
	Rule_Remove("Rule_gateAttackSetup")
end

function Rule_chunkAttackerWatch()
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator1") == 0 and Chunk1DeadONCE == 0) then
	if (SobGroup_Empty("VaygrShipyard") ~= 1) then
	SobGroup_GuardSobGroup("ChunkAttackers1", "VaygrShipyard")
	CPU_AddSobGroup(3, "ChunkAttackers1")
	Chunk1DeadONCE = 1
	FX_StopEffect(Chunk1Beam)
	FX_StopEffect(Chunk1Ring)
	FX_StopEffect(Chunk1RingLoop)
	else
	SobGroup_Attack(3, "ChunkAttackers1", Players_Mothership)
	Chunk1DeadONCE = 1
	FX_StopEffect(Chunk1Beam)
	FX_StopEffect(Chunk1Ring)
	FX_StopEffect(Chunk1RingLoop)
	end
	end
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator2") == 0 and Chunk2DeadONCE == 0) then
	if (SobGroup_Empty("VaygrShipyard") ~= 1) then
	SobGroup_GuardSobGroup("ChunkAttackers2", "VaygrShipyard")
	CPU_AddSobGroup(3, "ChunkAttackers2")
	Chunk2DeadONCE = 1
	FX_StopEffect(Chunk2Beam)
	FX_StopEffect(Chunk2Ring)
	FX_StopEffect(Chunk2RingLoop)
	else
	SobGroup_Attack(3, "ChunkAttackers2", Players_Mothership)
	Chunk2DeadONCE = 1
	FX_StopEffect(Chunk2Beam)
	FX_StopEffect(Chunk2Ring)
	FX_StopEffect(Chunk2RingLoop)
	end
	end
	if (SobGroup_GetHardPointHealth("Balcora_Gate", "Generator3") == 0 and Chunk3DeadONCE == 0) then
	if (SobGroup_Empty("VaygrShipyard") ~= 1) then
	SobGroup_GuardSobGroup("ChunkAttackers3", "VaygrShipyard")
	CPU_AddSobGroup(3, "ChunkAttackers3")
	Chunk3DeadONCE = 1
	FX_StopEffect(Chunk3Beam)
	FX_StopEffect(Chunk3Ring)
	FX_StopEffect(Chunk3RingLoop)
	else
	SobGroup_Attack(3, "ChunkAttackers3", Players_Mothership)
	Chunk3DeadONCE = 1
	FX_StopEffect(Chunk3Beam)
	FX_StopEffect(Chunk3Ring)
	FX_StopEffect(Chunk3RingLoop)
	end
	end
end

EnemiesAttackingLarge = {0, 0, 0}
EnemiesAttackingSmall = {0, 0, 0}

function Rule_chunkAttackerRetaliate()
	for i = 1, 3 do
	if (SobGroup_UnderAttack("ChunkAttackersLarge"..i) == 1) then
	if (EnemiesAttackingLarge[i] == 0) then
	print("This large group under attack: "..i)
	SobGroup_GetAttackers("ChunkAttackersLarge"..i, "AttackingLarge"..i)
	if (SobGroup_Empty("AttackingLarge"..i) ~= 1) then
	print("This large group has ships in its AttackingLarge group: "..i)
	end
	print("This large group is doing target filtering: "..i)
	SobGroup_FillShipsByType("tempSobGroup", "AttackingLarge"..i, "Hgn_AssaultFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("This large group found some Assault Frigates: "..i)
	SobGroup_SobGroupAdd("LargeTargets"..i, "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingLarge"..i, "Hgn_TorpedoFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("This large group found some Torpedo Frigates: "..i)
	SobGroup_SobGroupAdd("LargeTargets"..i, "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingLarge"..i, "Hgn_MarineFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("This large group found some Marine Frigates: "..i)
	SobGroup_SobGroupAdd("LargeTargets"..i, "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingLarge"..i, "Hgn_IonCannonFrigate")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("This large group found some Ion Cannon Frigates: "..i)
	SobGroup_SobGroupAdd("LargeTargets"..i, "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingLarge"..i, "Hgn_Destroyer")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("This large group found some Destroyers: "..i)
	SobGroup_SobGroupAdd("LargeTargets"..i, "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingLarge"..i, "Hgn_BattleCruiser")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("This large group found some Battlecruisers: "..i)
	SobGroup_SobGroupAdd("LargeTargets"..i, "tempSobGroup")
	end
	SobGroup_FillShipsByType("tempSobGroup", "AttackingLarge"..i, "Hgn_IonTurret")
	if (SobGroup_Empty("tempSobGroup") == 0) then
	print("This large group found some Platforms: "..i)
	SobGroup_SobGroupAdd("LargeTargets"..i, "tempSobGroup")
	end
	if (SobGroup_Empty("LargeTargets"..i) ~= 1) then
	print("Telling this large group to attack: "..i)
	EnemiesAttackingLarge[i] = 1
	SobGroup_Attack(3, "ChunkAttackersLarge"..i, "LargeTargets"..i)
	end
	end
	end
	end
end

function Rule_chunkAttackerRetaliateWATCH()
	for i = 1, 3 do
	if (EnemiesAttackingLarge[i] == 1) then
	if (SobGroup_Empty("LargeTargets"..i) ~= 1) then
	if (SobGroup_IsShipNearPoint("ChunkAttackersLarge"..i, "ChunkPoint"..i, 2500) ~= 1) then
	end
	print("This large group is too far from gate or has killed their attackers, telling them to attack Balcora Gate: "..i)
	SobGroup_AttackSobGroupHardPoint("ChunkAttackersLarge"..i, "Balcora_Gate", "Generator"..i)
	EnemiesAttackingLarge[i] = 0
	end
	end
	end
end

function Rule_shipyardSetup()
	SobGroup_GuardSobGroup("ShipyardGuard", "VaygrShipyard")
	Rule_Remove("Rule_shipyardSetup")
end

function Rule_watchResourcePocket()
	Player_FillSobGroupInVolume("ResourceSphereShips", 0, "ResourceCollectorSphere")
	SobGroup_FillShipsByType("PlayerCollectors", "ResourceSphereShips", "Hgn_ResourceCollector")
	if (SobGroup_Empty("PlayerCollectors") ~= 1) then
	Rule_Add("Rule_attackPlayerCollectors")
	Rule_Remove("Rule_watchResourcePocket")
	end
end

function Rule_attackPlayerCollectors()
	if (SobGroup_Empty("VaygrShipyard") ~= 1) then
	CollectorBombers1 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Bomber")
	CollectorInterceptors1 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Interceptor")
	CollectorBombers2 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Bomber")
	CollectorInterceptors2 = SobGroup_CreateShip("VaygrShipyard", "Vgr_Interceptor")
	Rule_AddInterval("Rule_collectorAttackSetup", 8)
	Rule_Remove("Rule_attackPlayerCollectors")
	end
end

function Rule_collectorAttackSetup()
	if (SobGroup_Empty("VaygrShipyard") ~= 1) then
	SobGroup_GuardSobGroup(CollectorInterceptors1, CollectorBombers1)
	SobGroup_GuardSobGroup(CollectorInterceptors2, CollectorBombers2)
	SobGroup_Attack(0, CollectorBombers1, PlayerCollectors)
	SobGroup_Attack(0, CollectorBombers2, PlayerCollectors)
	Rule_AddInterval("Rule_watchResourcePocket", 200)
	Rule_Remove("Rule_collectorAttackSetup")
	end
end

function Rule_PlayAmbientMusic()
	print("trying to play ambient music!")
	Sound_MusicPlayType("data:sound/music/ambient/amb_13", MUS_Ambient)
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
Events["intelevent_stopthem"] = {{{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6451')", ""},}, {HW2_Wait(2)}, {HW2_LocationCardEvent("$46020", 6)}, {HW2_Wait(1.5)}, {{"Sound_EnableAllSpeech(1)", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$46029", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46025", 4)}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1)}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Camera_FocusSave()", ""}, {"Sensors_Toggle(1)", ""},}, {{"Camera_Interpolate('here', 'camera2', 1.5)", ""}, HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46030", 8), {"pointer_chunk1_id = HW2_CreateEventPointerVolume('ChunkPoint1')", ""}, {"pointer_chunk2_id = HW2_CreateEventPointerVolume('ChunkPoint2')", ""}, {"pointer_chunk3_id = HW2_CreateEventPointerVolume('ChunkPoint3')", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46031", 6), {"ping_gate_attackers1_id = HW2_PingCreateWithLabel(ping_gate_attackers1, 'ChunkAttackers1')", ""}, {"Ping_AddDescription(ping_gate_attackers1_id, 0, '$46420')", ""}, {"ping_gate_attackers2_id = HW2_PingCreateWithLabel(ping_gate_attackers2, 'ChunkAttackers2')", ""}, {"Ping_AddDescription(ping_gate_attackers2_id, 0, '$46420')", ""}, {"ping_gate_attackers3_id = HW2_PingCreateWithLabel(ping_gate_attackers3, 'ChunkAttackers3')", ""}, {"Ping_AddDescription(ping_gate_attackers3_id, 0, '$46420')", ""}, {"obj_prim_stopvaygr_id = Objective_Add(obj_prim_stopvaygr, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_stopvaygr_id, '$46450')", ""},}, {HW2_Wait(3)}, {{"EventPointer_Remove(pointer_chunk1_id)", ""}, {"EventPointer_Remove(pointer_chunk2_id)", ""}, {"EventPointer_Remove(pointer_chunk3_id)", ""}, HW2_Letterbox(0), {"Sensors_Toggle(0)", ""}, {"Camera_FocusRestore()", ""}, {"Universe_EnableSkip(0)", ""}, HW2_Pause(0)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_generatorLowHealthNoGeneratorsSaved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46038", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46037", 12)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_lost1GeneratorNoneSaved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46040", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46041", 6)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46042", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_saved1Generator"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46045", 2)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46046", 2)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_lost1GeneratorSavedOne"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46050", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_lost2GeneratorsNoneSaved"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46055", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46056", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_saved2Generators"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46060", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46061", 3)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_lost2GeneratorsSavedOne"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46065", 4)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_lost3Generators"] = {{HW2_SubTitleEvent(Actor_FleetCommand, "$46070", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46071", 5)}, {HW2_Wait(3)}, {{"Event_Start('speechevent_playerloses')", ""},},}
Events["speechevent_saved3Generators"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46051", 4)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6452')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["intelevent_shipyardDetected"] = {{HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {{"pointer_vaygrshipyard_id = HW2_CreateEventPointerSobGroup('VaygrShipyard')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$46100", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46101", 7), {"ping_shipyard_id = HW2_PingCreateWithLabel(ping_shipyard, 'VaygrShipyard')", ""}, {"Ping_AddDescription(ping_shipyard_id, 0, '$46425')", ""}, {"obj_prim_destroyshipyard_id = Objective_Add(obj_prim_destroyshipyard, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_destroyshipyard_id, '$46455')", ""}, {"Rule_Add('Rule_speechevent_gateReadyForUse')", ""},}, {{"EventPointer_Remove(pointer_vaygrshipyard_id)", ""}, HW2_Wait(0.5)}, {HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, HW2_Pause(0), {"Sensors_Toggle(0)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6453')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_shipyardDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46105", 5), {"Objective_SetState(obj_prim_destroyshipyard_id, OS_Complete)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1)}, {{"g_save_id = g_save_id + 1", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6454')", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_dreadnaughtDamaged"] = {{HW2_SubTitleEvent(Actor_FleetCommand, "$46120", 7)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46121", 5), {"obj_prim_protectdreadnaught_id = Objective_Add(obj_prim_protectdreadnaught, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_protectdreadnaught_id, '$46467')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46122", 5)}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_sendScoutToInvestigate"] = {{HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""},}, {HW2_Wait(0.5)}, {HW2_Pause(1)}, {HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""},}, {HW2_Wait(0.5)}, {{"pointer_powersignature_id = HW2_CreateEventPointerSobGroup('VaygrShipyard')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$46106", 4), {"ping_shipyardLocation_id = HW2_PingCreateWithLabel(ping_shipyardLocation, 'VaygrShipyard')", ""}, {"Ping_AddDescription(ping_shipyardLocation_id, 0, '$46425')", ""},}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$46107", 3), {"obj_prim_findshipyard_id = Objective_Add(obj_prim_findshipyard, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_findshipyard_id, '$46460')", ""},}, {{"EventPointer_Remove(pointer_powersignature_id)", ""}, HW2_Wait(0.5)}, {HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, HW2_Pause(0), {"Sensors_Toggle(0)", ""},}, {{"Sound_ExitIntelEvent()", ""}, HW2_Wait(2)}, {{"EventPlaying = 0", ""},},}
Events["speechevent_gateReadyForUse"] = {{HW2_Wait(0.5)}, {HW2_Letterbox(1), HW2_Wait(4)}, {{"Camera_FocusSobGroup(Players_Dreadnaught, 1, 1200, 1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$46110", 7)}, {HW2_Wait(0.5)}, {{"FX_StartEvent(Players_Dreadnaught, 'Trigger')", ""},}, {HW2_Wait(3)}, {{"Camera_Interpolate('here', 'camera3', 1)", ""}, HW2_Wait(1)}, {{"FX_StartEvent('Balcora_Gate', 'Gate_Trigger')", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46115", 3)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$46116", 3)}, {HW2_Wait(0.5)}, {{"Universe_Fade(1, 1.5)", ""},}, {HW2_Wait(1.5)}, {{"Rule_Remove ('Rule_speechevent_lost3Generators')", ""}, {"SobGroup_Despawn(Players_Mothership)", ""}, {"SobGroup_Despawn('Balcora_Gate')", ""}, {"SobGroup_Despawn('Player_Ships1')", ""}, {"Player_InstantlyGatherAllResources(0)", ""}, {"NISLoad('nis/NIS13B')", ""}, HW2_Wait(1)}, {{"Universe_Fade(0, 1.5)", ""}, {"k_currentNISPlaying_id = NISPlay('nis/NIS13B')", ""}, {"Rule_Add ('Rule_watchForNIS13BDone')", ""},},}
Events["speechevent_missionComplete"] = {{{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {HW2_Wait(0.5)}, {HW2_LocationCardEvent("$46022", 2)}, {HW2_Wait(0.5)}, {{"setMissionComplete(1)", ""},},}
Events["speechevent_playerloses"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$46023", 4)}, {{"setMissionComplete(0)", ""},},}
Events["speechevent_playerlosesDreadnaught"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$46125", 5)}, {HW2_Wait(1)}, {HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$46023", 4)}, {{"setMissionComplete(0)", ""},},}
