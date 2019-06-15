LoadingScreen = {
	Layout = {
		sector = 1,
		pos_XY = { x = 0, y = 0, xr = "scr", yr = "scr" },
		size_WH = { w = 1, h = 1, wr = "scr", hr = "scr" },
	},

	stylesheet = "HW2StyleSheet",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	RootElementSettings = {
		backgroundColor = {0,0,0,255}, -- black background for letterbox effect
	},
	;
	
	-- Aspect Enforcement Frame
	{
		type = "Frame",
		
		Layout = {
			sector = 1,
			pos_XY = { x = 0.5, y = 0.5, xr = "scr", yr = "scr" },
			size_WH = { w = 1, h = 1, wr = "scr", hr = "scr" },
			pivot_XY = { 0.5, 0.5 },
			lockAspect = 16/9,
		},
		;
		
		-- Per-Level Dynamic Image 
		{
			type = "Frame",
			Layout = {
				sector = 1,
				pos_XY = { x = 0, y = 0, xr = "par", yr = "par" },
				size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
			},
			
			name = "bgImage",
			BackgroundGraphic = {
				size = { 0, 0 },
				texture = "DATA:UI/NewUI/Background/HW1_Loading.dds",
				textureUV = { 0, 0, 3840, 2160},
			},
		},
		
		-- progress
		{
			type = "Frame",
			
			Layout = {
				sector = 1,
				pos_XY = { x = 0.078125, y = 0.1851, xr = "par", yr = "par" },
				size_WH = { w = 0.2974, h = 0.2779, wr = "par", hr = "par" },
				pivot_XY = { 0.0, 0.0 },
			},
			
			backgroundColor = {0,0,0,0}
			;
			
			{
				type = "ProgressBar",
				
				Layout = {
					sector = 1,
					pos_XY = { x = 0.5, y = 0.5, xr = "par", yr = "par" },
					size_WH = { w = 0.9, h = 60, wr = "par", hr = "px" },
					pivot_XY = { 0.5, 0.5 },
				},

				progressColor = {240, 170, 0, 255},
				name = "loadingProgress",
					
				filledTextColor			= {255,255,255,0},
				emptyTextColor			= {255,255,255,0},
					
				Text = 
				{
					font = "ButtonFont",
					dropShadow = 1,
					pixels = 24,
					vAlign = "Middle",
					hAlign = "Center",
					rel=0,
				},
					
				frameOfs = { 0.0, 64/256 },
				frameCells = { 0, 1, 2, 3 },
					
				frameArt = {
					size = {0, 0},
					texture = "DATA:UI\\NewUI\\Styles\\Progress_HW1.dds",
					uvRect = { 2/256, 2/256, 126/256, 62/256 },
					patch_X = { 50, -25, 50, 0 },
					patch_Y = { -2, 56, -2, 0 },
					patch_Scale = 1,
					--patch_AutoScale = 1,
					
					Surface = {
						surface = "ui_multistate";
						{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
						{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
					},
				},
					
				coreOfs = { 0.0, 64/256 },
				coreCells = { 0, 1, 2, 3 },
					
				coreArt = {
					size = {0, 0},
					texture = "DATA:UI\\NewUI\\Styles\\Progress_HW1.dds",
					uvRect = { 130/256, 2/256, 254/256, 62/256 },
					patch_X = { 50, -24, 50, 0 },
					patch_Y = { -2, 56, -2, 0 },
					patch_Scale = 1,
					--patch_AutoScale = 1,
					
					Surface = {
						surface = "ui_multistate";
						{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
						{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
					},
				},
			},
		},
		
		-- text label for campaign title1
		{
			type = "TextLabel",
			name = "titleLabel1",
			visible = 0,
			
			Layout = {
				sector = 1,
				pos_XY = { x = 0, y = 0.01, xr = "par", yr = "par" },
				size_WH = { w = 1, h = 0.08, wr = "par", hr = "par" },
			},
			
			Text = {
				textStyle = "FEButtonTextStyle",
				color = {255,255,255,255},
				vAlign = "Middle",
				hAlign = "Center",
			},
		},
		
		-- text label for campaign title2
		{
			type = "TextLabel",
			name = "titleLabel2",
			visible = 0,
			
			Layout = {
				sector = 1,
				pos_XY = { x = 0, y = 0.10, xr = "par", yr = "par" },
				size_WH = { w = 1, h = 0.08, wr = "par", hr = "par" },
			},
			
			Text = {
				textStyle = "FEButtonTextStyle",
				color = {255,255,255,255},
				vAlign = "Middle",
				hAlign = "Center",
			},
		},
	},
}