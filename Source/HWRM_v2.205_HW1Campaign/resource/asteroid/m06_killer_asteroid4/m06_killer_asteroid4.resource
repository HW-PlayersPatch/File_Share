NewResourceTypeM06_Killer_Asteroid4 = StartAsteroidConfig()
NewResourceTypeM06_Killer_Asteroid4.displayedName="2510"
NewResourceTypeM06_Killer_Asteroid4.sobDescription="2511"
NewResourceTypeM06_Killer_Asteroid4.maxhealth=13500
NewResourceTypeM06_Killer_Asteroid4.regentime=0
NewResourceTypeM06_Killer_Asteroid4.nlips=0.000025
NewResourceTypeM06_Killer_Asteroid4.nlipsRange=150000
NewResourceTypeM06_Killer_Asteroid4.nlipsFar=0.0000025
NewResourceTypeM06_Killer_Asteroid4.nlipsFarRange=150000
NewResourceTypeM06_Killer_Asteroid4.SMRepresentation="HardDot"
NewResourceTypeM06_Killer_Asteroid4.meshRenderLimit=45000
NewResourceTypeM06_Killer_Asteroid4.dotRenderLimit=55000
NewResourceTypeM06_Killer_Asteroid4.visibleInSecondary=1
NewResourceTypeM06_Killer_Asteroid4.minLOD=0.25
NewResourceTypeM06_Killer_Asteroid4.upLOD=20000
NewResourceTypeM06_Killer_Asteroid4.downLOD=20015
NewResourceTypeM06_Killer_Asteroid4.minimumZoomFactor=0.68
NewResourceTypeM06_Killer_Asteroid4.selectionSizeMin=0
NewResourceTypeM06_Killer_Asteroid4.selectionSizeMax=0
NewResourceTypeM06_Killer_Asteroid4.selectionPriority=50
NewResourceTypeM06_Killer_Asteroid4.relativeMoveFactor=4
NewResourceTypeM06_Killer_Asteroid4.useEngagementRanges=0
NewResourceTypeM06_Killer_Asteroid4.pixelSize=4
NewResourceTypeM06_Killer_Asteroid4.pixelColour={1.0, 0.349, 0.199, 1.0}
NewResourceTypeM06_Killer_Asteroid4.pixelColourDepleted={0.5, 0.4, 0.3, 1.0}
NewResourceTypeM06_Killer_Asteroid4.resourceValue=0
NewResourceTypeM06_Killer_Asteroid4.blobRadius=0
NewResourceTypeM06_Killer_Asteroid4.maxVelocity=10000
NewResourceTypeM06_Killer_Asteroid4.maxAngularVelocity=0.15
NewResourceTypeM06_Killer_Asteroid4.linearFriction=0.5
NewResourceTypeM06_Killer_Asteroid4.angularFriction=0.5
NewResourceTypeM06_Killer_Asteroid4.mass=1000000
NewResourceTypeM06_Killer_Asteroid4.Ixx=100
NewResourceTypeM06_Killer_Asteroid4.Iyy=100
NewResourceTypeM06_Killer_Asteroid4.Izz=100
NewResourceTypeM06_Killer_Asteroid4.DockFamily="Resource"
NewResourceTypeM06_Killer_Asteroid4.AvoidanceFamily="SmallRock"
NewResourceTypeM06_Killer_Asteroid4.AttackFamily="Resource"
NewResourceTypeM06_Killer_Asteroid4.ArmourFamily="ResourceArmour"
NewResourceTypeM06_Killer_Asteroid4.CollisionFamily="Big"
NewResourceTypeM06_Killer_Asteroid4.DisplayFamily="Resource"
setCollisionDamageToModifier(NewResourceTypeM06_Killer_Asteroid4, "Ship", 2)
setCollisionDamageFromModifier(NewResourceTypeM06_Killer_Asteroid4, "Ship", 1)

SpawnAsteroidOnDeath(NewResourceTypeM06_Killer_Asteroid4, "Asteroid_5_piece01", 1, 0,0,0,0, -100,0,-50,0,  -5,0,-5,10,  -8,0,0,3)
SpawnAsteroidOnDeath(NewResourceTypeM06_Killer_Asteroid4, "Asteroid_5_piece02", 1, 0,0,0,0, 100,0,25,0,     5,0,5,10,  0,0,8,3)
--SpawnAsteroidOnDeath(NewResourceTypeM06_Killer_Asteroid4, "Asteroid_5_piece03", 1, 0,0,0,0, -80,0,30,0,   0,0,0,10,  -8,0,0,3)

resourceAttackMode(NewResourceTypeM06_Killer_Asteroid4, RegularAttack)
NewResourceTypeM06_Killer_Asteroid4.sobDieTime=2