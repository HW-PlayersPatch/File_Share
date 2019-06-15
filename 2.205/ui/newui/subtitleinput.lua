dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

SubtitleInputScreen = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		eventOpaque=0,
	},	

	;
	-- OK button
	{
		type = "TextButton",
		position = {0, 0},
		buttonStyle = "FEButtonStyle1_Alert_Chipped",
		toggleButton = 0,
		
		Layout = {	
			pos_XY = { x = 0.5, y = 0, xr = "par", yr = "px" },	
			size_WH = {	w = NAVIGATION_BUTTON_WIDTH/2, h = STD_BUTTON_HEIGHT/1.5, wr = "scr", hr = "scr" },					
			pivot_XY = { 0.5, 0 },
		},
		
		Anchor_Binds = {
			pivotY = "Subtitle_SpeechBottomCenter",
			pivotX = "Subtitle_SpeechBottomCenter",
		},

		Text = {
			text = "$3614", 
			textStyle = "RM_TaskbarHD_ButtonTextStyle_Red",
		},
		name = "btnSubtitleOk",
		onMouseClicked = "MainUI_UserEvent( eSubtitleOk )",
	},
}
