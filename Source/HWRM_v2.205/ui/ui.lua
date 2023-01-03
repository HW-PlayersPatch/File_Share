--===========================================================================
--  Purpose : Lua definition file for UI tweakables.
--            Contains UI tweakable values
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

--=========================== MainUI Tweaks ====================================

muiTwkFriendlyMouseOverColour               = {0.0, 1.0, 0.25, 1.0}
muiTwkAllyMouseOverColour                   = {1.0, 1.0, 0.0, 1.0}
muiTwkEnemyMouseOverColour                  = {1.0, 0.0, 0.0, 1.0}
muiTwkResourceMouseOverColour               = {0.9, 0.9, 0.3, 1.0}
muiTwkNeutralMouseOverColour                = {0.9, 0.9, 0.3, 1.0}
muiTwkBandboxColour                         = {0.0, 1.0, 1.0, 1.0}
muiTwkShipSelectionBoxColour                = {0.0, 1.0, 1.0, 1.0}
muiTwkHotkeyGroupTextColour                 = {1.0, 1.0, 1.0, 1.0}
muiTwkFriendlyHealthBarColour               = {0.0, 1.0, 0.251, 1.0}
muiTwkFriendlyHealthBarColourHurt           = {1.0, 1.0, 0.0, 1.0}
muiTwkFriendlyHealthBarColourDying          = {1.0, 0.0, 0.0, 1.0}
muiTwkFriendlyHealthBarBackgroundColour     = {0.0, 0.2, 0.0, 1.0}
muiTwkAllyHealthBarColour                   = {1.0, 1.0, 0.0, 1.0};
muiTwkAllyHealthBarBackgroundColour         = {0.0, 0.0, 0.2, 1.0};
muiTwkEnemyHealthBarColour                  = {1.0, 0.0, 0.0, 1.0};
muiTwkEnemyHealthBarBackgroundColour        = {0.2, 0.0, 0.0, 1.0};
muiTwkResourceBarColour						= {0.55, 0.29, 0.03, 1.0}		-- colour of the resource 'healthbar'
muiTwkResourceBarBackgroundColour			= {0.25, 0.13, 0.01, 1.0}		-- colour of the resource bar background
muiTwkLetterBoxStartColour                  = {0,0,0,0.5}                   -- the colour of the letterboxes at the start of the on transition
muiTwkLetterBoxEndColour                    = {0,0,0,1}                     -- the colour of the letterboxes at the end of the on transition
muiTwkWidescreenAspect						= 2.0

muiTwkMinimumHealthBarSize                  = 0.005                         -- the screen width percentage that a healthbar's minimum width should be
muiTwkMinimumSelectionBoxSize               = 0.01                          -- the screen width percentage that a selection box's width/height will be
muiTwkHealthBarLengthFactor                 = 2.0                           -- currently not used
muiTwkShowShipNames                         = 0                             -- set to 1 to show ship name, 0 to not show
muiTwkBandboxWidth                          = 1                             -- number of pixels width of the bandbox
muiTwkMaxTerrainMoveDistance				= 3000000						-- the max distance from the camera a terrain move will register

muiTwkLeftClickCancels						= false							-- if the user clicks the LMB while in move or terrain-move mode it will cancel the order
muiTwkLeftClickAcknowledges					= true							-- if the user clicks the LMB while in move or terrain-move mode it will send the order
muiTwkLeftClickSnaps                        = false                         -- if the user clicks the LMB on the foot of a squadron in move mode it will height-snap to that squad
muiTwkMaxDistanceForGroupSelection			= 2000.0							-- when converting a sob to a group only include related sobs that are within this distance of the original sob

-- If muiTwkBandBoxThreshold is not defined, the system-standard (windows setting) is used instead. If you want to override it, uncomment the next line
--muiTwkBandBoxThreshold						= 0.003							-- threshold in screen space (screen = 0-1) of how many pixels you need to drag before it's treated as a drag

muiTwkMouseClickSpeed						= 3.0							-- nr of seconds before it's treated as a mouse button hold

selectorTwkMinSelectionCircleRadius			= 0.013							-- the minimum selection circle radius a ship will have
selectorTwkSelectionAreaNeeded				= 0.25							-- the amount of area a bandbox has to cover before a ship is 'selecting'
--sensorsSphereTexture						= "ui/textures/sensorTexture.tga"	-- texture that will be displayed on sensors spheres
sensorsSphereMesh							= "ui/meshes/SensorSphere.hod"		-- the SimpleMesh .hod used to draw sensors spheres
muiSensorSphereColourNear					= {0, 0, 1, 0.35}				-- the colour of sensorsSpheres
muiSensorSphereColourFar					= {0, 0, .5, 0.35}				-- the colour of sensorsSpheres
muiSensorSphereIntersectionColour           = {0, 0, 1, 0.90}
muiSensorSphereBattleColourNear				= {1, 0, 0, 0.35}				-- the colour of sensorsSpheres when there is a battle in the sphere
muiSensorSphereBattleColourFar				= {.5, 0, 0, 0.35}				-- the colour of sensorsSpheres when there is a battle in the sphere
muiTwkSensorsFadeTime						= 1.0							-- the number of seconds it takes the sensors to fade on/off
muiTwkSecSensorNoise                        = 0.0                           -- [0..1] the fraction of time a target is lost by secondary sensors
muiTwkHurtHealthValue						= 0.5							-- if the health is greater than this -> in the green
muiTwkDyingHealthValue						= 0.25							-- if the health is greater than this; in the yellow, if lower; in the red

