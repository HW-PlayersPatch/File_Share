-- =============================================================================
-- Name    : Blobs.lua
-- Purpose : Description of blob ATI templates.  Refer to ATI.lua for details
--              on formats.
--
-- Created date by lmoloney
-- Copyright Relic Entertainment, Inc.  All rights reserved.
-- =============================================================================

--basic colours
FriendlyColour = {0,1,0,1.0}
AlliedColour = {1,1,0,1.0}
EnemyColour = {1,0,0,1.0}
ResourceTOColour = {1,1,1,1.0}
Procedural = {0,0,0,0}

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
HUGE = 1.0
LOD0 = AREA(120,200)
LOD1 = AREA(64,128)
LOD2 = AREA(32,64)
LOD3 = AREA(16,32)
TINY = AREA(1,1)

--LOD0 = AREA(120,200)
--LOD1 = AREA(64,128)
--LOD2 = AREA(32,64)
--LOD3 = AREA(16,32)
--TINY = AREA(1,1)

--thes flags from ATI.h
AVF_NotVisible              = 2048
AVF_Visible                 = 4096

--blob ATI template parameter indices
BPI_BlobColour              = 0             --colour of main blob
BPI_FootColour              = 1             --colour of blob foot
BPI_FootScale               = 2             --size of foot
BPI_EquatorColour           = 3             --colour of blob/world plane intersection
BPI_EquatorPosition         = 4             --position of blob/world plane intersection
BPI_EquatorScale            = 5             --scale of blob/world plane intersection
BPI_RUCount                 = 7             --for resource blobs
BPI_BlobName                = 8             --for named blobs
BPI_BlobNameColour          = 9             --text colour for named blobs
BPI_NumberParams            = 10

--MetaSelTarg creation priorities.  If NoPriority, blob will not create a MetaSelTarg
NoPriority                  = 0
LowPriority                 = 10
MediumPriority              = 50
HighPriority                = 75

-----------------------------------------------------------------------------
--  Misc. Tunables
-----------------------------------------------------------------------------
sbFarthestBlob              = 1.5 --1.5            --multiplied by distance from origin to get far depth queing range
sbNearestBlob               = 0.0000001 --0.1          --same, for near depth queuing range

-----------------------------------------------------------------------------
--  friendlies - Blobs with friendlies in them
-----------------------------------------------------------------------------
friendlies =
{
    colourNear       		= {0.008, 0.2, 1.0, 1.0}, --{0, 0.2, 0.78, 1.0},
    colourFar        		= {0, 0.0274, 0.25, 1.0}, --{0, 0, .18, 1.0},
    colourMouseOverNear     = {0.008, 0.2, 1.0, 1.0}, --{0, 0.2, 0.78, 1.0},
    colourMouseOverFar      = {0, 0.0274, 0.25, 1.0}, --{0, 0, .18, 1.0},
    colourFootNear          = {0.38, 0.45, 1, 1}, --{0, 0, 1, 1},
    colourFootFar           = {0.38, 0.45, 1, 1}, -- {0, 0, .5, 1},
    colourMouseOverFootNear = {0,1,1,1}, -- {1,1,0,1},
    colourMouseOverFootFar  = {0,1,1,1}, --{0.6,0.6,0,1},
    colourEquatorNear       = {0.38, 0.45, 1, 1}, --{0, 1, 1, 1},
    colourEquatorFar        = {0.38, 0.45, 1, 1}, --{0, 1, 1, 1},
    equatorScale            = 0.98,
    protrude                = 0.40,
    borderPadding           = 200,
    metaSelPriority         = NoPriority,
    blobColourCurve         = 0.5, --2
    blobInsideRadius        = 1.5,
    blob =
    {                                                                   --the actual blob of the blob
        colourParam = BPI_BlobColour,
        mesh =
        {
            lineWeight = 1.0,
            texture = "Data:UI\\SensorsManager\\Meshes\\SensorsBlobHalo.tga",
			surface = "ovr_texrgb_blob",
            LODs =
            {
                LOD0,"UI\\SensorsManager\\Meshes\\SensorsBlobNear.hod",
                LOD1,"UI\\SensorsManager\\Meshes\\SensorsBlobFar.hod",
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1.0, 1.0, 1.0},
            placementFlags = {"sprite3Axis"},
            visibility = {0},
            invisibility = {"BVF_Foreground"},
            invisibility1 = {"BVF_Inside"},
        }
    },
    sphereInsideOut =
    {                                                                   --the actual blob of the blob
        colourParam = BPI_BlobColour,
        mesh =
        {
            lineWeight = 1.0,
			surface = "ovr_rgb_blob",
            LODs =
            {
                1,"UI\\Meshes\\SensorSphereInside.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1.0, 1.0, 1.0},
            visibility = {"BVF_Inside"},
            invisibility = {"BVF_Foreground"},
        }
    },
    foot =
    {                                                                   --the movement blob
        colourParam = BPI_FootColour,
        scaleParam = BPI_FootScale,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                1, "UI\\Meshes\\Foot.hod"
            }
        },
        placement3D =
        {
            scale = {100, 1, 100},
            visibility = {"BVF_Foreground"},
        },
    },
