--  hw2 formation exporter generated file
--=============================================================================
--  Name    : Staggered_Wall.lua
--  Purpose : Lua definition file for formations in homeworld 2.
--
--
--  Created Wednesday, July 09, 2003 by the formation exporter.
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--=============================================================================

--  format   slot-number   vector-offset   vector-heading   vector-up
--  slot-number ranges from [0, number of slots).
--  offset determines offset from centre of formation.
--  heading and up determine coordinate system of ship.
Formation = "Staggered_Wall";
formationSlot( {-0.600,0.377,0.000}, {0.000,0.000,1.000}, {0.000,1.000,0.000} );
formationSlot( {0.600,0.393,0.000}, {0.000,0.000,1.000}, {0.000,1.000,0.000} );
formationSlot( {-0.400,-0.383,-1.869}, {0.000,0.000,1.000}, {0.000,1.000,0.000} );
formationSlot( {0.400,-0.383,-1.869}, {0.000,0.000,1.000}, {0.000,1.000,0.000} );
