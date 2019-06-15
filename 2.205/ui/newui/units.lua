-- todo: rename this to versionInfo,
-- it is no longer used to store the unit caps info
UnitsMenu = {	
	size = {0, 0, 582, 15},	
	stylesheet = "HW2StyleSheet",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	flash = 6, -- number of times button will flash when unit caps are reached
	
	--Regions = {
	--	{0,0,122, 15},	-- clickable region
	--},
	
	clickThrough = 1,
	
	-- Lua functions
	--onUpdate = [[
	--	UI_SetTextLabelText("UnitsMenu", "lblVersionInfo", GetVersionInfo());
	--]],		
	;	
	
	-- Population Frame
	--{
	--	type = "Frame",
	--	position = {0,0},
	--	size = {122, 15},
	--	backgroundColor = "IGColorBackground1",
	--	;
		
		-- Fleet info button
		--{
		--	type = "TextButton",
		--	position = {1, 1},
		--	size = {120, 13},
		--	buttonStyle = "Taskbar_MenuButtonStyle",
		--	toggleButton = 0,
		--	Text = {
		--		textStyle = "Taskbar_MenuButtonTextStyle",
		--		text = "$5164", -- FLEET INFO
		--	},
		--	name = "btnFleetInfo",
		--	onMousePressed = "UI_ToggleScreen( 'UnitCapInfoPopup', 0)",
		--	
		--	soundOnEnter = "SFX_ButtonEnter",
		--	soundOnPressed = "SFX_ButtonClick",
		--},
	--},
	
	-- Version label
	--{
	--	type = "TextLabel",
	--	position = {218, 0},
	--	size = {368, 13},
	--	name = "lblVersionInfo",
	--	backgroundColor = "IGColorBackground1",
	--	visible = 1, -- Set to zero to hide version info
	--	Text = {
	--		textStyle = "IGHeading2",
	--		hAlign = "Center",
	--		offset = {6, 0},
	--	},
	--},
}
	