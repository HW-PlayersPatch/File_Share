-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

AttackStyleName = AttackRun

Data = {
howToBreakFormation = ClimbAndPeelOff,
maxBreakDistance = 1900,
distanceFromTargetToBreak = 1100,
safeDistanceFromTargetToDoActions = 3000,
coordSysToUse = Target,
horizontalMin = 0.1,
horizontalMax = 0.4,
horizontalFlip = 1,
verticalMin = 0.6,
verticalMax = 0.7,
verticalFlip = 0,
RandomActions = {
	{Type = PickNewTarget, Weighting = 1},
	{Type = NoAction, Weighting = 2},},
BeingAttackedActions = {},
FiringActions = {
	{Type = NoAction, Weighting = 13},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCW_slow"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCCW_slow"},},}
