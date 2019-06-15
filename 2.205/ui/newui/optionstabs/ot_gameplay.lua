
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
OPTION_GAMEPLAY_DOTSCALE			= Option_LabeledSlider("DOTSCALE",				"$5475",	"lblDotScale",			"$5475",	"m_sbarDotScale",			"$5476", 1, 1, .1, 3,[[SetTacticalDotScale(%spos);]])

OPTION_GAMEPLAY_MOUSESENSITIVITY	= Option_LabeledSlider("MOUSESENSATIVITY",		"$5115",	"lblSensitivity",		"$5245",	"m_sbarMouseSensitivity",	"$5246", 0)

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
						
		OPTION_GAMEPLAY_ORDERFEEDBACK,
		OPTION_GAMEPLAY_DOTSCALE,
						
		OPTION_GAMEPLAY_UISPACER,
						
		OPTION_GAMEPLAY_MOUSESENSITIVITY,
						
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