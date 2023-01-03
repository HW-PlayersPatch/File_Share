Name = "Capital Phalanx"
Order = 0.1		-- Controls sort order for ID use.  In the next patch ONLY names will be allowed!
AI = 1
Hint = "$2735"
Title = "$3164"
Hotkey = 28
Icon = {
	texture = "DATA:UI\\NewUI\\Taskbar\\FormationIcons\\form_ico_capital_phalanx.dds",
	uvRect = { 0/128, 0/512, 128/128, 128/512 },
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

ExtFilter = "sgf_gbx,sgf_hwrm"
Tags = "sgf_common"

StanceGrouping = "Batch"
StanceGroupingAg = "Shape"
StanceGroupingEv = "Subs"

DeathDamage = 0.85
FriendlyFire = { 0.7, 0.0, 0.0 }       -- Base, Pop, PopSqrt

PopDecay = 0.01

SpacingRange = 	 { 75, 1.45, 200, 1.1 }
SpacingRangeAg = { 75, 1.45, 200, 1.1 }
SpacingRangeEv = { 75, 1.8,  200, 1.5 }

UnitLimit = 56

SupplyLimits =
{
	LayoutFighter = 32,
	LayoutCorvette = 18,
	LayoutFrigate = 12,
	LayoutDestroyer = 4,
	LayoutBattleCruiser = 1,
	LayoutResource = 9,
}

SubFormations =
{
	default = "Wall"
}

strikegroup =
{
	OffsetFromParent = {0,0,0},
	Children =
	{		
		-- Surround BCs
		{
			FamilyChild = "BigCapitalShip, SmallCapitalShip",
			NoTypeChild = "Vgr_Battlecruiser",	-- Vgr BC's shoot missiles up, so use a alt layout...
			FamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {0,1.5001,0.2},
			CanGrow = 0,
		},
		{
			FamilyChild = "BigCapitalShip, SmallCapitalShip",
			NoTypeChild = "Vgr_Battlecruiser",	-- Vgr BC's shoot missiles up, so use a alt layout...
			FamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {0,-1.5002,0.2},
			CanGrow = 0,
		},
		{
			FamilyChild = "BigCapitalShip, SmallCapitalShip",
			TypeChild = "Vgr_Battlecruiser",	-- Place units (often destroyers) upper but off center...
			FamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {-0.75,1.65002,-0.25},
			CanGrow = 0,
		},
		{
			FamilyChild = "BigCapitalShip, SmallCapitalShip",
			TypeChild = "Vgr_Battlecruiser",	-- Place units (often destroyers) upper but off center...
			FamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {0.75,1.65002,-0.25},
			CanGrow = 0,
		},
		{
			FamilyChild = "BigCapitalShip, SmallCapitalShip",
			FamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {-1.75003,-0.27,0.25},
			CanGrow = 0,
		},
		{
			FamilyChild = "BigCapitalShip, SmallCapitalShip",
			FamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {1.75004,-0.27,0.25},
			CanGrow = 0,
		},
		-- Forward Positions
		{
			NoFamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {-1.5,-1.1,-1.1001},
			Proxies = { "WallFrDR", "WallFrDRO" },
			CanGrow = 0,
		},
		{
			NoFamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {1.5,-1.1,-1.1002},
			Proxies = { "WallFrDL", "WallFrDLO" },
			CanGrow = 0,
		},
		{
			NoFamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {-1.5,1.1,-1.1003},
			Proxies = { "WallFrUR", "WallFrURO" },
			CanGrow = 0,
		},
		{
			NoFamilyOccupy = "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent = {1.5,1.1,-1.1004},
			Proxies = { "WallFrUL", "WallFrULO" },
			CanGrow = 0,
		},
		
		-- Container for named nodes
		{
			Ignore = 1,
			
			Children =
			{
				-- Base Frigates
				{
					Name = "WallFrDR",
					FamilyChild = "Frigate",
					FamilyOccupy = "Frigate",
					OffsetFromParent 		= {-1.0,-0.3,0.5},
					ElseChild = "WallDR",
				},
				{	-- Anythings Spawn forward of Frigate (when root)
					Name = "WallFrDRO",
					FamilyChild = "Frigate",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {-0.5,-1.0,-0.5},
					Proxies = { "WallDR", "WallDRD" },
				},
				{
					Name = "WallFrDL",
					FamilyChild = "Frigate",
					FamilyOccupy = "Frigate",
					OffsetFromParent 		= {1.0,-0.3,0.5},
					ElseChild = "WallDL",
				},
				{	-- Anythings Spawn forward of Frigate (when root)
					Name = "WallFrDLO",
					FamilyChild = "Frigate",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {0.5,-1.0,-0.5},
					Proxies = { "WallDL", "WallDLD" },
				},
				{
					Name = "WallFrUR",
					FamilyChild = "Frigate",
					FamilyOccupy = "Frigate",
					OffsetFromParent 		= {-1.0,0.3,0.5},
					ElseChild = "WallUR",
				},
				{	-- Anythings Spawn forward of Frigate (when root)
					Name = "WallFrURO",
					FamilyChild = "Frigate",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {-0.5,1.0,-0.5},
					Proxies = { "WallUR", "WallURU" },
				},
				{
					Name = "WallFrUL",
					FamilyChild = "Frigate",
					FamilyOccupy = "Frigate",
					OffsetFromParent 		= {1.0,0.3,0.5},
					ElseChild = "WallUL",
				},
				{	-- Anythings Spawn forward of Frigate (when root)
					Name = "WallFrULO",
					FamilyChild = "Frigate",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {0.5,1.0,-0.5},
					Proxies = { "WallUL",  "WallULU"},
				},
				
				-- Anything else...
				{
					Name = "WallDR",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {-1.0,0,-0.2},
					Proxies = { "WallDR", "WallDRD" },
				},
				{
					Name = "WallDRD",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {-0.5,-1.0,-0.15},
				},
				{
					Name = "WallDL",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {1.0002,0,-0.2},
					Proxies = { "WallDL", "WallDLD" },
				},
				{
					Name = "WallDLD",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {0.5,-1.0,-0.15},
				},
				{
					Name = "WallUR",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {-1.0,0,-0.2},
					Proxies = { "WallUR", "WallURU" },
				},
				{
					Name = "WallURU",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {-0.5,1.0,-0.15},
				},
				{
					Name = "WallUL",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {1.0,0,-0.2},
					Proxies = { "WallUL", "WallULU" },
				},
				{
					Name = "WallULU",
					NoFamilyOccupy = "Frigate",
					OffsetFromParent 		= {0.50,1.0,-0.15},
				},
			},
		},
	}
}
