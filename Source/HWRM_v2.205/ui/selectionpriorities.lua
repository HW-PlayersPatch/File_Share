--
-- Definitions for context-sensitive selection priority modifiers.
-- These modifiers are multiplied by the selection priorities defined in ShipTuning and other
-- tuning spreadsheets.  Modifiers can be applied based on sobtype, "owner" (friendly, allied, enemy)
-- (ships only) or by ability (ships only).  By default all modifiers are 1.0.
--

--This table specifies the order in which command modes will override each other in the case of a tie.
--ordered lowest to highest priority
ModeOrder =
{
    MUI_CM_Normal,
    MUI_CM_Add,
    MUI_CM_Eye,
    MUI_CM_Move,
    MUI_CM_ShipRelativeMove,
    MUI_CM_Attack,
    MUI_CM_ForceAttack,
    MUI_CM_Guard,
    MUI_CM_Dock,
    MUI_CM_Harvest,
    MUI_CM_Repair,
    MUI_CM_Cloak,
    MUI_CM_Mine,
    MUI_CM_Capture,
    MUI_CM_WaypointMove,
    MUI_CM_Hyperspace,
    MUI_CM_FormGate,
    MUI_CM_HyperspaceViaGate,
    MUI_CM_SpecialAttack,
    MUI_CM_SetRallyObject,
    MUI_CM_DefenseField,
    MUI_CM_MoveAttack,
    MUI_CM_Salvage,
    MUI_CM_Military,
}

-- Selection priority modifiers are defined per-command mode (see MainUIDefines.h).  The command mode
-- is determined by what's under the mouse before selection is performed.
--
-- "mode"       as defined in MainUIDefines.h
-- "byType"     table of pairs of SobTypes(sobtypes.h) and modifiers
-- "byOwner"    table of pairs of SobOwners(Selector.h) and modifiers
-- "byAbility"  table of pairs of target abilities(abilities.h) and modifiers
MouseOverPriorities =
{
    {
        mode = MUI_CM_Normal,
        byType =
        {
            SobType_WeaponFire, 0,
            SobType_SubSystem, 4.0,             --make subsystems same priority as ships (tuned to half priority in SubsystemTuning.xls)
        },
        byOwner =
        {
            SOS_Friendly = 1.0,                 --prefer selecting enemies
            SOS_Enemy = 0.8,
        },
        byAbility =
        {
            AB_Attack = 1.1,
        }
    },
    {
        mode = MUI_CM_Add,
        byType =
        {
            SobType_WeaponFire, 0,
            SobType_SubSystem, 2.0,             --make subsystems same priority as ships (tuned to half priority in SubsystemTuning.xls)
        },
        byOwner =
        {
            SOS_Friendly = 1.0,                 --prefer selecting enemies
            SOS_Enemy = 0.8,
        },
        byAbility =
        {
            AB_Attack = 1.1,
        }
    },
    {
        mode = MUI_CM_Eye,
        byType =
        {
            SobType_WeaponFire, 0,
            SobType_SubSystem, 2.0,             --make subsystems same priority as ships (tuned to half priority in SubsystemTuning.xls)
        },
    },
    {
        mode = MUI_CM_Move,
    },
    {
        mode = MUI_CM_Harvest,
        byType =
        {
            SobType_Asteroid, 2.5,              --prefer resources for salvage
            SobType_Salvage, 2.5,
        },
    },
    {
        mode = MUI_CM_Salvage,
        byAbility =
        {
            AB_Salvage, 2.0,                    --prefer salvagable chunks in salvage mode
        },
    },
    {
        mode = MUI_CM_Attack,
        byType =
        {
            SobType_SubSystem, 4.0,             --allow selecting subsystems for attack (tuned to half priority in SubsystemTuning.xls)
        },
        byOwner =
        {
            SOS_Enemy = 1.5,                    --prefer enemies for attacking
        },
    },
    {
        mode = MUI_CM_WaypointMove,
        byType =
        {
            SobType_DustCloud, 0,
            SobType_Missile, 0,
        },
    },
}

-- Similar selection priorities, but specific to band-boxing instead of mouse over
-- Same parameters as above
BandBoxPriorities =
{
    {
        mode = MUI_CM_Normal,
        byType =
        {
            SobType_WeaponFire, 0,
            SobType_SubSystem, 2.0,             --make subsystems same priority as ships (tuned to half priority in SubsystemTuning.xls)
        },
        byOwner =
        {
            SOS_Friendly = 1.0,                 --prefer selecting enemies
            SOS_Enemy = 0.8,
        },
        byAbility =
        {
            AB_Attack = 1.1,
        }
    },
    {
        mode = MUI_CM_Attack,
        byType =
        {
            SobType_SubSystem, 2.0,             --allow selecting subsystems for attack (tuned to half priority in SubsystemTuning.xls)
        },
        byOwner =
        {
            SOS_Enemy = 1.5,                    --prefer enemies for attacking
        },
    },
}

--the above modifiers affect the priority defined int ShipTuning et al.  The following constants
--are used according to the following function:
--P = Psob*modifiers + dist2D*dist2DModifier + (depthLogMax - log(depth))*depthModifier
MouseOverMix =
{
    dist2DModifier = 50,                        --multiplied by 2D mouse-object(centre) distance
    depthModifier = 30,                         --multiplied by (dethLogMax - log(depth))
    depthLogMax = 13,                           --log(max distance)
}
BandBoxMix =
{
    depthModifier = 50,                         --multiplied by (dethLogMax - log(depth))
    depthLogMax = 13,                           --log(max distance)
    priorityMin = 0.8,                         --minimum priority (factor of max) considered to pass band-box filtering
}
