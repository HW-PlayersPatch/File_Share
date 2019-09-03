
-- All tuning variables that deal with resourcing
Resource = {
	
	-- amount of time (seconds) a collector waits (under an Idle or Parade status) before invoking "Resource Collector awaiting orders."
	speechIdleWaitTime = 45,
	
	-- amount of time (seconds) a collector waits in queue (for a resource) before invoking speech "full, expect delays"
	speechWaitTime = 20,

	-- The size of the distance bands within which a resource is considered equidistant from the resourcer.
	similarDistance = 1800,
	
	-- The distance to scan for extra resources at the start of the command, these are added to the player's
	-- target choice, should roughy be the diameter of a resource pocket
	initialExtraResourcesDistance = 4000,
	
	-- Maximum distance to look for resources
	MaxDistancetoNewRU = 6000,
	
	-- Minimum fraction of capacity needed before a resourcer will consider docking instead of going to the next ru (0-1).
	earlyDockingMinCapacity = 0.5,
	
	-- Will only dock early if the distance to the drop off ship is less than this * the distance to the resource.
	earlyDockingFactor = 0.2,
	
	-- Will only consider docking early if the next resource if further than this.
	earlyDockingMinDistance = 600,
	
	
	-- the movement when collecting from a rock goes like this:
	-- - fly to the resource
	-- - when within startGettingInPositionDistanceFromResource metres from the surface of
	--   the resource fly to a point above a harvesting spot on the resource
	-- - once at the point above out harvest spot fly down to the spot and latch
	-- - when done resourcing fly straight up and then fly to a dock ship
	
	-- ship will stop flying to the point above the resource when it gets within this many metres of the goal
	flyingToResourceGoalTolerance = 50,
	
	-- ship will stop flying up from the resource when it gets within this many metres of the goal
	flyingUpFromResourceGoalTolerance = 18,
	
	-- the point above the resource which the collector flies to is this many metres from the surface
	pointAboveResourceDistance = 50,
	
	-- ship will fly to within this many metres of the surface of the resource beofre trying to get in position
	-- if you are getting collision foul ups then increasing this could help
	startGettingInPositionDistanceFromResource = 350,
	
	-- When the resource starts fading to the 'depleted' texture: (amount of resources left)
	StartFadeResources	= 100,
}


-- All tuning variables that deal with dustclouds
DustCloud = {
	maxCharge				= 5000,		-- Maximum charge of electricity
	chargedPercentage			= 0.4,		-- This is a percentage of charge that tells us when the dustcloud is considered 'charged'.	
	damageToChargeFactor			= 1.0,		-- If this factor is 1, it means that 100% of the damage will be converted into charge.
	dissipationTime				= 300,		-- Time it takes for a dustcloud to become neutral if it's totally charged
	jumpRadiusMultiplier			= 1.5,		-- Radius multiplier for the radius around the dustcloud within which the charge of one cloud jumps to another. (now 1.5 times the dustcloud radius)
	progressLightningChargeDifference	= 200.0,	-- This is the charge difference that needs to be there for a lightning bolt to progress
	chargedColour                    	= {0.5, 0.74, 0.964, 1.0},	-- The colour of charged dustclouds
	chargedEmissiveColour			= {0.5, 0.7, 0.9, 1.0},		-- The emissive colour of charged dustclouds
	sensorsOutlineColour			= {0.75, 0.37, 0.20, 2.0},	-- the colour of the outline in the SM, also applies to Nebulii
	chargedEmissiveFalloffTime		= 0.4,		-- Time in seconds for the emissive factor to fall off completely
	timeBetweenLightningMin			= 3.0,		-- Number of seconds between two lightning flashes from one cloud to another (influences the speed at which the cloud spreads the charge!)
	timeBetweenLightningMax			= 5.0,		-- Number of seconds between two lightning flashes from one cloud to another (influences the speed at which the cloud spreads the charge!)
	timeBetweenChargedLightningMin		= 1.0,		-- Number of seconds between two lightning flashes for dustclouds to show they are charged
	timeBetweenChargedLightningMax		= 3.0,		-- Number of seconds between two lightning flashes for dustclouds to show they are charged

	maxSpinSpeed                        	= 0.05,         -- The maximum spin rate of a dustcloud sprite
	wobbleFrequency                     	= 3.0,          -- The frequency of the sin wave wobble
	wobbleAmplitude                     	= 20.0,         -- The amplitide of the sin wave wobble
	radiusScale				= 0.8,		-- radius modifier to prevent dustclouds acting in an area that looks like it's outside the dustcloud
}


