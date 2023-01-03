--===========================================================================
--  Purpose : Lua definition file for Homeworld subtitles.
--            Contains information for themes and regions for the subtitling
--            system.
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================
-- code hookup in subtitle.h


----------------------------------------------------------------------
--addTheme(themeNumber, {colour}, fadeIn, fadeOut [, playerColour, bitmapBaseName, numBitmaps])

--theme 0: default for actor 0 (Fleet Intel)
addTheme(0, {255,255,255}, 0.1, 0.1, 1,"fleetintel#.tga",1)
--theme 1: default for actor 1 (Fleet Command)
addTheme(1, {255,255,255}, 0.1, 0.1, 1,"fleetcommand#.tga",1)
--theme 2: default for actor 2 (Makaan)
addTheme(2, {255,255,255}, 0.1, 0.1, 1,"makaan#.tga",1)
--theme 3: default for actor 3 (Keeper)
addTheme(3, {255,255,255}, 0.1, 0.1, 1,"keeper#.tga",1)
--theme 4: default for actor 4 (Chimera)
addTheme(4, {255,255,255}, 0.1, 0.1, 1,"chimera#.tga",1)
--theme 5: default for actor 5 (Bentusi)
addTheme(5, {255,255,255}, 0.1, 0.1, 1,"bentusi#.tga",1)
--theme 6: default for actor 6 (Talorn)
addTheme(6, {255,255,255}, 0.1, 0.1, 1,"talorn#.tga",1)
--theme 7: default for actor 7 (Bishop)
-- replace allships# with Bishop.tga
addTheme(7, {255,255,255}, 0.1, 0.1, 1,"bishop#.tga",1)
--theme 8: default for actor 8 (Shipyard)
addTheme(8, {255,255,255}, 0.1, 0.1, 1,"shipyard#.tga",1)
--theme 9: default for actor 9 (Tanis)
addTheme(9, {255,255,255}, 0.1, 0.1, 1,"tanis#.tga",1)
--theme 10: default for actor 10 (AllShips1)
addTheme(10, {255,255,255}, 0.1, 0.1, 1,"allships#.tga",1)
--theme 11: default for actor 11 (AllShips2)
addTheme(11, {200,160,255}, 0.2, 0.2, 0, "",0)
--theme 12: default for actor 12 (AllShips3)
addTheme(12, {200,160,255}, 0.2, 0.2, 0, "",0)
--theme 13(0xd): default for time counters
addTheme(13, {255,255,255}, 0.2, 0.2, 0, "",0)
--theme 14(0xe): for close captions
addTheme(14, {255,255,255}, 0.2, 0.2, 0, "",0)
--theme 15(0xf): default for location cards
addTheme(15, {255,255,255}, 0.5, 0.5, 1, "fleetintel#.tga",1)


-- HW1 Actor Themes
addTheme(16, {255,255,255}, 0.1, 0.1, 1,"HW1_FleetCommand#.tga",1)
addTheme(17, {255,255,255}, 0.1, 0.1, 1,"HW1_FleetIntel#.tga",1)
addTheme(18, {255,255,255}, 0.1, 0.1, 1,"HW1_BentusiTraders#.tga",1)
addTheme(19, {255,255,255}, 0.1, 0.1, 1,"HW1_Kadesh#.tga",1)
addTheme(20, {255,255,255}, 0.1, 0.1, 1,"HW1_AllShipsEnemy#.tga",1)
addTheme(21, {255,255,255}, 0.1, 0.1, 1,"HW1_Ambassador#.tga",1)
addTheme(22, {255,255,255}, 0.1, 0.1, 1,"HW1_Defector#.tga",1)
addTheme(23, {255,255,255}, 0.1, 0.1, 1,"HW1_Emperor#.tga",1)
addTheme(24, {255,255,255}, 0.1, 0.1, 1,"HW1_KharSelim#.tga",1)

addTheme(25, {255,255,255}, 0.1, 0.1, 1,"dreadnaught#.tga",1)  -- Dreadnaught icon
addTheme(26, {255,255,255}, 0.1, 0.1, 1,"HW1_scaffold#.tga",1)

-- Generic open actor slots for modders
addTheme(27, {255,255,255}, 0.1, 0.1, 0,"",0)
addTheme(28, {200,160,255}, 0.1, 0.1, 0, "",0)
addTheme(29, {200,160,255}, 0.1, 0.1, 0, "",0)
addTheme(30, {255,255,255}, 0.1, 0.1, 0, "",0)
addTheme(31, {255,255,255}, 0.1, 0.1, 0, "",0)
--addTheme(32, {255,255,255}, 0.1, 0.1, 0, "",0)
----------------------------------------------------------------------
--addRegion(regionNumber, textName, iconName)

--region 0: for NIS's
addRegion( 0, "Region0_Text", "", "" )
--region 1: for messages over the letterbox bar at the top of the screen
addRegion( 1, "Region1_Text", "Region1_Icon", "Region1_TextNarrow" )
--region 2: for close captions
addRegion( 2, "Region2_Text", "", "" )
--region 3: for location cards (centred on the screen)
addRegion( 3, "Region3_Text", "", "" )
-- region 4: for time counter
addRegion( 4, "Region4_Text", "", "" )
-- region 5: for general messages
addRegion( 5, "Region5_Text", "", "" )
-- region 6: letter box for animatics
addRegion( 6, "Region6_Text", "", "" )
