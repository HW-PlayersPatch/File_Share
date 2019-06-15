

AttackStyleName = FlyRound

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = None,
	
	--	Axis used for circling will be rotated by between -/+ this amount each step of the circle
	axisRotation			= 15.0,

	--	Axis will never be more than this many degrees from vertical
	maxAxisRotation			= 15.0,

	--	Angle between points on the circle
	circleSegmentAngle		= 45.0,

	--	Multiply CircleSegmentAngle by from 1-AngleVariation to 1+AngleVariation
	angleVariation			= 0.2,

	--	Ships will fly at this distance from the target's surface
	distanceFromTarget		= 1500.0,

	--	Multiply DistanceFromTarget by from 1-DistanceVariation to 1+DistanceVariation
	distanceVariation		= 0.1,

	--	Percentage chance that after completing a segment of the circle a ship will cut across the circle
	percentChanceOfCutting	= 25.0,

	--	When cutting across the circle skip at least this many segments
	minSegmentsToCut		= 3,

	--	When cutting across the circle skip up to this many segments
	maxSegmentsToCut		= 6,
	
	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

	-- done at the end of every strafing run
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 11,
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
