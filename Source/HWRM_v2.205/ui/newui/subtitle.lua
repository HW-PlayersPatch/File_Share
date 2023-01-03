SubtitleScreen = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	clickThrough = 1,

	RootElementSettings = {
		-- by default, the screen would darken when it's disabled;
		-- we want to disable the subtitle screen without it getting darkened so
		--   we override the default disable background graphic
		DisabledGraphic = {
			size = {800, 600},
			texture = "DATA:UI\\NewUI\\clearBG.tga",
			textureUV = { 0, 0, 1, 1 },
		},		
		eventOpaque=0,
	},

	;

	-- OK button
	--{
	--	type = "TextButton",
	--	ignored=1,
	--	toggleButton = 0,
	--	position = {690, 100},
	--	buttonStyle = "FEButtonStyle1_Alert_Chipped",	
		
	--	Text = {
	--		text = "$3614", 
	--		textStyle = "RM_TaskbarHD_ButtonTextStyle_Red",
	--	},
	--	name = "btnSubtitleOk",
	--	onMouseClicked = "MainUI_UserEvent( eSubtitleOk )",
	--	visible = 0,
	--},

	-- Region 0
	{
		type = "Frame",
		name = "Region0_Frame",
		position = { 0, 0 },
		size = { 800, 600 },
		giveParentMouseInput = 1,	-- we don't want to capture input
		
		--borderWidth = 2,
		--backgroundColor = { 128, 64, 64, 128 },
		--disabledBorderColor = { 255, 0, 0, 255},
		;
	
		-- text
		{
			type = "TextLabel",
			name = "Region0_Text",
	
			position = {0, 0},
			size = { 800, 600 },
			Text = {
				textStyle = "SubtitleSPTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Left",
				text = "Region 0 text",
			},
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
		},
	},


	-- Region 1 (letter box)
	{
		type = "Frame",
		name = "Region1_Frame",

		Layout = {	
			pos_XY = { x = .5, y = 32/600, xr = "par", yr = "scr" },	
			--size_WH = { w = 0.2, wr = "par" },
			size_WH = { w = 0.8, h = 20, wr = "par", hr = "px" },
			min_WH = { w = 0.8, h = 80/600, wr = "par", hr = "scr" },
			--max_WH = { w = 0.8, h = 180, wr = "par", hr = "px" },
			pivot_XY = { 0.5, 0 },
		},	
		autosize=1,
		giveParentMouseInput = 1,	-- we don't want to capture input
		
		--borderWidth = 2,
		--disabledBorderColor = { 0, 255, 0, 255},
		--backgroundColor = { 128, 64, 64, 128 },
		--disabledColor = { 128, 64, 64, 128 },
		arrangetype = "vert",
		arrangeSep = {	x=0, y= 8/600, xr="scr", yr="scr"},
		
		Anchor_Spawns = {
			{
				anchorName = "Subtitle_SpeechBottomCenter",
				relativePos = { .5, 1.0 },
			},		
		},

		;

		-- icon
		{
			type = "Frame",
			name = "Region1_Icon",
			--position = { 0, 0 },
			size = { 100, 50 },
			BackgroundGraphic = {
				size = { 100, 50 },
				texture = "DATA:UI\\logo.tga",
				textureUV = { 0, 0, 1, 1 },
			},

			Layout = {	
				pos_XY = { x = .5, y = 0, xr = "par", yr = "par" },	
					--size_WH = { w = 0.2, wr = "par" },
					--size_WH = { w = 0.65, h = 80, wr = "par", hr = "px" },
					pivot_XY = { 0.5, 0.0 },
			},
			
			--backgroundColor = { 64, 128, 64, 128 },
			--disabledColor = { 64, 128, 64, 128 },

			visible = 0,
		},
	
		-- text
		{
			type = "TextLabel",
			name = "Region1_Text",
			ignored=1,

			autosize=1,
			Layout = {	
				--pos_XY = { x = .5, y = 1, xr = "par", yr = "par" },	
				--size_WH = { w = 0.8, wr = "par" },
				--min_WH = { w = 1, h = 90/600, wr = "par", hr = "scr" },
				size_WH = { w = 1, h = 80, wr = "par", hr = "px" },
				pad_RB  = { r = 0, b = 8/600, rr = "px", br = "scr" },
				--	pivot_XY = { 0.5, 1 },
			},	
			
			--backgroundColor = { 64, 64, 128, 128 },
			--disabledColor = { 64, 64, 128, 128 },
			
			--BackgroundGraphic = {
			--	size = {0, 0},
			--	texture = "DATA:UI\\NewUI\\Elements\\ui_infoshadow.tga",
			--	uvRect = { 4/32, 4/32, 28/32, 28/32 },
			--	patch_X = { 10, -4, 10, 0 },
			--	patch_Y = { 10, -4, 10, 0 },
			--	patch_PadX = { 8, -8 },
			--	patch_PadY = { 4, -4 },
			--	patch_Scale = 1,
			--},
			
			shrinkwrap = 1,

			Text = {
				textStyle = "SubtitleSPTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Center",
				text = "Region 1 text",
			},
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
			--borderWidth = 2,
			--disabledBorderColor = { 0, 128, 0, 255},
		},

		
		-- narrow text box
		{
			type = "TextLabel",
			name = "Region1_TextNarrow",
			ignored=1,
			autosize=1,
			Layout = {	
				pos_XY = { x = .5, y = 1, xr = "par", yr = "px" },	
				--min_WH = { w = 0.55, h = 90/600, wr = "par", hr = "scr" },
				size_WH = { w = .55, h = 80, wr = "par", hr = "px" },
				pivot_XY = { 0.5, 0 },
			},	
			
			--backgroundColor = { 64, 128, 128, 128 },
			--disabledColor = { 64, 128, 128, 128 },
			
			--BackgroundGraphic = {
			--	size = {0, 0},
			--	texture = "DATA:UI\\NewUI\\Elements\\ui_infoshadow.tga",
			--	uvRect = { 4/32, 4/32, 28/32, 28/32 },
			--	patch_X = { 10, -4, 10, 0 },
			--	patch_Y = { 10, -4, 10, 0 },
			--	patch_PadX = { 8, -8 },
			--	patch_PadY = { 4, -4 },
			--	patch_Scale = 1,
			--},
			
			shrinkwrap = 1,

			Text = {
				textStyle = "SubtitleSPTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Center",
				text = "Region 1 text narrow",
			},
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
			--borderWidth = 2,
			--disabledBorderColor = { 0, 128, 0, 255},
		},

	},

	-- Region 2
	{
		type = "Frame",
		name = "Region2_Frame",
		position = { 25, 450 },
		size = { 750, 50 },
		giveParentMouseInput = 1,	-- we don't want to capture input
		--borderWidth = 2,
		--disabledBorderColor = { 0, 0, 255, 255},
		;

		-- text
		{
			type = "TextLabel",
			name = "Region2_Text",
	
			position = {0, 0},
			size = { 750, 50 },
			Text = {
				textStyle = "SubtitleGenericTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Left",
				text = "Region 2 text",
			},
			
			--BackgroundGraphic = {
			--	size = {0, 0},
			--	texture = "DATA:UI\\NewUI\\Elements\\ui_infoshadow.tga",
			--	uvRect = { 4/32, 4/32, 28/32, 28/32 },
			--	patch_X = { 10, -4, 10, 0 },
			--	patch_Y = { 10, -4, 10, 0 },
			--	patch_PadX = { 8, -8 },
			--	patch_PadY = { 4, -4 },
			--	patch_Scale = 1,
			--},
			
			shrinkwrap = 1,
			
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
		},
	},


	-- Region 3 (location)
	{
		type = "Frame",
		name = "Region3_Frame",
		position = { 0, 0 },
		size = { 800, 19 },
		autosize=1,
		giveParentMouseInput = 1,	-- we don't want to capture input
		--borderWidth = 2,
		--disabledBorderColor = { 255, 255, 0, 255},
		
		Layout = {	
			pivot_XY = { 0.5, 0 },
			pad_RB  = { r = 0, b = 8/600, rr = "px", br = "scr" },
		},	
		
		
		Anchor_Binds = {
			pivotY = "Subtitle_SpeechBottomCenter",
			pivotX = "Subtitle_SpeechBottomCenter",
			--edgeB = "Taskbar_LowerRight",
		},

		Anchor_Spawns = {
			{
				anchorName = "Subtitle_LocationBottomCenter",
				relativePos = { .5, 1.0 },
			},		
		},

		;
	
		-- text
		{
			type = "TextLabel",
			name = "Region3_Text",
	
			position = {0, 0},
			size = { 800, 19 },
			Text = {
				textStyle = "SubtitleLocationCardTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Center",
				text = "Region 3 text",
			},
			
			--BackgroundGraphic = {
			--	size = {0, 0},
			--	texture = "DATA:UI\\NewUI\\Elements\\ui_infoshadow.tga",
			--	uvRect = { 4/32, 4/32, 28/32, 28/32 },
			--	patch_X = { 10, -4, 10, 0 },
			--	patch_Y = { 10, -4, 10, 0 },
			--	patch_PadX = { 8, -8 },
			--	patch_PadY = { 4, -4 },
			--	patch_Scale = 1,
			--},
			
			shrinkwrap = 1,
			
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
		},
	},


	-- Region 4 (time counter)
	-- TODO: this should go where the version info is...
	{
		type = "Frame",
		name = "Region4_Frame",
		position = { 214, 482 },
		size = { 370, 50 },
		giveParentMouseInput = 1,	-- we don't want to capture input
		--borderWidth = 2,
		--disabledBorderColor = { 255, 0, 255, 255},
		;
	
		-- text
		{
			type = "TextLabel",
			name = "Region4_Text",
	
			position = {0, 0},
			size = { 370, 50 },
			Text = {
				textStyle = "SubtitleSPTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Center",
				text = "Region 4 text",
			},
			
			--BackgroundGraphic = {
			--	size = {0, 0},
			--	texture = "DATA:UI\\NewUI\\Elements\\ui_infoshadow.tga",
			--	uvRect = { 4/32, 4/32, 28/32, 28/32 },
			--	patch_X = { 10, -4, 10, 0 },
			--	patch_Y = { 10, -4, 10, 0 },
			--	patch_PadX = { 8, -8 },
			--	patch_PadY = { 4, -4 },
			--	patch_Scale = 1,
			--},
			
			shrinkwrap = 1,
			
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
		},
	},

	-- Region 5 (message)
	-- Also used for HW1 location cards (?)
	{
		type = "Frame",
		name = "Region5_Frame",
		
		autosize=1,
		giveParentMouseInput = 1,	-- we don't want to capture input
		--borderWidth = 2,
		--disabledBorderColor = { 255, 255, 255, 255},

		Layout = {	
			pivot_XY = { 0.5, 0 },
			pos_XY = { x = 0.5, y = 0, xr = "par", yr = "px" },
			size_WH = { w = 1, h = 80, wr = "par", hr = "px" },
			pad_RB  = { r = 0, b = 8/600, rr = "px", br = "scr" },
		},
		
		Anchor_Binds = {
			pivotY = "Subtitle_LocationBottomCenter",
			pivotX = "Subtitle_LocationBottomCenter",
			--edgeB = "Taskbar_LowerRight",
		},
		;
	
		-- text
		{
			type = "TextLabel",
			name = "Region5_Text",
			
			Layout = {	
				pivot_XY = { 0.5, 0 },
				pos_XY = { x = 0.5, y = 0, xr = "par", yr = "px" },
				size_WH = { w = 1, h = 1, wr = "scr", hr = "px" },
			},
	
			autosize=1,
			
			Text = {
				textStyle = "SubtitleSPTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Center",
				text = "Region 5 text",
			},
			
			--BackgroundGraphic = {
			--	size = {0, 0},
			--	texture = "DATA:UI\\NewUI\\Elements\\ui_infoshadow.tga",
			--	uvRect = { 4/32, 4/32, 28/32, 28/32 },
			--	patch_X = { 10, -4, 10, 0 },
			--	patch_Y = { 10, -4, 10, 0 },
			--	patch_PadX = { 8, -8 },
			--	patch_PadY = { 4, -4 },
			--	patch_Scale = 1,
			--},
			
			shrinkwrap = 1,
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
		},
	},

	-- Region 6 (animatic letter box)
	{
		type = "Frame",
		name = "Region6_Frame",

		Layout = {	
			pos_XY = { x = .5, y = 1, xr = "par", yr = "par" },	
			size_WH = { w = 1, h = 100/600, wr = "par", hr = "scr" },
			pivot_XY = { 0.5, 1 },
		},	
		autosize=1,

		giveParentMouseInput = 1,	-- we don't want to capture input
		--borderWidth = 2,
		--disabledBorderColor = { 0, 0, 0, 255},
		;

		-- text
		{
			type = "TextLabel",
			name = "Region6_Text",
			Layout = {	
				size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
			},	
			--position = {45, 0},
			--size = { 710, 63 },
			Text = {
				textStyle = "SubtitleSPTextStyle",
				color = { 255, 255, 255, 255},
				vAlign = "Top",
				hAlign = "Center",
				text = "Region 6 text",
			},
			
			--BackgroundGraphic = {
			--	size = {0, 0},
			--	texture = "DATA:UI\\NewUI\\Elements\\ui_infoshadow.tga",
			--	uvRect = { 4/32, 4/32, 28/32, 28/32 },
			--	patch_X = { 10, -4, 10, 0 },
			--	patch_Y = { 10, -4, 10, 0 },
			--	patch_PadX = { 8, -8 },
			--	patch_PadY = { 4, -4 },
			--	patch_Scale = 1,
			--},
			
			shrinkwrap = 1,
			
			wrapping = 1,
			dropShadow = 1,
			visible = 0,
		},

	},
}