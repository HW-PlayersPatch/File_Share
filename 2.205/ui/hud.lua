--===========================================================================
--  Name    : hud.lua
--  Purpose : Lua definition file for Homeworld 2 HUD.
--            Contains various tweakable parameters for the hud
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

SelectionListWindow_fontName           = "HUDFont" -- (not the filename) font name used to display string in the selection list window
SelectionListWindow_dropShadowID       = 1              -- drop shadow ID (ie: none = 0)
SelectionListWindow_selectionColour    = {1,1,1,1}      -- font colour of the selection (neutral)
SelectionListWindow_friendlyShipColour = {0,1,0,1}      -- pan box: font colour of the friendly ship
SelectionListWindow_allyShipColour     = {0,0,1,1}      -- pan box: font colour of the ally ship
SelectionListWindow_enemyShipColour    = {1,0,0,1}      -- pan box: font colour of the enemy's ship
SelectionListWindow_seizableShipColour = {1,0,1,1}		-- pan box: font colour of seizable ship
SelectionListWindow_resourceColour     = {1,1,0,1}      -- pan box: font colour of resources
SelectionListWindow_isUpperCase        = 1              -- display the name in upper case or if false use the default name

HotkeyGroup_fontName           = "HUDFontBold"     -- (not the filename) font name used to display string in the hotkey group window
HotkeyGroup_dropShadowID       = 1                      -- drop shadow ID (ie: none = 0)
HotkeyGroup_shipInsideColour   = {1,1,1,1}              -- font colour when there's ship inside the group
HotkeyGroup_noShipInsideColour = {1,1,1,0.5}            -- font colour when there's NO ship inside the group
HotkeyGroup_numberGroupIcons   = 0                     -- number of group icon on screen


UtilityWindow_HeaderFontName         = "HUDFontBold"  -- font name used to display string (not the filename)
UtilityWindow_HeaderDropShadowID     =  1              -- drop shadow ID (ie: none = 0)
UtilityWindow_HeaderFontColour       =  {1,1,0.8984375,1}    -- font colour
UtilityWindow_HeaderIsUpperCase      =  1              -- display the name in upper case or if false use the default name
UtilityWindow_HeaderIndent           =  " "            -- indent for all headers in the menu

UtilityWindow_ClassFontName          = "HUDFontBold"  -- font name used to display string (not the filename)
UtilityWindow_ClassDropShadowID      = 1               -- drop shadow ID (ie: none = 0)
UtilityWindow_ClassFontColour        = {1,1,0.8984375,1}       -- font colour
UtilityWindow_ClassIsUpperCase       = 1               -- display the name in upper case or if false use the default name
UtilityWindow_ClassIndent            = " "             -- indent for all classes in the menu
UtilityWindow_ItemIndent             = "  "            -- indent for all items in the menu

UtilityWindow_BuildFontName          = "HUDFont"  -- font name used to display string (not the filename)
UtilityWindow_BuildDropShadowID      = 1               -- drop shadow ID (ie: none = 0)
UtilityWindow_BuildFontColour        = {1,1,0.8984375,1}       -- font colour
UtilityWindow_BuildIsUpperCase       = 0               -- display the name in upper case or if false use the default name

UtilityWindow_LaunchFontName         = "HUDFont"  -- font name used to display string (not the filename)
UtilityWindow_LaunchDropShadowID     = 1               -- drop shadow ID (ie: none = 0)
UtilityWindow_LaunchFontColour       = {1,1,0.8984375,1}       -- font colour
UtilityWindow_LaunchIsUpperCase      = 0               -- display the name in upper case or if false use the default name
UtilityWindow_LaunchOptionIsUpperCase= 1               -- display the name in upper case or if false use the default name

UtilityWindow_UpgradeFontName        = "HUDFont"  -- font name used to display string (not the filename)
UtilityWindow_UpgradeDropShadowID    = 1               -- drop shadow ID (ie: none = 0)
UtilityWindow_UpgradeFontColour      = {1,1,0.8984375,1}       -- font colour
UtilityWindow_UpgradeIsUpperCase     = 1               -- display the name in upper case or if false use the default name

UtilityWindow_AutoLaunchFontName        = "HUDFont"   -- (not the filename) font name used to display string's description in the ship info window
UtilityWindow_AutoLaunchDropShadowID    =  1                -- drop shadow ID (ie: none = 0)
UtilityWindow_AutoLaunchFontColour      =  {1,1,0.8984375,1}        -- font colour

UtilityWindow_CapacityFontName          = "HUDFont"   -- (not the filename) font name used to display string's description in the ship info window
UtilityWindow_CapacityDropShadowID      =  1                -- drop shadow ID (ie: none = 0)
UtilityWindow_CapacityFontColour        =  {1,1,0.8984375,1}        -- font colour

UtilityWindow_ActionsIsUpperCase        = 0                -- display the name in upper case or if false use the default name
                                                           -- for: ChatOption, Alliance and Connection
UtilityWindow_ChatOptionFontName        = "HUDFont"   -- (not the filename) font name used to display string's description in the ship info window
UtilityWindow_ChatOptionDropShadowID    =  1               -- drop shadow ID (ie: none = 0)
UtilityWindow_ChatOptionFontColour      =  {1,1,0.8984375,1}     -- font colour

