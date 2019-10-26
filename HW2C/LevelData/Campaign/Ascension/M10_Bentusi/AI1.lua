-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

aitrace("CPU: LOADING MISSION 4")
dofilepath("data:ai/default.lua")

function Override_Init()
	sg_doresearch = 0
end

function Override_BuildDemandInit()
	sg_classPersonalityDemand[eFighter] = 1
	sg_classPersonalityDemand[eCorvette] = 0
	sg_classPersonalityDemand[eFrigate] = 3
end

function Override_ResourceInit()
end

function Override_MilitaryInit()
	cp_attackPercent = 0
	cp_minSquadGroupSize = 8
	cp_minSquadGroupValue = 250
end

function Override_ShipDemand()
end

function Override_SubSystemDemand()
end