--~     blobName =
--~     {
--~         stringParam = BPI_BlobName,
--~         colourParam = BPI_BlobNameColour,
--~         text =
--~         {
--~             colour = {1,1,1,1},
--~             renderFlags = {"justifyHorizCentre", "justifyTop"},
--~             LODs =
--~             {
--~                 LOD0, "ATISmallFont",
--~                 LOD1, "ATISmallFont",
--~                 LOD2, "ATISmallFont"
--~             },
--~         },
--~         placement2D =
--~         {
--~             factorX = 0,
--~             factorY = -1,
--~             plusX = 0,
--~             plusY = 0,
--~             factorWidth = 0,
--~             factorHeight = 0,
--~             minWidth = WIDTH(8),
--~             minHeight = HEIGHT(8),
--~             maxWidth = HUGE,
--~             maxHeight = HUGE,
--~             minATIArea = TINY,
--~             maxATIArea = HUGE,
--~             visibility = {"BVF_Foreground", "BVF_BlobName"},
--~         },
--~     },
}

-----------------------------------------------------------------------------
--  allies - blobs with no friendlies, but allies with shared vision
-----------------------------------------------------------------------------
allies =
{
    colourNear       		= {0.008, 0.2, 1.0, 1.0}, --{0, 0.2, 0.78, 1.0},
    colourFar        		= {0, 0.0274, 0.25, 1.0}, --{0, 0, .18, 1.0},
    colourMouseOverNear     = {0.008, 0.2, 1.0, 1.0}, --{0, 0.2, 0.78, 1.0},
    colourMouseOverFar      = {0, 0.0274, 0.25, 1.0}, --{0, 0, .18, 1.0},
    colourFootNear          = {0.38, 0.45, 1, 1}, --{0, 0, 1, 1},
    colourFootFar           = {0.38, 0.45, 1, 1}, -- {0, 0, .5, 1},
    colourMouseOverFootNear = {0,1,1,1}, -- {1,1,0,1},
    colourMouseOverFootFar  = {0,1,1,1}, --{0.6,0.6,0,1},
    colourEquatorNear       = {0.38, 0.45, 1, 1}, --{0, 1, 1, 1},
    colourEquatorFar        = {0.38, 0.45, 1, 1}, --{0, 1, 1, 1},
    equatorScale            = 0.98,
    protrude                = 0.40,
    borderPadding           = 200,
    metaSelPriority         = NoPriority,
    blobColourCurve         = 0.5, --2
    blobInsideRadius        = 1.5,
    blob =
    {                                                                   --the actual blob of the blob
        colourParam = BPI_BlobColour,
        mesh =
        {
            lineWeight = 1.000,
            texture = "Data:UI\\SensorsManager\\Meshes\\SensorsBlobHalo.tga",
			surface = "ovr_texrgb_blob",
            LODs =
            {
                LOD0,"UI\\SensorsManager\\Meshes\\SensorsBlobNear.hod",
                LOD1,"UI\\SensorsManager\\Meshes\\SensorsBlobFar.hod",
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1.0, 1.0, 1.0},
            placementFlags = {"sprite3Axis"},
            visibility = {0},
            invisibility = {"BVF_Foreground"},
            invisibility1 = {"BVF_Inside"},
        }
    },
    sphereInsideOut =
    {                                                                   --the actual blob of the blob
        colourParam = BPI_BlobColour,
        mesh =
        {
            lineWeight = 1.0,
			surface = "ovr_rgb_blob",
            LODs =
            {
                1,"UI\\Meshes\\SensorSphereInside.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1.0, 1.0, 1.0},
            visibility = {"BVF_Inside"},
            invisibility = {"BVF_Foreground"},
        }
    },
    foot =
    {                                                                   --the movement blob
        colourParam = BPI_FootColour,
        scaleParam = BPI_FootScale,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                1, "UI\\Meshes\\Foot.hod"
            }
        },
        placement3D =
        {
            scale = {100, 1, 100},
            visibility = {"BVF_Foreground"},
        },
    },
