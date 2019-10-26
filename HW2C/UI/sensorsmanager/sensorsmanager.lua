-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

smTwkBlinkTime = 0.3
smTwkZoomTime = 0.5
smTwkZoomMainView = 0.5
smTwkZoomOutDistance = 12000
smTwkMinZoomOutDistance = 10000
smTwkMaxZoomOutDistance = 45000
smTwkNearClipPlane = 4000
smTwkFarClipPlane = 200000
smTwkFocusCull = 10000
smTwkMaxMovementDistance = 60000
smTwkWidescreen = 1
smTwkBlinkTransitionTime = 0.07
smTwkBlinkOnFraction = 0.8
smTwkHighlightMaxAlpha = 0.3

friendlyPixelColour = {0, 1, 0, 1}
alliedPixelColour = {1, 1, 0, 1}
enemyPixelColour = {1, 0, 0, 1}
neutralPixelColour = {0.9, 0.9, 0.3, 1}
friendlyPixelSize = 3
alliedPixelSize = 3
enemyPixelSize = 3
missilePixelSize = 3
missilePixelColour = {1, 1, 0.199, 1}
miscPixelSize = 2
miscPixelColour = {1, 1, 1, 1}

worldPlaneColour = {0.64, 0.46, 0, 0.2}
worldLineColour = {0.64, 0.46, 0, 1}
worldPlaneToWorldBoundSize = 1

horizonToCameraZoom = 3
letterboxAspect = 1.5

smWorldplaneFlashOnTime = 0.25
smWorldplaneFlashOffTime = 0.25

SPI_WorldPlaneScale = 1
SPI_HorizonLineScale = 2
SPI_HorizonOrigin = 3
SPI_WorldPlaneColour = 4
SPI_WorldLineColour = 5

horizonRadius = 120000
horizonHeight = 0.07
horizonNumberScale = 0.07
horizonNumberAspect = 1.6

worldGraphics = {{scaleParam = SPI_WorldPlaneScale, colourParam = SPI_WorldLineColour, mesh = {colour = {0.64, 0.46, 0, 1}, lineWeight = 1, LODs = {1, "UI\\SensorsManager\\Meshes\\WorldPlaneWireframe.hod"},}, placement3D = {position = {0, 0, 0},
	scale = {1, 1, 1}, visibility = {0}, invisibility = {"SVF_FlashOff"},},}, {scaleParam = SPI_WorldPlaneScale, colourParam = SPI_WorldPlaneColour, mesh = {colour = {0.64, 0.46, 0, 0.2}, lineWeight = 1, LODs = {1, "UI\\SensorsManager\\Meshes\\DiskAbove.hod"},}, placement3D = {position = {0, 0, 0},
	scale = {1, 1, 1}, visibility = {"SVF_Above"}, invisibility = {"SVF_FlashOff"},},}, {scaleParam = SPI_WorldPlaneScale, colourParam = SPI_WorldLineColour, mesh = {colour = {1, 1, 1, 1}, texture = "data:UI\\SensorsManager\\Meshes\\CompassNumbers.tga", lineWeight = 1, LODs = {1, "UI\\SensorsManager\\Meshes\\CompassNumbersAbove.hod"},}, placement3D = {position = {0, 0, 0},
	scale = {1, 1, 1}, visibility = {"SVF_Above"}, invisibility = {"SVF_FlashOff"},},}, {scaleParam = SPI_WorldPlaneScale, colourParam = SPI_WorldLineColour, mesh = {colour = {1, 1, 1, 1}, texture = "data:UI\\SensorsManager\\Meshes\\CompassNumbers.tga", lineWeight = 1, LODs = {1, "UI\\SensorsManager\\Meshes\\CompassNumbersBelow.hod"},}, placement3D = {position = {0, 0, 0},
	scale = {1, 1, 1}, visibility = {"SVF_Below"}, invisibility = {"SVF_FlashOff"},},}, {scaleParam = SPI_WorldPlaneScale, colourParam = SPI_WorldPlaneColour, mesh = {colour = {0.64, 0.46, 0, 0.2}, lineWeight = 1, LODs = {1, "UI\\SensorsManager\\Meshes\\DiskBelow.hod"},}, placement3D = {position = {0, 0, 0},
	scale = {1, 1, 1}, visibility = {"SVF_Below"}, invisibility = {"SVF_FlashOff"},},}, {scaleParam = SPI_HorizonLineScale, colourParam = SPI_WorldLineColour, mesh = {colour = {0.64, 0.46, 0, 1}, lineWeight = 1, LODs = {1, "UI\\SensorsManager\\Meshes\\HorizonAbove.hod"},}, placement3D = {position = {0, 0, 0},
	scale = {1, 1, 1}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, colourParam = SPI_WorldLineColour, mesh = {colour = {0.64, 0.46, 0, 1}, lineWeight = 1, LODs = {1, "UI\\SensorsManager\\Meshes\\HorizonBelow.hod"},}, placement3D = {position = {0, 0, 0},
	scale = {1, 1, 1}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\000.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0, horizonHeight, -1},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\020.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.342, horizonHeight, -0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\040.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.6428, horizonHeight, -0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\060.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.866, horizonHeight, -0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\080.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.9848, horizonHeight, -0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\100.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.9848, horizonHeight, 0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\120.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.866, horizonHeight, 0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\140.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.6428, horizonHeight, 0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\160.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.342, horizonHeight, 0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\180.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0, horizonHeight, 1},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\200.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.342, horizonHeight, 0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\220.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.6428, horizonHeight, 0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\240.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.866, horizonHeight, 0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\260.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.9848, horizonHeight, 0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\280.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.9848, horizonHeight, -0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\300.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.866, horizonHeight, -0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\320.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.6428, horizonHeight, -0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\340.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.342, horizonHeight, -0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Above"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\000.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0, -horizonHeight, -1},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\020.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.342, -horizonHeight, -0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\040.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.6428, -horizonHeight, -0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\060.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.866, -horizonHeight, -0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\080.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.9848, -horizonHeight, -0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\100.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.9848, -horizonHeight, 0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\120.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.866, -horizonHeight, 0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\140.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.6428, -horizonHeight, 0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\160.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0.342, -horizonHeight, 0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\180.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {0, -horizonHeight, 1},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\200.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.342, -horizonHeight, 0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\220.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.6428, -horizonHeight, 0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\240.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.866, -horizonHeight, 0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\260.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.9848, -horizonHeight, 0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\280.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.9848, -horizonHeight, -0.1736},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\300.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.866, -horizonHeight, -0.5},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\320.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.6428, -horizonHeight, -0.766},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},}, {scaleParam = SPI_HorizonLineScale, mesh = {texture = "data:UI\\SensorsManager\\Meshes\\340.tga", LODs = {1, "UI\\SensorsManager\\Meshes\\Billboard.hod"},}, placement3D = {position = {-0.342, -horizonHeight, -0.9397},
	scale = {horizonNumberScale, (horizonNumberScale / horizonNumberAspect), horizonNumberScale}, placementFlags = {"scaledPos", "spriteYAxis"}, visibility = {"SVF_Below"},},},}
