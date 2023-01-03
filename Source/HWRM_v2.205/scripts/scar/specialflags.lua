--
-- SpecialFlags.lua
-- Special flags for ships and logic to handle setting/clearing them
--

-- Special flags.  These are stored in the m_scriptingFlags member of Sob.
-- They are mostly queried/manipulated on a per-squad level.
ATTRIBUTES_StripTechnology         = 2      --0x0001
ATTRIBUTES_ShellOfResources        = 2 ^ 1  --0x0002
ATTRIBUTES_VelToMothership         = 2 ^ 2  --0x0004
ATTRIBUTES_DontApplyFriction       = 2 ^ 3  --0x0008
ATTRIBUTES_KillerCollDamage        = 2 ^ 4  --0x0010
ATTRIBUTES_Anomaly                 = 2 ^ 5  --0x0020
ATTRIBUTES_DeleteAfterHSOut        = 2 ^ 6  --0x0040
ATTRIBUTES_StartInHS               = 2 ^ 7  --0x0080
ATTRIBUTES_Defector                = 2 ^ 8  --0x0100
ATTRIBUTES_HeadShotVelToMothership = 2 ^ 9  --0x0200
ATTRIBUTES_HeadShotKillerCollDamage= 2 ^ 10 --0x0400
ATTRIBUTES_Regrow                  = 2 ^ 11 --0x0800

ATTRIBUTES_SMColor1                = 2 ^ 12 --0x1000    --0 indicates no change, 1 indicates invisible, 2 indicates yellow, 3 indicates green
ATTRIBUTES_SMColor2                = 2 ^ 13 --0x2000
ATTRIBUTES_SMColorField            = ATTRIBUTES_SMColor1 + ATTRIBUTES_SMColor2
ATTRIBUTES_SMColorInvisible        = ATTRIBUTES_SMColor1        -- 0x1000
ATTRIBUTES_SMColorYellow           = ATTRIBUTES_SMColor2        -- 0x2000
ATTRIBUTES_SMColorGreen            = ATTRIBUTES_SMColorField    -- 0x3000

ATTRIBUTES_ScaleResources          = 2 ^ 14 --0x4000
ATTRIBUTES_TeamLeader              = 2 ^ 15 --0x8000

-- The lower 16 bits may be set by setObjectAttributes.  Here we only use the upper 16 bits.
SPECIAL_STAY_TILL_EXPLICITLAUNCH        = 2 ^ 16 --0x00010000
SPECIAL_LaunchedFromKas                 = 2 ^ 28 --0x10000000
SPECIAL_KasCheckDoneLaunching           = 2 ^ 29 --0x20000000
SPECIAL_Launching                       = 2 ^ 30 --0x40000000    --indicates ship is launching

-- params to spMainScreenAndLockout
SPLOCKOUT_EVERYTHING                = 1
SPLOCKOUT_ALLBUTMOUSE               = 2
--
-- GameEventListener called for GE_ShipDocked: when the ship is launched.
--
function spSpecialShipLaunchedCB(launchingShip, launchedFrom)
    --print("spSpecialShipLaunchedCB")
    SobGroup_ClearScriptFlag(launchingShip, (SPECIAL_STAY_TILL_EXPLICITLAUNCH + SPECIAL_Launching + SPECIAL_KasCheckDoneLaunching))
end

--
-- GameEventListener called for GE_ShipDocked: when the ship is docked.
--
function spSpecialShipDockedCB(dockingShip, dockedWith)
    --print("spSpecialShipDockedCB")
    SobGroup_ClearScriptFlag(dockingShip, (SPECIAL_STAY_TILL_EXPLICITLAUNCH + SPECIAL_KasCheckDoneLaunching))
end

