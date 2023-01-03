
-- SingplePlayerFlow.lua
-- Logic to emulate, in the HW2 Engine, the flow of HW1 single player game logic (as defined in singleplayer.c)
-- Much of the code here is adapted from SP game functions of the same name from singleplayer.c.
-- Created November 2013 by Luke Moloney for Gearbox Software
--

function dontDoTooMuch()
    --do nothing
    return(0)
end

--
-- Single player game info imported from singleplayergame.c
--
spGameInfo_currentMission = 0
spGameInfo_onCompletePlayNIS = 0
spGameInfo_onCompleteHyperspace = 0
spGameInfo_onLoadPlayNIS = 0
spGameInfo_hyperspaceTimeStamp = 0
spGameInfo_resourceUnitsCollected = 0
spGameInfo_giveComputerFleetControl = 0
spGameInfo_asteroid0sCanMove = 0
singlePlayerMissionFailed = 0

G_GATE1 = 0
G_GATE2 = 0
G_GATE3 = 0

--
-- Spawn standing hyperspace gates at each point named with baseName..n
--
function singlePlayerStandingHyperspaceGatesSpawn(baseName, iPoint)
    print("singlePlayerStandingHyperspaceGatesSpawn: spawning standing gates.")
    while (1) do
        local position = Volume_GetPosition(baseName..iPoint)
        if (position[1] == 0 and position[2] == 0 and position[3] == 0) then
            break
        end
        local gateGroup = "HyperspaceGates_"..baseName..iPoint
        SobGroup_Create(gateGroup)
        print("singlePlayerStandingHyperspaceGatesSpawn: spawning "..gateGroup.." at "..baseName..iPoint)
        SobGroup_SpawnNewShipInSobGroup(1, "Junk_HyperSpaceGate", "Junk_HyperSpaceGate", gateGroup, baseName..iPoint)
        iPoint = iPoint + 1
    end
end

--
-- Watch the hyperspace gates (spawned in singlePlayerStandingHyperspaceGatesSpawn()) and set global variables based on their health
-- The strage math is based upon:
--    * script watches for G_GATE[n] < 39000 to begin an attack
--    * script watches for G_GATE[n] < 0 to declare it to be dead
--
function singlePlayerHyperspaceGatesWatch()

    if (spGameInfo_currentMission == 14) then
        G_GATE1 = SobGroup_HealthPercentage("HyperspaceGates_GATE1") * 40000 - 1
        G_GATE2 = SobGroup_HealthPercentage("HyperspaceGates_GATE2") * 40000 - 1
        G_GATE3 = SobGroup_HealthPercentage("HyperspaceGates_GATE3") * 40000 - 1
    end
end

--
-- Watch for a collision between the HeadshotAsteroid and the Mothership in M15
-- If there's a collision, destroy the headshot as well as the mothership
--
function singlePlayerHeadshotWatch()
    if (spGameInfo_currentMission == 15) then
        local headshotPoint = SobGroup_GetPosition("HeadShot")
        local mothershipPoint = Volume_GetPosition("PlayerStartPoint")
        local headshotDistance = Vector3_Magnitude(Vector3_Subtract(headshotPoint, mothershipPoint))

        --if the mothership is dead, the headshot is alive and the distance is really close
        local mothershipGroup = "singlePlayerLevelLoaded_Mothership"
        SobGroup_CreateIfNotExist(mothershipGroup)
        KAS_PlayerMothership(mothershipGroup, 0)

        if (SobGroup_HealthPercentage(mothershipGroup) <= 0.00 and SobGroup_HealthPercentage("HeadShot") > 0.01 and headshotDistance < 1000) then
            --kersplode the headshot too
            SobGroup_SetHealth("HeadShot", 0)
        end
    end
end

