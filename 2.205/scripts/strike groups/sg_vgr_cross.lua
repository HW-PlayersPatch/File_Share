Name = "Vgr_Cross"
ExName = "X"

Order = 0.6                         -- Controls sort order for ID use.  In the next patch ONLY names will be allowed!
Hint = "$5484"
Title = "$5483"
Hotkey = 105
Icon = {
	texture = "DATA:UI\\NewUI\\Taskbar\\FormationIcons\\form_ico_cross.dds",
	uvRect = { 0/128, 0/512, 128/128, 128/515 },
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
Tags = "sgf_vgr"

StanceGrouping = "Batch"
StanceGroupingAg = "Shape"
StanceGroupingEv = "Subs"
 
DeathDamage = 0.90
FriendlyFire = { 0.8, 0.0, 0.0 }       -- Base, Pop, PopSqrt

-- Decay rate 1% Set to 1 for instant
PopDecay = 0.01

	SpacingRange = 	 { 25, 1.15, 150, 1.25 }
	SpacingRangeAg = { 25, 1.15, 150, 1.25 }
	SpacingRangeEv = { 25, 2.0, 150, 1.80 }
 
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

   },

    FLIGHTPERF  = {

		{ "Fighter", "Graph", 1, 0.88, 20, 0.85},
		{ "Fighter_hw1", "Graph", 1, 0.88, 20, 0.85},

		{ "Vgr_Interceptor", "Graph", 1, 0.88, 20, 0.85},

		{ "Vgr_Bomber", "Graph", 6, 0.88, 7, 0.88, 12, 0.88, 18, 0.88, 24, 0.85, 30, 0.50 },

		{ "Corvette", "Graph", 3, 0.965, 4, 0.965, 6, 0.965, 12, 0.95, 18, 0.95, },
		{ "Corvette_hw1", "Graph", 3, 0.965, 4, 0.965, 6, 0.965, 12, 0.95, 18, 0.95, },

		{ "Vgr_MissileCorvette", "Graph", 4, 0.965, 5, 0.965, 8, 0.965, 16, 0.95, 24, 0.95, 29, 0.50 },
		{ "Vgr_LaserCorvette", "Graph", 4, 0.965, 5, 0.965, 8, 0.965, 16, 0.95, 24, 0.95, 29, 0.50 },

   },
    ENGINEACCEL = {

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.85, },
		{ "Corvette_hw1", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.85, },

   },
    ENGINEBRAKE = {

   },
    THRUSTER = {

   },
    THRUSTERACCEL = {

		{ "Fighter", "Graph", 1, 0.90, 25, 0.90},
		{ "Fighter_hw1", "Graph", 1, 0.90, 25, 0.90},

		{ "Vgr_Interceptor", "Graph", 1, 0.90, 25, 0.90},

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.80, 23, 0.80 },
		{ "Corvette_hw1", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.80, 23, 0.80 },

   },
    THRUSTERBRAKE = {

   },
    ROTATION = {

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.80, 23, 0.80 },
		{ "Corvette_hw1", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.80, 23, 0.80 },

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

		{ "Corvette", "Graph", 3, 1.0, 4, 0.98, 6, 0.98, 12, 0.97 },
		{ "Corvette_hw1", "Graph", 3, 1.0, 4, 0.98, 6, 0.98, 12, 0.97 },

		{ "Vgr_LaserCorvette", "Graph", 4, 1.0, 5, 0.98, 8, 0.98, 16, 0.97 },

   },
    WEAPONACCURACY = {
 
   },
    WEAPONDAMAGE = {

		{ "Fighter",AggressiveStance, "Graph", 1, 1.01, 5, 1.01},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 1.01, 5, 1.01},

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 1.01, 7, 1.01, 14, 1.01},

		{ "Vgr_LanceFighter",AggressiveStance, "Graph", 1, 1.01, 5, 1.01},

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

--		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 1.013, 7, 1.014, 14, 1.01, 28, 1.01},

		{ "Fighter",AggressiveStance, "Graph", 1, 1.01, 5, 1.01},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 1.01, 5, 1.01},

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 1.01, 14, 1.01},

		{ "Corvette",AggressiveStance, "Graph", 1, 1.0, 5, 1.01},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.0, 5, 1.01},
 
		{ "Vgr_LaserCorvette",AggressiveStance, "Graph", 1, 1.0, 5, 1.03},

   },
    TURRETSPEED = {
		{ "Corvette",AggressiveStance, "Graph", 1, 1.0, 4, 1.02},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.0, 4, 1.02},

   },
    ACCURACYAPPLIED = {
 
   },
    DAMAGEAPPLIED = {

   },
    FIRERATE = {

		{ "Fighter",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 0.80, 7, 0.80, 14, 0.80},

		{ "Vgr_LanceFighter",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},

		{ "Hgn_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0, 6, 0.98},
		{ "Vgr_Bomber",AggressiveStance, "Graph", 1, 0.90, 6, 0.90, 7, 0.90},

		{ "Kus_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0, 6, 0.98},
		{ "Tai_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0, 6, 0.98},

		{ "Corvette",AggressiveStance, "Graph", 5, 0.98, 6, 0.98 },
		{ "Corvette_hw1",AggressiveStance, "Graph", 5, 0.98, 6, 0.98 },

   },
}

UnitLimit = 30

SupplyLimits =
{
	LayoutFighter = 15,
	LayoutCorvette = 15,
	LayoutFrigate = 5,
	LayoutDestroyer = 3,
	LayoutBattleCruiser = 1,
	LayoutResource = 9,
}
 
strikegroup =
{
	OffsetFromParent = {0,0,0},
	Children =
	{
		{
			OffsetFromParent                           = {0,0.95,-0.2},
		},
		{
			OffsetFromParent                           = {0,-0.95,-0.2},
		},
		{
			OffsetFromParent                           = {0.95,0,-0.2},
		},
		{
			OffsetFromParent                           = {-0.95,0,-0.2},
		},
	},
}