UtilityWindow_PlayersFontName           = "HUDFont"   -- font name used to display string (not the filename)
UtilityWindow_PlayersDropShadowID       = 1                -- drop shadow ID (ie: none = 0)
UtilityWindow_PlayersFontColour         = {1,1,0.8984375,1}        -- font colour

UtilityWindow_AllianceFontName          = "HUDFont"   -- font name used to display string (not the filename)
UtilityWindow_AllianceDropShadowID      = 1                -- drop shadow ID (ie: none = 0)
UtilityWindow_AllianceFontColour        = {1,1,0.8984375,1}        -- font colour

UtilityWindow_ConnectionFontName        = "HUDFont"   -- font name used to display string (not the filename)
UtilityWindow_ConnectionDropShadowID    = 1                -- drop shadow ID (ie: none = 0)
UtilityWindow_ConnectionFontColour      = {1,1,0.8984375,1}        -- font colour

UtilityWindow_ItemMenuGreyedOutFontName     = "HUDFont"   -- font name used to display string (not the filename)
UtilityWindow_ItemMenuGreyedOutDropShadowID = 1                -- drop shadow ID (ie: none = 0)
UtilityWindow_ItemMenuGreyedOutFontColour   = {0.7,0.7,0.7,1}   -- colour used to displayed greyed out item in the menu

ShipInfoWnd_descriptionFontName     =  "HUDFont"   -- (not the filename) font name used to display string's description in the ship info window
ShipInfoWnd_descriptionDropShadowID =  1                -- drop shadow ID (ie: none = 0)
ShipInfoWnd_descriptionColour       =  {1,1,0.8984375,1}        -- font colour
ShipInfoWnd_descriptionIsUpperCase  =  1                -- display the name in upper case or if false use the default name

ShipInfoWnd_shipCostFontName        =  "HUDFont"   -- (not the filename) font name used to display string's description in the ship info window
ShipInfoWnd_shipCostDropShadowID    =  1                -- drop shadow ID (ie: none = 0)
ShipInfoWnd_shipCostColour          =  {1,1,0.8984375,1}        -- font colour

EventWindow_defaultColour           = {1,1,1,1}         -- colour used to display an expired event
EventWindow_expiredColour           = {0.5,0.5,0.5,0.5} -- colour used to display an expired event
EventWindow_priorityLowColour       = {1,1,1,1}         -- colour used to display a low priority event
EventWindow_priorityMediumColour    = {1,1,0,1}         -- colour used to display a medium priority event
EventWindow_priorityHighColour      = {1,0,1,1}         -- colour used to display a high priority event
EventWindow_chatPrivateColour       = {0,1,1,1}         -- colour used to display a private chat message
EventWindow_chatAllyColour          = {0,1,0,1}         -- colour used to display a chat message for allies
EventWindow_chatPublicColour        = {1,0,0,1}         -- colour used to display a public chat message

ChatWindow_chatLineTimeOut          = 10000             -- time out before moving up all lines in the chat window

UtilitySystemWnd_shipInfoWndTimePop = 1000              -- delay in milliseconds before displaying the ship info window

AllianceWnd_delayInFrameBetweenWnd  = 10                -- delay in universe frame before showing the next alliance window
AllianceWnd_xferRUsErrorColour      = {1,0,0,1}         -- colour used when the RUs entered are higher thab what the player has

-- CommandButton index (from 0 to N - set in Flash) Each CmdButton in flash must have a unique number,
-- starting at 0 to max number of flash button. -1 can be used to specify an unused button.
-- 0 1 2 3   <- button order in flash
-- 4 5 6 7
-- Special case: The SpecialButton is used to display many "special action" button on the same button. Only
--               one button can be displayed at a time if there's no conflict (ie: only one button is available or active),
--               among all the special button. Otherwise the default SpecialButton texture would be displayed (a neutral button)
--               To specify the original SpecialButton, use the same index number has for specialCmdButtonIndex.
attackCmdButtonIndex    = 1
dockCmdButtonIndex      = 7
guardCmdButtonIndex     = 2
moveCmdButtonIndex      = 0
patrolCmdButtonIndex    = 6
recycleCmdButtonIndex   = 3
specialCmdButtonIndex   = 5
stopCmdButtonIndex      = 4
resourceCmdButtonIndex  = 5
waypointCmdButtonIndex  = 5
landCmdButtonIndex      = 5
detachCmdButtonIndex    = 5

-- "base texture name for this button. ie: attack_Neutral.tga, attack_Active.tga, attack_Available.tga
-- Texture are stored in ui/frontEnd/inGame/hud/cmdButton"
attackBaseTextureName   = "attack"
dockBaseTextureName     = "dock"
guardBaseTextureName    = "guard"
moveBaseTextureName     = "move"
patrolBaseTextureName   = "patrol"
recycleBaseTextureName  = "recycle"
specialBaseTextureName  = "special"
stopBaseTextureName     = "stop"
waypointBaseTextureName = "waypoint"
landBaseTextureName     = "land"
detachBaseTextureName   = "launch"
specialBaseTextureName  = "default"
resourceBaseTextureName = "resource"
