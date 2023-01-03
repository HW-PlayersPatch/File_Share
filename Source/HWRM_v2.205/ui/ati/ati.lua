--
-- renderFlags:
--  scaleX/Y:           Item will be scaled to fit placement rectangle.
--  stretchX/Y:         Item will be stretched to fit placement rectangle.
--  fromLeft/Right:     With stretchX, the stretch centre point will be moved to left/right.
--  fromTop/Bottom:     With stretchY, the stretch centre point will be moved to top/bottom.
--  justifyLeft/Bottom: Default.
--  justifyRight/Top:   Change justification of item with placement.  Not for use with scaleX/Y.
--  justifyHoriz/VertCentre: Ditto.
--  clipTop/Bottom/Left/Right: For "health bar" type items, specify which direction bar moves.
--
-- Placement information:
--  factorX/Y:          Multiplied by the ATI width/height to place the centre of the item within
--                          the parent ATI.  Range is -1.0 .. 1.0 for bounds of ATI.
--                          0,0 will be centred within parent ATI)
--  plusX/Y:            Added to previous position regardless of size of ATI.  In normalized
--                          screen coords 0.0 .. 1.0)
--  factorWidth/Height: Multiple of total width/height of ATI (0.0 .. 1.0).  1,1 will be the
--                          full size of the ATI.
--  minWidth/Height:    Minimum size of element  (normalized screen coords)
--  maxWidth/Height:    Maximum size of element  (normalized screen coords)
--  minATIArea:         Minimum area of the ATI that contains this element where this element is
--                          visible.  Normalized screen coordinates.
--  maxATIArea:         Maximum area of the ATI that contains this element where this element is
--                          visible.  Normalized screen coordinates.
--  clampCentre(flag):  Prevent plusX/Y from moving centre of element past centre of ATI.  Useful
--                          if you have a negative factorX/Y and a positive plusX/Y or vice versa.
--  orthogonal(flag):   Same height as width.
--

--basic colours
FriendlyColour      = {0,1,0,1.0}
AlliedColour        = {1,1,0,1.0}
AlliedColourHurt    = {215/255,205/255,0,1}
AlliedColourDying   = {205/255,205/255,0,1}
EnemyColour         = {1,0,0,1.0}
EnemyColourHurt     = {205/255,0,0,1}
EnemyColourDying    = {165/255,0,0,1}
FriendlyColourFar   = {0,1,0,0.5}
AlliedColourFar     = {1,1,0,0.5}
EnemyColourFar      = {1,0,0,0.5}
ResourceTOColour    = {1,1,0,1.0}
Procedural          = {0,0,0,0}
ResourceColour      = {1.0, 1.0, 0.0, 1.0}
CaptureColour       = {0,1,1,1.0}

--convert pixels to normalized screen coordinates, assuming a 1024x768 screen
function AREA(width, height)
    return (width / 1024) * (height / 768)
end
function WIDTH(n)
    return(n / 1024)
end
function HEIGHT(n)
    return(n / 768)
end

--ATI areas for various LODs, assuming a 1024x768 screen
HUGE = 1000
LOD0 = AREA(120,200)
LOD1 = AREA(64,128)
LOD2 = AREA(32,64)
LOD3 = AREA(16,32)
TINY = AREA(1,1)

--ATI template parameter indices
API_GroupNumber             = 0
API_HealthColour            = 1
API_CurrentHealth           = 2
API_CurrentResources        = 3
API_CommandIcon             = 4
API_PlayerName              = 5
API_PlayerColour            = 6
API_ShipName                = 7
API_ResourceValue           = 8
API_TacticsSetting			= 9
API_Capture                 = 10
API_HealthContentsMesh      = 11
API_HealthOutlineMesh       = 12
API_HealthGlowMesh          = 13
API_Radius                  = 14
API_CommandColour           = 15
API_TOColour                = 16
API_TOMesh                  = 17
API_HealthBackgroundColour  = 18
API_TotalResourceValue      = 19
API_CommandColourDim        = 20
API_GateCost                = 21
API_AuxiliaryPower          = 22
API_AuxiliaryColour         = 23
API_UnknownResourceValue    = 24
API_UnknownTotalResourceValue=25
APN_NumberParams            = 26

-------------------------------------------------------------------------------
--ATIResources:
-------------------------------------------------------------------------------
resource =
{
    tacticalIconColour = ResourceTOColour,
    tacticalIconColourFar = ResourceTOColourFar,
    clampATIWidth = HEIGHT(900),
    clampATIHeight = HEIGHT(650),
    RUFormatString = "$6000",
    totalRUFormatString = "$6001",
    unknownRUFormatString = "$6003",
    unknownTotalRUFormatString = "$6004",
    commandColourScalar = {0.5,0.5,0.5,0.5},
    resourceValueString =
    {
        stringParam = API_ResourceValue,
        text =
        {
            colour = {1,1,0,1}, --{1.0,0.478,0.361,1},--{0.433,0.371,0.301,1}, --{1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            placementFlags = {"attachToMouse"},
            visibility = {"AVF_Resources", "AVF_SquadLeader", "AVF_Visible"},
            invisibility = {"AVF_Selecting"},
        }
    },
    resourceTotalValueString =
    {
        stringParam = API_TotalResourceValue,
        text =
        {
            colour = {1,1,0,1}, --{1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-55),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            placementFlags = {"attachToMouse"},
            visibility = {"AVF_SquadLeader", "AVF_Visible"},
            invisibility = {"AVF_Selecting"},
        }
    },
    unknownResourceValueString =
    {
        stringParam = API_UnknownResourceValue,
        text =
        {
            colour = {1,1,0,1}, --{1.0,0.478,0.361,1},--{0.433,0.371,0.301,1}, --{1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            placementFlags = {"attachToMouse"},
            visibility = {"AVF_Resources", "AVF_SquadLeader"},
            invisibility = {"AVF_Visible", "AVF_Selecting"},
        }
    },
    unknownResourceTotalValueString =
    {
        stringParam = API_UnknownTotalResourceValue,
        text =
        {
            colour = {1,1,0,1}, --{1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-55),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            placementFlags = {"attachToMouse"},
            visibility = {"AVF_SquadLeader"},
            invisibility = {"AVF_Visible", "AVF_Selecting"},
        }
    },
    selectingOutline =
    {
        mesh =
        {
            colour = {0.0, 1.0, 1.0, 1.0},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\SelectingOutline.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(2),
            minHeight = HEIGHT(2),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selecting"},
        },
    },
    mouseOver =
    {                                                                   --intersection of blob and world plane
        colourParam = API_CommandColour,
        scaleParam = API_Radius,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                LOD0, "UI\\Meshes\\Equator00.hod",
                LOD1, "UI\\Meshes\\Equator01.hod",
                LOD2, "UI\\Meshes\\Equator02.hod",
                LOD3, "UI\\Meshes\\Equator03.hod",
            }
        },
        placement3D =
        {
            visibility = {"AVF_MouseOver", "AVF_SquadLeader", "AVF_Visible" },
        }
    },
    mouseOverExtra =
    {                                                                   --intersection of blob and world plane
        colourParam = API_CommandColourDim,
        scaleParam = API_Radius,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                LOD0, "UI\\Meshes\\Equator00.hod",
                LOD1, "UI\\Meshes\\Equator01.hod",
                LOD2, "UI\\Meshes\\Equator02.hod",
                LOD3, "UI\\Meshes\\Equator03.hod",
            }
        },
        placement3D =
        {
            visibility = {"AVF_MouseOver"},
            invisibility = {"AVF_SquadLeader"},
        }
    },
    TO =
    {
        colourParam = API_TOColour,
        graphicParam = API_TOMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1, --1
            factorHeight = 1, --1
            minWidth = WIDTH(8), -- WIDTH(8),
            minHeight = HEIGHT(8), -- HEIGHT(8),
            maxWidth = 1, --HUGE
            maxHeight = 1, --HUGE
            minATIArea = 0,
            maxATIArea = HUGE,
            visibility = {"AVF_SMBlinkOn", "AVF_TacticalOverlay"},
            invisibility = {"AVF_TO_DistantTOs"},
            visibility1 = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_MouseOver", "AVF_TO_DistantTOs"},
            placementFlags = {"orthogonal"}, -- orthogonal
        },
    },
}

