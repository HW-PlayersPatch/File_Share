--
-- SingplePlayerHyperspace.lua
-- Logic to emulate, in the HW2 Engine, the flow of HW1 inter-mission hyperspace logic.
-- Much of the code here is adapted from SP game functions of the same name from singleplayer.c.
-- Created January 2014 by Luke Moloney for Gearbox Software
--

--
-- HyperspaceState
--
NO_HYPERSPACE                       = 0
HYPERSPACE_PREWAIT                  = 1
HYPERSPACE_WAITINGROLLCALL          = 2
HYPERSPACE_WAITINGFORFLEETCOMMAND   = 3
HYPERSPACE_SHIPSLEAVING             = 4
HYPERSPACE_WHITEOUT                 = 5
HYPERSPACE_LOADDONE                 = 6
HYPERSPACE_SHIPSARRIVING            = 7
HYPERSPACE_FAILED                   = 8
HYPERSPACE_WAITING                  = 100
--
-- HyperspaceSubState
--
SUBSTATE_NONE                       = 0
SUBSTATE_FOCUSING_ON_MOTHERSHIP     = 1
SUBSTATE_LOCKED_FOCUS_FOR_HOP       = 2

SPEECH_HYPERSPACE_DELAY     = 2.5
HYPERSPACE_WHITEOUTTIME      = 0.2

--
-- Hyperspace-related state
--
spGameInfo_hyperspaceFails = 0
spGameInfo_hyperspaceState = NO_HYPERSPACE
spGameInfo_playerCanHyperspace = 0
--spGameInfo_playerCanHyperspace = 1    --!!!
spGameInfo_hyperspaceSubState = 0   --SUBSTATE_NONE
spGameInfo_hyperspaceStartTime = 0
spGameInfo_hyperspaceTimeStamp = 0
spGameInfo_oldAutoLaunch = 0
spGameInfo_screenLoaded = 0
spGameInfo_screenSkipped = 0

-- This SobGroup identifies the mothership wile it's entering hyperspace.  As the MoShip can be destroyed, the hyperspace might yet fail.
spGameInfo_hyperspaceMothership = "spGameInfo_hyperspaceMothership"
--spGameInfo_cryoTrays = "spGameInfo_cryoTrays"

hyperspaceOverride = 0

--called when hyperspace fails.  Not sure if there's anything to be done here.
function CleanupHyperspacingShips(FreeShips, cleanupAllPlayersShips)
end

singlePlayer_shipsToSkipFromDock = {}
singlePlayer_shipsToSkipFromDock =
{
    "Kus_Mothership",
    "Kus_CryoTray",
    "Kus_Drone0",
    "Kus_Drone1",
    "Kus_Drone2",
    "Kus_Drone3",
    "Kus_Drone4",
    "Kus_Drone5",
    "Kus_Drone6",
    "Kus_Drone7",
    "Kus_Drone8",
    "Kus_Drone9",
    "Kus_Drone10",
    "Kus_Drone11",
    "Kus_Drone12",
    "Kus_Drone13",
    "Kus_Probe",
    "Kus_TargetDrone",
    "Der_Crate",
    "Der_Scaffold",
}

function singlePlayerHyperspaceSkipNonDockers(group)
    local iSkip = 1
    local skipGroup = "skipGroup"
    while (singlePlayer_shipsToSkipFromDock[iSkip] ~= nil) do
        SobGroup_CreateIfNotExist(skipGroup)
        Player_FillShipsByType(skipGroup, 0, singlePlayer_shipsToSkipFromDock[iSkip])
        SobGroup_FillSubtract(group, group, skipGroup)
        iSkip = iSkip + 1
    end
end

