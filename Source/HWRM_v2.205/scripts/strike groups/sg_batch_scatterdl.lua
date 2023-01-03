Name = "Batch_ScatterDL"
Order = -1.0		-- Means invisible to UI
Hint = "$4950"
Title = "$5460"
Hotkey = 103

BatchRestrict = 1
SpacingScale = 1.45

DeathDamage = 0.1
FriendlyFire = { 0.0, 0.0, 0.0 }	-- Base, Pop, PopSqrt

LayoutMode = "Nodes"

StanceGrouping = "Batch"
StanceGroupingAg = "Shape"
StanceGroupingEv = "Subs"

UnitLimit = 32

SupplyLimits =
{
	LayoutFighter = 25,
}

strikegroup =
{
	OffsetFromParent 		= {0,0,0},
	Children =
	{
		{
			OffsetFromParent 		= {-0.585,-0.142,-2.365,1.0},
			Children =
			{
				{
					OffsetFromParent 		= {0.017,0.096,-4.515,1.0},
					Children =
					{
						{
							OffsetFromParent 		= {-0.683,0.000,-8.033,1.0},
						},
					},
				},
			},
		},
		{
			OffsetFromParent 		= {-0.106,0.706,-2.365,1.0},
			Children =
			{
				{
					OffsetFromParent 		= {-0.480,0.377,-6.046,1.0},
					Children =
					{
						{
							OffsetFromParent 		= {0.286,0.373,-9.996,1.0},
						},
					},
				},
			},
		},
		{
			OffsetFromParent 		= {0.845,-0.315,-3.147,1.0},
			Children =
			{
				{
					OffsetFromParent 		= {0.409,0.702,-6.296,1.0},
				},
			},
		},
	},
}
