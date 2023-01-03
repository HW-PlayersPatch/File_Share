-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

function DegToRad(angle)
	return angle * ((2 * 3.141592653589) / 360)
end

AttackStyleName = FaceTarget

Data = {
howToBreakFormation = StraightAndScatter,
inRangeFactor = 0.85,
slideDistanceMultiplier = 1.5,
tooSlowSpeed = 3,
tooFastMultiplier = 1.4,
facingAngle = 90,
moveAttackMaxDistanceMultiplier = 1.2,
tryToMatchHeight = 0,
tryToGetAboveTarget = 1,
angleFromUp = 45,
maxTimeToSpendFlyingToAbove = 4,
flyToTargetBecauseItsFarOutOfRangeDelay = 0,
flyToTargetBecauseItsMovingAwayDelay = 1,
stopAndFaceTheTargetDelay = 1,
flyToAboveTheTargetDelay = 2,
RandomActions = {
	{Type = InterpolateTarget, Weighting = 10},
	{Type = PickNewTarget, Weighting = 10},
	{Type = NoAction, Weighting = 200},
	{Type = MoveRoundTarget, minParam = DegToRad(2.5), maxParam = DegToRad(4), Weighting = 1},},
BeingAttackedActions = {},
FiringActions = {},}
