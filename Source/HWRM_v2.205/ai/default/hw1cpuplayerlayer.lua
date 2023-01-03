--
-- A "thunking layer" to handle CPU requests to make the CPU player handle HW1-style CPU feature requests,
--  and otherwise make the CPU player behave like the HW1 CPU plahyer.
--

aitrace("LOADING HW1 CPU Layer")

--
-- Enable build control.  If off, CPU player can't build.
--
function HW1CPUBuildControl(bOn)
    aitrace("HW1CPUBuildControl: "..bOn)
	sg_dobuild = bOn
	sg_dosubsystems = bOn
	sg_doresearch = bOn
	sg_doupgrades = bOn
end

--
-- Enable tactical control: moving, attacking, resourcing etc.
--
function HW1CPUTacticalControl(bOn)
    aitrace("HW1CPUTacticalControl: "..bOn)
    sg_domilitary = bOn
    cp_processMilitary = bOn
    cp_processResource = bOn
end

--
-- feature types
--
ResourceFeature  = 0
DefenseFeature   = 1
AttackFeature    = 2
TeamFeature      = 3

--
-- Features that can be turned on and off with Enable|Enable[All]Feature[s]()
-- Features marked [k] are actually invoked in kas code
-- Features marked [k?] are features that were presumable invoked in kas code, but were invoked by decimal, not hex (i.e. 200 instead of 0x200) or reversed (i.e. (1,4096) instead of (4096,1))
-- We don't need to map the various other features atomically, but should for then Enable|DisableAll() calls.
--

