--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Kad MotherShip Parade formation
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- format   slot-name   vector-offset    vector-heading  vector-direction of growth     size-of-growth (set to 0 if want default)
-- offset determines offset from center of formation
-- heading determines heading, use { 0,0,1 } for forward
-- direction of growth determines how new formations will grow out
-- size of growth determines how spaced out additional formations are.  Set to 0 for default
-- one slot MUST be called "misc", leftovers will get put here


paradeSlot("Kad_Swarmer",	{-805, -525, 1995},	{0,0,1},	{-1,0,0},	70);

paradeSlot("Kad_AdvancedSwarmer",	{-805, -525, 700},	{0,0,1},	{-1,0,0},	105);
paradeSlot("Kad_MultiBeamFrigage",	{-805, -525, 490},	{0,0,1},	{-1,0,0},	105);

paradeSlot("misc",                      	{1050, -525, 700},	{0,0,1},	{1,0,0}, 	525);
