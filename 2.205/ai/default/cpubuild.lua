aitrace("LOADING CPU BUILD")
dofilepath("data:ai/default/cpuresource.lua")
dofilepath("data:ai/default/cpubuildsubsystem.lua")

function CpuBuild_PersonalityDemand()
	sg_classPersonalityDemand[ eFighter ] = Persona_GetNumber("persona_class_demand_fighter", 0.25)
	sg_classPersonalityDemand[ eCorvette ] = Persona_GetNumber("persona_class_demand_corvette", 0.5)
	sg_classPersonalityDemand[ eFrigate ] = Persona_GetNumber("persona_class_demand_frigate", 0.25)
	sg_classPersonalityDemand[ ePlatform ] = Persona_GetNumber("persona_class_demand_platform", -0.5)

	if (Rand(100) < Persona_GetNumber("persona_class_demand_platform_thresh", 10)) then
		sg_classPersonalityDemand[ ePlatform ] = 0
	end
	if (g_LOD >= 2) then
		sg_classPersonalityDemand[ ePlatform ] = sg_classPersonalityDemand[ ePlatform ] - 3.0
	end
	aitrace("PersonalityDemand: Fi:"..sg_classPersonalityDemand[ eFighter ].." Co:"..sg_classPersonalityDemand[ eCorvette ].." Fr:"..sg_classPersonalityDemand[ eFrigate ])
end

function CpuBuild_Init()
	Proc_DetermineDemandWithNoCounterInfo = nil
	Proc_DetermineSpecialDemand = nil
	
	dofilepath(SelfRace_GetString("path_ai_build", ""))

	CpuBuildSS_Init()
	CpuResource_Init()
	sg_resourceDemand = 1
	sg_scoutDemand = 0
	sg_militaryDemand = 1
	sg_randScoutStartBuildTime = 30+Rand(120)	
	sg_randFavorShipType = Rand(100)
	
	sg_classPersonalityDemand = {}
	
	CpuBuild_PersonalityDemand()
	
	sg_subSystemOverflowDemand = 0
	sg_subSystemDemand = 0
	sg_shipDemand = 4
	sg_militaryToBuildPerCollector = 0
	if (g_LOD == 0) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Easy
	elseif (g_LOD == 1) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Med
	else
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Hard
	end
	cp_shipDemandRange = 0.5
	cp_subSystemDemandRange = 0.5
	if (g_LOD == 1) then
		cp_shipDemandRange = 1
		cp_subSystemDemandRange = 1
	end
	if (g_LOD == 0) then
		cp_shipDemandRange = 2
		cp_subSystemDemandRange = 2
	end
	if (Override_BuildDemandInit) then
		Override_BuildDemandInit()
	end
	kUnitCapId_Fighter = GetUnitCapFamilyId("Fighter")
	kUnitCapId_Corvette = GetUnitCapFamilyId("Corvette")
	kUnitCapId_Frigate = GetUnitCapFamilyId("Frigate")
end

function DetermineClassDemand()
	for i=0, eMaxCount do
		if (sg_classPersonalityDemand[ i ] and sg_classPersonalityDemand[ i ]~=0) then
			ShipDemandSetByClass( i, sg_classPersonalityDemand[ i ] );
		end
	end
	ShipDemandSetByClass( eUselessShips, -10 )
end