--
-- Called when the Hyperspace button is pushed
--
function singlePlayerHyperspaceButtonPushed()

    if (spGameInfo_playerCanHyperspace == 0 and hyperspaceOverride == 0) then
        print("singlePlayerHyperspaceButtonPushed: spGameInfo_playerCanHyperspace == 0 and hyperspaceOverride == 0")
        return
    end

    hyperspaceOverride = 0

    spGameInfo_playerCanHyperspace = 0
    --smUpdateHyperspaceStatus(0)

    if (spGameInfo_hyperspaceState ~= NO_HYPERSPACE) then
        print("singlePlayerHyperspaceButtonPushed: NO_HYPERSPACE - failed")
        return
    end

    KAS_PlayerMothership(spGameInfo_hyperspaceMothership, 0)
    --KASSobGroup_CreateIfNotExist(spGameInfo_cryoTrays)
    --SobGroup_Clear(spGameInfo_cryoTrays)
    --Player_FillShipsByType(spGameInfo_cryoTrays, 0, "Kus_CryoTray")

    if (SobGroup_Count(spGameInfo_hyperspaceMothership) ~= 1) then
        print("singlePlayerHyperspaceButtonPushed: no mothership - failed")
        return
    end

    HyperspaceRollCallBegin()

    --if (Universe_PauseState() != 0)
    --{
    --    Universe_Pause(0, 0)      -- unpause game
    --}

    --ccFocusOnMyMothership(&universe.mainCameraCommand);
    Camera_FocusSobGroupWithBuffer(spGameInfo_hyperspaceMothership, 1000, 10, 2)       --params copied from M01_Tanis

    spGameInfo_hyperspaceState = HYPERSPACE_WAITINGROLLCALL

    --...lockout main screen somehow

    --display the hyperspace roll call screen
    if (spGameInfo_screenLoaded == 0) then
        MainUI_LoadScreen("DATA:\\UI\\HyperspaceRollCallScreen.lua", "HyperspaceRollCallScreen")
        MainUI_ActivateScreen("HyperspaceRollCallScreen", 1)
        spGameInfo_screenLoaded = 1
        spGameInfo_screenSkipped = 0
    end

    --
    -- Following is some hyperspace setup code copied from M01_Tanis
    --
    SobGroup_SetAutoLaunch(spGameInfo_hyperspaceMothership, ShipHoldStayDockedAlways)
    selectAll = "singlePlayerAllPlayerShips"
    SobGroup_Create(selectAll)
    Player_GetShipsByFilterInclude(0, selectAll, "NoFilter", "")
    SobGroup_SetROE(selectAll, PassiveROE)
    spMainScreenAndLockout(SPLOCKOUT_ALLBUTMOUSE);

    --Sensors_EnableCameraZoom( 0 )
    --Sensors_Toggle( 0 )
    SobGroup_DeSelectAll()

    --speech event
    --HW2_SubTitleEvent( Actor_FleetIntel, "$40631", 7 )
    SobGroup_FillSubtract(selectAll, selectAll, spGameInfo_hyperspaceMothership)        --don't dock the mothership
    --SobGroup_FillSubtract(selectAll, selectAll, spGameInfo_cryoTrays)


    local selectToDock = "RollCallShipsToDock"
    SobGroup_Create(selectToDock)
    --Player_GetShipsByFilterInclude(0, selectToDock, "Ability", "CanDock")
    SobGroup_FilterExclude(selectToDock, selectAll, "Ability", "HyperSpaceCommand")     --only dock the ships that can't hyperspace
    singlePlayerHyperspaceSkipNonDockers(selectToDock)

    local selectDocked = "RollCallShipsDocked"
    SobGroup_Create(selectDocked)
    SobGroup_FilterInclude(selectDocked, selectToDock, "Docked", "")
    spGameInfo_rollcallShipsDocked = SobGroup_Count(selectDocked)

    local selectParade = "RollCallParade"
    SobGroup_Create(selectParade)
    SobGroup_FillSubtract(selectParade, selectAll, selectToDock)                            --all the hyperspace-capable ships
    singlePlayerHyperspaceSkipNonDockers(selectParade)
    --SobGroup_FilterInclude(selectParade, selectParade, "Ability", "ParadeCommand")      --of them the parade-capable ships
    SobGroup_ParadeSobGroup(selectParade, spGameInfo_hyperspaceMothership, 0)           --tell them to get in parade formation

    SobGroup_DockSobGroup_NoLatch( selectToDock, spGameInfo_hyperspaceMothership)                  --get the dockers docking

end