--
-- Called when a mission is loaded
--
function singlePlayerLevelLoaded()

    print("singlePlayerLevelLoaded: running custom code for mission: "..spGameInfo_currentMission)
		
    --restrict MP research
    dofilepath("data:scripts/scar/restrict.lua")
    SPRestrict()

    --special code for mission 10: search for SPECIAL_2_DontPlowThroughEnemyShips

    --special code for mission 13: create dummy hyperspace gates
    if (spGameInfo_currentMission == 13) then
        singlePlayerStandingHyperspaceGatesSpawn("GATETeleportOutPoint", 0)

    --special code for mission 14: duplicate the rotating nodes of the mining base
    elseif (spGameInfo_currentMission == 14) then
        singlePlayerStandingHyperspaceGatesSpawn("GATE", 1)

        -- Create some variables that correspond to the hyperspace gates' health.
        -- I can't find the HW1 code that drives this behaviour, so I'm going to guestimate it here.
        G_GATE1 = 40000
        G_GATE2 = 40000
        G_GATE3 = 40000
    end

    --immobilize player mothership
    local mothershipGroup = "singlePlayerLevelLoaded_Mothership"
    SobGroup_CreateIfNotExist(mothershipGroup)
    KAS_PlayerMothership(mothershipGroup, 0)
    SobGroup_SetMaxSpeed(mothershipGroup, 0)

    --set the player fleet's team colour to that of the player's profile
    local baseColour = {}
    local stripeColour = {}
    local badgeName = ""
    baseColour = Profile_GetTeamColourBase()
    stripeColour = Profile_GetTeamColourStripe()
    badgeName = Profile_GetTeamColourBadge()
    if (badgeName ~= "") then
        print("singlePlayerLevelLoaded: found profile team colours - setting now")
        print("WARNING: badge: "..badgeName)
        Player_SetTeamColourTheme(0, baseColour, stripeColour, badgeName, baseColour, "")
    end
end

--
-- Do NIS-specific setup before the NIS is spawned.
-- Inputs:  NISNumber - the number of the NIS (from G_PlayNis)
--
function singlePlayerNISSpecificSetup(NISNumber)

    --Mission03 Kharak destruction: setup the planet shader
    if (NISNumber == 4) then
        BKG_MeshSetSurface("KharakBurn", "bg_planetmelt")

    end
end

--
-- Get position, orientation of a point named "StartPointPlayer"
-- If it doesn't exist, use (0,0,0)/identity
--
function GetStartPointPlayer()
    startPoint = {0, 0, 0}
    startCoordsys = Matrix3_Identity()
                                                --!!!we need to make one, as this point is subject to scaling...
    result = Volume_GetPoint("PlayerStartPoint")
    if (result[1] ~= 0) then
        startPoint = {result[1], result[2], result[3]}
        startCoordsys = {result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12]}
    end
    return startPoint, startCoordsys
end

--
-- Listen for salvage events and set global variables that the KAS code watches.
--
G_SalvageTD         = 0
G_DawgHasBone       = 0
G_SalvageTS         = 0
G_SalvageCryoTray   = 0
G_SalvageFrigate    = 0
G_TechRemoved       = 0
G_SalvageHandOff    = 0
G_DockedWJydHQ      = 0

--
-- GameEventListener called when a salvage operation is successful
--
function singlePlayerSalCapCaptureCB(capturer, capturee)

    --check type of salvaged ship.  Mirrors SalCapCorvette.c (salCapHarvestTarget)
    capturedType = SobGroup_GetShipType(capturee)
    playerOwner = SobGroup_GetPlayerOwner(capturee)
    removeFromTeams = 1
    print("singlePlayerSalCapCaptureCB: "..capturer.." CAPTURES "..capturee.."("..capturedType..") of player "..playerOwner)
    --Set the global variables depending on what was captured.
    --Note: this behaviour is SP-specific.  There will have to be different code for MP code.
    if (KAS_IsTypeNoRace(capturedType, "CryoTray") ~= 0 or KAS_IsTypeNoRace(capturedType, "CryoTray_M03") ~= 0) then
        G_SalvageCryoTray = 1
        --print("singlePlayerSalCapCaptureCB: Salvaged CryoTray")
    elseif (KAS_IsTypeNoRace(capturedType, "AssaultFrigate") ~= 0) then
        G_SalvageFrigate = 1
        --print("singlePlayerSalCapCaptureCB: Salvaged AssuaultFrigate")
    else
        G_SalvageTS = 1
        --print("singlePlayerSalCapCaptureCB: SalvageTS")
    end

    --Special code for Mission01
    --Removing the captured drone from it's SobGroup before it has a chance to register capture makes the mission think it's destroyed, so leave it in the groups.
    --This is only for the salvage drone, not for the regular target drones.
    if (KAS_IsTypeNoRace(capturedType, "TargetDrone") ~= 0) then
        --if it's in "TDSalvageTrial"
        SobGroup_CreateIfNotExist("singlePlayerSalCapCaptureCB_Drones")
        SobGroup_FillCompare("singlePlayerSalCapCaptureCB_Drones", "TDSalvageTrial", capturee)
        if (SobGroup_Count("singlePlayerSalCapCaptureCB_Drones") ~= 0) then
            print("singlePlayerSalCapCaptureCB: This is a salvage drone - leaving it alive.")
            removeFromTeams = 0
        end
    end

    if (removeFromTeams == 1) then
        --Remove from any teams.  SP campaign checks count of team ships.
        KAS_RemoveFromTeams(capturee)
    end
