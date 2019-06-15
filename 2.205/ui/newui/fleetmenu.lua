
FleetMenu = {
	size = { 0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	
	claimMousePress = 1,

	RootElementSettings = {
		onMouseClicked = "UI_ToggleScreen( 'FleetMenu', 0)",
		cursorType = "Normal",
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	onShow = "UI_SetButtonPressed('NewTaskbar', 'btnFleet', 1); UI_SetButtonTextHotkey('FleetMenu', 'btnForm1', '$5453', 149); UI_SetButtonTextHotkey('FleetMenu', 'btnForm2', '$5454', 139); ",
	onHide = "UI_SetButtonPressed('NewTaskbar', 'btnFleet', 0)",
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
			position = { 4, 448},
			size = { 138, 65},
			backgroundColor = "IGColorBackground1",
			;
			
			-- title
			{
				type = "TextLabel",
				position = {-2, 0},
				size = { 144, 18},
				borderColor = { 170, 227, 255, 255},
				borderWidth = 2,
				Text = {
					textStyle = "IGHeading2",
					hAlign = "Left",
					offset = { 8, 0},
					color = { 255, 255, 255, 255},
					text = "$5452", -- FLEET INFO//
				},
			},
			
			-- menu items
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm1",
				toggleButton = 0,
				position = { 2, 21},
				size = { 133, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					--text = "$5453",--Population Info(%s)
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'UnitCapInfoPopup', ePopup)",
				hotKeyID = 149,
			},
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm2",
				toggleButton = 0,
				position = { 2, 35},
				size = { 133, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					--text = "$5454",--Global Queues
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'BuildQueueMenu', ePopup)",
				hotKeyID = 139,
			},
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm3",
				toggleButton = 0,
				position = { 2, 49},
				size = { 133, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "$5455",--None
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_HideScreen( 'BuildQueueMenu'); UI_HideScreen( 'UnitCapInfoPopup');",
			},
		},

		-- empty frame over button on task bar so menu doesn't disappear right away
		{
			type = "Frame",
			name = "menu",
			--backgroundColor = {200,0,0,200},
			position = { 2, 514},
			size = { 76, 19},
			onMouseClicked = "UI_ToggleScreen( 'FleetMenu', 0)",
		},
	},
}