--Resource Feature flags
--turned on and off by script or due to difficulty levels
AIR_ACTIVE_MOTHERSHIP             = 1           --0x00000001      //mothership moves
AIR_ACTIVE_RESOURCE_COLLECTION    = 2 ^ 1       --[k]0x00000002      //resource collectors are optimized
AIR_ACTIVE_RESOURCE_CONTROLLER    = 2 ^ 2       --[k]0x00000004      //resource controller moves with resource collectors (NOTE: AIR_RESOURCE_CONTROLLER_REQUESTS should be activated)
AIR_ACTIVE_SUPPORT_FRIGATE        = 2 ^ 3       --0x00000008      //support frigate moves towards harass and guard teams when they are low on fuel (NOTE: AIR_SUPPORT_FRIGATE_REQUESTS should be activated)
AIR_RESOURCE_DISTRESS_SIGNALS     = 2 ^ 4       --[k?]0x00000010      //resource ships under fire send distress signals (NOTE: only active guard and temp guard react to distress signals)
AIR_SMART_RESEARCH_SHIP_REQUESTS  = 2 ^ 8       --0x00000100      //research ships are requested depending on need, rather than random number
AIR_SMART_COLLECTOR_REQUESTS      = 2 ^ 9       --[k?]0x00000200      //resource collectors are requested depending on need, rather than random number
AIR_RESOURCE_CONTROLLER_REQUESTS  = 2 ^ 10      --0x00000400      //resource controllers are requested
AIR_SUPPORT_FRIGATE_REQUESTS      = 2 ^ 11      --[k?]0x00000800      //support frigates are requested
AIR_AGGRESSIVE_RESOURCING         = 2 ^ 12      --[k?]0x00001000      //resource ships are put into aggressive mode
--Hypersapce Feature flags
--Uses the Resource feature bitfield
AIF_HYPERSPACING                  = 2 ^ 24      --0x01000000      //turns CPU hyperspacing on
--Defense Feature Flags
--turned on and off by script or due to difficulty levels
AID_GUARDING                      = 1           --[k] 0x00000001      //guard teams are created - default to small teams in spherical formation around resource ships
AID_ACTIVE_GUARD                  = 2 ^ 1       --[k] 0x00000002      //guard teams are larger and roam around.  React to distress signals and invasion of sphere of influence
AID_SPHERE_OF_INFLUENCE_INVADERS  = 2 ^ 2       --0x00000004      //enemy ships within a certain distance away from the mothership are considered invaders and dealth with (NOTE: only active guard and temp guard react to invaders)
AID_MOTHERSHIP_DEFENSE            = 2 ^ 4       --[k?]0x00000010      //mothership defense is activated - this option causes idle ships to defend the mothership
AID_MOTHERSHIP_DEFENSE_MEDIUM     = 2 ^ 5       --[k?]0x00000020      //guard and active guard teams also get recalled and defend the mothership
AID_MOTHERSHIP_DEFENSE_HARDCORE   = 2 ^ 6       --[k?]0x00000040      //all ships in the computer player's fleet available get recalled and defend the mothership
AID_CLOAK_DEFENSE                 = 2 ^ 8       --[k?]0x00000100      //minimal cloak defense - if any cloak capable ship is detected, the computer player builds a few proximity sensors
AID_CLOAK_DEFENSE_RED             = 2 ^ 9       --[k?]0x00000200      //more rigorous cloaking defense - if any cloak capable ship is detected within the sphere of influence, more proximity sensors are pumped out and roam around
--Attack Feature Flags
--turned on and off by script or due to difficulty levels
AIA_STATIC_RECONAISSANCE          = 1           --0x00000001      //a probe is sent to the vicinity of the primary enemy's mothership
AIA_ACTIVE_RECONAISSANCE          = 2 ^ 1       --[k?]0x00000002      //scouts roam the world increasing the computer player's vision considerably
AIA_ATTACK_FLEET_FAST             = 2 ^ 4       --0x00000010      //cheap frigate attack
AIA_ATTACK_FLEET_GUARD            = 2 ^ 5       --0x00000020      //frigate or destroyer attack with guarding ships
AIA_ATTACK_FLEET_BIG              = 2 ^ 6       --0x00000040      //frigate and destroyer attack
AIA_ATTACK_FLEET_HUGE             = 2 ^ 7       --0x00000080      //heavy cruiser attack
AIA_TAKEOUT_TARGET                = 2 ^ 8       --0x00000100      //a special team is built intended to eliminate a specific target
AIA_FANCY_TAKEOUT_TARGET          = 2 ^ 9       --0x00000200      //a special team is built intended to eliminate a specific target, and another team is built to defend the first team
AIA_FIGHTER_STRIKE                = 2 ^ 12      --0x00001000      //an attack team made of a bunch of fighters
AIA_CORVETTE_STRIKE               = 2 ^ 13      --0x00002000      //an attack team made of a bunch of corvettes
AIA_FRIGATE_STRIKE                = 2 ^ 14      --0x00004000      //an attack team made of a bunch of frigates
AIA_HARASS                        = 2 ^ 16      --0x00010000      //a special team intended to takeout resource ships, support ships and capital ships vulnerable to fighters
AIA_CAPTURE                       = 2 ^ 17      --0x00020000      //a team of salvage capture corvettes is created - it tries to capture the player's ships
AIA_MINE                          = 2 ^ 18      --0x00040000      //a team of minelayer corvettes is built and they raise havoc whereever they can
AIA_KAMIKAZE                      = 2 ^ 19      --0x00080000      //fighter and corvette kamikaze when their health gets low
AIA_CLOAKGEN                      = 2 ^ 20      --0x00100000      //a Cloak generator is built
AIA_GRAVWELL                      = 2 ^ 21      --0x00200000      //a gravwell generator is built
--Team Feature Flags
--turned on and off by script or due to difficulty levels
AIT_ADVANCED_ATTACK               = 1           --[k?]0x00000001      //attack micromanagement
AIT_FLANK_ATTACK                  = 2 ^ 1       --[k?]0x00000002      //attacks come from the side, top or bottom
AIT_CLOAKING                      = 2 ^ 2       --0x00000004      //cloaking fighters and cloak generators cloak at appropriate times
AIT_TACTICS                       = 2 ^ 3       --0x00000008      //in game tactics are used with moves that support them
AIT_GRAVWELL                      = 2 ^ 4       --0x00000010      //gravwell generators do their stuff

