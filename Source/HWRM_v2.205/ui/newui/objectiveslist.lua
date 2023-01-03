dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

ObjectivesList = {
	--size = { 220, 114, 361, 276},
	stylesheet = "HW2StyleSheet",

	Layout = {						
		pos_XY = {	x=0.5, y=0.5, xr="scr", yr="scr",},	
		pivot_XY = { 0.5, 0 },
	},
	autosize=1,

	RootElementSettings = {
		autosize=1,
		Anchor_Binds = {
			pivotY = "Subtitle_LocationBottomCenter",
			pivotX = "Subtitle_LocationBottomCenter",
		},
		cursorType = "Normal",
	},
	
	soundOnShow = "SFX_ObjectiveMenuONOFF",
	soundOnHide = "SFX_ObjectiveMenuONOFF",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	;
	
	{
		type = "Frame",
		Layout = {
			--pivot_XY = { 0.5, 0.5 },					
			--pos_XY = {	x=0.32, y=0.42, xr="par", yr="par",},									
		},	
		autosize = 1,
		arrangetype = "vert",	
		;
		
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			name = "dialogWindow",
			TitleText = "$2750", -- OBJECTIVES
			-- SubtitleText = "$2751", -- PLAY MOVIES
			autosize=1,

			arrangetype = "horiz",

			;
			{
				type = "Frame",
				autosize = 1,	
				arrangetype = "vert",
				;				
				{
					type = "Frame",
					autosize = 1,	
					arrangetype = "vert",					
					;
					{
						type = "TextLabel",						
						autosize=1,
						Text = {
							textStyle = "IGButtonTextStyle",
							text = "$2752", -- PRIMARY OBJECTIVES
							color = "FEColorHeading3",
						},
					},		
					{
						type = "ListBox",
						listBoxStyle = "FEListBoxStyle_Bordered",	
						size = { 173, 92},
						name = "primaryList",
						hugBottom = 1,
						autoHideScrollbar = 0,
					},
	
				
					---------------- Secondary Objectives
					{
						type = "Frame",
						arrangetype = "vert",		
						autosize=1,
						Layout = {
							margin_LT = { l = 0, t = PANEL_PAD_VERT*2, lr = "scr", tr = "scr" },												
						},
						;
						{
							type = "TextLabel",
							autosize=1,
							Text = {
								textStyle = "IGButtonTextStyle",
								text = "$2753", -- SECONDARY OBJECTIVES
								color = "FEColorHeading3",
							},
						},
						{
							type = "ListBox",
							listBoxStyle = "FEListBoxStyle_Bordered",
							size = { 173, 91},
							name = "secondaryList",
							hugBottom = 1,
							autoHideScrollbar = 0,
						},
					},
				},
			},
			------------- Ojective description
			{
				type = "Frame",
				autosize = 1,	
				arrangetype = "vert",
								
				Layout = {
					margin_LT = { l = PANEL_SPACING_HORIZ, t = 0, lr = "scr", tr = "scr" },	
				},	


				;	
				{
					type = "TextLabel",
					name = "descriptionTitle",
					autosize = 1,
					--visible = 0,
					Text = {
						textStyle = "Taskbar_MenuButtonTextStyle",
						text = "$2754", -- OBJECTIVE DETAILS
						color = { 255, 255, 255, 255},
					},
				},	
				{
					type = "ListBox",
					listBoxStyle = "FEListBoxStyle_Bordered",
					size = { 172, 213},
					name = "descriptionList",
					autoHideScrollbar = 0,
				},
			},		
		},

		---------------- Close Button
		{
			type = "Frame",
			--size = {486, 18},
			--size = {SAVELOAD_WIDTH-8, 18},

			Layout = {
				--pos_XY = {	x = 0.10, y = 0.20, xr = "par",	yr = "par"	},	
				margin_LT = { l = 0, t = 0, lr = "scr", tr = "scr" },
				pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },				
				size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },							
			},		

			autosize=1,
			
			BackgroundGraphic = BORDER_GRAPHIC_FRAME,
			backgroundColor = COLOR_BACKGROUND_PANEL,
				
			arrangetype = "horiz",
			;
			
			{
				type = "TextButton",
				name = "m_btnAccept",

				Layout = {
					pivot_XY = { 0.5, 0.0 },					
					pos_XY = {	x=0.5, y=0.0, xr="par", yr="par"},			
					size_WH = {	w = 1, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },					
				},	

				buttonStyle = "FEButtonStyle1_Alert_Chipped",	
				Text = {
					text = "$2642",  -- CLOSE
				},
				onMousePressed = "UI_ToggleScreen( 'ObjectivesList', 0)",
			},
		},	








	{
		type = "ListBoxItem",
		name = "listItem",
		autosize = 1,
		visible = 0,
		ignored = 1,
		pressedColor = { 255, 255, 255, 64},
		overColor = { 255, 255, 255, 32},
		;
		
		{
			type = "Frame",
			--position = { 3, 2},
			--size = { 11, 11},
			Layout = {				
				pos_XY = { x = 3, y = 2, xr = "px", yr = "px" },				
				size_WH = { w = 11/800, h = 11/600, wr = "scr", hr = "scr" },		
				lockAspect=1,			
			},	


			name = "iconincomplete",
			visible = 0,
			BackgroundGraphic = {
				--size = { 11, 11},
				texture = "DATA:UI\\NewUI\\InGameIcons\\objectiveincomplete.tga",
				textureUV = { 0, 0, 11, 11 },
			},
		},
		
		{
			type = "Frame",
			--position = { 3, 2},
			--size = { 11, 11},
			Layout = {				
				pos_XY = { x = 3, y = 2, xr = "px", yr = "px" },	
				size_WH = { w = 11/800, h = 11/600, wr = "scr", hr = "scr" },		
				lockAspect=1,			
			},	
			name = "iconcomplete",
			visible = 0,
			BackgroundGraphic = {
				--size = { 11, 11},
				texture = "DATA:UI\\NewUI\\InGameIcons\\objectivecomplete.tga",
				textureUV = { 0, 0, 11, 11 },
			},
		},
		
		{
			type = "Frame",
			--position = { 3, 2},
			--size = { 11, 11},
			Layout = {				
				pos_XY = { x = 3, y = 2, xr = "px", yr = "px" },	
				size_WH = { w = 11/800, h = 11/600, wr = "scr", hr = "scr" },		
				lockAspect=1,			
			},	

			name = "iconfailed",
			visible = 0,
			BackgroundGraphic = {
				--size = { 11, 11},
				texture = "DATA:UI\\NewUI\\InGameIcons\\objectivefailed.tga",
				textureUV = { 0, 0, 11, 11 },
			},
		},
		
		{
			type = "TextLabel",
			name = "textincomplete",
			position = {18, 1},
			size = { 130, 13},
			visible = 0,
			wrapping = 1,
			autosize = 1,
			Text = {
				textStyle = "Taskbar_MenuButtonTextStyle",
				hAlign = "Left",
				color = { 255, 255, 255, 255},
			},
		},

		{
			type = "TextLabel",
			name = "textcomplete",
			position = {18, 1},
			size = { 130, 13},
			visible = 0,
			wrapping = 1,
			autosize = 1,
			Text = {
				textStyle = "Taskbar_MenuButtonTextStyle",
				hAlign = "Left",
				color = { 255, 255, 255, 128},
			},
		},

		{
			type = "TextLabel",
			name = "textfailed",
			position = {18, 1},
			size = { 130, 13},
			visible = 0,
			wrapping = 1,
			autosize = 1,
			Text = {
				textStyle = "Taskbar_MenuButtonTextStyle",
				hAlign = "Left",
				color = { 205, 0, 0, 255},
			},
		},
	},

	{
		type = "ListBoxItem",
		name = "descriptionItem",
		autosize = 1,
		ignored = 1,
		visible = 0,
		;
		
		{
			type = "TextLabel",
			name = "text",
			position = {0, 0},
			size = { 147, 13},
			visible = 0,
			wrapping = 1,
			autosize = 1,
			marginWidth = 2,
			marginHeight = 2,
			Text = {
				textStyle = "Taskbar_MenuButtonTextStyle",
				font = "ChatFont",
				hAlign = "Left",
				color = { 255, 255, 255, 255},
			},
		},
		
		{
			type = "TextLabel",
			name = "textcomplete",
			position = {0, 0},
			size = { 147, 13},
			visible = 0,
			wrapping = 1,
			autosize = 1,
			marginWidth = 2,
			marginHeight = 2,
			Text = {
				textStyle = "Taskbar_MenuButtonTextStyle",
				hAlign = "Left",
				font = "ChatFont",
				color = { 255, 255, 255, 128},
			},
		},
		
		{
			type = "TextLabel",
			name = "textfailed",
			position = {0, 0},
			size = { 147, 13},
			visible = 0,
			wrapping = 1,
			autosize = 1,
			marginWidth = 2,
			marginHeight = 2,
			Text = {
				textStyle = "Taskbar_MenuButtonTextStyle",
				hAlign = "Left",
				font = "ChatFont",
				color = { 205, 0, 0, 255},
			},
		},			
		
	},
		
	{
			type = "Frame",
			name = "ObjectiveStats",
			position = {186,172},
			size = {120, 72},	
			ignored = 1,	
			visible = 0,
			;
			{
				type = "TextLabel",
				name = "Stats",
				position = {0,0},
				size = {100, 12},
				Text = {
					textStyle = "IGHeading2",					
					text = "$4917",	--PLAYER STATS
				},
			},
			{
				type = "TextLabel",
				name = "Harvest",
				position = {0,12},
				size = {100, 12},
				Text = {
					textStyle = "Taskbar_MenuButtonTextStyle",
					font = "ChatFont",
					hAlign = "Left",
					color = { 255, 255, 255, 255},
					text = "$3172",	--Harvest
				},
			},
			{
				type = "TextLabel",
				name = "Kill",
				position = {0,24},
				size = {100, 12},
				Text = {
					textStyle = "Taskbar_MenuButtonTextStyle",
					font = "ChatFont",
					hAlign = "Left",
					color = { 255, 255, 255, 255},
					text = "$4918",	--Kill
				},
			},	
			{
				type = "TextLabel",
				name = "Build",
				position = {0,36},
				size = {100, 12},
				Text = {
					textStyle = "Taskbar_MenuButtonTextStyle",
					font = "ChatFont",
					hAlign = "Left",
					color = { 255, 255, 255, 255},
					text = "$4919",	--Build
				},
			},
			{
				type = "TextLabel",
				name = "Research",
				position = {0,48},
				size = {100, 12},
				Text = {
					textStyle = "Taskbar_MenuButtonTextStyle",
					font = "ChatFont",
					hAlign = "Left",
					color = { 255, 255, 255, 255},
					text = "$3126",	--Research
				},
			},		
			{
				type = "TextLabel",
				name = "Survive",
				position = {0,60},
				size = {100, 12},
				Text = {
					textStyle = "Taskbar_MenuButtonTextStyle",
					font = "ChatFont",
					hAlign = "Left",
					color = { 255, 255, 255, 255},
					text = "$4920",	--Survive
				},
			},						
		},
	
	},

}