-- mouse over tweak
muiTwkMouseOverAlpha				= 0.3		-- mouse over alpha [0..1]
muiTwkMouseOverPulseAlphaOffset			= 0.3		-- mouse over pulse alpha offset (percentage) [0..1]
muiTwkMouseOverPulseFreqMult			= 3		-- mouse over pulse frequency multiplier [0..10]

--=========================== Waypoint Tweaks =====================================

wayTwkNewWaypointDist               = 2000.0                                -- this distance into the screen that the first waypoint on a path is created at
wayTwkSnapDistance                  = 600.0                                 -- this distance in worldspace of the mouse ray that is 'near' a path
wayTwkHitTestDistance               = 400000.0                              -- the maximum distance from the camera that will register a 'hit', should be near renderlist distance
wayTwkArrowLength                   = 600.0                                 -- the length of the path arrow
wayTwkArrowRadius                   = 200.0                                 -- the radius of the base of the path arrow
wayTwkArrowSides                    = 5                                     -- the number of sides the arrow has
wayTwkArrowNlips                    = 0.00002                               -- amount of nlips on the waypoint arrow
wayTwkDirectionChangeEpsilon        = 0.01                                  -- the amount of parametric distance (0..1) that the cursor has to move before the arrow changes direction
wayTwkPathArrowColour               = {0.0, 1.0, 0.0, 1.0}                  -- colour of waypoint move arrow
wayTwkWaypointNodeColour            = {1.0, 1.0, 0.0, 1.0}                  -- colour of a waypoint
wayTwkWaypointPathColour            = {1.0, 0.0, 0.0, 1.0}                  -- colour of a waypoint path

--=========================== Team Colour Tweaks ==================================

playerTeamColour0                   = {1.0, 1.0, 1.0, 1.0}                  -- team colour for player 1
playerTeamColour1                   = {1.0, 1.0, 1.0, 1.0}                  -- team colour for player 2
playerTeamColour2                   = {1.0, 1.0, 1.0, 1.0}                  -- team colour for player 2
playerTeamColour3                   = {1.0, 1.0, 1.0, 1.0}                  -- team colour for player 2

--=========================== Subtitle System Tweaks ==========================
subtitleTwkScrollDwellStart  = 2.7  -- Time spent on the first card before scrolling
subtitleTwkScrollDwellEnd    = 1.5  -- Time spent on the last card after scrolling
subtitleTwkScrollShortest    = 1.25 -- Minimum scroll duration
subtitleTwkTitleShortest     = 2.0  -- Minimum duration of a subtitle event

--=========================== Objective Ping Tweaks ===========================

pingTwkObjectiveColour				= {1,1,1,1}								-- colour of the Objective pings
pingTwkObjectiveMinSize				= 0.0									-- the min size of the Objective pings in worldspace
pingTwkObjectiveSize				= 1.0									-- the max size of Objective pings in worldspace
pingTwkObjectiveGrowTime			= 1.0									-- the time it takes the ping to grow to full size
pingTwkObjectivePauseTime			= 1.0									-- the time between pings
pingTwkObjectiveMinScreenSize		= 0.01									-- the minimum size of the ping in screen size (percentage)
pingTwkObjectiveMaxScreenSize		= 0.33									-- the maximum size of the ping in screen size (percentage)

pingTwkNewShipColour				= {1,1,0,1}								-- colour of the NewShip pings
pingTwkNewShipMinSize				= 0.0									-- the min size of the NewShip ping
pingTwkNewShipGrowTime				= 1.0									-- the time it takes the ping to grow to full size
pingTwkNewShipPauseTime				= 0.0									-- the time between pings
pingTwkNewShipExpireTime			= 5.0									-- the time it takes the ping to expire
pingTwkNewShipMinScreenSize			= 0.01									-- the minimum size of the ping in screen size (percentage)
pingTwkNewShipMaxScreenSize			= 0.33									-- the maximum size of the ping in screen size (percentage)

pingTwkLabelFont					= "default"								-- the font used to label pings
pingTwkPointerStart					= {0.5, 1.0}							-- the x,y position of the start of the pointer
pingTwkPointerOriginAlpha			= 0.1									-- the alpha value at the origin of the pointer