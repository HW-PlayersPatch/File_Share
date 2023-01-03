
aitrace("LOADING HIIGARAN UPGRADE INFO")
rt_mothership = {
	health = {
		MOTHERSHIPHEALTHUPGRADE1,
--		MOTHERSHIPHEALTHUPGRADE2,
	},
	speed = {
		MOTHERSHIPMAXSPEEDUPGRADE1,
--		MOTHERSHIPMAXSPEEDUPGRADE2,
	}
}
rt_carrier = {
	health = {
		CARRIERHEALTHUPGRADE1,
--		CARRIERHEALTHUPGRADE2,
	},
	speed = {
		CARRIERMAXSPEEDUPGRADE1,
--		CARRIERMAXSPEEDUPGRADE2,
	},
}
rt_fighter = {
	interceptor = {
		INTERCEPTORMAXSPEEDUPGRADE1,
--		INTERCEPTORMAXSPEEDUPGRADE2,
	},
	bomber = {
		health = {
--			ATTACKBOMBERHEALTHUPGRADE1,
--			ATTACKBOMBERHEALTHUPGRADE2,
		},
		speed = {
			ATTACKBOMBERMAXSPEEDUPGRADE1,
--			ATTACKBOMBERMAXSPEEDUPGRADE2,
		},
	},
}
rt_corvette = {
	assault = {
		health = {
			ASSAULTCORVETTEHEALTHUPGRADE1,
--			ASSAULTCORVETTEHEALTHUPGRADE2,
		},
		speed = {
			ASSAULTCORVETTEMAXSPEEDUPGRADE1,
--			ASSAULTCORVETTEMAXSPEEDUPGRADE2,
		},
	},
	pulsar = {
		health = {
			PULSARCORVETTEHEALTHUPGRADE1,
--			PULSARCORVETTEHEALTHUPGRADE2,
		},
		speed = {
			PULSARCORVETTEMAXSPEEDUPGRADE1,
--			PULSARCORVETTEMAXSPEEDUPGRADE2,
		},
	},
}
rt_frigate = {
	torpedo = {
		health = {
			TORPEDOFRIGATEHEALTHUPGRADE1,
--			TORPEDOFRIGATEHEALTHUPGRADE2,
		},
		speed = {
			TORPEDOFRIGATEMAXSPEEDUPGRADE1,
--			TORPEDOFRIGATEMAXSPEEDUPGRADE2,
		},
	},
	ioncannon = {
		health = {
			IONCANNONFRIGATEHEALTHUPGRADE1,
--			IONCANNONFRIGATEHEALTHUPGRADE2,
		},
		speed = {
			IONCANNONFRIGATEMAXSPEEDUPGRADE1,
--			IONCANNONFRIGATEMAXSPEEDUPGRADE2,
		},
	},
	assault = {
		health = {
			ASSAULTFRIGATEHEALTHUPGRADE1,
--			ASSAULTFRIGATEHEALTHUPGRADE2,
		},
		speed = {
			ASSAULTFRIGATEMAXSPEEDUPGRADE1,
--			ASSAULTFRIGATEMAXSPEEDUPGRADE2,
		},
	},
}
rt_battlecruiser = {
	health = {
		BATTLECRUISERHEALTHUPGRADE1,
--		BATTLECRUISERHEALTHUPGRADE2,
	},
	speed = {
		BATTLECRUISERMAXSPEEDUPGRADE1,
--		BATTLECRUISERMAXSPEEDUPGRADE2,
	},
}
rt_destroyer = {
	DESTROYERHEALTHUPGRADE1,
	DESTROYERMAXSPEEDUPGRADE1,
--	DESTROYERHEALTHUPGRADE2,
--	DESTROYERMAXSPEEDUPGRADE2	,
}
rt_shipyard = {
	health = {
		SHIPYARDHEALTHUPGRADE1,
--		SHIPYARDHEALTHUPGRADE2,
	},
	speed = {
		SHIPYARDMAXSPEEDUPGRADE1,
--		SHIPYARDMAXSPEEDUPGRADE2,
	},
}
rt_platform = {
	gunturret = {
		GUNTURRETHEALTHUPGRADE1,
--		GUNTURRETHEALTHUPGRADE2,
	},
	ionturret = {
		IONTURRETHEALTHUPGRADE1,
--		IONTURRETHEALTHUPGRADE2,
	},
}
rt_collector = {
	RESOURCECOLLECTORHEALTHUPGRADE1,
--	RESOURCECOLLECTORHEALTHUPGRADE2,
}
rt_refinery = {
	RESOURCECONTROLLERHEALTHUPGRADE1,
--	RESOURCECONTROLLERHEALTHUPGRADE2,
}
rt_hyperspace = {
	cost = {
		HYPERSPACECOSTUPGRADE1,
		HYPERSPACECOSTUPGRADE2,
	},

}





