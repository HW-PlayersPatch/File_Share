aitrace("LOADING KUSHAN UPGRADE INFO")

function DoResearchTechDemand_Kushan()	
	ResearchDemandSet( FIGHTERDRIVE, 10 )
	ResearchDemandSet( SUPERCAPITALSHIPDRIVE, 4 )
	ResearchDemandSet( IONCANNONS, 1 )
	ResearchDemandSet( HEAVYGUNS, 1 )

	if (Util_CheckResearch(FIGHTERCHASSIS)) and (GetRU() > 200) then
		local demand = ShipDemandGet(KUS_INTERCEPTOR)
		if (demand > 0) then
			ResearchDemandSet( FIGHTERCHASSIS, demand*2 )
		end
	end
	if (Util_CheckResearch(CORVETTEDRIVE)) and (GetRU() > 800) then
		local demand = ShipDemandGet(KUS_LIGHTCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( CORVETTEDRIVE, demand*2 )
			ResearchDemandSet( CORVETTECHASSIS, demand*2 )
		end
	end
	if (Util_CheckResearch(CORVETTECHASSIS)) and (GetRU() > 400) then
		local demand = ShipDemandGet(KUS_LIGHTCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( CORVETTEDRIVE, demand*2 )
			ResearchDemandSet( CORVETTECHASSIS, demand*2 )
		end
	end

	if (Util_CheckResearch(CAPITALSHIPDRIVE)) and (GetRU() > 1200) then
		local assfrigdemand = ShipDemandGet(KUS_ASSAULTFRIGATE)
		if (assfrigdemand > 0) then
			ResearchDemandSet( CAPITALSHIPDRIVE, assfrigdemand*2 )
			ResearchDemandSet( CAPITALSHIPCHASSIS, assfrigdemand*2 )
		end
	end
	if (Util_CheckResearch(CAPITALSHIPCHASSIS)) and (GetRU() > 900) then
		local assfrigdemand = ShipDemandGet(KUS_ASSAULTFRIGATE)
		if (assfrigdemand > 0) or (dronefrigdemand > 0) then
			ResearchDemandSet( CAPITALSHIPDRIVE, assfrigdemand*2 )
			ResearchDemandSet( CAPITALSHIPCHASSIS, assfrigdemand*2 )
		end
	end
	if (Util_CheckResearch(HEAVYGUNS)) and (GetRU() > 1900) then
		local assfrigdemand = ShipDemandGet(KUS_ASSAULTFRIGATE)
		if (assfrigdemand > 0) then
			ResearchDemandSet( GRAVITYGENERATOR, assfrigdemand*2 )
			ResearchDemandSet( PROXIMITYSENSOR, assfrigdemand*2 )
			ResearchDemandSet( SENSORARRAY, assfrigdemand*2 )
			ResearchDemandSet( CLOAKGENERATOR, assfrigdemand*2 )
			ResearchDemandSet( CLOAKEDFIGHTER, assfrigdemand*2 )
		end
	end

--	if (Util_CheckResearch(PLASMABOMBLAUNCHER)) and (GetRU() > 400) then
--		local demand = ShipDemandGet(KUS_ATTACKBOMBER)
--		if (demand > 0) then
--			ResearchDemandSet( PLASMABOMBLAUNCHER, demand )
--		end
--	end
	if (Util_CheckResearch(DEFENDERSUBSYSTEMS)) and (GetRU() > 400) then
		local demand = ShipDemandGet(KUS_DEFENDER)
		if (demand > 0) then
			ResearchDemandSet( DEFENDERSUBSYSTEMS, demand )
		end
	end
	if (Util_CheckResearch(CLOAKEDFIGHTER)) and (GetRU() > 500) then
		local demand = ShipDemandGet(KUS_CLOAKEDFIGHTER)
		if (demand > 0) then
			ResearchDemandSet( CLOAKEDFIGHTER, demand )
		end
	end
	if (Util_CheckResearch(HEAVYCORVETTEUPGRADE)) and (GetRU() > 600) then
		local demand = ShipDemandGet(KUS_HEAVYCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( HEAVYCORVETTEUPGRADE, demand )
		end
	end
	if (Util_CheckResearch(FASTTRACKINGTURRETS)) and (GetRU() > 700) then
		local demand = ShipDemandGet(KUS_MULTIGUNCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( FASTTRACKINGTURRETS, demand )
		end
	end
	if (Util_CheckResearch(IONCANNONS)) then
		local demand = ShipDemandGet(KUS_IONCANNONFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( IONCANNONS, demand )
		end
	end
	if (Util_CheckResearch(DRONETECHNOLOGY)) then
		local demand = ShipDemandGet(KUS_DRONEFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( DRONETECHNOLOGY, demand )
		end
	end
	if (Util_CheckResearch(GUIDEDMISSILES)) then
		local demand = ShipDemandGet(KUS_DESTROYER)
		if (demand > 0) then
			ResearchDemandSet( GUIDEDMISSILES, demand )
		end
	end
	if (Util_CheckResearch(SUPERHEAVYCHASSIS)) then
		local carrierdemand = ShipDemandGet(KUS_CARRIER)
		if (carrierdemand > 0) then
			ResearchDemandSet( SUPERHEAVYCHASSIS, carrierdemand*2 )
		end
	end	
	if (s_militaryPop > 8 and GetRU() > 3200) then	
		if (Util_CheckResearch(HEAVYGUNS)) then
			local heavydemand = ShipDemandGet( kBattleCruiser )
			if (heavydemand > 0) then
				ResearchDemandSet( HEAVYGUNS, heavydemand*4 )
				ResearchDemandSet( SUPERHEAVYCHASSIS, heavydemand*4 )
				ResearchDemandSet( GUIDEDMISSILES, heavydemand*4 )
			end
		end	
	end		
end

DoResearchTechDemand = DoResearchTechDemand_Kushan