end

--
-- GameEventListener called when a salvage operation starts SalCap or JunkYardDawg grabs something
--
spSalCapShipsGrabbed = "ShipsGrabbedBySalCap"
function singlePlayerSalCapGrabbedCB(capturer, capturee)
    --check type of salvaged ship.  Mirrors SalCapCorvette.c (salCapHarvestTarget)
    capturerType = SobGroup_GetShipType(capturer)
    capturedType = SobGroup_GetShipType(capturee)
    print("singlePlayerSalCapGrabbedCB: "..capturer.."("..capturerType..") GRABS "..capturee.."("..capturedType..")")

    -- set global vars depending on who's doing the capture.
    -- Ported from SalCapCorvette(~2218)
    if (strupper(capturerType) == "JUNK_JUNKYARDDOG") then
        G_DawgHasBone = 1
    else
        G_SalvageTD = 1
    end

    --record that the ship was grabbed.  !!! this does not handle ships being de-grabbed
    SobGroup_CreateIfNotExist(spSalCapShipsGrabbed)
    SobGroup_SobGroupAdd(spSalCapShipsGrabbed, capturee)

end

--
-- GameEventListener called whenever a salvage corvette extracts tech.  Will be called each update cycle.
--
G_AmountOfTechHarvested = 0
function singlePlayerSalCapHarvestedTechCB(capturer, capturee)

    G_TechRemoved = SobGroup_GetTechHarvestedAmount(capturer) * 100

    if (G_TechRemoved >= G_AmountOfTechHarvested) then
        G_AmountOfTechHarvested = G_AmountOfTechHarvested + 10
        if (G_AmountOfTechHarvested >= 100) then
            G_AmountOfTechHarvested = 0
        end
        capturerType = SobGroup_GetShipType(capturer)
        capturedType = SobGroup_GetShipType(capturee)
        --print("singlePlayerSalCapHarvestedTechCB: "..capturer.."("..capturerType..") GRABS "..capturee.."("..capturedType..") HARVESTED "..G_TechRemoved)
    end
end

--
-- GameEventListener called whenever the Sal/Cap corvette returns and docks with mothership, with a tech payload
--
singlePlayerGameMessagesReceived = {}
function singlePlayerSalCapTechnologyReturnedCB(capturer, capturee)

    --singlePlayerGameMessagesReceived["Game_TechnologyReturned"] = 1
    --
    --capturerType = SobGroup_GetShipType(capturer)
    --capturedType = SobGroup_GetShipType(capturee)
    --print("singlePlayerSalCapTechnologyReturnedCB: "..capturer.."("..capturerType..") GRABS "..capturee.."("..capturedType..") TECH CAPTURED")
end

--
-- GameEventListener called whenever the Sal/Cap corvette hands off a captured target to its mothership
--
function singlePlayerSalCapHandoffTargetCB(capturer, capturee)
    capturerType = SobGroup_GetShipType(capturer)
    capturedType = SobGroup_GetShipType(capturee)
    print("singlePlayerSalCapHandoffTargetCB: "..capturer.."("..capturerType..") HANDS OFF "..capturee.."("..capturedType..")")

    --special case: don't set this variable for cryo-trays as it can break Mission03 if you salvage trays before a frigate.
    local captureeType = SobGroup_GetShipType(capturee)
    if (KAS_IsTypeNoRace(captureeType, "AssaultFrigate") ~= 0) then
        G_SalvageHandOff = 1
    end
end

