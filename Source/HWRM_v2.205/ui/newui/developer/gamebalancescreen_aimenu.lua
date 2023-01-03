dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
UI_LoadUILibrary("data:/ui/newui/Developer/GameBalanceScreen_AIMenu_Code.lua")

function CreateListboxItem(_text, _customstring, _mouseclick)

	local listitem = {
		type = "TextListBoxItem",
		buttonStyle = "FEListBoxItemButtonStyle",
		resizeToListBox = 1,
		Text = {
			textStyle = "FEListBoxItemTextStyle",
			text = _text,
		},
		onMouseClicked = _mouseclick,
		customDataString = _customstring,			

	}

	return listitem

end



BALANCE_AIMENU={
		type = "TabPage",
		text = "AI DEBUG",
		autosize=1,


		Layout = {
	--		pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
			size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
			pad_LT = { l = 0, t = 16, lr = "px", tr = "px" },
	--		pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
		},
		
		;

		{
			type = "Frame",		
			Layout = {	
					pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
					size_WH = {	w = .4, h = 100, wr = "scr", hr = "px" },	
					max_WH = {	w = .4, wr = "scr" },
					min_WH = {	w = .4, wr = "scr" },
			},	
			name = "frame_LeftTabs",
			arrangetype = "vert",
			autosize  = 1,
			arrangeSep = {	x=8, y=8, xr="px", yr="px",},
			--backgroundColor = {255,0,0,255},
			;
			--Turn on AI
			{
				type = "TextButton",
				name = "toggleAIDebugButton",

				Layout = {	
					--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
				},	
				autosize=1,
				buttonStyle = "FEButtonStyle1_Outlined",			
					
				Text = {
					text = "Enable CPU Debug",
					rel = 1080,
					minShrink = 0.25,
				},
				onMouseClicked = "AIMenuOnToggleDebug()",	
					
			},

			---------------------------------------------------------
			{
				type = "Frame",		
				name = "CpuDebugFrame",
				Layout = {	
						--pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
						size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },	
						--max_WH = {	w = .4, wr = "scr" },
						--min_WH = {	w = .4, wr = "scr" },
				},	
				BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
				enabled = 0,
				arrangetype = "vert",
				arrangeSep = {	x=8, y=8, xr="px", yr="px",},
				;
				
				-- Choose ship combo box
				{
					type = "DropDownListBox",
					name  = "CpuDebugSelection",
					backgroundColor = COLOR_LISTITEM,
					BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
					dropDownListBoxStyle = "IGDropDownListBoxStyle",
					autosize = 1,
					
					Layout = {		
						--pos_XY = { y = 0.0, yr = "par" },							
						size_WH = {	w = 200, h = DROPDOWN_HEIGHT, wr = "px", hr = "scr" },
					},

					visible = 1,
					
		
					ListBox = {
						type = "ListBox",
						name = "comboCpuDebugSelListBox",
						Layout = {							
							size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },										
						},
						backgroundColor = "IGColorBackground1",
						BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
						onItemSelect  = "AIMenu_SelectPlayer(%c1)",

						ItemToClone = {
							type = "TextListBoxItem",
							buttonStyle = "FEListBoxItemButtonStyle",
							resizeToListBox = 1,
							Text = {
								textStyle = "FEListBoxItemTextStyle",
								text = "",
							},
						},

					},
		
					helpTip = "Select CPU to Debug", -- SELECT BUILD SHIP
				},
				-------------------------------------------
				{
					type = "DropDownListBox",
					name  = "DebugModeDropDown",
					backgroundColor = COLOR_LISTITEM,
					BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
					dropDownListBoxStyle = "IGDropDownListBoxStyle",
					autosize = 1,
					selected = 1,
					Layout = {		
						--pos_XY = { y = 0.0, yr = "par" },							
						size_WH = {	w = 200, h = DROPDOWN_HEIGHT, wr = "px", hr = "scr" },
					},

					visible = 1,
					
		
					ListBox = {
						type = "ListBox",
						name = "comboCpuDebugSelListBox",
						Layout = {							
							size_WH = {	w = 1, h = 1.0, wr = "par", hr = "px" },										
						},
						backgroundColor = "IGColorBackground1",
						BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
						;
						CreateListboxItem("DM_None","DM_None","AIMenu_SetDebugMode(0)"),
						CreateListboxItem("DM_Overview","DM_Overview","AIMenu_SetDebugMode(1)"),
						CreateListboxItem("DM_Classifier","DM_Classifier","AIMenu_SetDebugMode(2)"),
						CreateListboxItem("DM_Resource","DM_Resource","AIMenu_SetDebugMode(3)"),
						CreateListboxItem("DM_BlobStats","DM_BlobStats","AIMenu_SetDebugMode(4)"),
						CreateListboxItem("DM_Fleet","DM_Fleet","AIMenu_SetDebugMode(5)"),
						CreateListboxItem("DM_Build","DM_Build","AIMenu_SetDebugMode(6)"),
						CreateListboxItem("DM_Research","DM_Research","AIMenu_SetDebugMode(7)"),
					},
		
					helpTip = "Select CPU to Debug", -- SELECT BUILD SHIP
				},
				--------------------------
				{
					type = "TextButton",
					name = "toggleLookAtPlayer",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Analyze Player...",
						rel = 1080,
						minShrink = 0.25,
					},
					onMouseClicked = "AIMenu_ToggleLookAtPlayer()",	
					
				},
				--------------------------
				{
					type = "TextButton",
					name = "toggleAllFlags",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Toggle All Flags",
						rel = 1080,
						minShrink = 0.25,
					},
					onMouseClicked = "AIMenu_ToggleAllFlags()",	
					
				},


			}

		},



	}