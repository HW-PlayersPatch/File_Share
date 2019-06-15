dofilepath("data:scripts/SCAR/SensorsWeirdness.lua")


-- These are dummy functions to which unimplemented KAS functions can be stubbed by the mission script conerter
--
function ignoredFunction()
    --do nothing
    return(0)
end

function ignoredFunctionInt(param)
    return param;
end

--Matches functionality of kasfRandom
function RandomIntRange(upper, lower)
    if (upper < lower) then
        temp = upper
        upper = lower
        lower = temp
    end
    result =  lower + RandomIntMax(upper - lower)
    --print("RandomIntRange: ("..lower.."-"..upper..") = "..result)
    return result
end

-- KASTIMER STUFF, copied from SCARUtil.lua, but modified to match behaviour of KAS timers
KASTimer = {}
KASTimer_PAUSED    = -13
KASTimer_VerboseDebug = 0
function KASTimer_Start(id,period)
    if (KASTimer_VerboseDebug ~= 0) then
        print("KASTimer "..id.." STARTED with period: "..period)
    end
    KASTimer[id] = {p=period,tr=period,t=Universe_GameTime()}
end

function KASTimer_StartPaused(id,period)
    KASTimer_Start(id,period)
    KASTimer_Pause(id)
end

function KASTimer_Set(id,time)
    if (KASTimer_VerboseDebug ~= 0) then
        print("KASTimer "..id.." SET to: "..time)
    end
    KASTimer_Start(id,time)
end

function KASTimer_Add(id,period)
    if(KASTimer[id] == nil) then
        if (KASTimer_VerboseDebug ~= 0) then
            print("(Timer " ..id.. " has ended)")
        end
    else
        KASTimer[id].p = KASTimer[id].p + period
    end
end

function KASTimer_Pause(id)
    if (KASTimer[id].t ~= KASTimer_PAUSED)  then
        if (KASTimer_VerboseDebug ~= 0) then
            print("KASTimer "..id.." PAUSING now")
        end
        KASTimer[id].tr = max(0, KASTimer[id].p - (Universe_GameTime() - KASTimer[id].t))
        KASTimer[id].t = KASTimer_PAUSED
        KASTimer[id].p = KASTimer[id].tr;
    else
        print("KASTimer "..id.." PAUSE called (KASTimer already paused)")
    end

end

function KASTimer_GetRemaining(id)
    if (KASTimer[id] == nil) then
        if (KASTimer_VerboseDebug ~= 0) then
            print("(KASTimer "..id.." has ended)")
        end
        return 0
    end
    if (KASTimer[id].t ~= KASTimer_PAUSED) then
        KASTimer[id].tr = max(0, KASTimer[id].p - (Universe_GameTime() - KASTimer[id].t))
    end
    return floor(KASTimer[id].tr)
end

function KASTimer_Resume(id)
    if (KASTimer[id] ~= nil)  then
        KASTimer[id].t = Universe_GameTime()
        if (KASTimer_VerboseDebug ~= 0) then
            print("KASTimer "..id.." RESUME called")
        end
    else
        if (KASTimer_VerboseDebug ~= 0) then
            print("KASTimer "..id.." RESUME called (for an ended KASTimer)")
        end
    end
end

function KASTimer_Display(id)
    if (KASTimer[id] == nil)  then
        if (KASTimer_VerboseDebug ~= 0) then
            print("KASTimer "..id.." -- ".." [KASTimer has been ended]")
        end
        return
    end
    dispTime =  KASTimer_GetRemaining(id)
    --print("KASTimer "..id.." -- "..dispTime)
end

function KASTimer_End(id)
    if (KASTimer_VerboseDebug ~= 0) then
        print("KASTimer "..id.." END called")
    end
    KASTimer[id]=nil
end

function KASTimer_IsExpired(id)
    if (KASTimer[id] == nil) then
        return(0)  --non-existent timers haven't "expired"
    elseif (KASTimer_GetRemaining(id) <= 0) then
        if (KASTimer_VerboseDebug ~= 0) then
            print("KASTimer "..id.." ISEXPIRED")
        end
        return(1)
    else
        --print("KASTimer "..id.." time remaining:"..KASTimer_GetRemaining(id))
        return(0)
    end
end

function KASTimer_IsExpiredIfSoDestroy(id)
    if (KASTimer[id] == nil) then
        return(0)  --non-existent timers haven't "expired"
    elseif (KASTimer_IsExpired(id) == 1) then
        if (KASTimer_VerboseDebug ~= 0) then
            print("KASTimer "..id.." IFSODESTROY")
        end
        KASTimer_End(id)
        return(1)
    else
        return(0)
    end
end

--Pointer glue functions
--HW1 made extensive use of a kasfTutRemoveAllPointers, for which HW2 has no clear analogue.  Hence we wrap it up.
KASPointers = {}
KASNumberPointers = 0
KASPointer_VerboseDebug = 0
function KASPointer_Remember(id)
    --find a place in the pointer array to remember this pointer id
    local iPointer = 0
    while (iPointer <= KASNumberPointers) do
        if (KASPointers[iPointer] == nil) then
            if (KASPointer_VerboseDebug ~= 0) then
                print("KASPointer "..id.." remembered")
            end
            KASPointers[iPointer] = id
            return
        end
        iPointer = iPointer + 1
    end
    -- no empty place found.  Create a new one
    if (KASPointer_VerboseDebug ~= 0) then
        print("KASPointer "..id.." remembered to slot "..iPointer)
    end
    KASPointers[iPointer] = id
    KASNumberPointers = iPointer + 1
end
function KASPointer_Forget(id)
    --find this pointer in the global array
    if (KASPointer_VerboseDebug ~= 0) then
        print("KASPointer: forgetting "..id)
    end

    local iPointer = 0
    while (iPointer <= KASNumberPointers) do
        if (KASPointers[iPointer] == id) then
            if (KASPointer_VerboseDebug ~= 0) then
                print("KASPointer "..id.." forgotten from slot "..iPointer)
            end
            KASPointers[iPointer] = nil
            return
        end
        iPointer = iPointer + 1
    end
end
function KASPointer_AddSobGroup(group)
    local pointerID = EventPointer_AddSobGroup( group, HW2_rgb( 230, 230, 230), 0)
    KASPointer_Remember(pointerID)
    return pointerID
end
function KASPointer_AddShip(group)
    if (SobGroup_Count(group) == 1) then
        return(KASPointer_AddSobGroup(group))
    end

    local KAS_PointerSingleName = "KAS_PointerSingleGroup"
    KASSobGroup_CreateIfNotExist(KAS_PointerSingleName)
    SobGroup_FillShipsByIndexRange(KAS_PointerSingleName, group, 0, 1)
    return(KASPointer_AddSobGroup(KAS_PointerSingleName))
end
function KASPointer_AddVolume(volume)
    local pointerID = EventPointer_AddVolume( volume, HW2_rgb( 230, 230, 230), 0)
    KASPointer_Remember(pointerID)
    return pointerID
end
function KASPointer_Remove(id)
    KASPointer_Forget(id)
    EventPointer_Remove(id)
end
function KASPointer_RemoveAll()
    --for all pointers
    if (KASPointer_VerboseDebug ~= 0) then
        print("KASPointer_RemoveAll: forgetting all pointers")
    end
    iPointer = 0
    while (iPointer <= KASNumberPointers) do
        if (KASPointers[iPointer] ~= nil) then
            EventPointer_Remove(KASPointers[iPointer])
            if (KASPointer_VerboseDebug ~= 0) then
                print("KASPointer "..KASPointers[iPointer].." forgotten")
            end
            KASPointers[iPointer] = nil
        end
        iPointer = iPointer + 1
    end
end

-- To implement the functionality of functions PauseOtherKAS and UnpauseOtherKAS, we need a wrapper for the rule system
-- Here we keep a table of rules.  PauseOtherKAS will cause us to delete all but the specified rule,
-- while UnPauseOtherKAS will cause us to restore the deleted rules.
-- Also, this wrapper prevents adding a rule multiple times, which can cause undesired consequences.
-- Further, we keep a list of possible FSMs the rules can be part of and get the FSM name along with rule names.
--  If adding a rule and there's already a rule for the same FSM, delete the previous rule before adding the new one.
KASStateRulesByTeam = {}            --mapping of TeamName->current state rule
KASFSMRulesByTeam = {}              --mapping of TeamName->FSM Rule
KASNumberFSMs = 0
KASRules = {}                       --array of current rules
KASNumberRules = 0
KASPausedRules = {}
KASNumberPausedRules = 0
RULE_INTERVAL   = 0.5
KASRule_VerboseDebug = 0
KASTeamsByRule = {}                 --mapping of rules to TeamName.  Needed for unpausing.
KASTeamsBaseRuleByRule = {}         --mapping of base rules name (without param) to TeamName.  Needed for unpausing.
function KASRule_Add(TeamName, name, addedFrom)

    compoundNameToAdd = TeamName.."_"..name

    --first remove any rule from this FSM
    replacedRule = ""
    if (KASStateRulesByTeam[TeamName] ~= nil) then
        if (KASStateRulesByTeam[TeamName] == name) then
            if (KASRule_VerboseDebug ~= 0) then
                print("KASRule "..compoundNameToAdd.." already current rule. NOT added from "..addedFrom)
            end
            return
        end
        replacedRule = KASStateRulesByTeam[TeamName]
        KASRule_Remove(TeamName, KASStateRulesByTeam[TeamName], addedFrom..":KASRule_Add")
    end
    KASStateRulesByTeam[TeamName] = name

    --see if rule already exists.  Also, find a slot for this new rule as needed.
    iRule = 0
    iFreeSlot = -1
    while (iRule < KASNumberRules) do
        if (KASRules[iRule] == nil and iFreeSlot == -1) then
            iFreeSlot = iRule
        end
        if (KASRules[iRule] == compoundNameToAdd) then
            if (KASRule_VerboseDebug ~= 0) then
                print("KASRule "..compoundNameToAdd.." already exists.  NOT added from "..addedFrom)
            end
            return
        end
        iRule = iRule + 1
    end

    --remember the rule
    if (iFreeSlot == -1) then
        KASRules[iRule] = compoundNameToAdd
        KASNumberRules = KASNumberRules + 1
    else
        KASRules[iFreeSlot] = compoundNameToAdd
    end

    --remember the un-compounded name/param: used for unpausing
    KASTeamsByRule[compoundNameToAdd] = TeamName
    KASTeamsBaseRuleByRule[compoundNameToAdd] = name

    --actually add the rule
    Rule_AddIntervalParam(name, TeamName, RULE_INTERVAL)
    if (KASRule_VerboseDebug ~= 0) then
        print("KASRule "..compoundNameToAdd.." REPLACES "..replacedRule.." ADDED from "..addedFrom)
    end
end

--
-- basically the same as above, except it's creating an FSM-scope rule.  Record rule name to KASFSMRulesByTeam instead of KASStateRulesByTeam
--
KASTeams = {}
KASNumberTeams = 0
function KASRule_AddFSM(TeamName, name, addedFrom)

    --the team may already be in an FSM.  If so, these old rules need to be deleted
    oldFSMRule = KASFSMRulesByTeam[TeamName]
    if (oldFSMRule ~= nil) then
        print("KASRule_AddFSM: team "..TeamName.." FSMRule switching from "..oldFSMRule.." to "..name)
        Rule_RemoveParam(oldFSMRule, TeamName)
        KASFSMRulesByTeam[TeamName] = nil
    end

    oldStateRule = KASStateRulesByTeam[TeamName]
    if (oldStateRule ~= nil) then
        print("KASRule_AddFSM: team "..TeamName.." StateRule switching from "..oldStateRule.." to "..name)
        KASRule_Remove(TeamName, oldStateRule, addedFrom..":KASRule_AddFSM")
    end

    --save state rule in case it's overwritten
    saveStateRule = KASStateRulesByTeam[TeamName]

    KASRule_Add(TeamName, name, addedFrom)

    KASFSMRulesByTeam[TeamName] = name

    KASStateRulesByTeam[TeamName] = saveStateRule

    --remember the teams in a global array
    KASTeams[KASNumberTeams] = TeamName
    KASNumberTeams = KASNumberTeams + 1
end

--
-- Remove ships from teams (as, when captured)
--
function KAS_RemoveFromTeams(ships)
    local iTeam = 0
    while (iTeam < KASNumberTeams) do
        SobGroup_FillSubtract(KASTeams[iTeam], KASTeams[iTeam], ships)
        iTeam = iTeam + 1
    end
end

--
-- Remove a KAS rule
--
function KASRule_Remove(TeamName, name, removedFrom)
--    Rule_Remove(name)
    --look in the unpaused rules.  It can be here multiple times if re-added while previously paused
    compoundNameToDelete = TeamName.."_"..name
    iRule = 0
    while (iRule < KASNumberRules) do
        if (KASRules[iRule] == compoundNameToDelete) then
            KASRules[iRule] = nil;
            if (KASRule_VerboseDebug ~= 0) then
                print("KASRule "..compoundNameToDelete.." DELETED from "..removedFrom)
            end
            Rule_RemoveParam(name, TeamName)
            assert(KASStateRulesByTeam[TeamName] == name or KASStateRulesByTeam[TeamName] == nil)
            KASStateRulesByTeam[TeamName] = nil
            --return
        end
        iRule = iRule + 1
    end

    --also remove from paused rules, as this is a thing that can happen
    iRule = 0
    while (iRule < KASNumberPausedRules) do
        if (KASPausedRules[iRule] == compoundNameToDelete) then
            KASPausedRules[iRule] = nil;
            if (KASRule_VerboseDebug ~= 0) then
                print("KASPausedRule "..compoundNameToDelete.." DELETED from "..removedFrom)
            end
            --paused rules already removed, yes? Rule_Remove(name)
            assert(KASStateRulesByTeam[TeamName] == name or KASStateRulesByTeam[TeamName] == nil)
            KASStateRulesByTeam[TeamName] = nil
            return
        end
        iRule = iRule + 1
    end
end

--
-- Pause all rules except ones specified
--
function KASRules_PauseExceptRules(TeamName, FSMRule, StateRule)

    compoundFSMName = TeamName.."_"..FSMRule
    compoundStateName = TeamName.."_"..StateRule

    if (KASRule_VerboseDebug ~= 0) then
        print("KASRule_PauseExceptRules "..compoundFSMName..", "..compoundStateName)
    end

    --we erase all the current paused rules.  Issue a warning if there are already paused rules.
    if (KASNumberPausedRules > 0) then
        print("KASRules_PauseExceptRules: there are "..KASNumberPausedRules.." paused rules aready.  Forgetting.  May cause problems.")
    end
    --finished unpausing.  Forget the paused rules.
    KASPausedRules = {}
    KASNumberPausedRules = 0

    --put paused rules into a temporary array so the Rule_Remove won't delete rules unexpectedly.
    newPauseRules = {}
    newNumberPauseRules = 0

    iRule = 0
    while (iRule < KASNumberRules) do
        if (KASRules[iRule] ~= nil) then
            --only pause rules with names that do not match
            if ((KASRules[iRule] ~= compoundFSMName) and (KASRules[iRule] ~= compoundStateName)) then
                --do the actual pause
                newPauseRules[newNumberPauseRules] = KASRules[iRule]
                newNumberPauseRules = newNumberPauseRules + 1

                --print("TeamName["..KASRules[iRule].."] = "..KASTeamsByRule[KASRules[iRule]]..", BaseName = "..KASTeamsBaseRuleByRule[KASRules[iRule]])

                RunningTeamName = KASTeamsByRule[KASRules[iRule]]
                RunningBaseName = KASTeamsBaseRuleByRule[KASRules[iRule]]
                assert(RunningTeamName ~= nil)
                assert(RunningBaseName ~= nil)

                nRemoved = Rule_RemoveParam(RunningBaseName, RunningTeamName)

                if (KASRule_VerboseDebug ~= 0) then
                    if (nRemoved > 0) then
                        print("KASRule "..KASRules[iRule].." PAUSED")
                    else
                        print("KASRule "..KASRules[iRule].." UNSUCCESSFULLY PAUSED")
                    end
                end

                --if (KASRules[iRule] == compoundFSMRule) then
                --else
                --    KASStateRulesByTeam[RunningTeamName] = nil
                --end
                --KASRules[iRule] = nil
            else
                if (KASRule_VerboseDebug ~= 0) then
                    print("KASRule "..KASRules[iRule].." intentionally NOT PAUSED")
                end
            end
        end
        iRule = iRule + 1
    end

    KASPausedRules = newPauseRules
    KASNumberPausedRules = newNumberPauseRules

    --now that all the rules (except those specified) are paused, clear out the list of rules and add the current 2 (or maybe one) to it
    KASRules = {}
    KASNumberRules = 1
    KASRules[0] = compoundFSMName
    if (StateRule ~= "") then
        KASNumberRules = 2
        KASRules[1] = compoundStateName
    end
end

--
-- Pause all rules except FSM specified
--
function KASRules_PauseExceptFSM(TeamName)
    if (KASRule_VerboseDebug ~= 0) then
        print("KASRule_PauseExceptFSM "..TeamName)
    end
    FSMRule = KASFSMRulesByTeam[TeamName]
    StateRule = KASStateRulesByTeam[TeamName]
    if (FSMRule == nil) then
        FSMRule = ""
    end
    if (StateRule == nil) then
        StateRule = ""
    end
    KASRules_PauseExceptRules(TeamName, FSMRule, StateRule)
end

