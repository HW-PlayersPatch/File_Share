aitrace("LOADING TAIIDAN BUILD INFO")

		kCollector = TAI_RESOURCECOLLECTOR
		kRefinery  = TAI_RESOURCECONTROLLER
		kScout = TAI_SCOUT
		kDefender = TAI_DEFENDER
		kHeavyVette = TAI_HEAVYCORVETTE
		kInterceptor = TAI_INTERCEPTOR
		kBomber = TAI_ATTACKBOMBER
		kMgun= TAI_MULTIGUNCORVETTE
		kSpecFighter = TAI_DEFENSEFIGHTER
		kCarrier = TAI_CARRIER		
		kDestroyer = TAI_DESTROYER
		kMissileDestroyer = TAI_MISSILEDESTROYER
		kBattleCruiser = TAI_HEAVYCRUISER	

function DetermineDemandWithNoCounterInfo_Taiidan()
end

function DetermineSpecialDemand_Taiidan()
		ShipDemandSet( TAI_RESEARCHSHIP, 20)	

		local numRes0 = NumSquadrons( TAI_RESEARCHSHIP ) 
		if(numRes0 == 1 ) then
		ShipDemandSet( TAI_RESEARCHSHIP, 0)
		ShipDemandSet( TAI_RESEARCHSHIP_1, 11)	
		end
		local numRes1 = NumSquadrons( TAI_RESEARCHSHIP_1 ) 
		if(numRes1 == 1 ) and (GetRU() > 750) then
		ShipDemandSet( TAI_RESEARCHSHIP_1, 0)
		ShipDemandSet( TAI_RESEARCHSHIP_2, 11)
		ShipDemandSet( TAI_LIGHTCORVETTE, 0.5)
		end
		local numRes2 = NumSquadrons( TAI_RESEARCHSHIP_2 ) 
		if(numRes2 == 1 ) and (GetRU() > 750) then
		ShipDemandSet( TAI_RESEARCHSHIP_2, 0)	
		ShipDemandSet( TAI_RESEARCHSHIP_3, 11)	
		end
		local numRes3 = NumSquadrons( TAI_RESEARCHSHIP_3 ) 
		if(numRes3 == 1 ) and (GetRU() > 750) then
		ShipDemandSet( TAI_RESEARCHSHIP_3, 0)
		ShipDemandSet( TAI_RESEARCHSHIP_4, 11)	
		end
		local numRes4 = NumSquadrons( TAI_RESEARCHSHIP_4 ) 
		if(numRes4 == 1 ) and (GetRU() > 750) then
		ShipDemandSet( TAI_RESEARCHSHIP_4, 0)
		ShipDemandSet( TAI_RESEARCHSHIP_5, 11)	
		end
		local numRes5 = NumSquadrons( TAI_RESEARCHSHIP_5 ) 
		if(numRes5 == 1 ) and (GetRU() > 750) then
		ShipDemandSet( TAI_RESEARCHSHIP_5, 0)	
		end
		local numRColls = NumSquadrons( TAI_RESOURCECOLLECTOR ) 
		if(numRColls == 18 ) and (GetRU() > 750) then
		ShipDemandSet( TAI_RESEARCHSHIP_5, 0)
		end





	local numCarriers= NumSquadrons(kCarrier) + NumSquadronsQ(kCarrier)
	local numCruisers = NumSquadrons(kBattleCruiser) + NumSquadronsQ(kBattleCruiser)

	local numEnemyFighters = numActiveOfClass( s_enemyIndex, eFighter )
	local numEnemyVettes = numActiveOfClass( s_enemyIndex, eCorvette )
	local numEnemyFrigates = numActiveOfClass( s_enemyIndex, eFrigate)
	local numEnemyDestroyers = numActiveOfClass( s_enemyIndex, eDestroyer )
	local numEnemyCarriers = numActiveOfClass( s_enemyIndex, eBuilder )
	local numEnemyCruisers = numActiveOfClass( s_enemyIndex, eBattleCruiser )

	local numEnemyAntiFighter = numActiveOfClass( s_enemyIndex, eAntiFighter )
	local numEnemyAntiVettes = numActiveOfClass( s_enemyIndex, eAntiCorvette )
	local numEnemyAntiFrigates = numActiveOfClass( s_enemyIndex, eAntiFrigate)
	local numEnemyAntiCruisers = numActiveOfClass( s_enemyIndex, eSubSystemAttackers )

	local numActiveFighters = numActiveOfClass( s_playerIndex, eFighter )
	local numActiveVettes = numActiveOfClass( s_playerIndex, eCorvette )
	local numActiveFrigates = numActiveOfClass( s_playerIndex, eFrigate )
	local numActiveDestroyers = numActiveOfClass( s_playerIndex, eDestroyer )
	local numActiveCarriers = numActiveOfClass( s_playerIndex, eBuilder )

	local numTotalFighters = PlayersUnitTypeCount( player_enemy, player_total, eFighter )
	local numTotalVettes = PlayersUnitTypeCount( player_enemy, player_total, eCorvette )
	local numTotalFrigs = PlayersUnitTypeCount( player_enemy, player_total, eFrigate )
	local numTotalDestroyers = PlayersUnitTypeCount( player_enemy, player_total, eDestroyer )

	local numMissileDestroyers = NumSquadrons( kMissileDestroyer ) + NumSquadronsQ( kMissileDestroyer )

	local FighterDemand = numActiveOfClass( s_enemyIndex, eFighter )
	local CorvetteDemand = numActiveOfClass( s_enemyIndex, eCorvette )
	local FrigateDemand = numActiveOfClass( s_enemyIndex, eFrigate)
	local DestroyerDemand = numActiveOfClass( s_enemyIndex, eDestroyer )
	local CruiserDemand = numActiveOfClass( s_enemyIndex, eBattleCruiser )

	local AssaultFrigateDemand = ShipDemandGet(TAI_ASSAULTFRIGATE)

	local FighterThresh=0
	local CorvetteThresh=0
	local FrigateThresh=0
	local DestroyerThresh=0

	if (numEnemyFighters > 5 ) and ( numActiveFighters < numEnemyFighters ) then
		FighterThresh = 1
	else
		FighterThresh = 0
	end

	if (numEnemyVettes > 5 ) and ( numActiveVettes < numEnemyVettes ) then
		CorvetteThresh = 1
	else
		CorvetteThresh = 0
	end


	if (numEnemyFrigates > 5 ) and ( numActiveFrigates < numEnemyFrigates ) then
		FrigateThresh = 1
	else
		FrigateThresh = 0
	end


	local shipId = FindHighDemandShip()
	local BestTarget  = HighestPriorityShip()

	local totalProd = numActiveCarriers
	s_militaryPop = PlayersMilitaryPopulation( s_playerIndex, player_total );
	s_selfTotalValue = PlayersMilitary_Total( s_playerIndex, player_total );
	s_enemyTotalValue = PlayersMilitary_Total( player_enemy, player_max );
	s_militaryStrength = PlayersMilitary_Threat( player_enemy, player_min );
	s_enemyIndex = GetChosenEnemy()


	if (s_selfTotalValue > 5) and (numEnemyFighters > 5 ) and ( FighterThresh ~= 0 ) then
		ShipDemandAddByClass( eAntiFighter, 0.5 )
		ShipDemandAdd( kMgun, 0.5 )
		ShipDemandAdd( kDefender, AssaultFrigateDemand + 0.5 )
		ShipDemandAddByClass( eCorvette, 0.5 )
		ShipDemandAdd( kMissileDestroyer, 0.5 )
		Build (shipId)

	else
	if ( FighterThresh == 1 ) then
		ShipDemandAddByClass( eAntiFighter, -0.15 )
		ShipDemandAdd( kMgun, -0.15 )
		ShipDemandAdd( kDefender, -0.15 )
		ShipDemandAddByClass( eCorvette, -0.15 )
		ShipDemandAdd( kMissileDestroyer, -0.15 )
		end
	end

	if (s_selfTotalValue > 10) and (numEnemyVettes > 5 ) and ( CorvetteThresh ~= 0 ) then
		ShipDemandAddByClass( eAntiCorvette, 0.5 )
		ShipDemandAddByClass( eCorvette, 0.5 )
		ShipDemandAdd( kMissileDestroyer, 0.5 )
		Build (shipId)
	else
	if ( CorvetteThresh == 1 ) then
		ShipDemandAddByClass( eAntiFighter, -0.15 )
		ShipDemandAdd( kMgun, -0.15 )
		ShipDemandAdd( kDefender, -0.15 )
		ShipDemandAddByClass( eCorvette, -0.15 )
		ShipDemandAdd( kMissileDestroyer, -0.15 )
		end
	end	

	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.5
		ShipDemandAddByClass( eFrigate, additionalFrigDemand )		
		ShipDemandAddByClass( eFighter, 0.65 )
		Build (shipId)
