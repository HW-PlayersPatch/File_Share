-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

AttackStyleName = DogFight

Data = {
howToBreakFormation = StraightAndScatter,
minSpeedFraction = 0.8,
RandomActions = {
	{Type = PickNewTarget, Weighting = 10},
	{Type = NoAction, Weighting = 140},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCW"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "RollCCW"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkLeft"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkRight"},},
BeingAttackedActions = {
	{Type = NoAction, Weighting = 400},
	{Type = PickNewTarget, Weighting = 200},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkLeft"},
	{Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkRight"},},
FiringActions = {},}
