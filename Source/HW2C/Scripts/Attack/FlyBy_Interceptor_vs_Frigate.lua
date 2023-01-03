-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

AttackStyleName = AttackRun

Data = {howToBreakFormation = StraightAndScatter,
maxBreakDistance = 1200,
distanceFromTargetToBreak = 350,
safeDistanceFromTargetToDoActions = 800,
useTargetUp = 0,
coordSysToUse = Attacker,
horizontalMin = 0.6,
horizontalMax = 0.9,
horizontalFlip = 1,
verticalMin = 0.2,
verticalMax = 0.6,
verticalFlip = 1,
RandomActions = {
	{Type = PickNewTarget, Weighting = 1},
	{Type = NoAction, Weighting = 2},},
BeingAttackedActions = {},
FiringActions = {
	{Type = NoAction, Weighting = 25},
	{Type = FlightManeuver, Weighting = 3, FlightManeuverName = "RollCW"},
	{Type = FlightManeuver, Weighting = 3, FlightManeuverName = "RollCCW"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkLeft"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkRight"},},}