-- All tuning variables that deal with nebula's
Nebula = {
	radiusScale				= 0.7,		-- radius modifier to prevent nebulas acting in an area that looks like it's outside the nebula
}


-- All tuning variables that deal with formations
Formation = {
	VelocityMultiplier				= 0.7,				-- fraction of the maximum velocity of the slowest ship
	TurnVelocityMultiplier				= 0.9,				-- fraction of the maximum turn velocity of the slowest ship
	RecalcPathTime					= 10.0,				-- Time between two recalculations of a path. So after 10.0 seconds the path will be updated
	PathFollowRadius				= 50.0,				-- Path follow Radius
}

ShipController = {
	GoalInfluence					= 0.6,				-- factor that determines the amount of influence the speed of the goal has on the speed of the ship (between 0 and 1)
	zRotationAccelerationMultiplier = 1.75,				-- the Z rotation acceleration is higher than the other accelerations in ships. We don't want an extra shiptuning variable for this. All ships have a higher z rotation acceleration
	flightManeuverRotationBoost		= 1.75,				-- in flightmaneuvers the ships get a higher rotation agility. The maximum rotation is not changed, instead, the way they steer is 'snappier'..
	accelerationPow					= 1.75,				-- Used in the acceleration arc. The amount of forward trust = factor * maxamount. And factor = pow(factor[0 - 1], accelerationPow)
	glancingBounceFactor				= 0.6,			-- Glancing bounce of the ships
}

Ship = {
	battleTimeOutTime				= 10.0,				-- Don't tweak this if you don't know what you are doing. takes 10 seconds to say that you're not in a battle anymore, while you are in battle you can't be cloaked, you are also visible always to the player you are firing at
	sensorsHiddenTimeOutTime		= 1.0,				-- Don't tweak this if you don't know what you are doing. timeout for sensors detection to prevent jittering
	radiationTimeOutTime				= 1.0,			-- Don't tweak this if you don't know what you are doing. timeout for radiation to prevent jittering
	chargedDustCloudTimeOutTime		= 1.0,
	salvageSpawnPercentage			= 0.75,				-- Percentage of the new price when a ship blows up.
	subSystemMouseEnterSound		= "SFX_ButtonEnter", 		-- sound filename defined in UISound.lua
	subSystemMouseClickSound		= "SFX_ButtonClick", 		-- sound filename defined in UISound.lua
}

Docking = {
	FlyBehindQueueDistance  = 0,						-- The distance the squadron will fly behind the queue before changing formation to the dock formation, and inserting itself into the dockqueue.
	QueueSpacingDirection	= {0.0, 0.707, -0.707},		-- Direction of the Spacing of the queue
    QueueHeightDirection	= {-1.0, 0.0, 0.0},			-- Direction of the different docking classes
	dockQueueSelectionQueueMultiplier		= 600,		-- When a ship is going in for docking, a score is prepared for all suitable paths. The path with the lowest score is the path that's chosen. This is the formula:
    dockQueueSelectionOccupiedMultiplier	= 600,		-- Score = Distance + (nrShipsInQueue * dockQueueSelectionQueueMultiplier) + (pathOccupied * dockQueueSelectionOccupiedMultiplier)
    approachDistanceMultiplier				= 3.0,		-- The approach distance is multiplied by this to try to smooth out ships bending off in case of the resourcecontroller
    minDockingTime							= 1.0,		-- minimum time a ship will be docked for

    -- when looking for a ship to dock with we score them based on how many distance bands away
    -- they are and how busy they are, the bigger this number is the more weight will be given
    -- to "busyness"
    dockingDistanceBandSize                 = 1050,
    -- interval in seconds between attempts to find a better dock target when travelling
    -- to the dock ship, only does this if not told to dock with a specific ship
    timeForReChoosingDockShip               = 2.0,

    -- Time it takes to interpolate the ship to the right position when it is latching. The ship will fly down to the latchpoint,
    -- and then interpolate to the final position (where it would 'snap' before)
    timeForLatchInterpolation			= 3.0,
}

Launching = {
	familyDontAvoidOnLaunch		= "SmallRock",
}

Parade = {
	-- Default growth spacing between squadrons.
	ParadeDefaultGrowthSpacing = 300.0,
    -- if the ship gets closer than this to its rally point then the point is reset to the ship
    rallyPointMinDistance = 2500.0,
}

