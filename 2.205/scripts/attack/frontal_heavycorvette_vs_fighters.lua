--===========================================================================
-- Stance supported AttackStyle for formations
-- gbx_cole
--===========================================================================

function DegToRad(angle)
	return angle * ((2.0*3.141592653589)/360.0)
end

AttackStyleName = FaceTarget

Data = 
{

-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	

-- Once past this amount * the weapon range the ship will stop and face the target
	inRangeFactor		= 0.90,
	inRangeFactorAg		= 0.80,
	inRangeFactorEv		= 0.95,
    
-- once in range and facing the target we will slide around maintaining heading until we are more 
-- then this multiplied by our range from the target, then we will fly normally to catch up

        slideDistanceMultiplier = 1.5,

	tooSlowSpeed		= 3.0,
	tooFastMultiplier	= 1.4,
	facingAngle		= 0,

	-- when facing faster targets we will start moving after they have been out of range for this long
	tooLongOutOfRange		= 8.0,
		
-- when doing a move attack we will break off if after we get further than this multipled by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	
    	tryToMatchHeight = 0,
    	tryToGetAboveTarget = 0,

	maxTimeToSpendFlyingToAbove = 4.0,
	
-- delays for the things the attack style can do (in seconds)
   	flyToTargetBecauseItsFarOutOfRangeDelay = 8.0,
    	flyToTargetBecauseItsMovingAwayDelay = 6.0,
    	stopAndFaceTheTargetDelay = 1.0,
    	flyToAboveTheTargetDelay = 1.0,

	safeDistanceFromTargetToDoActions   = 500.0,
	safeDistanceFromTargetToDoActionsAg = 500.0,
	safeDistanceFromTargetToDoActionsEv = 200.0,
    
	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

-- done at the end of every strafing run

	RandomActions = 
                {
                {
                	Type = PickNewTarget,
			heatCost = 5,
 			heatThresh = 0,
                        Weighting = 10,
                },
                {
                        Type = NoAction,
			heatCost = 5,
 			heatThresh = 0,
                        Weighting = 10,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-175),
			maxParam = DegToRad(175),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 15,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-145),
			maxParam = DegToRad(145),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 15,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-95),
			maxParam = DegToRad(95),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 15,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-20),
			maxParam = DegToRad(20),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 10,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-27),
			maxParam = DegToRad(27),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 10,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(21),
			maxParam = DegToRad(-25),
			heatCost = 4,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 15,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(32),
			maxParam = DegToRad(-37),
			heatCost = 6,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 14,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(43),
			maxParam = DegToRad(-44),
			heatCost = 7,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 13,
                },
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive_Static",
			heatCost = 7,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "DodgeRoll_Right_Static_Evasive",
			heatCost = 7,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "DodgeRoll_Left_Static_Evasive",
			heatCost = 7,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "WingWaggle_Evasive",
			heatCost = 5,
 			heatThresh = 0,
			stance = "Ev",
		},
                },

                BeingAttackedActions =
		{
		},
                FiringActions =
                {
		{
                        Type = NoAction,
			heatCost = 2,
 			heatThresh = 0,
                        Weighting = 10,
                        stance = "Ev",
                },
		{
			Type = NoAction,
			Weighting = 20,
			stance = "Ag,Pa",
		},
		{
			Type = PickNewTarget,
			Weighting = 10,
			stance = "Ag,Pa",
		},
		{
			Type = PickNewTarget,
			heatCost = 2,
 			heatThresh = 0,
			Weighting = 20,
                        stance = "Ev",
		},
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-95),
			maxParam = DegToRad(95),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 20,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-175),
			maxParam = DegToRad(175),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 25,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-145),
			maxParam = DegToRad(145),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 25,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(-95),
			maxParam = DegToRad(95),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 25,
                },
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "RollCCW_Evasive_Static",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "DodgeRoll_Right_Static_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "DodgeRoll_Left_Static_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 5,
			FlightManeuverName = "WingWaggle_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},

         },
}