-------------------------------------------------------------------------------
--ATIMissile*:
-------------------------------------------------------------------------------
missilefriendly =
{
    tacticalIconColour = FriendlyColour,
    tacticalIconColourFar = FriendlyColourFar,
    clampATIWidth = HEIGHT(900),
    clampATIHeight = HEIGHT(650),
    TO =
    {
        colourParam = API_TOColour,
        graphicParam = API_TOMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1, --1
            factorHeight = 1, --1
            minWidth = WIDTH(8), -- WIDTH(8),
            minHeight = HEIGHT(8), -- HEIGHT(8),
            maxWidth = 1, --HUGE
            maxHeight = 1, --HUGE
            minATIArea = 0,
            maxATIArea = HUGE,
            visibility = {"AVF_TacticalOverlay", "AVF_Visible"},
            invisibility = {"AVF_TO_DistantTOs"},
            visibility1 = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_MouseOver", "AVF_TO_DistantTOs", "AVF_SquadLeader"},
            placementFlags = {"orthogonal"}, -- orthogonal
        },
    },
}
missileallied =
{
    tacticalIconColour = AlliedColour,
    tacticalIconColourFar = AlliedColourFar,
    clampATIWidth = HEIGHT(900),
    clampATIHeight = HEIGHT(650),
    TO =
    {
        colourParam = API_TOColour,
        graphicParam = API_TOMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1, --1
            factorHeight = 1, --1
            minWidth = WIDTH(8), -- WIDTH(8),
            minHeight = HEIGHT(8), -- HEIGHT(8),
            maxWidth = 1, --HUGE
            maxHeight = 1, --HUGE
            minATIArea = 0,
            maxATIArea = HUGE,
            visibility = {"AVF_TacticalOverlay", "AVF_Visible"},
            invisibility = {"AVF_TO_DistantTOs"},
            visibility1 = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_MouseOver", "AVF_TO_DistantTOs", "AVF_SquadLeader"},
            placementFlags = {"orthogonal"}, -- orthogonal
        },
    },
}
missileenemy =
{
    tacticalIconColour = EnemyColour,
    tacticalIconColourFar = EnemyColourFar,
    clampATIWidth = HEIGHT(900),
    clampATIHeight = HEIGHT(650),
    TO =
    {
        colourParam = API_TOColour,
        graphicParam = API_TOMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1, --1
            factorHeight = 1, --1
            minWidth = WIDTH(8), -- WIDTH(8),
            minHeight = HEIGHT(8), -- HEIGHT(8),
            maxWidth = 1, --HUGE
            maxHeight = 1, --HUGE
            minATIArea = 0,
            maxATIArea = HUGE,
            visibility = {"AVF_TacticalOverlay", "AVF_Visible"},
            invisibility = {"AVF_TO_DistantTOs"},
            visibility1 = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_MouseOver", "AVF_TO_DistantTOs", "AVF_SquadLeader"},
            placementFlags = {"orthogonal"}, -- orthogonal
        },
    },
}