--
-- Run-time switches of CPU player features representing above bitfields
--
-- Development status indicators:
--  [i]/[ ]:    ignore
--  [m]/[ ]:    implemented
--  [t]/[ ]:    tested
sg_activeResourceCollection         = 1         --[ ]
sg_activeResourceControllers        = 1         --[ ]
sg_resourceDistressSignals          = 1
sg_smartCollectorRequests           = 1
sg_supportFrigateRequests           = 1
sg_aggressiveResourcing             = 1
sg_resourceControllerRequests       = 1         --[m]   requests refineries and salvage drop-off points

sg_guarding                         = 1
sg_activeGuarding                   = 1
sg_mothershipDefenseBasic           = 1
sg_mothershipDefenseMedium          = 1
sg_mothershipDefenseHardcore        = 1
sg_cloakDefense                     = 1

sg_activeReconaissance              = 1

sg_advancedAttack                   = 1
sg_flankAttack                      = 1

--
-- Type-specific funtions to enable/disable various features
--
function HW1CPUEnableResourceFeature(feature, bOn)
    aitrace("HW1CPUEnableResourceFeature: "..feature)
    if (feature == AIR_ACTIVE_RESOURCE_COLLECTION) then
        sg_activeResourceCollection = bOn
    elseif (feature == AIR_ACTIVE_RESOURCE_CONTROLLER) then
        sg_activeResourceControllers = bOn                      --to implement.
        if (bOn ~= 0) then
            HW1CPUEnableResourceFeature(AIR_RESOURCE_CONTROLLER_REQUESTS, bOn)
        end
    elseif (feature == AIR_RESOURCE_DISTRESS_SIGNALS) then
        sg_resourceDistressSignals = bOn                  --to implement.
    elseif (feature == AIR_SMART_COLLECTOR_REQUESTS) then
        sg_smartCollectorRequests = bOn                   --to implement.  Optimized allocation of collector requests.
    elseif (feature == AIR_RESOURCE_CONTROLLER_REQUESTS) then
        sg_resourceControllerRequests = bOn
    elseif (feature == AIR_SUPPORT_FRIGATE_REQUESTS) then
        sg_supportFrigateRequests = bOn                   --makes less sense in HW2, as was mostly to supply fuel for defending strike craft.  In fact, was ignored if fuel burn turned off.
    elseif (feature == AIR_AGGRESSIVE_RESOURCING) then
        sg_aggressiveResourcing = bOn                     --to implement.  Sets collectors to aggressive tactics so they don't run away if attacked.
    else
        aitrace("HW1CPUEnableResourceFeature: don't know how to ENABLE unsupported feature "..feature)
    end
end
function HW1CPUEnableDefenseFeature(feature, bOn)
    aitrace("HW1CPUEnableDefenseFeature: "..feature)
    if (feature == AID_GUARDING) then
        sg_guarding = bOn
    elseif (feature == AID_ACTIVE_GUARD) then
        sg_activeGuarding = bOn
    elseif (feature == AID_MOTHERSHIP_DEFENSE) then
        sg_mothershipDefenseBasic = bOn
    elseif (feature == AID_MOTHERSHIP_DEFENSE_MEDIUM) then
        sg_mothershipDefenseMedium = bOn
    elseif (feature == AID_MOTHERSHIP_DEFENSE_HARDCODE) then
        sg_mothershipDefenseHardcore = bOn
    elseif (feature == AID_CLOAK_DEFENSE) then
        sg_cloakDefense = bOn
    elseif (feature == AID_CLOAK_DEFENSE_RED) then
        sg_cloakDefenseRed = bOn
    else
        aitrace("HW1CPUEnableDefenseFeature: don't know how to ENABLE unsupported feature "..feature)
    end
end
function HW1CPUEnableAttackFeature(feature, bOn)
    aitrace("HW1CPUEnableAttackFeature: "..feature)
    if (feature == AIA_ACTIVE_RECONAISSANCE) then
        sg_activeReconaissance = bOn
    else
        aitrace("HW1CPUEnableAttackFeature: don't know how to ENABLE unsupported feature "..feature)
    end
