-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

ACTION_DownloadExecute = 2
ACTION_Execute = 3

patchfilename = ""
patchurl = ""
pid = ""
exetie = ""
hw2exe = ""

Extensions = {
{extension = "exe",
	action = ACTION_DownloadExecute,
	getcommand = function() return "rundll32"; end,
	getparameters = function() return exetie.." RunDll32 "..pid.." \""..patchfilename.."\""; end,},
{extension = "msi",
	action = ACTION_Execute,
	getcommand = function() return "rundll32"; end,
getparameters = function () return exetie.." RunDll32 "..pid..[[ msiexec /i "]]..patchurl..[["]]; end,},}
