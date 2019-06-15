PauseScreen = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	clickThrough = 1,
	
	RootElementSettings = {
		--backgroundColor = "FEColorBackground2",
	},
	;
		
	-- Single player pause (just show a text label that says paused)
	{	
		type = "TextLabel",
		name = "m_lblSPPause",
		position = {300,103},
		size = {200,20},
		visible = 1,
		Text = {
			text = "$3560",--GAME PAUSED
			textStyle = "IGHeading1",
			color = {255,255,255,255},
			vAlign = "Middle",
			hAlign = "Center",
		},
	},
}

	