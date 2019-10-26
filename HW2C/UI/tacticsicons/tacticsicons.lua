-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

function AREA(width, height)
	return ((width / 1024) * (height / 768))
end

LOD0 = AREA(120, 200)
LOD1 = AREA(64, 128)
LOD2 = AREA(32, 64)
LOD3 = AREA(16, 32)
TINY = AREA(20, 20)

icons = {
	AGGRESSIVE = {LODs = {LOD0, "UI\\TacticsIcons\\Aggressive.mres"},},
	DEFENSIVE = {LODs = {LOD0, "UI\\TacticsIcons\\Defensive.mres"},},
	PASSIVE = {LODs = {LOD0, "UI\\TacticsIcons\\Passive.mres"},},}
