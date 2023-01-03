-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

local RRPI_PlayerName         = 0
local RRPI_PlayerProgress     = 1
local RRPI_PlayerColour       = 2
local RRPN_Parameters         = 3

SCAR_ATITemplates = {playerProgress = {{stringParam = RRPI_PlayerName, text = {colour = {1, 1, 1, 1}, dropshadow = 1,
renderFlags = {"justifyRight"},
LODs = {1, "ATISmallFont"},},
placement2D = {factorX = -0.05, factorY = -1, minATIArea = 0, maxATIArea = 1, visibility = {},},},
{mesh = {colour = {0.7, 0.7, 0.7, 0.5},
renderFlags = {"scaleX", "scaleY"},
LODs = {0, "UI\\ATI\\Meshes\\HealthBlocks1.hod"},},
placement2D = {factorX = 0.48, factorY = 0, plusX = 0, plusY = 0, factorWidth = 0.45, factorHeight = 1,
plusWidth = PixelWidth() * 2, plusHeight = PixelHeight() * 2, visibility = {},},},
{floatParam = RRPI_PlayerProgress, colourParam = RRPI_PlayerColour, mesh = {renderFlags = {"scaleX", "scaleY", "clipRight"},
LODs = {0, "UI\\ATI\\Meshes\\HealthBlocks1.hod"},},
placement2D = {factorX = 0.48, factorY = 0, plusX = 0, plusY = 0, factorWidth = 0.45, factorHeight = 1, visibility = {},},},},
progressTitle = {{stringParam = 0, text = {colour = {1, 1, 1, 1}, dropshadow = 1, renderFlags = {"justifyHorizCentre"},
LODs = {1, "ATIFont0"},},
placement2D = {visibility = {},},},},}