end
function HW1CPUEnableTeamFeature(feature, bOn)
    aitrace("HW1CPUEnableTeamFeature: "..feature)
    if (feature == AIT_ADVANCED_ATTACK) then
        sg_advancedAttack = bOn
    elseif (feature == AIT_FLANK_ATTACK) then
        sg_flankAttack = bOn
    else
        aitrace("HW1CPUEnableTeamFeature: don't know how to ENABLE unsupported feature "..feature)
    end
end

--
-- void kasfEnableAIFeature(sdword feature, sdword type)
--
function HW1CPUEnableAIFeature(feature, type)
    aitrace("HW1CPUEnableAIFeature: "..feature..", "..type)

    if (type == ResourceFeature) then
        HW1CPUEnableResourceFeature(feature, 1)
    elseif (type == DefenseFeature) then
        HW1CPUEnableDefenseFeature(feature, 1)
    elseif (type == AttackFeature) then
        HW1CPUEnableAttackFeature(feature, 1)
    elseif (type == TeamFeature) then
        HW1CPUEnableTeamFeature(feature, 1)
    end
end

--
-- void kasfDisableAIFeature(sdword feature, sdword type)
--
function HW1CPUDisableAIFeature(feature, type)
    aitrace("HW1CPUDisableAIFeature: "..feature..", "..type)

    if (type == ResourceFeature) then
        HW1CPUEnableResourceFeature(feature, 0)
    elseif (type == DefenseFeature) then
        HW1CPUEnableDefenseFeature(feature, 0)
    elseif (type == AttackFeature) then
        HW1CPUEnableAttackFeature(feature, 0)
    elseif (type == TeamFeature) then
        HW1CPUEnableTeamFeature(feature, 0)
    end
end

--
-- void kasfDisableAllAIFeatures(void)
--
function HW1CPUDisableAllAIFeatures()
    aitrace("HW1CPUDisableAllAIFeatures")
    HW1CPUEnableResourceFeature(AIR_ACTIVE_MOTHERSHIP, 0)
    HW1CPUEnableResourceFeature(AIR_ACTIVE_RESOURCE_COLLECTION, 0)
    HW1CPUEnableResourceFeature(AIR_ACTIVE_RESOURCE_CONTROLLER, 0)
    HW1CPUEnableResourceFeature(AIR_ACTIVE_SUPPORT_FRIGATE, 0)
    HW1CPUEnableResourceFeature(AIR_RESOURCE_DISTRESS_SIGNALS, 0)
    HW1CPUEnableResourceFeature(AIR_SMART_RESEARCH_SHIP_REQUESTS, 0)
    HW1CPUEnableResourceFeature(AIR_SMART_COLLECTOR_REQUESTS, 0)
    HW1CPUEnableResourceFeature(AIR_RESOURCE_CONTROLLER_REQUESTS, 0)
    HW1CPUEnableResourceFeature(AIR_SUPPORT_FRIGATE_REQUESTS, 0)
    HW1CPUEnableResourceFeature(AIR_AGGRESSIVE_RESOURCING, 0)

    HW1CPUEnableResourceFeature(AIF_HYPERSPACING, 0)

    HW1CPUEnableDefenseFeature(AID_GUARDING, 0)
    HW1CPUEnableDefenseFeature(AID_ACTIVE_GUARD, 0)
    HW1CPUEnableDefenseFeature(AID_SPHERE_OF_INFLUENCE_INVADERS, 0)
    HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE, 0)
    HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE_MEDIUM, 0)
    HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE_HARDCORE, 0)
    HW1CPUEnableDefenseFeature(AID_CLOAK_DEFENSE, 0)
    HW1CPUEnableDefenseFeature(AID_CLOAK_DEFENSE_RED, 0)

    HW1CPUEnableAttackFeature(AIA_STATIC_RECONAISSANCE, 0)
    HW1CPUEnableAttackFeature(AIA_ACTIVE_RECONAISSANCE, 0)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_FAST, 0)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_GUARD, 0)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_BIG, 0)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_HUGE, 0)
    HW1CPUEnableAttackFeature(AIA_TAKEOUT_TARGET, 0)
    HW1CPUEnableAttackFeature(AIA_FANCY_TAKEOUT_TARGET, 0)
    HW1CPUEnableAttackFeature(AIA_FIGHTER_STRIKE, 0)
    HW1CPUEnableAttackFeature(AIA_CORVETTE_STRIKE, 0)
    HW1CPUEnableAttackFeature(AIA_FRIGATE_STRIKE, 0)
    HW1CPUEnableAttackFeature(AIA_HARASS, 0)
    HW1CPUEnableAttackFeature(AIA_CAPTURE, 0)
    HW1CPUEnableAttackFeature(AIA_MINE, 0)
    HW1CPUEnableAttackFeature(AIA_KAMIKAZE, 0)
    HW1CPUEnableAttackFeature(AIA_CLOAKGEN, 0)
    HW1CPUEnableAttackFeature(AIA_GRAVWELL, 0)

    HW1CPUEnableTeamFeature(AIT_ADVANCED_ATTACK, 0)
    HW1CPUEnableTeamFeature(AIT_FLANK_ATTACK, 0)
    HW1CPUEnableTeamFeature(AIT_CLOAKING, 0)
    HW1CPUEnableTeamFeature(AIT_TACTICS, 0)
    HW1CPUEnableTeamFeature(AIT_GRAVWELL, 0)
