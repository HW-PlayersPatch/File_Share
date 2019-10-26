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
	cp_overrideChooseEnemy = 0
	sg_dobuild = 1
	sg_doresearch = 1
	sg_domilitary = 1
	cp_processResource = 1
	cp_processMilitary = 1
end

function Override_BuildDemandInit()
	sg_classPersonalityDemand[eFighter] = 3
	sg_classPersonalityDemand[eCorvette] = 1
	sg_classPersonalityDemand[eFrigate] = 0
end

function Override_ResearchInit()
	sg_upgradeResearchDemand = 1
	sg_techResearchDemand = 1
end

function Override_MilitaryInit()
	cp_attackPercent = 100
	cp_minSquadGroupSize = 3
	cp_minSquadGroupValue = 250
end

function Override_SubSystemDemand()
end

function AI_Carrier_Grp_1_Attack()
	cp_minSquadGroupSize = 1
	cp_minSquadGroupValue = 50
	AttackNow()
	print("AI Attacks")
end
