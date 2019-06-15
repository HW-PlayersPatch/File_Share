aitrace("LOADING VAYGR UPGRADE INFO")

rt_mothership = {
	MOTHERSHIPHEALTHUPGRADE1,
	MOTHERSHIPHEALTHUPGRADE2,
	MOTHERSHIPMAXSPEEDUPGRADE1,
	MOTHERSHIPMAXSPEEDUPGRADE2,
}
rt_capital = {
	SUPERCAPHEALTHUPGRADE1,
	SUPERCAPHEALTHUPGRADE2,
	SUPERCAPSPEEDUPGRADE1,
	SUPERCAPSPEEDUPGRADE2,
}
rt_fighter = {
	
	FIGHTERHEALTHUPGRADE1,
	FIGHTERHEALTHUPGRADE2,
}
rt_corvette = {
	
	CORVETTEHEALTHUPGRADE1,
	CORVETTEHEALTHUPGRADE2
}
rt_frigate = {
	FRIGATEHEALTHUPGRADE1,
	FRIGATEHEALTHUPGRADE2,
}
rt_platform = {
	PLATFORMHEALTHUPGRADE1,
	PLATFORMHEALTHUPGRADE2,
}
rt_collector = {
	UTILITYHEALTHUPGRADE1,
	UTILITYHEALTHUPGRADE2,
}

function DoUpgradeDemand_Vaygr()
-- A Hack, but the swarm must have upgrades
	ResearchDemandSet( FIGHTERSPEEDUPGRADE1, 7 )
	ResearchDemandSet( CORVETTEHEALTHUPGRADE1, 6 )
	ResearchDemandSet( CORVETTESPEEDUPGRADE1, 5 )
	ResearchDemandSet( FRIGATEHEALTHUPGRADE1, 4 )
	ResearchDemandSet( FRIGATESPEEDUPGRADE1, 3 )
	ResearchDemandSet( SUPERCAPHEALTHUPGRADE1, 2 )	
	ResearchDemandSet( SUPERCAPSPEEDUPGRADE1, 1 )	

	if (s_militaryStrength > 10 or g_LOD == 0 or GetRU() > 2200) then
		inc_upgrade_demand( rt_mothership, 0.5 )
		ResearchDemandAdd( MOTHERSHIPBUILDSPEEDUPGRADE1, 0.5 )
		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )
		if (numCorvette > 2) then
			inc_upgrade_demand( rt_corvette, numCorvette )
		end
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if (numFrigate > 2) then
			inc_upgrade_demand( rt_frigate, numFrigate*1 )
		end
		local numPlatforms = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatforms > 0) then
			inc_upgrade_demand( rt_platform, numPlatforms*1 )
		end
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )
		if (numCapital > 1) then
			inc_upgrade_demand( rt_capital, numCapital*0.5 )
		end
		local numCarrier = NumSquadrons( kCarrier )
		if (numCarrier > 0) then
			ResearchDemandAdd( CARRIERBUILDSPEEDUPGRADE1, numCarrier*1.25 )
		end
		local numShipYards = NumSquadrons( kShipYard )
		if (numShipYards > 0) then
			ResearchDemandAdd( SHIPYARDBUILDSPEEDUPGRADE1, numShipYards*1.75 )
		end
	end
end

function DoResearchTechDemand_Vaygr()
	if (Util_CheckResearch(HYPERSPACEGATETECH)) then
		local demand = ShipDemandGet(kShipYard)
		if (demand > 0) then
			ResearchDemandSet( HYPERSPACEGATETECH, demand+0.5 )
		end
	end
	local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)
	if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERIONWEAPONS)) then
		local battleCruiserDemand = ShipDemandGet( kBattleCruiser )
		if (battleCruiserDemand > 0) then
			ResearchDemandSet( BATTLECRUISERIONWEAPONS, battleCruiserDemand )
		end
	end
	if (Util_CheckResearch(DESTROYERGUNS)) then
		local demand = ShipDemandGet(VGR_DESTROYER)
		if (demand > 0) then
			ResearchDemandSet( DESTROYERGUNS, demand )
		end
	end
	if (Util_CheckResearch(LANCEBEAMS)) then
		local lancedemand = ShipDemandGet(VGR_LANCEFIGHTER)
		if (lancedemand > 0) then
			ResearchDemandSet( LANCEBEAMS, lancedemand + 0.5 )
		end
	end
	if (Util_CheckResearch(PLASMABOMBS) ) then
		local bomberdemand = ShipDemandGet( VGR_BOMBER )
		if (bomberdemand > 0) then
			ResearchDemandSet( PLASMABOMBS, bomberdemand+1.0 )
		end
	end
	if (Util_CheckResearch(CORVETTELASER)) then
		local laserdemand = ShipDemandGet(VGR_LASERCORVETTE)
		if (laserdemand > 0) then
			ResearchDemandSet( CORVETTELASER, laserdemand )
		end
	end
	if (Util_CheckResearch(FRIGATEASSAULT)) then
		local demand = ShipDemandGet(VGR_ASSAULTFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( FRIGATEASSAULT, demand )
		end
	end
	if (Util_CheckResearch(PLATFORMHEAVYMISSILES)) then
		local demand = ShipDemandGet(VGR_WEAPONPLATFORM_MISSILE)
		if (demand > 0) then
			ResearchDemandSet( PLATFORMHEAVYMISSILES, demand )
		end
	end
	if (Util_CheckResearch(BOMBERIMPROVEDBOMBS) ) then
		local numBombers = NumSquadrons( kBomber )
		if (numBombers > 2) then
			ResearchDemandSet( BOMBERIMPROVEDBOMBS, numBombers )
		end
	end
	if (Util_CheckResearch(CORVETTETECH) ) then
		local corvdemand = ShipDemandMaxByClass( eCorvette )
		if (corvdemand > 0) then
			ResearchDemandSet( CORVETTETECH, corvdemand+0.5 )
		end
	end
	if (Util_CheckResearch(FRIGATETECH) ) then
		local frigdemand = ShipDemandMaxByClass( eFrigate )
		if (frigdemand > 0) then
			ResearchDemandSet( FRIGATETECH, frigdemand+0.5 )
		end
	end
	if (s_militaryPop > 15 and GetRU() > 750) then	
		if (Util_CheckResearch(CORVETTEGRAVITICATTRACTION) ) then
			local mineLayerDemand = ShipDemandGet(VGR_MINELAYERCORVETTE)
			if (mineLayerDemand > 0) then
				ResearchDemandSet( CORVETTEGRAVITICATTRACTION, mineLayerDemand )
			end
		end
		if (Util_CheckResearch(CORVETTECOMMAND)) then
			local commanddemand = ShipDemandGet(VGR_COMMANDCORVETTE)
			if (commanddemand > 0) then
				ResearchDemandSet( CORVETTECOMMAND, commanddemand )
			end
		end
		if (Util_CheckResearch(FRIGATEINFILTRATIONTECH)) then
			local demand = ShipDemandGet(VGR_INFILTRATORFRIGATE)
			if (demand > 0) then
				ResearchDemandSet( FRIGATEINFILTRATIONTECH, demand )
			end
		end	
	end		
end

DoUpgradeDemand = DoUpgradeDemand_Vaygr
DoResearchTechDemand = DoResearchTechDemand_Vaygr
