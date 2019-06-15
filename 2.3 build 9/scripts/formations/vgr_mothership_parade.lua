--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Hgn MotherShip Parade formation
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- format   slot-name   vector-offset    vector-heading  vector-direction of growth     size-of-growth (set to 0 if want default)
-- offset determines offset from center of formation
-- heading determines heading, use { 0,0,1 } for forward
-- direction of growth determines how new formations will grow out
-- size of growth determines how spaced out additional formations are.  Set to 0 for default
-- one slot MUST be called "misc", leftovers will get put here


-- left
paradeSlot("Vgr_Bomber", {-1325, -50, 1868},	 {0,0,1}, {-1,0,0},      400);
paradeSlot("Vgr_CommandCorvette", {-1836, 170, 178},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_Interceptor", {-1065, -95, 2265},	 {0,0,1}, {-1,0,0},      400);
paradeSlot("Vgr_LanceFighter", {-1538, -0, 1480},	 {0,0,1}, {-1,0,0},      400);
paradeSlot("Vgr_LaserCorvette", 	{-1360, 0, 989},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_MinelayerCorvette", {-2125, 305, -292},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_MissileCorvette", {-1572, 87, 578},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_Probe", 	{-737, 0, -3097},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_Probe_ECM", {-981, 0, -2674},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_Probe_Prox", {-580, 0, -3518},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_ResourceCollector", 	{1268, 350, -1397},	 {0,0,1}, {1,0,0},      0);
paradeSlot("Vgr_ResourceController", {1007, 267, -1801},	 {0,0,1}, {1,0,0},      0);
paradeSlot("Vgr_Scout", 	{-859, -143, 2622},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_HyperSpace_Platform", {-1162, 183, -2233},	{0,0,1}, {-1,0,0},      0);


-- right
paradeSlot("Vgr_AssaultFrigate", {759, -148, 2518},	{0,0,1}, {1,0,0},       0 );
paradeSlot("Vgr_BattleCruiser", {2078, 392, -3041},	{0,0,1}, {1,0,0},       1200 );
paradeSlot("Vgr_Destroyer", {2129, 416, -568},	{0,0,1}, {1,0,0},       490 );
paradeSlot("Vgr_HeavyMissileFrigate", {1136, -74, 1869},	{0,0,1}, {1,0,0},       0 );
paradeSlot("Vgr_InfiltratorFrigate", {1532, -5, 1184},	{0,0,1}, {1,0,0},       0 );
paradeSlot("Vgr_ShipYard", 	{-1821, 424, -3043},	{0,0,1}, {1,0,0},       0 );
--paradeSlot("Vgr_TransportFrigate", 	{1862, 111, 434}, {0,0,1}, {1,0,0},       0 );



-- up
paradeSlot("Vgr_Carrier", {0, -371, 2782},	{0,0,1}, {0,1,0},      1000);
paradeSlot("Vgr_WeaponPlatform_gun", 	{-213, -306, 1685},	{0,0,1}, {0,1,0},      0);
paradeSlot("Vgr_WeaponPlatform_missile", 	{243, -306, 1689},	{0,0,1}, {0,1,0},      0);


-- REQUIRED "misc" slot
paradeSlot("misc",                      {5208, 0, -4878},         {0,0,1}, {-1,0,0},      0);                -- grows right
