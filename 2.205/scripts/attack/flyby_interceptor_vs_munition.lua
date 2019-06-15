AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 800.0*1.05,
	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 225.0,
	safeDistanceFromTargetToDoActions = 600.0,

	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Attacker,
	horizontalMin = 0.6,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.2,
	verticalMax = 0.2,
	verticalFlip = 1,

	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

	-- done while flying towards target	
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 9,
		},
		{
			Type = NoAction,
			Weighting = 1,
		},
	},
	BeingAttackedActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 9,
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
			Weighting = 6,
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
	},
}
