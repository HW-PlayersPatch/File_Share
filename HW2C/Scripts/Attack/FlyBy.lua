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
maxBreakDistance = 2000,
distanceFromTargetToBreak = 500,
safeDistanceFromTargetToDoActions = 800,
coordSysToUse = Attacker,
horizontalMin = 0.6,
horizontalMax = 0.9,
horizontalFlip = 1,
verticalMin = 0.2,
verticalMax = 0.6,
verticalFlip = 1,
RandomActions = {
	{Type = PickNewTarget, Weighting = 1},
	{Type = NoAction, Weighting = 9},},
BeingAttackedActions = {
	{Type = PickNewTarget, Weighting = 9},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCW"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCCW"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "BarrelRoll"},},
FiringActions = {},}
