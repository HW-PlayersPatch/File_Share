-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:ui/newui/controlstab.lua")

FEGameOptions = {size = {0, 0, 800, 600}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, RootElementSettings = {backgroundColor = {0, 0, 0, 0},}, previousScreen = "NewMainMenu", CustomFX = {{name = "fxShadows", title = "$2550", helpText = "$2551", enabled = 1, Choices = {{text = "$5100"}, {text = "$5101"},},}, {name = "fxDamageFX", title = "$2552", helpText = "$2553", enabled = 1, Choices = {{text = "$5102"}, {text = "$5103"},},}, {name = "fxHyperspaceQuality", title = "$2554", helpText = "$2555", enabled = 1, Choices = {{text = "$5102"}, {text = "$5103"},},}, {name = "fxLightLOD", title = "$2556", helpText = "$2557", enabled = 1, Choices = {{text = "$5590"}, {text = "$5591"}, {text = "$5592"}, {text = "$5593"},},}, {name = "fxGoblins", title = "$2558", helpText = "$2559", enabled = 1, Choices = {{text = "$5100"}, {text = "$5101"},},}, {name = "fxAutoLOD", title = "$2560", helpText = "$2561", enabled = 1, Choices = {{text = "$5100"}, {text = "$5101"},},},}, ;
	{type = "TextLabel", position = {16, -2}, size = {700, 36}, Text = {text = "$5106", textStyle = "FEHeading1"},},
	{type = "TextLabel", position = {17, 34}, size = {700, 21}, Text = {text = "$5107", textStyle = "FEHeading2"},},
	{type = "Frame", size = {620, 300}, position = {90, 150}, backgroundColor = "FEColorBackground1", ;
	{type = "TextLabel", position = {10, 2}, size = {220, 13}, Text = {textStyle = "FEHeading3", text = "$5108"},},
	{type = "TextLabel", name = "m_lblSubTitle", position = {10, 17}, size = {220, 10}, Text = {textStyle = "FEHeading4", text = "$5173"},},
	{type = "Frame", position = {242, 15}, autoarrange = 1, autoarrangeWidth = 470, autoarrangeSpace = 2, size = {460, 17}, ;
	{type = "RadioButton", name = "m_btnControls", buttonStyle = "FETabButtonStyle", Text = {text = "$5109", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5239"},
	{type = "RadioButton", name = "m_btnGameplay", buttonStyle = "FETabButtonStyle", Text = {text = "$5113", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5240", enabled = 1},
	{type = "RadioButton", name = "m_btnVideo", buttonStyle = "FETabButtonStyle", Text = {text = "$5111", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5241", enabled = 1},
	{type = "RadioButton", name = "m_btnAudio", buttonStyle = "FETabButtonStyle", Text = {text = "$5110", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5242", enabled = 1},},
	{type = "Frame", outerBorderWidth = 2, position = {4, 32}, size = {612, 264}, borderColor = "FEColorOutline", ;
	{type = "Frame", position = {0, 0}, backgroundColor = {0, 0, 0, 0}, size = {612, 264}, ;
	{type = "Frame", name = "m_tabGameplay", size = {612, 264}, visible = 0, ;
	{type = "Frame", position = {4, 17}, size = {608, 244}, autoarrange = 1, autoarrangeSpace = 2, autoarrangeWidth = 612, ;
	{type = "Frame", size = {608, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5114"},},
	{type = "TextLabel", name = "lblOrderFeedback", position = {(228 + 42), 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5243"},
	{type = "ScrollBar", name = "m_sbarOrderFeedback", sliderTextLabel = "lblOrderFeedback", position = {(270 + 42), 2}, width = (330 - 42), scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5244"},},
	{type = "Frame", size = {608, 13},},
	{type = "Frame", size = {608, 17}, visible = 0, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5115"},},
	{type = "TextLabel", name = "lblSensitivity", position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5245"},
	{type = "ScrollBar", enabled = 0, name = "m_sbarMouseSensitivity", sliderTextLabel = "lblSensitivity", position = {270, 2}, width = 330, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5246"},},
	{type = "Frame", size = {608, 13},},
	{type = "Frame", size = {608, 18}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5116"},},
	{type = "Button", name = "m_chkScreenPan", buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5247"},},
	{type = "Frame", size = {608, 18}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5146"},},
	{type = "Button", name = "m_chkNLIPS", enabled = 1, buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5248"},},
	{type = "Frame", size = {608, 18}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5148"},},
	{type = "Button", name = "m_chkMilitarySel", enabled = 1, buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5093"},},
	{type = "Frame", size = {608, 18}, ;
	{type = "TextLabel", size = {206, 15}, position = {20, 0}, Text = {textStyle = "FEHeading4", text = "$5092"},},
	{type = "Button", name = "m_chkRightClickMenu", enabled = 1, buttonStyle = "FECheckBoxButtonStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5091"},},},},
	{type = "Frame", name = "m_tabAudio", size = {608, 264}, visible = 0, ;
	{type = "Frame", position = {4, 17}, size = {608, 244}, autoarrange = 1, autoarrangeSpace = 2, autoarrangeWidth = 490, ;
	{type = "Frame", size = {608, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5117"},},
	{type = "TextLabel", name = "lblSFXVolume", position = {(228 + 42), 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5249"},
	{type = "ScrollBar", name = "m_sbarSFXVolume", sliderTextLabel = "lblSFXVolume", position = {(270 + 42), 2}, width = (330 - 42), scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5250"},},
	{type = "Frame", size = {608, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5118"},},
	{type = "TextLabel", name = "lblSpeechVolume", position = {(228 + 42), 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5251"},
	{type = "ScrollBar", name = "m_sbarSpeechVolume", sliderTextLabel = "lblSpeechVolume", position = {(270 + 42), 2}, width = (330 - 42), scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5252"},},
	{type = "Frame", size = {608, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5119"},},
	{type = "TextLabel", name = "lblMusicVolume", position = {(228 + 42), 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5253"},
	{type = "ScrollBar", name = "m_sbarMusicVolume", sliderTextLabel = "lblMusicVolume", position = {(270 + 42), 2}, width = (330 - 42), scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5254"},},
	{type = "Frame", size = {608, 17}, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5589"},},
	{type = "TextLabel", name = "lblUIVolume", position = {(228 + 42), 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5255"},
	{type = "ScrollBar", name = "m_sbarUIVolume", sliderTextLabel = "lblUIVolume", position = {(270 + 42), 2}, width = (330 - 42), scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5256"},},
	{type = "Frame", size = {608, 13},},
	{type = "Frame", size = {608, 17}, visible = 0, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5120"},},
	{type = "TextLabel", name = "lblSFXChannels", position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5257"},
	{type = "ScrollBar", name = "m_sbarSfxChannels", enabled = 0, sliderTextLabel = "lblSFXChannels", position = {270, 2}, width = 330, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5258"},},
	{type = "Frame", size = {608, 13},},
	{type = "Frame", size = {608, 17}, visible = 1, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5121"},},
	{type = "DropDownListBox", name = "m_comboBattleChatter", position = {270, 0}, enabled = 1, size = {330, 13}, dropDownListBoxStyle = "FEDropDownListBoxStyle", selected = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5090", ListBox = {type = "ListBox", width = 330, listBoxStyle = "FEListBoxStyle", backgroundColor = {0, 0, 0, 255}, ;
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5094", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5259", customData = 25},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5095", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5260", customData = 70},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5096", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5261", customData = 100},},},},
	{type = "Frame", size = {608, 17}, visible = 0, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5123"},},
	{type = "Frame", position = {270, 0}, size = {330, 13}, ;
	{type = "RadioButton", name = "m_radioVoice1", buttonStyle = "FERadioButtonStyle", position = {0, 0}, enabled = 1, helpTip = "$5262", helpTipTextLabl = "m_lblHelpText"},
	{type = "RadioButton", name = "m_radioVoice2", buttonStyle = "FERadioButtonStyle", position = {110, 0}, enabled = 1, helpTip = "$5262", helpTipTextLabl = "m_lblHelpText"},
	{type = "RadioButton", name = "m_radioVoice3", buttonStyle = "FERadioButtonStyle", position = {220, 0}, enabled = 1, helpTip = "$5262", helpTipTextLabl = "m_lblHelpText"},
	{type = "TextLabel", position = {20, 0}, size = {90, 13}, Text = {text = "$5124", textStyle = "FEHeading4"},},
	{type = "TextLabel", position = {130, 0}, size = {90, 13}, Text = {text = "$5125", textStyle = "FEHeading4"},},
	{type = "TextLabel", position = {240, 0}, size = {90, 13}, Text = {text = "$5126", textStyle = "FEHeading4"},},},},
	{type = "Frame", size = {608, 13},},
	{type = "Frame", size = {608, 17}, visible = 0, ;
	{type = "Frame", position = {270, 0}, size = {330, 13}, ;
	{type = "Button", buttonStyle = "FECheckBoxButtonStyle", name = "m_chkBattleChatter", enabled = 0, helpTip = "$5263", helpTipTextLabel = "m_lblHelpText"},
	{type = "TextLabel", size = {200, 13}, position = {20, 0}, Text = {text = "$5127", textStyle = "FEHeading4"},},},},
	{type = "Frame", size = {608, 17}, visible = 0, ;
	{type = "Frame", position = {270, 0}, size = {330, 13}, ;
	{type = "Button", enabled = 0, buttonStyle = "FECheckBoxButtonStyle", name = "m_chkSelectionSpeech", helpTip = "$5264", helpTipTextLabel = "m_lblHelpText"},
	{type = "TextLabel", size = {200, 13}, position = {20, 0}, Text = {text = "$5128", textStyle = "FEHeading4"},},},},},},
	{type = "Frame", visible = 0, autosize = 1, minSize = {0, 35}, name = "m_fxFrameToClone", helpTipTextLabel = "m_lblHelpText", ;
	{type = "TextLabel", name = "m_lblFXTitle", position = {16, 0}, size = {155, 13}, backgroundColor = {0, 175, 255, 75}, Text = {textStyle = "FEHeading4", hAlign = "Center", vAlign = "Middle", text = "$5140"},},
	{type = "DropDownListBox", position = {16, 15}, width = 155, name = "m_comboFX", dropDownListBoxStyle = "FEDropDownListBoxStyle"},},
	{type = "TextListBoxItem", visible = 0, name = "m_itemToClone", buttonStyle = "FEListBoxItemButtonStyle", Text = {textStyle = "FEListBoxItemTextStyle"},},
	{type = "Frame", name = "m_tabVideo", size = {608, 244}, visible = 0, ;
	{type = "Frame", position = {4, 17}, size = {608, 264}, autoarrange = 1, autoarrangeSpace = 2, autoarrangeWidth = 490, ;
	{type = "Frame", size = {608, 17}, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5129"},},
	{type = "DropDownListBox", name = "m_comboVideoResolution", enabled = 1, position = {270, 0}, size = {330, 13}, dropDownListBoxStyle = "FEDropDownListBoxStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5189", ListBox = {type = "ListBox", width = 330, listBoxStyle = "FEListBoxStyle", backgroundColor = {0, 0, 0, 255}, ;
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "800 x 600", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "1024 x 768", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "1280 x 960", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "1600 x 1200", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1},},},},
	{type = "Frame", size = {608, 0}, visible = 0, ;
	{type = "TextLabel", size = {206, 17}, Text = {textStyle = "FEHeading4", text = "$5130"},},
	{type = "TextLabel", name = "lblGamma", enabled = 0, position = {228, 2}, style = "FESliderLabelStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5265"},
	{type = "ScrollBar", name = "m_sbarGamma", enabled = 0, sliderTextLabel = "lblGamma", position = {270, 2}, width = 330, scrollBarStyle = "FESliderStyle", helpTipTextLabel = "m_lblHelpText", helpTip = "$5266"},},
	{type = "Frame", size = {608, 0}, visible = 0, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5131"},},
	{type = "DropDownListBox", name = "m_comboVideoPresets", enabled = 0, position = {270, 0}, size = {330, 13}, dropDownListBoxStyle = "FEDropDownListBoxStyle", selected = 1, ListBox = {type = "ListBox", width = 330, listBoxStyle = "FEListBoxStyle", backgroundColor = {0, 0, 0, 255}, ;
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5102", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5267"},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5122", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5268"},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5103", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5269"},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5132", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5270"},},},},
	{type = "Frame", size = {608, 0}, visible = 0, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5134", offset = {20, 0},},},
	{type = "DropDownListBox", name = "m_comboTextureQuality", position = {300, 0}, enabled = 0, size = {300, 13}, dropDownListBoxStyle = "FEDropDownListBoxStyle", selected = 1, ListBox = {type = "ListBox", width = 300, listBoxStyle = "FEListBoxStyle", backgroundColor = {0, 0, 0, 255}, ;
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5102", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5271"},
	{type = "TextListBoxItem", buttonStyle = "FEListBoxItemButtonStyle", Text = {text = "$5103", textStyle = "FEListBoxItemTextStyle"}, resizeToListBox = 1, helpTipTextLabel = "m_lblHelpText", helpTip = "$5272"},},},},
	{type = "Frame", size = {608, 17}, ;
	{type = "Frame", position = {270, 0}, size = {330, 13}, ;
	{type = "Button", buttonStyle = "FECheckBoxButtonStyle", name = "m_chkVsync", enabled = 1, helpTip = "$5273", helpTipTextLabel = "m_lblHelpText"},
	{type = "TextLabel", size = {200, 13}, position = {20, 0}, Text = {text = "$5138", textStyle = "FEHeading4"},},},},
	{type = "Frame", size = {608, 13},},
	{type = "Frame", autosize = 1, ;
	{type = "TextLabel", size = {206, 13}, Text = {textStyle = "FEHeading4", text = "$5089"},},
	{type = "Frame", name = "m_frameFXOptionContainer", position = {254, 0}, autoarrange = 1, autoarrangeSpace = 2, autoarrangeWidth = 370, autosize = 1},},},},
	{type = "Frame", name = "m_tabControls", size = {612, 266}, ;
	{type = "Frame", position = {0, 0}, size = {612, 266}, ;
	GetControlsTab(612, 264, "FEColorOutline")},},
	{type = "Frame", name = "m_tabFX", size = {608, 244}, visible = 0},},},},
	{type = "Frame", backgroundColor = "FEColorBackground1", position = {12, 544}, size = {776, 44}, name = "frmRootbottombigfrm", ;
	{type = "Frame", borderWidth = 2, borderColor = "FEColorOutline", position = {2, 2}, size = {772, 40}, name = "frmbottomframe", ;
	{type = "TextLabel", position = {4, 4}, size = {764, 13}, name = "m_lblHelpText", Text = {textStyle = "FEHelpTipTextStyle"},},
	{type = "Line", above = 0, lineWidth = 2, color = "FEColorOutline", p1 = {2, 19}, p2 = {770, 19},},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {4, 23}, name = "m_btnBack", Text = {text = "$2613", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5274", onMouseClicked = "UI_PreviousScreen(eTransition)"},
	{type = "TextButton", buttonStyle = "FEButtonStyle1", position = {126, 23}, name = "m_btnRestoreDefaultOptions", Text = {text = "$5142", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5275"},
	{type = "TextButton", buttonStyle = "FEButtonStyle2", position = {648, 23}, name = "m_btnAccept", Text = {text = "$5143", textStyle = "FEButtonTextStyle"}, helpTipTextLabel = "m_lblHelpText", helpTip = "$5276"},},},}
