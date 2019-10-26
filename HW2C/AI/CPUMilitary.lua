-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

aitrace("LOADING CPU MILITARY")

function CpuMilitary_Init()
	cp_attackPercent = 100
	if (g_LOD == 0) then
	cp_attackPercent = 50
	end
	cp_minSquadGroupSize = 5
	cp_minSquadGroupValue = 200
	cp_maxGroupSize = 14
	cp_maxGroupValue = 200
	cp_forceAttackGroupSize = 14
	if (g_LOD == 1) then
	cp_forceAttackGroupSize = 12
	end
	if (g_LOD == 0) then
	cp_forceAttackGroupSize = 8
	end
	cp_initThreatModifier = 0.95
	if (g_LOD == 0) then
	cp_initThreatModifier = 0.5
	elseif (g_LOD == 1) then
	cp_initThreatModifier = 0.75
	end
	sg_moreEnemies = 0
	sg_militaryRand = Rand(100)
	if (Override_MilitaryInit) then
	Override_MilitaryInit()
	end
end

function CpuMilitary_Process()
	local numEnemies = PlayersAlive(player_enemy)
	local numAllies = PlayersAlive(player_ally)
	sg_moreEnemies = numEnemies - numAllies
	Logic_military_groupvars();
	Logic_military_attackrules();
	Logic_military_setattacktimer();
end

function Logic_military_groupvars()
	cp_minSquadGroupSize = 4
	cp_minSquadGroupValue = 150
	if (sg_moreEnemies > 0 and s_selfTotalValue < s_enemyTotalValue * 2) then
	cp_minSquadGroupSize = cp_minSquadGroupSize + 2
	cp_minSquadGroupValue = cp_minSquadGroupValue + 75
	else
	if (s_militaryStrength > 120) then
	cp_minSquadGroupSize = 3
	cp_minSquadGroupValue = 120
	end
	end
end

function Logic_military_attackrules()
	if (g_LOD == 0) then
	if (gameTime() > 20 * 60 and s_militaryStrength > 0) then
	cp_attackPercent = 100
	end
	if (s_selfTotalValue * 2 < s_enemyTotalValue and s_selfTotalValue > 150) then
	cp_attackPercent = 0
	aitrace("I'm Losing!! Go on defence")
	end
	end
end

function attack_now_timer()
	aitrace("Script:calling attack_now_timer")
	AttackNow();
	Rule_Remove("attack_now_timer")
end

function Logic_military_setattacktimer()
	local timedelay = 600
	local wavedelay = 240 + sg_militaryRand * 0.6
	if (g_LOD == 1) then
	timedelay = 400
	wavedelay = 160 + sg_militaryRand * 0.4
	end
	if (g_LOD >= 2) then
	timedelay = 0
	wavedelay = 45 + sg_militaryRand * 0.3
	end
	local gametime = gameTime()
	if (gametime >= timedelay or HaveBeenAttacked() == 1) then
	if (Rule_Exists("attack_now_timer") == 0) then
	aitrace("Script: Attacktimer added")
	Rule_AddInterval("attack_now_timer", wavedelay)
	end
	end
end