function HyperspaceRollCallBegin()
    --impl...
    CalculateRollCall()
end
function CalculateRollCall()

    local selectToDock = "RollCallShipsToDock"
    SobGroup_Create(selectToDock)
    --Player_GetShipsByFilterInclude(0, selectToDock, "Ability", "CanDock")
    Player_GetShipsByFilterExclude(0, selectToDock, "Ability", "HyperSpaceCommand")     --only dock the ships that can't hyperspace

    local selectDocked = "RollCallShipsDocked"
    SobGroup_Create(selectDocked)
    SobGroup_FilterInclude(selectDocked, selectToDock, "Docked", "")
    spGameInfo_rollcallShipsDocked = SobGroup_Count(selectDocked)

    SobGroup_FillSubtract(selectToDock, selectToDock, selectDocked)                     --exclude ships that are already docked
    --SobGroup_FillSubtract(selectToDock, selectToDock, spGameInfo_hyperspaceMothership)  --for some reason, the Mothership can dock...
    --SobGroup_FillSubtract(selectToDock, selectToDock, spGameInfo_cryoTrays)             --don't count cryo trays, of course.
    singlePlayerHyperspaceSkipNonDockers(selectToDock)

    spGameInfo_rollcallShipsRemaining = SobGroup_Count(selectToDock)

    --MainUI_SetItemText("HyperspaceRollCallScreen", "RollCallShipsDocked", " "..spGameInfo_rollcallShipsDocked)
    MainUI_SetItemText("HyperspaceRollCallScreen", "RollCallShipsRemaining", " "..spGameInfo_rollcallShipsRemaining)
    --print("CalculateRollCall: "..spGameInfo_rollcallShipsRemaining.." ships remaing, "..spGameInfo_rollcallShipsDocked.." docked")

    --if the roll call was started while there were some ships queued to launch,
    --these ships will launch and break the roll call system.
    --Look for such ships and tell them to dock now.
    local selectNotDocking = "NotYetDocking"
    SobGroup_CreateIfNotExist(selectNotDocking)
    local nNotDocking = SobGroup_FilterExclude(selectNotDocking, selectToDock, "CurrentCommand", "COMMAND_Dock")

    if (nNotDocking > 0) then
        print("CalculateRollCall: found "..nNotDocking.." ships not docking.  Telling them to dock now.")
        SobGroup_DockSobGroup_NoLatch( selectToDock, spGameInfo_hyperspaceMothership)                  --get the dockers docking
    end

    --because the user can switch the game to "stay docked" in the launch manager, which actually sets the ship to auto-launch, we need to keep forcing the ship to stay docked
    SobGroup_SetAutoLaunch(spGameInfo_hyperspaceMothership, ShipHoldStayDockedAlways)

    --also look for ships in the shiphold that are queued to launch, from any buildable ship, and make them stay docked
    local buildShips = "PlayerBuilderShips"
    SobGroup_CreateIfNotExist(buildShips)
    local nBuildShips = Player_GetShipsByFilterInclude(0, buildShips, "Ability", "CanBuildShips")
    local buildShip = "PlayerBuilderShips_i"
    SobGroup_CreateIfNotExist(buildShip)

    for iBuildShip = 0, (nBuildShips - 1) do
        SobGroup_FillShipsByIndexRange(buildShip, buildShips, iBuildShip, 1)

        local selectNotLaunched = "NotYetLaunched"
        SobGroup_CreateIfNotExist(selectNotLaunched)
        --local buildShip = spGameInfo_hyperspaceMothership       --!!!... do for all buildable ships
        SobGroup_GetSobGroupDockedWithGroup(buildShip, selectNotLaunched)
        local nNotLaunching = SobGroup_FilterInclude(selectNotLaunched, selectNotLaunched, "CurrentCommand", "COMMAND_Launch")
        if (nNotLaunching ~= 0) then
            nNotLaunching = SobGroup_FilterInclude(selectNotLaunched, selectNotLaunched, "CurrentCommandState", "LAUNCHSTATE_Queue")
            if (nNotLaunching ~= 0) then
                --Found some ships in this shiphold that are queued for launch.  Tell them to insta-dock.
                local builderType = SobGroup_GetShipType(buildShip)
                print("Found "..nNotLaunching.." ships queued for launch in "..builderType.."; cancelling launch.")
                SobGroup_DockSobGroupInstant(selectNotLaunched, buildShip)
            end
        end
    end

