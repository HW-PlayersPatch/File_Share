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

Formation = "broad";

formationSlot({ 0,    0,0}, {0,0,1}, {0,1,0} );
formationSlot({ 1,  .25,0}, {0,0,1}, {0,1,0} );
formationSlot({-1,  .25,0}, {0,0,1}, {0,1,0} );
formationSlot({ 2,   .5,0}, {0,0,1}, {0,1,0} );
formationSlot({-2,   .5,0}, {0,0,1}, {0,1,0} );
formationSlot({ 3,  .75,0}, {0,0,1}, {0,1,0} );
formationSlot({-3,  .75,0}, {0,0,1}, {0,1,0} );
formationSlot({ 4,    1,0}, {0,0,1}, {0,1,0} );
formationSlot({-4,    1,0}, {0,0,1}, {0,1,0} );
formationSlot({ 5, 1.25,0}, {0,0,1}, {0,1,0} );
formationSlot({-5, 1.25,0}, {0,0,1}, {0,1,0} );
formationSlot({ 6,  1.5,0}, {0,0,1}, {0,1,0} );
formationSlot({-6,  1.5,0}, {0,0,1}, {0,1,0} );
formationSlot({ 7, 1.75,0}, {0,0,1}, {0,1,0} );
formationSlot({-7, 1.75,0}, {0,0,1}, {0,1,0} );
formationSlot({ 8,    2,0}, {0,0,1}, {0,1,0} );
formationSlot({-8,    2,0}, {0,0,1}, {0,1,0} );
formationSlot({ 9, 2.25,0}, {0,0,1}, {0,1,0} );
formationSlot({-9, 2.25,0}, {0,0,1}, {0,1,0} );


