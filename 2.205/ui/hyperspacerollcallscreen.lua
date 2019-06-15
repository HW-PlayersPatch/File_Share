--
-- Definition of the HW1-style roll call screen
--
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

HyperspaceRollCallScreen = {

	stylesheet = "HW2StyleSheet",	

	--size = { 274, 400, 351, 179},

	Layout = {						
		pivot_XY = { 0.5, 0.5 },					
		pos_XY = {	x=0.5, y=0.7, xr="par", yr="par",},		
	},


	RootElementSettings = {

		autosize  = 1,
		backgroundColor = {0,0,0,200},	
	},

	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	;	


	{
		type = "RmWindow",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText = "$4900", -- Preparing for Hyperspace
		--SubtitleText = "4901"
		autosize  = 1,
		autoarrange = 1,
		arrangetype = "vert",
		arrangedir = 1,	
		--autoarrangeSpace = 2,

		sizetype = "contain",
		;
		
		--{
			--name = "ScarTextLabel",
			--type = "TextLabel",
			--position = {5,5},
			--size = {200, 40},
			--autosize  = 1,
			--Text = {
			--	textStyle = "RM_FEHeading3",
			--	text = "Hyperspace Roll Call", --to localize
				--textStyle = "FEHeading2",
			--},
		--},
	
--   {
--   	name = "RollCallShipsDockedText",
--   	type = "TextLabel",
--   	position = {5,45},
--   	size = {290, 20},
--   	Text = {
--   		text = "$4903",
--   		textStyle = "FEHeading4",
--   	},
--   },
--   {
--   	name = "RollCallShipsDocked",
--   	type = "TextLabel",
--   	position = {165,45},
--   	size = {290, 20},
--   	Text = {
--   		text = "123",  --dynamically generated
--   		textStyle = "FEHeading4",
--   	},
--   },
		{
			name = "RollCallShipsRemainingText",
			type = "TextLabel",
			position = {5,40},
			size = {200, 20},
			Text = {
				text = "$4902",
				textStyle = "FEHeading4",
			},
		},
		{
			name = "RollCallShipsRemaining",
			type = "TextLabel",
			position = {165,40},
			size = {200, 20},
			Text = {
				text = "---",  --dynamically generated
				textStyle = "FEHeading4",
			},
		},

		---------  Buttons   -----------------
		{
			type = "Frame",

			autosize  = 1,
			--autoarrange = 1,
			arrangetype = "horiz",
			--arrangedir = 1,	
			--sizetype = "contain",
			Layout = {
				--margin_LT = { l = 0, t = PANEL_SPACING_VERT, lr = "scr", tr = "scr" },
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
			},		
			;
			-- BUTTONS			
			
			NewMenuButton("RollCallCancel",	"$2613",	"$4906",	0,	BTN_FOOTER_SMALL_LAYOUT,	"FEButtonStyle1",	"MainUI_ScarEvent( \"singlePlayerRollCallCancelButtonPressed()\" )"),
			NewMenuButton("RollCallSkip",	"$4904",	"$4905",	0,	BTN_FOOTER_SMALL_YES_LAYOUT,	"FEButtonStyle1_Alert_Chipped",	"MainUI_ScarEvent( \"singlePlayerRollCallSkipButtonPressed()\" )"),
		},
	},
}

