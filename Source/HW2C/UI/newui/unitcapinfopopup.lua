-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

UnitCapInfoPopupWidth = 200
MAXHEIGHT = 325

UnitCapInfoPopup = {maxColor = {255, 0, 0, 255}, availColor = {0, 255, 0, 255}, size = {2, 71, 100, 200}, RootElementSettings = {autosize = 1}, onShow = "UI_HideScreen('BuildQueueMenu')", stylesheet = "HW2StyleSheet", pixelUVCoords = 1, clickThrough = 1, ;
	{type = "Frame", name = "frmTabSpacer", size = {10, 15}, giveParentMouseInput = 1},
	{type = "TextLabel", name = "lblNameToClone", position = {4, 0}, size = {(UnitCapInfoPopupWidth - 16), 15}, Text = {textStyle = "IGHeading2"}, giveParentMouseInput = 1, dropShadow = 1, visible = 0},
	{type = "Frame", name = "frmItemToClone", autosize = 1, giveParentMouseInput = 1, visible = 0, ;
	{type = "Frame", name = "frmName", position = {4, 0}, size = {(UnitCapInfoPopupWidth - 50), 15}, autoarrange = 1, autoarrangeWidth = 300},
	{type = "TextLabel", name = "lblUnitCap", position = {(UnitCapInfoPopupWidth - 46), 0}, size = {45, 15}, Text = {font = "ChatFont", color = {255, 255, 255, 255}, hAlign = "Right", vAlign = "Middle", text = "<c %06x>%d</c> / %d", offset = {-6, 0},}, giveParentMouseInput = 1, dropShadow = 1},},
	{type = "Frame", autosize = 1, giveParentMouseInput = 1, autoarrange = 1, autoarrangeWidth = UnitCapInfoPopupWidth, maxSize = {UnitCapInfoPopupWidth, MAXHEIGHT}, ;
	{type = "Frame", name = "frmItems", autosize = 1, autoarrange = 1, autoarrangeWidth = UnitCapInfoPopupWidth, giveParentMouseInput = 1},},}
