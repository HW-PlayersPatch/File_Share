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
maxBreakDistance = 1300,
distanceFromTargetToBreak = 500,
safeDistanceFromTargetToDoActions = 1500,
coordSysToUse = Target,
horizontalMin = 0.3,
horizontalMax = 0.6,
horizontalFlip = 1,
verticalMin = 0.65,
verticalMax = 0.9,
verticalFlip = 0,
RandomActions = {
	{Type = PickNewTarget, Weighting = 1},
	{Type = NoAction, Weighting = 9},},
BeingAttackedActions = {
	{Type = PickNewTarget, Weighting = 6},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCW"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCCW"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "BarrelRoll"},},
FiringActions = {
	{Type = NoAction, Weighting = 13},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCW_slow"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCCW_slow"},},}
