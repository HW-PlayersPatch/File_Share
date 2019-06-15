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
paradeSlot("Kpr_AttackDroid",                 {-1290, -400, 1557},     	 {0,0,1}, {-1,0,0},      0);
paradeSlot("Kpr_MoverCapture",       {-1239, -300, 716},      	{0,0,1}, {-1,0,0},      0 );

-- REQUIRED "misc" slot
paradeSlot("misc",                      {1700, 600, -650},		{0,0,1}, {1,0,0},      1000);                -- grows right
