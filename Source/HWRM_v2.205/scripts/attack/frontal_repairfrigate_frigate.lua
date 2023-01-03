
function DegToRad(angle)
	return angle * ((2.0*3.141592653589)/360.0)
end

AttackStyleName = FaceTarget

Data = 
{

-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
-- Once past this amount * the weapon range the ship will stop and face the target
	inRangeFactor		= 0.38,
    
-- once in range and facing the target we will slide around maintaining heading until we are more 
-- then this multiplied by our range from the target, then we will fly normally to catch up

        slideDistanceMultiplier = 1.5,

	tooSlowSpeed		= 3.0,
	tooFastMultiplier	= 1.4,
	facingAngle		= 0,
		
-- when doing a move attack we will break off if after we get further than this multipled by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	
    	tryToMatchHeight = 0,
    	tryToGetAboveTarget = 0,
	
-- delays for the things the attack style can do (in seconds)
   	flyToTargetBecauseItsFarOutOfRangeDelay = 1.0,
    	flyToTargetBecauseItsMovingAwayDelay = 1.0,
    	stopAndFaceTheTargetDelay = 1.0,
    	flyToAboveTheTargetDelay = 4.0,

	safeDistanceFromTargetToDoActions = 6.0,
	safeDistanceFromTargetToDoActionsAg = 6.0,
	safeDistanceFromTargetToDoActionsEv = 6.0,
    

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
			Weighting = 10,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(-2.5),
			maxParam = DegToRad(4),
			Weighting = 10,
			heatCost = 10,
 			heatThresh = 0,
		},
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-11),
			maxParam = DegToRad(15),
			heatCost = 3,
 			heatThresh = 0,
                        Weighting = 10,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(11),
			maxParam = DegToRad(-11),
			heatCost = 3,
 			heatThresh = 0,
                        Weighting = 15,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(15),
			maxParam = DegToRad(-15),
			heatCost = 3,
 			heatThresh = 0,
                        Weighting = 15,
                },
		{
			Type = InterpolateTarget,
			Weighting = 10,
			-- interpolate for 3 seconds, no variation
			minParam = 3,
			maxParam = 3,
			heatCost = 5,
 			heatThresh = 0,
		},
	},
	BeingAttackedActions = 
	{

		{
			Type = NoAction,
			Weighting = 2,
		},
	},
	FiringActions = 
	{
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(-2.5),
			maxParam = DegToRad(4),
			Weighting = 10,
			heatCost = 10,
 			heatThresh = 0,
		},
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-11),
			maxParam = DegToRad(15),
			heatCost = 3,
 			heatThresh = 0,
                        Weighting = 10,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(11),
			maxParam = DegToRad(-11),
			heatCost = 3,
 			heatThresh = 0,
                        Weighting = 15,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(15),
			maxParam = DegToRad(-15),
			heatCost = 3,
 			heatThresh = 0,
                        Weighting = 15,
                },
		{
			Type = InterpolateTarget,
			Weighting = 5,
			-- interpolate for 3 seconds, no variation
			minParam = 3,
			maxParam = 3,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = NoAction,
			Weighting = 2,
		},
	},
}