AdvRigidBody = {
	-- the amount of space friction (0 is none, 1 is a LOT of friction. Usualy should be around 0.2
	SpaceFriction	= 0.2	,
}

ResearchData= {
	-- Power to which the number of research sub systems should be raised.
	ResearchShipExponent = 0.5,
}

BuildData = {
	retireRefundRatio			=   .8,
	-- Fraction of original cost refunded when cancelling a build job half way complete.
	buildCancelRefundRatio		=   1.00,
	buildMaxCircleSize			=	0.1,
	buildSlowDown				=	0.8,
}

Avoidance = {
	extraAvoidanceDistance			= 1.0,				-- Formation Pathfinder: The extra distance used when finding paths around other ships.
	formationPathfindRadiusMultiplier		= 1.05,				-- Formation Pathfinder: This is how many times the radius of the ship is used to find a path around.
	formationPathfindRadiusAddition		= 40.0,				-- Formation Pathfinder: Additional radius used in formation path finding
	capsuleLookAheadTime				= 3.0,				-- How many seconds do the capsules need to extend to the front?
	shipPathfindLookAheadTime			= 1.0,				-- How many seconds do the avoidance boxes need to extend in the direction of the velocity?
	extraShipAvoidanceDistance			= 20.0,				-- The extra distance used when finding paths around other ships.
	avoidingForALongTimeTurns           	= 10,                 -- Number of turns spent avoiding before it counts as a long time, 1 turn is 0.1 seconds
	familyAvoidanceBoxPriority			= "SmallRock",
}

OrderData = {
	-- when many squadrons are given a move order this is the maximum displacement from the goal
	maxDistanceFromGoal			= 90.0,
}


WeaponFire = {
	-- factor that the damage gets multiplied with for friendly ships. Should be between 0 and 1. So 0 means there is no friendly fire, 1 means there is full friendly fire
	FriendlyFireRatio			= 0.5,
}

HyperSpace = {
	-- ru cost of hyperspace (max cost is stored per ship type)
	costPerMetre				= 0.02,
	minSpeedForHyperspace		= 5.0,
}

SensorPing = {
	-- ru cost of sensor ping
	cost					= 1000.0,
}

Capture = {
    -- once we get closer than this plus the target radius we move on to trying to latch
    startLatchCommandDistance   = 800.0,
	-- at zero health the progress per turn is multiplied by this, scales 1.0 at full health to this
    zeroHealthMultiplier		= 8.0,
    -- for every ship after 1 and up to 'highShips' add this to a multiplier for ships capturing the target
    lowShipsPerShipMultiplier	= 0.1,
    -- for every ship after 'highShips' add this to a multiplier for ships capturing the target
    highShipsPerShipMultiplier	= 0.05,
    -- modifier changes after this many ships
    highShips					= 8,
    -- modify base progress by no less than this
    minModifier 				= 0.1,
    -- modify base progress by no more than this
    maxModifier 				= 4.0,
    -- once the capture attempt has passed this progress level the target can no longer move
    immobilisedCaptureProgress	= 0.5,
    -- if the target can't be captured due to unit caps it is disabled for this many seconds
    disableTime					= 120.0,
}

RepairInfo = {
	-- when a repair ship is latched to a target it will wait this many seconds after the repairs are finished before unlatching
	timeToWaitAfterLastDamageBeforeUnlatching				= 5.0,
	-- when ships are trying to repair the target is slowed down to this amount of it's max speed
	slowDownFactor                                          = 0.95,
}

EngineTrailInfo = {

    -- specifies the parametric times of the colour keyframes.  The first index must be 0 and the last index must be 1
    BaseToTrailTime0            = 0.0,
    BaseToTrailTime1            = 0.0078125,
    BaseToTrailTime2            = 0.1,
    BaseToTrailTime3            = 1.0,

    -- Factors are { H, L, S }
    -- H is added to the teamcolour H.  Clamped to 0..1
    -- L & S are multiplied by the teamcolour L & S values.  Clamped to 0..1
    BaseToTrailFactors0         = { 0, 0.0,  1.0 },
    BaseToTrailFactors1         = { 0, 1.1,  1.2 },
    BaseToTrailFactors2         = { 0, 0.4,  1.2 },
    BaseToTrailFactors3         = { 0, 0.0,  1.0 },

    TrailTextureWidth           	= 128,

    -- the distance at which trails start to fade
    NearFadeDistance            = 1000.0,

    -- the distance at which trails are fully faded
    FarFadeDistance             = 2750.0,

    -- the opacity of the trail when fully faded
    FarFadeValue                = 0.5,

    -- the distance at which the trail starts to fade to nothing
    TotalFadeStartDistance	= 9000.0,

    -- the distance at which the trail is totally gone
    TotalFadeEndDistance	= 16000.0,

    -- the maximum saturation a trail pixel will have
    TrailSaturationLimit		= 1.0,

    -- the maximum saturation the burn sprite will have (the lower, the more they burn up to white)
    BurnSaturationLimit		= 0.2,

    -- the minimum brightness of the trail colour.  So that no trails get so dark they're invisible.
    TrailColourLuminanceMin 	= 0.4,

    -- an enginetrail with less than this luminance is considered "black"
    BlackLimit			    = 0.1,

    -- the hue, sat, lum that "black" trails get shifted to
    BlackTrailHue			= 0.0,
    BlackTrailSat			= 1.0,
    BlackTrailLum			= 0.5,

    -- the number of seconds it takes dead trails to fade out
    OrphanFadeTime              = 3.0,

    -- if UseRefTexture is set, effect/trails/trailref.tga image will be used to calculate colourization gradients
    UseRefTexture		= 1,

    -- if UseHueShift is set, hue shifts of the refTexture relative to the RefTextureColour will be applied (currently produces some bad results)
    UseHueShift			= 0,

    -- if using the refTexture this colour specifies what the h,l,s shift values are relative to
    RefTextureColour		= { 0.365, 0.553, 0.667, 1.0 },
}

CombatInfo = {
	-- number of seconds to spend counting damage before assessing it
	numberOfSecondsForDamageAssesment = 3,
	-- amount of damage that needs to be taken in numberOfSimFramesForDamageAssesment to count as heavy damage
	heavyDamageFraction					= 0.3,
	-- once the ship gets below this fraction of its max health it is "damaged"
	damagedFraction						= 0.2,
	-- once a subsystem gets below this fraction of its max health it is "damaged"
	damagedFractionSubsystem				= 0.4,	
	-- once the ship gets below this fraction of its max health it is "critically damaged"
	criticallyDamagedFraction			= 0.05,
	-- each ship keeps track of how it is doing in battle (damage done - health lost),
	-- it is multiplied by this amount every 0.1 seconds to reduce the effect of old data
	battleTrackerReductionFraction		= 0.99,
    -- max weapon offset - the maximum time a weapon can be delayed by when it's not firing,
    -- basically this is the max time before the gun fires at a valid target when it's asked
    -- to, by offsetting the fire we make the weapon effects more pleasing to the artists
    -- the actual time chosen is a random amount between 0 and whatever is smaller out of
    -- this number and the fire time of the weapon
    maxWeaponOffsetTime                 = 0.6,
    -- number of times a weapon has to try to fire before the ship will move to clear the obstruction
    numberOfBlockedShotsBeforeMove      = 5,
    -- how long a shield will register recent damage
    shieldDamageTimeout                 = 6,

	
	-- TARGET CHOICE:
	-- Targets are first compared using a combination of distance bands and attack priority.
	-- The larger the number the more likely ships are to choose a distant target with higher
	-- priority over a closer lowere priority target, this number sets the size of these distance
	-- bands.
	priorityDistanceBandSize			= 5000.0,
	-- Targets which are equal are then rated using a smaller distance band.
	distanceBandSize					= 800.0,
	-- Equal targets are then compared using the number of ships attacking them, the number
	-- is divided by this number to band the number of attackers.
	attackerBandSize					= 8,
	-- Equal targets are then compared by angle from the heading of the attacker, then by health,
	-- then if all of the above is equal one is randomly chosen.
}

UnitCapsInfo = {
	-- Minimal unit caps:
	minUnitCaps					= 0
}


AutoFormationInfo = {
	-- Padding between squadrons in all directions
	paddingX	= 220,
	paddingY	= 220,
	paddingZ	= 220,
}

LatchInfo = {
	-- latch ships will fly to this distance above the latch point before dropping down to latch
	initialOffsetFromLatchPoint	= 45,
	-- ship will stop within this many metres of the latch point of the latch target
	flyingToLatchPointTolerance = 16,
	-- ship will fly above latching targets by this distance..
	flyingAboveLatchPointDistance = 24,
    -- when the ship is flying down to the point it will start over if it gets more
    -- than this away from the target point
    tooFarFromPointSqr = 400,
}

StrikeGroupInfo = {
	-- the strike group core ship will move at this amount of its max speed when any
	-- of the strike group members are further than m_minSpeedWhenFurtherThan from
	-- their station
	minSpeedFraction	= 0.4,
	-- the strike group core ship will move at this amount of its max speed when all
	-- of the strike group members are closer than m_maxSpeedWhenCloserThan to their
	-- station
	maxSpeedFraction	= 0.98,
	-- if all strike group ships are closer than this then the core ship will fly at
	-- m_maxSpeedFraction of its speed
	maxSpeedWhenCloserThan	= 200,
	-- if any strike group ships are this far away from their station then the core
	-- ship will fly at m_minSpeedFraction of its speed
	minSpeedWhenFurtherThan	= 700,
	-- multiply this by the sum of the radii of two elements in a SG to get the space
	-- in metres between neighbouring elements
	strikeGroupSpacing	= 1.8,
	-- if the destination is less than this many degrees from behind the strike group
	-- lead then the strike group formation will mirror, prevents long turn around
	-- times
	mirrorAngle = 45,
    -- delay between batchlings being sent to the docking path
	batchlingDockDelay = 1.25,
}

-- tuneables for spreading out calculations
TimingInfo = {
	-- modifiers scan for new targets every this many updates (update is every 10th of a second)
	modifierTiming = 10,
	-- formations in a combat that is in retaliation will scan for extra targets every this many updates (update is every 10th of a second)
	combatScanForRetaliationTargetsTiming = 20,
    -- when a squad is idle or in parade it will scan for retaliation targets every this many updates
    idleScanningForRetaliationTargetsTiming = 30,
    -- guard command scanning
    guardScanningForRetaliationTargetsTiming = 20,
    -- move command scanning, this is used both for firing at ships we pass and for the attack move
    moveScanningForRetaliationTargetsTiming = 30,
	-- if you give a stop command to a retaliating squadron it will not retaliate for this many seconds
	inactiveIdleTime = 30.0,
	moveToHomeWaitTime = 1.0,
}

MineLayingInfo = {
	-- maximum radius for a minefield
	maxFieldRadius = 5000.0,
	-- there's a table of sphere position descriptions, multiply this by the sphere radius to
	-- get the table index, higher tables have more mine positions so increasing this number
	-- gives mine spheres with more mines
	distanceMultiplierForSphere = 0.001,
    mineSpacing = 1000.0,
}

CollisionInfo = {
	-- multiply this by each side of the collisions health to see what the other side takes as damage
	kamikazeDamageMultiplier		= 7,
	-- multiply this by each side of the collisions health to see what the other side takes as damage
	normalCollisionDamageMultiplier = 0,
	kamikazeArmourFamilyDamageMultiplier = {
		{
			"ResArmour",
			0.21,
		},
		{
			"Unarmoured",
			0.2,
		},
		{
			"Unarmoured_hw1",
			0.2,
		},
		{
			"LightArmour",
			0.2,
		},
		{
			"LightArmour_hw1",
			0.2,
		},
		{
			"MediumArmour",
			0.28,
		},
		{
			"HeavyArmour",
			0.25,
		},
		{
			"TurretArmour",
			1.0,
		},
	},
}

FXInfo = {
	-- set the direction and strength of the FXDyanmics wind
	windStrength		= { 15, 15, 0 },
	
	-- the distance at which FXRings drawn as points begin to fade
	fadePointDistance	= 4000,
	
	-- the distance at which FXRings drawn as points are totally fade and not drawn anymore
	maxPointDistance		= 8000,
	
	-- beams that miss their target, fade at this percentage of their distance
	beamFadePercentage 	= 0.75,
}

AutoLODInfo = {

	-- set the frames per second we want to maintain.  0 will disable.
	DesiredFPS			= 10,
	
	MinScaleFactor		= 1.0,
	MaxScaleFactor		= 50.0,
	ScaleDelta			= 0.08,
	IncreaseDelta		= 0.0033,
	DecreaseDelta		= 0.005,
	RenderTimeDelta		= 0.0033,	
}

-- Cap values for the temporary multipliers. default is used if no exception is specified.
-- This cap is the maximum multiplier applied by temporary effects like the fire control
-- tower which are worked out each turn. These effects are multiplied together so having
-- a number of command corvettes in an area provides a huge bonus. The numbers here specify
-- the maximum value to which the temporary modifier can be raised. The names for the
-- variables are the same as the names in HW2_MultipliersAndAbilitiesHowTo.doc
MultiplierCap = {
    default = 1.5,
    WeaponDamage = 1.2,
    WeaponAccuracy = 1.2,
    CloakDetection = 4.0,
    VisualRange = 4.0,
    PrimarySensorsRange = 2.0,
    SecondarySensorsRange = 2.0,
		HealthRegenerationRate = 4.0,
}