end

--
-- Watch to see if hyperspacing ships are ready (are all pointed in the correct direction)
--
function OrientHyperspacingShips()
--impl!!!
--...order hyperspace command
    return 1    ---...see if they're pointin the correct direction
end
function CalculateHyperspaceTimesForShips()
    --figures out some delay before hyperspace can be achieved
    --impl !!!

end

--
-- Watch the ships that are hyperspacing out.  Return nonzero when they're all gone.
--
function WatchHyperspacingShips()
    selectAll = "singlePlayerAllPlayerHyperspaceShips"
    SobGroup_Create(selectAll)
    Player_GetShipsByFilterInclude(0, selectAll, "Ability", "HyperSpaceCommand")
    if (SobGroup_AreAllInHyperspace(selectAll) ~= 0) then
        --print("WatchHyperspacingShips: all ships in hyperspace:"..SobGroup_Count(selectAll))
        return 1
    else
        --print("WatchHyperspacingShips: no(t all) ships in hyperspace:"..SobGroup_Count(selectAll))
        return 0
    end
end

function TellShipsToAbortDockForHyperspace()

    selectAll = "singlePlayerAllCurrentPlayersNonHyperspacingShips"
    SobGroup_Create(selectAll)
    Player_GetShipsByFilterExclude(0, selectAll, "Ability", "HyperSpaceCommand")
    --SobGroup_FillSubtract(selectAll, selectAll, spGameInfo_cryoTrays)
    singlePlayerHyperspaceSkipNonDockers(selectAll)

    SobGroup_Stop(selectAll)
end

--
--
--
function singlePlayerHyperspaceOnStartOrLoad()

    --make sure the screen is loaded: this variable is saved in the savegame, but the screen will not auto-reload
    if (spGameInfo_screenLoaded ~= 0) then
        MainUI_LoadScreen("DATA:\\UI\\HyperspaceRollCallScreen.lua", "HyperspaceRollCallScreen")
    end

end

--
-- Called at the end of a mission or game shutdown.  Makes sure the hyperspace window is deleted.
--
function singlePlayerHyperspaceOnMissionEnd()
    if (MainUI_ElementVisible("NewTaskbar", "btnHW1SPHyperspace") ~= 0) then
        MainUI_ShowElement("NewTaskbar", "btnHW1SPHyperspace", 0)
    end
    if (spGameInfo_screenLoaded ~= 0) then
        MainUI_ActivateScreen("HyperspaceRollCallScreen", 0)
        MainUI_UnloadScreen("HyperspaceRollCallScreen")
        spGameInfo_screenLoaded = 0
    end
end

