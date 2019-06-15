Name = "Sphere"
Order = 0.9		-- Controls sort order for ID use.  In the next patch ONLY names will be allowed!
Hint = "$4955"
Title = "$5465"
Hotkey = 108
Icon = {
	texture = "DATA:UI\\NewUI\\Taskbar\\FormationIcons\\form_ico_sphere.dds",
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

StanceGrouping = "None"
LayoutMode = "Sphere"

dontPerformActions = 1
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

		{ "Fighter",AggressiveStance,  "Graph", 1, 1.05, 20, 1.05},
		{ "Fighter_hw1",AggressiveStance,  "Graph", 1, 1.05, 20, 1.05},

		{ "Corvette",AggressiveStance,  "Graph", 3, 1.05, 18, 1.05, },
		{ "Corvette_hw1",AggressiveStance,  "Graph",3, 1.05, 18, 1.05, },


   },
    ENGINEACCEL = {

		{ "Fighter", "Graph", 3, 0.80, 18, 0.80, },
		{ "Fighter_hw1", "Graph", 3, 0.80, 18, 0.80, },

		{ "Corvette", "Graph", 3, 0.80, 18, 0.80, },
		{ "Corvette_hw1", "Graph", 3, 0.80, 18, 0.80, },

   },
    ENGINEBRAKE = {

   },
    THRUSTER = {

   },
    THRUSTERACCEL = {

		{ "Fighter", "Graph", 3, 0.80, 18, 0.80, },
		{ "Fighter_hw1", "Graph", 3, 0.80, 18, 0.80, },

		{ "Corvette", "Graph", 3, 0.80, 18, 0.80, },
		{ "Corvette_hw1", "Graph", 3, 0.80, 18, 0.80, },

   },
    THRUSTERBRAKE = {

   },
    ROTATION = {

		{ "Fighter",AggressiveStance,  "Graph", 1, 1.05, 20, 1.05},
		{ "Fighter_hw1",AggressiveStance,  "Graph", 1, 1.05, 20, 1.05},

		{ "Corvette",AggressiveStance,  "Graph", 3, 1.05, 18, 1.05, },
		{ "Corvette_hw1",AggressiveStance,  "Graph",3, 1.05, 18, 1.05, },

   },
    ROTATIONACCEL = {
 
    },
    ROTATIONBRAKE = {

    },
     WEAPONCONE = {

		{ "Fighter_hw1", "Graph", 1, 0.97, 20, 0.97},

		{ "Vgr_LanceFighter", "Graph", 1, 0.95, 20, 0.95},

		{ "Corvette", "Graph", 1, 0.97, 20, 0.97},
		{ "Corvette_hw1", "Graph", 1, 0.97, 20, 0.97},

		{ "Vgr_LaserCorvette", "Graph", 1, 0.95, 20, 0.95},

   },
    WEAPONACCURACY = {
 
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

		{ "Fighter",AggressiveStance, "Graph", 1, 0.80, 5, 0.80},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 0.80, 5, 0.80},

		{ "Corvette",AggressiveStance, "Graph", 1, 0.80, 5, 0.80},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 0.80, 5, 0.80},
 
   },
    TURRETSPEED = {

		{ "Corvette",AggressiveStance, "Graph", 1, 0.80, 4, 0.80},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 0.80, 4, 0.80},

   },
    ACCURACYAPPLIED = {

 		{ "Fighter",AggressiveStance, "Graph", 1, 1.05, 5, 1.05},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 1.05, 5, 1.05},

		{ "Corvette",AggressiveStance, "Graph", 1, 1.20, 5, 1.20},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.20, 5, 1.20},

   },
    DAMAGEAPPLIED = {

		{ "Fighter",AggressiveStance, "Graph", 1, 1.10, 5, 1.10},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 1.10, 5, 1.10},
		
		{ "Corvette",AggressiveStance, "Graph", 1, 1.15, 5, 1.15},
		{ "Corvette_hw1",AggressiveStance, "Graph", 1, 1.15, 5, 1.15},

   },
    FIRERATE = {

		{ "Fighter",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},
		{ "Fighter_hw1",AggressiveStance, "Graph", 1, 0.80, 5, 0.80, 10, 0.80},

		{ "Hgn_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0},
		{ "Vgr_Bomber",AggressiveStance, "Graph", 1, 1.0, 6, 1.0},

		{ "Kus_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 5, 1.0},
		{ "Tai_AttackBomber",AggressiveStance, "Graph", 1, 1.0, 6, 1.0},

		{ "Corvette",AggressiveStance, "Graph", 5, 0.90, 6, 0.90 },
		{ "Corvette_hw1",AggressiveStance, "Graph", 5, 0.90, 6, 0.90 },

		{ "Vgr_LaserCorvette",AggressiveStance, "Graph", 1, 1.05, 20, 1.05},
   },
}
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
    OffsetFromParent         = {0,0,0},
    NumberOfPlaces           = -1,
    CalculateChildren        = "CalcSphere",
    CalculateOffsetDist      = 1.0,
}
