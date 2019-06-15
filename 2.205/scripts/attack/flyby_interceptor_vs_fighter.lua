

AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 1600.0,
	maxBreakDistanceAg = 1600.0,
	maxBreakDistanceEv = 1760.0,

	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 350.0,
	distanceFromTargetToBreakAg = 250.0,
	distanceFromTargetToBreakEv = 500.0,

	safeDistanceFromTargetToDoActions = 1600.0,
	safeDistanceFromTargetToDoActionsAg = 1800.0,
	safeDistanceFromTargetToDoActionsEv = 1900.0,

	attackEngineMult = 1,
	attackEngineMultAg = 0.8,
	attackEngineMultEv = 1.05,

	breakEngineMult = 1,
	breakEngineMultAg = 1.2,
	breakEngineMultEv = 1.1,

	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Attacker,
	horizontalMin = 0.2,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.2,
	verticalMax = 0.9,
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
			stance = "Ev,Ag"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkLeft",
			stance = "Ev,Ag"

		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkLeftAndBack",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRight",
			stance = "Ev,Ag"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRightAndBack",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "Loop",
			stance = "Ev"
		},
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 10,
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkLeft",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkLeftAndBack",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRight",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRightAndBack",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW",
			stance = "Ev"
		},
	},
}
