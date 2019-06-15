

AttackStyleName = CircleStrafe

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Multiply range by this to work out when we are in range and can stop moving
	inRangeMultiplier			= 0.9,

	-- our ship radius multiplied by this and then added on to the enemy radius 
	-- defines the distance which we will try to maintain from the target
	optimumRangeMultiplier		= 9.0,

	-- multiply the optimum range by this to work out the +/- bounds for height 
	-- difference from the target
	rangeMultiplierForHeight	= 0.3,

	-- done at the end of every strafing run
	RandomActions = 
	{
	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
	},
}
