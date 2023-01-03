aitrace("DEFAULT CPU LOADED")
g_LOD = getLevelOfDifficulty()
dofilepath("data:ai/default/classdef.lua")
dofilepath("data:ai/default/cpubuild.lua")
dofilepath("data:ai/default/cpuresearch.lua")
dofilepath("data:ai/default/cpumilitary.lua")
dofilepath("data:ai/default/HW1CPUPlayerLayer.lua")

old_aitrace = aitrace
rawset(globals(),"aitrace",nil)
aitrace = function() end

function oninit()
	s_playerIndex = Player_Self()
	sg_dobuild = 1
	sg_dosubsystems = 1
	sg_doresearch = 1
	sg_doupgrades = 1
	sg_domilitary = 1
	cp_processResource = 1
	cp_processMilitary = 1
	sg_lastSpendMoneyTime = gameTime()
	sg_spendMoneyDelay = 0
	
	if (g_LOD == 0) then
		sg_spendMoneyDelay = 2.5
	elseif (g_LOD == 1) then
		sg_spendMoneyDelay = 2.25
	elseif (g_LOD == 2) then
		sg_spendMoneyDelay = 2
	end
	
	ClassInitialize()
	CpuBuild_Init()
	CpuResearch_Init()
	CpuMilitary_Init()
	
	sg_kDemandResetValue = SelfRace_GetNumber("ai_demand_reset_value", 4.0)

	if (Override_Init) then
		Override_Init()
	end

	sg_reseachDemand = -sg_kDemandResetValue	
	Rule_AddInterval("doai", 2.0 )
end

function CalcOpenBuildChannels()
	local numShipsBuildingShips = NumShipsBuildingShips()
	local numShipsBuildingSubSystems = NumShipsBuildingSubSystems()
	local numShipsBuilding = numShipsBuildingShips + numShipsBuildingSubSystems
	local researchItem = IsResearchBusy()
	
	if (SelfRace_GetNumber("cfg_buildable_subsystems", 1.0) < 1.0) then
		numShipsBuilding = numShipsBuildingShips
	end
	
	local numItemsBuilding = numShipsBuilding + researchItem
	local totalBuildShips = BuildShipCount()*2
	local numCollecting = GetNumCollecting()
	local numRUs = GetRU()
	sg_allowedBuildChannels = numCollecting/5;
	
	if (SelfRace_GetNumber("cfg_build_by_ships", 0.0) >= 1.0) then	-- set for HW1!!!
		sg_allowedBuildChannels = BuildShipCount()*2
	end
	
	if (numRUs > 500) then
		sg_allowedBuildChannels = sg_allowedBuildChannels + (numRUs-500)/1000
	end
	s_numOpenBuildChannels = sg_allowedBuildChannels - numItemsBuilding
	s_shipBuildQueuesFull = 0

	local adjBuildEst = SelfRace_GetNumber("persona_build_ships_scalar", 1.0)	-- 4.0 HW1
	
	if (totalBuildShips >= numShipsBuilding*adjBuildEst) then
		s_shipBuildQueuesFull = SelfRace_GetNumber("persona_build_ships_befull", 1.0)	-- 0.0 HW1
	end
	if (s_numOpenBuildChannels <= -1.5) then		
		RemoveLeastNeededItem()		
	end
end

