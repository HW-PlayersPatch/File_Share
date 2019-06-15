aitrace("LOADING VAYGR SUBSYSTEM INFO")

function DoSubSystemDemand_Vaygr()
	CpuBuildSS_DoSubSystemProductionDemand( FIGHTERPRODUCTION, eFighter, kUnitCapId_Fighter )
	local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
	local highestCorvetteDemand = ShipDemandMaxByClass( eCorvette )
	local highestFrigateDemand = ShipDemandMaxByClass( eFrigate )
	local capdemand = ShipDemandMaxByClass( eCapital )
	
	if (researchcount==0) then
		local researchdemand = highestCorvetteDemand	
		
		if (highestFrigateDemand > researchdemand) then
			researchdemand = highestFrigateDemand
		elseif (capdemand > researchdemand) then
			researchdemand = capdemand
		end
		SubSystemDemandSet(RESEARCH, researchdemand+1 )
	end
	
	if (IsResearchDone(CORVETTETECH) == 1) then		
		CpuBuildSS_DoSubSystemProductionDemand( CORVETTEPRODUCTION, eCorvette, kUnitCapId_Corvette )		
	end	
	
	if (IsResearchDone(FRIGATETECH) == 1) then	
		CpuBuildSS_DoSubSystemProductionDemand( FRIGATEPRODUCTION, eFrigate, kUnitCapId_Frigate )	
	end
	
	CpuBuildSS_OtherMiscSubSystemDemand();
	
	if (researchcount > 0 and s_totalProdSS > 0 and s_militaryPop > 8 and GetNumCollecting() > 8 and GetRU() > 800) then
		CpuBuildSS_SpecialSubSystemDemand()
	end
end

function CpuBuildSS_RetireVaygrProductionSubSystems()
	local numCarriers = CarrierCount()
	for i=0, (numCarriers-1) do
		local carrier = CarrierAt( i )
		local productionId = CarrierProductionSubSystem( carrier )
		if (productionId ~= 0) then
			local ssdemand = SubSystemDemandGet( productionId )
			if (ssdemand < 0) then
				sg_retireCountCheck = sg_retireCountCheck + 1
				if (sg_retireCountCheck >= 2) then
					aitrace("VaygrCarrierRetire: Dem:"..ssdemand.." Count:"..sg_retireCountCheck )
					RetireSubSystem( carrier, productionId )
					sg_retireCountCheck = 0
					return
				end
			else
				sg_retireCountCheck = 0
			end
		end
	end
end

CpuBuildSS_RetireProductionSubSystems = CpuBuildSS_RetireVaygrProductionSubSystems
CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Vaygr