function singlePlayerShipDockedCB(docking, dockWith)
    spSpecialShipDockedCB(docking, dockWith)

    dockingType = SobGroup_GetShipType(docking)
    dockWithType = SobGroup_GetShipType(dockWith)
    --print("singlePlayerShipDockedCB: "..dockingType.." DOCKS WITH "..dockWithType)

    if (KAS_IsTypeNoRace(dockingType, "SalvageCorvette") ~= 0 and KAS_IsTypeNoRace(dockWithType, "Mothership") ~= 0) then
        --print("singlePlayerShipDockedCB: "..dockingType..": Sal/Caps DOCKING")
        if (SobGroup_CountByFilterInclude(docking, "CurrentCommandState", "SALCAPSTATE_ReturningToBaseWithTech") ~= 0) then

            --print("singlePlayerShipDockedCB: "..dockingType..") RETURNS TECH to "..dockWithType)
            singlePlayerGameMessagesReceived["Game_TechnologyReturned"] = 1
        end
    elseif (strupper(dockWithType) == "JUNK_JUNKYARDOFFICE" and SobGroup_GetPlayerOwner(docking) == 0 and
        (SobGroup_CountByFilterInclude(docking, "displayFamily", "Fighter") + SobGroup_CountByFilterInclude(docking, "displayFamily", "Corvette")) > 0) then
        --print("singlePlayerShipDockedCB: player "..dockingType.." DOCKS WITH JUNKYARD OFFICE")
        G_DockedWJydHQ = 1
    end
end

function singlePlayerShipLaunchedCB(launching, launchedFrom)
    spSpecialShipLaunchedCB(launching, launchedFrom)
    KAS_ShipLaunchedCB(launching, launchedFrom)
end

-- Start and stop GameEventListeners
--
function singlePlayerListenersRegister()
    GameEvent_Listen(GE_SalCapHarvestedTech, "singlePlayerSalCapHarvestedTechCB")
    GameEvent_Listen(GE_SalCapGrabbedTarget, "singlePlayerSalCapGrabbedCB")
    GameEvent_Listen(GE_SalCapCapturedTarget, "singlePlayerSalCapCaptureCB")
    GameEvent_Listen(GE_SalCapTechnologyReturned, "singlePlayerSalCapTechnologyReturnedCB")
    GameEvent_Listen(GE_SalCapHandoffTarget, "singlePlayerSalCapHandoffTargetCB")

    GameEvent_Listen(GE_ShipLaunched,       "singlePlayerShipLaunchedCB")
    GameEvent_Listen(GE_ShipDocked,         "singlePlayerShipDockedCB")

end
function singlePlayerListenersUnRegister()
    GameEvent_UnListen(GE_SalCapCapturedTarget)
    GameEvent_UnListen(GE_SalCapGrabbedTarget)
    GameEvent_UnListen(GE_SalCapHarvestedTech)
    GameEvent_UnListen(GE_SalCapTechnologyReturned)

    GameEvent_UnListen(GE_ShipLaunched)
    GameEvent_UnListen(GE_ShipDocked)
end

--
-- Do anything that needs to be done post-load or on post-restore
--
function singlePlayerOnStartOrLoad(missionNumber)
    print("singlePlayerOnStartOrLoad - adding rule - mission: "..spGameInfo_currentMission);

    spGameInfo_currentMission = missionNumber

    singlePlayerListenersRegister()
    singlePlayerHyperspaceOnStartOrLoad()
    if (Rule_Exists("singlePlayerGameUpdate") == 0) then
        Rule_Add("singlePlayerGameUpdate")
    end

    --special code for mission 02: set the planet as melted
    if (spGameInfo_currentMission == 3) then
        print("singlePlayerOnStartOrLoad: setting Kharak burned.")
        BKG_MeshSetSurface("KharakBurn", "bg_planetmelted")
    end

    --killer asteroids in Mission06
    if (spGameInfo_currentMission == 6) then
        KAS_KillerAsteroidsMove()
    end

    --make sure the trade gui is loaded
    if (KAS_TradeGUILoaded ~= 0) then
        MainUI_LoadScreen("DATA:\\UI\\NewUI\\BentusiDialog.lua", "bentusidialog")
        if (KAS_TradeGUIPrice ~= "") then
            print("singlePlayerOnStartOrLoad: setting price to "..KAS_TradeGUIPrice)
            MainUI_SetItemText("bentusidialog", "m_lblTechName", KAS_TradeGUILabel)
            MainUI_SetItemText("bentusidialog", "m_lblTechDescription", KAS_TradeGUIDescription)
            MainUI_SetItemText("bentusidialog", "m_lblTechPrice", " "..KAS_TradeGUIPrice)
        end
    end

    --reset the music to whatever it was when saved
    KAS_SavedMusicRestore()
