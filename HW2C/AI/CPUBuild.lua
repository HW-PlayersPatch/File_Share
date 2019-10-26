-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

aitrace("LOADING CPU BUILD")

dofilepath("data:ai/cpuresource.lua")
dofilepath("data:ai/cpubuildsubsystem.lua")

function CreateBuildDefinitions()
	if (s_race == Race_Hiigaran) then
	kCollector = HGN_RESOURCECOLLECTOR
	kRefinery = HGN_RESOURCECONTROLLER
	kScout = HGN_SCOUT
	kInterceptor = HGN_INTERCEPTOR
	kBomber = HGN_ATTACKBOMBER
	kCarrier = HGN_CARRIER
	kShipYard = HGN_SHIPYARD
	kDestroyer = HGN_DESTROYER
	kBattleCruiser = HGN_BATTLECRUISER
	else
	kCollector = VGR_RESOURCECOLLECTOR
	kRefinery = VGR_RESOURCECONTROLLER
	kScout = VGR_SCOUT
	kInterceptor = VGR_INTERCEPTOR
	kBomber = VGR_BOMBER
	kCarrier = VGR_CARRIER
	kShipYard = VGR_SHIPYARD
	kDestroyer = VGR_DESTROYER
	kBattleCruiser = VGR_BATTLECRUISER
	end
end

function CpuBuild_PersonalityDemand()
	if (s_race == Race_Hiigaran) then
	sg_classPersonalityDemand[eFighter] = 0.5
	sg_classPersonalityDemand[eCorvette] = 0.25
	sg_classPersonalityDemand[eFrigate] = 0
	else
	sg_classPersonalityDemand[eFighter] = 0.5
	sg_classPersonalityDemand[eCorvette] = 0.5
	sg_classPersonalityDemand[eFrigate] = 0.25
	end
	sg_classPersonalityDemand[ePlatform] = -0.5
	if (Rand(100) < 10) then
	sg_classPersonalityDemand[ePlatform] = 0
	end
	if (g_LOD >= 2) then
	sg_classPersonalityDemand[ePlatform] = sg_classPersonalityDemand[ePlatform] - 3
	end
	aitrace("PersonalityDemand: Fi:"..sg_classPersonalityDemand[eFighter].." Co:"..sg_classPersonalityDemand[eCorvette].." Fr:"..sg_classPersonalityDemand[eFrigate])
end

function CpuBuild_Init()
	CreateBuildDefinitions()
	CpuBuildSS_Init()
	CpuResource_Init()
	sg_resourceDemand = 1
	sg_scoutDemand = 0
	sg_militaryDemand = 1
	sg_randScoutStartBuildTime = 30 + Rand(120)
	sg_randFavorShipType = Rand(100)
	sg_classPersonalityDemand = {}
	CpuBuild_PersonalityDemand()
	sg_subSystemOverflowDemand = 0
	sg_subSystemDemand = 0
	sg_shipDemand = 4
	sg_militaryToBuildPerCollector = 0
	if (g_LOD == 0) then
	CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Easy
	elseif (g_LOD == 1) then
	CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Med
	else
	CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Hard
	end
	cp_shipDemandRange = 0.5
	cp_subSystemDemandRange = 0.5
	if (g_LOD == 1) then
	cp_shipDemandRange = 1
	cp_subSystemDemandRange = 1
	end
	if (g_LOD == 0) then
	cp_shipDemandRange = 2
	cp_subSystemDemandRange = 2
	end
	if (Override_BuildDemandInit) then
	Override_BuildDemandInit()
	end
	kUnitCapId_Fighter = GetUnitCapFamilyId("Fighter")
	kUnitCapId_Corvette = GetUnitCapFamilyId("Corvette")
	kUnitCapId_Frigate = GetUnitCapFamilyId("Frigate")
end

function DetermineClassDemand()
	for i = 0, eMaxCount do
	if (sg_classPersonalityDemand[i] and sg_classPersonalityDemand[i] ~= 0) then
	ShipDemandSetByClass(i, sg_classPersonalityDemand[i]);
	end
	end
	ShipDemandSetByClass(eUselessShips, -10)
end

