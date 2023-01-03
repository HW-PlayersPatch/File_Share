-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

FriendlyColour = {0, 1, 0, 1}
AlliedColour = {1, 1, 0, 1}
EnemyColour = {1, 0, 0, 1}
ResourceTOColour = {1, 1, 1, 1}
Procedural = {0, 0, 0, 0}

function AREA(width, height)
	return ((width / 1024) * (height / 768));
end

function WIDTH(n)
	return (n / 1024);
end

function HEIGHT(n)
	return (n / 768);
end

HUGE = 1
LOD0 = AREA(120, 200)
LOD1 = AREA(64, 128)
LOD2 = AREA(32, 64)
LOD3 = AREA(16, 32)
TINY = AREA(1, 1)

AVF_NotVisible = 2048
AVF_Visible = 4096

BPI_BlobColour = 0
BPI_FootColour = 1
BPI_FootScale = 2
BPI_EquatorColour = 3
BPI_EquatorPosition = 4
BPI_EquatorScale = 5
BPI_RUCount = 7
BPI_BlobName = 8
BPI_BlobNameColour = 9
BPI_NumberParams = 10

NoPriority = 0
LowPriority = 10
MediumPriority = 50
HighPriority = 75

sbFarthestBlob = 1.5
sbNearestBlob = 0.0000001

friendlies = {colourNear = {0.008, 0.2, 1, 1}, colourFar = {0, 0.0274, 0.25, 1}, colourMouseOverNear = {0.008, 0.2, 1, 1}, colourMouseOverFar = {0, 0.0274, 0.25, 1}, colourFootNear = {0.38, 0.45, 1, 1}, colourFootFar = {0.38, 0.45, 1, 1}, colourMouseOverFootNear = {0, 1, 1, 1}, colourMouseOverFootFar = {0, 1, 1, 1}, colourEquatorNear = {0.38, 0.45, 1, 1}, colourEquatorFar = {0.38, 0.45, 1, 1},
	equatorScale = 0.98, protrude = 0.4, borderPadding = 200, metaSelPriority = NoPriority, blobColourCurve = 0.5, blobInsideRadius = 1.5, blob = {colourParam = BPI_BlobColour, mesh = {lineWeight = 1, texture = "Data:UI\\SensorsManager\\Meshes\\SensorsBlobHalo.tga",
	LODs = {LOD0, "UI\\SensorsManager\\Meshes\\SensorsBlobNear.hod", LOD1, "UI\\SensorsManager\\Meshes\\SensorsBlobFar.hod"},}, placement3D = {position = {0, 0, 0}, scale = {1, 1, 1}, placementFlags = {"sprite3Axis"}, visibility = {0}, invisibility = {"BVF_Foreground"}, invisibility1 = {"BVF_Inside"},},}, sphereInsideOut = {colourParam = BPI_BlobColour, mesh = {lineWeight = 1,
	LODs = {1, "UI\\Meshes\\SensorSphereInside.hod"},}, placement3D = {position = {0, 0, 0}, scale = {1, 1, 1}, visibility = {"BVF_Inside"}, invisibility = {"BVF_Foreground"},},}, foot = {colourParam = BPI_FootColour, scaleParam = BPI_FootScale, mesh = {lineWeight = 1,
	LODs = {1, "UI\\Meshes\\Foot.hod"},}, placement3D = {scale = {100, 1, 100}, visibility = {"BVF_Foreground"},},},}
