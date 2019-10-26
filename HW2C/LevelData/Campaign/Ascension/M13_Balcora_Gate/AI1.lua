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
	g_Lod = 1
	sg_dobuild = 1
	sg_doresearch = 1
	sg_domilitary = 1
	cp_processResource = 1
	cp_processMilitary = 1
end

function Override_BuildDemandInit()
	sg_classPersonalityDemand[eFighter] = 1
	sg_classPersonalityDemand[eCorvette] = 0
	sg_classPersonalityDemand[eFrigate] = 3
	sg_earlybomberattack = 0
	sg_buildBCHyperspace = 1
end

function Override_ResearchInit()
	sg_upgradeResearchDemand = 0
	sg_techResearchDemand = 0
end

function Override_ResourceInit()
end

function Override_MilitaryInit()
	cp_attackPercent = 0
	cp_minSquadGroupSize = 5
	cp_minSquadGroupValue = 250
	cp_maxGroupSize = 10
end

function Override_ShipDemand()
	CpuBuild_DefaultShipDemandRules()
	ShipDemandSet(VGR_SHIPYARD, -100)
	ShipDemandSet(VGR_CARRIER, -100)
end

function Override_SubSystemDemand()
	CpuBuildSS_DefaultSubSystemDemandRules()
end

function Override_ResearchDemand()
	CpuResearch_DefaultResearchDemandRules()
end