function DoUpgradeDemand_Hiigaran()

	ResearchDemandSet( INTERCEPTORMAXSPEEDUPGRADE1, 5 )
	ResearchDemandSet( ATTACKBOMBERMAXSPEEDUPGRADE1, 5 )
	ResearchDemandSet( ASSAULTCORVETTEHEALTHUPGRADE1, 5 )
	ResearchDemandSet( ASSAULTCORVETTEMAXSPEEDUPGRADE1, 5 )
	ResearchDemandSet( PULSARCORVETTEHEALTHUPGRADE1, 2 )
	ResearchDemandSet( TORPEDOFRIGATEHEALTHUPGRADE1, 2 )	
	ResearchDemandSet( TORPEDOFRIGATEMAXSPEEDUPGRADE1, 2 )	
	ResearchDemandSet( IONCANNONFRIGATEHEALTHUPGRADE1, 2 )	
	ResearchDemandSet( IONCANNONFRIGATEMAXSPEEDUPGRADE1, 2 )
	ResearchDemandSet( ASSAULTFRIGATEHEALTHUPGRADE1, 2 )
	ResearchDemandSet( MOTHERSHIPBUILDSPEEDUPGRADE1, 2 )

	
	if (s_militaryStrength > 10 or g_LOD == 0) then
		inc_upgrade_demand( rt_mothership, 0.5  )
		ResearchDemandAdd( MOTHERSHIPBUILDSPEEDUPGRADE1, 0.5 )
		local numPlatforms = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatforms > 1) then
			local numGunTurret = NumSquadrons( HGN_GUNTURRET )
			if (numGunTurret > 1) then
				inc_upgrade_demand( rt_platform.gunturret, numGunTurret*1 )
			end
			local numIonTurret = NumSquadrons( HGN_IONTURRET )
			if (numIonTurret > 1) then
				inc_upgrade_demand( rt_platform.ionturret, numIonTurret*1 )
			end
		end
		local numCollectors = NumSquadrons( kCollector )
		if (numCollectors > 0) then
			inc_upgrade_demand( rt_collector, numCollectors*.5 )
		end
		local numRefinery = NumSquadrons( kRefinery )
		if (numRefinery > 0) then
			inc_upgrade_demand( rt_refinery, numRefinery*1.5 )
		end
		local numCarrier = NumSquadrons( kCarrier )
		if (numCarrier > 0) then
			inc_upgrade_demand( rt_carrier, numCarrier*1 )
			ResearchDemandAdd( CARRIERBUILDSPEEDUPGRADE1, numCarrier*1.25 )
		end
		local numShipYards = NumSquadrons( kShipYard )
		if (numShipYards > 0) then
			inc_upgrade_demand( rt_shipyard, numShipYards*1.5  )
			ResearchDemandAdd( SHIPYARDBUILDSPEEDUPGRADE1, numShipYards*1.75 )
		end
	end
	local numFighter = numActiveOfClass( s_playerIndex, eFighter )
	if (numFighter > 1) then
		local numInterceptors = NumSquadrons( kInterceptor )
		if (numInterceptors > 1) then
			inc_upgrade_demand( rt_fighter.interceptor, numInterceptors*1 )
		end
		local numBombers = NumSquadrons( kBomber )
		if (numBombers > 1) then
			inc_upgrade_demand( rt_fighter.bomber, numBombers*1.5 )
		end
	end
	local numBattleCruiser = NumSquadrons( kBattleCruiser )
	if (numBattleCruiser > 0) then
		inc_upgrade_demand( rt_battlecruiser, numBattleCruiser*2.5  )
	end
	local numDestroyers = NumSquadrons( kDestroyer )
	if (numDestroyers > 0) then
		inc_upgrade_demand( rt_destroyer, numDestroyers*2  )
	end
	local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )
	if (numCorvette > 1) then
		local numAssaultCorvette = NumSquadrons( HGN_ASSAULTCORVETTE )
		if (numAssaultCorvette>2) then
			inc_upgrade_demand( rt_corvette.assault, numAssaultCorvette*1.25 )
		end
		local numPulsarCorvette = NumSquadrons( HGN_PULSARCORVETTE )
		if (numPulsarCorvette>2) then
			inc_upgrade_demand( rt_corvette.pulsar, numPulsarCorvette*1.25 )
		end
	end
	local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
	if (numFrigate > 2) then
		local numTorpedoFrigate = NumSquadrons( HGN_TORPEDOFRIGATE )
		if (numTorpedoFrigate>2) then
			inc_upgrade_demand( rt_frigate.torpedo, numTorpedoFrigate*1.5 )
		end
		local numIonFrigate = NumSquadrons( HGN_IONCANNONFRIGATE )
		if (numIonFrigate>2) then
			inc_upgrade_demand( rt_frigate.ioncannon, numIonFrigate*1.5 )
		end
		local numAssaultFrigate = NumSquadrons( HGN_ASSAULTFRIGATE )
		if (numAssaultFrigate>2) then
			inc_upgrade_demand( rt_frigate.assault, numAssaultFrigate*1.5 )
		end
	end
