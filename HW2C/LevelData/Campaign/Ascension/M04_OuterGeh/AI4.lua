-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

aitrace("CPU: LOADING MISSION 4 PLAYER 4")
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
	sg_refineryMilitaryLimit = 100
	sg_collectorMinForRefinery = 100
end

function Override_MilitaryInit()
	cp_attackPercent = 0
	cp_minSquadGroupSize = 6
	cp_minSquadGroupValue = 250
	cp_forceAttackGroupSize = 6
	cp_initThreatModifier = 0.7
	sg_militaryRand = Rand(100)
end

function Logic_military_groupvars()
	cp_minSquadGroupSize = 6
	cp_minSquadGroupValue = 250
end

function Override_ShipDemand()
	DetermineCounterDemand()
	ShipDemandAddByClass(eFighter, 5)
	ShipDemandAddByClass(eCorvette, -20)
	ShipDemandAddByClass(eFrigate, -20)
	ShipDemandAddByClass(eCapital, -20)
	ShipDemandAddByClass(eBuilder, -20)
end
