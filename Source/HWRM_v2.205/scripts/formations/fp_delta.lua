--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Delta formation
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- format   slot-number   vector-offset    vector-heading    vector-up
-- slot-number ranges from 1..Number of Slots
-- offset determines offset from center of formation
-- heading and up determine coordinate system of ship

Formation = "delta";
Default = 1;

formationSlot({0,0,0}, {0,0,1}, {0,1,0} );
formationSlot({1,0,-1}, {0,0,1}, {0,1,0} );
formationSlot({-1,0,-1}, {0,0,1}, {0,1,0} );
formationSlot({2,0,-2}, {0,0,1}, {0,1,0} );
formationSlot({-2,0,-2}, {0,0,1}, {0,1,0} );
formationSlot({3,0,-3}, {0,0,1}, {0,1,0} );
formationSlot({-3,0,-3}, {0,0,1}, {0,1,0} );
formationSlot({4,0,-4}, {0,0,1}, {0,1,0} );
formationSlot({-4,0,-4}, {0,0,1}, {0,1,0} );
formationSlot({5,0,-5}, {0,0,1}, {0,1,0} );
formationSlot({-5,0,-5}, {0,0,1}, {0,1,0} );
formationSlot({6,0,-6}, {0,0,1}, {0,1,0} );
formationSlot({-6,0,-6}, {0,0,1}, {0,1,0} );
formationSlot({7,0,-7}, {0,0,1}, {0,1,0} );
formationSlot({-7,0,-7}, {0,0,1}, {0,1,0} );
formationSlot({8,0,-8}, {0,0,1}, {0,1,0} );
formationSlot({-8,0,-8}, {0,0,1}, {0,1,0} );
formationSlot({9,0,-9}, {0,0,1}, {0,1,0} );
formationSlot({-9,0,-9}, {0,0,1}, {0,1,0} );



