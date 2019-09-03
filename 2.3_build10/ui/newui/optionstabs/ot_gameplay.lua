--Load expanded options
dofilepath("data:ui/PlayersPatch_UI_Util.lua")
RefCameraPanSpeedScale = GetCameraPanSpeedScale()
RefCameraRotationSpeedScale = GetCameraRotationSpeedScale()
RefCameraMaxZoomScale = GetCameraMaxZoomScale()
RefMissionDifficultyScale = GetMissionDifficultyScale()

-- Resets the additional slider positions
-- This properly handles the Options>Change Sliders>Cancel>Options>Accept scenario
UI_AnchorSetScale('PlayersPatch_CameraPanSpeedScale', RefCameraPanSpeedScale, 1);
UI_AnchorSetScale('PlayersPatch_CameraRotationSpeedScale', RefCameraRotationSpeedScale, 1);
UI_AnchorSetScale('PlayersPatch_CameraMaxZoomScale', RefCameraMaxZoomScale, 1);
UI_AnchorSetScale('PlayersPatch_MissionDifficultyScale', RefMissionDifficultyScale, 1);


----------- Command Panel Buttons ----------
-- OPTION_GAMEPLAY_UISPACER
-- OPTION_GAMEPLAY_ORDERFEEDBACK
-- OPTION_GAMEPLAY_MOUSESENSITIVITY
-- OPTION_GAMEPLAY_MOUSEPAN
-- OPTION_GAMEPLAY_NLIPS
-- OPTION_GAMEPLAY_SELECTIONPRIORITY
-- OPTION_GAMEPLAY_RIGHTCLICKMENU
-- OPTION_GAMEPLAY_SUBTITLES


------- Custom Commands
-- SPACER
OPTION_GAMEPLAY_UISPACER = {
	type = "Frame",
	size = {608, 13},
}

-- ORDER FEEDBACK SLIDER


OPTION_GAMEPLAY_ORDERFEEDBACK		= Option_LabeledSlider("SFXVOLUME",				"$5114",	"lblOrderFeedback",		"$5243",	"m_sbarOrderFeedback",		"$5244")
OPTION_GAMEPLAY_DOTSCALE			= Option_LabeledSlider("DOTSCALE",				"$5475",	"lblDotScale",			"$5475",	"m_sbarDotScale",			"$5476", 1, 1, .1, 3, [[if (SetTacticalDotScale) then SetTacticalDotScale(%spos) end]]) --This had a bug that's been fixed


------- Additional Sliders
OPTION_GAMEPLAY_CAMERAPANSPEED = Option_LabeledSlider("CAMERAPANSPEED", "CAMERA PAN SPEED SCALE", "lblCameraPanSpeed", "CAMERA PAN SPEED SCALE", "m_sbarCameraPanSpeed", "ADJUST CAMERA PAN SPEED SCALE. DEFAULT IS 1. MUST RELAUNCH HOMEWORLD TO TAKE EFFECT.", 1, 1, 1.0, 2.0, [[UI_AnchorSetScale('PlayersPatch_CameraPanSpeedScale', %spos, 1);]])

OPTION_GAMEPLAY_CAMERAROTATIONSPEED = Option_LabeledSlider("CAMERAROTATIONSPEED", "CAMERA ROTATION SPEED SCALE", "lblCameraRotationSpeed", "CAMERA ROTATION SPEED SCALE", "m_sbarCameraRotationSpeed", "ADJUST CAMERA ROTATION SPEED SCALE. DEFAULT IS 1. MUST RELAUNCH HOMEWORLD TO TAKE EFFECT.", 1, 1, 1.0, 2.0, [[UI_AnchorSetScale('PlayersPatch_CameraRotationSpeedScale', %spos, 1);]])

OPTION_GAMEPLAY_CAMERAMAXZOOM = Option_LabeledSlider("CAMERAMAXZOOM", "CAMERA MAX ZOOM SCALE", "lblCameraMaxZoom", "CAMERA MAX ZOOM SCALE", "m_sbarCameraMaxZoom", "ADJUST CAMERA MAX ZOOM SCALE. DEFAULT IS 1. MUST RELAUNCH HOMEWORLD TO TAKE EFFECT.", 1, 1, 1.0, 2.0, [[UI_AnchorSetScale('PlayersPatch_CameraMaxZoomScale', %spos, 1);]])

OPTION_GAMEPLAY_DIFFICULTY = Option_LabeledSlider("DIFFICULTY", "MISSION DIFFICULTY SCALE", "lblDifficulty", "MISSION DIFFICULTY SCALE", "m_sbarDifficulty", "ADJUST MISSION DIFFICULTY SCALE. EASY IS 0, STANDARD IS 1, HARD IS 1.5, EXPERT IS 2+. MUST RESTART MISSION TO TAKE EFFECT.", 1, 1, 0.0, 3.0, [[UI_AnchorSetScale('PlayersPatch_MissionDifficultyScale', %spos, 1);]])


