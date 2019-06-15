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
paradeSlot("Hgn_AssaultCorvette",       {-1896, -103, 445},      	{0,0,1}, {-1,0,0},       0 );
paradeSlot("Hgn_PulsarCorvette",        {-1533, -53, 45},      	{0,0,1}, {-1,0,0},       0 );
paradeSlot("Hgn_MinelayerCorvette",     {-1196, -3, -305},     	{0,0,1}, {-1,0,0},       0 );

paradeSlot("Hgn_DefenseFieldFrigate",   {1118, -46, -445},	    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_AssaultFrigate",        {1503, -246, 755},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_IonCannonFrigate",      {1281, -146, 155},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_MarineFrigate",         {1200, -96, -145},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_SupportFrigate",        {1009, 4, -745},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_TorpedoFrigate",        {1393, -196, 455},    	{0,0,1}, {1,0,0},       0 );

-- right
paradeSlot("Hgn_Scout",                 {-1656, -203, 1295},     	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Interceptor",           {-1311, -153, 995},       	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_AttackBomber",          {-1042, -103, 695},    	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ResourceCollector",     {-927, -86, -739},	   	{0,0,1}, {-1,0,0},      0);


paradeSlot("Hgn_GunTurret",           {-348, 0, 796},     	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_MissilePlatform",       {-200,0,0},	   	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_IonTurret",        {276, 0, 796},    	{0,0,1}, {-1,0,0},      0);

--paradeSlot("Hgn_ShipYard",		        {-200,0,-200},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ResourceController",    {-927, -86, -939},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Probe",			{-922, 0, -1236},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ECMProbe",			{-921, 0, -1486},	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_MotherShip",			{-200,0,-320}, 	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_FlagShip",		        {-200,0,-360},	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_DreadNaught",		    {-200,0,-400}, 	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_Destroyer",			    {-200,0,-440}, 	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_BattleCruiser",		    {-200,0,-480}, 	{0,0,1}, {-1,0,0},      0);
--paradeSlot("Hgn_Carrier",		        {-200,0,-520},	{0,0,1}, {-1,0,0},      0);
-- REQUIRED "misc" slot
paradeSlot("misc",                      {1018, 168, -2000},		{0,0,1}, {1,0,0},      0);                -- grows right
