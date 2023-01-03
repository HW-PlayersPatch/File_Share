--=========================== Sensors Manager Tweaks ==============================

smTwkBlinkTime                      = 0.3                                   -- how fast the dots in the SM blink
smTwkZoomTime                       = 0.5                                   -- how many seconds it takes the SM to transition
smTwkZoomMainView                   = 0.5                                   --how much of that time it's in the main game view versus the SM
smTwkZoomOutDistance                = 12000                                 -- initial SM zoom out distance
smTwkMinZoomOutDistance             = 10000                                 -- minimum SM zoom distance.  Must be greater than the max in-game zoom.  Used if not set in the .level file
smTwkMaxZoomOutDistance             = 45000                                 -- maximum SM zoom distance.  Used if not set in the .level file
smTwkNearClipPlane                  = 4000                                  -- SM near clip plane
smTwkFarClipPlane                   = 200000                                -- SM far clip plane, won't see anything farther than this
smTwkFocusCull                      = 10000                                 --cull distance when returning from the SM
smTwkMaxMovementDistance            = 60000                                 -- how far can we move in the SM
smTwkWidescreen                     = 1                                     -- is the SM letterboxed?

smTwkBlinkTransitionTime            = 0.07                                  -- normalized transition between on and off states
smTwkBlinkOnFraction                = 0.8                                   -- fraction of time spent in the on state

smTwkHighlightMaxAlpha		    = 0.3				    -- SM highlight alpha [0..1]


friendlyPixelColour                 = {0.0, 1.0, 0.0, 1.0}                  -- colour of a friendly ship in the SM
alliedPixelColour                   = {1.0, 1.0, 0.0, 1.0}                  -- colour of an allied ship in the SM
enemyPixelColour                    = {1.0, 0.0, 0.0, 1.0}                  -- colour of an enemy ship in the SM
neutralPixelColour                  = {0.9, 0.9, 0.3, 1.0}                  -- colour of an neutral ship in the SM.  Will this be used?
friendlyPixelSize                   = 3.0                                   -- size of pixel for friendly ships
alliedPixelSize                     = 3.0                                   -- size of pixel for allied ships
enemyPixelSize                      = 3.0                                   -- size of pixel for enemy ships
missilePixelSize                    = 3.0                                   -- the size of non-mesh ResourcePatches in the SM
missilePixelColour                  = {1.0, 1.0, 0.199, 1.0}                -- colour that resource patches are drawn in the SM.
miscPixelSize                       = 2.0                                   -- the size of non-mesh misc things in the SM
miscPixelColour                     = {1.0, 1.0, 1.0, 1.0}                  -- colour that misc things are drawn in the SM.

worldPlaneColour                    = {0.64,0.46,0,0.2}                     --colour of the world plane (will be scaled during zoom-out)
worldLineColour                     = {0.64,0.46,0,1}                       --colour of world plane lines (will be scaled during zoom)
worldPlaneToWorldBoundSize          = 1.0                                   --ratio of world plane to world bound max axis
horizonToCameraZoom                 = 3.0                                   --ratio of camera max zoom to horizon distance.  Scales during zoom.

letterboxAspect                     = 1.5

smWorldplaneFlashOnTime             = 0.25                                  --duration and duty cycle of world plane flash
smWorldplaneFlashOffTime            = 0.25

--Sensors manager ATI parameter indices:
SPI_WorldPlaneScale     = 1
SPI_HorizonLineScale    = 2
SPI_HorizonOrigin       = 3
SPI_WorldPlaneColour    = 4
SPI_WorldLineColour     = 5

horizonRadius           = 120000
horizonHeight           = 0.07
horizonNumberScale      = 0.07
horizonNumberAspect     = 1.6

worldGraphics =
{
    --worldPlaneLines =
    {
        scaleParam = SPI_WorldPlaneScale,
        --positionParam = SPI_HorizonOrigin,
        colourParam = SPI_WorldLineColour,
        mesh =
        {
            colour = {0.64,0.46,0,1},
            lineWeight = 1.0,
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\WorldPlaneWireframe.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1,1,1},
            --placementFlags = {"absolute"},
            visibility = {0},
            invisibility = {"SVF_FlashOff"},
        }
    },
    --worldPlaneAbove =
    {
        scaleParam = SPI_WorldPlaneScale,
        --positionParam = SPI_HorizonOrigin,
        colourParam = SPI_WorldPlaneColour,
        mesh =
        {
            colour = {0.64,0.46,0,0.2},
--          texture = "data:UI\\SensorsManager\\Meshes\\disc_tex.tga",
            lineWeight = 1.0,
			surface = "ovr_rgb_disc",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\DiskAbove.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1,1,1},
            --placementFlags = {"absolute"},
            visibility = {"SVF_Above"},
            invisibility = {"SVF_FlashOff"},
        }
    },
    --compassNumbersAbove =
    {
        scaleParam = SPI_WorldPlaneScale,
        --positionParam = SPI_HorizonOrigin,
        colourParam = SPI_WorldLineColour,
        mesh =
        {
            colour = {1,1,1,1},
            texture = "data:UI\\SensorsManager\\Meshes\\CompassNumbers.tga",
            lineWeight = 1.0,
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\CompassNumbersAbove.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1,1,1},
            --placementFlags = {"absolute"},
            visibility = {"SVF_Above"},
            invisibility = {"SVF_FlashOff"},
        }
    },
    --compassNumbersBelow =
    {
        scaleParam = SPI_WorldPlaneScale,
        --positionParam = SPI_HorizonOrigin,
        colourParam = SPI_WorldLineColour,
        mesh =
        {
            colour = {1,1,1,1},
            texture = "data:UI\\SensorsManager\\Meshes\\CompassNumbers.tga",
            lineWeight = 1.0,
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\CompassNumbersBelow.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1,1,1},
            --placementFlags = {"absolute"},
            visibility = {"SVF_Below"},
            invisibility = {"SVF_FlashOff"},
        }
    },
    --worldPlaneBelow =
    {
        scaleParam = SPI_WorldPlaneScale,
        --positionParam = SPI_HorizonOrigin,
        colourParam = SPI_WorldPlaneColour,
        mesh =
        {
            colour = {0.64,0.46,0,0.2},
            lineWeight = 1.0,
			surface = "ovr_rgb_disc",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\DiskBelow.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1,1,1},
            --placementFlags = {"absolute"},
            visibility = {"SVF_Below"},
            invisibility = {"SVF_FlashOff"},
        }
    },
    --horizonAbove =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        colourParam = SPI_WorldLineColour,
        mesh =
        {
            colour = {0.64,0.46,0,1},
            lineWeight = 1.0,
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\HorizonAbove.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1,1,1},
            --placementFlags = {"absolute"},
            visibility = {"SVF_Above"},
        }
    },
    --horizonBelow =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        colourParam = SPI_WorldLineColour,
        mesh =
        {
            colour = {0.64,0.46,0,1},
            lineWeight = 1.0,
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\HorizonBelow.hod"
            }
        },
        placement3D =
        {
            position = {0,0,0},
            scale = {1,1,1},
            --placementFlags = {"absolute"},
            visibility = {"SVF_Below"},
        }
    },
