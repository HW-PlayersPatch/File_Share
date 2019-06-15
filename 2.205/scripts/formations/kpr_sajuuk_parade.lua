--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Kpr Sajuuk Parade formation
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- format   slot-name   vector-offset    vector-heading  vector-direction of growth     size-of-growth (set to 0 if want default)
-- offset determines offset from center of formation
-- heading determines heading, use { 0,0,1 } for forward
-- direction of growth determines how new formations will grow out
-- size of growth determines how spaced out additional formations are.  Set to 0 for default
-- one slot MUST be called "misc", leftovers will get put here

-- right
paradeSlot("Hgn_AssaultCorvette",       {-1896, -300, 750},      	{0,0,1}, {-1,0,0},      0 );
paradeSlot("Hgn_PulsarCorvette",        {-1533, -250, 350},      	{0,0,1}, {-1,0,0},      0 );
paradeSlot("Hgn_MinelayerCorvette",     {-1196, -200, 0},     	{0,0,1}, {-1,0,0},      0 );
paradeSlot("Kpr_Mover",       {-996, -200, -350},      	{0,0,1}, {-1,0,0},      0 );
paradeSlot("Hgn_HSInhibitor",       {-500, 0, 00},      	{0,0,1}, {-1,0,0},      0 );

paradeSlot("Hgn_DefenseFieldFrigate",   {1118, -436, 455},	    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_AssaultFrigate",        {1503, -636, 1655},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_IonCannonFrigate",      {1281, -536, 1055},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_MarineFrigate",         {1200, -486, 755},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_SupportFrigate",        {1009, -386, 155},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_TorpedoFrigate",        {1393, -586, 1355},    	{0,0,1}, {1,0,0},       0 );



-- left
paradeSlot("Hgn_Scout",                 {-1656, -400, 1600},     	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Interceptor",           {-1311, -350, 1300},       {0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_AttackBomber",          {-1042, -300, 1000},   {0,0,1}, {-1,0,0},      0);

paradeSlot("Hgn_ResourceCollector",     {-927, -86, -739},	 {0,0,1}, {-1,0,0},      150);


paradeSlot("Hgn_GunTurret",           {-348, -584, 796},     	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_MissilePlatform",       {-400,0,0},	   	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_IonTurret",        {276, -584, 796},    	{0,0,1}, {-1,0,0},      0);

paradeSlot("Hgn_Shipyard",		        {1200, 0, -4004},	{0,0,1}, {-1,0,0},      1000);
paradeSlot("Hgn_ResourceController",    {-927, -86, -939},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Probe",					{-922, 0, -1236},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ECMProbe",					{921, 0, -1486},	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_MotherShip",			{-400,0,-640}, 	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_FlagShip",		        {-400,0,-720},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Dreadnaught",		{1156, 100, 1870}, 	{0,0,1}, {1,0,0},      0);
--paradeSlot("Hgn_Dreadnaught",		    {701, -8, -10}, 	{0,0,1}, {1,0,0},      0);
paradeSlot("Hgn_Destroyer",			    {1200, -258, -539}, 	{0,0,1}, {1,0,0},      500);
paradeSlot("Hgn_Battlecruiser",		    {1400, -66, -1465}, 	{0,0,1}, {1,0,0},      750);
paradeSlot("Hgn_Carrier",		        {0, 530, -4004},	{0,0,1}, {0,1,0},      750);

-- REQUIRED "misc" slot
paradeSlot("misc",                      {3275, 168, -3352},		{0,0,1}, {1,0,0},      0);                -- grows right