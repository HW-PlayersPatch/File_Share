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

Formation = "claw";

formationSlot({0,0,0}, {0,0,1}, {0,1,0} );

formationSlot({1, 1, 	0.8}, {0,0,1}, {0,1,0} );
formationSlot({-1,1, 	0.8}, {0,0,1}, {0,1,0} );
formationSlot({1, -1,	0.8}, {0,0,1}, {0,1,0} );
formationSlot({-1,-1,	0.8}, {0,0,1}, {0,1,0} );

formationSlot({2, 2,	2.0}, {0,0,1}, {0,1,0} );
formationSlot({-2,2,	2.0}, {0,0,1}, {0,1,0} );
formationSlot({2, -2,	2.0}, {0,0,1}, {0,1,0} );
formationSlot({-2,-2,	2.0}, {0,0,1}, {0,1,0} );

formationSlot({3, 3,	3.4}, {0,0,1}, {0,1,0} );
formationSlot({-3,3,	3.4}, {0,0,1}, {0,1,0} );
formationSlot({3, -3,	3.4}, {0,0,1}, {0,1,0} );
formationSlot({-3,-3,	3.4}, {0,0,1}, {0,1,0} );

formationSlot({4, 4,	5.0}, {0,0,1}, {0,1,0} );
formationSlot({-4,4,	5.0}, {0,0,1}, {0,1,0} );
formationSlot({4, -4,	5.0}, {0,0,1}, {0,1,0} );
formationSlot({-4,-4,	5.0}, {0,0,1}, {0,1,0} );

formationSlot({5, 5,	6.8}, {0,0,1}, {0,1,0} );
formationSlot({-5,5,	6.8}, {0,0,1}, {0,1,0} );
formationSlot({5, -5,	6.8}, {0,0,1}, {0,1,0} );
formationSlot({-5,-5,	6.8}, {0,0,1}, {0,1,0} );