function DetermineAntiChassisDemand(enemyIndex)
	local kFighterCounterScale = 3.0
	local kCorvetteCounterScale = 1.5
	local kFrigateCounterScale = 1.0
	local AFiDemand=0
	local ACoDemand=0
	local AFrDemand=0
	local FiValue = PlayersMilitary_Fighter(enemyIndex, player_max)
	local self_AFiValue = PlayersMilitary_AntiFighter(s_playerIndex, player_max)
	local enemy_FiTotal = (FiValue-self_AFiValue)*kFighterCounterScale
	if (enemy_FiTotal < 0) then
		enemy_FiTotal = 0
	end
	local CoValue = PlayersMilitary_Corvette(enemyIndex, player_max)
	local self_ACoValue = PlayersMilitary_AntiCorvette(s_playerIndex, player_max)
	local enemy_CoTotal = (CoValue - self_ACoValue)*kCorvetteCounterScale
	if (enemy_CoTotal < 0) then
		enemy_CoTotal = 0
	end
	local MSfrig_correction = 0
	if (s_militaryStrengthVersusTarget < 20) then
		MSfrig_correction = 25
	end
	local FrValue = PlayersMilitary_Frigate(enemyIndex, player_max) - MSfrig_correction
	local self_AFrValue = PlayersMilitary_AntiFrigate(s_playerIndex, player_max)
	local enemy_FrTotal = (FrValue - self_AFrValue)*kFrigateCounterScale
	if (enemy_FrTotal < 0) then
		enemy_FrTotal = 0
	end
	
	local fiScale = SelfRace_GetNumber("persona_demand_scale_fighters", 1.0)	-- x5 HW1
	local coScale = SelfRace_GetNumber("persona_demand_scale_corvettes", 1.0)	-- x3 HW1
	local frScale = SelfRace_GetNumber("persona_demand_scale_frigates", 1.0)	-- x1 HW1
								
	local enemy_ChassisTotal = enemy_FiTotal + enemy_CoTotal + enemy_FrTotal
	if (enemy_ChassisTotal > 0) then
		if (enemy_FiTotal > 0) then
			local FiTotalPercent = enemy_FiTotal*100/enemy_ChassisTotal*fiScale
			if (FiTotalPercent > 70) then
				AFiDemand = AFiDemand + 3
			elseif (FiTotalPercent > 35) then
				AFiDemand = AFiDemand + 1.5
			end
		end
		if (enemy_CoTotal > 0) then
			local CoTotalPercent = enemy_CoTotal*100/enemy_ChassisTotal*coScale
			if (CoTotalPercent > 70) then
				ACoDemand = ACoDemand + 3
			elseif (CoTotalPercent > 35) then
				ACoDemand = ACoDemand + 1.5
			end
		end
		if (enemy_FrTotal > 0) then
			local FrTotalPercent = enemy_FrTotal*100/enemy_ChassisTotal*frScale
			if (FrTotalPercent > 70) then
				AFrDemand = AFrDemand + 3
			elseif (FrTotalPercent > 35) then
				AFrDemand = AFrDemand + 1.5
			end
		end
	end
	if (AFiDemand > 0) then
		ShipDemandAddByClass( eAntiFighter, AFiDemand )
	end
	if (ACoDemand > 0) then
		ShipDemandAddByClass( eAntiCorvette, ACoDemand )
	end
	if (AFrDemand > 0) then
		ShipDemandAddByClass( eAntiFrigate, AFrDemand )
	end
	aitrace("AChDmd: AFi:"..AFiDemand.." ACo:"..ACoDemand.." AFr:"..AFrDemand)
end

