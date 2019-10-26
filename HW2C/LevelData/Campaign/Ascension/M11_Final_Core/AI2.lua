-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

aitrace("CPU: LOADING MISSION 11 AI Player 3")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(2)
cp_overrideChooseEnemy = 0
rawset(globals(), "Logic_military_attackrules", NIL)

function Override_Init()
	sg_doresearch = 0
	sg_doupgrades = 0
end

function Override_ResourceInit()
	sg_maxNumCollectors = 2
end

function Override_MilitaryInit()
	cp_attackPercent = 100
	cp_minSquadGroupSize = 4
	cp_minSquadGroupValue = 100
	cp_maxGroupSize = 8
	cp_forceAttackGroupSize = 8
	cp_initThreatModifier = 0.3
end

function Logic_military_attackrules()
end

function Override_ShipDemand()
	CpuBuild_DefaultShipDemandRules()
	ShipDemandAddByClass(eBuilder, -100)
	ShipDemandAddByClass(ePlatform, -100)
	ShipDemandAddByClass(eScout, -100)
end
