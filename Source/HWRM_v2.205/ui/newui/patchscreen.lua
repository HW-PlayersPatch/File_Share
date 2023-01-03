PatchScreen = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	backgroundColor = {0,0,0,0},

	LocalizedMessages = 
	{
		[ LM_CheckingForPatch ] 	= "$1000", -- "Checking for update",
		[ LM_PatchAvailable ] 		= "$1001", -- "There is a new update available",
		[ LM_PatchUnavailable ] 	= "$1002", -- "You have the current version",
		[ LM_ChooseLocation ] 		= "$1003", -- "Please choose a download location",
		[ LM_Downloading ] 		= "$1004", -- "Downloading",
		[ LM_DownloadingPatchInfo ] = "$1005", -- "Downloading update Info",
		[ LM_DeterminingPatchSize ]	= "$1006", -- "Determining update size",
		[ LM_DownloadStartFailed ] 	= "$1007", -- "Failed to start download",
		[ LM_DownloadComplete ] 	= "$1008", -- "Download Complete.  Press the Apply button to install the update",
		[ LM_Cancelled ] 			= "$1009", -- "Cancelled",
		[ LM_CouldNotStartOp ] 	= "$1010", -- "Error: could not start operation",
		[ LM_GettingExtraInfo ] 	= "$1011", -- "Getting Extra Info",		
		[ LM_ErrorMirrorList ]		= "$1012", -- "Unable to download list of file mirrors",
		[ LM_NoMirrors ]			= "$1013", -- "No mirror locations available",
		[ LM_BadPatchURL ]		= "$1040", -- "Bad Patch URL.  Do not know how to handle patch of this type",
	}, 
    
	-- Download Status messages
	DownloadStatusMessages = 
	{
		[ DS_Invalid ] 			= "$1014", -- "Invalid",
		[ DS_HostLookup ] 		= "$1015", -- "Looking up host",
		[ DS_Connecting ]		= "$1016", -- "Connecting",
		[ DS_SendingRequest ]		= "$1017", -- "Sending Request",
		[ DS_Posting ]			= "$1018", -- "Posting",
		[ DS_Waiting ]			= "$1019", -- "Waiting",
		[ DS_ReceivingStatus ]		= "$1020", -- "Receiving status",
		[ DS_ReceivingHeaders ]	= "$1021", -- "Receiving headers",
		[ DS_ReceivingFile ]		= "$1022", -- "Receiving file",
	},
	
	CompletionResultMessages = 
	{	
		[ CR_Invalid ]			= "$1023", -- "Invalid",
		[ CR_Success ]			= "$1024", -- "Success",
		[ CR_OutOfMemory ]		= "$1025", -- "Out of memory",
		[ CR_BufferOverflow ] 		= "$1026", -- "Buffer overflow",
		[ CR_ParseURLFailed ] 		= "$1027", -- "Parsing of URL failed",
		[ CR_HostLookupFailed ]	= "$1028", -- "Host lookup failed",
		[ CR_SocketFailed ]		= "$1029", -- "Socket failed",
		[ CR_ConnectFailed ]		= "$1030", -- "Connection failed",
		[ CR_BadResponse ]		= "$1031", -- "Bad response",
		[ CR_RequestRejected ]	= "$1032", -- "Request rejected",
		[ CR_Unauthorized ]		= "$1033", -- "Unauthorized Access",
		[ CR_Forbidden ]			= "$1034", -- "Forbidden Access",
		[ CR_FileNotFound ]		= "$1035", -- "File not found",
		[ CR_ServerError ]		= "$1036", -- "Server error",
		[ CR_FileWriteFailed ]		= "$1037", -- "File write failed",
		[ CR_FileReadFailed ]		= "$1038", -- "File read failed",
	},

	-- Localizer format IDs for extra patch info .
	extraInfoFormatID = 5186,
	extraInfoUnknownFormatID = 5187,	
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	;


	--DEFINITION FOR: (txtLbl) TITLE
	{
		type = "TextLabel",
		position = {16,-2},
		size = {750,36},
		name = "txtLblTITLE",
		Text = {
			text = "$5298", -- "UPDATES", 
			textStyle = "FEHeading1",
		},
		;
	},

	--DEFINITION FOR: (txtLbl) SUBTITLE
	{
		type = "TextLabel",
		position = {17,34},
		size = {750,21},
		name = "txtLblSUBTITLE",
		Text = {
			text = "$5299", -- "DOWNLOAD AND APPLY UPDATES", 
			textStyle = "FEHeading2",
		},
		;
	},

	-- background image
	{
		type = "Frame",
		position = {168, 184},
		size = { 463, 231 -15 -23},
		name = "frmCenter",
        	backgroundColor = "FEColorBackground1",		
		;
		
		-- Title
		{
			type = "TextLabel",
			position = {8, 1},
			size = {450, 16},			
			--autosize = 1,
			Text = {
				text = "$5158",
				textStyle = "FEHeading3",
				hAlign = "Left",
				vAlign = "Middle",
			},
		},
		
		-- SubTitle
		{
			type = "TextLabel",
			position = {8, 17},
			size = {450, 13},
			name = "lblProgress",			
			Text = {
				text = "$5159",
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
			},
		},
		
		-- border frame
		{
			type = "Frame",
			outerBorderWidth = 2,
			borderColor = "FEColorOutline",
			position = {4, 33},
			size = {455, 194-15-23},
		},
		
		-- line to right of listbox
		{
			type = "Line",
			p1 = {440, 31},
			p2 = {440, 172},
			above = 1,
			color = "FEColorOutline",
			lineWidth = 2,
		},
			
		-- line below listbox
		{
			type = "Line",
			p1 = {4, 139+33},
			p2 = {459, 139+33},
			above = 1,
			color = "FEColorOutline",
			lineWidth = 2,
		},
		
		
		
		-- progress
		{
			type = "ProgressBar",
			progressColor = { 255, 216, 0, 255},
			position = { 6, 174},
			size = { 451, 13 },
			name = "progressDownload",
			helpTipTextLabel = "lblHelpTip",
			helpTip = "$2670", -- "DOWNLOAD PROGRESS",
		},
		
--~ 		-- Progress Text
--~ 		{
--~ 			type = "TextLabel",
--~ 			position = {8, 174},
--~ 			autosize = 1,
--~ 			Text = {
--~ 				text = "Progress1",
--~                 		textStyle = "FEHeading4",
--~ 			},
--~ 			name = "lblProgress",
--~ 			helpTipTextLabel = "lblHelpTip",
--~ 			helpTip = "DOWNLOAD STATUS",
--~ 		},		

		-- Progress Text2
		{
			type = "TextLabel",
			position = {8, 176},
			autosize = 1,
			Text = {
				text = "Progress2",
                		textStyle = "FEHeading4",
			},
			name = "lblProgress2",
			helpTipTextLabel = "lblHelpTip",
			helpTip = "$2671", -- "DOWNLOAD STATUS",
		},		
		
		--DEFINITION FOR: (lstBox) _Mirrors
		{
			type = "ListBox",
			visible = 1,
			backgroundColor = {25,25,25,89},
			position = {6,33},
			size = {451,137},
			name = "lstBoxMirrors",
			helpTipTextLabel = "lblHelpTip",
			helpTip = "$2672", -- "SELECT A DOWNLOAD LOCATION",
			;
		},		
		--DEFINITION FOR: (lstBox) dummy list box to show when mirrors gets hidden
		{
			type = "ListBox",
			visible = 0,
			backgroundColor = {25,25,25,89},
			position = {6,33},
			size = {451,137},
			name = "lstBoxDummy",
			;
		},	
		--DEFINITION FOR: (lstBox) _MirrorsTemplate
		{
			type = "TextListBoxItem",
			buttonStyle = "FEListBoxItemButtonStyle",
			visible = 0,
			enabled = 0,
			Text = {
				font = "ListBoxItemFont",
				color = {255,255,255,255},
				offset = {4,0},
			},
			backgroundColor = {0,0,0,0},
			size = {432,13},
			name = "lstBoxMirrorsTemplate",
			;
		},
	},
	
	
	------------------------------------------------------------------------------------
	-- BOTTOM NAVIGATION FRAME
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		backgroundColor = "FEColorBackground1",
		position = {12,544},
		size = {776,44},
		name = "frmRootbottombigfrm",
		;
		-- OUTLINE FRAME
		{
			type = "Frame",
			borderWidth = 2,
			borderColor = "FEColorOutline",
			position = {2,2},
			size = {772,40},
			name = "frmbottomframe",
			;
			
			-- HELP TEXT
			{
				type = "TextLabel",
				position = {4,4},
				size = {764,13},
				name = "lblHelpTip",
				Text = {					
					textStyle = "FEHelpTipTextStyle",
				},
				;
			},
			
			-- LINE
			{
				type = "Line",
				above = 0,
				lineWidth = 2,
				color = "FEColorOutline",				
				p1 = {2, 19},
				p2 = {770, 19},
				
			},
			
			-- BUTTONS
			
			--DEFINITION FOR: (txtBtn) CANCEL
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle1",
				position = {4,23},
				name = "txtBtnCANCEL",
				Text = {
					text = "$5156",
					textStyle = "FEButtonTextStyle",
				},			
				helpTipTextLabel = "lblHelpTip",
				helpTip = "$3043", -- "RETURN TO MAIN MENU",
				;
			},
	
			--DEFINITION FOR: (txtBtn) BACK
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle1",
				position = {4,23},
				name = "m_btnBack",
				Text = {
					text = "$5160",
					textStyle = "FEButtonTextStyle",
				},
				helpTipTextLabel = "lblHelpTip",
				helpTip = "$3043", --"RETURN TO MAIN MENU",
				;
			},
			
			--DEFINITION FOR: (txtBtn) APPLY
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle1",
				position = {648,23},
				name = "txtBtnAPPLY",
				Text = {
					text = "$5161",
					textStyle = "FEButtonTextStyle",
				},
				helpTipTextLabel = "lblHelpTip",
				helpTip = "$5276", -- "APPLY CHANGES AND RETURN TO MAIN MENU",
				;
			},		
	
			--DEFINITION FOR: (txtBtn) DOWNLOAD
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle1",
				position = {648,23},
				name = "txtBtnDOWNLOAD",
				Text = {
					text = "$5162",
					textStyle = "FEButtonTextStyle",
				},
				helpTipTextLabel = "lblHelpTip",
				helpTip = "$2673", -- "DOWNLOAD UPDATE FROM SELECTED LOCATION",
				;
			},
			
			--DEFINITION FOR: (txtBtn) EXTRA INFO
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle1",
				position = {150,23},
				name = "txtBtnEXTRAINFO",
				Text = {
					text = "$5185",
					textStyle = "FEButtonTextStyle",
				},
				helpTipTextLabel = "lblHelpTip",
				helpTip = "$2674", --"GET EXTRA INFO ON THE PATCH DOWNLOAD",
				;
			},			
		},
	},
}