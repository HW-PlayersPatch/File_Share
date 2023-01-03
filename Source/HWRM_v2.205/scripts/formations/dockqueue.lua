--===========================================================================
--  Purpose : Lua definition file for homeworld 2.
--            -Dock Queue's formation
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- This file describes the dockqueue formation. The dockqueue is a queue with a number of lines for each family of ships
-- AddDockQueue(familyname, height, spacing)

addDockQueueFamily("Utility",300,300)
addDockQueueFamily("Corvette",300,300)
addDockQueueFamily("Fighter",300,300)
addDockQueueFamily("Frigate",400,400)
addDockQueueFamily("Platform",300,300)
addDockQueueFamily("SuperCap",1000,1000)
addDockQueueFamily("Shipyard",1500,1500)
addDockQueueFamily("Resource",500,500)
addDockQueueFamily("Inhibitor",500,500)
