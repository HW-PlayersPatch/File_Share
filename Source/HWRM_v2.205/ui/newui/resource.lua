dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

width = 200
height = 32
height_line = 15
space = 2
pos1 = 0
pos2 = 0
pos3 = 0
ResourceMenu = {	
	Layout = {		
		pos_XY = { x = 0.5, y = SCREEN_SAFE_Y, xr = "par", yr = "scr" },
		pivot_XY = { 0.5, 0 },
		--size_WH = { w = width, h = height, wr = "px", hr = "px" },		
	},		
	stylesheet = "HW2StyleSheet",	
	--clickThrough = 1,
	clipchildren=0,
	eventOpaque=0,
	pixelUVCoords = 1,
	--onUpdate = [[ 																
	--	UI_SetTextLabelText("ResourceMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ));		
	--]],
		RootElementSettings = {
			autosize=1,
			arrangetype = "vert",
			cursorType = "Normal",
		},


	

	;
	
	--RU centre
		
	{

		type = "Frame",
		Layout = {			
			pos_XY = { x = 0.0, y = 0, xr = "px", yr = "px" },	
			--pivot_XY = { 0.5, 0 },
			--min_WH = { w = width, h = height, wr = "px", hr = "px" },					
		},				
		arrangetype = "horiz",
		autosize=1,
		backgroundColor = {20,20,20,20},
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,

			Anchor_Spawns = {
				{
					anchorName = "Taskbar_ResourceBottomCenter3",
					relativePos = { 0.5, 1.0 },
				},		
			},

		;		
		--RU Icon
		{
			type = "Frame",
			Layout = {				
				pos_XY = { x = 1, y = .5, xr = "px", yr = "par" },
				pivot_XY = { 0.0, 0.5 },
				size_WH = { w = 32/800, h = 24/600, wr = "scr", hr = "scr" },		
				lockAspect=1,			
			},	
			--backgroundColor = COLOR_BLUE_SOLID,

			BackgroundGraphic = {
				--size = {4, 4},
				texture = "DATA:UI\\NewUI\\Taskbar\\CommandIcons\\cmd_ico_resource.dds",
				uvRect = { 0/128, 128/512, 128/128, 256/512 },
				patch_X = { 4,-120, 4,0 },
				patch_Y = { 4,-120,4, 0 },
				patch_Scale = 1,
		
				Surface = THREESTATEBUTTONSURFACE,

			},


			--BackgroundGraphic = {
			--	texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
			--	textureUV = {0,0,34,34},	
			--	margin_RB = { r = 1, b = 1, rr = "px", br = "px" },			
			--},
		},		
		--Static Label
		{
			type = "TextLabel",
			name = "lblResourceUnitsStaticText",	

			Layout = {			
				pos_XY = { x = 1, y = .5, xr = "px", yr = "par" },
				pivot_XY = { 0.0, 0.5 },
				--size_WH = { w = width-24, h = height-2, wr = "px", hr = "px" },			
				pad_LT = { l = LISTBOXITEM_ICON_PAD_HORIZ, t = 0, lr = "scr", tr = "px" },	
			},	
			--backgroundColor = COLOR_GREEN_SOLID,
			autosize=1,
							
			Text = {
				text = "$2800", --RESOURCE UNITS --to localize
				textStyle = "RM_DescriptionLabel_TextStyle",				
				hAlign = "Left",
				vAlign = "Center",
				--pixels = 38,
				--color = { 254, 255, 211, 255},
				--overTextColor = { 253, 255, 145, 255},
			},			


		},	
		--Dynamic Label
		{
			type = "Frame",
			name = "DynamicRUFrame",
			autosize=1,

			Layout = {
				pos_XY = { x = 1, y = .5, xr = "px", yr = "par" },
				pivot_XY = { 0.0, 0.5 },
			},	

			;
			{
				type = "TextLabel",
				name = "lblResourceUnitsSpaceClaim",	

				Layout = {
					pos_XY = { x = 1, y = .5, xr = "px", yr = "par" },
					pivot_XY = { 0.0, 0.5 },
					--pos_XY = { x = 140, y = 2, xr = "px", yr = "px" },
					min_WH = { w = 1, h = height-2, wr = "px", hr = "px" },		
					pad_LT = { l = LISTBOXITEM_ICON_PAD_HORIZ, t = 0, lr = "scr", tr = "px" },		
					pad_RB = { r = LISTBOXITEM_ICON_PAD_HORIZ, b = 0, rr = "scr", br = "px" },	
					Flags = { canArrange = 0	},
				},	
				visible=0,
				autosize=1,		
				--backgroundColor = COLOR_WHITE_SOLID,
				Text = {
					textStyle = "RM_DescriptionLabel_TextStyle",	
					text = "WWWWWWW",							
					hAlign = "Left",
					vAlign = "Center",
					--pixels = 38,
					color = COLOR_BUTTON_TEXT_DEFAULT,
				},			
			},	
			{
				type = "TextLabel",
				name = "lblResourceUnits",	

				Layout = {
					pos_XY = { x = 1, y = .5, xr = "px", yr = "par" },
					pivot_XY = { 0.0, 0.5 },
					--pos_XY = { x = 140, y = 2, xr = "px", yr = "px" },
					min_WH = { w = 1, h = height-2, wr = "px", hr = "px" },		
					pad_LT = { l = LISTBOXITEM_ICON_PAD_HORIZ, t = 0, lr = "scr", tr = "px" },		
					pad_RB = { r = LISTBOXITEM_ICON_PAD_HORIZ, b = 0, rr = "scr", br = "px" },	
					Flags = { hasVolume = 0	},
				},	
			
				autosize=1,		
				--backgroundColor = COLOR_WHITE_SOLID,
				Text = {
					textStyle = "RM_DescriptionLabel_TextStyle",								
					hAlign = "Left",
					vAlign = "Center",
					--pixels = 38,
					color = COLOR_BUTTON_TEXT_DEFAULT,
				},			
			},		
		},
	},


}