function DetermineChassisDemand(enemyIndex)
	local FiDemand=0
	local CoDemand=0
	local FrDemand=0
	local AFiValue = PlayersMilitary_AntiFighter(enemyIndex, player_max)
	local ACoValue = PlayersMilitary_AntiCorvette(enemyIndex, player_max)
	local AFrValue = PlayersMilitary_AntiFrigate(enemyIndex, player_max)
	local ATotal = AFiValue + ACoValue + AFrValue
	if (ATotal <= 0) then
		return
	end
	
	local fiThresh = SelfRace_GetNumber("persona_demand_thresh_fighters", 5.0)
	local fiWeightHi = SelfRace_GetNumber("persona_demand_weighthi_fighters", 70.0)
	local fiWeightLo = SelfRace_GetNumber("persona_demand_weightlo_fighters", 35.0)
	local fiAdjustHi = SelfRace_GetNumber("persona_demand_adjusthi_fighters", 3.0)		-- 0.5 HW1
	local fiAdjustLo = SelfRace_GetNumber("persona_demand_adjustlo_fighters", 1.5)		-- -0.5 HW1
	
	if (AFiValue > fiThresh) then
		local AFiPercent = AFiValue*100/ATotal
		if (AFiPercent > fiWeightHi) then
			FiDemand = FiDemand - fiAdjustHi
		elseif (AFiPercent > fiWeightLo) then
			FiDemand = FiDemand - fiAdjustLo
		end
	end
	
	local coThresh = SelfRace_GetNumber("persona_demand_thresh_corvettes", 5.0)
	local coWeightHi = SelfRace_GetNumber("persona_demand_weighthi_corvettes", 70.0)
	local coWeightLo = SelfRace_GetNumber("persona_demand_weightlo_corvettes", 35.0)
	local coAdjustHi = SelfRace_GetNumber("persona_demand_adjusthi_corvettes", 2.0)		-- 0.5 HW1
	local coAdjustLo = SelfRace_GetNumber("persona_demand_adjustlo_corvettes", 1.0)		-- 0.5 HW1
	
	if (ACoValue > coThresh) then
		local ACoPercent = ACoValue*100/ATotal
		if (ACoPercent > coWeightHi) then
			CoDemand = CoDemand - coAdjustHi
		elseif (ACoPercent > coWeightLo) then
			CoDemand = CoDemand - coAdjustLo
		end
	end
	
	local frThresh = SelfRace_GetNumber("persona_demand_thresh_frigates", 5.0)
	local frWeightHi = SelfRace_GetNumber("persona_demand_weighthi_frigates", 70.0)
	local frWeightLo = SelfRace_GetNumber("persona_demand_weightlo_frigates", 35.0)
	local frAdjustHi = SelfRace_GetNumber("persona_demand_adjusthi_frigates", 3.0)		-- 1.5 HW1
	local frAdjustLo = SelfRace_GetNumber("persona_demand_adjustlo_frigates", 1.5)		-- 0.5 HW1
	
	ShipDemandAddByClass( eFighter, FiDemand )
	ShipDemandAddByClass( eCorvette, CoDemand )
	ShipDemandAddByClass( eFrigate, FrDemand )
	aitrace("ChDmd: Fi:"..FiDemand.." Co:"..CoDemand.." Fr:"..FrDemand)
end

function DetermineDemandWithNoCounterInfo()
	if (s_militaryPop < 5) then
		aitrace("Dmd:Rand:"..sg_randFavorShipType )
		
		if (Proc_DetermineDemandWithNoCounterInfo ~= nil) then
			Proc_DetermineDemandWithNoCounterInfo()
		end
	else
		aitrace("Dmd:Asking for AntiFrigates" )
		ShipDemandAddByClass( eAntiFrigate, 1.5 )	
	end
end

function DetermineCounterDemand()
	if (s_enemyIndex ~= -1) then
		local enemyMilitaryCount = PlayersMilitaryPopulation( s_enemyIndex, player_max )
		if (enemyMilitaryCount >= 3) then
			DetermineChassisDemand(s_enemyIndex)
			DetermineAntiChassisDemand(s_enemyIndex)
			return			
		end
	end
	DetermineDemandWithNoCounterInfo();
end

