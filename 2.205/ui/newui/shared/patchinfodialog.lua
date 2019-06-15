-- Almost identical to GameTypeInfo.lua, except the different width and the UI_HideScreen at the bottom

DIALOGWIDTH = 512
MOREINFOWIDTH = DIALOGWIDTH - 7
MOREINFOHEIGHT = 100

PatchInfoDialog = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	RootElementSettings = {
		backgroundColor = "FEColorBackground2",
	},
	;
		
	{
		type = "Frame",
		name = "m_frmDialogRoot",
		--position = {400 - DIALOGWIDTH / 2, 225},
		size = {DIALOGWIDTH, 100},
		backgroundColor = "FEColorDialog",
		autosize = 1,
		marginHeight = 1,
		;
		
		-- background frame
		{
			type = "Frame",
			position = {4,4},
			size = {DIALOGWIDTH-8, 70},
			style = "FEPopupBackgroundStyle",
		},
		
		-- header border frame
		{
			type = "Frame",
			position = {2, 2},
			size = {DIALOGWIDTH-4, 32},
			;
			{
				type = "Frame",
				size = {DIALOGWIDTH-4, 34},
				borderWidth = 2,
				borderColor = "FEColorPopupOutline",
			},
		},
		
		{
			type = "Frame",
			position = {1,0},
			autosize = 1,
			autoarrange = 1,
			autoarrangeWidth = DIALOGWIDTH-2,	
			autoarrangeSpace = 2,
			;
		
			-- Title / Subtitle frame
			{
				type = "Frame",
				size = {DIALOGWIDTH-5, 29},			
				;
				
				-- Title
				{
					type = "TextLabel",
					name = "lblTitle",
					position = {4,0},
					size = {DIALOGWIDTH-10, 15},
					Text = {
						textStyle = "FEHeading3",
						vAlign = "Middle",
						text = "$2562",--UPDATE INFO
					},
				},
				
				-- Subtitle
				{
					type = "TextLabel",
					position = {4,15},
					size = {DIALOGWIDTH-10, 13},
					Text = {
						textStyle = "FEHeading4",
						text = "$2563",--UPDATE INFORMATION//
					},
				},
			},
			
			
			
			-- Contents frame (border)
			{
				type = "Frame",
				outerBorderWidth = 1,
				position = {3,30},
				autosize = 1,
				borderColor = "FEColorPopupOutline",
				autoarrange = 1,
				;
				
				-- Error Message frame
				{
					type = "Frame",
					borderWidth = 1,
					borderColor  = "FEColorPopupOutline",
					autosize = 1,
					autoarrange = 1,
					;
					
					-- ErrorMessage Label
					{
						type = "TextLabel",
						name = "lblDescription",
						width = DIALOGWIDTH - 6,
						autosize = 1,
						wrapping = 1,
						minSize = {DIALOGWIDTH - 6, 40},
						marginHeight = 4,
						marginWidth = 4,
						name = "m_lblErrorMessage",
						Text = {
							textStyle = "FEHelpTipTextStyle",
							vAlign = "Top",
						},
						;
					},
				},
				
				-- Button tray frame
				{
					type = "Frame",
					name = "m_frmButtons",
					size = {DIALOGWIDTH - 6, 17},					
					borderWidth = 1,
					borderColor = "FEColorPopupOutline",
					;
					
					-- Accept button
					{
						type = "TextButton",
						position = {(DIALOGWIDTH - 6) / 2 - 61, 2}, 
						name = "btnOk",
						buttonStyle = "FEButtonStyle2",
						Text = {
							textStyle = "FEButtonTextStyle",
							text = "$3614",--OK
						},
						
						onMouseClicked = "UI_HideScreen('PatchInfoDialog')",
					},
				},
			},
		},
	},
}

	