function DetermineAntiChassisDemand(enemyIndex)
	local kFighterCounterScale = 3
	local kCorvetteCounterScale = 1.5
	local kFrigateCounterScale = 1
	local AFiDemand = 0
	local ACoDemand = 0
	local AFrDemand = 0
	local FiValue = PlayersMilitary_Fighter(enemyIndex, player_max)
	local self_AFiValue = PlayersMilitary_AntiFighter(s_playerIndex, player_max)
	local enemy_FiTotal = (FiValue - self_AFiValue) * kFighterCounterScale
	if (enemy_FiTotal < 0) then
	enemy_FiTotal = 0
	end
	local CoValue = PlayersMilitary_Corvette(enemyIndex, player_max)
	local self_ACoValue = PlayersMilitary_AntiCorvette(s_playerIndex, player_max)
	local enemy_CoTotal = (CoValue - self_ACoValue) * kCorvetteCounterScale
	if (enemy_CoTotal < 0) then
	enemy_CoTotal = 0
	end
	local MSfrig_correction = 0
	if (s_militaryStrengthVersusTarget < 20) then
	MSfrig_correction = 25
	end
	local FrValue = PlayersMilitary_Frigate(enemyIndex, player_max) - MSfrig_correction
	local self_AFrValue = PlayersMilitary_AntiFrigate(s_playerIndex, player_max)
	local enemy_FrTotal = (FrValue - self_AFrValue) * kFrigateCounterScale
	if (enemy_FrTotal < 0) then
	enemy_FrTotal = 0
	end
	local enemy_ChassisTotal = enemy_FiTotal + enemy_CoTotal + enemy_FrTotal
	if (enemy_ChassisTotal > 0) then
	if (enemy_FiTotal > 0) then
	local FiTotalPercent = enemy_FiTotal * 100 / enemy_ChassisTotal
	if (FiTotalPercent > 70) then
	AFiDemand = AFiDemand + 3
	elseif (FiTotalPercent > 35) then
	AFiDemand = AFiDemand + 1.5
	end
	end
	if (enemy_CoTotal > 0) then
	local CoTotalPercent = enemy_CoTotal * 100 / enemy_ChassisTotal
	if (CoTotalPercent > 70) then
	ACoDemand = ACoDemand + 3
	elseif (CoTotalPercent > 35) then
	ACoDemand = ACoDemand + 1.5
	end
	end
	if (enemy_FrTotal > 0) then
	local FrTotalPercent = enemy_FrTotal * 100 / enemy_ChassisTotal
	if (FrTotalPercent > 70) then
	AFrDemand = AFrDemand + 3
	elseif (FrTotalPercent > 35) then
	AFrDemand = AFrDemand + 1.5
	end
	end
	end
	if (AFiDemand > 0) then
	ShipDemandAddByClass(eAntiFighter, AFiDemand)
	end
	if (ACoDemand > 0) then
	ShipDemandAddByClass(eAntiCorvette, ACoDemand)
	end
	if (AFrDemand > 0) then
	ShipDemandAddByClass(eAntiFrigate, AFrDemand)
	end
	aitrace("AChDmd: AFi:"..AFiDemand.." ACo:"..ACoDemand.." AFr:"..AFrDemand)
end

function DetermineChassisDemand(enemyIndex)
	local FiDemand = 0
	local CoDemand = 0
	local FrDemand = 0
	local AFiValue = PlayersMilitary_AntiFighter(enemyIndex, player_max)
	local ACoValue = PlayersMilitary_AntiCorvette(enemyIndex, player_max)
	local AFrValue = PlayersMilitary_AntiFrigate(enemyIndex, player_max)
	local ATotal = AFiValue + ACoValue + AFrValue
	if (ATotal <= 0) then
	return
	end
	if (AFiValue > 5) then
	local AFiPercent = AFiValue * 100 / ATotal
	if (AFiPercent > 70) then
	FiDemand = FiDemand - 3
	elseif (AFiPercent > 35) then
	FiDemand = FiDemand - 1.5
	end
	end
	if (ACoValue > 5) then
	local ACoPercent = ACoValue * 100 / ATotal
	if (ACoPercent > 70) then
	CoDemand = CoDemand - 2
	elseif (ACoPercent > 35) then
	CoDemand = CoDemand - 1
	end
	end
	if (AFrValue > 5) then
	local AFrPercent = AFrValue * 100 / ATotal
	if (AFrPercent > 70) then
	FrDemand = FrDemand - 1.5
	elseif (AFrPercent > 35) then
	FrDemand = FrDemand - 0.5
	end
	end
	ShipDemandAddByClass(eFighter, FiDemand)
	ShipDemandAddByClass(eCorvette, CoDemand)
	ShipDemandAddByClass(eFrigate, FrDemand)
	aitrace("ChDmd: Fi:"..FiDemand.." Co:"..CoDemand.." Fr:"..FrDemand)
