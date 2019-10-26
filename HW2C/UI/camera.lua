-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

nearClip = 3
farClip = 440000
verticalFOV = 70

cameraDefaultMaxDistance = 6000
cameraDistanceMax = 6000
cameraDistanceMin = 20
cameraMaxDeclination = deg(((PI * 0.5) - 0.01))
cameraMinDeclination = deg(-((PI * 0.5) - 0.01))
cameraTrackingAngleSpeedAuto = 0.05
cameraTrackingAngleSpeedUser = 0.1
cameraTrackingPositionSpeed = 0.02
cameraTrackingPositionThreshold = 0.2
cameraTrackingPositionBase = 2
cameraTrackingTimeSteps = 240

CAM_CUBIC_EVAL_TWEAK = 3
CAM_CUBIC_EVAL_ANGLE_TWEAK = 2

cameraFloatEnableTime = 3
cameraFloatShape = 2
cameraFloatFrequency = 0.2
cameraFloatAmplitude = {0.15, 0.15}
cameraFloatDistanceFactor = 0.005
cameraZoomFactor = 2.15
cameraZoomDecel = 0.4
cameraDragZoomScalar = 3
cameraDragRotateScalar = 120
cameraMouseWheelTrackingTimeSteps = 240
cameraMouseWheelEvalThreshold = 0.001
cameraMouseWheelZoomTrack = 0.05

RENDER_VIEWABLE_DISTANCE_SM_SQR = (300500 * 300500)
RENDER_VIEWABLE_DISTANCE_SQR = (300500 * 300500)
RENDER_VIEWABLE_DISTANCE_MIN_SQR = 0
RENDER_VIEWABLE_DISTANCE_MAX_SQR = (400000 * 400000)

MAX_CAMERA_STACKS = 20

cameraTwkPanSpeedFactor = 1
cameraTwkMinPanSpeed = 0
cameraTwkMaxPanSpeed = 10000000
cameraTwkPanUnderFactor = 0.3

panVerticalZone = (2.5 / 1024)
panHorizontalZone = (2.5 / 1024)
panModel = PAN_VerticalGoesForwardLocked
panModifierKey = 18
panModifierAction = PMA_UpWorld

cameraTwkPanAccelTime = 6
cameraTwkPanAccelCurve = 1
cameraTwkPanUnfocussedDist = 1000
cameraTwkPanDecelTime = 3

retainDistanceFocusCloser = 1
retainDistanceFocusFarther = 1

farClipCullFactor = 0.9
