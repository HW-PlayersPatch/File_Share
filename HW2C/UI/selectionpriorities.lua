-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

ModeOrder = {
	MUI_CM_Normal,
	MUI_CM_Add,
	MUI_CM_Eye,
	MUI_CM_Move,
	MUI_CM_ShipRelativeMove,
	MUI_CM_Attack,
	MUI_CM_ForceAttack,
	MUI_CM_Guard,
	MUI_CM_Dock,
	MUI_CM_Harvest,
	MUI_CM_Repair,
	MUI_CM_Cloak,
	MUI_CM_Mine,
	MUI_CM_Capture,
	MUI_CM_WaypointMove,
	MUI_CM_Hyperspace,
	MUI_CM_FormGate,
	MUI_CM_HyperspaceViaGate,
	MUI_CM_SpecialAttack,
	MUI_CM_SetRallyObject,
	MUI_CM_DefenseField,
	MUI_CM_MoveAttack,
	MUI_CM_Salvage,
	MUI_CM_Military}

MouseOverPriorities = {
	{mode = MUI_CM_Normal, byType = {SobType_WeaponFire, 0, SobType_SubSystem, 4}, byOwner = {SOS_Friendly = 1, SOS_Enemy = 0.8}, byAbility = {AB_Attack = 1.1},},
	{mode = MUI_CM_Add, byType = {SobType_WeaponFire, 0, SobType_SubSystem, 2}, byOwner = {SOS_Friendly = 1, SOS_Enemy = 0.8}, byAbility = {AB_Attack = 1.1},},
	{mode = MUI_CM_Eye, byType = {SobType_WeaponFire, 0, SobType_SubSystem, 2},},
	{mode = MUI_CM_Move},
	{mode = MUI_CM_Harvest, byType = {SobType_Asteroid, 2.5, SobType_Salvage, 2.5},},
	{mode = MUI_CM_Salvage, byAbility = {AB_Salvage, 2},},
	{mode = MUI_CM_Attack, byType = {SobType_SubSystem, 4}, byOwner = {SOS_Enemy = 1.5},},
	{mode = MUI_CM_WaypointMove, byType = {SobType_DustCloud, 0, SobType_Missile, 0},},}

BandBoxPriorities = {
	{mode = MUI_CM_Normal, byType = {SobType_WeaponFire, 0, SobType_SubSystem, 2}, byOwner = {SOS_Friendly = 1, SOS_Enemy = 0.8}, byAbility = {AB_Attack = 1.1},},
	{mode = MUI_CM_Attack, byType = {SobType_SubSystem, 2}, byOwner = {SOS_Enemy = 1.5},},}

MouseOverMix = {dist2DModifier = 50, depthModifier = 30, depthLogMax = 13}

BandBoxMix = {depthModifier = 50, depthLogMax = 13, priorityMin = 0.8}
