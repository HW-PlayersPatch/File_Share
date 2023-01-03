Name = "inverted leaping goose"
Order = -1.0		-- Means invisible to UI

StanceGrouping = "Batch"
StanceGroupingAg = "Shape"
StanceGroupingEv = "Subs"

UnitLimit = 32

SupplyLimits =
{
	LayoutFighter = 25,
	LayoutCorvette = 18,
	LayoutFrigate = 12,
	LayoutDestroyer = 4,
	LayoutBattleCruiser = 1,
	LayoutResource = 9,
}

strikegroup = 
{
	FamilyOccupy 		= "BigCapitalShip, SmallCapitalShip",
	OffsetFromParent 		= {0,		0,		0},
	Children = 
	{
		{
			FamilyOccupy 		= "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent 		= {-1,		0,		0},
		},
		{
			FamilyOccupy 		= "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent 		= {1,		0,		0},
		},
		{
			FamilyOccupy 		= "BigCapitalShip",
			OffsetFromParent 		= {-1,	1,		-0.5},
			Children = 
			{
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {-1,	0,		-0.5},
				},
			},
		},
		{
			FamilyOccupy 		= "BigCapitalShip",
			OffsetFromParent 		= {1,		1,		-0.5},
			Children = 
			{
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {1,		0,		-0.5},
				}
			},
		},
		{
			FamilyOccupy 		= "BigCapitalShip",
			OffsetFromParent 		= {0,		-1,		-0.3},
			Children = 
			{
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {-1,	-0.5,	-0.2},
				},
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {1,		-0.5,	-0.2},

				},
			},
		},
		{
			FamilyOccupy 		= "BigCapitalShip",
			OffsetFromParent 		= {0,		0,		-1},
			Children = 
			{
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {-1,	0,		0},
				},
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {1,		0,		0},

				},
			},
		},
		{
			FamilyOccupy 		= "BigCapitalShip",
			OffsetFromParent 		= {0,		0,		1},
			Children = 
			{
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {-1,	0,		-0.3},
				},
				{
					FamilyOccupy 		= "BigCapitalShip",
					OffsetFromParent 		= {1,		0,		-0.3},
				},
			},
		},
	},
}
