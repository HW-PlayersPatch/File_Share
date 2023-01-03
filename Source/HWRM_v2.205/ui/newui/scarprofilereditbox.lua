ScarProfilerEditBox = {
	size = {110, 110, 366, 250},
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		backgroundColor = {0,0,100,255},		
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	;	
	
	{
		name = "ScarTextLabel",
		type = "TextLabel",
		position = {5,5},
		size = {290, 40},
		Text = {
			text = "Replace this text dynamically",
			textStyle = "FEHeading4",
			color = { 255, 255, 255, 255},
		},
	},
	
	{
		name = "ScarTextInput",
		type = "TextInput",
		position = {5,45},
		size = {290, 20},
		Text = {
			text = "also replace me!",
			textStyle = "FEHeading4",
			color = { 255, 255, 255, 255},
		},
	},
	
	{
		name = "ScarTextInputOk",
		type = "TextButton",
		position = {5, 85},
		buttonStyle = "FEButtonStyle2",
		Text = {
			text = "ACCEPT",
			textStyle = "FEButtonTextStyle",
			color = { 255, 255, 255, 255},
		},
		
	},
	{
		name = "ScarTextInputCancel",
		type = "TextButton",
		position = {5, 100},
		buttonStyle = "FEButtonStyle2",
		Text = {
			text = "CANCEL",
			textStyle = "FEButtonTextStyle",
			color = { 255, 255, 255, 255},
		},
		
	},
}
	