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
rawset(globals(), "Logic_military_attackrules", NIL)
rawset(globals(), "Logic_military_setattacktimer", NIL)

function Override_Init()
	sg_doresearch = 0
end

function Override_BuildDemandInit()
	sg_classPersonalityDemand[eFighter] = 1
	sg_classPersonalityDemand[eCorvette] = 0
	sg_classPersonalityDemand[eFrigate] = 3
	sg_buildBCHyperspace = 0
end

function Override_ResourceInit()
	sg_maxNumCollectors = 12
end

function Override_MilitaryInit()
	cp_attackPercent = 10
	cp_minSquadGroupSize = 8
	cp_minSquadGroupValue = 500
end

function Override_ShipDemand()
	CpuBuild_DefaultShipDemandRules()
	ShipDemandSet(VGR_SHIPYARD, -100000)
	ShipDemandAddByClass(eBuilder, -100000)
end

function Override_SubSystemDemand()
	CpuBuildSS_DefaultSubSystemDemandRules()
	SubSystemDemandSet(HYPERSPACE, -1000000)
end

function Logic_military_attackrules()
end

function Logic_military_setattacktimer()
	local timedelay = 99999
	local wavedelay = 60
	local gametime = gameTime()
	if gametime>=timedelay then
	if Rule_Exists("attack_now_timer")==0 then
	 aitrace("Script: Attacktimer added")
	 Rule_AddInterval("attack_now_timer", wavedelay)
	end 

	end 

end
