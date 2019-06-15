Name = "Wall"
Order = 0.8                         -- Controls sort order for ID use.  In the next patch ONLY names will be allowed!
Hint = "$4954"
Title = "$5464"
Hotkey = 107
AI = 5
Icon = {
	texture = "DATA:UI\\NewUI\\Taskbar\\FormationIcons\\form_ico_wall.dds",
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
 
DeathDamage = 0.90
FriendlyFire = { 0.8, 0.0, 0.0 }       -- Base, Pop, PopSqrt

PopDecay = 0.01

	SpacingRange = 	 { 25, 1.75, 150, 1.35 }
	SpacingRangeAg = { 25, 1.75, 150, 1.35 }
	SpacingRangeEv = { 25, 2.50, 150, 1.50 }
 
 
Multipliers = {
 
-- Leader //Const, PopRaw-1, PopSqrt-1
-- Node //Nodedepth, LoMult,Above&AtUse4th,HiMult
-- Accel/Brake// times_ so to 'accel faster' you mult _down_ (0.5 is twice as fast)
 
   MAXSPEED = {

-- HW2 Pop - 3,4,6,9,12,15
-- HW2 Scout - 1,1+,2,3,4,5
 
-- Hig Pop - 5,6,10,15,20,25
-- Hig Fighter - 1,1+,2,3,4,5

-- Hig Pop - 3,4,6,12,18,21
-- Hig Vette - 1,1+,2,4,6,7

-- Vay Pop - 7,8,14,21,28,35
-- Vay Fighter -1,1+,2,3,4,5

-- Vay Pop - 6,7,12,18,24,30
-- Vay Bomber - 1,1+,2,3,4,5

-- Vaygr Pop 4,5,8,16,24,28
-- Vay Vette - 1,1+,2,4,6,7

		{ "Fighter", "Graph", 1, 0.95, 20, 0.87},
		{ "Fighter_hw1", "Graph", 1, 0.95, 20, 0.87},

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 1.0, 7, 1.0},
   },

    FLIGHTPERF  = {
 
		{ "Fighter", "Graph", 1, 0.86, 20, 0.84},
		{ "Fighter_hw1", "Graph", 1, 0.86, 20, 0.84},

		{ "Corvette", "Graph", 3, 0.965, 4, 0.965, 6, 0.965, 12, 0.95, 18, 0.95},
		{ "Corvette_hw1", "Graph", 3, 0.965, 4, 0.965, 6, 0.965, 12, 0.95, 18, 0.95},

		{ "Vgr_MissileCorvette", "Graph", 4, 0.965, 5, 0.965, 8, 0.965, 16, 0.95, 24, 0.95},
		{ "Vgr_LaserCorvette", "Graph", 4, 0.965, 5, 0.965, 8, 0.965, 16, 0.95, 24, 0.95},

   },
    ENGINEACCEL = {

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.65, 21, 0.60},
		{ "Corvette_hw1", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.65, 21, 0.60},

   },
    ENGINEBRAKE = {

   },
    THRUSTER = {

   },
    THRUSTERACCEL = {

		{ "Fighter", "Graph", 1, 0.90, 25, 0.90},
		{ "Fighter_hw1", "Graph", 1, 0.90, 25, 0.90},

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.65, 21, 0.60},
		{ "Corvette_hw1", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.65, 21, 0.60},

   },
    THRUSTERBRAKE = {

   },
    ROTATION = {

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.60, 21, 0.50 },
		{ "Corvette_hw1", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.60, 21, 0.50 },

   },
    ROTATIONACCEL = {

 
    },
    ROTATIONBRAKE = {

    },
     WEAPONCONE = {

-- HW2 Pop - 3,4,6,9,12,15
-- HW2 Scout - 1,1+,2,3,4,5

-- Hig Pop - 5,6,10,15,20
-- Hig Fighter - 1,1+,2,3,4

-- Hig Pop - 3,4,6,12,18
-- Hig Vette - 1,1+,2,4,6

-- Vay Pop - 7,8,14,21,28,35
-- Vay Fighter -1,1+,2,3,4,5

-- Vay Pop - 6,7,12,18,24,30
-- Vay Bomber - 1,1+,2,3,4,5

-- Vaygr Pop 4,5,8,16,24
-- Vay Vette - 1,1+,2,4,6

		{ "Corvette", "Graph", 3, 1.0, 4, 0.98, 6, 0.98, 12, 1.01 },
		{ "Corvette_hw1", "Graph", 3, 1.0, 4, 0.98, 6, 0.98, 12, 1.01 },

		{ "Vgr_LaserCorvette", "Graph", 4, 1.0, 5, 0.98, 8, 0.98, 16, 1.01 },

   },
    WEAPONACCURACY = {

-- HW2 Pop - 3,4,6,9,12,15
-- HW2 Scout - 1,1+,2,3,4,5

-- Hig Pop - 5,6,10,15,20
-- Hig Fighter - 1,1+,2,3,4

-- Hig Pop - 3,4,6,12,18
-- Hig Vette - 1,1+,2,4,6

-- Vay Pop - 7,8,14,21,28,35
-- Vay Fighter -1,1+,2,3,4,5

-- Vay Pop - 6,7,12,18,24,30
-- Vay Bomber - 1,1+,2,3,4,5

-- Vaygr Pop 4,5,8,16,24
-- Vay Vette - 1,1+,2,4,6

		{ "Corvette",AggressiveStance, "Graph", 1, 1.01, 3, 1.01},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.01, 3, 1.01},
 
   },
    WEAPONDAMAGE = {

-- HW2 Pop - 3,4,6,9,12,15
-- HW2 Scout - 1,1+,2,3,4,5

-- Hig Pop - 5,6,10,15,20
-- Hig Fighter - 1,1+,2,3,4

-- Hig Pop - 3,4,6,12,18
-- Hig Vette - 1,1+,2,4,6

-- Vay Pop - 7,8,14,21,28,35
-- Vay Fighter -1,1+,2,3,4,5

-- Vay Pop - 6,7,12,18,24,30
-- Vay Bomber - 1,1+,2,3,4,5

-- Vaygr Pop 4,5,8,16,24
-- Vay Vette - 1,1+,2,4,6

		{ "Fighter",AggressiveStance, "Graph", 1, 1.01, 5, 1.01},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 1.01, 5, 1.01},

		{ "Corvette",AggressiveStance, "Graph", 1, 1.01, 3, 1.01},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.01, 3, 1.01},

   },
    BULLETSPEED = {

-- HW2 Pop - 3,4,6,9,12,15
-- HW2 Scout - 1,1+,2,3,4,5

-- Hig Pop - 5,6,10,15,20
-- Hig Fighter - 1,1+,2,3,4

-- Hig Pop - 3,4,6,12,18
-- Hig Vette - 1,1+,2,4,6

-- Vay Pop - 7,8,14,21,28,35
-- Vay Fighter -1,1+,2,3,4,5

-- Vay Pop - 6,7,12,18,24,30
-- Vay Bomber - 1,1+,2,3,4,5

-- Vaygr Pop 4,5,8,16,24
-- Vay Vette - 1,1+,2,4,6

		{ "Corvette",AggressiveStance, "Graph", 1, 1.0, 5, 1.10},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.0, 5, 1.10},

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 1.0, 7, 1.0},

		{ "Vgr_LaserCorvette",AggressiveStance, "Graph", 1, 1.0, 5, 1.03},

		{ "Kus_LightCorvette",AggressiveStance, "Graph", 1, 1.0, 4, 1.0, 21, 1.10},
		{ "Tai_LightCorvette",AggressiveStance, "Graph", 1, 1.0, 4, 1.0, 21, 1.10},
 
   },
    TURRETSPEED = {

		{ "Corvette",AggressiveStance, "Graph", 1, 1.09, 4, 1.09, 21, 1.10},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.09, 4, 1.09, 21, 1.10},

		{ "Kus_LightCorvette",AggressiveStance, "Graph", 1, 1.05, 4, 1.05, 21, 1.05},
		{ "Tai_LightCorvette",AggressiveStance, "Graph", 1, 1.05, 4, 1.05, 21, 1.05},

   },
    ACCURACYAPPLIED = {
 
   },
    DAMAGEAPPLIED = {
		
   },
    FIRERATE = {

		{ "Fighter",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 0.90, 7, 0.90, 14, 0.90},


		{ "Hgn_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0, 6, 0.98},
		{ "Vgr_Bomber",AggressiveStance, "Graph", 1, 1.0, 6, 1.0, 7, 0.98},

		{ "Kus_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0, 6, 0.98},
		{ "Tai_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0, 6, 0.98},

		{ "Corvette",AggressiveStance, "Graph", 5, 0.98, 6, 0.98 },
		{ "Corvette_hw1",AggressiveStance, "Graph", 5, 0.98, 6, 0.98 },

   },
}

UnitLimit = 32

SupplyLimits =
{
	LayoutFighter = 21,
	LayoutCorvette = 21,
	LayoutFrigate = 11,
	LayoutDestroyer = 5,
	LayoutBattleCruiser = 1,
	LayoutResource = 9,
}

--SubFormations = 
--{
--	Fighter = "Delta",
--}
 
strikegroup =
{
	OffsetFromParent 		= {0,0,0},
	Children =
	{
		{
			Name = "ArmL",
			OffsetFromParent 		= {-1.01999,0.15,0},
			Children =
			{
				{
					OffsetFromParent 		= {0.15,1.019999,0},
				},
				{
					OffsetFromParent 		= {-0.15,-1.019997,0},
				},
			},
			Proxies = { "ArmL" },
		},
		{
			Name = "ArmR",
			OffsetFromParent 		= {1.01998,-0.15,0},
			Children =
			{
				{
					OffsetFromParent 		= {0.15,1.019998,0},
				},
				{
					OffsetFromParent 		= {-0.15,-1.019996,0},
				},
			},
			Proxies = { "ArmR" },
		},
		{
			OffsetFromParent 		= {0.15,1.01997,0},
		},
		{
			OffsetFromParent 		= {-0.15,-1.01996,0},
		},
	},
}
