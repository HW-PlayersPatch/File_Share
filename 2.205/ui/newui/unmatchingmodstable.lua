dofilepath("data:ui/newui/errormessage.lua") -- for MOREINFOWIDTH and MOREINFOHEIGHT

SBARWIDTH = 20

COLWIDTH = (MOREINFOWIDTH - SBARWIDTH - 4) / 2

MissingModColor = {255,0,0,255} -- text color for missing mods
MissingText = "MISSING MOD"

-- Table Border frame
UnmatchingModsTable  = {
	type = "Frame",
		Layout = {	
			pad_LT  = { l = 0, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
			pad_RB  = { r = 0, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
			size_WH = {	w = 1, h = .3, wr = "par", hr = "scr" },							
		},
	;
	


	
	-- DEFINITION FOR (tbl) tableGames
	{
		type = "Table",
		name = "tableMods",
		
		--backgroundColor = {255,0,0,255},
		tableStyle = "FETableStyle",
		
		Layout = {	
			pad_LT  = { l = 0, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
			pad_RB  = { r = 0, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
			size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },							
		},
		selectedRowColor = {0,0,0,0},
		backgroundColor = FEColorBackground1,
		
		Columns = {
			;
			-- client mods
			{
				width = .5,
				TitleCell = {
					type = "TableCell",
					--helpTipTextLabel = "m_lblHelpText",
					--helpTip = "SORT BY SERVER NAME",
					;
					{
						type = "TextButton",
						name = "TableTitleClientMods",
						buttonStyle = "FETableTitleButtonStyle",
						Text = {
							text = "$5165",
							textStyle = "FETableTitleTextStyle",
						},
					}
				},
			},
			
			-- server mods
			{
				width = .5,
				TitleCell = {
					type = "TableCell",
					--helpTipTextLabel = "m_lblHelpText",
					--helpTip = "SORT BY NUMBER OF GAMES",
					;
					{
						type = "TextButton",
						name = "TableTitleNumGames",
						buttonStyle = "FETableTitleButtonStyle",
						Text = {
							text = "$5166",
							textStyle = "FETableTitleTextStyle",
						},
					}
				},
			},	
		},
	}
}

	