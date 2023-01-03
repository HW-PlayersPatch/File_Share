AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 1200.0,
	maxBreakDistanceAg = {1300.0,300,1},
	maxBreakDistanceEv = {1900.0,300,1},

	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 500.0,
	distanceFromTargetToBreakAg = {500.0,300,1},
	distanceFromTargetToBreakEv = {1000.0,300,1},

	safeDistanceFromTargetToDoActions = 600.0,
	safeDistanceFromTargetToDoActionsAg = 600.0,
	safeDistanceFromTargetToDoActionsEv = 850.0,

	attackEngineMult = 1,
	attackEngineMultAg = 0.90,
	attackEngineMultEv = 1.03,

	breakEngineMult = 1,
	breakEngineMultAg = 1.05,
	breakEngineMultEv = 1.03,
	useTargetUp = 0,
	
	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir  = 1,

	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Attacker,
	horizontalMin = 0.6,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.2,
	verticalMax = 0.6,
	verticalFlip = 1,
	
	-- done at the end of every strafing run
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
		{
			Type = NoAction,
			Weighting = 2,
		},

	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 12,
		},

	},
}