function DetermineSpecialDemand()
	if kInterceptor ~= nil then
	if (SelfRace_GetNumber("cfg_buildable_subsystems", 1.0) >= 1.0) then
	    local numFighterProduction = 0
        if (FIGHTERPRODUCTION ~= nil) then
            numFighterProduction = NumSubSystems(FIGHTERPRODUCTION)
        end
		if (ShipDemandGet( kInterceptor ) > 0 and numFighterProduction > 0 and NumSquadrons(kInterceptor) < 3 and s_militaryPop < 10) then
			ShipDemandAdd( kInterceptor, 0.5 )
		end
	else
		if (ShipDemandGet( kInterceptor ) > 0 and IsResearchDone(FIGHTERDRIVE) == 1 and NumSquadrons(kInterceptor) < 7 and s_militaryPop < 22) then
			ShipDemandAdd( kInterceptor, 0.5 )
		end
	end
	end
	
	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.5
		
		if (SelfRace_GetNumber("cfg_advanced_research", 0.0) >= 1.0) then
			local advresearchcount = NumSubSystems(ADVANCEDRESEARCH) + NumSubSystemsQ(ADVANCEDRESEARCH)
			if (advresearchcount > 0) then
				additionalFrigDemand = additionalFrigDemand + 0.25
			end
		end
		
		ShipDemandAddByClass( eFrigate, additionalFrigDemand )		
		ShipDemandAddByClass( eFighter, -0.5 )
	end
	
	local numSpecial = numQueueOfClass(eCapture) + numQueueOfClass(eShield)
	local numFrigates = numQueueOfClass(eFrigate)
	
	if(numFrigates == 0 or numSpecial / numFrigates > 0.4) then
		ShipDemandAddByClass( eCapture, -10 )
		ShipDemandAddByClass( eShield, -10 )
	else
		if (s_militaryPop < 5) then
			ShipDemandAddByClass( eCapture, -4 )
			ShipDemandAddByClass( eShield, -4.5 )
		elseif (s_militaryPop < 10) then
			ShipDemandAddByClass( eCapture, -2 )
			ShipDemandAddByClass( eShield, -2.5 )
		elseif (s_militaryPop < 15) then
			ShipDemandAddByClass( eCapture, -1 )
			ShipDemandAddByClass( eShield, -1.5 )
		elseif (s_militaryPop > 30) then
			ShipDemandAddByClass( eCapture, 1 )
			ShipDemandAddByClass( eShield, 1 )
		end
	end	
	
 	if ( (GetNumCollecting() > 9 or GetRU() > 1500) and s_militaryPop > 8 and UnderAttackThreat() < -75) then
		if kBattleCruiser ~= nil then ShipDemandAdd( kBattleCruiser, 0.75 ) end
		if kDestroyer ~= nil then ShipDemandAdd( kDestroyer, 0.25 ) end
		
		if (SelfRace_GetNumber("cfg_bc_can_upgrade", 0.0) >= 1.0) then
			if (IsResearchDone( BATTLECRUISERIONWEAPONS ) == 1) then
				if kBattleCruiser ~= nil then ShipDemandAdd( kBattleCruiser, 0.5 ) end
			end
		else
		  if kDestroyer ~= nil then ShipDemandAdd( kDestroyer, 0.35 )  end
		  if kMissileDestroyer ~= nil then ShipDemandAdd( kMissileDestroyer, 0.65 ) end
			if (IsResearchDone( HEAVYGUNS ) == 1) then
				if kBattleCruiser ~= nil then ShipDemandAdd( kBattleCruiser, 0.6 ) end
			end			
		end		
	end
	
	local numEnemyBattleCruisers = PlayersUnitTypeCount( player_enemy, player_total, eBattleCruiser )
	
	if (numEnemyBattleCruisers > 0) then		
		local ssKillaDemand = numEnemyBattleCruisers/2		
		if (s_enemyIndex ~= -1) then
			local targetEnemyCruisers = PlayersUnitTypeCount( s_enemyIndex, player_max, eBattleCruiser )
			if (targetEnemyCruisers > 0) then
				ssKillaDemand = ssKillaDemand + targetEnemyCruisers				
			end
		end		
		ShipDemandAddByClass( eSubSystemAttackers, ssKillaDemand )		
	end
	
	if (Proc_DetermineSpecialDemand ~= nil) then
		Proc_DetermineSpecialDemand()
	end
end