end

--
-- Called at the beginning of each level
--
function singlePlayerStartGame(missionNumber)


    singlePlayerMissionFailed = 0

    singlePlayerHyperspaceButtonDisable()

    spGameInfo_currentMission = missionNumber

    if (missionNumber ~= 1) then
        singlePlayerLevelLoaded()
    else
        print("singlePlayerStartGame: Mission["..missionNumber.."]: preparing first mission...")
        --tmTechInit();
        --spFleetModifier = 0.0f;
        --GetMissionsDirAndFile(1);
        --levelInit(spMissionsDir, spMissionsFile);
        singlePlayerLevelLoaded()
        --singlePlayerKasMissionStart(1)
        startpoint, startCoordsys = GetStartPointPlayer()
        nis, centre, campaignSpawned = singlePlayerNISNamesGet(1)
        --some NISs are spawned after the Anamtic, specified in the campaign file.  Allow for this here.
        --NISDebug(nis)
        if (campaignSpawned == 0) then
            singlePlayerStartNis(nis, centre, startPoint, startCoordsys)
        end
    end

    --killer asteroids in Mission06.
    --Note it's (potentially) called twice: once here (on start of mission) and also above (on start or restore of mission)
    if (missionNumber == 6) then
        KAS_KillerAsteroidsMove()
    end

end

--
-- This function emulates the way in HW1 ships were all hyperspaced in when KAS started running.
-- In HW2HD, scripts start running as soon as the game starts, which is causing bugs in the emulation.
--
singlePlayerInitFinishFunction = ""
function singlePlayerPauseUntilHyperspaceComplete(InitFinishFunction)
    KASRule_AddFSM("singlePlayer", "singlePlayerWatchHyperspaceComplete", "singlePlayerPauseUntilHyperspaceComplete")

    KASRules_PauseExceptFSM("singlePlayer")
    singlePlayerInitFinishFunction = InitFinishFunction
end

--
-- A rule added after hyperspace is complete, this function waits one cycle before letterboxing out, then stops.
--
function singlePlayerPostHyperspaceLetterboxWatch()
    KAS_EndStartingLetterbox()
    Rule_Remove("singlePlayerPostHyperspaceLetterboxWatch")
end

--
-- Watches for the player fleet, or at least the mothership,  to finish hyperspacing in.
--
function singlePlayerWatchHyperspaceComplete(TeamName)

    --get player mothership
    -- get command
    -- if it's idle
    --we're in
    local mothershipGroup = "singlePlayerLevelLoaded_Mothership"
    SobGroup_CreateIfNotExist(mothershipGroup)
    KAS_PlayerMothership(mothershipGroup, 0)

    if (SobGroup_Count(mothershipGroup) ~= 0) then
        local currentCommand = SobGroup_GetCurrentOrder(mothershipGroup)

        if (currentCommand == COMMAND_Idle) then
            --print("Mothership out of hyperspace; resuming KAS, running "..singlePlayerInitFinishFunction)
            KASRules_UnpauseOthers()
            KASRule_Remove("singlePlayer", "singlePlayerWatchHyperspaceComplete", "singlePlayerWatchHyperspaceComplete")

            Rule_AddInterval("singlePlayerPostHyperspaceLetterboxWatch", KAS_LetterboxHoldTime)

            dostring(singlePlayerInitFinishFunction)
        --else
            --print("Mothership current command: "..currentCommand)
        end
    end
end


--
--
--
function singlePlayerNextLevel()
    singlePlayerMissionFailed = 0
    startnisPosition = { 0.0, 0.0, 0.0}
    startnisOrientation = {1,0,0,0,1,0,0,0,1}
    --char *nis, *script;
    --bool centre;

    if (spGameInfo_currentMission == 16) then
        singlePlayerMissionCompleteCB()
        return
    end

    if (spGameInfo_onCompletePlayNIS > 0) then
        nis, centre, campaignSpawned = singlePlayerNISNamesGet(spGameInfo_onCompletePlayNIS)
        if (campaignSpawned == 0) then
            singlePlayerStartNis(nis, centre, startnisPosition, startnisOrientation)
        end
        if (spGameInfo_onCompleteHyperspace) then
            hyperspaceAtEndOfSinglePlayerNIS = 1
        else
            print("FATAL: Not hyperspacing at end of level not supported yet")
        end
        return
    end

    if (spGameInfo_onCompleteHyperspace) then
        if (hyperspaceOverride) then
            spHyperspaceButtonPushed();
        end
    end
