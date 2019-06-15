
dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

-----------------------------------Defines----------------------------


---------------------- Templates -------------------
			
T_FORMATIONBUTTON = {
	ignored = 1,
	helpTipTextLabel = "commandsHelpTip",
	
	stateIconOfs = { 0.0, 64/512 },
	stateIconCells = { 0, 1, 2, 2, 3, 2, 2, 7 },
	IconBase = MENU_COMMANDBUTTON_GRAPHIC,

	Layout = {		
		size_WH = { w = FORMATIONICON_W, h = FORMATIONICON_H, wr = "px", hr = "px" },			
		pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
	},	
	stateBaseOfs = { 0.0, 128/1024 },
	stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
	soundOnClicked 		= "SFX_ButtonClick",
}



------------------------ THE WINDOW ---------------------

EXAMPLE_BUTTONS = {
		type = "Frame",
		name = "EXAMPLE_BordersUsingTemplate",
		style = "PanelBackgroundStyle",		
		visible = 0,
		
		Layout = {
			pos_XY = {	x = 10, y = 10, xr = "px",	yr = "px"	},	
			size_WH = {	w = 800.0, h = 512.0, wr = "px", hr = "px" },							
		},		

		;
		

		{
			type = "TextButton",
			Layout = {
				size_WH = { w = 512, h = 108, wr = "abs_px", hr = "abs_px" },				
				},
				buttonStyle = "FEButtonStyle1_Outlined",

			},
			--stateIconOfs = { 0.0, 0.0 },
			--stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
			--toggleButton = 1,
			
			--Text = {
			--	textStyle = "RM_TaskbarHD_ButtonTextStyle",					
			--	hAlign = "Center",
			--	vAlign = "Center",					
			--	text = "4453463",
			--},
			-- TintGraphics = 1,	-- This can be handy!

			--BackgroundGraphic = MENU_BUTTON_GRAPHIC,
		
			--textColor			= COLOR_BUTTON_TEXT_DEFAULT,
			--overTextColor			= COLOR_BUTTON_TEXT_HOVER,
			--pressedTextColor			= COLOR_BUTTON_BGRD_PRESSED,
			--disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,
			--autosize=1,
			--name = "btnControlGroup4",			
			--helpTip = "$2761",
			--helpTipTextLabel = "commandsHelpTip",
		--},
		
	}



	
