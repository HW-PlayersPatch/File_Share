--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Vgr Carrier Parade formation
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
paradeSlot("Vgr_Bomber", {-1592, -50, 238},	 {0,0,1}, {-1,0,0},      400);
paradeSlot("Vgr_CommandCorvette", {-2102, 170, -1452},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_Interceptor", {-1332, -95, 635},	 {0,0,1}, {-1,0,0},      400);
paradeSlot("Vgr_LanceFighter", {-1805, -0, -150},	 {0,0,1}, {-1,0,0},      400);
paradeSlot("Vgr_LaserCorvette", 	{-1626, 0, -641},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_MinelayerCorvette", {-2392, 305, -1922},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_MissileCorvette", {-1839, 87, -1053},	 {0,0,1}, {-1,0,0},      0);

paradeSlot("Vgr_ResourceCollector", 	{-470, 350, -2515},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_ResourceController", {0, 267, -2993},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_Scout", 	{-1125, -143, 991},	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Vgr_HyperSpace_Platform", {703, 183, -2522},	{0,0,1}, {-1,0,0},      0);

-- right
paradeSlot("Vgr_AssaultFrigate", {735, -148, 959},	{0,0,1}, {1,0,0},       0 );
paradeSlot("Vgr_HeavyMissileFrigate", {1112, -74, 311},	{0,0,1}, {1,0,0},       0 );
paradeSlot("Vgr_InfiltratorFrigate", {1508, -5, -375},	{0,0,1}, {1,0,0},       0 );
paradeSlot("Vgr_TransportFrigate", 	{1837, 111, -1125}, {0,0,1}, {1,0,0},       0 );



-- up
paradeSlot("Vgr_Probe", 	{-170, 0, -1881},	 {0,0,1}, {0,1,0},      0);
paradeSlot("Vgr_Probe_ECM", {-413, 0, -1458},	 {0,0,1}, {0,1,0},      0);
paradeSlot("Vgr_Probe_Prox", {260, 0, -1485},	 {0,0,1}, {0,1,0},      0);
paradeSlot("Vgr_WeaponPlatform_gun", 	{-240, -306, 1021},	{0,0,1}, {0,1,0},      0);
paradeSlot("Vgr_WeaponPlatform_missile", 	{216, -306, 1025},	{0,0,1}, {0,1,0},      0);


-- REQUIRED "misc" slot
paradeSlot("misc",                      {5208, 0, -4878},         {0,0,1}, {-1,0,0},      0);                -- grows right
