--===========================================================================
-- Stance supported AttackStyle for formations
-- gbx_cole
--===========================================================================

AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = BreakImmediately,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 1600.0,
	maxBreakDistanceAg = {1200.0,1500,1},
	maxBreakDistanceEv = {1500.0,1600,1},

	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 250.0,
	distanceFromTargetToBreakAg = {250.0,300,1},
	distanceFromTargetToBreakEv = {850.0,900,1},

	safeDistanceFromTargetToDoActions = 600.0,
	safeDistanceFromTargetToDoActionsAg = 500.0,
	safeDistanceFromTargetToDoActionsEv = 200.0,

	approachAngle = 1,

	attackEngineMult = 1,
	attackEngineMultAg = 1.0,
	attackEngineMultEv = 1.15,

	breakEngineMult = 1,
	breakEngineMultAg = 1.0,
	breakEngineMultEv = 1.15,

	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Attacker,
	horizontalMin = 10.0,
	horizontalMax = 75.0,
	horizontalFlip = 1,
	verticalMin = 1.0,
	verticalMax = 10.0,
	verticalFlip = 1,


	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

	-- done while flying towards target	
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = PickNewTarget,
			Weighting = 1,
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},
		{
			Type = PickNewTarget,
			Weighting = 1,
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = NoAction,
			Weighting = 30,
			stance = "Ag,Pa"
		},
		{
			Type = NoAction,
			Weighting = 30,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "Serpentine_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},

	},
	BeingAttackedActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
			stance = "Ag,Pa"
		},
		{
			Type = PickNewTarget,
			Weighting = 9,
		},
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
			Weighting = 5,
			FlightManeuverName = "Serpentine_Evasive",
			stance = "Ev"

		},
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
			stance = "Ag,Pa"
		},
		{
			Type = NoAction,
			Weighting = 5,
			stance = "Ev"
		},
		{
			Type = PickNewTarget,
			Weighting = 1,
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW_slow",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW_slow",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
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
			Weighting = 5,
			FlightManeuverName = "Serpentine_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"

		},
	},
}