

AttackStyleName = FaceTarget

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = BreakImmediately,

	-- when doing a move attack we will break off if after we get further than this multipled by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	
    tryToMatchHeight = 0,
    tryToGetAboveTarget = 0,
	
-- delays for the things the attack style can do (in seconds)
   	flyToTargetBecauseItsFarOutOfRangeDelay = 18000.0,
    flyToTargetBecauseItsMovingAwayDelay = 18000.0,
    stopAndFaceTheTargetDelay = 0.0,

	-- safeDistanceFromTargetToDoActions = 600.0,
	-- safeDistanceFromTargetToDoActionsAg = 500.0,
	-- safeDistanceFromTargetToDoActionsEv = 300.0,
	
    faceTargetHorizontal = 1,
    faceTargetVertical = 1,

	-- done at the end of every sim frame
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
		{
			Type = NoAction,
			Weighting = 9,
		},
	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
	},
}