-------------------------------------------------------------------------------
--ATIFriendly:
-----------------------------------------------------------------------------
friendly =
{
    tacticalIconColour = FriendlyColour,
    tacticalIconColourFar = FriendlyColourFar,
    clampATIWidth = HEIGHT(900),
    clampATIHeight = HEIGHT(650),
    healthColourOK = FriendlyColour,
    healthColourHurt = AlliedColour,
    healthColourDying = EnemyColour,
    healthColourBGOK = {0.5, 0.5, 0.5, 1},
    healthColourBGHurt = {0.5, 0.5, 0.5, 1},
    healthColourBGDying = {0.5, 0.5, 0.5, 1},
    gateCostFormatString = "$6002",
    cloakColour = {1,1,1,1.0},
    defenseFieldColour = {0.443,0,0.984,1},
    EMPColour = {58/255,110/255,165/255,1},
    customCommandColour = {0.443,0,0.984,1},  -- Define the color for the Custom Command auxiliary bar
    EMPLevelIgnore = 10000,
    i20 = --healthBarMouseoverStyle0 =
    {
        mesh =
        {   --1 ship
            colour = {1,1,1,1},
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0, --0.0065
            plusY = HEIGHT(6), --5.8 -- 6
            factorWidth = 0.2, --1
            factorHeight = 0.0375, --0.15
            plusWidth = PixelWidth() * 2,
            plusHeight = PixelHeight() * 2,
            minWidth = WIDTH(8), --10
            minHeight = HEIGHT(2), --15 * 0.15,
            maxWidth = WIDTH(200), --80 -- was 150
            maxHeight = HEIGHT(4), --15 55 * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0", "AVF_MouseOver"},
            invisibility = {"AVF_TacticalOverlay"},
            placementFlags = {"clampCentre"} -- originally orthogonal
       }
    },
    i21 = --healthBarOutlineStyle0 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,

        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0, --0.0065 0.0035
            plusY = HEIGHT(6), --6
            factorWidth = 0.2, -- 0.8 1
            factorHeight = 0.0375, --0.15
            minWidth = WIDTH(8), --10
            minHeight = HEIGHT(2), --15 * 0.15,
            maxWidth = WIDTH(200),--80 -- was 150
            maxHeight = HEIGHT(4), --15 55 * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            placementFlags = {"clampCentre"} -- originally orthogonal
       }
    },
    i22 = --healthBarStyle0 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0, --0.0065 0.0035
            plusY = HEIGHT(6), --6
            factorWidth = 0.2, -- 0.8 1
            factorHeight = 0.0375, --0.15
            minWidth = WIDTH(8), --10
            minHeight = HEIGHT(2), --15 * 0.15,
            maxWidth = WIDTH(200),--80 -- was 150
            maxHeight = HEIGHT(4), --15 55 * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            --visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            --invisibility1 = {"AVF_CohesiveSquad"},
            placementFlags = {"clampCentre"} -- originally orthogonal
        }
    },
    groupNumber0 =
    {
        stringParam = API_GroupNumber,
        text =
        {
            colour = {1,1,1,1},
            renderFlags = {"justifyLeft"},
            LODs =
            {
                LOD0, "ATIControlGroupFont",
                LOD1, "ATIControlGroupFont",
                LOD2, "ATIControlGroupFont"
            },
        },
        placement2D =
        {
            factorX = 0.2,
            factorY = 0.5,
            plusX = WIDTH(7),
            plusY = HEIGHT(4),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8), -- 8
            minHeight = HEIGHT(8), -- 8
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = 0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre"}, --clampCentre
            visibility = {"AVF_GroupNumber", "AVF_SquadLeader", "AVF_TO_SelectionIcons", "AVF_HealthBarStyle0"},
            visibility1 = {"AVF_GroupNumber", "AVF_SquadLeader", "AVF_TO_SelectionIcons", "AVF_HealthBarStyle1"},
            invisibility1 = {"AVF_MainGameView"},                   --also use this one for Style1 in the SM
            visibility2 = {"AVF_GroupNumber", "AVF_SquadLeader", "AVF_TO_SelectionIcons", "AVF_HealthBarStyle2"},
            invisibility2 = {"AVF_MainGameView"},                   --also use this one for Style2 in the SM
        },
    },
    i26 = --healthBarMouseoverStyle1 =
    {
        mesh =
        {   --1 ship
            colour = {1,1,1,1},
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0, --0
            factorY = 0.5, --0.8
            plusX = 0,
            plusY = HEIGHT(6), --HEIGHT(7.8)--7.8 -- 8
            factorWidth = 0.8, -- 0
            factorHeight = 0.1, --0.10 -- 0.15
            plusWidth = PixelWidth() * 2,
            plusHeight = PixelHeight() * 2,
            minWidth = WIDTH(15),  --15
            minHeight = HEIGHT(2), --8 --15 --* 0.15,
            maxWidth = WIDTH(135), -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 --15 -- 35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1", "AVF_MouseOver"},
            invisibility = {"AVF_TacticalOverlay"},
            placementFlags = {"clampCentre"} --originally orthogonal
        }
    },
    i27 = --healthBarOutlineStyle1 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,
        placement2D =
        {
            factorX = 0, --0
            factorY = 0.5, --0.8
            plusX = 0,
            plusY = HEIGHT(6), --HEIGHT(7.8)--7.8 -- 8
            factorWidth = 0.8, -- 0
            factorHeight = 0.1, --0.10 -- 0.15
            minWidth = WIDTH(15),  --15
            minHeight = HEIGHT(2), --8 --15 --* 0.15,
            maxWidth = WIDTH(135), -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 --15 -- 35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"} --originally orthogonal
        }
    },
    i28 = --healthBarStyle1 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0, --0
            factorY = 0.5, --0.8
            plusX = 0,
            plusY = HEIGHT(6), -- HEIGHT(8),
            factorWidth = 0.8, -- 0
            factorHeight = 0.1, -- 0.10 --0.15
            minWidth = WIDTH(15),  --15
            minHeight = HEIGHT(2), --8 --15 --* 0.15,
            maxWidth = WIDTH(135), -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 --15 -- 35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"} --originally orthogonal
        }
    },
    groupNumber1Far =
    {
        stringParam = API_GroupNumber,
        text =
        {
            colour = {1,1,1,1},
            renderFlags = {"justifyRight", "justifyBottom"},
            LODs =
            {
                LOD0, "ATIControlGroupFont",
                LOD1, "ATIControlGroupFont",
                LOD2, "ATIControlGroupFont"
            },
        },
        placement2D =
        {
            factorX = 0.8,
            factorY = 0.5,
            plusX = WIDTH(4),
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8), -- 8
            minHeight = HEIGHT(8), -- 8
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = 0,
            maxATIArea = WIDTH(135) / 0.8 * HEIGHT(135) / 0.8,
            placementFlags = {"clampCentre"}, --clampCentre
            visibility = {"AVF_GroupNumber", "AVF_MainGameView", "AVF_SquadLeader", "AVF_TO_SelectionIcons", "AVF_HealthBarStyle1"},
        },
    },
    groupNumber1Near =
    {
        stringParam = API_GroupNumber,
        text =
        {
            colour = {1,1,1,1},
            renderFlags = {"justifyRight", "justifyBottom"},
            LODs =
            {
                LOD0, "ATIControlGroupFont",
                LOD1, "ATIControlGroupFont",
                LOD2, "ATIControlGroupFont"
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = WIDTH(135 / 2) + WIDTH(4),
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8), -- 8
            minHeight = HEIGHT(8), -- 8
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = WIDTH(135) / 0.8 * HEIGHT(135) / 0.8,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre"}, --clampCentre
            visibility = {"AVF_GroupNumber", "AVF_MainGameView", "AVF_SquadLeader", "AVF_TO_SelectionIcons", "AVF_HealthBarStyle1"},
        },
    },
    i29 = --healthBarMouseoverStyle2 =
    {
        mesh =
        {   --1 ship
            colour = {1,1,1,1},
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0, -- 0.2 -- 0
            factorY = 0, --0 -- 0.8
            plusX = 0.0935, -- 0.0835 --0.11 -- 0
            plusY = HEIGHT(24), --23.8 --7.8
            factorWidth = 0, --0 --0.8 -- 0
            factorHeight = 0, --0 --0.10 -- 0.15
            plusWidth = PixelWidth() * 2,
            plusHeight = PixelHeight() * 2,
            minWidth = WIDTH(120), --120 --100 --155 -- 55
            minHeight = HEIGHT(4), --8 -- 15 --* 0.15,
            maxWidth = WIDTH(200), --200 -- 155 -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 --15 -- 35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2", "AVF_MouseOver"},
            invisibility = {"AVF_TacticalOverlay"},
            placementFlags = {"clampCentre"} -- originally orthogonal
        }
    },
    i30 = --healthBarOutlineStyle2 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,
        placement2D =
        {
            factorX = 0, -- 0.2 -- 0
            factorY = 0, --0 -- 0.8
            plusX = 0.0935, -- 0.0835 --0.11 -- 0
            plusY = HEIGHT(24), --23.8 --7.8
            factorWidth = 0, --0 --0.8 -- 0
            factorHeight = 0, --0 --0.10 -- 0.15
            minWidth = WIDTH(120), --120 -- 100 --155 -- 55
            minHeight = HEIGHT(4), --8 -- 15 --* 0.15,
            maxWidth = WIDTH(200), --200 --155 -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 --15 -- 35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} -- originally orthogonal
        }
    },
    i31 = --healthBarStyle2 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0, -- 0.2 -- 0
            factorY = 0, --0 -- 0.8
            plusX = 0.0935, --0.0835 -- 0.11 --0
            plusY = HEIGHT(24), -- 8
            factorWidth = 0, --0 -- 0.8 -- 0
            factorHeight = 0, --0 -- 0.10 -- 0.15
            minWidth = WIDTH(120), --100 --155 -- 55
            minHeight = HEIGHT(4), --8 -- 15 --* 0.15,
            maxWidth = WIDTH(200), --155 -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 --15 -- 35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} -- originally orthogonal
        }
    },
    i32 = --healthBarStyle2pointer = -- originally just "pointer"
    {
        mesh =
        {
            colour = {0,0.8,0,1.0}, --{1,0.9,0.2,1.0}, {0,0.8,0.2,0.5}, {0,0.8,0,1.0},
            lineWeight = 1.0,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Pointer00.hod",
            },
        },
        placement2D =
        {
            factorX = 0, --0 (good)
            factorY = 0, --0 (good)
            plusX = WIDTH(16), -- 16 (good) -- 16
            plusY = HEIGHT(15), -- 15 (good) -- 6
            factorWidth = 1,
            factorHeight = 1, -- 1
            minWidth = WIDTH(32),
            minHeight = HEIGHT(20),
            maxWidth = WIDTH(32),
            maxHeight = HEIGHT(20), --20
            minATIArea = TINY, -- 0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
    	    placementFlags = {"clampCentre"}, -- originally not present (but good idea though!) -- placementFlags = ("orthogonal"), --
        },
    },
    groupNumber2 =
    {
        stringParam = API_GroupNumber,
        text =
        {
            colour = {1,1,1,1},
            renderFlags = {"justifyRight", "justifyBottom"},
            LODs =
            {
                LOD0, "ATIControlGroupFont",
                LOD1, "ATIControlGroupFont",
                LOD2, "ATIControlGroupFont"
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0.0935 + WIDTH(60) + WIDTH(4),         --plusX of bar and half bar width
            plusY = HEIGHT(24) + HEIGHT(6),     --little bit above bar
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8), -- 8
            minHeight = HEIGHT(8), -- 8
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = 0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre"}, --clampCentre
            visibility = {"AVF_GroupNumber", "AVF_MainGameView", "AVF_SquadLeader", "AVF_TO_SelectionIcons", "AVF_HealthBarStyle2"},
        },
    },

    shipName =
    {
        stringParam = API_ShipName,
	    text =
        {
            colour = {1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_PlayerName", "AVF_SquadLeader"}, -- visibility = AVF_PlayerName
            placementFlags = {"attachToMouse"},
        }
    },

    i38 = --resourceOutline =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0 --0.8 -- 0.725 -- -1,
            plusX = 0,
            plusY = HEIGHT(0), --10 -- -1-- plusY = HEIGHT(-10) * 0.15,
            factorWidth = 0.8, --0 --0.8
            factorHeight = 0.1, --0.10
            minWidth = WIDTH(15), -- 15 --(0.125),
            minHeight = HEIGHT(2), -- 15 --* 0.15, --(0.125),
            maxWidth = WIDTH(135),-- 55 -- HUGE,
            maxHeight = HEIGHT(4), -- 55 -- * 0.15,-- HUGE,
            minATIArea = LOD0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre"},
	        visibility = {"AVF_Selected", "AVF_Resources", "AVF_MainGameView"},
        }
    },
    i39 = --resourceContents =
    {
        floatParam = API_CurrentResources,
        mesh =
        {
            colour = ResourceColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0 --0.8 -- 0.725 -- -1,
            plusX = 0,
            plusY = HEIGHT(0), --10 -- -1-- plusY = HEIGHT(-10) * 0.15,
            factorWidth = 0.8, --0 --0.8
            factorHeight = 0.1, --0.10
            minWidth = WIDTH(15), -- 15 --(0.125),
            minHeight = HEIGHT(2), -- 15 --* 0.15, --(0.125),
            maxWidth = WIDTH(135),-- 55 -- HUGE,
            maxHeight = HEIGHT(4), -- 55 -- * 0.15,-- HUGE,
            minATIArea = LOD0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre"},
	        visibility = {"AVF_Selected", "AVF_Resources", "AVF_MainGameView"},
        }
    },
    i40 = --captureOutline2 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, -- -1 -- 0.8-- -0.8
            plusX = 0,
            plusY = 0,
            factorWidth = 0.8, -- 0.07--0.8
            factorHeight = 0.1, -- 0.07 --0.10-- 0
            minWidth = WIDTH(15), --15 --(0.125),
            minHeight = HEIGHT(2), --8 -- 15--(0.125),
            maxWidth = WIDTH(135), -- 55 -- HUGE,
            maxHeight = HEIGHT(4), --4 --35 -- * 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle1"},
	        placementFlags = {"clampCentre"},
        }
    },
    i41 = --captureContents2 =
    {
        floatParam = API_Capture,
        mesh =
        {
            colour = CaptureColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, -- -1--0.8 -- -0.8
            plusX = 0,
            plusY = 0,
            factorWidth = 0.8, --0.07
            factorHeight = 0.1, --0.07 -- 0
            minWidth = WIDTH(15), --65 --(0.125),
            minHeight = HEIGHT(2), --2 --(0.125),
            maxWidth = WIDTH(135), --65 -- HUGE,
            maxHeight = HEIGHT(4), --8 --* 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle1"},
		placementFlags = {"clampCentre"},

        }
    },

    i42 = --captureOutline3 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1 -- 0.8-- -0.8
            plusX = 0.0935,
            plusY = HEIGHT(18),
            factorWidth = 0, -- 0.07--0.8
            factorHeight = 0, -- 0.07 --0.10-- 0
            minWidth = WIDTH(120), --15 --(0.125),
            minHeight = HEIGHT(4), --8 -- 15--(0.125),
            maxWidth = WIDTH(200), -- 55 -- HUGE,
            maxHeight = HEIGHT(4), --4 --35 -- * 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"}, -- originally not present
    	}
    },
    i43 = --captureContents3 =
    {
        floatParam = API_Capture,
        mesh =
        {
            colour = CaptureColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1--0.8 -- -0.8
            plusX = 0.0935,
            plusY = HEIGHT(18),
            factorWidth = 0, --0.07
            factorHeight = 0, --0.07 -- 0
            minWidth = WIDTH(120), --65 --(0.125),
            minHeight = HEIGHT(4), --2 --(0.125),
            maxWidth = WIDTH(200), --65 -- HUGE,
            maxHeight = HEIGHT(4), --8 --* 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle2"},
	        placementFlags = {"clampCentre"},  -- originally not present
        }
    },

    i50 =--auxiliaryPowerOutline0 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.2,
            factorHeight = 0.0375,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle0" },
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle0" },
            placementFlags = {"clampCentre"}
	    }
    },
    i51 = --auxiliaryPowerContents0 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.2,
            factorHeight = 0.0375,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

    i52 =--auxiliaryPowerOutline1 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.8,
            factorHeight = 0.1,
            minWidth = WIDTH(15),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(135),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle1" },
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle1" },
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },
    i53 = --auxiliaryPowerContents1 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.8,
            factorHeight = 0.1,
            minWidth = WIDTH(15),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(135),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

    i54 = --auxiliaryPowerOutline2 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0.0935,
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(120),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle2" },
            visibility = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle2" },
	        placementFlags = {"clampCentre"} -- originally not present
        }
    },
    i55 = --auxiliaryPowerContents2 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0.0935,
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(120),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            visibility = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

    commandIcon0 =
    {
        graphicParam = API_CommandIcon,
	    renderFlags = {"justifyRight"},
        placement2D =
        {
            factorX = -0.25, -- -0.6 --was 0.9
            factorY = 0.5, --0.8 --0.5
            plusX = WIDTH(-36), -- WIDTH(-20)
            plusY = HEIGHT(6), --HEIGHT(24),
            factorWidth = 0.2, --0.8
            factorHeight = 0.3, --0.10
            minWidth = 0,
            minHeight = 0,
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = LOD1,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre", "scaleToGraphic"}, -- orthogonal, {"clampCentre", "scaleToGraphic"},
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView", "AVF_HealthBarStyle0", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
        },
    },
    tacticsIcon0 =
    {
        graphicParam = API_TacticsSetting,
	    renderFlags = {"justifyLeft"},
        placement2D =
        {
            factorX = -0.25, --0.6
            factorY = 0.5, --0.8 --0.5
            plusX = WIDTH(-14), -- WIDTH(-42), --plusX = WIDTH(20),
            plusY = HEIGHT(6), -- HEIGHT(24), --plusY = HEIGHT(0),
            factorWidth = 0.2, --0.07 --0.8
            factorHeight = 0.3, --0.07 --0.10
            minWidth = 0,
            minHeight = 0,
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = LOD1,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre", "scaleToGraphic"}, -- {"clampCentre", "scaleToGraphic"},
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView", "AVF_HealthBarStyle0", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
        },
    },
    commandIcon1 =
    {
        graphicParam = API_CommandIcon,
	    renderFlags = {"justifyLeft"},
        placement2D =
        {
            factorX = 0, -- -0.6 --was 0.9
            factorY = 0.5, --0.8 --0.9
            plusX = WIDTH(-60), -- WIDTH(-20)
            plusY = HEIGHT(18), --HEIGHT(24),
            factorWidth = 0.8, --0.07
            factorHeight = 0.10, --0.07
            minWidth = 0,
            minHeight = 0,
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = LOD0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre", "scaleToGraphic"}, -- orthogonal
            visibility0 = {"AVF_MouseOver", "AVF_MainGameView", "AVF_HealthBarStyle1", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
        },
    },
    tacticsIcon1 =
    {
        graphicParam = API_TacticsSetting,
	    renderFlags = {"justifyRight"},
        placement2D =
        {
            factorX = 0, --0.6
            factorY = 0.5, --0.8 --0.9
            plusX = WIDTH(-38), -- WIDTH(-42), --plusX = WIDTH(20),
            plusY = HEIGHT(18), -- HEIGHT(24), --plusY = HEIGHT(0),
            factorWidth = 0.8, --0.07
            factorHeight = 0.10, --0.07
            minWidth = 0,
            minHeight = 0,
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = LOD0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre", "scaleToGraphic"},
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView", "AVF_HealthBarStyle1", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
        },
    },

    commandIcon2 =
    {
        graphicParam = API_CommandIcon,
	    renderFlags = {"justifyLeft"},
        placement2D =
        {
            factorX = 0, -- -0.6 --was 0.9
            factorY = 0, --0.8 --0.9
            plusX = WIDTH(41), -- WIDTH(-20), 0.041,
            plusY = HEIGHT(36), --HEIGHT(24),
            factorWidth = 0, --0.07
            factorHeight = 0, --0.07
            minWidth = 0,
            minHeight = 0,
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = LOD0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre", "scaleToGraphic"}, -- orthogonal
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView", "AVF_HealthBarStyle2", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
        },
    },
    tacticsIcon2 =
    {
        graphicParam = API_TacticsSetting,
	    renderFlags = {"justifyRight"},
        placement2D =
        {
            factorX = 0, --0.6
            factorY = 0, --0.8 --0.9
            plusX = WIDTH(63), -- WIDTH(-42), --plusX = WIDTH(20), 0.0575,
            plusY = HEIGHT(36), -- HEIGHT(24), --plusY = HEIGHT(0),
            factorWidth = 0, --0.07
            factorHeight = 0, --0.07
            minWidth = 0,
            minHeight = 0,
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = LOD0,
            maxATIArea = HUGE,
            placementFlags = {"clampCentre", "scaleToGraphic"},
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView", "AVF_HealthBarStyle2", "AVF_SquadLeader", "AVF_TO_SelectionIcons"},
        },
    },
    selectingOutline =
    {
        mesh =
        {
            colour = {0.0, 1.0, 1.0, 1.0},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\SelectingOutline.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(2),
            minHeight = HEIGHT(2),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selecting"},
        },
    },
    TO =
    {
        colourParam = API_TOColour,
        graphicParam = API_TOMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1, --1
            factorHeight = 1, --1
            minWidth = WIDTH(8), -- WIDTH(8),
            minHeight = HEIGHT(8), -- HEIGHT(8),
            maxWidth = 1, --HUGE
            maxHeight = 1, --HUGE
            minATIArea = 0,
            maxATIArea = HUGE,
            visibility = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_SquadLeader"},
            invisibility = {"AVF_TO_DistantTOs"},
            visibility1 = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_MouseOver", "AVF_TO_DistantTOs", "AVF_SquadLeader"},
            placementFlags = {"orthogonal"}, -- orthogonal
        },
    },
    gateCostString =
    {
        stringParam = API_GateCost,
        text =
        {
            colour = {1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-62),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            placementFlags = {"attachToMouse"},
            visibility = {"AVF_MainGameView", "AVF_GateCost", "AVF_MouseOver"},
        }
    },
}

