-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

AttackStyleName = AttackRun

Data = {
howToBreakFormation = StraightAndScatter,
maxBreakDistance = 1600,
distanceFromTargetToBreak = 350,
safeDistanceFromTargetToDoActions = 1000,
coordSysToUse = Attacker,
horizontalMin = 0.6,
horizontalMax = 0.9,
horizontalFlip = 1,
verticalMin = 0.2,
verticalMax = 0.2,
verticalFlip = 1,
RandomActions = {
	{Type = PickNewTarget, Weighting = 1},
	{Type = NoAction, Weighting = 30},},
BeingAttackedActions = {},
FiringActions = {
	{Type = NoAction, Weighting = 13},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCW_slow"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCCW_slow"},},}