end

--
--rather mis-named, as it refers to the end of the entire campaign of missions.
--
function singlePlayerMissionCompleteCB()
    --selSelected.numShips = 0;
    --ioUpdateShipTotals();
    --mrRenderMainScreen = FALSE;
    --universe.quittime = universe.totaltimeelapsed;
    --// this will prevent the shiplist from being displayed!
    --utyCreditsSequence = TRUE;
    --...trigger game-end credits.
end

--
--
--
function singlePlayerMissionFailedCB()
    print("singlePlayerMissionFailedCB; FILL ME OUT PLEASE")
    singlePlayerMissionFailed = 1
    --univKillPlayer(0,PLAYERKILLED_LOSTMISSION);
    --CheckPlayerWin();
end

function singlePlayerCheckDebugKeys(ID)
    --...check debug keys, if needed
end

--
-- Watches the research tree.  If any research has changed, update the list of ships in build manager.
--
KAS_RestrictShipList = {}
KAS_RestrictShipList =
{
    --{ShipType, bIsRestricted, minLevel}
    {"KUS_INTERCEPTOR",         0, 1},
    {"KUS_REPAIRCORVETTE",      0, 1},
    {"KUS_HEAVYCORVETTE",       0, 2},
    {"KUS_LIGHTCORVETTE",       0, 2},
    {"KUS_ASSAULTFRIGATE",      0, 3},
    {"KUS_SUPPORTFRIGATE",      0, 3},
    {"KUS_RESOURCECONTROLLER",  0, 3},  						
    {"KUS_IONCANNONFRIGATE",    0, 4},
    {"KUS_ATTACKBOMBER",        0, 4},
    {"KUS_DEFENDER",            0, 5},
    {"KUS_DRONEFRIGATE",        0, 6},
    {"KUS_DESTROYER",           0, 6},
    {"KUS_MULTIGUNCORVETTE",    0, 7},
    {"KUS_CARRIER",             0, 9},
    {"KUS_MISSILEDESTROYER",    0, 9},
    {"KUS_GRAVWELLGENERATOR",   0, 9},
    {"KUS_MINELAYERCORVETTE",   0, 10},
    {"KUS_PROXIMITYSENSOR",     0, 10},
    {"KUS_CLOAKEDFIGHTER",      0, 12},
    {"KUS_HEAVYCRUISER",        0, 13},
    {"KUS_CLOAKGENERATOR",      0, 13},
    {"KUS_SENSORARRAY",         0, 14},
}		
function singlePlayerBuildablesUpdate()
    for i = 1,30,1 do

        if (KAS_RestrictShipList[i] ~= nil) then
            if (spGameInfo_currentMission >= KAS_RestrictShipList[i][3] and Player_HasResearchPrequisitesToBuild(0, KAS_RestrictShipList[i][1]) ~= 0) then
                --has prerequisites, item not restricted
                if (KAS_RestrictShipList[i][2] == 1) then
                    print("singlePlayerBuildablesUpdates: build item "..KAS_RestrictShipList[i][1].." meets prerequisites; unrestricting")
                    Player_UnrestrictBuildOption(0, KAS_RestrictShipList[i][1])
                    KAS_RestrictShipList[i][2] = 0
                end
            else
                --missing prerequisites, item to be restricted
                if (KAS_RestrictShipList[i][2] == 0) then
                    print("singlePlayerBuildablesUpdate: build item "..KAS_RestrictShipList[i][1].." fails prerequisites; restricting")
                    Player_RestrictBuildOption(0, KAS_RestrictShipList[i][1])
                    KAS_RestrictShipList[i][2] = 1
                end
            end
        end
    end
end

--
-- Bring up a deferred location card: it won't be brought up until the next singlePlayerGameUpdate().
-- This means that location cards triggered in the initial init() functions will not be displayed until after the animatics.
--
singlePlayerLocationCardText = nil
singlePlayerLocationCardTime = nil
function singlePlayerLocationCard(text, time)
    singlePlayerLocationCardText = text
    singlePlayerLocationCardTime = time