-----------------------------------------------------------------------------
--ATIEnemy:
-----------------------------------------------------------------------------
enemy =
{
    tacticalIconColour = EnemyColour,
    tacticalIconColourFar = EnemyColourFar,
    clampATIWidth = HEIGHT(900),
    clampATIHeight = HEIGHT(650),
    healthColourOK = EnemyColour,
    healthColourHurt = EnemyColourHurt,
    healthColourDying = EnemyColourDying,
    healthColourBGOK = {0.5, 0.5, 0.5, 1},
    healthColourBGHurt = {0.5, 0.5, 0.5, 1},
    healthColourBGDying = {0.5, 0.5, 0.5, 1},
    EMPColour = {58/255,110/255,165/255,1},
    EMPLevelIgnore = 10000,
    i20 = --healthBarOutlineStyle0 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,
        placement2D =
	    {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0, --0.0065
            plusY = HEIGHT(6), --5.8 -- 6
            factorWidth = 0.2, --1
            factorHeight = 0.0375, --0.15
            minWidth = WIDTH(8), --10
            minHeight = HEIGHT(2), --15 * 0.15,
            maxWidth = WIDTH(200), --80 -- was 150
            maxHeight = HEIGHT(4), --15 55 * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            placementFlags = {"clampCentre"} -- originally orthogonal
       }
	
    },
    i21 = --healthBarStyle0 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
	    {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0, --0.0065 0.0035
            plusY = HEIGHT(6), --6
            factorWidth = 0.2, -- 0.8 1
            factorHeight = 0.0375, --0.15
            minWidth = WIDTH(8), --10
            minHeight = HEIGHT(2), --15 * 0.15,
            maxWidth = WIDTH(200),--80 -- was 150
            maxHeight = HEIGHT(4), --15 55 * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            --visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_SquadLeader", "AVF_HealthBarStyle0"},
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            --invisibility1 = {"AVF_CohesiveSquad"},
            placementFlags = {"clampCentre"} -- originally orthogonal
        }
    },
	
    i24 = --healthBarOutlineStyle1 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.6 --0.8
            plusX = 0,
            plusY = HEIGHT(6), --15 --8
            factorWidth = 0.8,
            factorHeight = 0.10,
            minWidth = WIDTH(15), --35
            minHeight = HEIGHT(2), --4 --* 0.15,
            maxWidth = WIDTH(135),--35 -- was 150
            maxHeight = HEIGHT(4), -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"}
        }
    },
    i25 = --healthBarStyle1 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.6 --0.8
            plusX = 0,
            plusY = HEIGHT(6), --14.8 --8
            factorWidth = 0.8,
            factorHeight = 0.10,
            minWidth = WIDTH(15), --35
            minHeight = HEIGHT(2), --4 --* 0.15,
            maxWidth = WIDTH(135), --35 -- was 150
            maxHeight = HEIGHT(4), -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"}
        }
    },

    i26 = --healthBarOutlineStyle2 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0, --0.8
            plusX = 0.0935, --0.0835 --0.11 --0
            plusY = HEIGHT(24), --7.8
            factorWidth = 0, -- 0
            factorHeight = 0, -- 0.15
            minWidth = WIDTH(120), --100 -- 55
            minHeight = HEIGHT(4), --* 0.15,
            maxWidth = WIDTH(200), --100 -- 55 -- was 150
            maxHeight = HEIGHT(4), --35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} -- originally "othogonal"
        }
    },
    i27 = --healthBarStyle2 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0,
            factorY = 0, --0.8
            plusX = 0.0935, --0.035 --0.11 --0
            plusY = HEIGHT(24), -- 8
            factorWidth = 0, --0.8 -- 0
            factorHeight = 0, --0.10 -- 0.15
            minWidth = WIDTH(120), --100 --55
            minHeight = HEIGHT(4), --15--* 0.15,
            maxWidth = WIDTH(200), --100-- 55 -- was 150
            maxHeight = HEIGHT(4), --35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} --originally "orthogonal"
        }
    },
    i28 = --healthBarStyle2pointer = -- originally just "pointer"
    {
        mesh =
        {
            colour = {0.8,0,0,1.0}, --{0,0.8,0.2,0.5},{1,0.9,0.2,1.0},
            lineWeight = 1.0,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Pointer00.hod",
            },
        },
        placement2D =
        {
            factorX = 0, --0 (good)
            factorY = 0, --0 (good)
            plusX = WIDTH(16), -- 16 (good) -- 16
            plusY = HEIGHT(15), -- 15 (good) -- 6
            factorWidth = 1,
            factorHeight = 1, -- 1
            minWidth = WIDTH(32),
            minHeight = HEIGHT(20),
            maxWidth = WIDTH(32),
            maxHeight = HEIGHT(20),
            minATIArea = TINY, -- 0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
	        placementFlags = {"clampCentre"}, -- originally not present (but good idea though!) -- placementFlags = ("orthogonal"), --
        },
    },
    shipName =
    {
        stringParam = API_ShipName,
        text =
        {
            colour = {1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_PlayerName", "AVF_SquadLeader"},
            placementFlags = {"attachToMouse"},
        }
    },
    playerName =
    {
        stringParam = API_PlayerName,
        -- colourParam = API_PlayerColour, --API_PlayerColour, --{1,1,1,1},
        text =
        {
            colour = {1,0,0,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-50),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_PlayerName", "AVF_SquadLeader"},
            placementFlags = {"attachToMouse"},
        }
    },
    i40 = --captureOutline2 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, -- -1 -- 0.8-- -0.8
            plusX = 0,
            plusY = 0,
            factorWidth = 0.8, -- 0.07--0.8
            factorHeight = 0.1, -- 0.07 --0.10-- 0
            minWidth = WIDTH(15), --15 --(0.125),
            minHeight = HEIGHT(2), --8 -- 15--(0.125),
            maxWidth = WIDTH(135), -- 55 -- HUGE,
            maxHeight = HEIGHT(4), --4 --35 -- * 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle1"},
	        placementFlags = {"clampCentre"},
        }
    },
    i41 = --captureContents2 =
    {
        floatParam = API_Capture,
        mesh =
        {
            colour = CaptureColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, -- -1--0.8 -- -0.8
            plusX = 0,
            plusY = 0,
            factorWidth = 0.8, --0.07
            factorHeight = 0.1, --0.07 -- 0
            minWidth = WIDTH(15), --65 --(0.125),
            minHeight = HEIGHT(2), --2 --(0.125),
            maxWidth = WIDTH(135), --65 -- HUGE,
            maxHeight = HEIGHT(4), --8 --* 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle1"},
	        placementFlags = {"clampCentre"},
        }
    },
    i42 = --captureOutline3 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1 -- 0.8-- -0.8
            plusX = 0.0935,
            plusY = HEIGHT(18), --50.8 -- -24.8
            factorWidth = 0, -- 0.07--0.8
            factorHeight = 0, -- 0.07 --0.10-- 0
            minWidth = WIDTH(120), --15 --(0.125),
            minHeight = HEIGHT(4), --8 -- 15--(0.125),
            maxWidth = WIDTH(200), -- 55 -- HUGE,
            maxHeight = HEIGHT(4), --4 --35 -- * 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected","AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"}, -- originally not present
	    }
    },
    i43 = --captureContents3 =
    {
        floatParam = API_Capture,
        mesh =
        {
            colour = CaptureColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1--0.8 -- -0.8
            plusX = 0.0935,
            plusY = HEIGHT(18), --51
            factorWidth = 0, --0.07
            factorHeight = 0, --0.07 -- 0
            minWidth = WIDTH(120), --65 --(0.125),
            minHeight = HEIGHT(4), --2 --(0.125),
            maxWidth = WIDTH(200), --65 -- HUGE,
            maxHeight = HEIGHT(4), --8 --* 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected","AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle2"},
	    placementFlags = {"clampCentre"},  -- originally not present
        }
    },

    selectingOutline =
    {
        mesh =
        {
            colour = {0.0, 1.0, 1.0, 1.0},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\SelectingOutline.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(2),
            minHeight = HEIGHT(2),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selecting"},
            --invisibility = {"AVF_SquadLeader"},
        },
    },
    TO =
    {
        colourParam = API_TOColour,
        graphicParam = API_TOMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1, --1
            factorHeight = 1, --1
            minWidth = WIDTH(8), -- WIDTH(8),
            minHeight = HEIGHT(8), -- HEIGHT(8),
            maxWidth = 1, --HUGE
            maxHeight = 1, --HUGE
            minATIArea = 0,
            maxATIArea = HUGE,
            visibility = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_SquadLeader"},
            invisibility = {"AVF_TO_DistantTOs"},
            visibility1 = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_MouseOver", "AVF_TO_DistantTOs", "AVF_SquadLeader"},
            placementFlags = {"orthogonal"}, -- orthogonal
            placementFlags = {"orthogonal"}, -- orthogonal
        },
    },
    i50 =--auxiliaryPowerOutline0 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.2,
            factorHeight = 0.0375,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle0" },
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle0" },
            placementFlags = {"clampCentre"}
	    }
    },
    i51 = --auxiliaryPowerContents0 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.2,
            factorHeight = 0.0375,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

    i52 = --auxiliaryPowerOutline1 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.8,
            factorHeight = 0.1,
            minWidth = WIDTH(15),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(135),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle1" },
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },
    i53 = --auxiliaryPowerContents1 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.8,
            factorHeight = 0.1,
            minWidth = WIDTH(15),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(135),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

    i54 = --auxiliaryPowerOutline2 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0.0935,
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(120),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle2" },
	        placementFlags = {"clampCentre"} -- originally not present
        }
    },
    i55 = --auxiliaryPowerContents2 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0.0935,
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(120),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

}

