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
paradeSlot("Hgn_AssaultCorvette",       {1000,0,200},      	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_PulsarCorvette",        {1000,0,0},      	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_MinelayerCorvette",     {1000,0,-200},     	{0,0,1}, {1,0,0},       0 );

paradeSlot("Hgn_AssaultFrigate",        {1000,0,200},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_DefenseFieldFrigate",   {1000,0,0},	    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_IonCannonFrigate",      {1000,0,-200},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_MarineFrigate",         {1000,0,-400},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_SupportFrigate",        {1000,0,-600},    	{0,0,1}, {1,0,0},       0 );
paradeSlot("Hgn_TorpedoFrigate",        {1000,0,-800},    	{0,0,1}, {1,0,0},       0 );

-- REQUIRED "misc" slot
paradeSlot("misc",                      {1000,0,-4000},		{0,0,1}, {-1,0,0},      0);                -- grows right

-- right
paradeSlot("Hgn_Scout",                 {-1000,0,200},     	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Interceptor",           {-1000,0,0},       	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_AttackBomber",          {-1000,0,-200},    	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ResourceCollector",     {-1000,0,-400},	   	{0,0,1}, {-1,0,0},      0);


paradeSlot("Hgn_GunTurret",           {-1000,0,200},     	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_IonTurret",        {-1000,0,-200},    	{0,0,1}, {-1,0,0},      0);

paradeSlot("Hgn_ShipYard",		        {-1000,0,-1000},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_ResourceController",    {-1000,0,-1200},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Probe",					{-1000,0,-1400},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_MotherShip",			{-1000,0,-1600}, 	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_FlagShip",		        {-1000,0,-1800},	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_DreadNaught",		    {-1000,0,-2000}, 	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Destroyer",			    {-1000,0,-2200}, 	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_BattleCruiser",		    {-1000,0,-2400}, 	{0,0,1}, {-1,0,0},      0);
paradeSlot("Hgn_Carrier",		        {-1000,0,-2600},	{0,0,1}, {-1,0,0},      0);
