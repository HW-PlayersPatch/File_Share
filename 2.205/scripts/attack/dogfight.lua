

AttackStyleName = DogFight

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Ships will try to go no slower than this fraction of their max speed in a dogfight
	minSpeedFraction		= 0.8,
	
	-- done every sim frame
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 10,
		},
		{
			Type = NoAction,
			Weighting = 140,
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
			FlightManeuverName = "JinkLeft",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRight",
		},
--		{
--			Type = FlightManeuver,
--			Weighting = 1,
--			FlightManeuverName = "JinkLeftAndBack",
--		},
	},
	BeingAttackedActions = 
	{
		{
			Type = NoAction,
			Weighting = 400,
		},
		{
			Type = PickNewTarget,
			Weighting = 200,
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
--		{
--			Type = FlightManeuver,
--			Weighting = 1,
--			FlightManeuverName = "JinkLeftAndBack",
--		},
	},
	FiringActions = 
	{
	},
}
