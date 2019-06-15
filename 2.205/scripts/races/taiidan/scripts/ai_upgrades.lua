aitrace("LOADING TAIIDAN UPGRADE INFO")

function DoResearchTechDemand_Taiidan()	
	ResearchDemandSet( FIGHTERDRIVE, 10 )
	ResearchDemandSet( SUPERCAPITALSHIPDRIVE, 4 )
	ResearchDemandSet( IONCANNONS, 1 )
	ResearchDemandSet( HEAVYGUNS, 1 )

	if (Util_CheckResearch(FIGHTERCHASSIS)) and (GetRU() > 200) then
		local demand = ShipDemandGet(TAI_INTERCEPTOR)
		if (demand > 0) then
			ResearchDemandSet( FIGHTERCHASSIS, demand*2 )
		end
	end
	if (Util_CheckResearch(CORVETTEDRIVE)) and (GetRU() > 800) then
		local demand = ShipDemandGet(TAI_LIGHTCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( CORVETTEDRIVE, demand*2 )
			ResearchDemandSet( CORVETTECHASSIS, demand*2 )
		end
	end
	if (Util_CheckResearch(CORVETTECHASSIS)) and (GetRU() > 400) then
		local demand = ShipDemandGet(TAI_LIGHTCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( CORVETTEDRIVE, demand*2 )
			ResearchDemandSet( CORVETTECHASSIS, demand*2 )
		end
	end

	if (Util_CheckResearch(CAPITALSHIPDRIVE)) and (GetRU() > 1200) then
		local assfrigdemand = ShipDemandGet(TAI_ASSAULTFRIGATE)
		if (assfrigdemand > 0) then
			ResearchDemandSet( CAPITALSHIPDRIVE, assfrigdemand*2 )
			ResearchDemandSet( CAPITALSHIPCHASSIS, assfrigdemand*2 )
		end
	end
	if (Util_CheckResearch(CAPITALSHIPCHASSIS)) and (GetRU() > 900) then
		local assfrigdemand = ShipDemandGet(TAI_ASSAULTFRIGATE)
		if (assfrigdemand > 0) or (dronefrigdemand > 0) then
			ResearchDemandSet( CAPITALSHIPDRIVE, assfrigdemand*2 )
			ResearchDemandSet( CAPITALSHIPCHASSIS, assfrigdemand*2 )
		end
	end
	if (Util_CheckResearch(HEAVYGUNS)) and (GetRU() > 1900) then
		local assfrigdemand = ShipDemandGet(TAI_ASSAULTFRIGATE)
		if (assfrigdemand > 0) then
			ResearchDemandSet( GRAVITYGENERATOR, assfrigdemand*2 )
			ResearchDemandSet( PROXIMITYSENSOR, assfrigdemand*2 )
			ResearchDemandSet( SENSORARRAY, assfrigdemand*2 )
			ResearchDemandSet( CLOAKGENERATOR, assfrigdemand*2 )
		end
	end

--	if (Util_CheckResearch(PLASMABOMBLAUNCHER)) and (GetRU() > 400) then
--		local demand = ShipDemandGet(TAI_ATTACKBOMBER)
--		if (demand > 0) then
--			ResearchDemandSet( PLASMABOMBLAUNCHER, demand )
--		end
--	end
	if (Util_CheckResearch(DEFENDERSUBSYSTEMS)) and (GetRU() > 400) then
		local demand = ShipDemandGet(TAI_DEFENDER)
		if (demand > 0) then
			ResearchDemandSet( DEFENDERSUBSYSTEMS, demand )
		end
	end
	if (Util_CheckResearch(HEAVYCORVETTEUPGRADE)) and (GetRU() > 600) then
		local demand = ShipDemandGet(TAI_HEAVYCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( HEAVYCORVETTEUPGRADE, demand )
		end
	end
	if (Util_CheckResearch(FASTTRACKINGTURRETS)) and (GetRU() > 700) then
		local demand = ShipDemandGet(TAI_MULTIGUNCORVETTE)
		if (demand > 0) then
			ResearchDemandSet( FASTTRACKINGTURRETS, demand )
		end
	end
	if (Util_CheckResearch(IONCANNONS)) then
		local demand = ShipDemandGet(TAI_IONCANNONFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( IONCANNONS, demand )
		end
	end
	if (Util_CheckResearch(DEFENSEFIELD)) then
		local demand = ShipDemandGet(TAI_FIELDFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( DEFENSEFIELD, demand )
		end
	end
	if (Util_CheckResearch(GUIDEDMISSILES)) then
		local demand = ShipDemandGet(TAI_DESTROYER)
		if (demand > 0) then
			ResearchDemandSet( GUIDEDMISSILES, demand )
		end
	end
	if (Util_CheckResearch(SUPERHEAVYCHASSIS)) then
		local carrierdemand = ShipDemandGet(TAI_CARRIER)
		if (carrierdemand > 0) then
			ResearchDemandSet( SUPERHEAVYCHASSIS, carrierdemand )
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

DoResearchTechDemand = DoResearchTechDemand_Taiidan