end

function DetermineDemandWithNoCounterInfo()
	if (s_militaryPop < 5) then
	aitrace("Dmd:Rand:"..sg_randFavorShipType)
	if (s_race == Race_Hiigaran) then
	if (sg_randFavorShipType < 55) then
	ShipDemandAddByClass(eFighter, 1)
	elseif (sg_randFavorShipType < 85) then
	ShipDemandAddByClass(eCorvette, 1)
	elseif (g_LOD < 2 and sg_randFavorShipType < 95) then
	ShipDemandAddByClass(eFrigate, 1)
	else
	ShipDemandAdd(kDestroyer, 1)
	end
	else
	if (sg_randFavorShipType < 45) then
	ShipDemandAddByClass(eFighter, 1)
	elseif (sg_randFavorShipType < 75) then
	ShipDemandAddByClass(eCorvette, 1)
	else
	ShipDemandAddByClass(eFrigate, 1)
	end
	end
	else
	aitrace("Dmd:Asking for AntiFrigates")
	ShipDemandAddByClass(eAntiFrigate, 1.5)
	end
end

function DetermineCounterDemand()
	if (s_enemyIndex ~= -1) then
	local enemyMilitaryCount = PlayersMilitaryPopulation(s_enemyIndex, player_max)
	if (enemyMilitaryCount >= 3) then
	DetermineChassisDemand(s_enemyIndex)
	DetermineAntiChassisDemand(s_enemyIndex)
	return
	end
	end
	DetermineDemandWithNoCounterInfo();
end

function DetermineSpecialDemand()
	if (ShipDemandGet(kInterceptor) > 0 and NumSubSystems(FIGHTERPRODUCTION) > 0 and NumSquadrons(kInterceptor) < 3 and s_militaryPop < 10) then
	ShipDemandAdd(kInterceptor, 0.5)
	end
	if (s_selfTotalValue > 120) then
	local additionalFrigDemand = 0.5
	if (s_race == Race_Hiigaran) then
	local advresearchcount = NumSubSystems(ADVANCEDRESEARCH) + NumSubSystemsQ(ADVANCEDRESEARCH)
	if (advresearchcount > 0) then
	additionalFrigDemand = additionalFrigDemand + 0.25
	end
	end
	ShipDemandAddByClass(eFrigate, additionalFrigDemand)
	ShipDemandAddByClass(eFighter, -0.5)
	end
	local numSpecial = numQueueOfClass(eCapture) + numQueueOfClass(eShield)
	local numFrigates = numQueueOfClass(eFrigate)
	if (numFrigates == 0 or numSpecial / numFrigates > 0.4) then
	ShipDemandAddByClass(eCapture, -10)
	ShipDemandAddByClass(eShield, -10)
	else
	if (s_militaryPop < 5) then
	ShipDemandAddByClass(eCapture, -4)
	ShipDemandAddByClass(eShield, -4.5)
	elseif (s_militaryPop < 10) then
	ShipDemandAddByClass(eCapture, -2)
	ShipDemandAddByClass(eShield, -2.5)
	elseif (s_militaryPop < 15) then
	ShipDemandAddByClass(eCapture, -1)
	ShipDemandAddByClass(eShield, -1.5)
	elseif (s_militaryPop > 30) then
	ShipDemandAddByClass(eCapture, 1)
	ShipDemandAddByClass(eShield, 1)
	end
	end
	if (s_race == Race_Hiigaran) then
	local torpedoDemand = -0.5
	if (IsResearchDone(IMPROVEDTORPEDO) == 1 or s_militaryStrength > 40 or GetRU() > 2500) then
	torpedoDemand = 0
	end
	ShipDemandAdd(HGN_TORPEDOFRIGATE, torpedoDemand)
	end
	local numRUs = GetRU()
	if ((GetNumCollecting() > 9 or numRUs > 1500) and s_militaryPop > 8 and UnderAttackThreat() < -75) then
	ShipDemandAdd(kBattleCruiser, 0.75)
	ShipDemandAdd(kDestroyer, 0.25)
	if (IsResearchDone(BATTLECRUISERIONWEAPONS) == 1) then
	ShipDemandAdd(kBattleCruiser, 0.5)
	end
	end
	local numEnemyBattleCruisers = PlayersUnitTypeCount(player_enemy, player_total, eBattleCruiser)
	if (numEnemyBattleCruisers > 0) then
	local ssKillaDemand = numEnemyBattleCruisers / 2
	if (s_enemyIndex ~= -1) then
	local targetEnemyCruisers = PlayersUnitTypeCount(s_enemyIndex, player_max, eBattleCruiser)
	if (targetEnemyCruisers > 0) then
	ssKillaDemand = ssKillaDemand + targetEnemyCruisers
	end
	end
	ShipDemandAddByClass(eSubSystemAttackers, ssKillaDemand)
	end
	local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)
	if (numShipyards == 0 and UnderAttackThreat() < -75) then
	local bcDemand = ShipDemandGet(kBattleCruiser)
	if (bcDemand >= 0.5) then
	ShipDemandAdd(kShipYard, bcDemand - 0.5)
	end
	end
	if (s_militaryStrength > 25 * sg_moreEnemies) then
	ShipDemandAddByClass(ePlatform, -2)
	end