end


	if (numEnemyFrigates > 10 ) and (numActiveFrigates / numActiveVettes + numActiveFighters  > 0.4) then

		ShipDemandAddByClass( eFighter, 0.95 )
		ShipDemandAddByClass( eCorvette, 0.95 )
		ShipDemandAddByClass( eFrigate, -3.0 )
	end


	if (s_selfTotalValue > 75) and (numEnemyVettes > 5 ) and ( numActiveVettes < numEnemyVettes ) then
		ShipDemandAddByClass( eFighter, 0.15 )
		ShipDemandAddByClass( eCorvette, 0.45 )
		ShipDemandAddByClass( eAntiCorvette, 0.35 )
	end	

	if (s_selfTotalValue > 75) and (numEnemyFrigates > 5 ) then
		ShipDemandAddByClass( eFighter, 0.35 )
		ShipDemandAddByClass( eCorvette, 0.25 )
		ShipDemandAddByClass( eAntiFrigate, 0.35 )
	else
	if (s_selfTotalValue > 75) and (numEnemyFrigates > 10 ) then
		ShipDemandAddByClass( eAntiFrigate, 0.5 )
		ShipDemandAddByClass( eFighter, 0.35 )
		ShipDemandAddByClass( eCorvette, 0.45 )
		ShipDemandAdd( kDestroyer, 0.75 )
	else
	if (s_selfTotalValue > 75) and (numEnemyFrigates > 15 ) then
		ShipDemandAdd( kDestroyer, 1.75 )
	else
	if (s_selfTotalValue > 75) and (numEnemyFrigates > 18 ) then
		ShipDemandAdd( kBattleCruiser, 2.5 )

	else
	if (s_selfTotalValue > 75) and (numEnemyFrigates > 10 ) and ( numActiveFrigates < numEnemyFrigates ) then
		ShipDemandAddByClass( eCorvette, FrigateDemand )
		end
	end
