

AttackStyleName = FlyRound

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	--	Axis used for circling will be rotated by between -/+ this amount each step of the circle
	axisRotation			= 15.0,

	--	Axis will never be more than this many degrees from vertical
	maxAxisRotation			= 85.0,

	--	Angle between points on the circle
	circleSegmentAngle		= 45.0,

	--	Multiply CircleSegmentAngle by from 1-AngleVariation to 1+AngleVariation
	angleVariation			= 0.2,

	-- the circle midpoint will be this far above the target centre
	circleHeight			= -300.0,
	circleHeightAg			= -300.0,
	circleHeightEv			= -600.0,

	--	Ships will fly at this distance from the target's surface
	distanceFromTarget		= 100.0,
	distanceFromTargetAg		= 100.0,
	distanceFromTargetEv		= 400.0,

	--	Multiply DistanceFromTarget by from 1-DistanceVariation to 1+DistanceVariation
	distanceVariation		= 0.2,
	distanceVariationAg		= 0.2,
	distanceVariationEv		= 0.01,

	--	Percentage chance that after completing a segment of the circle a ship will cut across the circle
	percentChanceOfCutting		= 5.0,
	percentChanceOfCuttingAg	= 10.0,
	percentChanceOfCuttingEv	= 0.1,

	--	When cutting across the circle skip at least this many segments
	minSegmentsToCut		= 1,

	--	When cutting across the circle skip up to this many segments
	maxSegmentsToCut		= 3,
	
	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

	-- done at the end of every strafing run
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