-----------------------------------------------------------------------------
--ATIAllied:
-----------------------------------------------------------------------------
allied =
{
    tacticalIconColour = AlliedColour,
    tacticalIconColourFar = AlliedColourFar,
    clampATIWidth = HEIGHT(900),
    clampATIHeight = HEIGHT(650),
    healthColourOK = AlliedColour,
    healthColourHurt = AlliedColourHurt,
    healthColourDying = AlliedColourDying,
    healthColourBGOK = {0.5, 0.5, 0.5, 1},
    healthColourBGHurt = {0.5, 0.5, 0.5, 1},
    healthColourBGDying = {0.5, 0.5, 0.5, 1},
    EMPColour = {58/255,110/255,165/255,1},
    EMPLevelIgnore = 10000,
    i20 = --healthBarOutlineStyle0 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,

        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0, --0.0065
            plusY = HEIGHT(6), --5.8 -- 6
            factorWidth = 0.2, --1
            factorHeight = 0.0375, --0.15
            minWidth = WIDTH(8), --10
            minHeight = HEIGHT(2), --15 * 0.15,
            maxWidth = WIDTH(200), --80 -- was 150
            maxHeight = HEIGHT(4), --15 55 * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            placementFlags = {"clampCentre"} -- originally orthogonal
       }
    },
    i21 = --healthBarStyle0 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0, --0.0065 0.0035
            plusY = HEIGHT(6), --6
            factorWidth = 0.2, -- 0.8 1
            factorHeight = 0.0375, --0.15
            minWidth = WIDTH(8), --10
            minHeight = HEIGHT(2), --15 * 0.15,
            maxWidth = WIDTH(200),--80 -- was 150
            maxHeight = HEIGHT(4), --15 55 * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            --visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_SquadLeader", "AVF_HealthBarStyle0"},
            visibility0 = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            --invisibility1 = {"AVF_CohesiveSquad"},
            placementFlags = {"clampCentre"} -- originally orthogonal
        }
    },
    i24 = --healthBarOutlineStyle1 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0,
            plusY = HEIGHT(6), --7.8
            factorWidth = 0.8, -- 0
            factorHeight = 0.10, -- 0.15
            minWidth = WIDTH(15), --35
            minHeight = HEIGHT(2), --4 --8 --15 --* 0.15,
            maxWidth = WIDTH(135), --35 -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"}
        }
    },
    i25 = --healthBarStyle1 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, --0.8
            plusX = 0,
            plusY = HEIGHT(6), --8
            factorWidth = 0.8, -- 0
            factorHeight = 0.10, -- 0.15
            minWidth = WIDTH(15), --35
            minHeight = HEIGHT(2), --4 --8 --15 --* 0.15,
            maxWidth = WIDTH(135), --35 -- 55 -- was 150
            maxHeight = HEIGHT(4), --8 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"}
        }
    },
    i26 = --healthBarOutlineStyle2 =
    {
        colourParam = API_HealthBackgroundColour,
        graphicParam = API_HealthOutlineMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0, --0.8
            plusX = 0.0935, --0.0835 --0
            plusY = HEIGHT(24), --7.8
            factorWidth = 0, --0.8 -- 0
            factorHeight = 0, --0.10 -- 0.15
            minWidth = WIDTH(120), --100 --155
            minHeight = HEIGHT(4), --8 --15  --* 0.15,
            maxWidth = WIDTH(200), --100 -- 55 -- was 150
            maxHeight = HEIGHT(4), --35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"}
        }
    },
    i27 = --healthBarStyle2 =
    {
        colourParam = API_HealthColour,
        graphicParam = API_HealthContentsMesh,
        floatParam = API_CurrentHealth,
        placement2D =
        {
            factorX = 0,
            factorY = 0, --0.8
            plusX = 0.0935, --0.0835 --0
            plusY = HEIGHT(24), --8
            factorWidth = 0, --0.8 -- 0
            factorHeight = 0, --0.10 -- 0.15
            minWidth = WIDTH(120), --100 --55
            minHeight = HEIGHT(4), --15 --* 0.15,
            maxWidth = WIDTH(200), --100 -- 55 -- was 150
            maxHeight = HEIGHT(4), --35 -- 55 -- * 0.15, -- was 150
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"}
        }
    },

    i28 = --healthBarStyle2pointer = -- originally just "pointer"
    {
        mesh =
        {
            colour = {1,0.9,0.2,1.0}, --{0,0.8,0.2,0.5},{1,0.9,0.2,1.0},
            lineWeight = 1.0,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Pointer00.hod",
            },
        },
        placement2D =
        {
            factorX = 0, --0 (good)
            factorY = 0, --0 (good)
            plusX = WIDTH(16), -- 16 (good) -- 16
            plusY = HEIGHT(15), -- 15 (good) -- 6
            factorWidth = 1,
            factorHeight = 1, -- 1
            minWidth = WIDTH(32),
            minHeight = HEIGHT(20),
            maxWidth = WIDTH(32),
            maxHeight = HEIGHT(20),
            minATIArea = TINY, -- 0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView", "AVF_HealthBarStyle2"},
	        placementFlags = {"clampCentre"}, -- originally not present (but good idea though!) -- placementFlags = ("orthogonal"), --
        },
    },

    shipName =
    {
        stringParam = API_ShipName,
        text =
        {
            colour = {1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_PlayerName", "AVF_SquadLeader"},
            placementFlags = {"attachToMouse"},
        }
    },

    playerName =
    {
        stringParam = API_PlayerName,
     --   colourParam = API_PlayerColour, --API_PlayerColour,
        text =
        {
            colour = {1,1,0,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-50),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_PlayerName", "AVF_SquadLeader"},
            placementFlags = {"attachToMouse"},
        }
    },
    i40 = --captureOutline2 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, -- -1 -- 0.8-- -0.8
            plusX = 0,
            plusY = 0,
            factorWidth = 0.8, -- 0.07--0.8
            factorHeight = 0.1, -- 0.07 --0.10-- 0
            minWidth = WIDTH(15), --15 --(0.125),
            minHeight = HEIGHT(2), --8 -- 15--(0.125),
            maxWidth = WIDTH(135), -- 55 -- HUGE,
            maxHeight = HEIGHT(4), --4 --35 -- * 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle1"},
	        placementFlags = {"clampCentre"},
        }
    },
    i41 = --captureContents2 =
    {
        floatParam = API_Capture,
        mesh =
        {
            colour = CaptureColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5, -- -1--0.8 -- -0.8
            plusX = 0,
            plusY = 0,
            factorWidth = 0.8, --0.07
            factorHeight = 0.1, --0.07 -- 0
            minWidth = WIDTH(15), --65 --(0.125),
            minHeight = HEIGHT(2), --2 --(0.125),
            maxWidth = WIDTH(135), --65 -- HUGE,
            maxHeight = HEIGHT(4), --8 --* 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle1"},
        }
    },

    i42 = --captureOutline3 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1 -- 0.8-- -0.8
            plusX = 0.0935,
            plusY = HEIGHT(18), --50.8 -- -24.8
            factorWidth = 0, -- 0.07--0.8
            factorHeight = 0, -- 0.07 --0.10-- 0
            minWidth = WIDTH(120), --15 --(0.125),
            minHeight = HEIGHT(4), --8 -- 15--(0.125),
            maxWidth = WIDTH(200), -- 55 -- HUGE,
            maxHeight = HEIGHT(4), --4 --35 -- * 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },
    i43 = --captureContents3 =
    {
        floatParam = API_Capture,
        mesh =
        {
            colour = CaptureColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1--0.8 -- -0.8
            plusX = 0.0935,
            plusY = HEIGHT(18), --51
            factorWidth = 0, --0.07
            factorHeight = 0, --0.07 -- 0
            minWidth = WIDTH(120), --65 --(0.125),
            minHeight = HEIGHT(4), --2 --(0.125),
            maxWidth = WIDTH(200), --65 -- HUGE,
            maxHeight = HEIGHT(4), --8 --* 0.15,-- HUGE,
            minATIArea = TINY, --LOD0
            maxATIArea = HUGE,
            visibility = {"AVF_Capture", "AVF_MainGameView", "AVF_HealthBarStyle2"},
	        placementFlags = {"clampCentre"}  -- originally not present
        }
    },

    selectingOutline =
    {
        mesh =
        {
            colour = {0.0, 1.0, 1.0, 1.0},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\SelectingOutline.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(2),
            minHeight = HEIGHT(2),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selecting"},
            --invisibility = {"AVF_SquadLeader"},
        },
    },
    TO =
    {
        colourParam = API_TOColour,
        graphicParam = API_TOMesh,
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1, --1
            factorHeight = 1, --1
            minWidth = WIDTH(8), -- WIDTH(8),
            minHeight = HEIGHT(8), -- HEIGHT(8),
            maxWidth = 1, --HUGE
            maxHeight = 1, --HUGE
            minATIArea = 0,
            maxATIArea = HUGE,
            visibility = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_SquadLeader"},
            invisibility = {"AVF_TO_DistantTOs"},
            visibility1 = {"AVF_SMBlinkOn", "AVF_TacticalOverlay", "AVF_MouseOver", "AVF_TO_DistantTOs", "AVF_SquadLeader"},
            placementFlags = {"orthogonal"}, -- orthogonal
            placementFlags = {"orthogonal"}, -- orthogonal
        },
    },
    i50 =--auxiliaryPowerOutline0 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.2,
            factorHeight = 0.0375,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle0" },
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle0" },
            placementFlags = {"clampCentre"}
	    }
    },
    i51 = --auxiliaryPowerContents0 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.2,
            factorHeight = 0.0375,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_AuxiliaryPower", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle0"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

    i52 = --auxiliaryPowerOutline1 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.8,
            factorHeight = 0.1,
            minWidth = WIDTH(15),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(135),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle1" },
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },
    i53 = --auxiliaryPowerContents1 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0.5,
            plusX = 0,
            plusY = HEIGHT(-6),
            factorWidth = 0.8,
            factorHeight = 0.1,
            minWidth = WIDTH(15),
            minHeight = HEIGHT(2),
            maxWidth = WIDTH(135),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility1 = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle1"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

    i54 = --auxiliaryPowerOutline2 =
    {
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0.0935,
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(120),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle2" },
	        placementFlags = {"clampCentre"} -- originally not present
        }
    },
    i54 = --auxiliaryPowerContents2 =
    {
        floatParam = API_AuxiliaryPower,
        colourParam = API_AuxiliaryColour,
        mesh =
        {
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0.0935,
            plusY = HEIGHT(12),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(120),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(200),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_EMPShield", "AVF_MainGameView", "AVF_HealthBarStyle2"},
            placementFlags = {"clampCentre"} -- originally not present
	    }
    },

}

