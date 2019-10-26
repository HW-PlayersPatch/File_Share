-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

PatchScreen = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", backgroundColor = {0, 0, 0, 0},
LocalizedMessages = {
	[LM_CheckingForPatch] = "$1000",
	[LM_PatchAvailable] = "$1001",
	[LM_PatchUnavailable] = "$1002",
	[LM_ChooseLocation] = "$1003",
	[LM_Downloading] = "$1004",
	[LM_DownloadingPatchInfo] = "$1005",
	[LM_DeterminingPatchSize] = "$1006",
	[LM_DownloadStartFailed] = "$1007",
	[LM_DownloadComplete] = "$1008",
	[LM_Cancelled] = "$1009",
	[LM_CouldNotStartOp] = "$1010",
	[LM_GettingExtraInfo] = "$1011",
	[LM_ErrorMirrorList] = "$1012",
	[LM_NoMirrors] = "$1013",
	[LM_BadPatchURL] = "$1040"},
DownloadStatusMessages = {
	[DS_Invalid] = "$1014",
	[DS_HostLookup] = "$1015",
	[DS_Connecting] = "$1016",
	[DS_SendingRequest] = "$1017",
	[DS_Posting] = "$1018",
	[DS_Waiting] = "$1019",
	[DS_ReceivingStatus] = "$1020",
	[DS_ReceivingHeaders] = "$1021",
	[DS_ReceivingFile] = "$1022"},
CompletionResultMessages = {
	[CR_Invalid] = "$1023",
	[CR_Success] = "$1024",
	[CR_OutOfMemory] = "$1025",
	[CR_BufferOverflow] = "$1026",
	[CR_ParseURLFailed] = "$1027",
	[CR_HostLookupFailed] = "$1028",
	[CR_SocketFailed] = "$1029",
	[CR_ConnectFailed] = "$1030",
	[CR_BadResponse] = "$1031",
	[CR_RequestRejected] = "$1032",
	[CR_Unauthorized] = "$1033",
	[CR_Forbidden] = "$1034",
	[CR_FileNotFound] = "$1035",
	[CR_ServerError] = "$1036",
	[CR_FileWriteFailed] = "$1037",
	[CR_FileReadFailed] = "$1038"},
extraInfoFormatID = 5186, extraInfoUnknownFormatID = 5187, pixelUVCoords = 1, ;
	{type = "TextLabel", position = {16, -2}, size = {750, 36}, name = "txtLblTITLE", Text = {text = "$5298", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {17, 34}, size = {750, 21}, name = "txtLblSUBTITLE", Text = {text = "$5299", textStyle = "FEHeading2"},},
	{type = "Frame", position = {168, 184}, size = {463, ((231 - 15) - 23)}, name = "frmCenter", backgroundColor = "FEColorBackground1", ;
	{type = "TextLabel", position = {8, 1}, size = {450, 16}, Text = {text = "$5158", textStyle = "FEHeading3", hAlign = "Left", vAlign = "Middle"},},
	{type = "TextLabel", position = {8, 17}, size = {450, 13}, name = "lblProgress", Text = {text = "$5159", textStyle = "FEHeading4", hAlign = "Left", vAlign = "Middle"},},
	{type = "Frame", outerBorderWidth = 2, borderColor = "FEColorOutline", position = {4, 33}, size = {455, ((194 - 15) - 23)},},
	{type = "Line", p1 = {440, 31}, p2 = {440, 172}, above = 1, color = "FEColorOutline", lineWidth = 2},
	{type = "Line", p1 = {4, (139 + 33)}, p2 = {459, (139 + 33)}, above = 1, color = "FEColorOutline", lineWidth = 2},
	{type = "ProgressBar", progressColor = {255, 216, 0, 255}, position = {6, 174}, size = {451, 13}, name = "progressDownload", helpTipTextLabel = "lblHelpTip", helpTip = "$2670"},
	{type = "TextLabel", position = {8, 176}, autosize = 1, Text = {text = "Progress2", textStyle = "FEHeading4"}, name = "lblProgress2", helpTipTextLabel = "lblHelpTip", helpTip = "$2671"},
	{type = "ListBox", visible = 1, backgroundColor = {25, 25, 25, 89}, position = {6, 33}, size = {451, 137}, name = "lstBoxMirrors", helpTipTextLabel = "lblHelpTip", helpTip = "$2672"},
	{type = "ListBox", visible = 0, backgroundColor = {25, 25, 25, 89}, position = {6, 33}, size = {451, 137}, name = "lstBoxDummy"},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", visible = 0, enabled = 0, Text = {font = "ListBoxItemFont", color = {255, 255, 255, 255}, offset = {4, 0},}, backgroundColor = {0, 0, 0, 0}, size = {432, 13}, name = "lstBoxMirrorsTemplate"},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, name = "frmRootbottombigfrm", ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, name = "frmbottomframe", ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "lblHelpTip", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {4, 23}, name = "txtBtnCANCEL", Text = {text = "$5156", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpTip", helpTip = "$3043"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {4, 23}, name = "txtBtnBACK", Text = {text = "$5160", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpTip", helpTip = "$3043"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {648, 23}, name = "txtBtnAPPLY", Text = {text = "$5161", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpTip", helpTip = "$5276"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {648, 23}, name = "txtBtnDOWNLOAD", Text = {text = "$5162", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpTip", helpTip = "$2673"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {150, 23}, name = "txtBtnEXTRAINFO", Text = {text = "$5185", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "lblHelpTip", helpTip = "$2674"},},},}