--~     blobName =
--~     {
--~         stringParam = BPI_BlobName,
--~         text =
--~         {
--~             colour = {1,1,1,1},
--~             renderFlags = {"justifyHorizCentre", "justifyTop"},
--~             LODs =
--~             {
--~                 LOD0, "ATISmallFont",
--~                 LOD1, "ATISmallFont",
--~                 LOD2, "ATISmallFont"
--~             },
--~         },
--~         placement2D =
--~         {
--~             factorX = 0,
--~             factorY = -1,
--~             plusX = 0,
--~             plusY = 0,
--~             factorWidth = 0,
--~             factorHeight = 0,
--~             minWidth = WIDTH(8),
--~             minHeight = HEIGHT(8),
--~             maxWidth = HUGE,
--~             maxHeight = HUGE,
--~             minATIArea = TINY,
--~             maxATIArea = HUGE,
--~             visibility = {"BVF_Foreground", "BVF_BlobName"},
--~         },
--~     },
}

-----------------------------------------------------------------------------
--  enemies - blobs with enemies
-----------------------------------------------------------------------------
enemies =
{
--~     blobName =
--~     {
--~         stringParam = BPI_BlobName,
--~         text =
--~         {
--~             colour = {1,1,1,1},
--~             renderFlags = {"justifyHorizCentre", "justifyTop"},
--~             LODs =
--~             {
--~                 LOD0, "ATISmallFont",
--~                 LOD1, "ATISmallFont",
--~                 LOD2, "ATISmallFont"
--~             },
--~         },
--~         placement2D =
--~         {
--~             factorX = 0,
--~             factorY = -1,
--~             plusX = 0,
--~             plusY = 0,
--~             factorWidth = 0,
--~             factorHeight = 0,
--~             minWidth = WIDTH(8),
--~             minHeight = HEIGHT(8),
--~             maxWidth = HUGE,
--~             maxHeight = HUGE,
--~             minATIArea = TINY,
--~             maxATIArea = HUGE,
--~             visibility = {"BVF_Foreground", "BVF_BlobName"},
--~         },
--~     },
}

-----------------------------------------------------------------------------
--  resources - blobs with resources
-----------------------------------------------------------------------------
resources =
{
    colourNear       		= {0.55, 0.29, 0.03, 0.5},
    colourFar        		= {0.55, 0.29, 0.03, 0.2},
    colourMouseOverNear     = {0.55, 0.29, 0.03, 1.0}, -- {1,1,1,0.35},
    colourMouseOverFar      = {0.55, 0.29, 0.03, 1.0},--{.8, .8, .8, 0.35},
    colourFootNear          = {0.55, 0.29, 0.03, 1.0}, --{0.55, 0.29, 0.03, 1.0},
    colourFootFar           = {0.55, 0.29, 0.03, 0.5}, --{0.55, 0.29, 0.03, 0.5},
    colourMouseOverFootNear = {1,1,1,1}, -- {1,1,0,1},
    colourMouseOverFootFar  = {0,0,0,1}, --{0.6,0.6,0,1},
    colourEquatorNear       = {0,0,0,0},
    colourEquatorFar        = {0,0,0,0},
    RUFormatString          = "$6050",
    protrude                = 0.75,
    borderPadding           = 300,
    clickable               = 1,
    bandboxable             = 1,
    metaSelPriority         = LowPriority,
    blobColourCurve         = 0.5, --2
    foot =
    {                                                                   --the movement foot for the blob
        colourParam = BPI_FootColour,
        scaleParam = BPI_FootScale,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                1, "UI\\Meshes\\Foot.hod"
            }
        },
        placement3D =
        {
            scale = {100, 1, 100},
            visibility = {"BVF_Foreground", "BVF_MovementMode"},
        },
    },
    mouseOverFoot =
    {                                                                   --the foot when moused over
        colourParam = BPI_FootColour,
        scaleParam = BPI_FootScale,
        mesh =
        {
            lineWeight = 1.0,
            LODs =
            {
                1, "UI\\Meshes\\Foot.hod"
            }
        },
        placement3D =
        {
            scale = {100, 1, 100},
            visibility = {"BVF_Foreground", "BVF_MouseOver"},
        },
    },