-----------------------------------------------------------------------------
--ATISubSystemFriendly:
-----------------------------------------------------------------------------
subsystemFriendly =
{
    healthColourOK = FriendlyColour,
    healthColourHurt = AlliedColour,
    healthColourDying = EnemyColour,
    healthColourBGOK = {0.5, 0.5, 0.5, 1},
    healthColourBGHurt = {0.5, 0.5, 0.5, 1},
    healthColourBGDying = {0.5, 0.5, 0.5, 1},
    i00 = --healthOutline =
    {
        colourParam = API_HealthBackgroundColour,
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1
            plusX = WIDTH(46),
            plusY = HEIGHT(38),
            factorWidth = 0.2, --0.8
            factorHeight = 0.0375, --0
            minWidth = WIDTH(20),
            minHeight = HEIGHT(3),
            maxWidth = WIDTH(20),
            maxHeight = HEIGHT(3),
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
	        visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
	    }
    },
    i01 = --healthContents =
    {
        colourParam = API_HealthColour,
        floatParam = API_CurrentHealth,
        mesh =
        {
            colour = FriendlyColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1
            plusX = WIDTH(46),
            plusY = HEIGHT(38),
            factorWidth = 0.2, --0.8
            factorHeight = 0.0375, --0
            minWidth = WIDTH(20),
            minHeight = HEIGHT(3),
            maxWidth = WIDTH(20),
            maxHeight = HEIGHT(3),
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
	        visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
	    }
    },

    circle =
    {
        -- scaleParam = PPI_PingSize,
        mesh =
        {
            colour = {0,0.8,0,1.0}, -- {1,0.9,0.2,1.0},
            lineWeight = .5,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Circle00.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = .1, --.1
            factorHeight = .1, --.1
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = WIDTH(75),
            maxHeight = HEIGHT(75),
            minATIArea = 0, --TINY, 0
            maxATIArea = HUGE,
            visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
	    },
	},
    subsystempointer = -- originally just "pointer"
    {
        mesh =
        {
            colour = {0,0.8,0,1.0}, --{1,0.9,0.2,1.0},{0,0.8,0.2,0.5},
            lineWeight = 1.0,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Pointer00.hod",
            },
        },
        placement2D =
        {
            factorX = 0, --0 (good)
            factorY = 0, --0 (good)
            plusX = WIDTH(18), -- 16 (good) -- 16
            plusY = HEIGHT(20), -- 15 (good) -- 6
            factorWidth = 0, --1
            factorHeight = 0, -- 1
            minWidth = WIDTH(32),
            minHeight = HEIGHT(35),
            maxWidth = WIDTH(32),
            maxHeight = HEIGHT(35),
            minATIArea = 0, -- TINY, 0
            maxATIArea = HUGE,
            visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre"}, -- originally not present (but good idea though!) -- placementFlags = ("orthogonal"), --
        },
    },
    shipsubsystemName =
    {
        stringParam = API_ShipName,
        text =
        {
            colour = {1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0, --0
            factorHeight = 0, --0
            minWidth = WIDTH(4),
            minHeight = HEIGHT(4),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = 0, --TINY
            maxATIArea = HUGE,
            visibility1 = {"AVF_PlayerName", "AVF_MainGameView", "AVF_MouseOver"},
            placementFlags = {"attachToMouse"},
        }
    },
    selectingOutline =
    {
        mesh =
        {
            colour = {0.0, 1.0, 1.0, 1.0},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\SelectingOutline.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(2),
            minHeight = HEIGHT(2),
            minATIArea = 0, --TINY
            maxATIArea = HUGE,
            visibility = {"AVF_Selecting"},
        },
    },
}

