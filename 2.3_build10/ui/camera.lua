--===========================================================================
--  Name    : Camera.lua
--  Purpose : Lua definition file for Homeworld 2 Camera.
--            Contains various tweakable parameters for the camera module in HW2
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

--Load expanded options
dofilepath("data:ui/PlayersPatch_UI_Util.lua")
RefCameraPanSpeedScale = GetCameraPanSpeedScale()
RefCameraRotationSpeedScale = GetCameraRotationSpeedScale()
RefCameraMaxZoomScale = GetCameraMaxZoomScale()

-- from Camera.cpp
nearClip = 3     -- set this as big as possible without causing clipping problems when zoomed in on small ships
farClip = 440000 -- set this as small as possible, but large enough to see megalith and planets across the universe
verticalFOV = 70 --
cameraDefaultMaxDistance = (6000 * RefCameraMaxZoomScale)			-- How far the camera can zoom out
cameraDistanceMax = (6000 * RefCameraMaxZoomScale)                   -- max distance possible in the in game options screen
cameraDistanceMin = 20                       -- min distance possible in the in game options screen
cameraMaxDeclination     = deg( ((PI*0.5) - 0.01))	-- The steepest angle the camera can get to looking DOWN
cameraMinDeclination     = deg(-((PI*0.5) - 0.01))	-- The steepest angle the camera can get to looking UP

-- from CameraControl.cpp
cameraTrackingAngleSpeedAuto		= 0.05				-- Controls how fast the camera interpolates when automatically controlled
cameraTrackingAngleSpeedUser		= 0.10				-- Controls how fast the camera interpolates when controlled by the user
cameraTrackingPositionSpeed         = 0.02				-- how many camera tracking steps to do in total (Magic Cubic Evaluation)
cameraTrackingPositionThreshold     = 0.2				-- how close to target we are to track (Magic Cubic Evaluation)
cameraTrackingPositionBase          = 2                 -- the logarithmic base in which camera tracking is done (Magic Cubic Evaluation)
cameraTrackingTimeSteps				= 240               -- how many camera tracking steps are done per second
CAM_CUBIC_EVAL_TWEAK				= 3.0				-- tweakable - linear/exponential tracking
CAM_CUBIC_EVAL_ANGLE_TWEAK			= 2.0				-- tweakable - angle tracking

cameraFloatEnableTime               = 3                 -- the number of seconds it takes float to transition on or off
cameraFloatShape                    = 2                 -- affects the pattern of the motion
cameraFloatFrequency				= 0.20              -- the frequency multiplier for camera float
cameraFloatAmplitude				= {0.15, 0.15}	    -- the amplitude multiplier for camera float
cameraFloatDistanceFactor			= 0.005 -- the camera float distance factor

-- from InGameCamera.cpp
cameraZoomFactor					= 2.15				-- This value affects the MOUSEWHEEL zoom rate
cameraZoomDecel						= 0.4				-- This value affects the MOUSEWHEEL zoom rate deceleration
cameraDragZoomScalar				= 3.0              	-- This value affects the Left-Right Drag zoom rate
cameraDragRotateScalar				= (120.0 * RefCameraRotationSpeedScale) -- This value affects the Right Drag camera rotate rate

cameraMouseWheelTrackingTimeSteps	= 240				-- This value affects the MOUSEWHEEL zoom rate
cameraMouseWheelEvalThreshold		= 0.001				-- The threshold at which the mousewheel zoom stops evaluating
cameraMouseWheelZoomTrack			= 0.05				-- How quickly the mousewheel zoom tracks

-- from CameraCommand.cpp
RENDER_VIEWABLE_DISTANCE_SM_SQR		= (300500.0*300500.0)			-- render list distance (the one and only, for now)
RENDER_VIEWABLE_DISTANCE_SQR		= (300500.0*300500.0)			-- render list distance (the one and only, for now)
RENDER_VIEWABLE_DISTANCE_MIN_SQR	= (0.0)							-- render list min distance used in the in game options screen
RENDER_VIEWABLE_DISTANCE_MAX_SQR	= (400000.0*400000.0)			-- render list max distance used in the in game options screen
MAX_CAMERA_STACKS					= 20							-- the maximum number of C/V camera focal points
cameraTwkPanSpeedFactor				= (1.0 * RefCameraPanSpeedScale)		-- the factor (multiplied by camera distance) that defines the pan speed
cameraTwkMinPanSpeed				= 0.0							-- the minimum camera pan speed
cameraTwkMaxPanSpeed				= 10000000						-- the maximum camera pan speed		
cameraTwkPanUnderFactor				= 0.3							-- the factor that determines when to flip the camera under panning direction.  Only applies to PAN_VerticalGoesForwardLocked

panVerticalZone                     = 2.5 / 1024.0                      -- the distance from the edge of the screen before panning starts vertically ( in percentage of the screen )
panHorizontalZone                   = 2.5 / 1024.0                      -- the distance from the edge of the screen before panning starts horizontally ( in percentage of the screen )
panModel                            = PAN_VerticalGoesForwardLocked      -- camera panning model to use.  Choices: PAN_VerticalGoesForward, PAN_VerticalGoesForwardLocked, PAN_VerticalGoesUp
panModifierKey                      = 18                             -- ALT is 18.  If you want another key, you'll have to ask a programmer.  Temporary until proper key bindings is in.

panModifierAction                   = PMA_UpWorld                   -- when the panModifierKey is pressed, this will happen. Choices: PMA_Unused, PMA_Required, PMA_UpWorld, PMA_UpCamera

cameraTwkPanAccelTime               = 6                             -- how long it takes the camera pan to accelerate to max speed
cameraTwkPanAccelCurve              = 1                             -- exponent of the acceleration curve
cameraTwkPanUnfocussedDist          = 1000                           -- if focussed on nothing, pretend zoomed out at least this far for panning purposes
cameraTwkPanDecelTime               = 3

retainDistanceFocusCloser           = 1                 -- retain distance if focussing on an on-screen object that's closer to camera
retainDistanceFocusFarther          = 1                 -- retain distance if focussing on an on-screen object that's farther from camera

farClipCullFactor                   = 0.9               -- factor of the camera's max zoom that will be used for the focus culling radius
