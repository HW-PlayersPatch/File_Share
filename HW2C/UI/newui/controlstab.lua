-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

KEYBTNWIDTH = 240
SBARSPACE = 19

function GetControlsTab(_width, _height, _linecolor)
	local LBOXHEIGHT = (_height - 19)
	local LocalControlsTab = {type = "Frame", name = "m_frameControlsTab", size = {_width, _height}, visible = 0, ;
	{type = "ListBox", name = "m_listControls", size = {(_width - 2), LBOXHEIGHT}, ScrollBar = {pageSize = 200},},
	{type = "Line", p1 = {(_width - SBARSPACE), 0}, p2 = {(_width - SBARSPACE), LBOXHEIGHT}, lineWidth = 2, above = 1, color = _linecolor},
	{type = "Line", p1 = {0, LBOXHEIGHT}, p2 = {_width, LBOXHEIGHT}, above = 0, lineWidth = 2, color = _linecolor},
	{type = "TextButton", name = "m_btnRestoreDefaults", width = 180, position = {(_width - 364), (_height - 15)}, buttonStyle = "FEButtonStyle1", Text = {textStyle = "FEButtonStyle1NoEnterSound", text = "$5097"}, helpTip = "$5099", helpTipTextLabel = "m_lblHelpText"},
	{type = "TextButton", name = "m_btnReset", width = 180, position = {(_width - 182), (_height - 15)}, buttonStyle = "FEButtonStyle1NoEnterSound", Text = {textStyle = "FEButtonTextStyle", text = "$5182"}, helpTip = "$5098", helpTipTextLabel = "m_lblHelpText"},
	{type = "ListBoxItem", name = "m_headerListBoxItemToClone", size = {(_width - SBARSPACE), 15}, selectable = 0, visible = 0, ;
	{type = "TextLabel", name = "m_lblHeaderTitle", size = {(_width - SBARSPACE), 13}, Text = {color = {255, 215, 0, 255}, offset = {7, 0},},},},
	{type = "ListBoxItem", name = "m_nonEditableListBoxItemToClone", size = {(_width - SBARSPACE), 15}, visible = 0, selectable = 0, ;
	{type = "TextLabel", name = "m_lblKeyName", size = {(((_width - KEYBTNWIDTH) - 2) - SBARSPACE), 13}, Text = {font = "ButtonFont", color = {255, 255, 255, 255}, vAlign = "Middle", offset = {30, 0},},},
	{type = "TextButton", enabled = 0, name = "m_btnKey", buttonStyle = "FEButtonStyle1NoEnterSound", width = KEYBTNWIDTH, position = {(((_width - KEYBTNWIDTH) - 2) - SBARSPACE), 0}, Text = {font = "ButtonFont", color = {255, 255, 255, 255}, vAlign = "Middle", hAlign = "Center"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5183"},},
	{type = "ListBoxItem", name = "m_editableListBoxItemToClone", size = {(_width - SBARSPACE), 15}, visible = 0, pressedColor = {255, 255, 255, 50}, ;
	{type = "TextLabel", name = "m_lblKeyName", size = {(((_width - KEYBTNWIDTH) - 2) - SBARSPACE), 13}, Text = {font = "ButtonFont", color = {255, 255, 255, 255}, vAlign = "Middle", offset = {30, 0},},},
	{type = "TextButton", name = "m_btnKey", buttonStyle = "FEButtonStyle1NoEnterSound", width = KEYBTNWIDTH, position = {(((_width - KEYBTNWIDTH) - 2) - SBARSPACE), 0}, Text = {font = "ButtonFont", color = {255, 255, 255, 255}, vAlign = "Middle", hAlign = "Center"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5184"},},}
	return LocalControlsTab;
end

KeyBindingList = {
	{title = 5190, keys = {43, 1, 164, 1, 26, 1, 18, 0},},
	{title = 5191, keys = {5, 1, 7, 1, 9, 1, 10, 1, 11, 1, 12, 1, 14, 1, 15, 1, 16, 1, 17, 1, 19, 1, 20, 1, 21, 1, 22, 1, 23, 1, 24, 1, 25, 1, 56, 1, 143, 1, 144, 1, 145, 1, 146, 1, 147, 1},},
	{title = 5192, keys = {60, 0, 61, 0, 62, 0, 63, 0, 64, 0, 65, 0, 66, 0, 67, 0, 68, 0, 69, 0, 70, 0, 71, 0, 72, 0, 73, 0, 74, 0, 75, 0, 76, 0, 77, 0, 78, 0, 79, 0, 166, 1, 167, 1},}, 
	{title = 5193, keys = {48, 1, 49, 1, 50, 1, 51, 1, 52, 1, 53, 1, 54, 1, 55, 1, 137, 1, 138, 1, 139, 1, 140, 1, 141, 1, 142, 1, 149, 1, 150, 1, 131, 1},},
	{title = 5194, keys = {32, 1, 33, 1, 34, 1, 35, 1, 36, 1, 28, 1, 29, 1, 30, 1, 31, 1},},
	{title = 5195, keys = {41, 1, 42, 1, 163, 1, 44, 1, 45, 1, 46, 1, 47, 1, 151, 1, 153, 1, 155, 1, 157, 1, 159, 1, 161, 1},},
	{title = 5196, keys = {99, 1, 100, 1, 101, 1, 102, 1, 90, 1, 91, 1, 92, 1, 93, 1, 94, 1, 95, 1, 96, 1, 97, 1, 98, 1, 80, 0, 81, 0, 82, 0, 83, 0, 84, 0, 85, 0, 86, 0, 87, 0, 88, 0, 89, 0},},
	{title = 5197, keys = {2, 0, 4, 0, 40, 0, 125, 0, 126, 0, 129, 0, 130, 1},},}