--
-- Unpause paused rules (if any)
--
function KASRules_UnpauseOthers()
    if (KASRule_VerboseDebug ~= 0) then
        print("KASRule_UnpauseOthers: "..KASNumberPausedRules)
    end

    --add the paused rules to the end of the unpaused rules table
    iPaused = 0
    while (iPaused < KASNumberPausedRules) do
        if (KASPausedRules[iPaused] ~= nil) then
            if (KASRule_VerboseDebug ~= 0) then
                print("KASRule "..KASPausedRules[iPaused].." UNPAUSED")
            end

            --Rule_Add(KASPausedRules[iPaused])
            TeamName = KASTeamsByRule[KASPausedRules[iPaused]]
            BaseName = KASTeamsBaseRuleByRule[KASPausedRules[iPaused]]
            assert(TeamName ~= nil)
            assert(BaseName ~= nil)
            Rule_AddIntervalParam(BaseName, TeamName, RULE_INTERVAL)
            KASRules[KASNumberRules] = KASPausedRules[iPaused]
            KASNumberRules = KASNumberRules + 1
        else
            if (KASRule_VerboseDebug ~= 0) then
                print("KASRule #"..iPaused.." = nil")
            end
        end
        iPaused = iPaused + 1
    end
    --finished unpausing.  Forget the paused rules.
    KASPausedRules = {}
    KASNumberPausedRules = 0
end

--
-- Emulates     : SobGroup_Create
-- Description  : A simple wrapper that creates a SobGroup and clears the m_removeSwitchOwnerSquadron flag so that when a ship is captured,
--                  it will not automatically be removed from this SobGroup (which is the HW1 behaviour).
-- Note         : Called often.  Consider combining these two functions together.
function KASSobGroup_Create(group)
    SobGroup_Create(group)
    SobGroup_SetSwitchOwnerFlag(group, 0)
    KASMessageQueueCreate(group)
end
function KASSobGroup_CreateIfNotExist(group)
    if (SobGroup_CreateIfNotExist(group) ~= 0) then
    end
    SobGroup_SetSwitchOwnerFlag(group, 0)

    --don't reset the message queue if it exists (as when loading from a save game)
    if (KAS_MessageQueues[group] == nil) then
        KASMessageQueueCreate(group)
    end
end

--
-- Makes a named point with the centre position of the named group.  Needed for functions that take a named point, but can get it from a sobgroup.
--
KAS_TempCentreIndex = 0
KAS_NamedCentrePosition_TempCentre = nil
function KAS_NamedCentrePosition(groupName)
    if (KAS_NamedCentrePosition_TempCentre ~= nil) then
        Volume_Delete(KAS_NamedCentrePosition_TempCentre)
    end
    KAS_NamedCentrePosition_TempCentre = groupName.."_TempCentre"..KAS_TempCentreIndex
    KAS_TempCentreIndex = KAS_TempCentreIndex + 1

    Volume_AddSphere(KAS_NamedCentrePosition_TempCentre, SobGroup_GetCentrePosition(groupName), 1)
    return(KAS_NamedCentrePosition_TempCentre)
end

--Emulate the functionality of kasThisTeamsVectorPtr, but as a volume.
--This function creates an "ephemeral" volume, that is created and valid at the time of calling,
--but will only exist until the next time this method is called.
--  KASThisTeamVolume_instance = nil
--  function KASThisTeamsVolume(volName, teamName)
--      --start by deleting any old volume
--      if (KASThisTeamVolume_instance ~= nil) then
--          Volume_Delete(KASThisTeamVolume_instance)
--          KASThisTeamVolume_instance = nil
--      end
--      --now create a new volume
--      centre = SobGroup_GetCentrePosition(teamName)
--      Volume_AddSphere(volName, centre, 1)
--      KASThisTeamVolume_instance = volName
--      return(volName)
--  end

--
-- A version of above that gets a raw vector
--
function KAS_TeamCentrePoint(teamName)
    --now create a new volume
    centre = SobGroup_GetCentrePosition(teamName)
    return(centre)
end

--Map results of HW2 Tactics Query to HW1 tactics queries
--HW1: Game/objtypes.h:                      HW2: Tactics.h:
-- typedef enum                              enum SquadronTactics
-- {                                         {
--     Evasive,                                  AggressiveTactics,
--     Neutral,                                  DefensiveTactics,
--     Aggressive,                               PassiveTactics,
--                                               NUMBER_OF_TACTICS
--     NUM_TACTICS_TYPES                     };
-- } TacticsType;
function KASShipROEGet(sobGroupName)

    curROE = SobGroup_GetROE(sobGroupName)

    if (curROE == 0) then
        return 2
    elseif (curROE == 1) then
        return 0
    elseif (curROE == 2) then
        return 1
    end
end

--Wrappers for objectives.  KAS used 0 (incomplete) and 1 (complete) where HW2 uses the following states:
--  enum State
--  {
--      OS_Off,
--      OS_Incomplete,
--      OS_Complete,
--      OS_Failed,
--
--      OS_NumStates
--  };
KASObjective_VerboseDebug = 0
function KASObjective_Add(objectiveID, string, type)

    if (KASObjective_VerboseDebug ~= 0) then
        print("KASObjective_Add: ID:"..objectiveID..", name:"..string..", type:"..type)
    end
    --special case: the "Hyperspace" objective is not a real objective.  It merely pops up the Hyperspace button
    if (string == "Hyperspace") then
        if (KASObjective_VerboseDebug ~= 0) then
            print("KASObjective_Add: hyperspace objective")
        end
        singlePlayerHyperspaceButtonEnable()
    else
        --KAS objectives may be created in any order, and KAS may check the state of objectives before they are even created.
        --Therefore we need to create them with a predictible indices, not the sequential idices returned by Objective_Add
        Objective_AddPresetID(objectiveID, string, type)
    end
end
function KASObjective_SetState(objective, state)
    if (KASObjective_VerboseDebug ~= 0) then
        print("KASObjective_SetState: ID:"..objective..", state:"..state)
    end
    HW2State = 1
    if (state == 1) then
        HW2State = 2
    end
    Objective_SetState(objective, HW2State)
end

function KASObjective_GetState(objective)
    --if (KASObjective_VerboseDebug ~= 0) then
    --    print("KASObjective_GetState: ID:"..objective)
    --end

    HW2State = Objective_GetState(objective)
    if (HW2State == 2) then
        return 1
    else
        return 0
    end
end
ObjectiveStateStrings = {}
ObjectiveStateStrings =
{
    [0] = "(off)",
    [1] = "(incomplete)",
    [2] = "(complete)",
    [3] = "(failed)"
}
function KASObjective_GetStateWithDebug(objective, bDebug)

    HW2State = Objective_GetState(objective)
    if (HW2State == 2) then
        if (bDebug ~= 0) then
            print("KASObjective_GetState: "..objective.." = COMPLETE")
        end
        return 1
    else
        if (bDebug ~= 0) then
            print("KASObjective_GetState: "..objective.." = "..HW2State..ObjectiveStateStrings[HW2State])
        end
        return 0
    end
end

function KASObjective_Destroy(objective)
    if (KASObjective_VerboseDebug ~= 0) then
        print("KASObjective_Destroy: ID:"..objective)
    end
    Objective_SetState(objective, OS_Off)
end

function KASObjective_DestroyAll()
    if (KASObjective_VerboseDebug ~= 0) then
        print("KASObjective_DestroyAll()")
    end
    iObjective = 0
    while (iObjective < ObjectiveID_Count) do
        KASObjective_Destroy(iObjective)
        iObjective = iObjective + 1
    end

end

function KAS_FillShipsByTypeWithRaces(sobGroupNameToFill, sobGroupName, shipTypeName)
    --first try to get the ships with no race.  Needed for non-R1/R2 races
    SobGroup_FillShipsByType(sobGroupNameToFill, sobGroupName, shipTypeName)
    numberShips = SobGroup_Count(sobGroupNameToFill)
    if (numberShips > 0) then
        --print("KAS_FillShips: Found "..numberShips.." ships of type "..shipTypeName.." in "..sobGroupName)
        return(numberShips)
    else
		local raceCount = Race_GetCount()
        for iRace = 1, raceCount do
			local racePrefix = Race_GetPrefix(iRace)
			SobGroup_FillShipsByType(sobGroupNameToFill, sobGroupName, racePrefix..shipTypeName)
            numberShips = SobGroup_Count(sobGroupNameToFill)
            if (numberShips > 0) then
                return(numberShips)
            end
        end
    end
    return(numberShips)
end

--
-- Like above, but queries from the player
--
function KAS_FindPlayerShipsByTypeWithRaces(sobGroupNameToFill, playerIndex, shipTypeName)
    local numberShips = Player_FillShipsByType(sobGroupNameToFill, playerIndex, shipTypeName)
    if (numberShips > 0) then
        --print("KAS_FindPlayerShipsByTypeWithRaces: Found "..numberShips.." ships of type "..shipTypeName.." belonging to player "..playerIndex)
        return(numberShips)
    else
        local raceCount = Race_GetCount()
        for iRace = 1, raceCount do
			local racePrefix = Race_GetPrefix(iRace)
			numberShips = Player_FillShipsByType(sobGroupNameToFill, playerIndex, racePrefix..shipTypeName)
            if (numberShips > 0) then
                --print("KAS_FindPlayerShipsByTypeWithRaces: Found "..numberShips.." ships of type "..racePrefix..shipTypeName.." belonging to player "..playerIndex)
                return(numberShips)
            end
        end
    end
    return(numberShips)
end

function KAS_FillShipsByType_Normal(sobGroupNameToFill, sobGroupName, shipTypeName)
    return(KAS_FillShipsByTypeWithRaces(sobGroupNameToFill, sobGroupName, shipTypeName))
end

--
-- Emulates:    sdword kasfShipsCountType(GrowSelection *ships, char *shipType)
--
function KAS_CountShipsByType(sobGroupName, shipTypeName)
    numberShips = SobGroup_CountByFilterInclude(sobGroupName, "ShipType", shipTypeName)
    if (numberShips > 0) then
        print("KAS_CountShipsByType: Found "..numberShips.." ships of type "..shipTypeName.." in "..sobGroupName)
        return(numberShips)
    else
        local raceCount = Race_GetCount()
        for iRace = 1, raceCount do
			local racePrefix = Race_GetPrefix(iRace)
			numberShips = SobGroup_CountByFilterInclude(sobGroupName, "ShipType", racePrefix..shipTypeName)
            if (numberShips > 0) then
                return(numberShips)
            end
        end
    end
    return(numberShips)

end

--
-- Checks if a type with a race name, such as "Kus_SalvageCorvette" is a type without races, "SalvageCorvette" in this case.
--
function KAS_IsTypeNoRace(typeWithRace, typeNoRace)
    --print("KAS_IsTypeNoRace: "..typeWithRace.." = "..typeNoRace.."?")
    typeWithRaceNoCase = strupper(typeWithRace)
    local raceCount = Race_GetCount()
    for iRace = 1, raceCount do
		local racePrefix = Race_GetPrefix(iRace)
		--print("KAS_IsTypeNoRace: "..typeWithRace.." = "..racePrefix..typeNoRace.."?")
        if (typeWithRaceNoCase == strupper(racePrefix..typeNoRace)) then
			print("KAS_IsTypeNoRace: "..typeWithRace.." Equates to "..racePrefix..typeNoRace)
            return(1)
        end
    end
    return(0)
end

--
-- Emulates     : sdword kasfFindEnemiesInside(Volume *volume, GrowSelection *ships, sdword neighborRadius)
--
function KAS_FindEnemiesInside(volume, ships)
    KASSobGroup_CreateIfNotExist(ships)
    Player_FillSobGroupInVolume(ships, 0, volume)
    return(SobGroup_Count(ships))
end

--
-- Emulates  : sdword kasfFindShipsInside(Volume *volume, GrowSelection *ships, sdword neighborRadius)
-- Note     : HW2 has no generic FindShipsInVolume, so we'll have to iterate all possible players
--              that might be in the volume, which for KAS are players {0, 1}.
--
function KAS_FindShipsInside(volume, ships)
    KASSobGroup_CreateIfNotExist(ships)
    KASSobGroup_CreateIfNotExist("KAS_TempSobGroup1")

    Player_FillSobGroupInVolume("KAS_TempSobGroup1", 1, volume)
    Player_FillSobGroupInVolume(ships, 0, volume)
    SobGroup_SobGroupAdd(ships, "KAS_TempSobGroup1")
    return(SobGroup_Count(ships))
end

