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
	maxBreakDistance = 1800.0,
	maxBreakDistanceAg = {1900.0,1900,1},
	maxBreakDistanceEv = {1900.0,1900,1},


	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 1000.0,
	distanceFromTargetToBreakAg = {850.0,900,1},
	distanceFromTargetToBreakEv = {900.0,1300,1},

	safeDistanceFromTargetToDoActions = 600.0,
	safeDistanceFromTargetToDoActionsAg = 600.0,
	safeDistanceFromTargetToDoActionsEv = 850.0,

	approachAngle = 1,

	attackEngineMult = 1,
	attackEngineMultAg = 0.85,
	attackEngineMultEv = 1.05,

	breakEngineMult = 1,
	breakEngineMultAg = 1.09,
	breakEngineMultEv = 1.05,
	
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Attacker,
	horizontalMin = 0.2,
	horizontalMax = 1.6,
	horizontalFlip = 1,
	verticalMin = 0.1,
	verticalMax = 1.7,
	verticalFlip = 0,
	

	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

	-- done while flying towards target	
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
			heatCost = 8,
 			heatThresh = 0,
		},
		{
			Type = PickNewTarget,
			Weighting = 25,
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
		},
		{
			Type = PickNewTarget,
			Weighting = 5,
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = NoAction,
			Weighting = 30,
			stance = "Ag,Pa",
		},
		{
			Type = NoAction,
			Weighting = 10,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "Serpentine_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ag,Pa",
		},

	},
	BeingAttackedActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
			stance = "Ag,Pa",
		},
		{
			Type = PickNewTarget,
			Weighting = 9,
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "WingWaggle_Evasive",
			stance = "Ev",

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft_Evasive",
			stance = "Ev",

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeftAndBack_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRightAndBack_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "Serpentine_Evasive",
			stance = "Ev",

		},
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
			stance = "Ag,Pa",
		},
		{
			Type = NoAction,
			Weighting = 5,
			stance = "Ev",
		},
		{
			Type = PickNewTarget,
			Weighting = 25,
			heatCost = 8,
 			heatThresh = 0,
			stance = "Ag,Pa",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW_slow",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ag,Pa",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW_slow",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ag,Pa",
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeftAndBack_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRightAndBack_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "Serpentine_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",

		},
	},
}