--  sin/cos chart for degrees up to 360 by 10s:
--  0	0.0000	1.0000
--  10	0.1736	0.9848
--  20	0.3420	0.9397
--  30	0.5000	0.8660
--  40	0.6428	0.7660
--  50	0.7660	0.6428
--  60	0.8660	0.5000
--  70	0.9397	0.3420
--  80	0.9848	0.1736
--  90	1.0000	0.0000
--  100	0.9848	-0.1736
--  110	0.9397	-0.3420
--  120	0.8660	-0.5000
--  130	0.7660	-0.6428
--  140	0.6428	-0.7660
--  150	0.5000	-0.8660
--  160	0.3420	-0.9397
--  170	0.1736	-0.9848
--  180	0.0000	-1.0000
--  190	-0.1736	-0.9848
--  200	-0.3420	-0.9397
--  210	-0.5000	-0.8660
--  220	-0.6428	-0.7660
--  230	-0.7660	-0.6428
--  240	-0.8660	-0.5000
--  250	-0.9397	-0.3420
--  260	-0.9848	-0.1736
--  270	-1.0000	0.0000
--  280	-0.9848	0.1736
--  290	-0.9397	0.3420
--  300	-0.8660	0.5000
--  310	-0.7660	0.6428
--  320	-0.6428	0.7660
--  330	-0.5000	0.8660
--  340	-0.3420	0.9397
--  350	-0.1736	0.9848

--*********** Compass numbers from above
    --compass000 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\000.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.0000, horizonHeight, -1.0000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass020 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\020.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.3420, horizonHeight, -0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass040 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\040.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.6428, horizonHeight, -0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass060 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\060.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.8660, horizonHeight, -0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass080 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\080.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.9848, horizonHeight, -0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass100 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\100.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.9848, horizonHeight, 0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass120 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\120.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.8660, horizonHeight, 0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass140 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\140.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.6428, horizonHeight, 0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass160 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\160.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.3420, horizonHeight, 0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass180 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\180.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.0000, horizonHeight, 1.0000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass200 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\200.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.3420, horizonHeight, 0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass220 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\220.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.6428, horizonHeight, 0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass240 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\240.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.8660, horizonHeight, 0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass260 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\260.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.9848, horizonHeight, 0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass280 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\280.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.9848, horizonHeight, -0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass300 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\300.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.8660, horizonHeight, -0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass320 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\320.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.6428, horizonHeight, -0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },
    --compass340 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\340.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.3420, horizonHeight, -0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Above"},
        }
    },

--**************** Compass numbers from below
    --compass000 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\000.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.0000, -horizonHeight, -1.0000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass020 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\020.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.3420, -horizonHeight, -0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass040 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\040.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.6428, -horizonHeight, -0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass060 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\060.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.8660, -horizonHeight, -0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass080 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\080.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.9848, -horizonHeight, -0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass100 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\100.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.9848, -horizonHeight, 0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass120 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\120.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.8660, -horizonHeight, 0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass140 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\140.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.6428, -horizonHeight, 0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass160 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\160.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.3420, -horizonHeight, 0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass180 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\180.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {0.0000, -horizonHeight, 1.0000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass200 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\200.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.3420, -horizonHeight, 0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass220 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\220.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.6428, -horizonHeight, 0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass240 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\240.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.8660, -horizonHeight, 0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass260 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\260.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.9848, -horizonHeight, 0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass280 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\280.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.9848, -horizonHeight, -0.1736},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass300 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\300.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.8660, -horizonHeight, -0.5000},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass320 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\320.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.6428, -horizonHeight, -0.7660},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
    --compass340 =
    {
        scaleParam = SPI_HorizonLineScale,
        --positionParam = SPI_HorizonOrigin,
        mesh =
        {
            texture = "data:UI\\SensorsManager\\Meshes\\340.tga",
			surface = "ovr_texrgb_num",
            LODs =
            {
                1,"UI\\SensorsManager\\Meshes\\Billboard.hod"
            }
        },
        placement3D =
        {
            position = {-0.3420, -horizonHeight, -0.9397},
            scale = {horizonNumberScale, horizonNumberScale / horizonNumberAspect, horizonNumberScale},
            placementFlags = {"scaledPos", "spriteYAxis"},
            visibility = {"SVF_Below"},
        }
    },
}

