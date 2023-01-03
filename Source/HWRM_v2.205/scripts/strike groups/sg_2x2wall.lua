Name = "SG_2x2Wall"
Order = -1.0		-- No UI
Hint = "$4954"
Title = "$5464"
Hotkey = 107

UIAlias = "Wall"

BatchRestrict = 1

	SpacingRange = 	 { 25, 1.00, 150, 1.00 }
	SpacingRangeAg = { 25, 1.00, 150, 1.00 }
	SpacingRangeEv = { 25, 2.50, 150, 2.50 }

DeathDamage = 0.1
FriendlyFire = { 0.0, 0.0, 0.0 }	-- Base, Pop, PopSqrt

LayoutMode = "Nodes"

StanceGrouping = "Batch"
StanceGroupingAg = "Shape"
StanceGroupingEv = "Subs"

Icon = {
	texture = "DATA:UI\\NewUI\\Taskbar\\FormationIcons\\form_ico_wall.dds",
	uvRect = { 0/128, 0/1024, 128/128, 128/1024 },
	patch_X = { 4,-120, 4,0 },
	patch_Y = { 4,-120,4, 0 },
	patch_Scale = 1,
		
	Surface = {
		surface = "ui_multistate";
		{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
		{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
		{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
		{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
	}
}

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
			OffsetFromParent 		= {0,1,0},
		},
		{
			OffsetFromParent 		= {1,0,0},
		},
		{		
			OffsetFromParent 		= {1,1,0},
		},
	},
}