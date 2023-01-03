-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

Resource = {
	speechIdleWaitTime = 45,
	speechWaitTime = 20,
	similarDistance = 1800,
	initialExtraResourcesDistance = 4000,
	MaxDistancetoNewRU = 6000,
	earlyDockingMinCapacity = 0.5,
	earlyDockingFactor = 0.2,
	earlyDockingMinDistance = 600,
	flyingToResourceGoalTolerance = 50,
	flyingUpFromResourceGoalTolerance = 18,
	pointAboveResourceDistance = 50,
	startGettingInPositionDistanceFromResource = 350,
	StartFadeResources = 100}

DustCloud = {
	maxCharge = 5000,
	chargedPercentage = 0.4,
	damageToChargeFactor = 1,
	dissipationTime = 300,
	jumpRadiusMultiplier = 1.5,
	progressLightningChargeDifference = 200,
	chargedColour = {0.5, 0.74, 0.964, 1},
	chargedEmissiveColour = {0.5, 0.7, 0.9, 1},
	sensorsOutlineColour = {1, 0.3, 0.44, 0.16},
	chargedEmissiveFalloffTime = 0.4,
	timeBetweenLightningMin = 3,
	timeBetweenLightningMax = 5,
	timeBetweenChargedLightningMin = 1,
	timeBetweenChargedLightningMax = 3,
	maxSpinSpeed = 0.05,
	wobbleFrequency = 3,
	wobbleAmplitude = 20,
	radiusScale = 0.8}

Nebula = {
	radiusScale = 0.7}

Formation = {
	VelocityMultiplier = 0.7,
	TurnVelocityMultiplier = 0.9,
	RecalcPathTime = 10,
	PathFollowRadius = 50}

	ShipController = {GoalInfluence = 0.6,
	zRotationAccelerationMultiplier = 2,
	flightManeuverRotationBoost = 2,
	accelerationPow = 2,
	glancingBounceFactor = 0.6}

Ship = {
	battleTimeOutTime = 10,
	sensorsHiddenTimeOutTime = 1,
	radiationTimeOutTime = 1,
	chargedDustCloudTimeOutTime = 1,
	salvageSpawnPercentage = 0.7,
	subSystemMouseEnterSound = "SFX_ButtonEnter",
	subSystemMouseClickSound = "SFX_ButtonClick"}

Docking = {
	FlyBehindQueueDistance = 0,
	QueueSpacingDirection = {0, 0.707, -0.707},
	QueueHeightDirection = {-1, 0, 0},
	dockQueueSelectionQueueMultiplier = 600,
	dockQueueSelectionOccupiedMultiplier = 600,
	approachDistanceMultiplier = 3,
	minDockingTime = 0.6,
	dockingDistanceBandSize = 1050,
	timeForReChoosingDockShip = 2,
	timeForLatchInterpolation = 2}

Launching = {
	familyDontAvoidOnLaunch = "SmallRock"}

Parade = {
	ParadeDefaultGrowthSpacing = 300,
	rallyPointMinDistance = 2500}

AdvRigidBody = {
	SpaceFriction = 0.2}

ResearchData = {
	ResearchShipExponent = 0.5}

BuildData = {
	retireRefundRatio = 0.8,
	buildCancelRefundRatio = 1,
	buildMaxCircleSize = 0.1,
	buildSlowDown = 0.8}

Avoidance = {
	extraAvoidanceDistance = 1,
	formationPathfindRadiusMultiplier = 1.1,
	formationPathfindRadiusAddition = 50,
	capsuleLookAheadTime = 3,
	shipPathfindLookAheadTime = 1,
	extraShipAvoidanceDistance = 20,
	avoidingForALongTimeTurns = 10,
	familyAvoidanceBoxPriority = "SmallRock"}

OrderData = {
	maxDistanceFromGoal = 90}

WeaponFire = {
	FriendlyFireRatio = 0}

HyperSpace = {
	costPerMetre = 0.02,
	minSpeedForHyperspace = 5}

SensorPing = {
	cost = 1000}

