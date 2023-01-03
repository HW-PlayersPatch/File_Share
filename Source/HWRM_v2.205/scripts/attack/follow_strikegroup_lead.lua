

AttackStyleName = FollowLeader

Data = 
{
	--	Once past this amount * the weapon range the ship will stop and face the target
	inRangeFactor		= 0.85,
    -- once in range and facing the target we will slide around maintaining heading until we are more 
    -- then this multiplied by our range from the target, then we will fly normally to catch up
    slideDistanceMultiplier = 1.5,

	tooSlowSpeed		= 3.0,
	tooFastMultiplier	= 1.4,
	facingAngle			= 0,
	-- when facing faster targets we will start moving after they have been out of range for this long
	tooLongOutOfRange		= 3.5,
	-- when doing a move attack we will break off if after we get further than this multipled by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	
    tryToMatchHeight = 0,
    
	-- delays for the things the attack style can do (in seconds)
    flyToLeaderBecauseItsFarOutOfRangeDelay = 2.0,
    flyToLeaderBecauseItsMovingAwayDelay = 2.0,
    stopAndFaceTheTargetDelay = 1.0,
    
	-- done at the end of every strafing run
	RandomActions = 
	{
		{
			Type = NoAction,
			Weighting = 1,
		},
	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
	},
}