--
-- Called from main update function, updates the hyperspace state and invokes events.
-- Ported from singlePlayerGame.c, but using events adopted from M01_Tanis
--
function singlePlayerHyperspaceStateUpdate()

    if (spGameInfo_hyperspaceState == NO_HYPERSPACE) then
        --After loading a game that was saved while the hyperspace button is visible, it will not automatically appear.
        --We have to make it re-appear.
        if (spGameInfo_playerCanHyperspace ~= 0) then
            if (MainUI_ElementVisible("NewTaskbar", "btnHW1SPHyperspace") == 0) then
                MainUI_ShowElement("NewTaskbar", "btnHW1SPHyperspace", 1)
                MainUI_FlashButton("NewTaskbar", "btnHW1SPHyperspace", 3)
            end
        end
    end

    --likewise if the RollCall screen was up, bring it back
    if (spGameInfo_hyperspaceState == HYPERSPACE_WAITINGROLLCALL and spGameInfo_screenLoaded == 0 and spGameInfo_screenSkipped == 0) then
        MainUI_LoadScreen("DATA:\\UI\\HyperspaceRollCallScreen.lua", "HyperspaceRollCallScreen")
        MainUI_ActivateScreen("HyperspaceRollCallScreen", 1)
        spGameInfo_screenLoaded = 1
    end

    --print("singlePlayerHyperspaceStateUpdate: "..spGameInfo_hyperspaceState)
    -- see if mothership disappeared somehow
    if (SobGroup_Count(spGameInfo_hyperspaceMothership) == 0) then
        if (spGameInfo_hyperspaceState == HYPERSPACE_WAITINGROLLCALL) then
            singlePlayerAbortHyperspace()
        end
    end

    if (spGameInfo_hyperspaceState == HYPERSPACE_WAITINGROLLCALL) then

        CalculateRollCall()
        OrientHyperspacingShips()

        if (spGameInfo_rollcallShipsRemaining == 0) then
            --if (spHyperspaceRollCallScreen != NULL)
            --{
            --    feScreenDelete(spHyperspaceRollCallScreen)
            --    spHyperspaceRollCallScreen = NULL
            --}
            --...hide the roll call screen

            spGameInfo_hyperspaceState = HYPERSPACE_WAITINGFORFLEETCOMMAND
            spGameInfo_hyperspaceSubState = 1--FOCUSING_ON_MOTHERSHIP
            spGameInfo_hyperspaceTimeStamp = Universe_GameTime()
            --..speechEventFleet(STAT_F_Hyper_TakingOff, 0, universe.curPlayerIndex)
            HW2_SubTitleEvent( Actor_FleetIntel, "$40631", 7 )      --!!! put in correct HW1 speech event

            -- this isn't the nicest way to do this, but it works.  I'd rather write a callback for this
            spGameInfo_hyperspaceStartTime = Universe_GameTime() + SPEECH_HYPERSPACE_DELAY
        end

    elseif (spGameInfo_hyperspaceState == HYPERSPACE_WAITINGFORFLEETCOMMAND) then
        -- this isn't the nicest way to do this, but it works.  I'd rather write a callback for this
        if (Universe_GameTime() >= spGameInfo_hyperspaceStartTime) then
            spGameInfo_hyperspaceState = HYPERSPACE_SHIPSLEAVING
            if (spGameInfo_currentMission ~= 6) then
                Player_InstantlyGatherAllResourcesAllTypes( 0 )
            end
            --...display location card about resources gathered
        end

    elseif (spGameInfo_hyperspaceState == HYPERSPACE_SHIPSLEAVING) then
        --print("spGameInfo_hyperspaceSubState = "..spGameInfo_hyperspaceSubState)
        if (spGameInfo_hyperspaceSubState == 1) then
            shipsoriented = OrientHyperspacingShips()
            if ((Universe_GameTime() >= spGameInfo_hyperspaceTimeStamp) and (shipsoriented ~= 0)) then
                CalculateHyperspaceTimesForShips()
                spGameInfo_hyperspaceSubState = 2
                --tutGameMessage("Game_BeginHyperspace")
                if (spGameInfo_hyperspaceFails ~= 0) then
                    --...stop music, play sound event Ship_SinglePlayerHyperspace
                    print("Hyperspace will fail!")
                else
                --end
                    --send the ships into HS
                    --print("singlePlayerGoNowHyperspace()")

                    singlePlayerGoNowHyperspace()
                end
            end

        elseif (spGameInfo_hyperspaceSubState == 2) then
            if (spGameInfo_hyperspaceFails ~= 0) then

                spGameInfo_hyperspaceState = HYPERSPACE_FAILED
                singlePlayerHyperspaceFailed()
            end

            if (WatchHyperspacingShips() ~= 0) then

                -- all ships have hyperspaced out.
                spGameInfo_hyperspaceState = HYPERSPACE_WHITEOUT
                spGameInfo_hyperspaceTimeStamp = Universe_GameTime() + HYPERSPACE_WHITEOUTTIME

                --speechEventStopAll(0.5f)      --...should do this

                -- screen should fade out
                --HW2_LocationCardEvent( "$40523", 4 ),       --!!!localize, please
                Universe_Fade( 1, 1 )

            end
        end

    elseif (spGameInfo_hyperspaceState == HYPERSPACE_WHITEOUT) then
        if (Universe_GameTime() >= spGameInfo_hyperspaceTimeStamp) then
            print("spHyperspace: WHITEOUT, complete")
            local achievementName = "HW1_MISSION"..spGameInfo_currentMission.."_COMPLETE"
            SteamFuncsSetAchievement( achievementName )

            --all the anamatic invocation is via the campaign script...

            setMissionComplete(1)

            spGameInfo_hyperspaceState = HYPERSPACE_WAITING
        end
    elseif (spGameInfo_hyperspaceState == HYPERSPACE_LOADDONE) then
        print("spGameInfo_hyperspaceState == HYPERSPACE_LOADDONE: shouldn't get here")
    elseif (spGameInfo_hyperspaceState == HYPERSPACE_SHIPSARRIVING) then
        print("spGameInfo_hyperspaceState == HYPERSPACE_SHIPSARRIVING: shouldn't get here")
    elseif (spGameInfo_hyperspaceState == HYPERSPACE_FAILED) then

    end