allies = {colourNear = {0.008, 0.2, 1, 1}, colourFar = {0, 0.0274, 0.25, 1}, colourMouseOverNear = {0.008, 0.2, 1, 1}, colourMouseOverFar = {0, 0.0274, 0.25, 1}, colourFootNear = {0.38, 0.45, 1, 1}, colourFootFar = {0.38, 0.45, 1, 1}, colourMouseOverFootNear = {0, 1, 1, 1}, colourMouseOverFootFar = {0, 1, 1, 1}, colourEquatorNear = {0.38, 0.45, 1, 1}, colourEquatorFar = {0.38, 0.45, 1, 1}, 
	equatorScale = 0.98, protrude = 0.4, borderPadding = 200, metaSelPriority = NoPriority, blobColourCurve = 0.5, blobInsideRadius = 1.5, blob = {colourParam = BPI_BlobColour, mesh = {lineWeight = 1, texture = "Data:UI\\SensorsManager\\Meshes\\SensorsBlobHalo.tga",
	LODs = {LOD0, "UI\\SensorsManager\\Meshes\\SensorsBlobNear.hod", LOD1, "UI\\SensorsManager\\Meshes\\SensorsBlobFar.hod"},}, placement3D = {position = {0, 0, 0}, scale = {1, 1, 1}, placementFlags = {"sprite3Axis"}, visibility = {0}, invisibility = {"BVF_Foreground"}, invisibility1 = {"BVF_Inside"},},}, sphereInsideOut = {colourParam = BPI_BlobColour, mesh = {lineWeight = 1,
	LODs = {1, "UI\\Meshes\\SensorSphereInside.hod"},}, placement3D = {position = {0, 0, 0}, scale = {1, 1, 1}, visibility = {"BVF_Inside"}, invisibility = {"BVF_Foreground"},},}, foot = {colourParam = BPI_FootColour, scaleParam = BPI_FootScale, mesh = {lineWeight = 1,
	LODs = {1, "UI\\Meshes\\Foot.hod"},}, placement3D = {scale = {100, 1, 100}, visibility = {"BVF_Foreground"},},},}
enemies = {}
resources = {colourNear = {0.55, 0.29, 0.03, 0.5}, colourFar = {0.55, 0.29, 0.03, 0.2}, colourMouseOverNear = {0.55, 0.29, 0.03, 1}, colourMouseOverFar = {0.55, 0.29, 0.03, 1}, colourFootNear = {0.55, 0.29, 0.03, 1}, colourFootFar = {0.55, 0.29, 0.03, 0.5}, colourMouseOverFootNear = {1, 1, 1, 1}, colourMouseOverFootFar = {0, 0, 0, 1}, colourEquatorNear = {0, 0, 0, 0}, colourEquatorFar = {0, 0, 0, 0},
	RUFormatString = "$6050", protrude = 0.75, borderPadding = 300, clickable = 1, bandboxable = 1, metaSelPriority = LowPriority, blobColourCurve = 0.5, foot = {colourParam = BPI_FootColour, scaleParam = BPI_FootScale, mesh = {lineWeight = 1,
	LODs = {1, "UI\\Meshes\\Foot.hod"},}, placement3D = {scale = {100, 1, 100}, visibility = {"BVF_Foreground", "BVF_MovementMode"},},}, mouseOverFoot = {colourParam = BPI_FootColour, scaleParam = BPI_FootScale, mesh = {lineWeight = 1,
	LODs = {1, "UI\\Meshes\\Foot.hod"},}, placement3D = {scale = {100, 1, 100}, visibility = {"BVF_Foreground", "BVF_MouseOver"},},},}
unknownEnemy = {borderPadding = 2000, protrude = 0.5, clickable = 1, bandboxable = 1, metaSelPriority = LowPriority, unidentified = {mesh = {colour = EnemyColour, lineWeight = 1, renderFlags = {"scaleX", "scaleY"},
	LODs = {LOD0, "UI\\TacticalIcons\\Meshes\\Circle.hod"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 1, factorHeight = 1, minWidth = WIDTH(4), minHeight = HEIGHT(4), maxWidth = WIDTH(4), maxHeight = HEIGHT(4), minATIArea = TINY, maxATIArea = HUGE,
	placementFlags = {"orthogonal"}, visibility = {0},},}, mouseOver = {colourParam = {1, 1, 1, 1}, scaleParam = BPI_EquatorScale, mesh = {lineWeight = 1,
	LODs = {LOD0, "UI\\Meshes\\Equator00.hod", LOD1, "UI\\Meshes\\Equator01.hod", LOD2, "UI\\Meshes\\Equator02.hod", LOD3, "UI\\Meshes\\Equator03.hod"},}, placement3D = {visibility = {"BVF_Foreground", "BVF_MouseOver"},},},}
battle = {borderPadding = 8000, protrude = 0.5, clickable = 1, metaSelPriority = NoPriority, notUsed = {mesh = {colour = EnemyColour, lineWeight = 1, renderFlags = {"scaleX", "scaleY"},
	LODs = {LOD0, "UI\\TacticalIcons\\Meshes\\Circle.hod"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 1, factorHeight = 1, minWidth = WIDTH(4), minHeight = HEIGHT(4), maxWidth = WIDTH(4), maxHeight = HEIGHT(4), minATIArea = TINY, maxATIArea = HUGE, placementFlags = {"orthogonal"}, visibility = {0},},},}