end

--
-- void kasfEnableAllAIFeatures(void)
--
function HW1CPUEnableAllAIFeatures()
    aitrace("HW1CPUEnableAllAIFeatures")

    HW1CPUEnableResourceFeature(AIR_ACTIVE_MOTHERSHIP, 1)
    HW1CPUEnableResourceFeature(AIR_ACTIVE_RESOURCE_COLLECTION, 1)
    HW1CPUEnableResourceFeature(AIR_ACTIVE_RESOURCE_CONTROLLER, 1)
    HW1CPUEnableResourceFeature(AIR_ACTIVE_SUPPORT_FRIGATE, 1)
    HW1CPUEnableResourceFeature(AIR_RESOURCE_DISTRESS_SIGNALS, 1)
    HW1CPUEnableResourceFeature(AIR_SMART_RESEARCH_SHIP_REQUESTS, 1)
    HW1CPUEnableResourceFeature(AIR_SMART_COLLECTOR_REQUESTS, 1)
    HW1CPUEnableResourceFeature(AIR_RESOURCE_CONTROLLER_REQUESTS, 1)
    HW1CPUEnableResourceFeature(AIR_SUPPORT_FRIGATE_REQUESTS, 1)
    HW1CPUEnableResourceFeature(AIR_AGGRESSIVE_RESOURCING, 1)

    HW1CPUEnableResourceFeature(AIF_HYPERSPACING, 1)

    HW1CPUEnableDefenseFeature(AID_GUARDING, 1)
    HW1CPUEnableDefenseFeature(AID_ACTIVE_GUARD, 1)
    HW1CPUEnableDefenseFeature(AID_SPHERE_OF_INFLUENCE_INVADERS, 1)
    HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE, 1)
    HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE_MEDIUM, 1)
    HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE_HARDCORE, 1)
    HW1CPUEnableDefenseFeature(AID_CLOAK_DEFENSE, 1)
    HW1CPUEnableDefenseFeature(AID_CLOAK_DEFENSE_RED, 1)

    HW1CPUEnableAttackFeature(AIA_STATIC_RECONAISSANCE, 1)
    HW1CPUEnableAttackFeature(AIA_ACTIVE_RECONAISSANCE, 1)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_FAST, 1)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_GUARD, 1)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_BIG, 1)
    HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_HUGE, 1)
    HW1CPUEnableAttackFeature(AIA_TAKEOUT_TARGET, 1)
    HW1CPUEnableAttackFeature(AIA_FANCY_TAKEOUT_TARGET, 1)
    HW1CPUEnableAttackFeature(AIA_FIGHTER_STRIKE, 1)
    HW1CPUEnableAttackFeature(AIA_CORVETTE_STRIKE, 1)
    HW1CPUEnableAttackFeature(AIA_FRIGATE_STRIKE, 1)
    HW1CPUEnableAttackFeature(AIA_HARASS, 1)
    HW1CPUEnableAttackFeature(AIA_CAPTURE, 1)
    HW1CPUEnableAttackFeature(AIA_MINE, 1)
    HW1CPUEnableAttackFeature(AIA_KAMIKAZE, 1)
    HW1CPUEnableAttackFeature(AIA_CLOAKGEN, 1)
    HW1CPUEnableAttackFeature(AIA_GRAVWELL, 1)

    HW1CPUEnableTeamFeature(AIT_ADVANCED_ATTACK, 1)
    HW1CPUEnableTeamFeature(AIT_FLANK_ATTACK, 1)
    HW1CPUEnableTeamFeature(AIT_CLOAKING, 1)
    HW1CPUEnableTeamFeature(AIT_TACTICS, 1)
    HW1CPUEnableTeamFeature(AIT_GRAVWELL, 1)
