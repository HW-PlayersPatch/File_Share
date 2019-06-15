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
paradeSlot("kpr_mover",                      {-1253.229 , -200 , -0},		{0,0,1}, {1,0,0},      0);                -- grows right

-- REQUIRED "misc" slot
paradeSlot("misc",                      {3275, 168, -3352},		{0,0,1}, {1,0,0},      0);                -- grows right