end


end
end

	if  ( numActiveFrigates > numActiveVettes + numActiveFighters ) then
		ShipDemandAddByClass( eCorvette, FrigateDemand )
		ShipDemandAddByClass( eFighter, FrigateDemand )
		end





		controller = TAI_RESOURCECONTROLLER
		local numControllers = NumSquadrons(controller) + NumSquadronsQ(kRefinery)
		if (numControllers > 5 ) then
		ShipDemandSet( kRefinery, 0)
	else
		resourcers = TAI_RESOURCECOLLECTOR
		local numResourcers = NumSquadrons(kCollector) + NumSquadronsQ(kCollector)
		if (numResourcers > 9 ) then
		ShipDemandAdd( kRefinery, 0.5 )
		end
	end

	if (numEnemyFrigates < 30 ) then
	ShipDemandSet( kBomber, 0)
	ShipDemandAdd( kBomber, -10.5 )
	end



		if numTotalDestroyers > 0 then
			ShipDemandAdd( kDestroyer, DestroyerDemand )
			ShipDemandAdd( kMissileDestroyer, DestroyerDemand + (numTotalDestroyers / 2 - numMissileDestroyers ) )
		else
			ShipDemandAdd( kDestroyer, 0.05 )
		ShipDemandAddByClass( eBuilder, DestroyerDemand + 20.0 )
			end

		if numEnemyFighters > 10 then
			ShipDemandAdd( kMgun, FighterDemand + (numEnemyFighters + numActiveFighters ) )
			end

	if (s_selfTotalValue > 75) and (numEnemyCarriers > 1 ) and (GetRU() > 2800 )  then
		ShipDemandAddByClass( eBuilder, FrigateDemand + 20.0 )
		Build( TAI_CARRIER )
		end

	if (s_selfTotalValue > 75) and (numEnemyCarriers > 1 ) and (CanBuild( TAI_CARRIER ) == 1 and GetRU() > 2800 )  then
		ShipDemandAddByClass( eBuilder, FrigateDemand + 20.0 )
		Build( TAI_CARRIER )
		end


		Taiidancarrier = TAI_CARRIER	
		if (numCarriers == 3 ) then
		ShipDemandSet( TAI_CARRIER, 0)
		end



		if (numCarriers > 2 ) and (numCruisers < 3 ) and (numEnemyDestroyers > 2 ) and (GetRU() > 2800 ) then
		ShipDemandAdd( kBattleCruiser, 12.5 )
		Build( TAI_HEAVYCRUISER )
		else
		if (numCarriers > 2 ) and (numCruisers == 2 ) then
		ShipDemandSet( TAI_HEAVYCRUISER, 0)
	end

	end
end

Proc_DetermineDemandWithNoCounterInfo = DetermineDemandWithNoCounterInfo_Taiidan
Proc_DetermineSpecialDemand = DetermineSpecialDemand_Taiidan
