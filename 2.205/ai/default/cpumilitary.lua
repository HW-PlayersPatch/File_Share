aitrace("LOADING CPU MILITARY")

function CpuMilitary_Init()
	cp_attackPercent = 100
	if (g_LOD == 0) then
		cp_attackPercent = 75
	end
	if (g_LOD == 0) then
		local scaleComp = SelfRace_GetNumber("persona_comp_scale0", 1.0)	-- 2
		cp_minSquadGroupSize = 3*scaleComp
		cp_minSquadGroupValue = 120*scaleComp
		cp_maxGroupSize = 14*scaleComp
		cp_maxGroupValue = 187*scaleComp
		cp_forceAttackGroupSize = 8*scaleComp
		cp_initThreatModifier = 0.5		
	elseif (g_LOD == 1) then
		local scaleComp = SelfRace_GetNumber("persona_comp_scale1", 1.0)	-- 3
		cp_minSquadGroupSize = 4*scaleComp
		cp_minSquadGroupValue = 160*scaleComp
		cp_maxGroupSize = 15*scaleComp
		cp_maxGroupValue = 200*scaleComp
		cp_forceAttackGroupSize = 12*scaleComp
		cp_initThreatModifier = 0.75
	elseif (g_LOD == 2) then
		local scaleComp = SelfRace_GetNumber("persona_comp_scale2", 1.0)	-- 4
		cp_minSquadGroupSize = 5*scaleComp
		cp_minSquadGroupValue = 200*scaleComp
		cp_maxGroupSize = 16*scaleComp
		cp_maxGroupValue = 213*scaleComp
		cp_forceAttackGroupSize = 14*scaleComp
		cp_initThreatModifier = 0.85
	else								-- g_LOD 3
		local scaleComp = SelfRace_GetNumber("persona_comp_scale3", 1.0)	-- 5
		cp_minSquadGroupSize = 5*scaleComp
		cp_minSquadGroupValue = 220*scaleComp
		cp_maxGroupSize = 17*scaleComp
		cp_maxGroupValue = 216*scaleComp
		cp_forceAttackGroupSize = 15*scaleComp
		cp_initThreatModifier = 0.95
	end	
	sg_moreEnemies = 0
	sg_militaryRand = Rand(100)
	if (Override_MilitaryInit) then
		Override_MilitaryInit()
	end
end

function CpuMilitary_Process()
	local numEnemies = PlayersAlive( player_enemy )
	local numAllies = PlayersAlive( player_ally )
	sg_moreEnemies = numEnemies - numAllies
	Logic_military_groupvars();
	Logic_military_attackrules();
	Logic_military_setattacktimer();
end

function Logic_military_groupvars()
	local scaleComp = SelfRace_GetNumber("persona_group_scale", 1.0)	-- 5

	cp_minSquadGroupSize = 4*scaleComp
	cp_minSquadGroupValue = 150*scaleComp
	
	if (sg_moreEnemies > 0 and s_selfTotalValue < s_enemyTotalValue*2) then
		cp_minSquadGroupSize = cp_minSquadGroupSize + (2*scaleComp)
		cp_minSquadGroupValue = cp_minSquadGroupValue + (75*scaleComp)
	elseif (s_militaryStrength > (120*scaleComp)) then
		cp_minSquadGroupSize = 3*scaleComp
		cp_minSquadGroupValue = 120*scaleComp
	end
end

function Logic_military_attackrules()
	if (g_LOD == 0) then
		if (gameTime() > 20*60 and s_militaryStrength > 0) then
			cp_attackPercent = 100
		end
		if (s_selfTotalValue*2 < s_enemyTotalValue and s_selfTotalValue > 150) then
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
	local cpuplayers_delay = 1
	
	if CPUPLAYERS_DEFENSIVE ~= nil then
		cpuplayers_delay = 4			
	if IsResearchDone( CPUPLAYERS_DEFENSIVE ) == 1 then
	elseif IsResearchDone( CPUPLAYERS_AGGRESSIVE ) == 1 then
		cpuplayers_delay = 0.5			
	elseif IsResearchDone( CPUPLAYERS_DYNAMIC ) == 1 then
		cpuplayers_delay = Rand(20)/2
	end	 		   	
	end
	
	local timedelay = 180	
	local wavedelay = 100 + sg_militaryRand * 0.6
	if (g_LOD==1) then
		timedelay = 120
		wavedelay = 80 + sg_militaryRand * 0.5
	end
	if (g_LOD==2) then
		timedelay = 60
		wavedelay = 60 + sg_militaryRand * 0.4
	end
	if (g_LOD>2) then
		timedelay = 0
		wavedelay = 40 + sg_militaryRand * 0.3
	end
	timedelay = timedelay * cpuplayers_delay
	wavedelay = wavedelay * cpuplayers_delay
	local gametime = gameTime()
	if (gametime >= timedelay or HaveBeenAttacked()==1) then
		if (Rule_Exists("attack_now_timer") == 0) then
			aitrace("Script: Attacktimer added")			
			Rule_AddInterval("attack_now_timer", wavedelay )
		end
	end
end