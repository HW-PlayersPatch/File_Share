-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

MovieScreen = {
	displayName = "$4604", 
	helpTip = "$4605", 
	size = {0, 0, 800, 600}, 
	stylesheet = "HW2StyleSheet", 
	RootElementSettings = 
	{backgroundColor = {0, 0, 0, 0},}, 
	speechFilename = "locale:animatics/A00_speech.lua",
; {
	type = "Movie", 
	filenameV = "data:animatics/animatic_00-01.avi", 
	filenameA = "data:Sound/Music/ANIMATIC/A00_01", 
	position = {0, 100}, 
	size = {800, 400}, 
	fadeOutStart = 192.7, 
	fadeOutEnd = 194.7, 
	abortFadeOutLength = 2, 
	name = "MyMovie", 
	fixedAspectRatio = 1}, 
{
	type = "Frame", 
	position = {0, 0}, 
	size = {800, 100}, 
	name = "topFrame", 
	backgroundColor = {0, 0, 0, 255}, 
	giveParentMouseInput = 1},
{
	type = "Frame", 
	position = {0, 500}, 
	size = {800, 100}, 
	name = "bottomFrame", 
	backgroundColor = {0, 0, 0, 255}, 
	giveParentMouseInput = 1}, 
{
	type = "Frame", 
	position = {0, 0}, 
	size = {0, 600}, 
	name = "leftFrame", 
	backgroundColor = {0, 0, 0, 255}, 
	giveParentMouseInput = 1}, 
{
	type = "Frame", 
	position = {600, 0}, 
	size = {0, 600}, 
	name = "rightFrame", 
	giveParentMouseInput = 1, 
	backgroundColor = {0, 0, 0, 255},},}
