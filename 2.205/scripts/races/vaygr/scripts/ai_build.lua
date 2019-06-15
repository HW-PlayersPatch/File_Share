aitrace("LOADING VAYGR BUILD INFO")

kCollector = VGR_RESOURCECOLLECTOR
kRefinery  = VGR_RESOURCECONTROLLER
kScout = VGR_SCOUT
kInterceptor = VGR_INTERCEPTOR
kBomber = VGR_BOMBER
kCarrier = VGR_CARRIER
kShipYard = VGR_SHIPYARD
kDestroyer = VGR_DESTROYER
kBattleCruiser = VGR_BATTLECRUISER

function DetermineDemandWithNoCounterInfo_Vaygr()
	if (sg_randFavorShipType < 45) then
		ShipDemandAddByClass( eFighter, 1 )
	elseif (sg_randFavorShipType < 75) then
		ShipDemandAddByClass( eCorvette, 1 )
	else
		ShipDemandAddByClass( eFrigate, 1 )
	end
end

function DetermineSpecialDemand_Vaygr()
	local numShipyards = NumSquadrons( kShipYard ) + NumSquadronsQ( kShipYard )
	if (numShipyards == 0 and UnderAttackThreat() < -75) then
		local bcDemand = ShipDemandGet( kBattleCruiser )
		if (bcDemand >= 0.5) then
			ShipDemandAdd( kShipYard, bcDemand-0.5 )
		end
	end
	if (s_militaryStrength > 25*sg_moreEnemies) then
		ShipDemandAddByClass( ePlatform, -2 )
	end
end

Proc_DetermineDemandWithNoCounterInfo = DetermineDemandWithNoCounterInfo_Vaygr
Proc_DetermineSpecialDemand = DetermineSpecialDemand_Vaygr
