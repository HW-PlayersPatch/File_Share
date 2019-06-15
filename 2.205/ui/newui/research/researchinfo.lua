INFO_WIDTH = 210
INFO_OUTLINECOLOR = {124,200,196,255}

ResearchInfo = {
	size = {0, 0, INFO_WIDTH, 66},
	resolution = {800, 600},
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		autosize = 1,
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	;
	
	{
		type = "Frame",
		autoarrange = 1,	
		autoarrangeWidth = INFO_WIDTH,
		autosize = 1,
		;
		
		-- spacer
		{
			type = "Frame",
			size = {INFO_WIDTH+4, 1},
		},
		
		-- header w / title
		{
			type = "TextLabel",
			name = "lblName",
			size = {INFO_WIDTH, 13},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\popup_borders.mres",
				textureUV = {0,0,210,13},
				color = INFO_OUTLINECOLOR,
			},
						
			Text = {
				text = "$3120",
				font = "ListBoxItemFont",
				vAlign = "Middle",
				hAlign = "Left",
				offset = {4,0},
				color = {0,0,0,255},
			}
		},
		
		-- Item tray (holds small show all items)
		{
			type = "Frame",
			name = "frmSmallShipItems",
			autosize = 1,
			autoarrange = 1,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\popup_borders.mres",
				textureUV = {0,14,210,24},
				color = INFO_OUTLINECOLOR,
			},
			;
			-- Description
			{
				type = "TextLabel",
				name = "lblDescription",		
				size = {INFO_WIDTH, 0}, -- will autosize height
				Text = {
					text = "%s",
					textStyle = "ResearchInfoTextStyle",
				},
				wrapping = 1,
				autosize = 1,
				marginWidth = 3,
				marginHeight = 3,
			},
		},
		-- footer
		{
			type = "Frame",
			size = {INFO_WIDTH, 5},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\popup_borders.mres",
				textureUV = {0,28,210,32},
				color = INFO_OUTLINECOLOR,
			},
		},
	},
}
