Name = "Vgr_Dart"
ExName = "Movers"

Order = 0.7		-- Controls sort order for ID use.  In the next patch ONLY names will be allowed!
Hint = "$5480"
Title = "$5479"
Hotkey = 106
Icon = {
	texture = "DATA:UI\\NewUI\\Taskbar\\FormationIcons\\form_ico_dart.dds",
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
Tags = "sgf_vgr"

StanceGrouping = "Batch"
StanceGroupingAg = "Shape"
StanceGroupingEv = "Subs"

DeathDamage = 0.90
FriendlyFire = { 0.8, 0.0, 0.0 }       -- Base, Pop, PopSqrt

PopDecay = 0.01

	SpacingRange = 	 { 25, 2.85, 200, 1.71 }
	SpacingRangeAg = { 25, 2.85, 200, 1.71 }
	SpacingRangeEv = { 25, 3.45,  200, 2.0 }
 
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
 
		{ "Vgr_Interceptor", "Graph", 7, 0.88, 8, 0.88, 14, 0.88, 21, 0.88, 28, 0.85},
		{ "Vgr_Bomber", "Graph", 6, 0.88, 7, 0.88, 12, 0.88, 18, 0.88, 24, 0.85},

		{ "Corvette", "Graph", 3, 0.965, 4, 0.965, 6, 0.965, 12, 0.95, 18, 0.95},

		{ "Vgr_MissileCorvette", "Graph", 4, 0.965, 5, 0.965, 8, 0.965, 16, 0.95, 24, 0.95},
		{ "Vgr_LaserCorvette", "Graph", 4, 0.965, 5, 0.965, 8, 0.965, 16, 0.95, 24, 0.95},

   },
    ENGINEACCEL = {

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

		{ "Vgr_Interceptor", "Graph", 7, 0.85, 8, 0.85, 14, 0.85, 21, 0.85, 28, 0.80},

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.80},

   },
    ENGINEBRAKE = {

   },
    THRUSTER = {

   },
    THRUSTERACCEL = {

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

		{ "Vgr_Interceptor", "Graph", 7, 0.85, 8, 0.85, 14, 0.85, 21, 0.85, 28, 0.80},

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.80},

   },
    THRUSTERBRAKE = {

   },
    ROTATION = {

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

		{ "Vgr_Interceptor", "Graph", 7, 0.85, 8, 0.85, 14, 0.85, 21, 0.85, 28, 0.80},

		{ "Corvette", "Graph", 3, 0.85, 4, 0.85, 6, 0.85, 12, 0.85, 18, 0.80},

   },
    ROTATIONACCEL = {

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

		{ "Vgr_Scout", "Graph", 3, 1.0, 4, 0.98, 6, 0.98, 9, 0.97 },

		{ "Vgr_Interceptor", "Graph", 1, 0.98, 8, 0.98, 14, 0.978 },
		{ "Vgr_Bomber", "Graph", 6, 1.0, 7, 0.98, 12, 0.98, 18, 0.97 },

		{ "Vgr_LanceFighter", "Graph", 1, 1.0, 5, 0.98, 6, 0.98, 10, 0.97 },

		{ "Corvette", "Graph", 3, 1.0, 4, 0.98, 6, 0.98, 12, 0.97 },

		{ "Vgr_LaserCorvette", "Graph", 4, 1.0, 5, 0.98, 8, 0.98, 16, 0.97 },

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

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 1.011, 3, 1.011},

		{ "Corvette",AggressiveStance, "Graph", 1, 1.0, 5, 1.01},
 
   },
    TURRETSPEED = {

   },
    ACCURACYAPPLIED = {
   },
    DAMAGEAPPLIED = {
		
   },
    FIRERATE = {

		{ "Fighter",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},

		{ "Vgr_Interceptor",AggressiveStance, "Graph", 1, 0.80, 7, 0.80, 14, 0.80},


		{ "Hgn_AttackBomber",AggressiveStance, "Graph", 1, 0.90, 5, 0.90, 10, 0.90},
		{ "Vgr_Bomber",AggressiveStance, "Graph", 1, 0.90, 6, 0.90, 7, 0.90},

		{ "Kus_AttackBomber",AggressiveStance, "Graph", 1, 0.90, 5, 0.90, 10, 0.90},
		{ "Tai_AttackBomber",AggressiveStance, "Graph", 1, 0.90, 5, 0.90, 10, 0.90},
		
		{ "Corvette",AggressiveStance, "Graph", 5, 0.98, 6, 0.98 },

   },
}

UnitLimit = 20

SupplyLimits =
{
	LayoutFighter = 10,
	LayoutCorvette = 9,
	LayoutFrigate = 4,
	LayoutDestroyer = 2,
	LayoutBattleCruiser = 1,
	LayoutResource = 9,
}

strikegroup =
{
	OffsetFromParent 		= {0,0,0},
	Children =
	{
		-- 'Near' nodes...
		{
			OffsetFromParent 		= {0.377974,0.604651,-0.474651},	
			Children = {{ OffsetFromParent 		= {0.377974,0.604651,-0.74651}, }},
		},
		{
			OffsetFromParent 		= {-0.755881,0.0,-0.474651},
			Children = {{ OffsetFromParent 		= {-0.755881,0.0,-0.74651}, }},
		},
		{
			OffsetFromParent 		= {0.377974,-0.604651,-0.474651},
			Children = {{ OffsetFromParent 		= {0.377974,-0.604651,-0.74651}, }},
		},
		-- 'Far' nodes...
		{
			OffsetFromParent 		= {-0.377974,0.604651,-0.74651},
			Children = {{ OffsetFromParent 		= {-0.377974,0.604651,-0.74651}, }},
		},
		{
			OffsetFromParent 		= {0.755881,0.0,-0.74651},
			Children = {{ OffsetFromParent 		= {0.755881,0.0,-0.74651}, }},
		},
		{
			OffsetFromParent 		= {-0.377974,-0.604651,-0.74651},
			Children = {{ OffsetFromParent 		= {-0.377974,-0.604651,-0.74651}, }},
		},
	},
}