end

--
-- void kasfTeamGiveToAI(void)
--
function HW1CPUTeamGiveToAI(teamName)
    aitrace("HW1CPUTeamGiveToAI: "..teamName)
end

--
-- Can the CPU player build a given ship?  Ship name is given without race prefix.
--
function HW1CPUCanBuildShipType(shipType)
    return(1)       --guess player can build all ship types
end

--
-- Initialize the CPU player into an emulation of the HW1 CPU defaults.  Called at the start of each mission.
--
HW1CPU_DIFFICULTY_BEGINNER          = 0
HW1CPU_DIFFICULTY_INTERMEDIATE      = 1
HW1CPU_DIFFICULTY_ADVANCED          = 2
function HW1CPUPlayerInit()
    aitrace("HW1CPUPlayerInit")
    HW1CPUBuildControl(0)                       --by default, CPU player has no fleet control

    --
    -- Should get the difficulty level from chosen difficulty, but in HW1 it was always advanced in SP game.
    difficulty = HW1CPU_DIFFICULTY_ADVANCED

    --
    -- Enable CPU player options per difficulty level
    --

    -- Fleet options
    if (difficulty >= HW1CPU_DIFFICULTY_ADVANCED) then
        HW1CPUEnableResourceFeature(AIF_HYPERSPACING, 1)
    end

    -- Resourcing features
    if (difficulty >= HW1CPU_DIFFICULTY_ADVANCED) then
        HW1CPUEnableResourceFeature(AIR_ACTIVE_MOTHERSHIP, 1)
        HW1CPUEnableResourceFeature(AIR_ACTIVE_RESOURCE_COLLECTION, 1)
        HW1CPUEnableResourceFeature(AIR_ACTIVE_SUPPORT_FRIGATE, 1)
        HW1CPUEnableResourceFeature(AIR_RESOURCE_DISTRESS_SIGNALS, 1)
        HW1CPUEnableResourceFeature(AIR_SMART_COLLECTOR_REQUESTS, 1)
        HW1CPUEnableResourceFeature(AIR_SMART_RESEARCH_SHIP_REQUESTS, 1)
    elseif (difficulty >= HW1CPU_DIFFICULTY_INTERMEDIATE) then
        HW1CPUEnableResourceFeature(AIR_AGGRESSIVE_RESOURCING, 1)
        HW1CPUEnableResourceFeature(AIR_RESOURCE_CONTROLLER_REQUESTS, 1)
        HW1CPUEnableResourceFeature(AIR_SUPPORT_FRIGATE_REQUESTS, 1)
    else
        HW1CPUEnableResourceFeature(AIR_ACTIVE_RESOURCE_CONTROLLER, 1)
    end

    -- Attack features
    if (difficulty >= HW1CPU_DIFFICULTY_ADVANCED) then
        HW1CPUEnableAttackFeature(AIA_ACTIVE_RECONAISSANCE, 1)

        if (HW1CPUCanBuildShipType("HeavyCruiser") ~= 0) then
            HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_HUGE, 1)
        end

        HW1CPUEnableAttackFeature(AIA_FANCY_TAKEOUT_TARGET, 1)
        HW1CPUEnableAttackFeature(AIA_FIGHTER_STRIKE, 1)
        HW1CPUEnableAttackFeature(AIA_CORVETTE_STRIKE, 1)
        HW1CPUEnableAttackFeature(AIA_HARASS, 1)

        if (HW1CPUCanBuildShipType("SalvageCorvette") ~= 0) then
            HW1CPUEnableAttackFeature(AIA_CAPTURE, 1)
        end
        if (HW1CPUCanBuildShipType("MinelayerCorvette") ~= 0) then
            HW1CPUEnableAttackFeature(AIA_MINE, 1)
        end
        if (HW1CPUCanBuildShipType("CloakGenerator") ~= 0) then
            HW1CPUEnableAttackFeature(AIA_CLOAKGEN, 1)
        end
        if (HW1CPUCanBuildShipType("GravWellGenerator") ~= 0) then
            HW1CPUEnableAttackFeature(AIA_GRAVWELL, 1)
        end
    elseif (difficulty >= HW1CPU_DIFFICULTY_INTERMEDIATE) then
        HW1CPUEnableAttackFeature(AIA_STATIC_RECONAISSANCE, 1)
        HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_FAST, 1)
        HW1CPUEnableAttackFeature(AIA_TAKEOUT_TARGET, 1)
        HW1CPUEnableAttackFeature(AIA_FRIGATE_STRIKE, 1)
    else
        HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_BIG, 1)
        HW1CPUEnableAttackFeature(AIA_ATTACK_FLEET_GUARD, 1)

        --if ((!singlePlayerGame) && bitTest(tpGameCreated.flag,MG_CaptureCapitalShip) ~= 0) then
        --{
        --    HW1CPUEnableAttackFeature(AIA_CAPTURE)
        --end
    end

    -- Defense features
    if (difficulty >= HW1CPU_DIFFICULTY_ADVANCED) then
        HW1CPUEnableDefenseFeature(AID_ACTIVE_GUARD, 1)
        HW1CPUEnableDefenseFeature(AID_SPHERE_OF_INFLUENCE_INVADERS, 1)
        HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE_HARDCORE, 1)
        HW1CPUEnableDefenseFeature(AID_CLOAK_DEFENSE_RED, 1)
    elseif (difficulty >= HW1CPU_DIFFICULTY_INTERMEDIATE) then
        HW1CPUEnableDefenseFeature(AID_GUARDING, 1)
        HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE, 1)
        HW1CPUEnableDefenseFeature(AID_MOTHERSHIP_DEFENSE_MEDIUM, 1)
        HW1CPUEnableDefenseFeature(AID_CLOAK_DEFENSE, 1)
    else
    end

    -- Team features
    -- In HW1 these are per-team settings, but the difficulty was defaulted to the CPU player difficulty (actually 2x, but could be decremented...)
    if (difficulty >= HW1CPU_DIFFICULTY_ADVANCED) then
        HW1CPUEnableTeamFeature(AIT_ADVANCED_ATTACK, 1)
    elseif (difficulty >= HW1CPU_DIFFICULTY_INTERMEDIATE) then
        --case TEAM_INTERMEDIATE_ADVANCED:
        HW1CPUEnableTeamFeature(AIT_FLANK_ATTACK, 1)
        HW1CPUEnableTeamFeature(AIT_CLOAKING, 1)
        HW1CPUEnableTeamFeature(AIT_GRAVWELL, 1)
        --case TEAM_INTERMEDIATE:
        HW1CPUEnableTeamFeature(AIT_TACTICS, 1)
    else
    end

end