end
function singlePlayerLocationCardUpdate()
    if (singlePlayerLocationCardText ~= nil) then
        Subtitle_Message(singlePlayerLocationCardText, singlePlayerLocationCardTime)
        singlePlayerLocationCardText = nil
    end
end

--
-- This is a monsterous, ponderous function in HW1.
-- We're only porting over the sections that are needed for HW2.  Among them:
--  * Watch for the G_PlayNis variable being set/nonzero, which will trigger the NIS specific to that particular mission.
--
-- Notes:
--  * This watch added with a Rule_Add, not KASRule_Add so it will not be paused by KASRule_PauseOthers,
--      as a better emulation of HW1's functionality.
--
function singlePlayerGameUpdate()

    -- play an nis when the time is right
    if (G_PlayNis ~= 0) then

        startpoint, startCoordsys = GetStartPointPlayer()
        print("singlePlayerGameUpdate: G_PlayNis = "..G_PlayNis)
        nis, centre, campaignSpawned = singlePlayerNISNamesGet(G_PlayNis)
        --some NISs are spawned after the Anamtic, specified in the campaign file.  Allow for this here.
        --NISDebug(nis)
        singlePlayerNISSpecificSetup(G_PlayNis)
        if (campaignSpawned == 0) then
            singlePlayerStartNis(nis, centre, startPoint, startCoordsys)
        end

        G_PlayNis = 0
    end

    -- play an nislet when the time is right
    if (G_PlayNislet ~= 0) then

        startpoint, startCoordsys = GetStartPointPlayer()
        nis = singlePlayerNISletNamesGet(G_PlayNislet)
        --some NISs are spawned after the Anamtic, specified in the campaign file.  Allow for this here.
        --NISDebug(nis)
        if (nis ~= "") then
            singlePlayerStartNis(nis, 1, startpoint, startCoordsys)
        end

        G_PlayNislet = 0
    end

    -- watch the health of the mothership, trigger mission failure if it dies
    if (spGameInfo_hyperspaceState == NO_HYPERSPACE) then
        local motherGroup = "singlePlayer_MothershipWatch"
        SobGroup_CreateIfNotExist(motherGroup)
        Player_FillShipsByType(motherGroup, 0, "Kus_Mothership")
        if (singlePlayerMissionFailed == 0 and SobGroup_Count(motherGroup) == 0) then
            KAS_MissionFailed()
        end
    end

    --keep an eye on the hyperspace gates in M14
    singlePlayerHyperspaceGatesWatch()

    --watch for Headshot-mothership collisions in M15
    singlePlayerHeadshotWatch()

    --bring up a location card if the time is right
    singlePlayerLocationCardUpdate()

    --make ships buildable if we've been granted the tech
    singlePlayerBuildablesUpdate()

    singlePlayerHyperspaceStateUpdate()

    --un-duck audio if any speech events expire
    KAS_SubtitleExpiredCheck()

end

function SteamFuncsSetAchievement(achievement)
    print("Completed Steam Achievments: "..achievement)
    --imple!!!
end

--
-- Lockout/hide UI in advance of an NIS
--
function spMainScreenAndLockout(flags)
    if ( Sensors_ManagerIsActive() ~= 0 ) then              -- if view is in the sensors manager
        print("spMainScreenAndLockout: in sensors manager.  Closing sensors manager.")
        Sensors_Toggle(0)                                   -- take them out
    end
    Sensors_EnableToggle(0)                                 -- Disallow going in and out of the Sensors Manager
    if (flags == SPLOCKOUT_EVERYTHING) then
        Universe_AllowPlayerOrders(0)
        Camera_AllowControl(0)
    end
    SobGroup_DeSelectAll()
    Sound_ExitIntelEvent()
end

--
-- Unlockout the UI after an NIS or hyperspace event
--
function spUnlockout()
    --...optionally reselect player ships from before lockout...
    Camera_AllowControl(1)
    Universe_AllowPlayerOrders(1)
    Sensors_EnableToggle(1)
end

--
-- Called at the end of a mission, before killing the Scar state
--
function OnEnd()
    print("singlePlayerFlow::OnEnd()")
    singlePlayerHyperspaceOnMissionEnd()
end
