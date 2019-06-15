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
	inRangeFactor		= 0.85,
	inRangeFactorAg		= 0.85,
	inRangeFactorEv		= 0.99,
    
-- once in range and facing the target we will slide around maintaining heading until we are more 
-- then this multiplied by our range from the target, then we will fly normally to catch up

        slideDistanceMultiplier = 1.5,

	tooSlowSpeed		= 3.0,
	tooFastMultiplier	= 1.4,
	facingAngle		= 0,
		
-- when doing a move attack we will break off if after we get further than this multipled by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	
    	tryToMatchHeight = 0,
    	tryToGetAboveTarget = 0,

-- happy if we are less than this angle from the target up vector
	angleFromUp = 45,

	maxTimeToSpendFlyingToAbove = 4.0,
	
-- delays for the things the attack style can do (in seconds)
   	flyToTargetBecauseItsFarOutOfRangeDelay = 2.0,
    	flyToTargetBecauseItsMovingAwayDelay = 2.0,
    	stopAndFaceTheTargetDelay = 1.0,
    	flyToAboveTheTargetDelay = 2.0,

	safeDistanceFromTargetToDoActions   = 500.0,
	safeDistanceFromTargetToDoActionsAg = 500.0,
	safeDistanceFromTargetToDoActionsEv = 200.0,
    

-- done at the end of every strafing run

	RandomActions = 
                {
                {
                	Type = PickNewTarget,
			heatCost = 2,
 			heatThresh = 0,
                        Weighting = 10,
                },
                {
                        Type = NoAction,
			heatCost = 1,
 			heatThresh = 0,
                        Weighting = 1,
                },
		{
			Type = InterpolateTarget,
			Weighting = 10,
			minParam = 3,
			maxParam = 3,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(40),
			maxParam = DegToRad(85),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(65),
			maxParam = DegToRad(110),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(90),
			maxParam = DegToRad(135),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(20),
			maxParam = DegToRad(60),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(40),
			maxParam = DegToRad(85),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(65),
			maxParam = DegToRad(110),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 30,
                },
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "RollCCW_Evasive_Static",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "DodgeRoll_Right_Static_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "DodgeRoll_Left_Static_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "WingWaggle_Evasive",
			heatCost = 2,
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
			heatCost = 1,
 			heatThresh = 0,
                        Weighting = 1,
                        stance = "Ev",
                },
		{
			Type = NoAction,
			heatCost = 1,
 			heatThresh = 0,
			stance = "Ag,Pa",
			Weighting = 1,
		},
		{
			Type = PickNewTarget,
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ag,Pa",
			Weighting = 15,
		},
		{
			Type = InterpolateTarget,
			Weighting = 10,
			minParam = 3,
			maxParam = 3,
			heatCost = 5,
 			heatThresh = 0,
		},
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(20),
			maxParam = DegToRad(60),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(40),
			maxParam = DegToRad(85),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(65),
			maxParam = DegToRad(110),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
                        Weighting = 30,
                },
		{
			Type = PickNewTarget,
			heatCost = 2,
 			heatThresh = 0,
			Weighting = 15,
                        stance = "Ev",
		},
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(40),
			maxParam = DegToRad(85),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(65),
			maxParam = DegToRad(110),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 30,
                },
		{
                        Type = MoveRoundTarget,
			minParam = DegToRad(90),
			maxParam = DegToRad(135),
			heatCost = 2,
 			heatThresh = 0,
                        stance = "Ev",
                        Weighting = 30,
                },
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "RollCCW_Evasive_Static",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "DodgeRoll_Right_Static_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "DodgeRoll_Left_Static_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "BarrelRoll_Slow_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
		{
			Type = FlightManeuver,
			Weighting = 2,
			FlightManeuverName = "WingWaggle_Evasive",
			heatCost = 2,
 			heatThresh = 0,
			stance = "Ev",
		},
         },
}