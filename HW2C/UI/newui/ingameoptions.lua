-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:ui/newui/controlstab.lua")

InGameOptions = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = {0, 0, 0, 0},}, onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1); MainUI_DisableCommand(eExit, 0);", onHide = "MainUI_DisableCommand(eExit, 1); MainUI_PopEnabledCommandState()", ;
	{type = "Frame", size = {498, 228}, position = {151, 150}, backgroundColor = "FEColorDialog", ;
	{type = "Frame", outerBorderWidth = 2, position = {4, 4}, size = {490, 28}, borderColor = "FEColorPopupOutline", style = "FEPopupBackgroundStyle"},
	{type = "TextLabel", position = {10, 2}, size = {220, 13}, Text = {textStyle = "FEHeading3", text = "$5108"},},
	{type = "TextLabel", position = {10, 17}, size = {220, 10}, name = "m_lblSubTitle", Text = {textStyle = "FEHeading4", text = "$5173"},},
	{type = "Frame", position = {124, 17}, autoarrange = 1, autoarrangeWidth = 380, autoarrangeSpace = 2, size = {370, 17}, ;
	{type = "RadioButton", name = "m_btnVideo", buttonStyle = "IGTabButtonStyle", Text = {text = "$5111", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5241", enabled = 0, visible = 0},
	{type = "RadioButton", name = "m_btnControls", buttonStyle = "IGTabButtonStyle", Text = {text = "$5109", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5239"},
	{type = "RadioButton", name = "m_btnGameplay", buttonStyle = "IGTabButtonStyle", Text = {text = "$5144", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5240", enabled = 1},
	{type = "RadioButton", name = "m_btnAudio", buttonStyle = "IGTabButtonStyle", Text = {text = "$5110", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5242", enabled = 1, visible = 1},},
	{type = "Frame", outerBorderWidth = 2, position = {4, 34}, size = {490, 190}, borderColor = "FEColorPopupOutline", ;
	{type = "Frame", position = {0, 0}, backgroundColor = {0, 0, 0, 0}, size = {490, 152}, ;
	{type = "Frame", name = "m_tabGameplay", size = {490, 152}, ;
	{type = "Frame", position = {4, 17}, size = {484, 134}, autoarrange = 1, autoarrangeSpace = 2, autoarrangeWidth = 490, ;
	{type = "Frame", size = {482, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5145"},},
	{type = "TextLabel", name = "lblOrderFeedback", position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5243"},
	{type = "ScrollBar", name = "m_sbarOrderFeedback", sliderTextLabel = "lblOrderFeedback", position = {270, 2}, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5244"},},
	{type = "Frame", size = {482, 13},},
	{type = "Frame", size = {482, 15}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5146"},},
	{type = "Button", name = "m_chkNLIPS", buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5248"},},
	{type = "Frame", size = {482, 15}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5147"},},
	{type = "Button", name = "m_chkScreenPan", buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5247"},},
	{type = "Frame", size = {482, 15}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5148"},},
	{type = "Button", name = "m_chkMilitarySelection", buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5279"},},
	{type = "Frame", size = {482, 15}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5092"},},
	{type = "Button", name = "m_chkRightClickMenu", enabled = 1, buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5091"},},},},
	{type = "Frame", name = "m_tabAudio", size = {490, 152}, ;
	{type = "Frame", position = {4, 17}, size = {484, 134}, autoarrange = 1, autoarrangeSpace = 2, autoarrangeWidth = 490, ;
	{type = "Frame", size = {482, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5149"},},
	{type = "TextLabel", name = "lblSFXVolume", position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5249"},
	{type = "ScrollBar", name = "m_sbarSFXVolume", sliderTextLabel = "lblSFXVolume", position = {270, 2}, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5250"},},
	{type = "Frame", size = {482, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5150"},},
	{type = "TextLabel", name = "lblSpeechVolume", position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5253"},
	{type = "ScrollBar", name = "m_sbarSpeechVolume", sliderTextLabel = "lblSpeechVolume", position = {270, 2}, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5252"},},
	{type = "Frame", size = {482, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5151"},},
	{type = "TextLabel", name = "lblMusicVolume", position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5253"},
	{type = "ScrollBar", name = "m_sbarMusicVolume", sliderTextLabel = "lblMusicVolume", position = {270, 2}, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5254"},},
	{type = "Frame", size = {482, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5589"},},
	{type = "TextLabel", name = "lblUIVolume", position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5255"},
	{type = "ScrollBar", name = "m_sbarUIVolume", sliderTextLabel = "lblUIVolume", position = {270, 2}, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5256"},},
	{type = "Frame", size = {482, 13}, visible = 1, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5121"},},
	{type = "DropDownListBox", name = "m_comboBattleChatter", position = {228, 0}, size = {254, 13}, dropDownListBoxStyle = "FEDropDownListBoxStyle", selected = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5090", ListBox = {type = "ListBox", width = 254, listBoxStyle = "FEListBoxStyle", backgroundColor = {0, 0, 0, 255}, ;
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5094", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5259", customData = 25},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5095", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5260", customData = 70},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5096", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5261", customData = 100},},},},
	{type = "Frame", size = {482, 17}, visible = 0, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5152"},},
	{type = "TextLabel", name = "lblSFXChannels", position = {208, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5257"},
	{type = "ScrollBar", name = "m_sbarSFXChannels", sliderTextLabel = "lblSFXChannels", position = {270, 0}, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5258"},},
	{type = "Frame", size = {482, 13},},},},
	{type = "Frame", name = "m_tabVideo", size = {490, 152}, ;
	{type = "Frame", position = {4, 17}, size = {484, 134}, autoarrange = 1, autoarrangeSpace = 2, autoarrangeWidth = 490, ;
	{type = "Frame", size = {482, 13}, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5154"},},
	{type = "Button", position = {208, 0}, size = {274, 13}, buttonStyle = "FEButtonStyle1"},},},},
	{type = "Frame", name = "m_tabControls", size = {490, 152}, ;
	{type = "Frame", position = {0, 0}, size = {490, 152}, ;
	GetControlsTab(490, 152, "FEColorPopupOutline")},},},
	{type = "Line", p1 = {0, 154}, p2 = {490, 154}, lineWidth = 2, color = "FEColorPopupOutline", above = 1},
	{type = "TextLabel", position = {10, 158}, size = {470, 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", p1 = {0, 173}, p2 = {490, 173}, lineWidth = 2, color = "FEColorPopupOutline", above = 1},
	{type = "TextButton", position = {368, 175}, buttonStyle = "FEButtonStyle1", name = "m_btnCancel", helpTipTextLabel = "m_lblHelpText", helpTip = "$5277", Text = {textStyle = "FEButtonTextStyle", text = "$5156"},},
	{type = "TextButton", name = "m_btnAccept", position = {246, 175}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5278", buttonStyle = "FEButtonStyle2", Text = {textStyle = "FEButtonTextStyle", text = "$5157"},},},},}

