--===========================================================================
-- Stance supported AttackStyle for formations
-- gbx_cole
--===========================================================================

AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 1200.0,
	maxBreakDistanceAg = {1200.0,1300,1},
	maxBreakDistanceEv = {2000.0,2100,1},


	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 450.0,
	distanceFromTargetToBreakAg = {450.0,500,1},
	distanceFromTargetToBreakEv = {900.0,1100,1},


	useTargetUp = 0,

	attackEngineMult = 1,
	attackEngineMultAg = 1.0,
	attackEngineMultEv = 1.09,

	breakEngineMult = 1,
	breakEngineMultAg = 1.05,
	breakEngineMultEv = 1.09,
	
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Attacker,
	horizontalMin = 0.6,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.2,
	verticalMax = 0.6,
	verticalFlip = 1,

	safeDistanceFromTargetToDoActions = 600.0,
	safeDistanceFromTargetToDoActionsAg = 500.0,
	safeDistanceFromTargetToDoActionsEv = 300.0,
	
	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

	-- done while flying towards target	
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
		{
			Type = NoAction,
			Weighting = 30,
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Serpentine_Evasive",
			stance = "Ev"
		},

	},
	BeingAttackedActions = 
	{
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "WingWaggle_Evasive",
			stance = "Ev"

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft_Evasive",
			stance = "Ev"

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeftAndBack_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight_Evasive",
			stance = "Ev"

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRightAndBack_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Serpentine_Evasive",
			stance = "Ev"
		},
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
			stance = "Ag"
		},
		{
			Type = NoAction,
			Weighting = 2,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			stance = "Ev"
		},

	},
}