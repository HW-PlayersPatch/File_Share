LABEL_POS = {0, 481}
LABEL_SIZE = {800, 19}

GameOverScreen = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	-- hide the subtitle screen so we can show the exit text, where the subtitles go
	onShow = "UI_HideScreen('SubtitleScreen')",
	
	RootElementSettings = {
		backgroundColor = "FEColorBackground2",
	},
	;
		
	-- Victory
	{	
		type = "TextLabel",
		name = "m_lblVictory",
		position = LABEL_POS,
		size = LABEL_SIZE,
		visible = 0,
		Text = {
			text = "$3615",--YOUR FLEET IS VICTORIOUS
			textStyle = "IGHeading1",
			color = {255,255,255,255},
			vAlign = "Top",
			hAlign = "Center",
		},
	},
	
	-- Defeat
	{	
		type = "TextLabel",
		name = "m_lblDefeat",
		position = LABEL_POS,
		size = LABEL_SIZE,
		visible = 0,
		Text = {
			text = "$3616",--YOUR FLEET HAS BEEN DEFEATED
			textStyle = "IGHeading1",
			color = {255,255,255,255},
			vAlign = "Top",
			hAlign = "Center",
		},
	},
	
	
	-- Exiting
	{	
		type = "TextLabel",
		name = "m_lblExit",
		position = LABEL_POS,
		size = LABEL_SIZE,
		visible = 0,
		Text = {
			text = "$3617",--EXITING
			textStyle = "IGHeading1",
			color = {255,255,255,255},
			vAlign = "Top",
			hAlign = "Center",
		},
	},
	
}

	