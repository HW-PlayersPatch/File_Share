dofilepath("data:ui/newui/Examples/ExampleScreen_deaton.lua")
dofilepath("data:ui/newui/Examples/ExampleScreen_Layout.lua")
dofilepath("data:ui/newui/Examples/ExampleScreen_Borders.lua")
dofilepath("data:ui/newui/Examples/ExampleScreen_Buttons.lua")
dofilepath("data:ui/newui/Examples/ExampleScreen_RMControls.lua")

UI_LoadUILibrary("data:/ui/newui/Examples/ExampleIncludesCallbacks.lua")

--second time shouldn't load the screen again
UI_LoadUILibrary("data:/ui/newui/Examples/ExampleIncludesCallbacks.lua")


EXAMPLE_SCREENS = {
		type = "Frame",
		name = "Example_Screens",
		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" },		
			size_WH = {w = 1.0,	h = 1.0,wr = "scr",	hr = "scr"	},		
		}	
	;
	-- Screens
	EXAMPLE_DEBUGSCREEN,
	EXAMPLE_SCREENLAYOUT,
	EXAMPLE_SCREENBORDERS,
	EXAMPLE_RMCONTROLS,
	EXAMPLE_BUTTONS,
	}

-- Debug UI Tools...
EXAMPLE_UITOOLBUTTONS = {
		type = "Frame",
		
		Layout = {	
			pos_XY = { x = 0.0, y = 1.0, xr = "scr", yr = "scr" },		
			pivot_XY = { 0.0, 1.0 },
		--	size_WH = {w = 1.0,	h = 1.0,wr = "scr",	hr = "scr"	},		
		},	
		customData3 = 1,
		--backgroundColor = {255,0,0,255},
		arrangetype = "horiz",
		arrangedir = 1,
		autosize = 1,
		visible = 1,
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Styles\\Buttons_Patched.tga",
			uvRect = { 1/64, 17/128, 31/64, 31/128 },
			patch_X = { 4, -22, 4, 0 },
			patch_Y = { 3, -8, 3, 0 },
			patch_PadX = {3, -3},
			patch_PadY = {2, -2},
			patch_Scale = 1,
		}
		;

		
		-- Hide examples button
		{
			type = "TextButton",
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				margin_RB = { r = 8, b = 0, rr = "px", br = "px" },
			},
			buttonStyle = "HD_HUD_Type1",
			autosize = 1,
			ignored = 1,
			visible = 0,
			name = "DEBUG_HideButton",
			
			Text = {
				textStyle = "TaskbarHD_ButtonTextStyle",
				text = "Hide Tools",
			},
			onMouseClicked = [[
				UI_SetElementVisible('NewMainMenu', 'DEBUG_ShowButton', 1);
				UI_SetElementVisible('NewMainMenu', 'DEBUG_HideButton', 0);				
				UI_SetElementVisible('NewMainMenu', 'MainMenu_Panel', 1);	
				UI_SetElementVisible('NewMainMenu', 'VersionFrame', 1);	

				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_Button_ScreenBorders', 0);
				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_Button_ScreenLayout', 0);
				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_Button_deaton', 0);

				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_ScreenLayout', 0);
				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_ScreenBorders', 0);
				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_deaton', 0);				
				
			]],
		},
		-------------------------------------------------------------
		-- Show Example buttons
		{
			type = "TextButton",
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
			},
			buttonStyle = "HD_HUD_Type1",
			autosize = 1,
			ignored = 1,
			name = "DEBUG_ShowButton",

			Text = {
				textStyle = "TaskbarHD_ButtonTextStyle",
				text = "<b>Show</b> <i>Tools</i>",
			},
			onMouseClicked = [[
				UI_SetElementVisible('NewMainMenu', 'DEBUG_ShowButton', 0);
				UI_SetElementVisible('NewMainMenu', 'DEBUG_HideButton', 1);	
				UI_SetElementVisible('NewMainMenu', 'MainMenu_Panel', 0);	
				UI_SetElementVisible('NewMainMenu', 'VersionFrame', 0);	

				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_Button_ScreenLayout', 1);
				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_Button_ScreenBorders', 1);
				UI_SetElementVisible('NewMainMenu', 'EXAMPLE_Button_deaton', 1);
			]],
		},

		-- Show layout example button
		{
			type = "TextButton",
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
			},
			buttonStyle = "HD_HUD_Type1",
			autosize = 1,
			ignored = 1,
			name = "EXAMPLE_Button_ScreenLayout",
			visible = 0,

			Text = {
				textStyle = "TaskbarHD_ButtonTextStyle",
				text = "Layout Example",
			},
			onMouseClicked = "ShowExample(\"ExampleIncludes.lua\", \"EXAMPLE_Button_ScreenBorders\", \"EXAMPLE_ScreenLayout\");",
		},

		-- Show Borders example button
		{
			type = "TextButton",
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
			},
			buttonStyle = "HD_HUD_Type1",
			autosize = 1,
			ignored = 1,
			name = "EXAMPLE_Button_ScreenBorders",
			visible = 0,

			Text = {
				textStyle = "TaskbarHD_ButtonTextStyle",
				text = "Borders Example",
			},
			onMouseClicked = "ShowExample(\"ExampleIncludes.lua\", \"EXAMPLE_Button_ScreenBorders\", \"EXAMPLE_ScreenBorders\");",

		},

		-- Show deaton example button
		{
			type = "TextButton",
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
			},
			buttonStyle = "HD_HUD_Type1",
			autosize = 1,
			ignored = 1,
			name = "EXAMPLE_Button_deaton",
			visible = 0,

			Text = {
				textStyle = "TaskbarHD_ButtonTextStyle",
				text = "Deaton Examples",
			},
			onMouseClicked = "ShowExample(\"ExampleIncludes.lua\", \"EXAMPLE_Button_ScreenBorders\", \"EXAMPLE_deaton\");",
		},
		

	}