AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 1600.0*1.1,
	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 850.0*1.1,
	safeDistanceFromTargetToDoActions = 1200.0*1.1,
	useTargetUp = 0,
	
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = TargetPoint,
	horizontalMin = 0.2,
	horizontalMax = 0.6,
	horizontalFlip = 1,
	verticalMin = 0.4,
	verticalMax = 0.7,
	verticalFlip = 0,
	
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
			Weighting = 2,
		},
	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 20,
		},
		{
			Type = FlightManeuver,
			Weighting = 3,
			FlightManeuverName = "RollCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 3,
			FlightManeuverName = "RollCCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkLeft",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRight",
		},
	},
}