function CacheCurrentState()
    s_numFiSystems = 0
    s_numCoSystems = 0
    s_numFrSystems = 0
    if (FIGHTERPRODUCTION ~= nil) then
	    s_numFiSystems = NumSubSystems(FIGHTERPRODUCTION) + NumSubSystemsQ(FIGHTERPRODUCTION)
    end
    if (CORVETTEPRODUCTION ~= nil) then
	    s_numCoSystems = NumSubSystems(CORVETTEPRODUCTION) + NumSubSystemsQ(CORVETTEPRODUCTION)
    end
    if (FRIGATEPRODUCTION ~= nil) then
	    s_numFrSystems = NumSubSystems(FRIGATEPRODUCTION) + NumSubSystemsQ(FRIGATEPRODUCTION)
    end
	s_totalProdSS = s_numFiSystems + s_numCoSystems + s_numFrSystems
	s_militaryPop = PlayersMilitaryPopulation( s_playerIndex, player_total );
	s_selfTotalValue = PlayersMilitary_Total( s_playerIndex, player_total );
	s_enemyTotalValue = PlayersMilitary_Total( player_enemy, player_max );
	s_militaryStrength = PlayersMilitary_Threat( player_enemy, player_min );
	s_enemyIndex = GetChosenEnemy()
	s_militaryStrengthVersusTarget = 0
	if (s_enemyIndex ~= -1) then
		s_militaryStrengthVersusTarget = PlayersMilitary_Threat( s_enemyIndex, player_max )
	end	
end

function SpendMoney()
	if (s_numOpenBuildChannels > 0) then
		local buildHasBeenDone = 0
		if (sg_dobuild==1 and s_shipBuildQueuesFull==0 and sg_reseachDemand<0) then
			if (CpuBuild_Process() == 1) then
				s_numOpenBuildChannels = s_numOpenBuildChannels-SelfRace_GetNumber("persona_build_open_chan_adjust", 1.0)		-- 0 HW1			
				sg_reseachDemand = sg_reseachDemand + 1				
				buildHasBeenDone = 1
			end
		end
		if (s_numOpenBuildChannels > 0) then
			if (sg_doresearch==1) then
				local didResearch = CpuResearch_Process();
				if (didResearch == 1) then
					sg_reseachDemand = -sg_kDemandResetValue
				else
					if (sg_reseachDemand>=0 and sg_dobuild==1 and s_shipBuildQueuesFull==0 and buildHasBeenDone == 0) then
						CpuBuild_Process()
					end
				end
			else
				sg_reseachDemand = -sg_kDemandResetValue
			end
		end
	end	
end

function doai()	
	CacheCurrentState();
	CalcOpenBuildChannels();	
	local timeSinceLastSubSysDemand = gameTime() - sg_lastSpendMoneyTime	
	
	local bigSpender = SelfRace_GetNumber("persona_bigspender", 0.0)	-- 1.0 for HW1
	
	if (timeSinceLastSubSysDemand >= sg_spendMoneyDelay) and (bigSpender < 1.0) then		
		SpendMoney()
		sg_lastSpendMoneyTime = gameTime()
	end
	
	if (9 >= sg_spendMoneyDelay) and (GetRU() > 2800) and (bigSpender >= 1.0) then	
		SpendMoney()
		SpendMoney()
		SpendMoney()
		SpendMoney()
		SpendMoney()
		SpendMoney()
	sg_allowedBuildChannels = sg_allowedBuildChannels * 4

	else
	if (9 >= sg_spendMoneyDelay) and (GetRU() < 2800) and (bigSpender >= 1.0) then	
		SpendMoney()
		SpendMoney()
		SpendMoney()
	sg_allowedBuildChannels = sg_allowedBuildChannels * 2

	else
	if (9 >= sg_spendMoneyDelay) and (GetRU() < 1800) and (bigSpender >= 1.0) then	
		SpendMoney()
		SpendMoney()
	sg_allowedBuildChannels = sg_allowedBuildChannels * 1

	end
	end
end
	local cpuplayers_norushtime = 60					
	
	if CPUPLAYERS_NORUSHTIME5 ~= nil then
	if IsResearchDone( CPUPLAYERS_NORUSHTIME5 ) == 1 then
		cpuplayers_norushtime = 5*61.2			
	elseif IsResearchDone( CPUPLAYERS_NORUSHTIME10 ) == 1 then
		cpuplayers_norushtime = 10*61.2			
	elseif IsResearchDone( CPUPLAYERS_NORUSHTIME15 ) == 1 then
		cpuplayers_norushtime = 15*61.2			
	end			
	end
	
	if (sg_domilitary==1) and (gameTime() > cpuplayers_norushtime) then		
		CpuMilitary_Process();
	end
end