-----------------------------------------------------------------------------
--ATISubSystemEnemy:
-----------------------------------------------------------------------------
subsystemEnemy =
{
    healthColourOK = EnemyColour,
    healthColourHurt = EnemyColourHurt,
    healthColourDying = EnemyColourDying,
    healthColourBGOK = {0.5, 0.5, 0.5, 1},
    healthColourBGHurt = {0.5, 0.5, 0.5, 1},
    healthColourBGDying = {0.5, 0.5, 0.5, 1},
    i00 = --healthOutline =
    {
    	-- colourParam = API_HealthBackgroundColour, -- originally not present
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1
            plusX = WIDTH(46),
            plusY = HEIGHT(38),
            factorWidth = 0.2, --0.8
            factorHeight = 0.0375, --0
            minWidth = WIDTH(20),
            minHeight = HEIGHT(3),
            maxWidth = WIDTH(20),
            maxHeight = HEIGHT(3),
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
	        visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
        }
    },
    i01 = --healthContents =
    {
    	-- colourParam = API_HealthColour, -- originally not present
        floatParam = API_CurrentHealth,
        mesh =
        {
            colour = EnemyColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1
            plusX = WIDTH(46),
            plusY = HEIGHT(38),
            factorWidth = 0.2, --0.8
            factorHeight = 0.0375, --0
            minWidth = WIDTH(20),
            minHeight = HEIGHT(3),
            maxWidth = WIDTH(20),
            maxHeight = HEIGHT(3),
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
	        visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
        }
    },

    circle =
    {
        -- scaleParam = PPI_PingSize,
        mesh =
        {
            colour = {0.8,0,0,1}, -- {1,0.9,0.2,1.0},
            lineWeight = .5,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Circle00.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = .1, --.1
            factorHeight = .1, --.1
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = WIDTH(75),
            maxHeight = HEIGHT(75),
            minATIArea = 0, -- TINY, 0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
        },
	},
    subsystempointer = -- originally just "pointer"
    {
        mesh =
        {
            colour = {0.8,0,0,1.0}, --{1,0.9,0.2,1.0},{0,0.8,0.2,0.5},{1,0.9,0.2,1.0},
            lineWeight = 1.0,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Pointer00.hod",
            },
        },
        placement2D =
        {
            factorX = 0, --0 (good)
            factorY = 0, --0 (good)
            plusX = WIDTH(18), -- 16 (good) -- 16
            plusY = HEIGHT(20), -- 15 (good) -- 6
            factorWidth = 0, --1
            factorHeight = 0, -- 1
            minWidth = WIDTH(32),
            minHeight = HEIGHT(35),
            maxWidth = WIDTH(32),
            maxHeight = HEIGHT(35),
            minATIArea = 0, -- TINY, 0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView"},
    	    placementFlags = {"clampCentre"}, -- originally not present (but good idea though!) -- placementFlags = ("orthogonal"), --
        },
    },

    shipsubsystemName =
    {
        stringParam = API_ShipName,
        text =
        {
            colour = {1,1,1,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0, --0
            factorHeight = 0, --0
            minWidth = WIDTH(4),
            minHeight = HEIGHT(4),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
            visibility = {"AVF_PlayerName", "AVF_MouseOver", "AVF_MainGameView"},
            placementFlags = {"attachToMouse"},
        }
    },

    playerName =
    {
        stringParam = API_PlayerName,
        -- colourParam = API_PlayerColour,
        text =
        {
            colour = {1,0,0,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-50),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_PlayerName", "AVF_MouseOver", "AVF_MainGameView"},
            placementFlags = {"attachToMouse"},
        }
    },
    selectingOutline =
    {
        mesh =
        {
            colour = {0.0, 1.0, 1.0, 1.0},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\SelectingOutline.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(2),
            minHeight = HEIGHT(2),
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
            visibility = {"AVF_Selecting"},
        },
    },
}

