function std_minTuple(a, b, c )
	local minsubs = a
	if (b < minsubs) then
		minsubs = b
	end
	if (c < minsubs) then
		minsubs = c
	end	
	return minsubs
end

function std_maxTuple(a, b, c )
	local maxsubs = a
	if (b > maxsubs) then
		maxsubs = b
	end
	if (c > maxsubs) then
		maxsubs = c
	end	
	return maxsubs
end

function CpuBuildSS_Init()
	CpuBuildSS_RetireProductionSubSystems = nil
	CpuBuildSS_DefaultSubSystemDemandRules = nil
	
	dofilepath(SelfRace_GetString("path_ai_subsystems", ""))
	
	sg_lastSpecialSubSysTime = 0
	sg_specialSubSysDelayTime = 150 + Rand(100)
	sg_retireCountCheck = 0
	sg_buildBCHyperspace = 1
end

function CpuBuildSS_SpecialSubSystemDemand()
	local curGameTime = gameTime()
	local timeSinceLastSubSysDemand = curGameTime - sg_lastSpecialSubSysTime
	if(s_selfTotalValue > 160 and s_militaryStrength > -5 and UnderAttackThreat() < -70 and (timeSinceLastSubSysDemand > sg_specialSubSysDelayTime or GetRU() > 3000)) then
        local fighterDemand = -1000
        local corvetteDemand = -1000
        local frigateDemand = -1000
        local capshipDemand = -1000
        local platformDemand = -1000
        local researchDemand = -1000
        local advancedResearchDemand = -1000


		if (FIGHTERPRODUCTION ~= nil) then
            fighterDemand = SubSystemDemandGet(FIGHTERPRODUCTION)
        end
		if (CORVETTEPRODUCTION ~= nil) then
            corvetteDemand = SubSystemDemandGet(CORVETTEPRODUCTION)
        end
		if (FRIGATEPRODUCTION ~= nil) then
            frigateDemand = SubSystemDemandGet(FRIGATEPRODUCTION)
        end
		if (CAPSHIPPRODUCTION ~= nil) then
            capshipDemand = SubSystemDemandGet(CAPSHIPPRODUCTION)
        end
		if (PLATFORMPRODUCTION ~= nil) then
            platformDemand = SubSystemDemandGet(PLATFORMPRODUCTION)
        end
		if (RESEARCHPRODUCTION ~= nil) then
            researchDemand = SubSystemDemandGet(RESEARCHPRODUCTION)
        end
		if (ADVANCEDRESEARCHPRODUCTION ~= nil) then
            advancedResearchDemand = SubSystemDemandGet(ADVANCEDRESEARCHPRODUCTION)
        end

		local productionDemand = fighterDemand +
		    corvetteDemand +
		    frigateDemand +
		    capshipDemand +
		    platformDemand +
		    researchDemand +
		    advancedResearchDemand

		aitrace("SS:special demand:"..productionDemand)
		if(productionDemand <= 1.0) then
			local specialSubsystems = {HYPERSPACE,FIRECONTROLTOWER,HYPERSPACEINHIBITOR}
			if (g_LOD < 2) then
				specialSubsystems = {HYPERSPACE,CLOAKGENERATOR,FIRECONTROLTOWER,HYPERSPACEINHIBITOR,ADVANCEDARRAY,CLOAKSENSOR}
			end
			local minNumber = 10
			local maxNumber = 0
			for a,b in specialSubsystems do
                local numberBuild = 0
                if (b ~= nil) then
				    numberBuilt = NumSubSystems(b) + NumSubSystemsQ(b)
                end
				if(numberBuilt < minNumber) then
				    minNumber = numberBuilt
				end
				if(numberBuilt > maxNumber) then
				    maxNumber = numberBuilt
				end
			end
			for a,b in specialSubsystems do
				local numQueued = 0
                if (b ~= nil) then
				    numQueued = NumSubSystemsQ(b)
    				if (numQueued == 0) then
    					local numberBuilt = NumSubSystems(b) + numQueued
    					local demand = 1.0
    					if(minNumber < maxNumber) then
    						demand = demand * (1.0 - ((numberBuilt - minNumber) / (maxNumber - minNumber)))
    					end
    					SubSystemDemandAdd(b,demand)
    				end
                end
			end
			sg_lastSpecialSubSysTime = curGameTime;
		end
	end