--  RUCount =
--  {
--      stringParam = BPI_RUCount,
--      text =
--      {
--          colour = {1,0.478,0.361,1}, --{1.0,0.349,0.199,1},--{1,1,1,1},
--          renderFlags = {"justifyLeft"},
--          LODs =
--          {
--              LOD0, "ATISmallFont",
--              LOD1, "ATISmallFont",
--              LOD2, "ATISmallFont"
--          },
--      },
--      placement2D =
--      {
--          factorX = 1,
--          factorY = 0,
--          plusX = 0,
--          plusY = 0,
--          factorWidth = 0,
--          factorHeight = 0,
--          minWidth = WIDTH(8),
--          minHeight = HEIGHT(8),
--          maxWidth = HUGE,
--          maxHeight = HUGE,
--          minATIArea = TINY,
--          maxATIArea = HUGE,
--          visibility = {"BVF_Foreground", "BVF_MouseOver", "AVF_Visible", "BVF_RUCount"},
--      },
--  },
--  mouseOver =
--  {                                                                   --intersection of blob and world plane
--      colourParam = {1,1,1,1}, --colourParam = {1,1,1,1},
--      scaleParam = BPI_EquatorScale,
--      mesh =
--      {
--          lineWeight = 1.0,
--          LODs =
--          {
--              LOD0, "UI\\Meshes\\Equator00.hod",
--              LOD1, "UI\\Meshes\\Equator01.hod",
--              LOD2, "UI\\Meshes\\Equator02.hod",
--              LOD3, "UI\\Meshes\\Equator03.hod",
--          }
--      },
--      placement3D =
--      {
--          visibility = {"BVF_Foreground"}, BVF_MouseOver
--      }
--  },
}

-----------------------------------------------------------------------------
--  unknownEnemy - groups of unidentified enemies
-----------------------------------------------------------------------------
unknownEnemy =
{
    borderPadding           = 2000,
    protrude                = 0.5,
    clickable               = 1,
    bandboxable             = 1,
    metaSelPriority         = LowPriority,
    unidentified =
    {
        mesh =
        {
            colour = EnemyColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\TacticalIcons\\Meshes\\Circle.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(4),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(4),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            placementFlags = {"orthogonal"},
            visibility = {0},
        }
    },
    mouseOver =
    {                                                                   --intersection of blob and world plane
        colourParam = {1,1,1,1},
        scaleParam = BPI_EquatorScale,
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
            visibility = {"BVF_Foreground", "BVF_MouseOver"}
        }
    },
}

-----------------------------------------------------------------------------
--  battle - groups of ships involved in a battle
--      These blobs create pings.  See pings.lua for actual rendering template
-----------------------------------------------------------------------------
battle =
{
    borderPadding           = 8000,
    protrude                = 0.5,
    clickable               = 1,
    metaSelPriority         = NoPriority,
    notUsed =
    {
        mesh =
        {
            colour = EnemyColour,
            lineWeight = 1,
            renderFlags = {"scaleX", "scaleY"},
            LODs =
            {
                LOD0, "UI\\TacticalIcons\\Meshes\\Circle.hod"
            }
        },
        placement2D =
        {
            factorX = 0,
            factorY = 0,
            plusX = 0,
            plusY = 0,
            factorWidth = 1,
            factorHeight = 1,
            minWidth = WIDTH(4),
            minHeight = HEIGHT(4),
            maxWidth = WIDTH(4),
            maxHeight = HEIGHT(4),
            minATIArea = TINY,
            maxATIArea = HUGE,
            placementFlags = {"orthogonal"},
            visibility = {0},
        }
    },
}

