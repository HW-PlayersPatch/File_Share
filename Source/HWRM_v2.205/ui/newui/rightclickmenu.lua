dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

RightClickMenu = {
	size = { 0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",

	claimMousePress = 1,

	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	--backgroundColor = COLOR_RED_SOLID,

	;

	-- the root frame for the menu... add children to this
	{
		type = "Frame",
		name = "menu",
		position = { 0, 0},
		autosize = 1,
		--autoarrange = 1,
		arrangetype="vert",			
		visible = 1,
		arrangeSep = {	x=0, y=2/600, xr="scr", yr="scr"},
		--backgroundColor = "IGColorBackground1",
		--backgroundColor = COLOR_BLUE_SOLID,
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
	},
	
	-- item to clone to make sub-menus
	{
		type = "Frame",
		name = "subMenu",
		position = { 0, 0},
		arrangetype="vert",		
		arrangeSep = {	x=0, y=2/600, xr="scr", yr="scr"},
		autosize = 1,
		autoarrange = 1,
		visible = 0,
		--backgroundColor = "IGColorBackground1",
		--backgroundColor = COLOR_YELLOW_SOLID,
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
	},
	
	-- menu title to clone and insert into menu
	{
		type = "TextLabel",
		name = "menuLabel",
		position = {0, 0},
		size = { 130, 13},
		wrapping = 1,
		--autosize = 1,
		visible = 0,
		Text = {
			textStyle = "RightClickMenu_ButtonTextStyle",
			hAlign = "Left",
			color = { 255, 255, 255, 255},
		},
		backgroundColor = COLOR_LISTITEM_TITLEBAR,
	},
	
	-- menu item to clone and insert into menu
	{
		type = "Frame",
		name = "menuItem",
		autosize = 1,
		visible = 0,
		--backgroundColor = COLOR_PURPLE_SOLID,
		BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
		--borderWidth = 1,
		--borderColor = { 0, 175, 255, 255},
		;
		
		{
			type = "TextButton",
			name = "text",
			buttonStyle = "RightClickMenu_ButtonStyle",
			position = {0,0},
			size = {130, 13},
			Text = {
				textStyle = "RightClickMenu_ButtonTextStyle",
				hAlign = "Left",
				offset = { 3, 0},
			},


			--disabledColor = { 255, 0, 0, 255 },
			;
			
			{
				type = "Frame",
				name = "rightarrow",
				position = { 120, 1},
				size = { 11, 9},
				visible = 0,
				BackgroundGraphic = {
					size = {11, 9},
					texture = "DATA:UI\\NewUI\\InGameIcons\\menuarrow.tga",
					textureUV = { 0, 0, 11, 9 },
				},
			},
		},
	},
}