end

function CpuBuildSS_ProcessEachBuildShip()
	local bcount = BuildShipCount()
	if (bcount == 0) then
		return 0
	end
	if (s_totalProdSS == 0) then
		return 0
	end

    --don't do all this processing if we can't even build subsystems
    if (FIGHTERPRODUCTION == nil or CORVETTEPRODUCTION == nil or FRIGATEPRODUCTION == nil) then
        return 0
    end

	aitrace("NumSS:Fi:"..s_numFiSystems.." Co:"..s_numCoSystems.." Fr:"..s_numFrSystems)
	local currentFiDemand = SubSystemDemandGet(FIGHTERPRODUCTION)
	local currentCoDemand = SubSystemDemandGet(CORVETTEPRODUCTION)
	local currentFrDemand = SubSystemDemandGet(FRIGATEPRODUCTION)
	local maxRealDemand  = std_maxTuple(currentFiDemand, currentCoDemand, currentFrDemand )
	local highestPrioritySSOverall = HighestPrioritySubSystem()
	aitrace("SS:Fi:"..currentFiDemand.." Co:"..currentCoDemand.." Fr:"..currentFrDemand)

	local minNumSameSubs = std_minTuple(s_numFiSystems, s_numCoSystems, s_numFrSystems)
	local fiBuildOffset =  ((s_numFiSystems-minNumSameSubs)/bcount)*3
	local coBuildOffset = ((s_numCoSystems-minNumSameSubs)/bcount)*3
	local frBuildOffset =  ((s_numFrSystems-minNumSameSubs)/bcount)*3
	local bestProdSS = FIGHTERPRODUCTION
	local maxDemand = currentFiDemand - fiBuildOffset
	aitrace("Maxdemand:"..maxDemand.."MaxReal:"..maxRealDemand)
	if ((currentCoDemand-coBuildOffset) > maxDemand) then
		maxDemand = currentCoDemand - coBuildOffset
		bestProdSS = CORVETTEPRODUCTION
	end
	if ((currentFrDemand-frBuildOffset) > maxDemand) then
		maxDemand = currentFrDemand - frBuildOffset
		bestProdSS = FRIGATEPRODUCTION
	end
	local economicValue = 0
	local numCollecting = GetNumCollecting();
	local numRU = GetRU()
	if (UnderAttack()==0 or UnderAttackThreat() < -100) then
		if ( (numRU > (2500+bcount*1000) and numCollecting > 8) ) then
			economicValue = 2
		elseif ( (numRU > (1000+bcount*500) and numCollecting > 6) ) then
			economicValue = 1
		end
	end
	for i=0, (bcount-1) do
		local buildShipId = BuildShipAt( i )
		if (sg_buildBCHyperspace == 1 and BuildShipType( buildShipId ) == kBattleCruiser) then
			aitrace("BC:SS")
			if (BuildShipHasSubSystem( buildShipId, HYPERSPACE ) == 0 and UnderAttackThreat() < -5 and
			    BuildShipCanBuild( buildShipId, HYPERSPACE) == 1) then
					aitrace("Build BC Hyperspace")
					BuildSubSystemOnShip( buildShipId, HYPERSPACE )
					return 1
			end
		end
		if (highestPrioritySSOverall <= maxRealDemand and maxRealDemand >= 0) then
			local hasFi = BuildShipHasSubSystem( buildShipId, FIGHTERPRODUCTION )
			local hasCo = BuildShipHasSubSystem( buildShipId, CORVETTEPRODUCTION )
			local hasFr = BuildShipHasSubSystem( buildShipId, FRIGATEPRODUCTION )
			local sscount = hasFi + hasCo + hasFr
			local allowBuild = 0
			if (sscount > 0) then
				if (sscount == 1 and economicValue > 0) then
					allowBuild = 1
					aitrace("Scount"..sscount.." Econ:"..economicValue)
				elseif (sscount == 2 and economicValue > 1) then
					allowBuild = 1
					aitrace("Scount"..sscount.." Econ:"..economicValue)
				else
					local maxDemandOnShip = -1
					if (hasFi == 1 and currentFiDemand > maxDemandOnShip) then
						maxDemandOnShip = currentFiDemand
					end
					if (hasCo == 1 and currentCoDemand > maxDemandOnShip) then
						maxDemandOnShip = currentCoDemand
					end
					if (hasFr == 1 and currentFrDemand > maxDemandOnShip) then
						maxDemandOnShip = currentFrDemand
					end
					if (maxDemandOnShip < 0) then
						allowBuild = 1
					end
					aitrace("S"..i.." FiD:"..currentFiDemand.." CoD:"..currentCoDemand.." FrD:"..currentFrDemand)
					aitrace("S"..i.." Max:"..maxDemandOnShip)
				end
			else
				allowBuild = 1
			end
			if (allowBuild == 1) then
				if (BuildShipCanBuild( buildShipId, bestProdSS) == 1) then
					aitrace("BuildSS in new func")
					BuildSubSystemOnShip( buildShipId, bestProdSS )
					return 1
				end
			end
		end		
	end
	SubSystemDemandSet( FIGHTERPRODUCTION, -1)
	SubSystemDemandSet( CORVETTEPRODUCTION, -1)
	SubSystemDemandSet( FRIGATEPRODUCTION, -1)
	return 0
