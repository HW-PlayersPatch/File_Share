--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Hgn Carrier Parade formation
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
paradeSlot("Hgn_AssaultCorvette",       {-1045, -2, 875},      	{0,0,1}, {-1,0,0},       0 );
paradeSlot("Hgn_AssaultCorvetteElite",       {-1045, -102, 875},      	{0,0,1}, {-1,0,0},       0 );
paradeSlot("Hgn_PulsarCorvette",        {-759, 48, 534},      	{0,0,1}, {-1,0,0},       0 );
paradeSlot("Hgn_MinelayerCorvette",     {-618, 98, 184},     	{0,0,1}, {-1,0,0},       0 );

paradeSlot("Hgn_DefenseFieldFrigate",   {765, 102, -19},	    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_AssaultFrigate",        {1150, -98, 1181},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_IonCannonFrigate",      {928, 2, 581},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_MarineFrigate",         {847, 52, 281},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_SupportFrigate",        {656, 152, -319},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_TorpedoFrigate",        {1040, -48, 881},    	{0,0,1}, {1,0,0},       0 );

paradeSlot("Hgn_Dreadnaught",		{1156, 100, 1870}, 	{0,0,1}, {1,0,0},      0);

-- right
paradeSlot("Hgn_Scout",                 {-1060, -102, 1629},     	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Interceptor",           {-716, -52, 1356},       	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_AttackBomber",          {-447, -2, 1097},    	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_AttackBomberElite",          {-447, -102, 1097},    	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ResourceCollector",     {-927, 133, -739},	   	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ResourceController",    {-927, 133, -939},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Probe",			{-922, 220, -1236},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ECMProbe",			{-921, 220, -1486},	{0,0,1}, {-1,0,0},      0);

paradeSlot("Kpr_Mover",			{-925, 111, -547},	{0,0,1}, {-1,0,0},     150);
paradeSlot("Hgn_HSInhibitor",			{-923, 109, -345},	{0,0,1}, {-1,0,0},      0);

-- up
paradeSlot("Hgn_GunTurret",           {65, 0, 704},     	{0,0,1}, {0,1,0},      0);
paradeSlot("Hgn_IonTurret",        {-106, 0, 701},    	{0,0,1}, {0,1,0},      0);

-- REQUIRED "misc" slot
paradeSlot("misc",                      {1254, 350, -1250},		{0,0,1}, {1,0,0},      0);                -- grows right
