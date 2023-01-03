

function DegToRad(angle)
	return angle * ((2.0*3.141592653589)/360.0)
end

AttackStyleName = FaceTarget

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	--	Once past this amount * the weapon range the ship will stop and face the target
	inRangeFactor		= 0.95,
    -- once in range and facing the target we will slide around maintaining heading until we are more 
    -- then this multiplied by our range from the target, then we will fly normally to catch up
    slideDistanceMultiplier = 1.5,

	tooSlowSpeed		= 3.0,
	tooFastMultiplier	= 1.4,
	facingAngle			= 0,

	-- when doing a move attack we will break off if after we get further than this multiplied by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	
    tryToMatchHeight = 0,
	
	safeDistanceFromTargetToDoActions = 1000.0,
	useTargetUp = 0,
    
	tryToGetAboveTarget = 0,
	
	-- delays for the things the attack style can do (in seconds)
    flyToTargetBecauseItsFarOutOfRangeDelay = 0,
    flyToTargetBecauseItsMovingAwayDelay = 1.0,
    stopAndFaceTheTargetDelay = 1.0,
    flyToAboveTheTargetDelay = 2.0,
    
	-- done at the end of every strafing run
	RandomActions = 
	{
		{
			Type = InterpolateTarget,
			Weighting = 10,
			minParam = 0.5,
			maxParam = 0.5,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = PickNewTarget,
			Weighting = 10,
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
		{
			Type = InterpolateTarget,
			Weighting = 10,
			minParam = 0.5,
			maxParam = 0.5,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(2.5),
			maxParam = DegToRad(4),
			Weighting = 1,
		},
		{
			Type = NoAction,
			Weighting = 2,
		},
	},
	FiringActions = 
	{
		{
			Type = FlightManeuver,
			Weighting = 25,
			FlightManeuverName = "RollCCW_Kad_Static",
		},
		{
			Type = InterpolateTarget,
			Weighting = 1,
			minParam = 0.5,
			maxParam = 0.5,
			heatCost = 10,
 			heatThresh = 0,
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(2.5),
			maxParam = DegToRad(4),
			Weighting = 1,
			heatCost = 10,
 			heatThresh = 0,
		},
		{
			Type = NoAction,
			Weighting = 2,
			heatCost = 5,
 			heatThresh = 0,
		},
	},
}

