--===========================================================================
-- gbx_cole
--===========================================================================

AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = BreakImmediately,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 600.0,
	maxBreakDistanceAg = {900.0,600,1},
	maxBreakDistanceEv = {900.0,600,1},

	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 250.0,
	distanceFromTargetToBreakAg = {650.0,650,1},
	distanceFromTargetToBreakEv = {650.0,650,1},

	safeDistanceFromTargetToDoActions = 100.0,
	safeDistanceFromTargetToDoActionsAg = 100.0,
	safeDistanceFromTargetToDoActionsEv = 100.0,

	approachAngle = 1,
	minBreakDelay = 4,
	maxBreakDelay = 5,

	attackEngineMult = 1,
	attackEngineMultAg = 1.02,
	attackEngineMultEv = 1.15,

	breakEngineMult = 1,
	breakEngineMultAg = 1.0,
	breakEngineMultEv = 1.15,

	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Target,
	horizontalMin = 0.6,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.3,
	verticalMax = 0.7,
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
		},
		{
			Type = PickNewTarget,
			Weighting = 5,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = NoAction,
			Weighting = 30,
		},
		{
			Type = NoAction,
			Weighting = 10,
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "Serpentine_Evasive",
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
			heatCost = 5,
 			heatThresh = 0,
		},

	},
	BeingAttackedActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
		},
		{
			Type = PickNewTarget,
			Weighting = 9,
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "WingWaggle_Evasive",

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft_Evasive",

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeftAndBack_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRightAndBack_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "Serpentine_Evasive",

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "BarrelRoll",
		},
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
		},
		{
			Type = NoAction,
			Weighting = 5,
		},
		{
			Type = PickNewTarget,
			Weighting = 25,
			heatCost = 8,
 			heatThresh = 0,
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW_slow",
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW_slow",
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeftAndBack_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRightAndBack_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "Serpentine_Evasive",
			heatCost = 5,
 			heatThresh = 0,

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight",
		},
		{
			Type = FlightManeuver,
			Weighting = 6,
			FlightManeuverName = "RollCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 6,
			FlightManeuverName = "RollCCW",
		},
	},
}