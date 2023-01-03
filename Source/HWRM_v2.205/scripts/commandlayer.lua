--===========================================================================
--  Purpose : Lua definition file for the homeworld .
--            -contains tunable variables pertinent to the commandlayer
--              and anything related to the commandlayer
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!
--              NOTE: specific command info shouldn't go in here!!!
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- Controls whether ships in a group move order fly at a limited speed
-- or at their normal speed
-- Calculation: 1 - Average postiion of all ships is calculated
--              2 - Average positions of all subgroups (mini groups in the
--                  larger selection group
--              3 - If all the minigroups average positions are all
--                  within the below defined radius, they will move
--                  at their limited velocity (the max speed of the
--                  slowest ship

limitVelocityGroupingRadius = 12000.0;
limitVelocityGroupingRadiusSqr = limitVelocityGroupingRadius*limitVelocityGroupingRadius;


