-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

aitrace("CPU: LOADING MISSION 4")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(1)

function Override_Init()
	sg_dobuild = 1
	sg_doresearch = 1
	sg_doupgrades = 0
	sg_domilitary = 1
	cp_processResource = 1
	cp_processMilitary = 1
end

function Override_BuildDemandInit()
	sg_classPersonalityDemand[eFighter] = 1
	sg_classPersonalityDemand[eCorvette] = 0
	sg_classPersonalityDemand[eFrigate] = 3
end

function Override_ResourceInit()
	sg_maxNumCollectors = 10
end

function Override_MilitaryInit()
	cp_attackPercent = 80
	cp_minSquadGroupSize = 3
	cp_minSquadGroupValue = 150
	cp_maxGroupSize = 8
end

function Override_ShipDemand()
	CpuBuild_DefaultShipDemandRules_Hard()
	ShipDemandSet(VGR_SHIPYARD, -100)
	ShipDemandSet(VGR_CARRIER, -100)
end

function Override_SubSystemDemand()
	CpuBuildSS_DefaultSubSystemDemandRules()
	SubSystemDemandSet(HYPERSPACE, -100)
	SubSystemDemandSet(CAPSHIPPRODUCTION, -100)
end

function Override_ResearchDemand()
	CpuResearch_DefaultResearchDemandRules()
end