end

function CpuBuildSS_DoBuildSubSystem()	
	SubSystemDemandClear()		
	if (Override_SubSystemDemand) then
		Override_SubSystemDemand()
	else
		if (CpuBuildSS_DefaultSubSystemDemandRules ~= nil) then
			CpuBuildSS_DefaultSubSystemDemandRules()
		end
	end
	local subSystemId = 0
	
	if (SelfRace_GetNumber("cfg_buildable_subsystems", 0.0) >= 1.0) then
		subSystemId = FindHighDemandSubSystem()
	end
	
	sg_subSystemOverflowDemand = 0
	
	if (CpuBuildSS_RetireProductionSubSystems ~= nil) then
		CpuBuildSS_RetireProductionSubSystems()
	end
	
	if (subSystemId > 0) then
		if (CpuBuildSS_ProcessEachBuildShip() == 1) then
			return 1
		end
		subSystemId = FindHighDemandSubSystem()
		if (subSystemId > 0) then
			BuildSubSystem( subSystemId )
		end
		return 1
	end
	return 0
end

function CpuBuildSS_DoSubSystemProductionDemand( ProductionSubSys, eClasstype, familyid )
	local demand = ShipDemandMaxByClass( eClasstype )
	local uc = GetUnitCapForFamily(familyid)
	local ucMax = GetUnitCapMaxForFamily(familyid)
	local ucLeft = ucMax - uc
	if (ucLeft < 2) then
		demand = demand - 3 + ucLeft
	end
	if (demand < 0) then
		demand = -0.5
	end
	SubSystemDemandSet(ProductionSubSys, demand )
end

function CpuBuildSS_OtherMiscSubSystemDemand()
	local demand = ShipDemandMaxByClass( eBuilder )
	local capdemand = ShipDemandMaxByClass( eCapital )
	if (capdemand > demand) then
		demand = capdemand
	end
	if (demand > 0.5) then
		SubSystemDemandSet(CAPSHIPPRODUCTION, demand-0.5 )
	end
	if (s_militaryStrength < -50 or g_LOD < 1 or GetRU() > 4000) then
		local platformsubsCount = NumSubSystems(PLATFORMPRODUCTION) + NumSubSystemsQ(PLATFORMPRODUCTION)
		demand = ShipDemandMaxByClass( ePlatform )
		if (demand > 0.5) then
			SubSystemDemandSet(PLATFORMPRODUCTION, demand-1-platformsubsCount )
		end
	end
	local numShipyards = NumSquadrons(kShipYard)
	if ( numShipyards == 0 ) then
		local SY_demand = ShipDemandGet(kShipYard)
		if (SY_demand > 0 and NumSubSystemsQ(HYPERSPACE) == 0) then
			local hypDemand = SY_demand - 0.5 - NumSubSystems(HYPERSPACE)
			SubSystemDemandAdd(HYPERSPACE, hypDemand )
		end
	end
end
