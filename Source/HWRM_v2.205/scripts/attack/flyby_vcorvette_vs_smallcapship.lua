

AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 2000,
	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 450,
	safeDistanceFromTargetToDoActions = 1200.0*1.1,
	useTargetUp = 0,
	
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Target,
	horizontalMin = 0.6,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.2,
	verticalMax = 0.6,
	verticalFlip = 1,
	
    
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
			Weighting = 25,
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
	},
}