end

function CalculateMilitaryValueGoal(militaryTable, percentOfEnemy)
	local curTime = gameTime()
	local minMilitaryValue = 0
	if (s_enemyTotalValue * percentOfEnemy > minMilitaryValue) then
	minMilitaryValue = s_enemyTotalValue * percentOfEnemy
	end
	for k, v in militaryTable do
	if (curTime < v[3]) then
	if (minMilitaryValue < v[1]) then
	minMilitaryValue = v[1]
	end
	if (minMilitaryValue > v[2]) then
	minMilitaryValue = v[2]
	end
	break
	end
	end
	return minMilitaryValue
end

function CpuBuild_DefaultShipDemandRules_Easy()
	local valueTable = {
	{80, 135, 8 * 60},
	{120, 180, 15 * 60},
	{160, 230, 20 * 60},
	{220, 300, 30 * 60},
	{270, 370, 45 * 60},
	{350, 500, 60 * 60},
	{500, 1000, 10000 * 60},}
	local minMilitaryValue = CalculateMilitaryValueGoal(valueTable, 0.7)
	aitrace("Aim:"..minMilitaryValue.." CurMil:"..s_selfTotalValue.." Enm:"..s_enemyTotalValue)
	if (s_selfTotalValue < minMilitaryValue) then
	DetermineClassDemand();
	DetermineCounterDemand();
	DetermineSpecialDemand();
	end
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
end

function CpuBuild_DefaultShipDemandRules_Med()
	local valueTable = {
	{120, 200, 8 * 60},
	{160, 250, 15 * 60},
	{220, 320, 20 * 60},
	{280, 400, 30 * 60},
	{320, 500, 45 * 60},
	{500, 700, 60 * 60},
	{700, 1200, 10000 * 60},}
	local minMilitaryValue = CalculateMilitaryValueGoal(valueTable, 0.85)
	aitrace("Aim:"..minMilitaryValue.." CurMil:"..s_selfTotalValue.." Enm:"..s_enemyTotalValue)
	if (s_selfTotalValue < minMilitaryValue) then
	DetermineClassDemand();
	DetermineCounterDemand();
	DetermineSpecialDemand();
	end
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
end

function CpuBuild_DefaultShipDemandRules_Hard()
	DetermineClassDemand();
	DetermineCounterDemand();
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
	DetermineSpecialDemand();
end

function CpuBuild_RemoveBuildItems()
	RemoveStalledBuildItems()
end

