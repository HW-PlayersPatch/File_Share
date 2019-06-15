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

-- right
paradeSlot("Hgn_AssaultCorvette",       {-1239, -300, 716},      	{0,0,1}, {-1,0,0},      0 );
paradeSlot("Hgn_AssaultCorvetteElite",       {-1239, -100, 716},      	{0,0,1}, {-1,0,0},      0 );
paradeSlot("Hgn_PulsarCorvette",        {-954, -250, 375},      	{0,0,1}, {-1,0,0},      0 );
paradeSlot("Hgn_MinelayerCorvette",     {-1063, -200, 25},     	{0,0,1}, {-1,0,0},      0 );

paradeSlot("Kpr_Mover",       {-925, -108, -547},      	{0,0,1}, {-1,0,0},      150 );
paradeSlot("Hgn_HSInhibitor",       {-923, -110, -345},      	{0,0,1}, {-1,0,0},      0 );

paradeSlot("Hgn_DefenseFieldFrigate",   {949, -436, 405},	    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_AssaultFrigate",        {1334, -636, 1605},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_IonCannonFrigate",      {1112, -536, 1005},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_MarineFrigate",         {1031, -486, 705},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_MarineFrigate_Soban",   {1031, -221, 705},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_SupportFrigate",        {840, -386, 105},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_TorpedoFrigate",        {1224, -586, 1305},    	{0,0,1}, {1,0,0},       0 );



-- left
paradeSlot("Hgn_Scout",                 {-1290, -400, 1557},     	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Interceptor",           {-946, -350, 1284},       {0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_AttackBomber",          {-677, -300, 1025},   {0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_AttackBomberElite",          {-677, -100, 1025},   {0,0,1}, {-1,0,0},      0);

paradeSlot("Hgn_ResourceCollector",     {-927, -86, -739},	 {0,0,1}, {-1,0,0},      150);




paradeSlot("Hgn_Shipyard",		        {-1503, 0, -3404},	{0,0,1}, {-1,0,0},      1000);
paradeSlot("Hgn_Shipyard_SPG",		        {-1503, 0, -3404},	{0,0,1}, {-1,0,0},      1000);
paradeSlot("Hgn_Shipyard_Elohim",		        {-1503, 0, -3404},	{0,0,1}, {-1,0,0},      1000);
paradeSlot("Hgn_ResourceController",    {-927, -86, -939},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Probe",					{-922, 0, -1236},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ECMProbe",					{-921, 0, -1486},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ProximitySensor",				{-922, 0, -1686},	{0,0,1}, {-1,0,0},      0);

paradeSlot("Hgn_Dreadnaught",		{-1283, -439, 2540}, 	{0,0,1}, {1,0,0},      0);
paradeSlot("Sp_Tanker",			{-742, -781, 2468},	{0,0,1}, {0,1,0},      400);
paradeSlot("Sp_Tanker2",		{-1303, -781, 2468},	{0,0,1}, {0,1,0},      400);
paradeSlot("Sp_Tanker4",		{-1879, -781, 2468},	{0,0,1}, {0,1,0},      400);
paradeSlot("Sp_Tanker3",		{-742, -381, 2468},	{0,0,1}, {0,1,0},      400);
paradeSlot("Sp_Tanker5",		{-1303, -381, 2468},	{0,0,1}, {0,1,0},      400);
paradeSlot("Sp_Tanker6",		{-1879, -381, 2468},	{0,0,1}, {0,1,0},      400);
paradeSlot("Hgn_Destroyer",			    {871, -448, 2406}, 	{0,0,1}, {1,0,0},      500);
paradeSlot("Hgn_Battlecruiser",		        {0, -750, 2500},	{0,0,1}, {0,1,0},      750);
--~ paradeSlot("Hgn_Battlecruiser",		    {880, -500, -1516}, 	{0,0,1}, {1,0,0},      1000);
--paradeSlot("Sp_Tanker",		    {880, -66, -1516}, 	{0,0,1}, {1,0,0},      500);

-- up
paradeSlot("Hgn_Carrier",		        {1809, -858, -1823},	{0,0,1}, {0,1,0},      750);
--paradeSlot("Hgn_Carrier",		        {0, -750, 2500},	{0,0,1}, {0,1,0},      750);
paradeSlot("Hgn_GunTurret",           {-364, 0, 296},     	{0,0,1}, {0,1,0},      0);
paradeSlot("Hgn_IonTurret",        {-535, 0, 292},    	{0,0,1}, {0,1,0},      0);

-- REQUIRED "misc" slot
paradeSlot("misc",                      {1700, 600, -650},		{0,0,1}, {1,0,0},      1000);                -- grows right
