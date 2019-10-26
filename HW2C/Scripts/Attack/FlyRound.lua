-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

AttackStyleName = FlyRound

Data = {
howToBreakFormation = StraightAndScatter,
axisRotation = 5,
maxAxisRotation = 20,
circleSegmentAngle = 30,
angleVariation = 0.2,
circleHeight = -300,
distanceFromTarget = 800,
distanceVariation = 0.1,
percentChanceOfCutting = 5,
minSegmentsToCut = 1,
maxSegmentsToCut = 1,
RandomActions = {
	{Type = PickNewTarget, Weighting = 1},
	{Type = NoAction, Weighting = 9},},
BeingAttackedActions = {},
FiringActions = {},}