function CalculateMilitaryValueGoal( militaryTable, percentOfEnemy )
	local curTime = gameTime()
	local minMilitaryValue = 0
	if (s_enemyTotalValue*percentOfEnemy > minMilitaryValue) then
		minMilitaryValue = s_enemyTotalValue*percentOfEnemy
	end
	for k,v in militaryTable do
		if (curTime < v[3]) then			
			if (minMilitaryValue < v[1]) then
				minMilitaryValue = v[1]
			end			
			if (minMilitaryValue > v[2]) then
				minMilitaryValue = v[2]
			end
			break
		end	
	end	
	return minMilitaryValue
end

function CpuBuild_DefaultShipDemandRules_Easy()	
	local valueTable =
	{		
		{80, 		135, 		8*30},
		{120,		180,		15*30},
		{160,		230,		20*30},
		{220,		300,		30*30},
		{270,		370,		45*30},
		{350,		500,		60*30},
		{500,		1000,		10000*30},
	}	
	local minMilitaryValue = CalculateMilitaryValueGoal( valueTable, 0.7 )	
	aitrace("Aim:"..minMilitaryValue.." CurMil:"..s_selfTotalValue.." Enm:"..s_enemyTotalValue )
	if (s_selfTotalValue < minMilitaryValue) then
		DetermineClassDemand();
		DetermineCounterDemand();
		DetermineSpecialDemand();
	end
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
end

function CpuBuild_DefaultShipDemandRules_Med()	
	local valueTable =
	{		
		{120, 		200, 		8*30},
		{160,		250,		15*30},
		{220,		320,		20*30},
		{280,		400,		30*30},
		{320,		500,		45*30},
		{500,		700,		60*30},
		{700,		1200,		10000*30},
	}	
	local minMilitaryValue = CalculateMilitaryValueGoal( valueTable, 0.85 )
	aitrace("Aim:"..minMilitaryValue.." CurMil:"..s_selfTotalValue.." Enm:"..s_enemyTotalValue )
	if (s_selfTotalValue < minMilitaryValue) then
		DetermineClassDemand();
		DetermineCounterDemand();
		DetermineSpecialDemand();
	end
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
end

function CpuBuild_DefaultShipDemandRules_Hard()	
	DetermineClassDemand();
	DetermineCounterDemand();
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
	DetermineSpecialDemand();		
end

function CpuBuild_RemoveBuildItems()	
	RemoveStalledBuildItems()	
end

function CpuBuild_Process()
	ShipDemandClear()
	CpuBuild_RemoveBuildItems()
	if (Override_ShipDemand) then
		Override_ShipDemand()
	else
		CpuBuild_DefaultShipDemandRules()
	end
	if (sg_resourceDemand > 0 or sg_militaryDemand <= 0) then
		if (DoResourceBuild()==1) then
			sg_resourceDemand = 1 - sg_militaryToBuildPerCollector
			return 1
		end
	end	
	if (sg_militaryDemand > 0) then
		aitrace("**DoMilitaryBuild")
		if (DoMilitaryBuild()==1) then
			if(sg_resourceDemand <= 0) then
				sg_resourceDemand = sg_resourceDemand + 1
			end
			return 1
		end
	end
	return 0
end

function DoMilitaryBuild()
	local ssDemand = sg_subSystemDemand + sg_subSystemOverflowDemand + (Rand(3)-1)
	local shipId = FindHighDemandShip()
	local highestPriority = HighestPriorityShip()
	if (UnderAttackThreat() > -5 and shipId > 0 and highestPriority >= 0.5) then
		ssDemand = 0
		aitrace("Subsys demand reduced because we are under attack")
	end	
	if (sg_shipDemand > ssDemand) then
		if (shipId > 0) then
			Build( shipId )
			sg_subSystemOverflowDemand = sg_subSystemOverflowDemand + 1
			return 1
		end		
	end
	if (sg_dosubsystems == 1 and CpuBuildSS_DoBuildSubSystem() == 1) then
		return 1
	end
	return 0
end