-----------------------------------------------------------------------------
--ATISubSystemAllied:
-----------------------------------------------------------------------------
subsystemAllied =
{
    healthColourOK = AlliedColour,
    healthColourHurt = AlliedColourHurt,
    healthColourDying = AlliedColourDying,
    healthColourBGOK = {0.5, 0.5, 0.5, 1},
    healthColourBGHurt = {0.5, 0.5, 0.5, 1},
    healthColourBGDying = {0.5, 0.5, 0.5, 1},
    i00 = --healthOutline =
    {
    	-- colourParam = API_HealthBackgroundColour, -- originally not present
        mesh =
        {
            colour = {0.5, 0.5, 0.5, 1},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod",
                LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1
            plusX = WIDTH(46),
            plusY = HEIGHT(38),
            factorWidth = 0.2, --0.8
            factorHeight = 0.0375, --0
            minWidth = WIDTH(20),
            minHeight = HEIGHT(3),
            maxWidth = WIDTH(20),
            maxHeight = HEIGHT(3),
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
	        visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
        }
    },
    i01 = --healthContents =
    {
    	-- colourParam = API_HealthColour, -- originally not present
        floatParam = API_CurrentHealth,
        mesh =
        {
            colour = AlliedColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY", "clipRight"},
            LODs =
            {
                LOD2, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0, -- -1
            plusX = WIDTH(46),
            plusY = HEIGHT(38),
            factorWidth = 0.2, --0.8
            factorHeight = 0.0375, --0
            minWidth = WIDTH(20),
            minHeight = HEIGHT(3),
            maxWidth = WIDTH(20),
            maxHeight = HEIGHT(3),
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
	        visibility = {"AVF_MouseOver", "AVF_MainGameView"},
            visibility1 = {"AVF_Selected", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
        }
    },

    circle =
    {
        -- scaleParam = PPI_PingSize,
        mesh =
        {
            colour = AlliedColour, --EnemyColour, -- {1,0.9,0.2,1.0},
            lineWeight = .5,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Circle00.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = .1, --.1
            factorHeight = .1, --.1
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = WIDTH(75),
            maxHeight = HEIGHT(75),
            minATIArea = 0, --TINY, 0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView"},
            placementFlags = {"clampCentre", "orthogonal"},
	    },
	},
    subsystempointer = -- originally just "pointer"
    {
        mesh =
        {
            colour = AlliedColour, --EnemyColour, --{1,0.9,0.2,1.0}, {0,0.8,0.2,0.5},
            lineWeight = 1.0,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                1, "UI\\Pings\\Meshes\\Pointer00.hod",
            },
        },
        placement2D =
        {
            factorX = 0, --0 (good)
            factorY = 0, --0 (good)
            plusX = WIDTH(18), -- 16 (good) -- 16
            plusY = HEIGHT(20), -- 15 (good) -- 6
            factorWidth = 0, --1
            factorHeight = 0, -- 1
            minWidth = WIDTH(32),
            minHeight = HEIGHT(35),
            maxWidth = WIDTH(32),
            maxHeight = HEIGHT(35),
            minATIArea = 0, -- 0
            maxATIArea = HUGE,
            visibility = {"AVF_Selected", "AVF_MainGameView"},
            visibility1 = {"AVF_MouseOver", "AVF_MainGameView"},
    	    placementFlags = {"clampCentre"}, -- originally not present (but good idea though!) -- placementFlags = ("orthogonal"), --
        },
    },


    shipsubsystemName =
    {
        stringParam = API_ShipName,
        text =
        {
            colour = {1,1,1,1},
            renderFlags = {"justifyHorizCentre"},
	        dropshadow = 1,
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-40),
            factorWidth = 0, --0
            factorHeight = 0, --0
            minWidth = WIDTH(4),
            minHeight = HEIGHT(4),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = 0, -- TINY
            maxATIArea = HUGE,
            visibility = {"AVF_MouseOver", "AVF_PlayerName", "AVF_MainGameView"},
            placementFlags = {"attachToMouse"},
        }
    },
    playerName =
    {
        stringParam = API_PlayerName,
        -- colourParam = API_PlayerColour,
        text =
        {
            colour = {1,1,0,1},
	        dropshadow = 1,
            renderFlags = {"justifyHorizCentre"},
            LODs =
            {
                LOD0, "ATISmallFont",
                LOD1, "ATISmallFont",
                LOD2, "ATISmallFont"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = -1,
            plusX = 0,
            plusY = HEIGHT(-50),
            factorWidth = 0,
            factorHeight = 0,
            minWidth = WIDTH(8),
            minHeight = HEIGHT(8),
            maxWidth = 1,
            maxHeight = 1,
            minATIArea = TINY,
            maxATIArea = HUGE,
            visibility = {"AVF_MouseOver", "AVF_PlayerName", "AVF_MainGameView"},
            placementFlags = {"attachToMouse"},
        }
    },
    selectingOutline =
    {
        mesh =
        {
            colour = {0.0, 1.0, 1.0, 1.0},
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\SelectingOutline.hod",
            },
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(2),
            minHeight = HEIGHT(2),
            minATIArea = 0, --TINY
            maxATIArea = HUGE,
            visibility = {"AVF_Selecting"},
        },
    },
}

-----------------------------------------------------------------------------
--healthBars: procedural health "blocks"
-----------------------------------------------------------------------------
healthBars =
{
    {   --1 ship
        renderFlags = {"scaleX", "scaleY", "clipRight"},
        LODs =
        {
            LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
        }
    },
}

-----------------------------------------------------------------------------
--healthBarOutlines: procedural health block outlines
-----------------------------------------------------------------------------
healthBarOutlines =
{
    {   --1 ship
        renderFlags = {"scaleX", "scaleY"},
        LODs =
        {
            LOD3, "UI\\ATI\\Meshes\\HealthBlocks1.hod"
        }
    },
}

-----------------------------------------------------------------------------
--ATISphereRangeModifierAllied:
-----------------------------------------------------------------------------
sphereRangeModifierAllied =
{
    -- 3D meshes are procedurally coloured for sphere range modifiers
    sphere =
    {
        colourParam = API_CommandColour,
        scaleParam = API_Radius,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                LOD0, "UI\\Meshes\\Sphere00.hod",
                LOD1, "UI\\Meshes\\Sphere01.hod",
                LOD2, "UI\\Meshes\\Sphere02.hod",
                LOD3, "UI\\Meshes\\Sphere03.hod",
            }
        },
        placement3D =
        {
	    visibility1 = {"AVF_TO_SphereModifier"},
	    visibility2 = {"AVF_Selected"},
            visibility3 = {"AVF_MouseOver"},
        }
    },

    spherebillboard =
    {
     colourParam = API_CommandColour,
        scaleParam = API_Radius,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                LOD0, "UI\\Meshes\\Sphere00.hod",
                LOD1, "UI\\Meshes\\Sphere01.hod",
                LOD2, "UI\\Meshes\\Sphere02.hod",
                LOD3, "UI\\Meshes\\Sphere03.hod",
            }
        },
        placement3D =
        {
	        placementFlags = {"sprite3Axis"}, -- billboard this ring
	        visibility1 = {"AVF_TO_SphereModifier"},
	        visibility2 = {"AVF_Selected"},
            visibility3 = {"AVF_MouseOver"},
	    },
    },
}

-----------------------------------------------------------------------------
--ATIRallyPoint:
-----------------------------------------------------------------------------
rallyPointScale = 200
rallyPointColour = {0,1,0,1.0}
rallyPoint =
{
    ring =
    {
      --  colourParam = API_CommandColour,
      --  scaleParam = API_Radius,
        mesh =
        {
            colour = rallyPointColour,
            lineWeight = 1.0,
            LODs =
            {
                LOD0, "UI\\Meshes\\Sphere00.hod",
            }
        },
        placement3D =
        {
            scale = {rallyPointScale * 0.75, rallyPointScale * 0.5, rallyPointScale * 0.75},
            visibility = {},
        }
    },
    flagWireframe =
    {
        mesh =
        {
            colour = rallyPointColour,
            lineWeight = 1.0,
            LODs =
            {
                LOD0, "UI\\ATI\\Meshes\\FlagWireframe.hod"
            }
        },
        placement3D =
        {
            scale = {rallyPointScale, rallyPointScale, rallyPointScale},
            placementFlags = {"spriteYAxis"},
            visibility = {},
        }
    },
}

