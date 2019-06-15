--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
------------------------- DEPRECATED - DO NOT USE ------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

TacticsMenu = {
	size = { 0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",

	claimMousePress = 1,

	RootElementSettings = {
		onMouseClicked = "UI_ToggleScreen( 'TacticsMenu', 0)",
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	onShow = [[
	UI_SetButtonPressed('NewTaskbar', 'btnTactics', 1);
	UI_SetButtonTextHotkey('TacticsMenu', 'btnPassive', '$3132', 34); 
	UI_SetButtonTextHotkey('TacticsMenu', 'btnDefensive', '$3131', 35); 
	UI_SetButtonTextHotkey('TacticsMenu', 'btnAggressive', '$3130', 36); 
	]],
	
	onHide = "UI_SetButtonPressed('NewTaskbar', 'btnTactics', 0)",
	
	;

	-- root frame for moving screen so it moves with task bar when hidden
	{
		type = "Frame",
		name = "rootFrame",
		position = { 0, 0},
		size = { 800, 600},
		giveParentMouseInput = 1,
		;

		-- the root frame for the menu... add children to this
		{
			type = "Frame",
			name = "menu",
			position = { 79, 448},
			size = { 138, 65},
			backgroundColor = "IGColorBackground1",
			;
			
			-- title
			{
				type = "TextLabel",
				position = {-2, 0},
				size = { 142, 18},
				borderColor = { 170, 227, 255, 255},
				borderWidth = 2,
				Text = {
					textStyle = "IGHeading2",
					hAlign = "Left",
					offset = { 8, 0},
					color = { 255, 255, 255, 255},
					text = "$2733",
				},
			},
			
			-- menu items
			
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnPassive",
				toggleButton = 0,
				position = { 2, 21},
				size = { 133, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					--text = "$3162", -- set onShow
				},
				onMouseReleased = "UI_ToggleScreen( 'TacticsMenu', 0)",
				hotKeyID = 34,
			},
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnDefensive",
				toggleButton = 0,
				position = { 2, 35},
				size = { 133, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					--text = "$3161",  -- set onShow
				},
				onMouseReleased = "UI_ToggleScreen( 'TacticsMenu', 0)",
				hotKeyID = 35,
			},
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnAggressive",
				toggleButton = 0,
				
				position = { 2, 49},
				size = { 133, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					--text = "$3160", -- set onShow
				},
				onMouseReleased = "UI_ToggleScreen( 'TacticsMenu', 0)",
				hotKeyID = 36,
			},
			
		},

		-- empty frame over button on task bar so menu doesn't disappear right away
		{
			type = "Frame",
			name = "menu",
			--backgroundColor = {200,0,0,200},
			position = { 151, 515},
			size = { 69, 17},
			onMouseClicked = "UI_ToggleScreen( 'TacticsMenu', 0)",
		},
	},
}