end

--
-- Called when hyperspace failes, for whatever reason.  And there are reasons.
--
function singlePlayerHyperspaceFailed()

    -- all ships have arrived and are in starting position
    spGameInfo_hyperspaceState = NO_HYPERSPACE
    CleanupHyperspacingShips(0, 0)

    spUnlockout();
    --...unlockout the main screen

    --launch all necessary ships first
    SobGroup_SetAutoLaunch(spGameInfo_hyperspaceMothership, spGameInfo_oldAutoLaunch)

    singlePlayerGameMessagesReceived["Game_HyperspaceFailed"] = 1
    spGameInfo_hyperspaceFails = 0

    spGameInfo_playerCanHyperspace = 0

    --delete the hyperspace roll call screen
    if (spGameInfo_screenLoaded ~= 0) then
        MainUI_ActivateScreen("HyperspaceRollCallScreen", 0)
        MainUI_UnloadScreen("HyperspaceRollCallScreen")
        spGameInfo_screenLoaded = 0
    end

end

--
-- Aborts hyperspace, under two conditions:
--  * Moship destroyed during roll call
--  * Player cancels during roll call (callback from button)
--
function singlePlayerAbortHyperspace()
    if (spGameInfo_hyperspaceState == HYPERSPACE_WAITINGROLLCALL) then
        -- Let's abort hyperspace
        --speechEventFleet(COMM_F_Hyper_Abort, 0, universe.curPlayerIndex);

        --clAutoLaunch(singlePlayerGameInfo.oldAutoLaunch,universe.curPlayerIndex);
        SobGroup_SetAutoLaunch(spGameInfo_hyperspaceMothership, spGameInfo_oldAutoLaunch)
        spGameInfo_hyperspaceState = NO_HYPERSPACE

        TellShipsToAbortDockForHyperspace()

        --...hide the roll call screen
        --feScreenDelete(spHyperspaceRollCallScreen)
        --spHyperspaceRollCallScreen = NULL;
    end
end

--
-- Actually jumps to hyperspace under two conditions:
--  * player jams the "Go Now" button in the roll call.
--  * All ships have docked
--
function singlePlayerGoNowHyperspace()
    assert(SobGroup_Count(spGameInfo_hyperspaceMothership) == 1)

    if (spGameInfo_hyperspaceFails ~= 0) then
        spGameInfo_hyperspaceState = HYPERSPACE_FAILED
        singlePlayerHyperspaceFailed()
        return
    end

    --insta-dock everyone who can't hyperspace
    selectAll = "singlePlayerAllCurrentPlayersNonHyperspacingShips"
    SobGroup_Create(selectAll)
    Player_GetShipsByFilterExclude(0, selectAll, "Ability", "HyperSpaceCommand")
    --SobGroup_FillSubtract(selectAll, selectAll, spGameInfo_cryoTrays)
    singlePlayerHyperspaceSkipNonDockers(selectAll)

    SobGroup_DockSobGroupInstant(selectAll, spGameInfo_hyperspaceMothership)

    --parade all hyperspacers around mothership
    Player_GetShipsByFilterInclude(0, selectAll, "Ability", "HyperSpaceCommand")
    --SobGroup_FillSubtract(selectAll, selectAll, spGameInfo_hyperspaceMothership)
    --SobGroup_FillSubtract(selectAll, selectAll, spGameInfo_cryoTrays)
    singlePlayerHyperspaceSkipNonDockers(selectAll)

    SobGroup_ParadeSobGroup(selectAll, spGameInfo_hyperspaceMothership, 2)

    --start hyperspacing everyone who can
    Player_GetShipsByFilterInclude(0, selectAll, "Ability", "HyperSpaceCommand")
    selectAll = "singlePlayerAllPlayerHyperspaceShips"
    SobGroup_Create(selectAll)
    Player_GetShipsByFilterInclude(0, selectAll, "NoFilter", "")

    SobGroup_EnterHyperSpaceOffMap( selectAll )

    --delete the hyperspace roll call screen
    spGameInfo_screenSkipped = 1
    if (spGameInfo_screenLoaded ~= 0) then
        MainUI_ActivateScreen("HyperspaceRollCallScreen", 0)
        MainUI_UnloadScreen("HyperspaceRollCallScreen")
        spGameInfo_screenLoaded = 0
    end

