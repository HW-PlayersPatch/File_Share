--dofilepath("data:ui/newui/Taskbar/TaskbarDefines.lua")

-- holding frame for testing - allows us to set the color under the test graphics...
	-- holding frame for testing - allows us to set the color under the test graphics...
EXAMPLE_DEBUGSCREEN = {
	type = "Frame",
	name = "EXAMPLE_deaton",
	visible = 0,
		
	Layout = {
		pos_XY = {
			x = 0.0,
			y = 0.0,
			xr = "scr",
			yr = "scr",
		},
			
		size_WH = {
			w = 1.0,
			h = 1.0,
			wr = "scr",
			hr = "scr",
		},			
	},
		
	backgroundColor = { 0, 64, 32, 255 },
	;
	
	-- Testing / Play frame
	{
		type = "Frame",
			
		Layout = {
			Flags = {
				limitScreen_X = 1,
			},
				
			scale = 2,
				
			pos_XY = {
				x = 0.1,
				y = 0.1,
				xr = "scr",
				yr = "scr",
			},
				
			size_WH = {
				w = 0.3,
				h = 0.6,
				wr = "scr",
				hr = "scr",
			},
				
			min_WH = {
				w = 64,
				h = 64,
				wr = "abs_px",
				hr = "abs_px",
			},
		},
			
		Anchor_Spawns = {
			{
				anchorName = "MainMenu_Test1",
				relativePos = { 1.0, 0.25 },
			},
				
			{
				anchorName = "MainMenu_Test2",
				relativePos = { 0.25, 1.1 },
			},
		},
			
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
			uvRect = { 1/64, 17/128, 31/64, 31/128 },
			patch_X = { 4, -22, 4, 0 },
			patch_Y = { 3, -8, 3, 0 },
			patch_PadX = {3, -3},
			patch_PadY = {2, -2},
			patch_Scale = 1,
		},
		;
			
		-- Upper Left Test Quad
		{
			type = "Frame",
				
			Layout = {
				pos_XY = {
					x = 0.05,
					y = 0.05,
					xr = "par",
					yr = "par",
				},
					
				size_WH = {
					w = 0.4,
					h = 0.35,
					wr = "par",
					hr = "par",
				},
			},
				
			BackgroundGraphic = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_edgebox.dds",
				uvRect = { 1/32, 1/32, 31/32, 31/32 },
				patch_X = { 1, -9, 9, -2, 9, 0 },
				--patch_Y = { 9, -5, 7, -8, 1, 0 },
				patch_Y = { 30, 0 },
				patch_Scale = 1,
			},
		},
			
		-- Upper Right Test Quad
		{
			type = "Frame",
				
			Layout = {
				pos_XY = {
					x = 0.55,
					y = 0.05,
					xr = "par",
					yr = "par",
				},
					
				size_WH = {
					w = 0.4,
					h = 0.35,
					wr = "par",
					hr = "par",
				},
			},
				
			BackgroundGraphic = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_edgebox.dds",
				uvRect = { 1/32, 1/32, 31/32, 31/32 },
				patch_X = { 1, -9, 20, 0 },
				patch_Y = { 21, -8, 1, 0 },
				patch_Scale = 1,
			},
		},
			
		-- Lower Left Test Quad
		{
			type = "Frame",
				
			Layout = {
				pos_XY = {
					x = 0.05,
					y = 0.45,
					xr = "par",
					yr = "par",
				},
					
				size_WH = {
					w = 0.4,
					h = 0.35,
					wr = "par",
					hr = "par",
				},
			},
				
			BackgroundGraphic = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_edgebox.dds",
				uvRect = { 1/32, 1/32, 31/32, 31/32 },
				patch_X = { 19, -2, 9, 0 },
				patch_Y = { 9, -5, 16, 0 },
				patch_Scale = 2,
					
				Surface = {
					surface = "ui_testbed";
					{ prop = "faaaaake", float3 = { 0.5, 0.5, 0.25 } },
					{ prop = "rate", float2 = { 2.0, 1.0 } },
				},
			},
		},
			
		-- Lower Right Test Quad
		{
			type = "Frame",
				
			Layout = {
				pos_XY = {
					x = 0.55,
					y = 0.45,
					xr = "par",
					yr = "par",
				},
					
				size_WH = {
					w = 0.4,
					h = 0.35,
					wr = "par",
					hr = "par",
				},
			},
				
			BackgroundGraphic = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_edgebox.dds",
				uvRect = { 1/32, 1/32, 31/32, 31/32 },
				patch_X = { 1, -2, 16, -2, 9, 0 },
				patch_Y = { 9, -5, 10, -5, 1, 0 },
				patch_Scale = 2,
			},
		},
			
		-- Drag me!
		{
			type = "DragHandle",
			dragType = "pos",
				
			stateBaseOfs = { 0.0, 16/64 },
			stateBaseCells = { 1, 1, 1, 0, 3 },
			stateIconOfs = { 0.0, 16/64 },
			stateIconCells = { 0, 0, 0, 1, 1 },
				
			Layout = {
				pivot_XY = { 0.0, 1.0 },
					
				pos_XY = {
					x = 0.0,
					y = 1.0,
					xr = "par",
					yr = "par",
				},
					
				size_WH = {
					w = 0.5,
					h = 16,
					wr = "par",
					hr = "px",
				},
			},
				
			BackgroundGraphic = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
				uvRect = { 33/64, 1/64, 63/64, 15/64 },
				patch_X = { 6, -18, 6, 0 },
				patch_Y = { 5, -4, 5, 0 },
				patch_Scale = 1,
				patch_AutoScale = 1,
					
				fill = "DATA:UI\\NewUI\\Styles\\Fill_JaggedWhite.tga",
					
				Surface = {
					surface = "ui_multistate";
					{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
					{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				},
			},
				
			IconBase = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
				uvRect = { 1/64, 1/64, 31/64, 15/64 },
				patch_X = { 6, -18, 6, 0 },
				patch_Y = { 5, -4, 5, 0 },
				patch_Scale = 1,
				patch_AutoScale = 1,
			},
				
			text = "Drag Me!",
				
			Text = 
			{
				textStyle = "FEButtonTextStyle",
				dropShadow = 1,
				vAlign = "Middle",
				hAlign = "Center",
			},
		},
			
		-- Size me!
		{
			type = "DragHandle",
			dragType = "size",
				
			stateBaseOfs = { 0.0, 16/64 },
			stateBaseCells = { 1, 1, 1, 0, 3 },
			stateIconOfs = { 0.0, 16/64 },
			stateIconCells = { 0, 0, 0, 1, 1 },
				
			Layout = {
				pivot_XY = { 1.0, 1.0 },
					
				pos_XY = {
					x = 1.0,
					y = 1.0,
					xr = "par",
					yr = "par",
				},
					
				size_WH = {
					w = 16,
					h = 16,
					wr = "px",
					hr = "px",
				},
			},
				
			BackgroundGraphic = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
				uvRect = { 33/64, 1/64, 63/64, 15/64 },
				patch_X = { 6, -18, 6, 0 },
				patch_Y = { 5, -4, 5, 0 },
				patch_Scale = 1,
				patch_AutoScale = 1,
					
				fill = "DATA:UI\\NewUI\\Styles\\Fill_JaggedWhite.tga",
					
				Surface = {
					surface = "ui_multistate";
					{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
					{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				},
			},
				
			IconBase = {
				size = {0, 0},
				texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
				uvRect = { 1/64, 1/64, 31/64, 15/64 },
				patch_X = { 6, -18, 6, 0 },
				patch_Y = { 5, -4, 5, 0 },
				patch_Scale = 1,
				patch_AutoScale = 1,
			},
		},
	},
		
	{
		type = "TextButton",
			
		Layout = {
			pos_XY = {
				x = 0.5,
				y = 0.8,
				xr = "scr",
				yr = "scr",
			},
				
			size_WH = {
				w = 0.15,
				h = 0.075,
				wr = "scr",
				hr = "scr",
			},
				
			min_WH = {
				w = 64,
				h = 64,
				wr = "px",
				hr = "px",
			},
				
			--lockAspect = 2.0,
			pivot_XY = { 0.75, 0.0 },
		},
			
		BackgroundGraphic = {
			size = {0, 0},
			texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_testframe_mip.dds",
			uvRect = { 1/64, 1/64, 63/64, 63/64 },
			patch_X = { 15, -10, 12, -10, 15, 0 },
			patch_Y = { 15, -32, 15, 0 },
			patch_PadX = { 8, -8 },
			patch_PadY = { 8, -8 },
			patch_Scale = 1,
		},
			
		Anchor_Binds = {
			pivotX = "MainMenu_Sub",
			edgeT = "MainMenu_Sub",
		},
			
		text = "Anchor Sub",
				
		Text = 
		{
			textStyle = "FEButtonTextStyle",
			dropShadow = 1,
			vAlign = "Middle",
			hAlign = "Center",
		},
	},
		
	{
		type = "Frame",
			
		Layout = {
			pos_XY = { x = 0.5, y = 0.8, xr = "scr", yr = "scr" },
			size_WH = { w = 0.2, h = 0.1, wr = "scr", hr = "scr" },
			pivot_XY = { 0.0, 0.0 },
		},
			
		BackgroundGraphic = {
			size = {0, 0},
			texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_testframe_mip.dds",
			uvRect = { 1/64, 1/64, 63/64, 63/64 },
			patch_X = { 15, -10, 12, -10, 15, 0 },
			patch_Y = { 15, -32, 15, 0 },
			patch_PadX = { 8, -8 },
			patch_PadY = { 8, -8 },
			patch_Scale = 1,
		},
			
		Anchor_Binds = {
			pivotX = "MainMenu_Test1",
			pivotY = "MainMenu_Test1",
			scale = "MainMenu_Test1",
		},
		
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 0,
		sizetype = "contain",
		;
		
		{	-- Real layout (does not interact with parent size/layout at all)
			type = "Frame",
			
			autoarrange = 1,
			autoarrangeSpace = 0,
			
			backgroundColor = { 255, 128, 64, 64 },
			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
				size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
				pivot_XY = { 0.0, 0.0 },
				Flags = { hasVolume = 0, canArrange = 0, canUniform = 0, canMeasure = 0 },
			},
			;
			
			-- Real buttons
			{
				type = "TextButton",
				
				Layout = {
					pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
					size_WH = { w = 1.0, h = 0.0, wr = "par", hr = "px" },
					pivot_XY = { 0.0, 0.0 },
				},
				
				text = "Test String 2000",
					
				Text = 
				{
					textStyle = "FEButtonTextStyle",
					dropShadow = 1,
					vAlign = "Top",
					hAlign = "Center",
				},
				
				autosize = 1,
			},
			
			{
				type = "TextButton",
				
				Layout = {
					pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
					size_WH = { w = 1.0, h = 0.0, wr = "par", hr = "px" },
					pivot_XY = { 0.0, 0.0 },
				},
				
				text = "Test String 500000",
					
				Text = 
				{
					textStyle = "FEButtonTextStyle",
					dropShadow = 1,
					vAlign = "Top",
					hAlign = "Center",
				},
				
				autosize = 1,
			},
			
			{
				type = "TextButton",
				
				Layout = {
					pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
					size_WH = { w = 1.0, h = 0.0, wr = "par", hr = "px" },
					pivot_XY = { 0.0, 0.0 },
				},
				
				text = "Test String",
					
				Text = 
				{
					textStyle = "FEButtonTextStyle",
					dropShadow = 1,
					vAlign = "Top",
					hAlign = "Center",
				},
				
				autosize = 1,
			},
		},
		
		-- Proxy buttons (to force max sizing...)
		{
			type = "TextButton",
			visible = 0,
			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				size_WH = { w = 0.0, h = 0.0, wr = "px", hr = "px" },
				pivot_XY = { 0.0, 0.0 },
			},
			
			text = "Test String 2000",
				
			Text = 
			{
				textStyle = "FEButtonTextStyle",
				dropShadow = 1,
				vAlign = "Top",
				hAlign = "Center",
			},
			
			autosize = 1,
		},
		
		{
			type = "TextButton",
			visible = 0,
			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				size_WH = { w = 0.0, h = 0.0, wr = "px", hr = "px" },
				pivot_XY = { 0.0, 0.0 },
			},
			
			text = "Test String 500000",
				
			Text = 
			{
				textStyle = "FEButtonTextStyle",
				dropShadow = 1,
				vAlign = "Top",
				hAlign = "Center",
			},
			
			autosize = 1,
		},
		
		{
			type = "TextButton",
			visible = 0,
			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				size_WH = { w = 0.0, h = 0.0, wr = "px", hr = "px" },
				pivot_XY = { 0.0, 0.0 },
			},
			
			text = "Test String",
				
			Text = 
			{
				textStyle = "FEButtonTextStyle",
				dropShadow = 1,
				vAlign = "Top",
				hAlign = "Center",
			},
			
			autosize = 1,
		},
	},
		
	{
		type = "TextButton",
			
		Layout = {
			pos_XY = {
				x = 0.0,
				y = 0.8,
				xr = "px",
				yr = "scr",
			},
				
			size_WH = {
				w = 0.0,
				h = 0.125,
				wr = "px",
				hr = "scr",
			},
				
			min_WH = {
				w = 64,
				h = 64,
				wr = "px",
				hr = "px",
			},
				
			--lockAspect = 2.0,
			pivot_XY = { 0.5, 0.0 },
		},
			
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
			uvRect = { 33/64, 17/128, 63/64, 31/128 },
			patch_X = { 4, -22, 4, 0 },
			patch_Y = { 3, -8, 3, 0 },
			patch_PadX = {3, -3},
			patch_PadY = {2, -2},
			patch_Scale = 3,
		},
			
		Anchor_Binds = {
			edgeL = "MainMenu_Test2",
			edgeR = "MainMenu_Test1",
			pivotY = "MainMenu_Test2",
		},
			
		Anchor_Spawns = {
			{
				anchorName = "MainMenu_Sub",
				relativePos = { 0.75, 1.0 },
			},			
		},
			
		text = "Anchor Stretch",
				
		Text = 
		{
			textStyle = "FEButtonTextStyle",
			dropShadow = 1,
			vAlign = "Top",
			hAlign = "Center",
		},
			
		arrangetype = "horiz",
		arrangedir = 1,
			
		;
		{
			type = "TextButton",
				
			Layout = {
				pos_XY = { x = 0, y = 0.5, xr = "px", yr = "par" },
				size_WH = { w = 0, h = 0.5, wr = "px", hr = "par" },
			},
				
			autosize = 1,
			sizetype = "contain",
				
			BackgroundGraphic = {
				texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
				uvRect = { 1/64, 17/128, 31/64, 31/128 },
				patch_X = { 4, -22, 4, 0 },
				patch_Y = { 3, -8, 3, 0 },
				patch_PadX = {3, -3},
				patch_PadY = {2, -2},
				patch_Scale = 1,
			},

			text = "Fixed",
					
			Text = { textStyle = "FEButtonTextStyle", dropShadow = 1, vAlign = "Middle", hAlign = "Center" },
		},
		{
			type = "TextButton",
				
			Layout = {
				pos_XY = { x = 0, y = 0.5, xr = "px", yr = "par" },
				size_WH = { w = 0, h = 0.5, wr = "px", hr = "par" },
			},
				
			arrangeweight = 1,
				
			BackgroundGraphic = {
				texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
				uvRect = { 1/64, 17/128, 31/64, 31/128 },
				patch_X = { 4, -22, 4, 0 },
				patch_Y = { 3, -8, 3, 0 },
				patch_PadX = {3, -3},
				patch_PadY = {2, -2},
				patch_Scale = 1,
			},

			text = "Flex 1",
					
			Text = { textStyle = "FEButtonTextStyle", dropShadow = 1, vAlign = "Middle", hAlign = "Center" },
		},
		{
			type = "TextButton",
				
			Layout = {
				pos_XY = { x = 0, y = 0.5, xr = "px", yr = "par" },
				size_WH = { w = 0, h = 0.5, wr = "px", hr = "par" },
			},
				
			autosize = 1,
			sizetype = "contain",
				
			BackgroundGraphic = {
				texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
				uvRect = { 1/64, 17/128, 31/64, 31/128 },
				patch_X = { 4, -22, 4, 0 },
				patch_Y = { 3, -8, 3, 0 },
				patch_PadX = {3, -3},
				patch_PadY = {2, -2},
				patch_Scale = 1,
			},

			text = "Fixed",
					
			Text = { textStyle = "FEButtonTextStyle", dropShadow = 1, vAlign = "Middle", hAlign = "Center" },
		},
		{
			type = "TextButton",
				
			Layout = {
				pos_XY = { x = 0, y = 0.5, xr = "px", yr = "par" },
				size_WH = { w = 0, h = 0.5, wr = "px", hr = "par" },
			},
				
			arrangeweight = 2,
				
			BackgroundGraphic = {
				texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
				uvRect = { 1/64, 17/128, 31/64, 31/128 },
				patch_X = { 4, -22, 4, 0 },
				patch_Y = { 3, -8, 3, 0 },
				patch_PadX = {3, -3},
				patch_PadY = {2, -2},
				patch_Scale = 1,
			},

			text = "Flex 2",
					
			Text = { textStyle = "FEButtonTextStyle", dropShadow = 1, vAlign = "Middle", hAlign = "Center" },
		},
	},
		
		
	{
		type = "TextButton",
			
		Layout = {
			Flags = {
				limitScreen_X = 1,
				limitScreen_Y = 1,
			},
				
			pos_XY = {
				x = 0.5,
				y = 0.8,
				xr = "scr",
				yr = "scr",
			},
				
			size_WH = {
				w = 0.15,
				h = 0.075,
				wr = "scr",
				hr = "scr",
			},
				
			min_WH = {
				w = 64,
				h = 64,
				wr = "px",
				hr = "px",
			},
				
			lockAspect = 2.0,
			--pivot_XY = { 0.0, 0.5 },
		},
			
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
			uvRect = { 1/64, 17/128, 31/64, 31/128 },
			patch_X = { 4, -22, 4, 0 },
			patch_Y = { 3, -8, 3, 0 },
			patch_PadX = {3, -3},
			patch_PadY = {2, -2},
			patch_Scale = 1,
		},
			
		Anchor_Binds = {
			pivotX = "MainMenu_Test1",
			pivotY = "MainMenu_Test2",
		},
			
		text = "Anchor Mix",
				
		Text = 
		{
			textStyle = "FEButtonTextStyle",
			dropShadow = 1,
			vAlign = "Middle",
			hAlign = "Center",
		},
	},
}