--Fixed the spelling typo, etc, but it still doesn't work.
--Changing the mouseSensitivity is playercfg.lua also doesn't do anything. Likely never fully implemented.
--Original: OPTION_GAMEPLAY_MOUSESENSITIVITY	= Option_LabeledSlider("MOUSESENSATIVITY",		"$5115",	"lblSensitivity",		"$5245",	"m_sbarMouseSensitivity",	"$5246", 0)
--Improved: OPTION_GAMEPLAY_MOUSESENSITIVITY	= Option_LabeledSlider("MOUSESENSITIVITY",		"$5115",	"lblSensitivity",		"$5245",	"m_sbarMouseSensitivity",	"$5246", 1, 1, 0.0, 5.0)

OPTION_GAMEPLAY_MOUSEPAN			= NewCheckBoxButton("m_chkScreenPan",		"$5116", "$5247", nil,  nil, 1 )
OPTION_GAMEPLAY_NLIPS				= NewCheckBoxButton("m_chkNLIPS",			"$5146", "$5248", nil,  nil, 1 )
OPTION_GAMEPLAY_SELECTIONPRIORITY	= NewCheckBoxButton("m_chkMilitarySel",		"$5148", "$5093", nil,  nil, 1 )
OPTION_GAMEPLAY_RIGHTCLICKMENU		= NewCheckBoxButton("m_chkRightClickMenu",	"$5092", "$5091", nil,  nil, 1 )
OPTION_GAMEPLAY_RIGHTCLICKRADIALMENU= NewCheckBoxButton("m_chkRightClickRadialMenu",	"Radial", "Use Radial", nil,  nil, 1 )
OPTION_GAMEPLAY_GROUPSELECTIONBYSTRIKEGROUP = NewCheckBoxButton("m_chkGroupSelectionByStrikegroup",	"$5477", "$5478", nil,  nil, 1 )
OPTION_GAMEPLAY_SUBTITLES			= NewCheckBoxButton("m_chkSubtitles",		"$5087", "$5087", nil,  nil, 1 )
--OPTION_GAMEPLAY_MILITARYSELECTION	= NewCheckBoxButton("m_chkMilitarySelection",		"$5148", "$5093", nil,  nil, 1 )



FE_GAMEPLAYOPTION_TAB = {
	type = "TabPage",
	name = "m_tabGameplay",
	text = "$5113",
	helpTip = "$5240", -- "CHANGE GAMEPLAY AND CAMERA SETTINGS",
	
	Layout = {
		pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
		size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
		pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
		pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
	},

	visible = 0,
	;
					
	{
		type = "Frame",

		Layout = {
			pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
			size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },								
		},
		autoarrange = 1,
		autoarrangeSpace = 2,
		autoarrangeWidth = 612,
		;
						
		-- OPTION FRAMES
						
		OPTION_GAMEPLAY_ORDERFEEDBACK, --#1 in list
		OPTION_GAMEPLAY_DOTSCALE,
		
		--OPTION_GAMEPLAY_UISPACER,
						
		--OPTION_GAMEPLAY_MOUSESENSITIVITY, --doesn't work
		
		-- Additional Sliders
		OPTION_GAMEPLAY_CAMERAPANSPEED,
		OPTION_GAMEPLAY_CAMERAROTATIONSPEED,
		OPTION_GAMEPLAY_CAMERAMAXZOOM,
		OPTION_GAMEPLAY_DIFFICULTY, --#6 in list
						
		OPTION_GAMEPLAY_UISPACER,
						
		OPTION_GAMEPLAY_MOUSEPAN,
		OPTION_GAMEPLAY_NLIPS,
		OPTION_GAMEPLAY_SELECTIONPRIORITY,
		OPTION_GAMEPLAY_RIGHTCLICKMENU,
		--OPTION_GAMEPLAY_RIGHTCLICKRADIALMENU,
		OPTION_GAMEPLAY_GROUPSELECTIONBYSTRIKEGROUP,
		OPTION_GAMEPLAY_SUBTITLES,
		OPTION_GAMEPLAY_MILITARYSELECTION
	},
}

--Sets the initial value/position for the additional sliders. The number in the second bracket must be it's location in the list.
FE_GAMEPLAYOPTION_TAB[1][3][2][1].Text.text = RefCameraPanSpeedScale --initial value in the label
FE_GAMEPLAYOPTION_TAB[1][3][2][2].scrollPosition = RefCameraPanSpeedScale --initial position for the scrollbar
FE_GAMEPLAYOPTION_TAB[1][4][2][1].Text.text = RefCameraRotationSpeedScale --initial value in the label
FE_GAMEPLAYOPTION_TAB[1][4][2][2].scrollPosition = RefCameraRotationSpeedScale --initial position for the scrollbar
FE_GAMEPLAYOPTION_TAB[1][5][2][1].Text.text = RefCameraMaxZoomScale --initial value in the label
FE_GAMEPLAYOPTION_TAB[1][5][2][2].scrollPosition = RefCameraMaxZoomScale --initial position for the scrollbar
FE_GAMEPLAYOPTION_TAB[1][6][2][1].Text.text = RefMissionDifficultyScale --initial value in the label
FE_GAMEPLAYOPTION_TAB[1][6][2][2].scrollPosition = RefMissionDifficultyScale --initial position for the scrollbar