function DetermineScoutDemand()	
	local cpuplayers_norushtime = 60			

	if CPUPLAYERS_NORUSHTIME5 ~= nil then
	if IsResearchDone( CPUPLAYERS_NORUSHTIME5 ) == 1 then
		cpuplayers_norushtime = 10*61.2			
	elseif IsResearchDone( CPUPLAYERS_NORUSHTIME10 ) == 1 then
		cpuplayers_norushtime = 15*61.2			
	elseif IsResearchDone( CPUPLAYERS_NORUSHTIME15 ) == 1 then
		cpuplayers_norushtime = 20*61.2			
	end	
	end
	
	if gameTime() < cpuplayers_norushtime then
		ShipDemandAddByClass( eScout, -100 )
		return
	end
	if (UnderAttackThreat() < -10 and s_militaryPop > 0 and gameTime() > sg_randScoutStartBuildTime) then			
		local numEnemies = PlayersAlive( player_enemy )
		local shipCount = numQueueOfClass( eScout )
		local numScoutsDemanded = 1
		if (numEnemies >= 2) then
			numScoutsDemanded = 2
		end
		if (numEnemies > 2 and s_militaryPop > 7) then
			numScoutsDemanded = 2+((s_militaryPop-7)/10)
		end
		if (shipCount < numScoutsDemanded) then
			ShipDemandAddByClass( eScout, 3.5 )
			local scoutRand = Rand(100)
			if (scoutRand > 30) then
				ShipDemandAdd( kScout, 1.5 )
			end
			sg_randScoutStartBuildTime = gameTime() + 50
		end
	end
end

function DetermineBuilderClassDemand()
	local numBuilders = numQueueOfClass( eBuilder )
	local numActiveBuilders = numActiveOfClass( s_playerIndex, eBuilder )
	if (numBuilders>numActiveBuilders) then
		ShipDemandAddByClass( eBuilder, -10 );
		return
	end
	if (g_LOD == 0 and numBuilders > 3) then
		ShipDemandAddByClass( eBuilder, -10 );
		return
	elseif (g_LOD == 1 and numBuilders > 4) then
		ShipDemandAddByClass( eBuilder, -10 );
		return
	elseif (g_LOD == 2 and numBuilders > 5) then
		ShipDemandAddByClass( eBuilder, -10 );
		return	
	end
	if (s_militaryPop < 5 or (UnderAttack() == 1 and UnderAttackThreat() > -75) ) then
		ShipDemandAddByClass( eBuilder, -10 );
		return
	end
	
	ShipDemandAddByClass( eBuilder, Persona_GetNumber("persona_demand_builder_adjust", 0.0) );
	
	local numRUs = GetRU()
	if (GetNumCollecting() < 7 and numRUs < 15000 ) then
		return
	end
	local numRUToBuildTable = {
		1000,			--0 builders
		2000,			--1
		3500,		 	--2 (normal start)
		6500,			--3
		10000,		--4
		15000,		--5 or more
	}
	if (numBuilders > 5) then
		numBuilders = 5
	end
	
	local RUsNeededToBuildBuilder = numRUToBuildTable[numBuilders+1]+Persona_GetNumber("persona_rus_for_builder", 0)
	
	local dif = numRUs - RUsNeededToBuildBuilder	
	if (dif > 0) then		
		local ruPerShip =2000		
		if (s_militaryStrength > 30) then
			ruPerShip = 1000
		end
		local bonusDemand = (1+(dif/ruPerShip))
		ShipDemandAddByClass( eBuilder, bonusDemand );
	end
	if (dif<-2000) then
		local penaltyDemand = dif/2000
		ShipDemandAddByClass( eBuilder, penaltyDemand );		
	end
	local neededMilitaryValue = 30 + (numBuilders-1)*30	
	local militaryDifDemand = (s_selfTotalValue - neededMilitaryValue)/30
	if (militaryDifDemand < 0) then
		ShipDemandAddByClass( eBuilder, militaryDifDemand );		
	end
	return 0
end