

AttackStyleName = FlyRound

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	--	Axis used for circling will be rotated by between -/+ this amount each step of the circle
	axisRotation			= 15.0,

	--	Axis will never be more than this many degrees from vertical
	maxAxisRotation			= 85.0,

	--	Angle between points on the circle
	circleSegmentAngle		= 45.0,

	--	Multiply CircleSegmentAngle by from 1-AngleVariation to 1+AngleVariation
	angleVariation			= 0.2,

	-- the circle midpoint will be this far above the target centre
	circleHeight			= -100.0,
	circleHeightAg			= -300.0,
	circleHeightEv			= -600.0,

	--	Ships will fly at this distance from the target's surface
	distanceFromTarget		= 1000.0,
	distanceFromTargetAg		= 1000.0,
	distanceFromTargetEv		= 1400.0,

	--	Multiply DistanceFromTarget by from 1-DistanceVariation to 1+DistanceVariation
	distanceVariation		= 0.1,
	distanceVariationAg		= 0.1,
	distanceVariationEv		= 0.2,

	--	Percentage chance that after completing a segment of the circle a ship will cut across the circle
	percentChanceOfCutting		= 5.0,
	percentChanceOfCuttingAg	= 5.0,
	percentChanceOfCuttingEv	= 0.1,

	--	When cutting across the circle skip at least this many segments
	minSegmentsToCut		= 1,

	--	When cutting across the circle skip up to this many segments
	maxSegmentsToCut		= 3,
	
	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,


	safeDistanceFromTargetToDoActions = 600.0,
	safeDistanceFromTargetToDoActionsAg = 500.0,
	safeDistanceFromTargetToDoActionsEv = 300.0,


	-- done while flying towards target	
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
		{
			Type = PickNewTarget,
			Weighting = 25,
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},
		{
			Type = PickNewTarget,
			Weighting = 5,
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
			Weighting = 10,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 7,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 6,
			FlightManeuverName = "Serpentine_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ag,Pa"
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
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"

		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeftAndBack_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRightAndBack_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 10,
 			heatThresh = 0,
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
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
		},
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},
		{
			Type = NoAction,
			Weighting = 25,
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = PickNewTarget,
			Weighting = 25,
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa"
		},
		{
			Type = PickNewTarget,
			Weighting = 25,
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
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
			Weighting = 5,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "Dodge_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeft_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkLeftAndBack_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRight_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "JinkRightAndBack_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCW_Evasive",
			heatCost = 10,
 			heatThresh = 0,
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive",
			heatCost = 10,
 			heatThresh = 0,
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
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "BarrelRoll",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev"
		},
	},
}