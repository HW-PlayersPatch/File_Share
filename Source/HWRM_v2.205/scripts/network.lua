--===========================================================================
--  Name    : Camera.lua
--  Purpose : Lua definition file for Homeworld 2 Network.
--            Contains various tweakable parameters for the network related module
--            Captain, GamePlayer, Heartbeat and migration
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- from Heartbeat.cpp
Heartbeat_sendIamAlive      = 3000       -- send an alive game msg after X milliseconds

Heartbeat_aliveTime         = 10000      -- countdown for the alive phase in milliseconds before being dying. 
                                         -- each time a gamemsg is received, the countdown is restarted. Must be greater than ms_sendIamAlive

Heartbeat_dyingTime         = 5000       -- countdown for the dying phase in milliseconds before being dead. 
                                         -- the countdown is restarted and set to alive phase if a gameMsg is received

Migration_timeEstablishingConnection = 5000  -- time (in millisecond) allowed to try to connect with a host before trying with another one
Migration_timeConnected              = 5000  -- time (in millisecond) allowed to stay connected with a host without receiving any new notification from him
Migration_timeAcceptingConnection    = 10000 -- time (in millisecond) allowed to let player connect with the host
Migration_maxLoopOnCaptainList       = 2     -- max nb of time allowed to loop on the captain list before failing to migrate