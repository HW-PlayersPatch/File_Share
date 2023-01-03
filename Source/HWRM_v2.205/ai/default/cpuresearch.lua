aitrace("LOADING CPU RESEARCH")

function Util_CheckResearch( researchId )
	if (IsResearchDone(researchId) == 0 and 
	    IsResearchAvailable(researchId)==1) then
		return 1
	end
	return nil
end

function CpuResearch_Init()
	DoUpgradeDemand = nil
	DoResearchTechDemand = nil
	
	dofilepath(SelfRace_GetString("path_ai_research", ""))
	
	sg_lastUpgradeTime = gameTime()
	sg_upgradeDelayTime = 20 + Rand(20)
	cp_researchDemandRange = 0.4
	sg_lastResearchTime = gameTime()
	sg_researchDelayTime = 0
	
	if (g_LOD == 0) then
		sg_upgradeDelayTime = 95 + Rand(50)
		cp_researchDemandRange = 2
		sg_researchDelayTime = 15 + Rand(15)
	elseif (g_LOD == 1) then
		sg_upgradeDelayTime = 60 + Rand(40)
		cp_researchDemandRange = 1
		sg_researchDelayTime = 10 + Rand(10)
	elseif (g_LOD == 2) then
		sg_upgradeDelayTime = 35 + Rand(30)
		cp_researchDemandRange = 0.6
		sg_researchDelayTime = 5 + Rand(5)
	end
	
	if (Override_ResearchInit) then
		Override_ResearchInit()
	end
end

function CpuResearch_DefaultResearchDemandRules()
	local threatlevel = UnderAttackThreat()
	if (threatlevel > 100) then
		return
	end		
	local timeSinceLastResearch = gameTime() - sg_lastResearchTime
	if timeSinceLastResearch > sg_researchDelayTime then
		if (DoResearchTechDemand ~= nil) then
			DoResearchTechDemand()
		end
		sg_lastResearchTime = gameTime();
	end
	
	if (DoUpgradeDemand ~= nil) then
		local timeSinceLastUpgrade = gameTime() - sg_lastUpgradeTime
		local economicValue = 0
		local numCollecting = GetNumCollecting();
		local numRU = GetRU()
		if ( (numRU > 2500 and numCollecting > 9) or numRU > 10000) then
			economicValue = 2
		elseif ( (numRU > 1500 and numCollecting > 7) or numRU > 6000) then
			economicValue = 1
		end
		if (sg_doupgrades == 1 and threatlevel < -20 and s_militaryPop > 7 and economicValue > 0 and 
			(timeSinceLastUpgrade > sg_upgradeDelayTime or economicValue>1)) then
			DoUpgradeDemand()
			sg_lastUpgradeTime = gameTime();
		end
	end	
end

function CpuResearch_Process()
	if (GetNumCollecting() < sg_minNumCollectors and GetRU() < 2000) then
		return 0
	end
	if (NumResearchSubSystems() == 0) then
		return 0
	end
	if (IsResearchBusy()==1) then
		return 0
	end
	ResearchDemandClear()
	if (Override_ResearchDemand) then
		Override_ResearchDemand()
	else 
		CpuResearch_DefaultResearchDemandRules()
	end
	local bestResearch = FindHighDemandResearch()
	if ( bestResearch ~= 0) then
		Research( bestResearch )
		return 1
	end
	return 0
end

function inc_research_demand( researchtype, val)
	local typeis = typeid(researchtype);
	if (typeis == LT_TABLE) then
		for i, v in researchtype do
			inc_research_demand(v, val);
		end
	else
		if (Util_CheckResearch(researchtype)) then
			ResearchDemandAdd( researchtype, val )
		end
	end
end

function inc_upgrade_demand( upgradetype, val )
	inc_research_demand( upgradetype, val )
end


