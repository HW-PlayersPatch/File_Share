-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:ui/newui/errormessage.lua")

SBARWIDTH = 20
COLWIDTH = (((MOREINFOWIDTH - SBARWIDTH) - 4) / 2)

MissingModColor = {255, 0, 0, 255}
MissingText = "MISSING MOD"

UnmatchingModsTable = {type = "Frame", size = {MOREINFOWIDTH, MOREINFOHEIGHT}, ;
	{type = "Line", p1 = {0, 19}, p2 = {(MOREINFOWIDTH + 2), 19}, lineWidth = 2, above = 0, color = "FEColorPopupOutline"},
	{type = "Line", p1 = {((MOREINFOWIDTH - SBARWIDTH) + 2), 0}, p2 = {((MOREINFOWIDTH - SBARWIDTH) + 2), (MOREINFOHEIGHT + 2)}, lineWidth = 2, above = 0, color = "FEColorPopupOutline"},
	{type = "Table", name = "tableMods", backgroundColor = {0, 0, 0, 0}, tableStyle = "FETableStyle", position = {2, 2}, size = {(MOREINFOWIDTH - 5), (MOREINFOHEIGHT - 5)}, selectedRowColor = {0, 0, 0, 0}, Columns = {{width = COLWIDTH, TitleCell = {type = "TableCell", ;
	{type = "TextButton", name = "TableTitleClientMods", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$5165", textStyle = "FETableTitleTextStyle"},},},}, {width = COLWIDTH, TitleCell = {type = "TableCell", ;
	{type = "TextButton", name = "TableTitleNumGames", buttonStyle = "FETableTitleButtonStyle", Text = {text = "$5166", textStyle = "FETableTitleTextStyle"},},},},},},}
