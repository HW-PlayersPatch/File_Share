-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

aitrace("CPU: LOADING MISSION 12 PLAYER 1")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(0)
rawset(globals(), "Logic_military_groupvars", NIL)

function Override_Init()
	sg_dobuild = 1
	sg_doresearch = 1
	sg_domilitary = 1
	cp_processResource = 1
	cp_processMilitary = 1
end

function Override_ResourceInit()
	cpMaxThreatAddedDistance = 6000
	cpMinThreatAddedDistance = 12000
	SetResourceDockFamily("Utility")
	sg_minNumCollectors = 0
	sg_maxNumCollectors = 0
	sg_refineryMilitaryLimit = 10000000
	sg_collectorMinForRefinery = 10000000
end

function Override_MilitaryInit()
	cp_attackPercent = 100
	cp_minSquadGroupSize = 2
	cp_minSquadGroupValue = 100
	cp_forceAttackGroupSize = 2
	cp_initThreatModifier = 0.1
	sg_militaryRand = Rand(100)
end

function Logic_military_groupvars()
	cp_minSquadGroupSize = 2
	cp_minSquadGroupValue = 100
end

function Override_ShipDemand()
	DetermineCounterDemand()
	ShipDemandAddByClass(eFighter, 4)
	ShipDemandAddByClass(eCorvette, 4)
	ShipDemandAddByClass(eFrigate, -20)
	ShipDemandAddByClass(eCapital, -20)
	ShipDemandAddByClass(eBuilder, -20)
	ShipDemandAdd(VGR_COMMANDCORVETTE, -10)
end

function Override_SubSystemDemand()
	CpuBuildSS_DefaultSubSystemDemandRules()
	SubSystemDemandSet(FIGHTERPRODUCTION, 10)
	SubSystemDemandSet(CORVETTEPRODUCTION, 10)
	SubSystemDemandSet(RESEARCH, -10)
end
