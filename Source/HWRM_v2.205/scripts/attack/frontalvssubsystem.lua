

function DegToRad(angle)
	return angle * ((2.0*3.141592653589)/360.0)
end

AttackStyleName = FaceTarget

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	--	Once past this amount * the weapon range the ship will stop and face the target
	inRangeFactor		= 0.85,
    -- once in range and facing the target we will slide around maintaining heading until we are more 
    -- then this multiplied by our range from the target, then we will fly normally to catch up
    slideDistanceMultiplier = 1.5,

	tooSlowSpeed		= 3.0,
	tooFastMultiplier	= 1.4,
	facingAngle			= 0,
	-- when doing a move attack we will break off after we get further than this multiplied by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	
    tryToMatchHeight = 0,
    
	-- want to attack from above
	tryToGetAboveTarget = 1,
	-- happy if we are less than this angle from the target up vector
	angleFromUp = 45,
	maxTimeToSpendFlyingToAbove = 4.0,
	
	-- delays for the things the attack style can do (in seconds)
    flyToTargetBecauseItsFarOutOfRangeDelay = 0.0,
    flyToTargetBecauseItsMovingAwayDelay = 1.0,
    stopAndFaceTheTargetDelay = 1.0,
    flyToAboveTheTargetDelay = 2.0,
    
	-- done at the end of every strafing run
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 19,
		},
		{
			Type = NoAction,
			Weighting = 200,
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(2.5),
			maxParam = DegToRad(4),
			Weighting = 1,
		},
	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
		{
			Type = InterpolateTarget,
			Weighting = 1,
			-- interpolate for 3 seconds, no variation
			minParam = 3,
			maxParam = 3,
		},
		{
			Type = NoAction,
			Weighting = 2,
		},
	},
}