--
-- Emulates     : sdword kasfFindEnemiesNearby(GrowSelection *ships, sdword radius)
-- Description  : Create a SobGroup of all enemy (human, #0) ships within distance of the mean position of ships.
-- Note         : ships is both input and output.
--                Homeworld filtered out ships by flags SOF_Crazy|SOF_Hide|SOF_Hyperspace|SOF_Disabled
--
function KAS_FindEnemiesNearby(ships, radius)
    Player_FillProximitySobGroup(ships, 0, ships, radius)
    return(SobGroup_Count(ships))
end

--
-- Emulates     : sdword kasfFindEnemiesNearby(GrowSelection *ships, sdword radius)
-- Description  : Create a SobGroup of all enemy (human, #0) ships within distance of the mean position of ships.
-- Note         : ships is both input and output.
--                Homeworld filtered out ships by flags SOF_Crazy|SOF_Hide|SOF_Hyperspace|SOF_Disabled
--
function KAS_FindEnemiesNearTeam(team, ships, radius)
    Player_FillProximitySobGroup(ships, 0, team, radius)
    return(SobGroup_Count(ships))
end

--
--Emulates the function:
--sdword kasfUnderAttack(GrowSelection *attackers)
--
function KAS_UnderAttack(teamName, attackers)
    SobGroup_Clear(attackers)
    if (SobGroup_Count(teamName) == 0) then
        return(0)
    end
    KASSobGroup_CreateIfNotExist("KAS_TempSobGroup0")
    SobGroup_GetAttackers(teamName, "KAS_TempSobGroup0")
    KASSobGroup_CreateIfNotExist("KAS_TempSobGroup1")
    SobGroup_Copy("KAS_TempSobGroup1", attackers)
    SobGroup_FillUnion(attackers, "KAS_TempSobGroup0", "KAS_TempSobGroup1")
    return(SobGroup_Count(attackers))
end

--
-- Emulates the function:
-- void kasfAttack(GrowSelection *targets)
-- HW2 needs a player index for SobGroup_Attack.  If the attackers group is empty, player index will be -1, which will generate a Lua Trace.
-- Therefore, we need to check the index first
--
function KAS_Attack(attackers, targets)
    playerIndex = SobGroup_GetPlayerOwner(attackers)
    if (playerIndex >= 0 and playerIndex < 1000) then           --use this strange context because -1 is returned as a udword, not sdword which would be more useful
        SobGroup_Attack(playerIndex, attackers, targets)
    end
end

--
-- Emulates     : aimCreateMoveAttack
-- Description  : Creates a move that attacks a ship, then moves around to flank it.
-- Inputs       : team, targets, formation, tactics, wait, remove
--                  Advanced boolean variable determines whether the attack is an advanced attack or not.
function KAS_MoveAttack(attackers, targets)
    print("KAS_MoveAttack: '"..attackers.."' -> '"..targets.."'.  MoveAttack NOT IMPLEMENTED.  Doing regular Attack.")
    KAS_Attack(attackers, targets)
end

--
-- Emulates     : void kasfAttackFlank(GrowSelection *targets)
-- Description  : Creates a move that makes a team attack from a flanking angle, rather than straight on
-- Inputs       :
--
function KAS_AttackFlank(attackers, targets)
    print("KAS_AttackFlank: '"..attackers.."' -> '"..targets.."'.  AttackFlank NOT IMPLEMENTED.  Doing regular Attack.")
    KAS_Attack(attackers, targets)
end

--
-- Emulates     : void kasfAttackSpecial(GrowSelection *targets)
-- Description  : AttackSpecial does whatever the special ability of the ship is.
--                  It may target friendly (for support type moves) or enemy (for attack moves).
-- Inputs       : team, targets, formation, tactics, wait, remove
--                  Advanced boolean variable determines whether the attack is an advanced attack or not.
function KAS_AttackSpecial(attackers, targets)
    specialAttackers = attackers.."_AttackSpecial";
    SobGroup_CreateIfNotExist(specialAttackers)
    if (SobGroup_FilterInclude(specialAttackers, attackers, "Ability", "SalCapCommand") > 0) then
        SobGroup_CaptureSobGroup(specialAttackers, targets)
    elseif (SobGroup_FilterInclude(specialAttackers, attackers, "Ability", "RepairCommand") > 0) then
        SobGroup_RepairSobGroup(specialAttackers, targets)
    elseif (SobGroup_FilterInclude(specialAttackers, attackers, "Ability", "CustomCommand") > 0) then
        SobGroup_CustomCommandTargets(specialAttackers, targets)
    else
        print("KAS_AttackSpecial: '"..attackers.."' -> '"..targets.."'.  AttackSpecial for these ships NOT IMPLEMENTED.  Doing regular Attack.")
        KAS_Attack(attackers, targets)
    end
end

--
-- Emulates     : sdword kasfBulgeAttack(GrowSelection *targets, GrowSelection *bulgetargets, GrowSelection *attackers, sdword radius)
-- With         : KAS_BulgeAttack(TeamName, "GrowSelection_Penetrators", "GrowSelection_VolumeShips", "GrowSelection_Attackers", 19250)
-- Description  : Finds ships in the current team that are near the enemy ships,
--                and only uses those to attack the enemy.  This function is an
--                optimization for Mission 14 (though it could be used anywhere)
--  Inputs      : targets      - the ships to attack,
--                bulgetargets - the ships that end up being attacked,
--                attackers    - the ships in the team that split off to attack
--                radius       - the maximum distance the team members have to be in
--                               order to attack
--
function KAS_BulgeAttack(team, targets, bulgetargets, attackers, radius)
    --...consider only non-attacking ships for the attack
    local nonAttackers = team.."_NonAttackers"
    SobGroup_Create(nonAttackers)
    SobGroup_FilterExclude(nonAttackers, team, "CurrentCommand", "COMMAND_Attack")
    SobGroup_Clear(bulgetargets)
    SobGroup_Clear(attackers)

    local numberNonAttackers = SobGroup_Count(nonAttackers)
    if (numberNonAttackers > 0) then
        --print("KAS_BulgeAttack: considering "..numberNonAttackers)

        --...for each possible target
        local numberTargets = SobGroup_Count(targets)
        local bulgeAttackers = attackers.."_Bulge"
        SobGroup_CreateIfNotExist(bulgeAttackers)
        local bulgeTargetSingle = targets.."_Single"
        SobGroup_CreateIfNotExist(bulgeTargetSingle)
        local iTarget = 0
        local squadStep = 1
        while (iTarget + squadStep <= numberTargets) do
            --...find nearby possible attackers
            SobGroup_FillShipsByIndexRange(bulgeTargetSingle, targets, iTarget, squadStep)
            local targetCentre = SobGroup_GetCentrePosition(bulgeTargetSingle)
            SobGroup_FillProximityPoint(bulgeAttackers, nonAttackers, targetCentre, radius)

            local bulgeAttackersCount = SobGroup_Count(bulgeAttackers)
            if (bulgeAttackersCount > 0) then
                --print("KAS_BulgeAttack: '"..bulgeAttackers.."' ("..bulgeAttackersCount..") ship -> '"..bulgeTargetSingle.."'.")

                KAS_Attack(bulgeAttackers, bulgeTargetSingle)

                --remember who attacking whom
                SobGroup_SobGroupAdd(bulgetargets, bulgeTargetSingle)
                SobGroup_SobGroupAdd(attackers, bulgeAttackers)
            end
            iTarget = iTarget + squadStep
        end
    end
    return(SobGroup_Count(bulgetargets))
end

--
-- Emulates     : void kasfAttackHarass(void)
-- Description  : Creates a move that makes the team harass an enemy
--  Inputs      : team - the team doing the harassing
--                false - whether the move processing waits for this move to complete
--                true - whether the move processor removes this move when it is done
--
function KAS_AttackHarrass(attackers)
    print("KAS_AttackHarrass: '"..attackers.."' -> ???.  AttackHarrass NOT IMPLEMENTED.  Attacking nearby targets.")

    --approximation: just find enemies nearby and attack them.  That's Harrassment!
    SobGroup_CreateIfNotExist("KAS_AttackHarrass_Targets")
    Player_GetShipsByFilterInclude(0, "KAS_AttackHarrass_Targets", "NoFilter", "")
    KAS_FindEnemiesNearby("KAS_AttackHarrass_Targets", 3000)

    KAS_Attack(attackers, "KAS_AttackHarrass_Targets")
end

-- Emulates     : kasfKamikaze
function KAS_Kamikaze(attackers, targets)
    print("KAS_Kamikaze: '"..attackers.."' -> '"..targets)
    SobGroup_Kamikaze(attackers, targets)
end

-- Emulates     : void kasfKamikazeEveryone(GrowSelection *targets)
function KAS_KamikazeEveryone(targets)
    print("KAS_KamikazeEveryone: '"..targets.."'.  KamikazeEveryone: all AI ships attack.")

    allCPUShips = "CPUPlayer_AllShips"
    Player_GetShipsByFilterInclude(1, allCPUShips, "Ability", "MoveCommand")
    KAS_Kamikaze(allCPUShips, targets)
end

-- Emulates     : kasfKamikaze
function KAS_Harvest(playerIndex, team)
    print("KAS_Harvest: '"..playerIndex..", "..team.." unparameterized.")
    SobGroup_Resource(playerIndex, team)
end

--Emulates the function:
--sdword kasfFindEnemyShipsOfType(GrowSelection *ships, char *shipType)
function KAS_FindPlayerShipsOfType(ships, shipType, playerIndex)
    return(KAS_FindPlayerShipsByTypeWithRaces(ships, playerIndex, shipType))
end

--
-- Emulates: kasfFindPlayerShipsOfClass
--
function KAS_FindPlayerShipsOfClass(ships, shipClass, playerIndex)
    Player_GetShipsByFilterInclude(playerIndex, ships, "attackFamily", shipClass)
    return(SobGroup_Count(ships))
end

--
-- Store motherships for all players so they can be accessed easily later.
--
KAS_PossibleEnemyMotherships = {}
KAS_PossibleEnemyMotherships = {"Kus_Mothership", "Tai_Mothership", "Tur_P1Mothership", "Kad_P2Mothership", "Vgr_Mothership", "Hgn_Mothership",
                            "Kus_Carrier", "Tai_Carrier", "Vgr_Carrier", "Hgn_Carrier"}
function KAS_RememberPlayerMotherships()
    local iPlayer = 0
    while (Player_NumberOfAwakeShips(iPlayer) > 0) do
        local motherGroupName = "KAS_MothershipGroup"..iPlayer
        KASSobGroup_CreateIfNotExist(motherGroupName)
        SobGroup_Clear(motherGroupName)
        local iEnemyRace = 1
        for iEnemyRace = 1, 10 do
            --mothershipName = EnemyPlayerRacePrefixes[iEnemyRace]
            --mothershipName = mothershipName.."Mothership"
            mothershipName = KAS_PossibleEnemyMotherships[iEnemyRace]
            print("KAS_RememberPlayerMotherships: checking for "..mothershipName.." into "..motherGroupName)
            Player_FillShipsByType(motherGroupName, iPlayer, mothershipName)

            if (SobGroup_Count(motherGroupName) > 0) then
                break
            end
        end
        iPlayer = iPlayer + 1
    end
end

--Get the player's mothership
--We don't know the race of the enemy, so we'll have to try a few different ship names
--could be generalized to any ship type if we wanted to go that way...
function KAS_PlayerMothership(sobGroupName, playerIndex)
    if (SobGroup_Count("KAS_MothershipGroup"..playerIndex) == 0) then

        KASSobGroup_CreateIfNotExist(sobGroupName)
        SobGroup_Clear(sobGroupName)
        iEnemyRace = 1
        for iEnemyRace = 1, 10 do
            --mothershipName = EnemyPlayerRacePrefixes[iEnemyRace]
            --mothershipName = mothershipName.."Mothership"
            mothershipName = KAS_PossibleEnemyMotherships[iEnemyRace]
            --print("KAS_PlayerMothership: checking for "..mothershipName.." into "..sobGroupName)
            Player_FillShipsByType(sobGroupName, playerIndex, mothershipName)

            if (SobGroup_Count(sobGroupName) > 0) then
                return
            end
        end
    else
        SobGroup_Copy(sobGroupName, "KAS_MothershipGroup"..playerIndex)
    end
end

--
--  Emulates    : sdword kasfShipsSelectClass(GrowSelection *newShips, GrowSelection *originalShips, char *shipClass)
--
function KAS_FillShipsByClass_HW2ProxyShips(sobGroupNameToFill, sobGroupName, shipClassName)
    --SobGroup_FillShipsByFamily(sobGroupNameToFill, sobGroupName, "attackFamily", shipClassName)
    SobGroup_FilterInclude(sobGroupNameToFill, sobGroupName, "attackFamily", shipClassName)
    return(SobGroup_Count(sobGroupNameToFill))
end

function KAS_FillShipsByClass_Normal(sobGroupNameToFill, sobGroupName, shipClassName)
    --SobGroup_FillShipsByFamily(sobGroupNameToFill, sobGroupName, "attackFamily", shipClassName)
    SobGroup_FilterInclude(sobGroupNameToFill, sobGroupName, "attackFamily", shipClassName)
    return(SobGroup_Count(sobGroupNameToFill))
end

--
--  Emulates    : sdword kasfShipsSelectCapital(GrowSelection *newShips, GrowSelection *originalShips)
--                sdword kasfShipsSelectNonCapital(GrowSelection *newShips, GrowSelection *originalShips)
--  Notes       : This function selects by "displayFamily" == "Capital" as defined in FamilyList.lua.
--                  This is the closest emulation of HW1's isCapital flag (which was explicitly defined)
--                  FamilyList.lua will need an additional family added for proper emulation of HW1-style selection.
--
function KAS_FillShipsByCapital(sobGroupNameToFill, sobGroupName)
    --SobGroup_FillShipsByFamily(sobGroupNameToFill, sobGroupName, "displayFamily", "Capital")
    SobGroup_FilterInclude(sobGroupNameToFill, sobGroupName, "displayFamily", "Frigate")
    SobGroup_AddFilterInclude(sobGroupNameToFill, sobGroupName, "displayFamily", "Capital")
    SobGroup_AddFilterInclude(sobGroupNameToFill, sobGroupName, "displayFamily", "Flagship")
    return(SobGroup_Count(sobGroupNameToFill))
end
function KAS_FillShipsByNonCapital(sobGroupNameToFill, sobGroupName)
    --SobGroup_FillShipsByFamily("KAS_TempSobGroup0", sobGroupName, "displayFamily", "Capital")
    --SobGroup_FillSubstract(sobGroupNameToFill, sobGroupName, "KAS_TempSobGroup0")
    SobGroup_FilterExclude(sobGroupNameToFill, sobGroupName, "displayFamily", "Frigate")
    SobGroup_AddFilterExclude(sobGroupNameToFill, sobGroupName, "displayFamily", "Capital")
    SobGroup_AddFilterExclude(sobGroupNameToFill, sobGroupName, "displayFamily", "Flagship")
    return(SobGroup_Count(sobGroupNameToFill))
end

--
-- Emulates     : kasfShipsSelectSpecial
-- Description  : Filters ships by a variety of criteria using SobGroup_Filter[Include|Exclude]
-- Inputs       : sobGroupNameToFill, sobGroupName - output and input groups
--                specialFlag: 1  //ships are salcapcorvettes returning technology
--                             2  //ships have been disabled (salcapcorvette has locked on)
--                             3  //ships have arms on them - includes GravWellGenerator as an armed ship
--                             4  //ships have defected to the other side
--
function KAS_ShipsSelectSpecial(sobGroupNameToFill, sobGroupName, specialFlag)
    SobGroup_Clear(sobGroupNameToFill)

    if (specialFlag == 1) then          --ships are salcapcorvettes returning technology
        --print("KAS_ShipsSelectSpecial(1): ("..sobGroupNameToFill..") filtering by ShipType(Kus_SalvageCorvette) && CurrentCommand(COMMAND_SalCapCommand) && CurrentCommandState(HasTechnology)")
        SobGroup_FilterInclude(sobGroupNameToFill, sobGroupName, "ShipType", "Kus_SalvageCorvette")
        SobGroup_FilterInclude(sobGroupNameToFill, sobGroupNameToFill, "CurrentCommand", "COMMAND_SalCap")
        SobGroup_FilterInclude(sobGroupNameToFill, sobGroupNameToFill, "CurrentCommandState", "SALCAPSTATE_ReturningToBaseWithTech")

    elseif (specialFlag == 2) then

        --!!!emulates SOF_Disabled (by SalCap) but not SOF_Crazy
        SobGroup_FillIntersect(sobGroupNameToFill, sobGroupName, spSalCapShipsGrabbed)
        --print out how many were included
        --local count = SobGroup_Count(sobGroupNameToFill)
        --if (count > 0) then
        --    print("KAS_ShipsSelectSpecial(2): ("..sobGroupNameToFill..") contains "..count.." ships with SOF_Disabled")
        --end

    elseif (specialFlag == 3) then

        print("KAS_ShipsSelectSpecial(3): ("..sobGroupNameToFill..") filtering armed (to implemenent)")

    elseif (specialFlag == 4) then

        print("KAS_ShipsSelectSpecial(3): ("..sobGroupNameToFill..") filtering defectors (to implemenent)")

    end
    return(SobGroup_Count(sobGroupNameToFill))
end

--
-- Emulates     : sdword kasfShipsSelectEnemy(GrowSelection *newShips, GrowSelection *originalShips)
-- With         : void SobGroup_FilterInclude(const char* sobGroupNameOut, const char* sobGroupNameIn, const char* filterTypeString, const char* filterParam)
--
function KAS_ShipsSelectByPlayer(newShips, originalShips, playerID)
    SobGroup_FilterInclude(newShips, originalShips, "PlayerOwner", ""..playerID)
    return(SobGroup_Count(newShips))
end

--
-- Emulates    : kasfIntelEventEnded
-- Description : Returns TRUE only once if a fleet intel/command subtitled
--                 speech event ends or the player hits SPACE to short-cut
--                 the event.
-- Return      : 1 if the current fleet intel subtitle expired
--               2 if the user hit space in the sensors manager.
--               0 if still speaking
KASEvent_VerboseDebug = 0
KAS_SubtitleEvents = {}
KAS_ExpiredSubtitleEvents = {}
subMessageEndedFlag = 0                                     --used to communicate speech event ending states between different functions
subMessageWasPlaying = 0                                    --used to locally record if a speech event WAS playing in a previous call
subMessageReturnedFalseTime = 0                             --used for timing out bad/dead speech events
SUBMESSAGE_SAFETY_TIMEOUT = 25                              --from SinglePlayer.script
function Subtitle_IsDoneOrSkipped(actor)

    --first see if someone is speaking.  This will return 0 if so
    for iActor = Actor_HW1_FleetCommand, Actor_HW1_KharSelim do
        if (Subtitle_IsDone(iActor) == 0) then
            --print("Subtitle_IsDoneOrSkipped("..actor.."): subtitle IS playing.")
            subMessageWasPlaying = 1
            subMessageEndedFlag = 0
            break
        end
    end

    --check if an event was skipped/ended.  In this case, ANY actor having skipped will count.  This will return 2 if so.
    bFoundSkip = 0
    for iActor = Actor_HW1_FleetCommand, Actor_HW1_KharSelim do
        if (Subtitle_Skipped(iActor) ~= 0) then
            if (KASEvent_VerboseDebug ~= 0) then
                print("Subtitle_IsDoneOrSkipped("..iActor.."): subtitle SKIPPED.")
            end
            subMessageEndedFlag = 2
            subMessageWasPlaying = 0
            bFoundSkip = 1
            -- probably letterboxed now; letterbox out
            KAS_SetLetterboxState(0, 1)
            break
        end
    end

    --see if an event ended recently.  This will return 1 if so
    if (bFoundSkip == 0) then
        for iActor = Actor_HW1_FleetCommand, Actor_HW1_KharSelim do
            if (KAS_ExpiredSubtitleEvents[iActor] ~= nil) then
                local currentTime = Universe_GameTime()
                local talkTime = KAS_ExpiredSubtitleEvents[iActor]["EventTime"] + KAS_ExpiredSubtitleEvents[iActor]["Duration"]
                local ago = currentTime - talkTime
                if (KASEvent_VerboseDebug ~= 0) then
                    print("Subtitle_IsDoneOrSkipped("..iActor.."): subtitle ENDED "..ago.."s ago.")
                end
                KAS_ExpiredSubtitleEvents[iActor] = nil
                subMessageEndedFlag = 1
                subMessageWasPlaying = 0
                break
            end
        end
    end

    local returnValue = subMessageEndedFlag
    subMessageEndedFlag = 0;              --only returns TRUE once for each event

    -- safety to make sure eventually intel event ends
    if (returnValue == 0) then
        if (subMessageReturnedFalseTime == 0) then
            subMessageReturnedFalseTime = Universe_GameTime()
        else
            if ( ((Universe_GameTime() - subMessageReturnedFalseTime) > SUBMESSAGE_SAFETY_TIMEOUT) and
                 (Subtitle_IsDone(Actor_HW1_FleetIntel) ~= 0 and Subtitle_IsDone(Actor_HW1_FleetCommand) ~= 0) ) then
                subMessageReturnedFalseTime = 0
                subMessageWasPlaying = 0
                if (KASEvent_VerboseDebug ~= 0) then
                    print("Subtitle_IsDoneOrSkipped("..actor.."): subtitle TIMED OUT.")
                end
                return(1)           -- subtitle finished by timeout
            end
        end
    else
        if (KASEvent_VerboseDebug ~= 0) then
            print("Subtitle_IsDoneOrSkipped("..actor.."): subtitle ENDED or SKIPPED ("..returnValue..").")
        end
        subMessageReturnedFalseTime = 0
    end

    return(returnValue)
end

--
-- Emulates     : kasfIntelEventNotEnded
-- Description  : Clears the subMessageEnded flag.  Should be called at the
--                 init of any FSM that will use "IntelEventEnded"
--
function Subtitle_ForceEventNotEnded()
    subMessageEndedFlag = 0
end

--
--  Emulates    : kasfForceIntelEventEnded
--  Description : Clears the subMessageEnded flag.  Should be called at the
--                  init of any FSM that will use "IntelEventEnded"
--
function Subtitle_ForceEventEnded()
    subMessageEndedFlag = 1
end

--
-- Emulates     : Subtitle_Add
-- Description  : Some speech events from KAS can be invoked multiple times.  We need to filter duplicates out.
--                  Here we check if the actor is free, or if (s)he was speaking a while ago.
--                  Also, duck that audio, yo.
--
KAS_SubtitleActorsToDuck = {
    Actor_HW1_FleetCommand,
    Actor_HW1_FleetIntel,
    Actor_HW1_BentusiTraders,
    Actor_HW1_Defector,
    Actor_HW1_Emperor,
    Actor_HW1_Kadesh,
}
function KAS_SubtitleAddAndRemember(actor, name, time)
    if (KASEvent_VerboseDebug ~= 0) then
        print("KAS_SubtitleAddAndRemember: actor "..actor.." says "..name.." for "..time.." seconds")
    end

    local actualTime = Subtitle_AddSkippable(actor, name, time)
    if (actualTime > time) then
        if (KASEvent_VerboseDebug ~= 0) then
            print("KAS_SubtitleAddAndRemember: time "..actualTime.." > "..time)
        end
        time = actualTime
    end

    KAS_SubtitleEvents[actor] = {}
    KAS_SubtitleEvents[actor]["EventTime"] = Universe_GameTime()
    KAS_SubtitleEvents[actor]["Duration"] = time
    KAS_SubtitleEvents[actor]["Event"] = name

    --remove all old expired events; this is the one that will expire (eventually)
    KAS_ExpiredSubtitleEvents = {}

    --should we duck audio?
    KAS_SubtitleEvents[actor]["DuckedAudio"] = 0

    local iActor = 1
    while (KAS_SubtitleActorsToDuck[iActor] ~= nil) do
        if (actor == KAS_SubtitleActorsToDuck[iActor]) then
            if (KASEvent_VerboseDebug ~= 0) then
                print("KAS_SubtitleAddAndRemember: actor "..actor.." says "..name.." at time "..KAS_SubtitleEvents[actor]["EventTime"].."...ducking audio")
            end
            KAS_SubtitleEvents[actor]["DuckedAudio"] = 1
            Sound_EnterIntelEvent()
            break
        end
        iActor = iActor + 1
    end
end
function KAS_SubtitleExpiredCheckActor(actor)
    if (KAS_SubtitleEvents[actor] ~= nil) then
        if (KAS_SubtitleEvents[actor]["DuckedAudio"] == 1) then
            local currentTime = Universe_GameTime()
            local talkTime = KAS_SubtitleEvents[actor]["EventTime"] + KAS_SubtitleEvents[actor]["Duration"]
            if (currentTime > talkTime) then
                if (KASEvent_VerboseDebug ~= 0) then
                    print("KAS_SubtitleExpiredCheckActor: actor "..actor.." said "..KAS_SubtitleEvents[actor]["Event"].." at time "..currentTime.."...un-ducking audio")
                end
                Sound_ExitIntelEvent()
                KAS_ExpiredSubtitleEvents[actor] = KAS_SubtitleEvents[actor]
                KAS_SubtitleEvents[actor] = {}
            end
        end
    end
end
function KAS_SubtitleExpiredCheck()
    local iActor = 1
    while (KAS_SubtitleActorsToDuck[iActor] ~= nil) do
        KAS_SubtitleExpiredCheckActor(KAS_SubtitleActorsToDuck[iActor])
        iActor = iActor + 1
    end
end
function KAS_SubtitleAddOnce(actor, name, time)
    currentMessage = ""
    if (Subtitle_IsDone(actor) ~= 0) then
        ---talk
        KAS_SubtitleAddAndRemember(actor, name, time)
        return
    else
        --Actor is not available, so (s)he says.  See if we've waited long enough.
        if (KAS_SubtitleEvents[actor] ~= nil) then
            currentMessage = KAS_SubtitleEvents[actor]["Event"]
            local currentTime = Universe_GameTime()
            local eventTime = 0.1
            if (KAS_SubtitleEvents[actor]["EventTime"] ~= nil) then
                eventTime = KAS_SubtitleEvents[actor]["EventTime"]
            end
            local duration = 100.1
            if (KAS_SubtitleEvents[actor]["Duration"] ~= nil) then
                duration = KAS_SubtitleEvents[actor]["Duration"]
            end
            local talkTime = eventTime + duration
            --print("KAS_SubtitleAddOnce: actor "..actor.." was saying something "..eventTime.." + "..duration.."; currentTime("..currentTime..") >= talkTime("..talkTime..")?")
            if (currentTime >= talkTime) then
                ---talk
                --print("KAS_SubtitleAddOnce: actor "..actor.." was saying "..KAS_SubtitleEvents[actor]["Event"].." >= "..KAS_SubtitleEvents[actor]["Duration"].." ago: now saying"..name)
                KAS_SubtitleAddAndRemember(actor, name, time)
                return
            else
                ---not free to talk.  Is this a new event?
                if (KAS_SubtitleEvents[actor]["Event"] ~= name) then
                    ---talk
                    --print("KAS_SubtitleAddOnce: actor "..actor.." was saying "..KAS_SubtitleEvents[actor]["Event"]..": now saying"..name)
                    KAS_SubtitleAddAndRemember(actor, name, time)
                    return
                end
            end
        end
        if (KASEvent_VerboseDebug ~= 0) then
            print("KAS_SubtitleAddOnce: actor "..actor.." skipping event "..name.." because (s)he's busy saying "..currentMessage)
        end
    end
end
--
-- Emulates     : kasfShipsOrder
-- Description  : Gets the current order of a ship group.  As the enumeration of orders between
--                  HW1 and HW2 are different, we need to call the SobGroup query and then do a mapping.
-- Return       : Returns an unumeration that is the closest approximation of HW1 order.
--
KAS_CommandTypeMapping = {}
KAS_CommandTypeMapping = {
--#define COMMAND_NULL            0
--#define COMMAND_MOVE            1
--#define COMMAND_ATTACK          2
--#define COMMAND_DOCK            3
--#define COMMAND_LAUNCHSHIP      4
--#define COMMAND_COLLECTRESOURCE 5
--#define COMMAND_BUILDINGSHIP    6
--#define COMMAND_SPECIAL         7
--#define COMMAND_HALT            8
--#define COMMAND_MILITARYPARADE  9
--#define COMMAND_MP_HYPERSPACEING  10
    [COMMAND_Idle]               = 8,
    [COMMAND_Move]               = 1,
    [COMMAND_Attack]             = 2,
    [COMMAND_Build]              = 6,
    [COMMAND_Dock]               = 3,
    [COMMAND_Resource]           = 5,
    [COMMAND_Launch]             = 4,
    [COMMAND_WaypointMove]       = 1,
    [COMMAND_Parade]             = 9,
    [COMMAND_Guard]              = 1,
    [COMMAND_Capture]            = 7,
    [COMMAND_Hyperspace]         = 10,
    [COMMAND_MoveToSob]          = 1,
    [COMMAND_FormHyperspaceGate] = 7,
    [COMMAND_HyperspaceViaGate]  = 10,
    [COMMAND_Repair]             = 7,
    [COMMAND_Retire]             = 3,
    [COMMAND_Despawn]            = 9,
    [COMMAND_LayMines]           = 7,
    [COMMAND_Salvage]            = 7,
    [COMMAND_AttackMove]         = 2,
    [COMMAND_RallyParade]        = 9,
    [COMMAND_NumCommands]        = 0   }
function KAS_GetCurrentOrder(sobGroup)
    HW2Order = SobGroup_GetCurrentOrder(sobGroup)
    --print("KAS_GetCurentOrder: HW2("..HW2Order..") => ("..KAS_CommandTypeMapping[HW2Order]..")\n")
    return(KAS_CommandTypeMapping[HW2Order])
end

--
-- Emulates     : kasTeamHyperspaceIn
-- Description  : HW1 hyperspacing in also unhides hidden ships, so I think.
--
function KAS_TeamHyperspaceIn(team, point)
    print("KAS_TeamHyperspaceIn "..team)
    --SobGroup_Spawn(team, point)
    SobGroup_HyperspaceTo(team, point)
    SobGroup_SetHidden(team, 0)
end

--
-- Emulates     : kasTeamHyperspaceOut
-- Description  :
--
function KAS_TeamHyperspaceOut(team)
    print("KAS_TeamHyperspaceOut "..team)

    -- if at "frame 0", just instantly despawn
    if (Universe_GameTime() < 1) then
        print("KAS_TeamHyperspaceOut "..team.." despawns (first frame).")
        SobGroup_Despawn(team)
    else
        --later on we'll try to hyperspace
        print("KAS_TeamHyperspaceOut "..team.." hyperspaces out.")
        SobGroup_EnterHyperSpaceOffMap(team)

        --not all ships can hyperspace.  If not, despawn.  They can do that.
        local KAS_HyperspaceTeam = "KAS_HyperspaceTeam"
        SobGroup_Create(KAS_HyperspaceTeam)
        if (SobGroup_FilterInclude(KAS_HyperspaceTeam, team, "CurrentCommand", "COMMAND_Hyperspace") == 0) then
            print("KAS_TeamHyperspaceOut "..team.." couldn't hyperspace out - despawning.")
            SobGroup_Despawn(team)
        end
    end
end

--
-- Emulates     : kasfHideShips
--                kasfUnhideShips
-- Description  : Implementing hiding of ships using SOF_Hide was causing too many problems, which may explain why it's not used in the HW2 campaign.
--                kasf[Un]Hide() would despawn the ship in place, and later spawn it back where it was.
--                We're going to have to save the despawn spot so it can be spawned back in later.
--
KAS_HidingSpots = {}
KAS_HideExceptions = {
    ["MiningBase"]                      = 14,
    ["R2Mothership"]                    = 1,
    ["GrowSelection_FriendlyHideTemp"]  = 10,
}
function KAS_SetHidden(team, bHidden)
    if (bHidden ~=0) then
        --sometimes we need to use the basic hide functionality
        --probably we should generalize these exceptions
        local exceptionMission = KAS_HideExceptions[team]
        if (exceptionMission == spGameInfo_currentMission) then
            print("KAS_SetHidden("..bHidden.."): making an exception for team "..team)
	        SobGroup_SetHidden(team, 1)    --kasfHideShips(kasAITeamShipsPtr("MiningBase"))
        else
            --save despawn vector
            local despawnVector = SobGroup_GetCentrePosition(team)
            KAS_HidingSpots[team] = despawnVector
            print("KAS_SetHidden("..team..","..bHidden.."): hiding at ("..KAS_HidingSpots[team][1]..", "..KAS_HidingSpots[team][2]..", "..KAS_HidingSpots[team][3]..")")

            SobGroup_Despawn(team)
        end
    else
        local exceptionMission = KAS_HideExceptions[team]
        if (exceptionMission == spGameInfo_currentMission) then
	        SobGroup_SetHidden(team, 0)    --kasfHideShips(kasAITeamShipsPtr("MiningBase"))
        else
            --despawn the ship back in where it was when it despawned
            if (KAS_HidingSpots[team] == nil) then
                print("KAS_SetHidden("..team..","..bHidden.."): unhiding where it is")
                local despawnVector = SobGroup_GetCentrePosition(team)

                SobGroup_SpawnToVector(team, despawnVector)
            else
                print("KAS_SetHidden("..team..","..bHidden.."): unhiding at ("..KAS_HidingSpots[team][1]..", "..KAS_HidingSpots[team][2]..", "..KAS_HidingSpots[team][3]..")")
                local despawnVector = KAS_HidingSpots[team]

                SobGroup_SpawnToVector(team, despawnVector)
            end
        end
    end
end

--
-- Emulates     : aiuGenerateRandomStandoffPoint
-- Description  : Generates a point a random distance from centre
--                  origin and orientation ignored at this time
--
function KAS_RandomStandoffPoint(centre, distance, origin, orientation)
    standoffPoint = {};
    standoffPoint[1] = RandomRange(-1, 1) * distance
    standoffPoint[2] = RandomRange(-1, 1) * distance
    standoffPoint[3] = RandomRange(-1, 1) * distance

    --...do the origin thing if needed for various KAS functions...
    standoffPoint[1] = standoffPoint[1] + centre[1]
    standoffPoint[2] = standoffPoint[2] + centre[2]
    standoffPoint[3] = standoffPoint[3] + centre[3]
    return standoffPoint
end

--
-- Emulates     : kasfTeamHyperspaceInNear
--
function KAS_TeamHyperspaceInNear(team, point, distance)
    centrePoint = Volume_GetPosition(point)
    origin = {0,0,0}
    hyperPoint = KAS_RandomStandoffPoint(centrePoint, distance, origin, 0)

    print("SobGroup_HyperspaceTo: "..team.." hyperspacing in near ("..hyperPoint[1]..", "..hyperPoint[2]..", "..hyperPoint[3]..") which is near ("..centrePoint[1]..", "..centrePoint[2]..", "..centrePoint[3]..")")

    SobGroup_HyperspaceToVector(team, hyperPoint)
end

--
-- Emulates the enemy (computer/script) player spending money on something.
-- Since the enemy is both a script and a CPU player, it'll try to spend from both, with the script player first.
--
function KAS_SpendRU(amount)

    if (Player_GetRU(1) >= amount) then
        Player_SetRU(1, Player_GetRU(1) - amount)
        return 1
    elseif (Player_GetRU(3) >= amount) then
        Player_SetRU(3, Player_GetRU(3) - amount)
        return 1
    end
    return 0
end
function KAS_CanSpendRU(amount)

    if (Player_GetRU(1) >= amount) then
        return 1
    elseif (Player_GetRU(3) >= amount) then
        return 1
    end
    return 0
end

--
-- Emulates     : kasfRequestShips
-- Description  : kasfRequestShips(char *shipType, sdword numShips)
--                const char * SobGroup_CreateShip( const char * sobGroupName, const char * shipName )
--                Notes: HW1 just requested the ships from the AI, HW2 immediately spawns them inside team-named ship with build capability.
--                       HW1 specified number of ships.  HW2 just made one squad (however large that was).  This function will ROUND UP.
--                       Here we keep track of what teams get new ships, as they're later checked in the NumberNewShipsAdded() function.
--                Potential gotcha: if some HW1 missions assume the economic cost of creating ships, well, in HW2 it's free, AFIK.
--                       If this is a real problem, we might opt to fake it with a timer system based on the build time of ship.
--
KAS_RequestVerboseDebug = 0
KAS_NewShipsMap = {}
KAS_RequestShipsGroupIndex = 0
KAS_NewShipsTempSobGroupMap = {}        --maps temp sob groups to target sob groups
function KAS_RequestShips(destTeam, shipType, numShips)

    --first see if we have a request in for this team already.  Otherwise there'll be a flood of requests.
    for iAlready = 0, KAS_RequestShipsGroupIndex do
        local alreadyGroup = "KAS_RequestShips_"..iAlready
        if (KAS_NewShipsTempSobGroupMap[alreadyGroup] ~= nil and
            KAS_NewShipsTempSobGroupMap[alreadyGroup]["destTeam"] == destTeam and
            KAS_NewShipsTempSobGroupMap[alreadyGroup]["shipType"] == shipType) then
            if (KAS_RequestVerboseDebug ~= 0) then
                print("KAS_RequestShips: already a request for '"..shipType.."', for team "..destTeam..": IGNORED.")
            end
            return
        end
    end

    if (KAS_RequestVerboseDebug ~= 0) then
        print("KAS_RequestShips: '"..shipType.."', "..numShips.." for team "..destTeam)
    end
    KAS_PlayerMothership("KAS_EnemyMothership", 1)

    if (SobGroup_Count("KAS_EnemyMothership") == 0) then
        if (KAS_RequestVerboseDebug ~= 0) then
            print("KAS_RequestShips: no enemy mothership.  No ships created.")
        end
        return
    end

    --we can't just add newly-created ships to the destination team, as they're not yet launched and ready for commands.
    --Many scripts give ships commands as soon as they're created.
    --So, we remember what these ships' destination SobGroup is and listen for their launch commands.
    KAS_RequestShipsGroupIndex = KAS_RequestShipsGroupIndex + 1
    local tempSobGroup = "KAS_RequestShips_"..KAS_RequestShipsGroupIndex
    SobGroup_CreateIfNotExist(tempSobGroup)
    KAS_NewShipsTempSobGroupMap[tempSobGroup] = {}
    KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"] = destTeam

    local nShipsCreated = 0
    local nAttemptsMade = 0          --this is a safety mechanism, in case calling SobGroup_CreateShip fails.
    local buildCost = SobGroup_GetStaticF(shipType, "buildCost")
    local BUILD_TIME_MODIFIER = 0.75
    local buildDelay = SobGroup_GetStaticF(shipType, "buildTime") * BUILD_TIME_MODIFIER

    while (nShipsCreated < numShips and nAttemptsMade < numShips) do
        if (KAS_CanSpendRU(buildCost) ~= 0) then
            KAS_NewShipsTempSobGroupMap[tempSobGroup]["shipType"] = shipType
            Rule_AddIntervalParam("KAS_RequestWait", tempSobGroup, buildDelay)

            -- newShipGroup = SobGroup_CreateShip("KAS_EnemyMothership", shipType)
            nAttemptsMade = nAttemptsMade + 1
            nShipsCreated = nShipsCreated + 1 --SobGroup_Count(newShipGroup)  --!!! doesn't work for multi-ship squads

            --SobGroup_SobGroupAdd(destTeam, newShipGroup)
            -- SobGroup_SobGroupAdd(tempSobGroup, newShipGroup)
        else
            if (KAS_RequestVerboseDebug ~= 0) then
                print("KAS_RequestShips("..shipType.."): out of RU on ship "..nShipsCreated.." of "..numShips.." for team "..destTeam)
            end
            break
        end
    end

--    if (KAS_NewShipsMap[destTeam] == nil) then
--        KAS_NewShipsMap[destTeam] = 0
--    end
--    KAS_NewShipsMap[destTeam] = KAS_NewShipsMap[destTeam] + nShipsCreated

    if (KAS_RequestVerboseDebug ~= 0) then
        local nShipsInGroup = SobGroup_Count(tempSobGroup)
        print("KAS_RequestShips: '"..shipType.."', "..numShips..": "..nShipsCreated.."/"..nShipsInGroup.." created in "..nAttemptsMade.." attempts.  Put in "..tempSobGroup)
    end
end

--
-- Rule function called after a delay to actually create the ship
--
function KAS_RequestWait(tempGroup)
    if (KAS_NewShipsTempSobGroupMap[tempGroup] ~= nil) then
        local shipType = KAS_NewShipsTempSobGroupMap[tempGroup]["shipType"]
        local destTeam = KAS_NewShipsTempSobGroupMap[tempGroup]["destTeam"]
        local buildCost = SobGroup_GetStaticF(shipType, "buildCost")

        if (KAS_SpendRU(buildCost) ~= 0) then

            --make sure there's a mothership to request ships from
            if (SobGroup_Count("KAS_EnemyMothership") == 0) then
                return
            end

            local newShipGroup = SobGroup_CreateShip("KAS_EnemyMothership", shipType)
            if (KAS_RequestVerboseDebug ~= 0) then
                print("KAS_RequestWait("..shipType.."): added to team "..destTeam)
            end
            SobGroup_SobGroupAdd(tempGroup, newShipGroup)
        else
            if (KAS_RequestVerboseDebug ~= 0) then
                print("KAS_RequestWait("..shipType.."): failed to add to "..destTeam..": out of RUs.")
            end
        end
    end

    --finished with this request for now, remove this rule
    Rule_RemoveParam("KAS_RequestWait", tempGroup)
end

--
-- Listener function called when a ship launches.  Moves ships requested in KAS_RequestShips from temp SobGroup into target SobGroup.
--
function KAS_ShipLaunchedCB(launching, launchedFrom)
    launchedType = SobGroup_GetShipType(launching)
    launchedOwner = SobGroup_GetPlayerOwner(launchedFrom)
    if (KAS_RequestVerboseDebug ~= 0) then
        print("KAS_ShipLaunchedCB: player("..launchedOwner..") launches "..launchedType)
    end

    local countLaunched = SobGroup_Count(launching)

    --iterate backwards through the list of possible temp groups and see if this ship is part of that group
    local transferGroup = "KAS_ShipLaunchedCB_temp"
    SobGroup_CreateIfNotExist(transferGroup)
    SobGroup_Clear(transferGroup)

    for iGroup = KAS_RequestShipsGroupIndex, 0, -1 do
        local tempSobGroup = "KAS_RequestShips_"..iGroup

        if (KAS_NewShipsTempSobGroupMap[tempSobGroup] ~= nil) then                      --if temp group exists
            if (KAS_RequestVerboseDebug ~= 0) then
                print("KAS_ShipLaunchedCB: seeing if it's in "..tempSobGroup.."...")
            end
            SobGroup_FillCompare(transferGroup, tempSobGroup, launching)                --ready to transfer to dest team

            local foundCount = SobGroup_Count(transferGroup)
            if (foundCount ~= 0) then                                                   --if launched ship(s) in this temp group
                if (KAS_RequestVerboseDebug ~= 0) then
                    print("KAS_ShipLaunchedCB: "..foundCount.." in "..tempSobGroup.."...")
                end

                SobGroup_FillSubtract(tempSobGroup, tempSobGroup, transferGroup)        --move from temp group to final SobGroup
                SobGroup_SobGroupAdd(KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"], transferGroup)
                if (KAS_RequestVerboseDebug ~= 0) then
                    print("KAS_ShipLaunchedCB: transferred "..foundCount.." ships to "..KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"])
                end

                --update the count of ships that are added, so that KAS_NumberNewShipsAdded returns the correct value at the time the ships are actually added to the target SobGroup.
                if (KAS_NewShipsMap[KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"]] == nil) then
                    KAS_NewShipsMap[KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"]] = 0
                end
                KAS_NewShipsMap[KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"]] = KAS_NewShipsMap[KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"]] + foundCount
                if (KAS_RequestVerboseDebug ~= 0) then
                    print("KAS_ShipLaunchedCB: NumberNewShips "..KAS_NewShipsMap[KAS_NewShipsTempSobGroupMap[tempSobGroup]["destTeam"]])
                end

                if (SobGroup_Count(tempSobGroup) == 0) then                             --if temp group emptied
                    if (KAS_RequestVerboseDebug ~= 0) then
                        print("KAS_ShipLaunchedCB: transferred everything!")
                    end
                    KAS_NewShipsTempSobGroupMap[tempSobGroup] = nil                     --kill it
                    break                                                               --done
                end
            end
        end
    end
end

--
-- Emulates     : void kasfRequestShipsOriginal(sdword percentOriginal)
-- Description  : Requests a number of ships as a percentage of the original population of the team
--
KAS_TeamCountsOriginal = {}
KAS_TeamTypeOriginal = {}
function KAS_RequestShipsOriginal(destTeam, percentOriginal)
    numShips = KAS_TeamCountOriginal(destTeam) * percentOriginal * 0.01 + 0.5
    originalType = KAS_TeamTypeOriginal[destTeam]
    if (numShips <= 0) then
        numShips = 1;
    end
    print("KAS_RequestShipsOriginal("..destTeam.."): "..percentOriginal.."% of "..KAS_TeamCountOriginal(destTeam).." = "..numShips.." type "..originalType.." REQUESTED")
    KAS_RequestShips(destTeam, originalType, numShips)
end

--
-- Emulates     : kasfNewShipsAdded
-- Description  : NewShipsAdded returns the number of ships newly added to the current team.
--                Incremented by AI, as it adds ships to the team(s).
--                Set to zero whenever it's read.
--
function KAS_NumberNewShipsAdded(teamName)
    returnValue = 0
    if (KAS_NewShipsMap[teamName] ~= nil) then
        returnValue = KAS_NewShipsMap[teamName]
        --print("KAS_NumberNewShipsAdded: newShips["..teamName.."] = "..returnValue)
        KAS_NewShipsMap[teamName] = 0
    end
    return returnValue;
end

--
-- Emulates     : sdword kasfTeamHealthAverage(void)
-- Description  : Gets average team health as a percentage (0..100)
--
function KAS_TeamHealth(team)
    return(SobGroup_HealthPercentage(team) * 100)
end

--
-- Emulates     : sdword kasfTeamHealthLowest(void)
-- Description  : Gets minimum team health as a percentage (0..100)
--
function KAS_TeamHealthLowest(team)
    return(SobGroup_MinimumHealth(team) * 100)
end

--
-- Emulates     : kasfOpenSensors, kasfCloseSensors
-- Description  : Opens or closes the sensor and takes care of setting the skippability of fleet command/intel.
-- Notes        : opening the sensors manager at a given distance only
--                requires the "flag" variable to be larger than 1000 or
--                so.  If need be, values above 1 can be used to flag
--                different cases
--
smFleetIntelState = 0
function KAS_SensorsToggle(state, flag)
    if (state ~= 0) then
        Sound_EnterIntelEvent()
        if (flag > 1) then
            smFleetIntelState = 1
            --print("KAS_SensorsToggle: distance set to "..flag..": UNSUPPORTED")
            Sensors_SetZoomOutDistance(flag * KAS_WORLD_SCALE)
        else
            smFleetIntelState = flag
        end
        --Universe_EnableSkip(1)
        Sensors_Toggle(1)
        Sensors_EnableToggle(0)
        --Sensors_EnableCameraZoom(0)
    else
        Sound_ExitIntelEvent()
        if (Sensors_ManagerIsActive() ~= 0) then
            --Universe_EnableSkip(0)            --leave skipping enabled
            Sensors_Toggle(0)
            Sensors_EnableToggle(1)
            smFleetIntelState = 0
        end
    end
end

--
-- Emulates     : kasfUniversePause, kasfUniverseUnpause
-- Description  : the HW2 functions disabled the command layer and movement, but kept AI and KAS running.
--                Universe_Pause also pauses timers, KAS.  We need to do a different sort of pause.
--
function KAS_UniversePause(state)
    if (state ~= 0) then
        --Universe_AllowPlayerOrders(0)
    else
        --Universe_AllowPlayerOrders(1)
    end
end

--
-- Emulates     : kasfAttackMothership
--
function KAS_AttackPlayerMothership(attackers)
    KAS_PlayerMothership("KAS_HumanPlayerMothership", 0)
    if (SobGroup_Count("KAS_HumanPlayerMothership") > 0) then
        print("KAS_AttackPlayerMothership: "..attackers.." attacks human player mothership.")
        KAS_Attack(attackers, "KAS_HumanPlayerMothership")
    else
        print("KAS_AttackPlayerMothership: no human player mothership to attack.")
    end
end

--
-- Emulates     : kasfTeamCountOriginal
-- Description  : Gets the population of a team at the start of the mission.  To do this, we keep a list of original
--                  populations that are 'registered' with a table of original values via the following helper function.
--
function KAS_TeamCountOriginal(team)
    count = KAS_TeamCountsOriginal[team]
    if (count ~= nil) then
        --print("KAS_TeamCountOriginal('"..team.."'): was "..count..", now is "..SobGroup_Count(team))
        return(count)
    else
        print("KAS_TeamCountOriginal('"..team.."'): unknown team; saying 0.")
        return(0)
    end
end

function KAS_TeamCountRegister(team)
    numberShips = SobGroup_Count(team)
    if (numberShips > 0) then
        KAS_TeamCountsOriginal[team] = numberShips
        KAS_TeamTypeOriginal[team] = SobGroup_GetShipType(team)
    else
        print("KAS_TeamCountRegister('"..team.."'): EMPTY")
    end
end

-- Emulation of the Traders'GUI system
--void kasfSetTraderDialog(sdword dialogNum, char *text)
--void kasfEnableTraderGUI(void)
--void kasfSetTraderDisabled(sdword disable)
--sdword kasfTraderGUIActive(void)
KAS_TradeGUILoaded = 0
KAS_TradeGUILabel = ""
KAS_TradeGUIDescription = ""
KAS_TradeGUIPrice = ""
KAS_TradeCosts = {}
KAS_TradeOffered = nil
function KAS_SetTradeString(slot, string)
    print("KAS_SetTradeString["..slot.."]: '"..string.."'...IGNORING")
end
function KAS_EnableTradeGUI()
    print("KAS_EnableTradeGUI")
end
function KAS_SetTraderDisabled(bDisabled)
    print("KAS_SetTraderDisabled("..bDisabled..")")

    if (KAS_TradeGUILoaded ~= 0 and bDisabled ~= 0) then
        UI_SetScreenVisible("bentusidialog", 0)
        KAS_TradeOffered = nil
        Rule_RemoveParam("KAS_BentusiExchangeWatch", "BentusiTeamName")
    end
end
function KAS_IsTradeGUIActive()
    return(UI_IsScreenActive("bentusidialog"))
end
function KAS_SetTradeCost(item, cost)
    print("KAS_SetTradeCost: offering "..item.." for "..cost)
    KAS_TradeCosts[item] = cost
    if (KAS_IsTradeGUIActive()) then
        KAS_TradeGUIPrice = KAS_TradeCosts[item]
        MainUI_SetItemText("bentusidialog", "m_lblTechPrice", " "..KAS_TradeGUIPrice)
    end
end
--
-- Emulates     : void kasfAllowPlayerToPurchase(char *name)
-- Description  : STUBBED OUT as regular research items.
--
--Descriptions of possible trade items from Kushan\Research.lua.  Format is DisplayName, Description.
KAS_ResearchDescriptions =
{
    ["IonCannons"] = {"$11534", "$11535"},
    ["PlasmaBombLauncher"] = {"$11512", "$11513"},
    ["DroneTechnology"] = {"$11536", "$11537"},
    ["SuperHeavyChassis"] = {"$11560", "$11561"},             --originally "RepairTech".  WTF?
}

function KAS_BentusiExchangeWatch(TeamName)
    -- make sure the Bentusi are allies, not enemy
    -- update: enable only when trade offered as otherwise the player can see the bentusi ship coming in in M04
    -- see code in KAS_AllowToPurchase which sets up this screen
    -- consider rolling this into a application-specific rule
    --traderGroup = "SOBGROUP_EnemyTraders"
    --print("KAS_BentusiExchangeWatch: "..TeamName)
    SobGroup_CreateIfNotExist(TeamName)
    if (KAS_TradeOffered ~= nil and KAS_IsTradeGUIActive() == 0) then
        --print("Bentusi trade offered - checking if selected.")
        Player_FillShipsByType(TeamName, 2, "Ben_BentusiExchange")
        if (SobGroup_Count(TeamName) > 0) then           --if friendly bentusi exchange(s)
            --print("Found friendly bentusi exchange(s).")
            if (SobGroup_Selected(TeamName) ~= 0) then        --if ship selected
                print("Found friendly selected bentusi exchange(s).  BRINGING UP TRADE GUI.")
                UI_SetScreenVisible("bentusidialog", 1)
            end
        else
            Player_FillShipsByType(TeamName, 1, "Ben_BentusiExchange")
            if (SobGroup_Count(TeamName) > 0) then           --if enemy bentusi exchanges(s)
                print("Found enemy bentusi exchanges.  MAKING ALLIDED.")
                SobGroup_SwitchOwner(TeamName, 2)
                SetAlliance(0, 2)                               --make sure allied with this player
                SetAlliance(2, 0)
            end
        end
    end

end

function KAS_AllowToPurchase(researchName)
    --Player_UnrestrictResearchOption(0, researchName)
    --print("KAS_AllowToPurchase: "..researchName)
    KAS_TradeItem = researchName
    if (KAS_IsTradeGUIActive() == 0) then
        --localizedText = researchName.." "..KAS_TradeCosts[researchName]        --!!! localize this message
        print("KAS_AllowToPurchase: "..researchName.." - ENABLING TRADE")
        if (KAS_TradeGUILoaded == 0) then
            MainUI_LoadScreen("DATA:\\UI\\NewUI\\BentusiDialog.lua", "bentusidialog")
            KAS_TradeGUILoaded = 1
        end

        --UI_SetScreenVisible("bentusidialog", 1)
        --there's code in SinglePlayerFlow that watches for selection, and makes sure the Bentusi Exhcange is allied

        Rule_AddIntervalParam("KAS_BentusiExchangeWatch", "BentusiTeamName", 0.2)

        localizedLabel = KAS_ResearchDescriptions[researchName][1]
        localizedDescription = KAS_ResearchDescriptions[researchName][2]
        KAS_TradeGUILabel = localizedLabel
        KAS_TradeGUIDescription = localizedDescription
        KAS_TradeGUIPrice = KAS_TradeCosts[researchName]
        MainUI_SetItemText("bentusidialog", "m_lblTechName", KAS_TradeGUILabel)
        MainUI_SetItemText("bentusidialog", "m_lblTechDescription", KAS_TradeGUIDescription)
        MainUI_SetItemText("bentusidialog", "m_lblTechPrice", " "..KAS_TradeGUIPrice)
        KAS_TradeOffered = researchName
    end
end
--
-- Emulates     : sdword kasfCanPlayerPurchase(char *name)
-- Description  : STUBBED OUT as regular research items.
--
function KAS_CanPurchase(researchName)
    Player_CanResearch(0, researchName)
end

--
-- Bentusi trade dialogue button callbacks
--
function KAS_BentusiTradeAcceptPressed()
    if (KAS_TradeOffered ~= nil and KAS_TradeCosts[KAS_TradeOffered] ~= nil) then
        if (Player_GetRU(0) >= KAS_TradeCosts[KAS_TradeOffered]) then
            print("Bentusi trade offer ACCEPTED.  Granting "..KAS_TradeOffered)
            KAS_GrantResearchOption(0, KAS_TradeOffered)
            --Player_UnrestrictResearchOption(0, KAS_TradeOffered)
            --Player_GrantResearchOption(0, KAS_TradeOffered)
            Player_SetRU(0, Player_GetRU(0) - KAS_TradeCosts[KAS_TradeOffered])
            KAS_TradeOffered = nil
        else
            print("Bentusi trade offer ACCEPTED, but not enough RU: "..KAS_TradeOffered)
        end
        SobGroup_DeSelectAll()
    else
        print("No trade offered.  NOTHING ACCEPTED.")
    end
end
function KAS_BentusiTradeDeclinePressed()
    print("Bentusi trade offer DECLINED!")
    SobGroup_DeSelectAll()
end

--
-- Set some ships as inherently visible and set a timeout to remove this visibility.
--
KAS_FocusVisibleShipsGroup = "KAS_FocusVisibleShipsGroup"
KAS_FocusVisIndex = 0
function KAS_FocusShipsRemember(ships, distance)
    local groupName = KAS_FocusVisibleShipsGroup..KAS_FocusVisIndex
    KAS_FocusVisIndex = KAS_FocusVisIndex + 1

    print("KAS_FocusShipsRemember: making "..ships.." (within distance "..distance..":) inherenly visible for 45 seconds")
    SobGroup_Create(groupName)
    SobGroup_Copy(groupName, ships)
    --optionally include nearby ships
    if (distance > 0) then
        local ownerIndex = SobGroup_GetPlayerOwner(ships)
        local point = SobGroup_GetCentrePosition(ships)
        SobGroup_FillProximityPoint(groupName, "Player_Ships"..ownerIndex, point, distance)
    end
    SobGroup_SetInherentVisibility(groupName, 0, VisFull)
    Rule_AddIntervalParam("KAS_VisibilityTimeout", groupName, 45)
end

--
-- Rule function for delayed removal of inherent vis
--
function KAS_VisibilityTimeout(ships)
    print("KAS_FocusShipsRemember: making "..ships.." visibility timeout.")
    SobGroup_SetInherentVisibility(ships, 0, VisNone)
    Rule_RemoveParam("KAS_VisibilityTimeout", ships)
    SobGroup_Clear(ships)
end

--
-- Emulates     : void kasfTutCameraFocus(GrowSelection *ships)
-- With         : void Camera_FocusSobGroupWithBuffer(const char* sobGroupName, float distance, float bufferDistance, float time)
-- Description  : HW1 often did two focusses in a row, to focus "normal" and then focus close (as per the
--                keyboard focus commands).  To emulate this we keep track of when the focus command was issued and
--                re-issue the command at a closer distance if need be.
--
KAS_FocusLastGameTime = -1
function KAS_FocusShipsAndNearby(ships, distance)
    print("Focus (NEAR) on a ships "..ships..", showing ships within "..distance)

    --by default, set zoom distance to current camera zoom
    focusDistance = Camera_GetLastZoomAmount()
    currentTime = Universe_GameTime()
    --if zoom was just issued, re-issue with a super close zoom
    if (KAS_FocusLastGameTime == currentTime) then
        focusDistance = 10
    end
    KAS_FocusLastGameTime = currentTime
    bufferDistance = focusDistance / 4
    if (SobGroup_Count(ships) > 0) then
        Camera_CollapseOnTimeout(0);
        Camera_FocusSobGroupWithBuffer(ships, focusDistance, bufferDistance, 1.5)

        KAS_FocusShipsRemember(ships, distance)
    else
        --focus on current selection
        currentSelection = MainUI_CurrentSelection()
        --Homeworld code calls this function, which seems mostly for researh ships
        --  MakeShipMastersIncludeSlaves((SelectCommand *)&tempselected);
        --
        Camera_FocusSobGroupWithBuffer(currentSelection, focusDistance, bufferDistance, 1.5)
    end
end

function KAS_FocusShips(ships)
    KAS_FocusShipsAndNearby(ships, 0)
end

--
-- Emulates     : void kasfTutCameraFocusFar(GrowSelection *ships)
-- With         : void Camera_FocusSobGroupWithBuffer(const char* sobGroupName, float distance, float bufferDistance, float time)
--
CAMERA_FAR_DISTANCE     =   6000.0
function KAS_FocusShipsFar(ships)
    print("Focus (FAR) on a ships "..ships)
    if (SobGroup_Count(ships) > 0) then
        Camera_CollapseOnTimeout(0);
        Camera_FocusSobGroupWithBuffer(ships, CAMERA_FAR_DISTANCE, CAMERA_FAR_DISTANCE / 2 , 1.5)
        KAS_FocusShipsRemember(ships, 0)
    else
        --focus on current selection
        currentSelection = MainUI_CurrentSelection()
        Camera_FocusSobGroupWithBuffer(currentSelection, CAMERA_FAR_DISTANCE, CAMERA_FAR_DISTANCE / 2 , 1.5)
    end
end

--
-- Emulates     : kasfFocusDerelict
-- With         : void Camera_FocusSobGroupWithBuffer(const char* sobGroupName, float distance, float bufferDistance, float time)
-- Description  : HW1 often did two focusses in a row, to focus "normal" and then focus close (as per the
--                keyboard focus commands).  To emulate this we keep track of when the focus command was issued and
--                re-issue the command at a closer distance if need be.
--
function KAS_FocusDerelict(derelictType)
    print("Focus on a derelict called "..derelictType)
    SobGroup_Create("KAS_FocusDerelictGroup")
    Player_FillShipsByType("KAS_FocusDerelictGroup", 1, derelictType)
    count = SobGroup_Count("KAS_FocusDerelictGroup")
    if (count > 1) then
        print("There are "..count.." objects named "..derelictType..": using first one")
        SobGroup_FillShipsByIndexRange("KAS_FocusDerelictGroup", "KAS_FocusDerelictGroup", 0, 1)
        count = 1
    end

    if (count == 1) then
        KAS_FocusShips("KAS_FocusDerelictGroup")
    else
        print("There are "..count.." objects named "..derelictType..".  That's too many or too few; NOT FOCUSING")
    end

end

--
-- Emulates     : void kasfTutCameraFocusCancel(void)
--
function KAS_FocusCancel()
    print("KAS_FocusCancel")
    Camera_FocusCancel()
    Camera_CollapseOnTimeout(1);
end

--
-- Emulates     : kasfTutCameraFocusedOnShipType
--
function KAS_FocussedOnShipType(shipTypeList, listLength)
    hasFocussedSobGroup = "KAS_FocussedOnShipType_Query"
    iTypeList = 1
    while(iTypeList <= listLength) do
        print("KAS_FocussedOnShipType: are we focussed on a "..shipTypeList[iTypeList].."?")

        iPlayerIndex = 0
        while (iPlayerIndex <= 1) do
            Player_FillShipsByType(hasFocussedSobGroup, iPlayerIndex, shipTypeList[iTypeList])
            if (SobGroup_Count(hasFocussedSobGroup) > 0) then
                if (Camera_PlayerHasFocused(hasFocussedSobGroup)) then
                    return(1)
                end
            end
            iPlayerIndex = iPlayerIndex + 1
        end

        iTypeList = iTypeList + 1
    end
    return(0)
end

--
-- Emulates     : kasfMusicPlay
--                kasfMusicStop
-- Description  : Plays music using a best mapping of HW2 music track types.
--                HW1 uses musicPlay/musicStop calls, where HW2 uses just musicPlay.
--                We emulate the HW1 functionality by saving the current music track when we invoke a new track.
--
KAS_PreviousMusicTrack = ""
KAS_PreviousMusicType = -1
KAS_CurrentMusicTrack = ""
KAS_CurrentMusicType = -1
function KAS_MusicPlayType(track, type)
    KAS_PreviousMusicTrack = Sound_CurrentMusicTrack()
    KAS_PreviousMusicType = Sound_CurrentMusicType()
    Sound_MusicPlayType(track, type)
    KAS_CurrentMusicTrack = track
    KAS_CurrentMusicType = type
end
function KAS_MusicStop(fadeTime)
    if (KAS_PreviousMusicTrack ~= "") then
        Sound_MusicPlayType(KAS_PreviousMusicTrack, KAS_PreviousMusicType)
        KAS_CurrentMusicTrack = KAS_PreviousMusicTrack
        KAS_CurrentMusicType = KAS_PreviousMusicType
    end
end

function KAS_SavedMusicRestore()
    if (KAS_CurrentMusicTrack ~= "") then
        Sound_MusicPlayType(KAS_CurrentMusicTrack, KAS_CurrentMusicType)
    end
end

--
-- Emulates     : kasfThisTeamIs
-- With         : A direct comparison of names.  Could be done as a regular expression in the converter.  Or here as a function.
--
function KAS_TeamNamesEqual(team0, team1)
    if (team0 == team1) then
        return(1)
    else
        return(0)
    end
end

--
-- Emulates     : kasfLaunch
-- Description  : KAS scripts have special logic for launching of ships, so I've implemented a set of flags to emulate that behaviour
--
KAS_LaunchVerboseDebug = 0
function KAS_Launch(teamName)
    if (KAS_LaunchVerboseDebug ~= 0) then
        print("KAS_Launch: team "..teamName.." LAUNCHED")
    end
    SobGroup_SetScriptFlag(teamName, (SPECIAL_LaunchedFromKas + SPECIAL_KasCheckDoneLaunching))
    SobGroup_LaunchSelf(teamName)
end

--
-- Emulates     : kasfTeamFinishedLaunching
-- Description  : Checks ships against a flag that is set with a launch order, but cleared when the ship actually launches.
--
function KAS_TeamFinishedLaunching(teamName)
    --count how many have launched
    numberUnlaunched = SobGroup_CountByScriptFlag(teamName, SPECIAL_KasCheckDoneLaunching)
    numberTotal = SobGroup_Count(teamName)

    if (numberTotal > 0 and numberUnlaunched == 0) then
        if (KAS_LaunchVerboseDebug ~= 0) then
            print("KAS_TeamFinishedLaunching: team "..teamName.." has LAUNCHED all "..numberTotal.." ships")
        end
        return(1)
    else
        if (KAS_LaunchVerboseDebug ~= 0) then
            print("KAS_TeamFinishedLaunching: "..teamName.." of "..numberTotal.." ships, "..numberUnlaunched.." still UNLAUNCHED")
        end
        return(0)
    end
end

function KAS_TeamLaunchCallback(teamName)
end


--
-- Emulates     : kasfTeamDocking
-- Description  : Looking at the HW1 code it looks like this always returned 0, as it's testing against a flag TEAM_DOCKING, which is never set.
--                This might have been a bug, so we can also check against a command mask.
--
function KAS_TeamIsDocking(teamName)

    --proper Homeworld emulation
    --return(0)

    --more sensible implementation: actually check if docking
    countDocking = SobGroup_CountByFilterInclude(teamName, "CurrentCommand", "COMMAND_Dock");
    if (countDocking > 0) then
        numberTotal = SobGroup_Count(teamName)
        print("KAS_TeamIsDocking: "..teamName.." IS docking "..countDocking.." out of "..numberTotal.." ships")
        return(1)
    else
        print("KAS_TeamIsDocking: "..teamName.." IS NOT docking")
        return(0)
    end
end

--
-- Emulates     : kasfTeamFuelAverage
-- Description  : HW2 does not use fuel, so always returns 100%.  Only used in Mission05 for non-swarmer ships anyhow.
--                If fuel is emulated, then it would go here...
--
function KAS_TeamFuelAverage(teamName)
    --...check fuel if this is a team of swarmers
    return(100)
end

--
-- Emulates     : kasfTeamFuelLowest
-- Description  : HW2 does not use fuel, so always returns 100%.  Only used in Mission05 for non-swarmer ships anyhow.
--                If fuel is emulated, then it would go here...
--
function KAS_TeamFuelLowest(teamName)
    --...check fuel if this is a team of swarmers
    return(100)
end

--
-- Create message queues
--
KAS_MessageQueues = {}      --queued messages for each team
KAS_MessageQueueNames = {}  --queue names.  Only needed for iterating the Queues, as this version of lua does not support pairs(<table>)
function KASMessageQueueCreate(group)
    KAS_MessageQueues[group] = {}
    index = 1
    while (KAS_MessageQueueNames[index] ~= nil) do
        if (KAS_MessageQueueNames[index] == group) then
            return
        end
        index = index + 1
    end
    KAS_MessageQueueNames[index] = group    --Only needed for iterating the Queues, as this version of lua does not support pairs(<table>)
end

--
-- Emulates     : void kasfMsgSend(struct AITeam *team, char *msg)
-- Description  : send a message to a named team
--
KASMessage_VerboseDebug = 0
function KAS_MessageSend(fromTeam, toTeam, message)
    if (fromTeam ~= nil) then
        if (KASMessage_VerboseDebug ~= 0) then
            print("KAS_MessageSend: team "..fromTeam.." says '"..message.."' to "..toTeam)
        end
    else
        if (KASMessage_VerboseDebug ~= 0) then
            print("KAS_MessageSend: team <nil> says '"..message.."' to "..toTeam)
        end
    end
    if (KAS_MessageQueues[toTeam][message] ~= nil) then
        KAS_MessageQueues[toTeam][message] = KAS_MessageQueues[toTeam][message] + 1
    else
        KAS_MessageQueues[toTeam][message] = 1
    end
    KAS_MessageQueues[toTeam]["sender"] = fromTeam
end

--
-- Emulates     : void kasfMsgSendAll(char *msg)
-- Description  : Send a message to all teams
--
function KAS_MessageSendToAll(fromTeam, message)
    if (fromTeam ~= nil) then
        if (KASMessage_VerboseDebug ~= 0) then
            print("KAS_MessageSendToAll: team "..fromTeam.." says '"..message.."' to ALL")
        end
    else
        if (KASMessage_VerboseDebug ~= 0) then
            print("KAS_MessageSendToAll: team <nil> says '"..message.."' to ALL")
        end
    end
    index = 1
    while (KAS_MessageQueueNames[index] ~= nil) do
        if (KAS_MessageQueues[KAS_MessageQueueNames[index]][message] ~= nil) then
            KAS_MessageQueues[KAS_MessageQueueNames[index]][message] = KAS_MessageQueues[KAS_MessageQueueNames[index]][message] + 1
        else
            KAS_MessageQueues[KAS_MessageQueueNames[index]][message] = 1
        end
        KAS_MessageQueues[KAS_MessageQueueNames[index]]["sender"] = fromTeam
        index = index + 1
    end
end

--
-- Emulates     : sdword kasfMsgReceived(char *msg)
-- Description  : check if a message has been received. Returns 1 if so, 0 otherwise.
--
function KAS_MessageReceived(toTeam, message)
    if (KAS_MessageQueues[toTeam] ~= nil and KAS_MessageQueues[toTeam][message] ~= nil) then
        if (KASMessage_VerboseDebug ~= 0) then
            print("KAS_MessageReceived: "..toTeam.." RECEIVES message '"..message.."' "..KAS_MessageQueues[toTeam][message].." times")
        end

        KAS_MessageQueues[toTeam][message] = KAS_MessageQueues[toTeam][message] - 1
        if (KAS_MessageQueues[toTeam][message] <= 0) then
            KAS_MessageQueues[toTeam][message] = nil
        end
        return(1)
    end
    return(0)
end

--
-- Who last sent a message?  Returns last sender, or "" if nobody.
--
function KAS_MessageSender(toTeam)
    if (KAS_MessageQueues[toTeam] ~= nil and KAS_MessageQueues[toTeam]["sender"] ~= nil) then
        return(KAS_MessageQueues[toTeam]["sender"])
    end
    if (KASMessage_VerboseDebug ~= 0) then
        print("KAS_MessageSender: no sender for team "..toTeam..": using empty string!")
    end
    return("")
end

--
-- Emulates     : sdword kasfMsgReceived(char *msg)
-- Description  : returns true if any of the listed messages have been received.
--                Resets the message queue every time it is queried, even if no match is made.
--
function KAS_GameMessageReceived(messages)
    iParam = 1
    while (messages[iParam] ~= nil) do
        --print("Param["..iParam.."] = "..messages[iParam])
        if (singlePlayerGameMessagesReceived[messages[iParam]] == 1) then
            if (KASMessage_VerboseDebug ~= 0) then
                print("KAS_GameMessageReceived: received message: "..messages[iParam])
            end
            singlePlayerGameMessagesReceived[messages[iParam]] = nil
            return 1
        end
        iParam = iParam + 1
    end

    --print("KAS_GameMessageReceived: "..messages.." NOT RECEIVED")
    --singlePlayerGameMessagesReceived = {}
    return 0
end
function KAS_ResetGameMessageQueue()
    singlePlayerGameMessagesReceived = {}
end


-- Emulations of:
--  void kasfPingAddShips(GrowSelection *ships, char *label)
--  void kasfPingAddPoint(hvector *point, char *label)
--  void kasfPingRemove(char *label)
-- With:
--  udword Ping_AddPoint( const char* pingName, const char* templateName, const char* volumeName )
--  udword Ping_AddSobGroup( const char* pingName, const char* templateName, const char* sobGroupName )
--  void Ping_Remove( udword pingID )
-- Description  : Maintain a mapping from label->(possibly many) pingIDs
--
KAS_PingNameMap = {}
function KAS_PingAddShips(ships, label, name)
    pingID = Ping_AddSobGroup(name, "anomaly", ships)

    --add to a list of pingIDs for this label
    iPingID = 1
    if (KAS_PingNameMap[label] == nil) then
        KAS_PingNameMap[label] = {}
    end
    while (KAS_PingNameMap[label][iPingID] ~= nil) do
        iPingID = iPingID + 1
    end
    KAS_PingNameMap[label][iPingID] = pingID
end
function KAS_PingAddPoint(point, label, name)
    pingID = Ping_AddPoint(name, "anomaly", point)
    --add to a list of pingIDs for this label
    iPingID = 1
    if (KAS_PingNameMap[label] == nil) then
        KAS_PingNameMap[label] = {}
    end
    while (KAS_PingNameMap[label][iPingID] ~= nil) do
        iPingID = iPingID + 1
    end
    KAS_PingNameMap[label][iPingID] = pingID
end
function KAS_PingRemove(label, name)
    --find all pings with label, remove them
    if (KAS_PingNameMap[label] ~= nil) then
        iPingID = 1
        while (KAS_PingNameMap[label][iPingID] ~= nil) do
            Ping_Remove(KAS_PingNameMap[label][iPingID])
            KAS_PingNameMap[label][iPingID] = nil
            iPingID = iPingID + 1
        end
        KAS_PingNameMap[label] = nil
    end
end

--
-- Emulates     : sdword kasfRenderedDerelicts(char *derelictType, sdword LOD)
--                sdword kasfRenderedShips(GrowSelection *ships, sdword LOD)
-- Description  : check if any derelic with the named type have been rendered at the specified LOD
--
function KAS_DerelicHasBeenRendered(derelict, LOD)
    --assumption: all derelicts are not the player's and hence are player #1
    allDerelicts = Player_GetShipsByType(1, derelict)
    return(KAS_ShipHasBeenRendered(allDerelicts, LOD))
end

function KAS_ResetDerelicRenderedFlags(derelict)
    --assumption: all derelicts are not the player's and hence are player #1
    allDerelicts = Player_GetShipsByType(1, derelict)
    SobGroup_ResetRenderedFlags(allDerelicts)
end

function KAS_ShipHasBeenRendered(ships, LOD)
    --here we convert the LOD to a distance, using the HW1 Shipwreck as the prototype
    local distance = 0
    if (LOD == 0) then
        distance = 4448
    elseif (LOD == 1) then
        distance = 7408
    elseif (LOD == 2) then
        distance = 15352
    elseif (LOD == 3) then
        distance = 37989
    else
        distance = 9999999
    end
    return(SobGroup_HasBeenRendered(ships, distance * KAS_WORLD_SCALE))
end
function KAS_ResetShipRenderedFlags(ships)
    SobGroup_ResetRenderedFlags(ships)
end

--
-- Emulates     : kasfRotateDerelictType
--
function KAS_TumbleSobGroup(tumbleGroup, rot_x, rot_y, rot_z, variation)
    realrot_x     = rot_x / 1000
    realrot_y     = rot_y / 1000
    realrot_z     = rot_z / 1000
    realvariation = variation / 1000

    realrot_x = realrot_x + RandomRange(-realvariation, realvariation)
    realrot_y = realrot_y + RandomRange(-realvariation, realvariation)
    realrot_z = realrot_z + RandomRange(-realvariation, realvariation)

    --transform the tumble vector as per the position HW1->HW2 coordinate conversion
    tumbleVector = {realrot_x * -1, realrot_z, realrot_y}

    SobGroup_Tumble(tumbleGroup, tumbleVector)
end

--
-- Emulates     : kasfRotateDerelictType
--
function KAS_TumbleDerelict(derelictType, rot_x, rot_y, rot_z, variation)
    --assumption: all derelicts are not the player's and hence are player #1
    allDerelicts = Player_GetShipsByType(1, derelictType)
    KAS_TumbleSobGroup(allDerelicts, rot_x, rot_y, rot_z, variation)
end

--
-- Emulates     : kasfMissionFailed
-- Description  : Mission failure was mission-specific in HW2.  In HW1 it was the same for every level.  Hence, here a one-size-fits-all approach,
--
function KAS_MissionFailed()

    Event_Start( "MissionFailed" )

    print( "KAS_MissionFailed" )

    singlePlayerMissionFailedCB();
end

--= Stock Rules used by all missions ==================================================================================

Events = {} -- the name of this table must always be Events - this is what the game looks for
Events.MissionFailed =
{
    {
        HW2_Fade( 1 ),
        HW2_Wait(2),
    },
    {
        HW2_LocationCardEvent( "$5851", 4 ),

    },
    {
        { "setMissionComplete( 0 )","" },
    },
}
Events.CampaignSuccess =
{
    --already letterboxed
    {
        { "Universe_AllowPlayerOrders( 0 )", "" },
        --{ "Universe_SlowDown(0, 0.25)", "" },
        HW2_Wait( 1 ),
    },
    {
        { "MainUI_FadeTo(3, 1, {1,1,1})", "" },
        { "Sound_EnterIntelEvent()","" },
        { "Sound_SetMuteActor('Fleet')", ""},
        HW2_Wait( 1 ),
    },
    --{
        --HW2_SubTitleEvent( Actor_HW1_FleetIntel, "VICTORY TEXT 01", 4 ),
    --},
    --{
        --HW2_Wait( 1 ),
    --},
    --{
        --HW2_SubTitleEvent( Actor_HW1_FleetCommand, "VICTORY TEXT 02", 4 ),
    --},
    {
        HW2_Wait( 2 ),
    },
    --already faded to white
    {
        HW2_LocationCardEvent( "$5852", 4 ),
    },
    {
        HW2_Wait( 2 ),
    },
    {
        { "setMissionComplete( 1 )","" },
    },
}

--
-- Make killer asteroids start moving toward player
--
function KAS_KillerAsteroidsMove()
    print("Asteroid0sCanMove")

    Selection_Create("AllAsteroids")
    count = Selection_GetResources("AllAsteroids", "Asteroid")
    print("Number asteroids = "..count)

    filter = ATTRIBUTES_VelToMothership + ATTRIBUTES_DontApplyFriction
    Selection_Create("KillerAsteroids")
    count = Selection_FilterInclude("KillerAsteroids", "AllAsteroids", "ScriptFlagsSetAll", ""..filter.."", "")

    towardsVector = Volume_GetPosition("TowardsVector")
    towardsVector = Vector3_Normalize(towardsVector)
    attrVELOCITY_TOWARDS = 125 * 0.35

    towardsVector[1] = towardsVector[1] * attrVELOCITY_TOWARDS
    towardsVector[2] = towardsVector[2] * attrVELOCITY_TOWARDS
    towardsVector[3] = towardsVector[3] * attrVELOCITY_TOWARDS

    print("towardsVector = ("..towardsVector[1]..", "..towardsVector[2]..", "..towardsVector[3]..")")
    Selection_SetVelocity("KillerAsteroids", towardsVector)
end

--
-- Emulates:   kasfEnableAllAIFeatures
--
function KAS_EnableAllAIFeatures()
    CPU_DoString(3, "HW1CPUEnableAllAIFeatures()")
end

--
-- Emulates:   kasfDisableAllAIFeatures
--
function KAS_HW1CPUDisableAllAIFeatures()
    CPU_DoString(3, "HW1CPUDisableAllAIFeatures()")
end

--
-- Emulates:   kasfEnableAIFeature
--
function KAS_HW1CPUEnableAIFeature(feature, type)
    CPU_DoString(3, "HW1CPUEnableAIFeature("..feature..", "..type..")")
end

--
-- Emulates:   kasfDisableAIFeature
--
function KAS_HW1CPUDisableAIFeature(feature, type)
    CPU_DoString(3, "HW1CPUDisableAIFeature("..feature..", "..type..")")
end

--
-- Emulates:   kasfBuildControl
--
function KAS_BuildControl(bOn)
    CPU_DoString(3, "HW1CPUBuildControl("..bOn..")")
end

function KAS_CPUPlayerInit()

    --player1: the default enemy player.  KAS-controlled.
    CPU_Enable(1, 0)
--    CPU_SetDebug(1, 1)
--    CPU_DoString(1, "HW1CPUPlayerInit()")
--    CPU_DoString(3, "HW1CPUBuildControl(0)")
--    CPU_DoString(3, "HW1CPUTacticalControl(0)")

    --player2: human player's allies
    CPU_Enable(2, 0)

    --player3: the CPU-player-controlled player.
    CPU_Enable(3, 1)
    CPU_SetDebug(3, 1)
    CPU_DoString(3, "HW1CPUPlayerInit()")
    CPU_DoString(3, "HW1CPUBuildControl(0)")
    CPU_DoString(3, "HW1CPUTacticalControl(1)")

    SetAlliance(1, 3)                               --make sure the two CPU players are allied
    SetAlliance(3, 1)
end

--
-- Emulates:    kasfTeamGiveToAI
--
function KAS_GiveToCPUPlayer(team)
    print("KAS_GiveToCPUPlayer: give team "..team.." to CPU player.")

    SobGroup_SwitchOwner(team, 3)                   --move ship(s) to allied player: this player has full fleet control
end

--
-- Emulates:    kasfTeamAttributesSet: sets the attributes flags of the ships.  Based on use cases in the KAS, also works for:
--              kasfTeamAttributesBitSet
--
function KAS_TeamAttributesSet(team, attributes)
    if (attributes == ATTRIBUTES_StripTechnology) then
        --Ghost ship in M09
        --...
        print("KAS_TeamAttributesSet: "..team.." StripTechnology NOT SUPPORTED (yet).")
    elseif (attributes == ATTRIBUTES_StartInHS) then
        --M01, M16
        SobGroup_Despawn(team)
        print("KAS_TeamAttributesSet: "..team.." is in hyperspace.")
    elseif (attributes == ATTRIBUTES_Defector) then
        --M04, <06, M09, M11, M12, M16
        --...defect to allied team.  Needs allied colour ATI
        SobGroup_SwitchOwner(team, 2)                   --move ship(s) to allied player
        SetAlliance(0, 2)                               --make sure allied with this player
        SetAlliance(2, 0)
        print("KAS_TeamAttributesSet: "..team.." is allied with human.")
    elseif (attributes == ATTRIBUTES_SMColorYellow) then

    elseif (attributes == ATTRIBUTES_SMColorGreen) then
        --colour changing to allied or colour.  Goes along with becoming allied or friendly.
    elseif (attributes == ATTRIBUTES_SMColorInvisible) then
        --M13 special case: junkyard dawg and auto-guns didn't show up in SM.  No easy way to do that in HW2.
        print("KAS_TeamAttributesSet: "..team.." is meant to be INVISIBLE in sensors manager.")
    else
        print("KAS_TeamAttributesSet: "..team..", "..attributes.." NOT SUPPORTED")
    end
end

--
-- Emulates:    kasfShipsSwitchPlayerOwner
--
function KAS_ShipsSwitchPlayerOwner(team)
    if (SobGroup_GetPlayerOwner(team) == 0) then
        --going from player to KAS
        SobGroup_SwitchOwner(team, 1)
        --...set as defector
        --...if DDDFrigate, which owner of drones
        if (SobGroup_GetShipType(team) == "Kus_DroneFrigate") then
            print("Team "..team.." contains a Kus_DroneFrigate.  Do the drones change owner OK?")
        end
    else
        SobGroup_SwitchOwner(team, 0)
        --going from KAS to player
        --...remove from all KAS-specific SobGroups
        SobGroup_RemoveFromAll(team)
        --...if DDDFrigate, which owner of drones
        if (SobGroup_GetShipType(team) == "Kus_DroneFrigate") then
            print("Team "..team.." contains a Kus_DroneFrigate.  Do the drones change owner OK?")
        end
        --...clear the SOF_Disabled flag...
    end
end

--
-- Emulates:    kasfDisablePlayerHyperspace
--
function KAS_DisablePlayerHyperspace()
    spGameInfo_hyperspaceFails = 1
end

--
-- Emulates:    kasfSetSwarmerTargets
--
function KAS_SetSwarmerTargets(swarmers, targets)
    --since we're not (yet) supporting swarmers fully, we'll just tell them to attack
    KAS_Attack(swarmers, targets)
end

--
-- Emulates:    kasfSwarmMoveTo
-- Description: Moves swarmers and fuel pods separately so attackers arrive fast, but the pods come to support as well.
--
function KAS_SwarmMoveTo(swarmers, targets)
    fuelPodGroup = "SWARM_FuelPods"
    swarmerGroup = "SWARM_Swarmers"
    SobGroup_CreateIfNotExist(fuelPodGroup)
    SobGroup_CreateIfNotExist(swarmerGroup)
    SobGroup_FilterInclude(fuelPodGroup, swarmers, "ShipType", "Kad_FuelPod")
    SobGroup_FillSubtract(swarmerGroup, swarmers, fuelPodGroup)
    SobGroup_MoveToSobGroup(fuelPodGroup, targets)
    SobGroup_MoveToSobGroup(swarmerGroup, targets)
end

--
-- Emulates:    kasfShipsSetNonRetaliation
--              kasfShipsSetRetaliation
-- Description: Emulated with tactics: don't retaliate is passive, retaliate is aggressive.  May need additional care to emulate the HW1 behaviour.
--
function KAS_ShipsSetRetaliation(team, bRetaliate)
    SobGroup_SetRetaliation(team, bRetaliate)
    if (bRetaliate ~= 0) then
        SobGroup_SetROE(team, 0)    --AggressiveROE
    else
        SobGroup_SetROE(team, 2)    --PassiveROE
    end
end

--
-- Emulates:    kasfSensorsWeirdness
-- weirdnessLevel - ranges from 160 (full weirdness) to 0 (no weirdness)
--
KAS_WeirdnessLevel = 0
WEIRDNESS_INTERVAL = 0.1
function KAS_SensorsWeirdness(weirdnessLevel)
    --print("KAS_SensorsWeirdness: setting sensors weirdness level to "..weirdnessLevel.." IGNORED (for now).")
    if (weirdnessLevel > 0) then
        --no weirdness yet.  Create an update rule.
        if (KAS_WeirdnessLevel == 0) then
            Rule_AddIntervalParam("KAS_WeirdnessUpdate", "Weirdness", WEIRDNESS_INTERVAL)
        end
    elseif (Rule_ExistsParam("KAS_WeirdnessUpdate", "Weirdness") ~= 0) then
        --no more weirdness; remove the rule
        Rule_RemoveParam("KAS_WeirdnessUpdate", "Weirdness")
    end
    KAS_WeirdnessLevel = weirdnessLevel
end

--
-- Emulates:    kasfTeamMakeCrazy
--
function KAS_TeamMakeCrazy(team, bCrazy)
    crazyTime = bCrazy * 9999
    SobGroup_Disable(team, crazyTime)
    --!!! Should ideally tumble based on the target's properties, maybe mass
    KAS_TumbleSobGroup(team, 0, 0, 0, 200)
end

--
-- Emulates:    kasfShipsAdd
--
function KAS_ShipsAdd(group1, group2)
    SobGroup_SobGroupAdd(group1, group2)
    return(SobGroup_Count(group1))
end

--
-- Emulates:    kasfSpecialToggle
--
function KAS_SpecialToggle(team)
    print("Team "..team.." toggles its special ability.")

    --in HW1, laying mines was a special
    specialGroup = "SPECIALTOGGLE_Group"
    SobGroup_CreateIfNotExist(specialGroup)
    SobGroup_FilterInclude(specialGroup, team, "ShipType", "Tai_MinelayerCorvette")
    if (SobGroup_Count(specialGroup) > 0) then
        --print("KAS_SpecialToggle("..team.."): Some Tai_MinelayerCorvettes are going to lay some mines now.")
        mineCentre = SobGroup_GetCentrePosition(specialGroup)
        SobGroup_DeployMinesInSphere(specialGroup, mineCentre, 1000, 1)
        return
    end

    --in HW1 cloak was a special, it's a specific command in HW2, though the API is a bit strange.  In both cases it's a toggle
    SobGroup_FilterInclude(specialGroup, team, "Ability", "CloakAbility")
    if (SobGroup_Count(specialGroup) > 0) then
        SobGroup_CloakToggle(specialGroup)
        return
    end

    --other specials are customCommand in HW2
    SobGroup_FilterInclude(specialGroup, team, "Ability", "CustomCommand")
    if (SobGroup_Count(specialGroup) > 0) then
        SobGroup_CustomCommand(specialGroup)
        return
    end


    --...we don't (yet) support...
    specialType = SobGroup_GetShipType(team)
    print("Team "..team.." toggles its special ability.  NOT SUPPORTED YET for type "..specialType)

end

--
-- Emulates:    void kasfGuardMothership(void)
--
function KAS_GuardMothership(team)
    print("KAS_GuardMothership: "..team.." GUARDING mothership")
    mothershipGroup = "GUARDMOTHERSHIP_Group"
    SobGroup_CreateIfNotExist(mothershipGroup)
    KAS_PlayerMothership(mothershipGroup, 1)
    SobGroup_GuardSobGroup(team, mothershipGroup)
end

--
-- Emulates:    void kasfIntercept(GrowSelection *targets)
--
function KAS_Intercept(team, targets)
    print("KAS_Intercept: "..team.." INTERCEPTS "..targets..".  NOT INTERCEPTING: Just a regular attack.")
    SobGroup_Attack(1, team, targets)
end

--
-- Emulates:    kasfMissionCompleted
--
function KAS_CampaignComplete()

    print( "KAS_CampaignComplete" )

    Event_Start( "CampaignSuccess" )

    singlePlayerMissionCompleteCB();

end

--
-- Emulates:    void kasfToggleActor(sdword Actor, sdword on)
-- With:        void Sound_SetMuteActor(const char* actorname)
--
function KAS_SetMuteActor(actorID, bActive)
    if (bActive == 0) then
        if (actorID == 2048) then
            Sound_SetMuteActor("Fleet");
        else
            print("KAS_SetMuteActor: trying to mute actor "..actorID..": NOT MUTED.")
        end
    else
        Sound_SetMuteActor("");
    end
end

--
-- Emulates:    kasfFindDistance
-- Description: Gets the distance between two points
--
KAS_WORLD_SCALE = 0.35      --expose this value to the KAS a little better, please
function KAS_FindDistance(pointA, pointB)
    vectorA = Volume_GetPosition(pointA)
    vectorB = Volume_GetPosition(pointB)
    length = Vector3_Magnitude(Vector3_Subtract(vectorA, vectorB))
    --return(length / KAS_WORLD_SCALE)
    return(length)
end

--
-- Emulates:    sdword kasfFindShipsNearPoint(GrowSelection *ships, hvector *location, sdword radius)
--
KAS_FindShipsNearPoint_TempCentre = nil
function KAS_FindShipsNearPoint(group, point, distance)

    if (KAS_FindShipsNearPoint_TempCentre ~= nil) then
        Volume_Delete(KAS_FindShipsNearPoint_TempCentre)
    end
    --cerate a temp volume: duplicate the point, but with this explicit radius
    KAS_FindShipsNearPoint_TempCentre = point.."_TempCentre"..KAS_TempCentreIndex
    KAS_TempCentreIndex = KAS_TempCentreIndex + 1
    tempVector = Volume_GetPosition(point)
    Volume_AddSphere(KAS_FindShipsNearPoint_TempCentre, tempVector, distance)

    --this function is only used to query "enemy" (human) and friendly (Script) ships

    SobGroup_CreateIfNotExist("FindShipsNearPointGroup")
    Player_FillSobGroupInVolume(group, 0, KAS_FindShipsNearPoint_TempCentre)
    Player_FillSobGroupInVolume("FindShipsNearPointGroup", 1, KAS_FindShipsNearPoint_TempCentre)
    SobGroup_SobGroupAdd(group, "FindShipsNearPointGroup")
    Player_FillSobGroupInVolume("FindShipsNearPointGroup", 3, KAS_FindShipsNearPoint_TempCentre)
    SobGroup_SobGroupAdd(group, "FindShipsNearPointGroup")
    Player_FillSobGroupInVolume("FindShipsNearPointGroup", 2, KAS_FindShipsNearPoint_TempCentre)
    SobGroup_SobGroupAdd(group, "FindShipsNearPointGroup")

end

--
-- Emulates:    kasfTargetDrop
--
function KAS_DropSalvageTarget(team)
    --tempGroup = team.."_DropSalvageTarget"
    --SobGroup_CreateIfNotExist(tempGroup)

    --SobGroup_FilterInclude(tempGroup, team, "CurrentCommand", "COMMAND_SalCap")

    if (SobGroup_Count("GrowSelection_SnatchVictem") > 0) then
        --SobGroup_Stop(1, team)
        --SobGroup_CaptureSobGroup(team, "GrowSelection_SnatchVictem")
        SobGroup_ReleaseSalCapSobGroup(team, "GrowSelection_SnatchVictem")
        --SobGroup_Clear("GrowSelection_SnatchVictem")
    end
end

--
-- Used by hyperspace gate function below; finds gate point closest to team
--
function KAS_ClosestGatePoint(team)
    bestDistance = 999999
    bestGate = "GATETeleportOutPoint0"
    rightHere = SobGroup_GetPosition(team)

    local gateGroup = "Dawg_ClosestGateGroup"
    local nearbyGateGroup = "Dawg_GateNearPoint"
    SobGroup_Create(gateGroup)
    SobGroup_Create(nearbyGateGroup)
    Player_FillShipsByType(gateGroup, 1, "Junk_HyperSpaceGate")

    iGate = 0
    while (iGate < 9) do
        gateName = "GATETeleportOutPoint"..iGate
        gatePosition = Volume_GetPosition(gateName)
        distance = Vector3_Magnitude(Vector3_Subtract(rightHere, gatePosition))
        if (distance < bestDistance) then
            --is there actually a gate here?
            local pointPos = Volume_GetPosition("GATETeleportOutPoint"..iGate)
            SobGroup_FillProximityPoint(nearbyGateGroup, gateGroup, pointPos, 1000)
            if (SobGroup_Count(nearbyGateGroup) > 0) then
                bestDistance = distance
                bestGate = gateName
            end
        end
        iGate = iGate + 1
    end
    return({bestDistance, bestGate})
end

--
-- Emulates:    kasfGateMoveToNearest
-- Description: Finds the nearest point named GATETeleportOutPoint[0..9] and goes there.
--
function KAS_GateMoveToNearest(team)
    bestGateInfo = KAS_ClosestGatePoint(team)
    if (bestGateInfo[1] < 999999) then
        print("KAS_GateMoveToNearest: team "..team.." is within "..bestGateInfo[1].." of "..bestGateInfo[2].." - MOVING THERE.")
        SobGroup_Move(SobGroup_GetPlayerOwner(team), team, bestGateInfo[2])
    end
end

--
-- Emulates:    kasfGateShipsIn
--
function KAS_GateShipsIn(team, gatePoint)
    print("KAS_GateShipsIn: team "..team.." is hyperspacing in at "..gatePoint)
    SobGroup_HyperspaceTo(team, gatePoint)
end

--
-- Emulates:    kasfGateShipsOutNearest
--
function KAS_GateShipsOutNearest(team)
    bestGateInfo = KAS_ClosestGatePoint(team)
    if (bestGateInfo[1] < 2000 * KAS_WORLD_SCALE) then
        print("KAS_GateShipsOutNearest: team "..team.." is within "..bestGateInfo[1].." of "..bestGateInfo[2].." - HYPERSPACING.")
        SobGroup_EnterHyperSpaceOffMap(team)
        return(1)
    end
    return(0)
end

--
-- Emulates:    kasfShipsAttributesBitSet
--
function KAS_ShipsAtrributesBitSet(team, attribute)
    print("KAS_ShipsAtrributesBitSet: team "..team.." should be made invisible in SM, BUT ISN'T (form now)")
end

--
-- Emulates:    kasfFormation<name>
--
function KAS_SetFormation(team, name)

    if (name == "Broad") then
        name = "broad"
    elseif (name == "Wall") then
        name = "wall"
    elseif (name == "Wall") then
        name = "wall"
    elseif (name == "Delta") then
        name = "delta"
    elseif (name == "Delta3D") then
        name = "x"                  --!!! approximation
    elseif (name == "Sphere") then
        if (spGameInfo_currentMission == 14 and strupper(SobGroup_GetShipType(team)) == "TAI_IONCANNONFRIGATE") then
            name = "M14IonSphere"
        else
            name = "sphere"             --!!! choose based on what's going on...
        end
    elseif (name == "Claw") then
        name = "Movers"
    elseif (name == "Custom") then
        name = "inverted leaping goose" --!!! need to make a special pathway for this one
    else
        print("KAS_SetFormation: don't know how to set formation "..name)
        return
    end

    --print("KAS_SetFormation: team "..team.." to formation "..name)
    SobGroup_FormStrikeGroup(team, name)
	--SobGroup_SetFixed(team,1)

end

--
-- Called from the init block, emulating the colorScheme(n) attribute in the .missphere file
--
KAS_ColourSchemes = {}
function KAS_SetColourScheme(team, iScheme)
    print("KAS_SetColourScheme: team "..team.." SET to "..iScheme)
    SobGroup_SetTeamColours(team, KAS_ColourSchemes[iScheme]["base"], KAS_ColourSchemes[iScheme]["stripe"], KAS_ColourSchemes[iScheme]["badge"])
    --SobGroup_SetTeamColourTheme(team, KAS_ColourSchemes[iScheme]["base"], KAS_ColourSchemes[iScheme]["stripe"], KAS_ColourSchemes[iScheme]["badge"], KAS_ColourSchemes[iScheme]["trailColour"], KAS_ColourSchemes[iScheme]["trailTexture"])
end

--
-- Called from init block, sets the actual colour schemes' base and stripe colours
--
function KAS_SetColourSchemeColours(iScheme, base, stripe, badge, trailColour, trailTexture)
    print("KAS_SetColourSchemeColours: scheme "..iScheme.." SET to ("..base[1]..","..base[2]..","..base[3]..") ("..stripe[1]..","..stripe[2]..","..stripe[3].."), "..badge)
    KAS_ColourSchemes[iScheme] = {}
    KAS_ColourSchemes[iScheme]["base"] = base
    KAS_ColourSchemes[iScheme]["stripe"] = stripe
    KAS_ColourSchemes[iScheme]["badge"] = badge
    KAS_ColourSchemes[iScheme]["trailColour"] = trailColour
    KAS_ColourSchemes[iScheme]["trailTexture"] = trailTexture
end

--
-- Emulates: kasfRUsEnemyCollected
-- In HW1 this started at zero.  In HW2 it starts with whatever the starting resources of the player are.
--
KAS_PlayerStartingResources = 0
function KAS_RememberStartingRUs()
    KAS_PlayerStartingResources = Player_GatheredRUs(0)
end

function KAS_GatheredRUs()
    local difference = Player_GatheredRUs(0)
    difference = difference - KAS_PlayerStartingResources
    return difference
end

--
-- Emulates: kasfPlayerAcquiredTechnology
-- Note:     We need to defer the actual granting of research a bit as in KAS code,
--  usually the researh is granted a bit before the speech event about it is.
--  This has the effect that Fleet Command says "new research available" and then is cut off by fleet intel.
--  If we defer it, FC will be ducked.
--
KAS_PendingResearchGrants = {}
KAS_PendingResearchDelay = 0.5
function KAS_GrantResearchOption(player, research)
    --already have it?
    if (Player_ResearchOptionIsComplete(player, research) ~= 0) then
        print("KAS_UnrestrictResearchOption: option "..research.." already granted to player "..player)
        return
    end
    --find a free grant spot
    local iGrant = 1;
    while (KAS_PendingResearchGrants[iGrant] ~= nil) do
        if (KAS_PendingResearchGrants[iGrant]["player"] == player and KAS_PendingResearchGrants[iGrant]["research"] == research and KAS_PendingResearchGrants[iGrant]["action"] == "grant") then
            print("KAS_GrantResearchOption: option "..research.." already queued to grant for player "..player)
            return
        end
        iGrant = iGrant + 1
    end
    KAS_PendingResearchGrants[iGrant] = {}
    KAS_PendingResearchGrants[iGrant]["player"] = player
    KAS_PendingResearchGrants[iGrant]["research"] = research
    KAS_PendingResearchGrants[iGrant]["waited"] = 0
    KAS_PendingResearchGrants[iGrant]["action"] = "grant"

    --create a one-time rule.  Increment the delay in case multiple items are granted at once.
    Rule_AddIntervalParam("KAS_GrantResearchWatch", ""..iGrant, KAS_PendingResearchDelay * iGrant)
end

--
-- Emulates: kasfPlayerAcquiredTechnology
-- Note:     We need to defer the actual granting of research a bit as in KAS code,
--  usually the researh is granted a bit before the speech event about it is.
--  This has the effect that Fleet Command says "new research available" and then is cut off by fleet intel.
--  If we defer it, FC will be ducked.
--
KAS_PendingResearchGrants = {}
KAS_PendingResearchDelay = 0.5
function KAS_UnrestrictResearchOption(player, research)
    --find a free grant spot
    if (Player_ResearchOptionIsRestricted(player, research) == 0) then
        print("KAS_UnrestrictResearchOption: option "..research.." already unrestricted for player "..player)
        return
    end
    local iGrant = 1;
    while (KAS_PendingResearchGrants[iGrant] ~= nil) do
        if (KAS_PendingResearchGrants[iGrant]["player"] == player and KAS_PendingResearchGrants[iGrant]["research"] == research and KAS_PendingResearchGrants[iGrant]["action"] == "unrestrict") then
            print("KAS_GrantResearchOption: option "..research.." already queued to unrestrict for player "..player)
            return
        end
        iGrant = iGrant + 1
    end
    KAS_PendingResearchGrants[iGrant] = {}
    KAS_PendingResearchGrants[iGrant]["player"] = player
    KAS_PendingResearchGrants[iGrant]["research"] = research
    KAS_PendingResearchGrants[iGrant]["waited"] = 0
    KAS_PendingResearchGrants[iGrant]["action"] = "unrestrict"

    --create a one-time rule.  Increment the delay in case multiple items are granted at once.
    Rule_AddIntervalParam("KAS_GrantResearchWatch", ""..iGrant, KAS_PendingResearchDelay * iGrant)
end

--
-- Watch for any pending research grants, grants them and deletes this rule
--
function KAS_GrantResearchWatch(indexString)
    local iGrant = tonumber(indexString)

    print("KAS_GrantResearchWatch: Seeing if it's time to "..KAS_PendingResearchGrants[iGrant]["action"].." "..KAS_PendingResearchGrants[iGrant]["research"])
    --wait at least one 'tick' in case this rule should get fired off straight away
    if (KAS_PendingResearchGrants[iGrant]["waited"] == 0) then
        KAS_PendingResearchGrants[iGrant]["waited"] = 1
    else
        --print("KAS_GrantResearchWatch: it is; granting.")
        local player = KAS_PendingResearchGrants[iGrant]["player"]
        local research = KAS_PendingResearchGrants[iGrant]["research"]

        Player_UnrestrictResearchOption(player, research)

        if (KAS_PendingResearchGrants[iGrant]["action"] == "grant") then
            Player_GrantResearchOption(player, research)
        end

        KAS_PendingResearchGrants[iGrant] = {}
        Rule_RemoveParam("KAS_GrantResearchWatch", indexString)
    end
end

--
-- Emulates:    kasfDoesPlayerHave
-- With:        Player_HasResearch
-- Note:        Since FC yaks as soon as a tech is offered, and the mission script often checks the tech is available
--              before saying something (especially with the Bentusi), we check if the player has it _or_ it's queued to be granted.
--
function KAS_PlayerHasResearch(player, research)
    if (Player_HasResearch(player, research) ~= 0) then
        --see if player already has tech
        return(1)
    else
        --see if the tech is granted, but has not timed out yet.
        local iGrant = 1;
        while (KAS_PendingResearchGrants[iGrant] ~= nil) do
            if (KAS_PendingResearchGrants[iGrant]["player"] == player and KAS_PendingResearchGrants[iGrant]["research"] == research) then
                return(1)
            end
            iGrant = iGrant + 1
        end
    end
    return(0)
end

--
-- Emulates:    kasfWideScreenIn/kasfWideScreenOut
-- With:        Camera_SetLetterboxStateNoUI
-- Note:        KAS scripts use widescreen to indicate non-interactive sequences, including actual NISs and fleet intel events.
--              Also, the levels will all start letterboxed.  If a mission starts letterbox and is still letterboxed by the time the first call to KAS_SetLetterboxState(1, n) arrives, we'll keep the game letterboxed.
--  !!! support restore from save made when letterbox bars are down.
--
KAS_LetterboxState = 0
KAS_LetterboxStartState = 0         --0 = off, 1 = letterboxed, 2 = finished (no longer initial letterbox state)
KAS_LetterboxHoldTime = 1           --seconds to hold post-hyperspace
KAS_HoldLetterboxStart = 0          --1 = hold until after first fleet intel event
KAS_HoldLaunchStart = 0             --1 = don't launch until after fleet intel event
KAS_LetterboxSkipBonus = 0.3
function KAS_SetLetterboxState(bLetterbox, numSeconds)
    print("KAS_SetLetterboxState("..KAS_LetterboxStartState..", "..KAS_LetterboxHoldTime..", "..KAS_HoldLetterboxStart..", "..KAS_HoldLaunchStart..")")
    KAS_LetterboxState = bLetterbox
    if (bLetterbox == 1 and KAS_LetterboxStartState == 1 and KAS_HoldLetterboxStart ~= 0) then
        print("KAS_SetLetterboxState: initial letterbox BEGINS, but held from initial state; not letterboxing in, enabling skip.")
        --defer the skippability until after letterbox in-time
        Rule_AddIntervalParam("KAS_SetEnableSkipWait", "1", numSeconds + KAS_LetterboxSkipBonus)
    else
        if (bLetterbox == 0 and KAS_LetterboxStartState == 1 and KAS_HoldLetterboxStart ~= 0) then
            print("KAS_SetLetterboxState: initial letterbox ENDS, held from initial state; back to normal.")
            KAS_LetterboxStartState = 2
            Campaign_QuickSaveNb(KAS_CampaignMissionNumber, KAS_CampaignMissionName)
        end
        Camera_SetLetterboxStateNoUI(bLetterbox, numSeconds)
        if (bLetterbox > 0) then
            --defer the skippability until after letterbox in-time
            Rule_AddIntervalParam("KAS_SetEnableSkipWait", ""..bLetterbox, numSeconds + KAS_LetterboxSkipBonus)
        else
            Universe_EnableSkip(0)
        end
    end
end

function KAS_SetEnableSkipWait(skipState)
    local state = tonumber(skipState)
    if (state == nil) then
        state = 0
    end
    Universe_EnableSkip(state)
    Rule_RemoveParam("KAS_SetEnableSkipWait", ""..skipState)
end

--
-- Set the letterbox state at the beginning of a mission.
-- Params:      bLetterboxed - All missions are meant to start letterboxed, but there's the option to not do so.
--              holdTime     - seconds to hold the letterbox post-hyperspace
--              bHoldLetterbox - hold the letterbox bars after the normal hyperspace sequence.  They'll be held until the first call to KAS_SetLetterboxState(0, n)
--              bHoldLaunch - hold off on launching ships from the mothership.                  "
--
function KAS_SetLetterboxStart(bLetterboxed, holdTime, bHoldLetterbox, bHoldLaunch)
    if (bLetterboxed ~= 0) then
        Camera_SetLetterboxStateNoUI(bLetterboxed, 0)
    end
    Universe_EnableSkip(0)
    KAS_LetterboxStartState = 1
    KAS_LetterboxHoldTime = holdTime
    KAS_HoldLetterboxStart = bHoldLetterbox
    KAS_HoldLaunchStart = bHoldLaunch   --!!! ToDo: actually hold!!!

end

--
-- Called from singlePlayerPostHyperspaceLetterboxWatch() after hyperspace and afte a letterbox delay
--
KAS_CampaignMissionNumber = 1
KAS_CampaignMissionName = "noname"
function KAS_EndStartingLetterbox()
    if (KAS_LetterboxStartState == 1) then
        if (KAS_HoldLetterboxStart == 0) then
            print("KAS_EndStartingLetterbox: initial letterbox ENDING "..KAS_LetterboxHoldTime.."s after hyperspace.")
            Camera_SetLetterboxStateNoUI(0, 2)
            Universe_EnableSkip(0)
            print("KAS_EndStartingLetterbox: "..KAS_CampaignMissionNumber..", "..KAS_CampaignMissionName)
            Campaign_QuickSaveNb(KAS_CampaignMissionNumber, KAS_CampaignMissionName)
        else
            print("KAS_EndStartingLetterbox: initial letterbox HOLDING after hyperspace.")
            return
        end
    end

    KAS_LetterboxStartState = 2
end

--
-- Records mission number, name to save to after the letterbox bars disappear.  Make sure you call this before the end of the letterbox bars.
--
function KAS_CampaignAutoSave(missionNumber, missionName)
    KAS_CampaignMissionNumber = missionNumber
    KAS_CampaignMissionName = missionName
    print("KAS_CampaignAutoSave: "..KAS_CampaignMissionNumber..", "..KAS_CampaignMissionName)
end