Capture = {
	startLatchCommandDistance = 800,
	zeroHealthMultiplier = 8,
	lowShipsPerShipMultiplier = 0.1,
	highShipsPerShipMultiplier = 0.05,
	highShips = 8,
	minModifier = 0.1,
	maxModifier = 4,
	immobilisedCaptureProgress = 0.5,
	disableTime = 120}

RepairInfo = {
	timeToWaitAfterLastDamageBeforeUnlatching = 5,
	slowDownFactor = 0.7}

EngineTrailInfo = {
	BaseToTrailTime0 = 0,
	BaseToTrailTime1 = 0.0078125,
	BaseToTrailTime2 = 0.1,
	BaseToTrailTime3 = 1,
	BaseToTrailFactors0 = {0, 0, 1},
	BaseToTrailFactors1 = {0, 1.1, 1.2},
	BaseToTrailFactors2 = {0, 0.4, 1.2},
	BaseToTrailFactors3 = {0, 0, 1},
	TrailTextureWidth = 128,
	NearFadeDistance = 1000,
	FarFadeDistance = 2750,
	FarFadeValue = 0.5,
	TotalFadeStartDistance = 9000,
	TotalFadeEndDistance = 16000,
	TrailSaturationLimit = 1,
	BurnSaturationLimit = 0.2,
	TrailColourLuminanceMin = 0.4,
	BlackLimit = 0.1,
	BlackTrailHue = 0,
	BlackTrailSat = 1,
	BlackTrailLum = 0.5,
	OrphanFadeTime = 3,
	UseRefTexture = 1,
	UseHueShift = 0,
	RefTextureColour = {0.365, 0.553, 0.667, 1}}

CombatInfo = {
	numberOfSecondsForDamageAssesment = 3,
	heavyDamageFraction = 0.3,
	damagedFraction = 0.2,
	damagedFractionSubsystem = 0.4,
	criticallyDamagedFraction = 0.05,
	battleTrackerReductionFraction = 0.99,
	maxWeaponOffsetTime = 0.6,
	numberOfBlockedShotsBeforeMove = 4,
	shieldDamageTimeout = 6,
	priorityDistanceBandSize = 5000,
	distanceBandSize = 800,
	attackerBandSize = 8}

UnitCapsInfo = {
	minUnitCaps = 0}

AutoFormationInfo = {
	paddingX = 200,
	paddingY = 200,
	paddingZ = 200}

LatchInfo = {
	initialOffsetFromLatchPoint = 50,
	flyingToLatchPointTolerance = 70,
	flyingAboveLatchPointDistance = 90,
	tooFarFromPointSqr = 400}

StrikeGroupInfo = {
	minSpeedFraction = 0.4,
	maxSpeedFraction = 0.98,
	maxSpeedWhenCloserThan = 200,
	minSpeedWhenFurtherThan = 700,
	strikeGroupSpacing = 1.8,
	mirrorAngle = 45}

TimingInfo = {
	modifierTiming = 10,
	combatScanForRetaliationTargetsTiming = 20,
	idleScanningForRetaliationTargetsTiming = 30,
	guardScanningForRetaliationTargetsTiming = 20,
	moveScanningForRetaliationTargetsTiming = 30,
	inactiveIdleTime = 30}

MineLayingInfo = {
	maxFieldRadius = 5000,
	distanceMultiplierForSphere = 0.001,
	mineSpacing = 1000}

CollisionInfo = {
	kamikazeDamageMultiplier = 7,
	normalCollisionDamageMultiplier = 0}

FXInfo = {
	windStrength = {15, 15, 0},
	fadePointDistance = 4000,
	maxPointDistance = 8000,
	beamFadePercentage = 0.75}

AutoLODInfo = {
	DesiredFPS = 10,
	MinScaleFactor = 1,
	MaxScaleFactor = 50,
	ScaleDelta = 0.08,
	IncreaseDelta = 0.0033,
	DecreaseDelta = 0.005,
	RenderTimeDelta = 0.0033}

MultiplierCap = {
	default = 1.5,
	WeaponDamage = 1.4,
	WeaponAccuracy = 1.4,
	CloakDetection = 4,
	VisualRange = 4,
	PrimarySensorsRange = 2,
	SecondarySensorsRange = 2}
