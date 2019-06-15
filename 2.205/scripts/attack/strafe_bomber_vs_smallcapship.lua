AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = ClimbAndPeelOff,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 2200,
	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 350,
	safeDistanceFromTargetToDoActions = 1950,
	
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Target,
	horizontalMin = 0.9,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.7,
	verticalMax = 0.9,
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
		{
			Type = InterpolateTarget,
			Weighting = 4,

		},
	},
	BeingAttackedActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 6,
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
		},
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 12,
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW_slow",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW_slow",
		},
		{
			Type = InterpolateTarget,
			Weighting = 4,

		},
	},
}
