dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")


ChatScreen = {
	--size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	eventOpaque = 0,
	RootElementSettings = {

	},
	
	--autosize=1,
	--
	soundOnShow = "SFX_ChatMenuONOFF",
	soundOnHide = "SFX_ChatMenuONOFF",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	callUpdateWhenInactive = 1,
	
	-- Localizer format IDs for broadcast and whisper chat messages.  These should be the same in all screens ChatUI is used.
	sayFormatID = 3354,
	whisperFormatID = 3365,	
	whisperEchoFormatID = 3369,
	whisperTeamEchoFormatID = 3353,
	whisperTeamFormatID = 3355,
	backgroundColor = {0,0,255,200},	
	blockMouseWheel = 1,
	;


		{
			type = "Frame",		

			name = "m_frmDialogRoot",
			arrangetype = "horiz",
					
			Layout = {			
					pivot_XY = { .5, 0 },
					size_WH = { w = .45, h = 100/600, wr = "scr", hr = "scr" },				
			},			
			Anchor_Binds = {
				pivotY = "Taskbar_ResourceBottomCenter3",
				pivotX = "Taskbar_ResourceBottomCenter3",
			},	

			arrangedir = 1,	

			
			arrangeSep = {	x=PANEL_PAD_HORIZ, y=0, xr="scr", yr="scr",},	


			;

			-- Chat box
			{
				type = "Frame",		

				name = "m_frmDialogRoot",
				arrangetype="vert",
				Layout = {						
					size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
				},
				backgroundColor = {0,0,0,50},	
				;


				-- chat window
				{
					type = "ListBox",
					listBoxStyle = "FEListBoxStyle_Bordered",

					Layout = {						
						size_WH = { w = 1, h = 100, wr = "par", hr = "px" },
					},
					name = "listChat",
					hugBottom = 1,
					scrollBarPageSize = 76,
					scrollBarStepSize = 13,
					arrangeweight = 1.0,
					maxItems = 64,

				},

				{
					type = "Frame",		

					name = "TextEntryPanel",
					--arrangeweight = 1.0,
					--autosize=1,
					arrangetype="horiz",
					Layout = {						
						size_WH = { w = 1, h = 1, wr = "par", hr = "px" },
						pad_LT = { l = 2, t = 4/600, lr = "px", tr = "scr" },
					},
					autosize=1,
					--backgroundColor = {0,128,0,200},	
					;
					{
						type = "DropDownListBox",	

						Layout = {		
							size_WH = {w = 100/800, h = DROPDOWN_HEIGHT, wr = "scr", hr = "scr",},
							pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
							pivot_XY = { 0, 0.5 },	

						},

						name = "playerSelectDropDown",
						selected = 0,
						--helpTip = "$2792",
						ListBox = 
						{
							backgroundColor = {0,0,0,255},
							width = 242,
							;

								
						},

					},		
					{
						type = "TextLabel",		

						Layout = {
							pivot_XY = { 0, .5 },	
							pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },
						},
						autosize=1,

						Text = {
							font = "ChatFont",
							color = { 255, 255, 255, 255},
							hAlign = "Left",
							text = "$2848", -- >
						},
						giveParentMouseInput = 1,
					},	
					{
						type = "DestinationTextInput",
						name = "chatInput",
						--position = { 93, 81},
						Layout = {				
							pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
							pivot_XY = { 0, 0.5 },						
							size_WH = { w = 1, h = TEXTINPUT_HEIGHT, wr = "px", hr = "scr" },
						},
						arrangeweight = 1,
						textInputStyle = "FEChatTextInputStyle",
						backgroundColor = {0,0,0,20},			
						maxTextLength = 200,
						Text = {
							font = "ChatFont",
							color = { 255, 255, 255, 255},
							hAlign = "Left",
						},
					},
				
				},


			},

	

	},

	-- Player litboxitem template
	{
		type = "TextListBoxItem",
		name = "playerListBoxItemTemplate",
		buttonStyle = "FEListBoxItemButtonStyle",
		resizeToListBox = 1,
		Text = {
			textStyle = "FEListBoxItemTextStyle",
			text = "Playon",
		},
		ignored = 1,
		visible = 0,							
	},

	-- Player litboxitem template
	{
		type = "TextListBoxItem",
		name = "groupListBoxItemTemplate",
		buttonStyle = "Chat_GroupButtonStyle",
		resizeToListBox = 1,
		Text = {
			textStyle = "FEListBoxItemTextStyle",
			text = "Group",
		},
		ignored = 1,
		visible = 0,						
	},



	-- chat item
	{
		type = "ListBoxItem",
		name = "listItem",
		autosize = 1,
		visible = 0,
		ignored = 1,
		;
				
		{
			type = "TextLabel",
			name = "text",
			position = {4, 0},
			size = { 242, 12},
			wrapping = 1,
			autosize = 1,
			Text = {
				font = "ChatFont",
				color = { 255, 255, 255, 255},
				hAlign = "Left",
			},
		},
	},




}