end

function singlePlayerRollCallSkipButtonPressed()
    if (spGameInfo_hyperspaceState == HYPERSPACE_WAITINGROLLCALL) then
        singlePlayerGoNowHyperspace()
    end
end
function singlePlayerRollCallCancelButtonPressed()
    print("singlePlayerRollCallCancelButtonPressed: canceled hyperspace.")
    if (spGameInfo_hyperspaceState == HYPERSPACE_WAITINGROLLCALL) then
        -- Let's abort hyperspace
        --speechEventFleet(COMM_F_Hyper_Abort, 0, universe.curPlayerIndex);

        -- give player refund on RU's
        SobGroup_SetAutoLaunch(spGameInfo_hyperspaceMothership, ShipHoldLaunch)
        spGameInfo_hyperspaceState = NO_HYPERSPACE
        singlePlayerHyperspaceButtonEnable()

        selectAll = "singlePlayerAllCurrentPlayersNonHyperspacingShips"
        SobGroup_Create(selectAll)
        Player_GetShipsByFilterExclude(0, selectAll, "Ability", "HyperSpaceCommand")
        --SobGroup_FillSubtract(selectAll, selectAll, spGameInfo_cryoTrays)
        singlePlayerHyperspaceSkipNonDockers(selectAll)

        SobGroup_Stop(0, selectAll)

        --delete the hyperspace roll call screen
        if (spGameInfo_screenLoaded ~= 0) then
            MainUI_ActivateScreen("HyperspaceRollCallScreen", 0)
            MainUI_UnloadScreen("HyperspaceRollCallScreen")
            spGameInfo_screenLoaded = 0
        end
    end
end
--
-- Callback from MainUI when the HYPERSPACE button is pressed
--
function singlePlayerHyperspaceButtonPressed()
    print("singlePlayerHyperspaceButtonPressed: HYPERSPACE button pressed")
    singlePlayerHyperspaceButtonPushed()
    singlePlayerHyperspaceButtonDisable()
end

--
-- Disable/hide hyperspace (default behaviour on load)
--
function singlePlayerHyperspaceButtonDisable()
    print("singlePlayerHyperspaceButtonDisable")
    MainUI_ShowElement("NewTaskbar", "btnHW1SPHyperspace", 0)
    spGameInfo_playerCanHyperspace = 0
end

--
-- Enable the hyperspace button: called when "Hyperspace" objective created
--
function singlePlayerHyperspaceButtonEnable()

    if (spGameInfo_playerCanHyperspace ~= 0) then
        return
    end

    print("singlePlayerHyperspaceButtonEnable")
    MainUI_ShowElement("NewTaskbar", "btnHW1SPHyperspace", 1)
    MainUI_FlashButton("NewTaskbar", "btnHW1SPHyperspace", 3)
    --possibly flash the button.  Need to expose more named-based interface to buttons.
    --possibly clean up objectives, as per HW1 behaviour
    spGameInfo_playerCanHyperspace = 1
end


