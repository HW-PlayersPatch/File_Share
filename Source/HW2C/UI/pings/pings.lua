-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

function AREA(width, height)
	return ((width / 1024) * (height / 768))
end

function WIDTH(n)
	return (n / 1024)
end

function HEIGHT(n)
	return (n / 768)
end

HUGE = 1
LOD0 = AREA(120, 200)
LOD1 = AREA(64, 128)
LOD2 = AREA(32, 64)
LOD3 = AREA(16, 32)
TINY = AREA(1, 1)
INFINITE = 1E+20

PPI_PingSize = 0
PPI_Label = 1
PPI_FootScale = 2
PPI_FootColour = 3
PPI_Description0 = 4
PPI_Description1 = 5
PPI_Description2 = 6
PPI_Description3 = 7
PPN_NumberParams = 8

NoPriority = 0
LowPriority = 10
MediumPriority = 50
HighPriority = 75

PingManagerUpdateRate = 2

templates = {objective = {minGrowSize = 0, maxGrowSize = 0.1, minWorldSize = 0, growTime = 0.5, pauseTime = 1, lifespan = INFINITE, metaSelPriority = LowPriority, metaSelPrioritySM = LowPriority, pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/FIntelObjectivePing", circle = {scaleParam = PPI_PingSize, mesh = {colour = {1, 1, 1, 1}, lineWeight = 0.5, renderFlags = {"scaleX", "scaleY"},
	LODs = {1, "UI\\Pings\\Meshes\\Circle00.hod"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 0.1, factorHeight = 0.1,
	minWidth = WIDTH(8), minHeight = HEIGHT(8), maxWidth = WIDTH(55), maxHeight = HEIGHT(55), minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_PingSize"},},},}, hyperspaceIn = {minGrowSize = 100, maxGrowSize = 3000, minWorldSize = 0, growTime = 1, pauseTime = 1, lifespan = 2, metaSelPriority = LowPriority, metaSelPrioritySM = NoPriority, pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/hyperspacepingin", circle = {scaleParam = PPI_PingSize, mesh = {colour = {1, 0, 1, 1}, lineWeight = 1, renderFlags = {"scaleX", "scaleY"},
	LODs = {1, "UI\\Pings\\Meshes\\Circle00.hod"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 1, factorHeight = 1,
	minWidth = 0, minHeight = 0, maxWidth = HUGE, maxHeight = HUGE, minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_PingSize"},},},}, hyperspaceOut = {minGrowSize = 3000, maxGrowSize = 100, minWorldSize = 0, growTime = 1, pauseTime = 1, lifespan = 2, metaSelPriority = NoPriority, metaSelPrioritySM = NoPriority, pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/hyperspacepingout", circle = {scaleParam = PPI_PingSize, mesh = {colour = {1, 0, 1, 1}, lineWeight = 1, renderFlags = {"scaleX", "scaleY"},
	LODs = {1, "UI\\Pings\\Meshes\\Circle00.hod"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 1, factorHeight = 1,
	minWidth = 0, minHeight = 0, maxWidth = HUGE, maxHeight = HUGE, minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_PingSize"},},},}, newShip = {minGrowSize = 100, maxGrowSize = 3000, minWorldSize = 0, growTime = 1, pauseTime = 1, lifespan = 2, metaSelPriority = NoPriority, metaSelPrioritySM = LowPriority, pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/unitbuildcomplete", circle = {scaleParam = PPI_PingSize, mesh = {colour = {0, 1, 0, 1}, lineWeight = 1, renderFlags = {"scaleX", "scaleY"},
	LODs = {1, "UI\\Pings\\Meshes\\Circle00.hod"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 1, factorHeight = 1,
	minWidth = 0, minHeight = 0, maxWidth = HUGE, maxHeight = HUGE, minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_PingSize"},},},}, anomaly = {minGrowSize = 50, maxGrowSize = 300, minWorldSize = 0, growTime = 2, pauseTime = 0, lifespan = INFINITE, footColour = {0, 1, 1, 1}, mouseOverFootColour = {0, 1, 1, 1}, metaSelPriority = LowPriority, metaSelPrioritySM = LowPriority, pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/unknowncontactping", emitterSfxPatch = "data:sound/sfx/ui/sensorsmanager/unknowncontactping", circleSM = {texture = {colour = {0, 1, 1, 1},
	LODs = {LOD0, "UI\\Pings\\Meshes\\Circle.anim"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 1.6, factorHeight = 1.6,
	minWidth = 0, minHeight = 0, maxWidth = 10, maxHeight = 10, minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Pinging", "PVF_PingSize", "PVF_SensorsManager"},},}, arrowTopSM = {texture = {colour = {0, 1, 1, 1},
	LODs = {LOD0, "UI\\Pings\\Meshes\\arrow.anim"},}, placement2D = {factorX = 0, factorY = 3, plusX = 0, plusY = 0, factorWidth = 0.8, factorHeight = 1.6,
	minWidth = 0, minHeight = 0, maxWidth = 10, maxHeight = 10, minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Pinging", "PVF_PingSize", "PVF_SensorsManager"},},}, arrowBottomSM = {texture = {colour = {0, 1, 1, 1}, renderFlags = {"justifyTop"},
	LODs = {LOD0, "UI\\Pings\\Meshes\\arrow.anim"},}, placement2D = {factorX = 0, factorY = -3, plusX = 0, plusY = 0, factorWidth = 0.8, factorHeight = 1.6,
	minWidth = 0, minHeight = 0, maxWidth = 10, maxHeight = 10, minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Pinging", "PVF_PingSize", "PVF_SensorsManager"},},}, pointer = {mesh = {colour = {0, 1, 1, 1}, lineWeight = 1, renderFlags = {"scaleX", "scaleY"},
	LODs = {1, "UI\\Pings\\Meshes\\Pointer00.hod"},}, placement2D = {factorX = 1, factorY = 1, plusX = WIDTH(16), plusY = HEIGHT(6), factorWidth = 1, factorHeight = 1,
	minWidth = WIDTH(32), minHeight = HEIGHT(12), maxWidth = WIDTH(32), maxHeight = HEIGHT(12), minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Label", "PVF_PingSize", "PVF_SensorsManager", "PVF_MouseOver"},},}, label = {stringParam = PPI_Label, text = {colour = {1, 1, 1, 1}, renderFlags = {"justifyLeft"}, dropshadow = 1,
	LODs = {LOD0, "ATISmallFont", LOD1, "ATISmallFont", LOD2, "ATISmallFont"},}, placement2D = {factorX = 1, factorY = 1, plusX = WIDTH(32), plusY = HEIGHT(16), factorWidth = 1, factorHeight = 1,
	minWidth = WIDTH(32), minHeight = HEIGHT(12), maxWidth = WIDTH(32), maxHeight = HEIGHT(12), minATIArea = 0, maxATIArea = HUGE,
	visibility = {"PVF_Label", "PVF_PingSize", "PVF_SensorsManager", "PVF_MouseOver"},},}, foot = {scaleParam = PPI_FootScale, mesh = {colour = {0, 1, 1, 1}, lineWeight = 1,
	LODs = {1, "UI\\Meshes\\Foot.hod"},}, placement3D = {scale = {100, 1, 100},
	visibility = {"PVF_MovementMode", "PVF_SensorsManager"},},}, description0 = {stringParam = PPI_Description0, text = {colour = {1, 1, 1, 1}, renderFlags = {"justifyLeft"}, dropshadow = 1,
	LODs = {LOD0, "ATISmallFont", LOD1, "ATISmallFont", LOD2, "ATISmallFont"},}, placement2D = {factorX = 1, factorY = 1, plusX = WIDTH(32), plusY = HEIGHT(0), factorWidth = 1, factorHeight = 1,
	minWidth = WIDTH(32), minHeight = HEIGHT(12), maxWidth = WIDTH(32), maxHeight = HEIGHT(12),
	visibility = {"PVF_PingSize", "PVF_MouseOver", "PVF_Description0", "PVF_SensorsManager"},},}, description1 = {stringParam = PPI_Description1, text = {colour = {1, 1, 1, 1}, renderFlags = {"justifyLeft"}, dropshadow = 1,
	LODs = {LOD0, "ATISmallFont", LOD1, "ATISmallFont", LOD2, "ATISmallFont"},}, placement2D = {factorX = 1, factorY = 1, plusX = WIDTH(32), plusY = HEIGHT(-16), factorWidth = 1, factorHeight = 1,
	minWidth = WIDTH(32), minHeight = HEIGHT(12), maxWidth = WIDTH(32), maxHeight = HEIGHT(12),
	visibility = {"PVF_PingSize", "PVF_MouseOver", "PVF_Description1", "PVF_SensorsManager"},},}, description2 = {stringParam = PPI_Description2, text = {colour = {1, 1, 1, 1}, renderFlags = {"justifyLeft"}, dropshadow = 1,
	LODs = {LOD0, "ATISmallFont", LOD1, "ATISmallFont", LOD2, "ATISmallFont"},}, placement2D = {factorX = 1, factorY = 1, plusX = WIDTH(32), plusY = HEIGHT(-32), factorWidth = 1, factorHeight = 1,
	minWidth = WIDTH(32), minHeight = HEIGHT(12), maxWidth = WIDTH(32), maxHeight = HEIGHT(12),
	visibility = {"PVF_PingSize", "PVF_MouseOver", "PVF_Description2", "PVF_SensorsManager"},},}, description3 = {stringParam = PPI_Description3, text = {colour = {1, 1, 1, 1}, renderFlags = {"justifyLeft"}, dropshadow = 1,
	LODs = {LOD0, "ATISmallFont", LOD1, "ATISmallFont", LOD2, "ATISmallFont"},}, placement2D = {factorX = 1, factorY = 1, plusX = WIDTH(32), plusY = HEIGHT(-48), factorWidth = 1, factorHeight = 1,
	minWidth = WIDTH(32), minHeight = HEIGHT(12), maxWidth = WIDTH(32), maxHeight = HEIGHT(12),
	visibility = {"PVF_PingSize", "PVF_MouseOver", "PVF_Description3", "PVF_SensorsManager"},},},}, battle = {minGrowSize = 100, maxGrowSize = 1000, minWorldSize = 200, growTime = 1.2, pauseTime = 1.2, lifespan = 3, metaSelPriority = LowPriority, metaSelPrioritySM = LowPriority, battleStatusGood = 2, battleStatusBad = 0.5,
	minWidth = WIDTH(32), minHeight = WIDTH(32),
	pingSfxPatch = "data:sound/sfx/ui/sensorsmanager/BattleBracketPing", battleGoodPatch = "data:sound/sfx/ui/sensorsmanager/BattleMomentumGood", battleBadPatch = "data:sound/sfx/ui/sensorsmanager/BattleMomentumBad", i20 = {texture = {colour = {0, 1, 0, 1},
	LODs = {1, "UI\\Pings\\Meshes\\BattleGood.mtga"},}, placement2D = {factorX = -1, factorY = 0, plusX = WIDTH(-2), plusY = HEIGHT(8), factorWidth = 0, factorHeight = 0,
	minWidth = WIDTH(12), minHeight = HEIGHT(12), maxWidth = WIDTH(12), maxHeight = HEIGHT(12), minATIArea = 0, maxATIArea = HUGE, placementFlags = {"scaledPos", "sprite3Axis"},
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_RadiusSize", "PVF_BattleGood"},},}, i21 = {texture = {colour = {0.8, 0.8, 0.8, 1},
	LODs = {1, "UI\\Pings\\Meshes\\BattleGood.mtga"},}, placement2D = {factorX = -1, factorY = 0, plusX = WIDTH(-2), plusY = HEIGHT(8), factorWidth = 0, factorHeight = 0,
	minWidth = WIDTH(12), minHeight = HEIGHT(12), maxWidth = WIDTH(12), maxHeight = HEIGHT(12), minATIArea = 0, maxATIArea = HUGE, placementFlags = {"scaledPos", "sprite3Axis"},
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_RadiusSize"}, invisibility = {"PVF_BattleGood"},},}, i22 = {texture = {colour = {1, 0, 0, 1},
	LODs = {1, "UI\\Pings\\Meshes\\BattleBad.mtga"},}, placement2D = {factorX = -1, factorY = 0, plusX = WIDTH(-2), plusY = HEIGHT(-8), factorWidth = 0, factorHeight = 0,
	minWidth = WIDTH(12), minHeight = HEIGHT(12), maxWidth = WIDTH(12), maxHeight = HEIGHT(12), minATIArea = 0, maxATIArea = HUGE, placementFlags = {"scaledPos", "sprite3Axis"},
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_RadiusSize", "PVF_BattleBad"},},}, i23 = {texture = {colour = {0.8, 0.8, 0.8, 1},
	LODs = {1, "UI\\Pings\\Meshes\\BattleBad.mtga"},}, placement2D = {factorX = -1, factorY = 0, plusX = WIDTH(-2), plusY = HEIGHT(-8), factorWidth = 0, factorHeight = 0,
	minWidth = WIDTH(12), minHeight = HEIGHT(12), maxWidth = WIDTH(12), maxHeight = HEIGHT(12), minATIArea = 0, maxATIArea = HUGE, placementFlags = {"scaledPos", "sprite3Axis"},
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_RadiusSize"}, invisibility = {"PVF_BattleBad"},},}, circle = {scaleParam = PPI_PingSize, texture = {colour = {1, 0, 0, 1},
	LODs = {1, "UI\\Pings\\Meshes\\Circle.mtga"},}, placement2D = {factorX = 0, factorY = 0, plusX = 0, plusY = 0, factorWidth = 1, factorHeight = 1,
	minWidth = 0, minHeight = 0, maxWidth = HUGE, maxHeight = HUGE, minATIArea = 0, maxATIArea = HUGE, placementFlags = {"scaledPos", "sprite3Axis"},
	visibility = {"PVF_Pinging", "PVF_SensorsManager", "PVF_PingSize"},},},},}
