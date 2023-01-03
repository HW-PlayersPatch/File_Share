aitrace("LOADING CPU RESOURCING")

function CpuResource_Init()
  cpResourcersPerPath = 3.5
	cpNumCollectorsPerLatchPoint = 2.0
  cpMaxThreatAddedDistance = 6000
  cpMinThreatAddedDistance = 12000
  SetResourceDockFamily("Utility")

	sg_minNumCollectors = 6 
	sg_maxNumCollectors = 22
	
	if (Override_ResourceInit) then
		Override_ResourceInit()
	end
end

function CalcDesiredNumCollectors()
	local baseCollectors = 8
	local collectorsToMilitary = 0.8
	if(g_LOD == 0) then		
		baseCollectors = 3
		collectorsToMilitary = 0.6
	elseif(g_LOD == 1) then		
		baseCollectors = 6
		collectorsToMilitary = 0.7
	elseif(g_LOD == 2) then		
		baseCollectors = 8
		collectorsToMilitary = 0.8
	else		
		baseCollectors = 9
		collectorsToMilitary = 0.9	
	end
	local maxCollectorsForMilitary = baseCollectors
    if (s_militaryPop > 0) then
		maxCollectorsForMilitary = maxCollectorsForMilitary + (s_militaryPop * collectorsToMilitary)
	end
	sg_desiredNumCollectors = GetActiveCollectorSlots()*cpNumCollectorsPerLatchPoint + 2
	local numRU = GetRU()
	if (numRU > 1000) then
		sg_desiredNumCollectors = sg_desiredNumCollectors - ((numRU-1000)/1000)
	end
	if (sg_desiredNumCollectors < baseCollectors) then
		sg_desiredNumCollectors = baseCollectors
	end
	if(sg_desiredNumCollectors >= maxCollectorsForMilitary) then
		sg_desiredNumCollectors = maxCollectorsForMilitary
	end
	local collectorsInSystem = numQueueOfClass( eCollector )
	
	local adjScale = SelfRace_GetNumber("persona_mil_2_collector_scale", 1.0)		-- 0.3
	
	if(collectorsInSystem > 20*adjScale) then
		sg_militaryToBuildPerCollector = 4
	elseif(collectorsInSystem > 16*adjScale) then
		sg_militaryToBuildPerCollector = 3
	elseif(collectorsInSystem > 12*adjScale) then
		sg_militaryToBuildPerCollector = 2
	elseif(collectorsInSystem > 9*adjScale) then
		sg_militaryToBuildPerCollector = 1
	else
		sg_militaryToBuildPerCollector = 0
	end
	local threatLevel = UnderAttackThreat();
	if (threatLevel > 0) then			
		if(numRU > 1500) then
			sg_desiredNumCollectors = 0
		else
			sg_militaryToBuildPerCollector = sg_militaryToBuildPerCollector + ((threatLevel / 50) + 1)
		end
	end
	if (sg_desiredNumCollectors > sg_maxNumCollectors) then
		sg_desiredNumCollectors = sg_maxNumCollectors
	end
end

function DoResourceBuild()
	CalcDesiredNumCollectors()
	local numCollectors = numQueueOfClass( eCollector )
	
	if kCollector ~= nil then
	if (numCollectors < sg_desiredNumCollectors and CanBuild( kCollector ) == 1) then
		aitrace("Build collector: desired:"..sg_desiredNumCollectors.." count:"..numCollectors)
		Build( kCollector )
		return 1
		end
	end
	if(GetNumberOfIdleRefineries() <= 0) then       
		local numberOfActiveBlobs = GetActiveBlobCount()
		local neededRefineries = 0
		local neededSalvageDropOffs = 0
		for activeIndex = 0 , (numberOfActiveBlobs-1) do
			local blobIndex = GetActiveBlobAt(activeIndex)
			local collectors = CollectorsAtBlob(blobIndex)
			local refineryCapacity = CollectorCapacityOfRefineriesAtBlob(blobIndex)            
			if(collectors > refineryCapacity) then                
				if(IsSalvage(blobIndex) ~= 0) then
					neededSalvageDropOffs = neededSalvageDropOffs + 1
				else
					neededRefineries = neededRefineries + 1
				end
			end
		end
		if (UnderAttackThreat() > -75) then
		return 0
	end
		if (sg_resourceControllerRequests == nil) then	-- Handle this if missing otherwise...
			sg_resourceControllerRequests = 1
		end
	
		local numRefineriesQueued = numQueueOfClass( eDropOff )-numActiveOfClass( s_playerIndex, eDropOff )
		if(sg_resourceControllerRequests ~= 0 and neededRefineries > 0 and numRefineriesQueued==0) then
            --aitrace("Requested BUILD refinery"..neededRefineries)
			ShipDemandAddByClass( eRefinery, neededRefineries )
		end
		local numSalDropsQueued = numQueueOfClass( eSalvageDropOff )-numActiveOfClass( s_playerIndex, eSalvageDropOff )
		if(sg_resourceControllerRequests ~= 0 and neededSalvageDropOffs > 0 and numSalDropsQueued==0 and UnderAttackThreat() < -75) then
            --aitrace("Requested BUILD salvage drop-off"..neededRefineries)
			ShipDemandAddByClass( eSalvageDropOff, neededSalvageDropOffs )
		end
	end
	return 0
end	