dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")

UserProfile = {
	Layout = {						
		pos_XY = {	x=0.0, y=0.0, xr="px", yr="px",},					
		size_WH = {w = 1, h = 1, wr = "scr", hr = "scr",},
	},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	;

	------------------------------------------------------------------------------------
	-- SCREEN HEADER
	------------------------------------------------------------------------------------
	{
		type = "RmWindow",
		WindowTemplate = SCREENHEADER_WINDOWSTYLE,
		TitleText = "$3516", -- PLAYER PROFILES
		SubTitleText = "$3518", -- MANAGE PLAYER PROFILES
		Layout = {	
			size_WH = {	w = 1.0, h = 180.0/540, wr = "par", hr = "scr" },							
		},				
		--autosize=1,
		;
	},
	

	------------------------------------------------------------------------------------
	-- MAIN WINDOW FRAME (Window and Navigation Panel)
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		name = "frmRootbottombigfrm",
		Layout = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},			
			size_WH = {	w = .8, h = 1, wr = "par", hr = "px" },			
		},	
		autosize=1,
		arrangetype = "vert",
		arrangeSep = {	x=0, y=PANEL_SPACING_VERT, xr="scr", yr="scr",},	
		;
		------------------------------------------------------------------------------------
		-- WINDOW FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			WindowTemplate = PANEL_WINDOWSTYLE,
			TitleText = "$3506", -- PLAYER PROFILES
			-- SubtitleText - text = "$3507",	
			Layout = {	
				size_WH = {	w = 1.0, h = 180.0/540, wr = "par", hr = "scr" },							
			},	
			;
		
				-- Profiles List box
				{
					type = "ListBox",
					listBoxStyle = "FEListBoxStyle_Bordered",
					--position = {1, 0},
					Layout = {			
						size_WH = {	w = 1.0, h =1 , wr = "par", hr = "par" },							
					},	
					name = "m_listProfiles",
					helpTipTextLabel = "m_lblHelpText", 
					helpTip = "$3508",
					scrollBarSpace = 6,
				},
		},
		
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "RmWindow",
			name = "frmRootbottombigfrm",			
		--	autosize=1,
		sizetype = "contain",
			arrangetype = "horiz",
			WindowTemplate = PANEL_NAVIGATIONFRAME,
			;		
				-- BUTTONS
				NewMenuButton("m_btnCancel",		"$2613",	"$3515",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined_Chipped",	nil,0),	
				NewMenuButton("m_btnCreateNew",		"$3510",	"$3509",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined_Chipped",	nil),
				NewMenuButton("m_btnPlayerSetup",	"$3512",	"$3511",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined_Chipped",	nil),
				NewMenuButton("m_btnDelete",		"$3514",	"$3513",	0,	BTN_FOOTER_STD_LAYOUT,	"FEButtonStyle1_Outlined_Chipped",	nil),
				NewMenuButton("m_btnAccept",		"$2619",	"$3517",	0,	BTN_FOOTER_YES_LAYOUT,	"FEButtonStyle1_Alert_Outlined_Chipped",	nil),
					
		},		


	},
	

					
	------------------------------------------------------------------------------------
	-- Items to Clone
	------------------------------------------------------------------------------------

	{
		type = "TextListBoxItem",
		name = "m_itemToClone",
		buttonStyle = "FEListBoxItemButtonStyle",
		visible = 0,
		enabled = 0,
		resizeToListBox = 1,
		Layout = {						
				
			size_WH = {	w = 1, h =32, wr = "par", hr = "px" },						
		},	
		Text = {
			textStyle = "FEListBoxItemTextStyle",
		},
		allowDoubleClicks = 1,
		autosize=1,
		--backgroundColor = COLOR_WHITE_SOLID,
		;
	},
			
	
	

}

	