end

function DoResearchTechDemand_Hiigaran()
	local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)
	if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERIONWEAPONS)) then
		local battleCruiserDemand = ShipDemandGet( kBattleCruiser )
		if (battleCruiserDemand > 0) then
			ResearchDemandSet( BATTLECRUISERIONWEAPONS, battleCruiserDemand )
		end
	end
	if (Util_CheckResearch(PLATFORMIONWEAPONS)) then
		local ionTurretDemand = ShipDemandGet(HGN_IONTURRET)
		if (ionTurretDemand > 0) then
			ResearchDemandSet( PLATFORMIONWEAPONS, ionTurretDemand )
		end
	end
	if (Util_CheckResearch(DESTROYERTECH) ) then		
		local destroyerDemand = ShipDemandGet(HGN_DESTROYER)
		if (destroyerDemand > 0) then
			ResearchDemandSet( DESTROYERTECH, destroyerDemand )
		end
	end
	if (Util_CheckResearch(ATTACKBOMBERIMPROVEDBOMBS) ) then
		local numBombers = NumSquadrons( kBomber )
		if (numBombers > 2) then
			ResearchDemandSet( ATTACKBOMBERIMPROVEDBOMBS, numBombers )
		end
	end
	if (Util_CheckResearch(IMPROVEDTORPEDO) ) then
		local numTorpedoFrigs = NumSquadrons( HGN_TORPEDOFRIGATE )
		if (numTorpedoFrigs > 2) then
			ResearchDemandSet( IMPROVEDTORPEDO, numTorpedoFrigs )
		end
	end
	if (s_militaryPop > 15 and GetRU() > 750) then
		if (Util_CheckResearch(DEFENSEFIELDFRIGATESHIELD) ) then
			local DFFDemand = ShipDemandGet(HGN_DEFENSEFIELDFRIGATE)
			if (DFFDemand > 0) then
				ResearchDemandSet( DEFENSEFIELDFRIGATESHIELD, DFFDemand )
			end
		end
		if (Util_CheckResearch(ECMPROBE) ) then
			local ecmProbeDemand = ShipDemandGet(HGN_ECMPROBE)
			if (ecmProbeDemand>0) then
				ResearchDemandSet( ECMPROBE, ecmProbeDemand )
			end
		end
		if (Util_CheckResearch(GRAVITICATTRACTIONMINES) ) then
			local mineLayerDemand = ShipDemandGet(HGN_MINELAYERCORVETTE)
			if (mineLayerDemand > 0) then
				ResearchDemandSet( GRAVITICATTRACTIONMINES, mineLayerDemand )
			end
		end
	end
end

DoUpgradeDemand = DoUpgradeDemand_Hiigaran
DoResearchTechDemand = DoResearchTechDemand_Hiigaran
