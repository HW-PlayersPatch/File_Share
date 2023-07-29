-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

PlaybackMenu = {size = {(292 - 12), 0, (216 + 25), 27}, stylesheet = "HW2StyleSheet", pixelUVCoords = 1, ;
	{type = "Frame", position = {0, 0}, size = {(216 + 25), 27}, BackgroundGraphic = {texture = "DATA:UI\\NewUI\\Playback\\background.mres", textureUV = {0, 0, (216 + 25), 27},},},
	{type = "ProgressBar", backgroundColor = {70, 74, 85, 255}, progressColor = {64, 129, 249, 255}, position = {3, 3}, size = {(209 + 25), 6}, name = "playbackProgress"},
	{type = "Button", position = {(2 + 25), 11}, size = {35, 16}, toggleButton = 1, DefaultGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {70, 48, 105, (48 + 16)},}, OverGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {35, 48, 70, (48 + 16)},}, PressedGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {0, 48, 35, (48 + 16)},}, name = "btnFOW", enabled = 1, visible = 1, onMouseClicked = "if GetFOWVis()  =  =  1 then FOWVis(0) else FOWVis(1) end", helpTip = "$5513", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", position = {2, 11}, size = {35, 16}, DefaultGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {0, 0, 35, 16},}, OverGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {0, 16, 35, 32},}, PressedGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {0, 32, 35, 48},}, name = "btnPlay", onMouseClicked = "RecorderPauseUniverse(1);", helpTip = "$5510", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", position = {2, 11}, size = {35, 16}, DefaultGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {35, 0, 70, 16},}, OverGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {35, 16, 70, 32},}, PressedGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {35, 32, 70, 48},}, name = "btnPause", enabled = 0, visible = 0, onMouseClicked = "RecorderPauseUniverse(0);", helpTip = "$5511", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "Button", position = {(181 + 25), 11}, size = {35, 16}, toggleButton = 1, DefaultGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {70, 0, 105, 16},}, OverGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {70, 16, 105, 32},}, PressedGraphic = {texture = "DATA:UI\\NewUI\\Playback\\buttons.mres", textureUV = {70, 32, 105, 48},}, name = "btnFastForward", onMouseClicked = "RecorderFastForwardToggle();", helpTip = "$5514", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},
	{type = "TextButton", position = {(28 + 25), 11}, size = {160, 16}, DefaultGraphic = {texture = "DATA:UI\\NewUI\\Playback\\player buttons.mres", textureUV = {0, 0, 161, 16},}, OverGraphic = {texture = "DATA:UI\\NewUI\\Playback\\player buttons.mres", textureUV = {0, 16, 161, 32},}, PressedGraphic = {texture = "DATA:UI\\NewUI\\Playback\\player buttons.mres", textureUV = {0, 32, 161, 48},}, name = "btnPlayer", Text = {font = "ButtonFont", hAlign = "Center", vAlign = "Center", color = {170, 227, 255, 255},}, onMouseClicked = "RecorderSwitchPlayer();", helpTip = "$5512", helpTipTextLabel = "commandsHelpTip", helpTipScreen = "NewTaskbar"},}