function CpuBuild_Process()
	ShipDemandClear()
	CpuBuild_RemoveBuildItems()
	if (Override_ShipDemand) then
	Override_ShipDemand()
	else
	CpuBuild_DefaultShipDemandRules()
	end
	if (sg_resourceDemand > 0 or sg_militaryDemand <= 0) then
	if (DoResourceBuild() == 1) then
	sg_resourceDemand = 1 - sg_militaryToBuildPerCollector
	return 1
	end
	end
	if (sg_militaryDemand > 0) then
	aitrace("**DoMilitaryBuild")
	if (DoMilitaryBuild() == 1) then
	if (sg_resourceDemand <= 0) then
	sg_resourceDemand = sg_resourceDemand + 1
	end
	return 1
	end
	end
	return 0
end

function DoMilitaryBuild()
	local ssDemand = sg_subSystemDemand + sg_subSystemOverflowDemand + (Rand(3) - 1)
	local shipId = FindHighDemandShip()
	local highestPriority = HighestPriorityShip()
	if (UnderAttackThreat() > -5 and shipId > 0 and highestPriority >= 0.5) then
	ssDemand = 0
	aitrace("Subsys demand reduced because we are under attack")
	end
	if (sg_shipDemand > ssDemand) then
	if (shipId > 0) then
	Build(shipId)
	sg_subSystemOverflowDemand = sg_subSystemOverflowDemand + 1
	return 1
	end
	end
	if (sg_dosubsystems == 1 and CpuBuildSS_DoBuildSubSystem() == 1) then
	return 1
	end
	return 0
end

function DetermineScoutDemand()
	local curGameTime = gameTime()
	if (UnderAttackThreat() < -10 and s_militaryPop > 0 and curGameTime > sg_randScoutStartBuildTime) then
	local numEnemies = PlayersAlive(player_enemy)
	local shipCount = numQueueOfClass(eScout)
	local numScoutsDemanded = 1
	if (numEnemies >= 2) then
	numScoutsDemanded = 2
	end
	if (numEnemies > 2 and s_militaryPop > 7) then
	numScoutsDemanded = 2 + ((s_militaryPop - 7) / 10)
	end
	if (shipCount < numScoutsDemanded) then
	ShipDemandAddByClass(eScout, 3.5)
	local scoutRand = Rand(100)
	if (scoutRand > 30) then
	ShipDemandAdd(kScout, 1.5)
	end
	sg_randScoutStartBuildTime = curGameTime + 50
	end
	end
end

function DetermineBuilderClassDemand()
	local numBuilders = numQueueOfClass(eBuilder)
	local numActiveBuilders = numActiveOfClass(s_playerIndex, eBuilder)
	if (numBuilders > numActiveBuilders) then
	ShipDemandAddByClass(eBuilder, -10);
	return
	end
	if (g_LOD == 0 and numBuilders > 3) then
	ShipDemandAddByClass(eBuilder, -10);
	return
	elseif (g_LOD == 1 and numBuilders > 4) then
	ShipDemandAddByClass(eBuilder, -10);
	return
	end
	if (s_militaryPop < 5 or (UnderAttack() == 1 and UnderAttackThreat() > -75)) then
	ShipDemandAddByClass(eBuilder, -10);
	return
	end
	local numRUs = GetRU()
	if (GetNumCollecting() < 7 and numRUs < 15000) then
	return
	end
	local numRUToBuildTable = {1000, 2000, 3500, 6500, 10000, 15000}
	if (numBuilders > 5) then
	numBuilders = 5
	end
	local RUsNeededToBuildBuilder = numRUToBuildTable[numBuilders + 1]
	if (s_race == Race_Vaygr) then
	RUsNeededToBuildBuilder = RUsNeededToBuildBuilder - 500
	end
	local dif = numRUs - RUsNeededToBuildBuilder
	if (dif > 0) then
	local ruPerShip = 2000
	if (s_militaryStrength > 30) then
	ruPerShip = 1000
	end
	local bonusDemand = (1 + (dif / ruPerShip))
	ShipDemandAddByClass(eBuilder, bonusDemand);
	end
	if (dif < -2000) then
	local penaltyDemand = dif / 2000
	ShipDemandAddByClass(eBuilder, penaltyDemand);
	end
	local neededMilitaryValue = 30 + (numBuilders - 1) * 60
	local militaryDifDemand = (s_selfTotalValue - neededMilitaryValue) / 30
	if (militaryDifDemand < 0) then
	ShipDemandAddByClass(eBuilder, militaryDifDemand);
	end
	return 0
end
