--
-- SingplePlayerNIS.lua
-- Single-player NIS logic split out of SinglePlayerFlow.lua
-- Much of the code here is adapted from SP game functions of the same name from singleplayer.c.
-- Created February 2014 by Luke Moloney for Gearbox Softwareu
--

--
-- Global variables from singleplayerflow.c
--
hyperspaceAtEndOfSinglePlayerNIS = 0

NUMBER_SINGLEPLAYER_NIS = 12
NUMBER_SINGLEPLAYER_MISSIONS = 19

singlePlayerNisNumber = -1
singlePlayerNisletNumber = -1

--
-- Global variables related to NIS triggering
--
G_PlayNis        = 0
G_PlayNislet     = 0

--a variable representing completion of each possible NIS
G_Nis1Complete   = 1     --Campaign-spawned NIS: SP game is paused until M01 NIS plays so just set it to 1
G_Nis2Complete   = 0
G_Nis3Complete   = 0
G_Nis4Complete   = 0
G_Nis5Complete   = 0
G_Nis6Complete   = 0
G_Nis7Complete   = 0
G_Nis8Complete   = 0
G_Nis9Complete   = 0
G_Nis10Complete  = 0
G_Nis10Complete  = 0
G_Nis11Complete  = 0
G_Nis12Complete  = 0
G_Nis13Complete  = 0
G_Nis14Complete  = 0
G_Nis15Complete  = 0
G_Nis16Complete  = 0

G_Nislet60Complete = 0

--  descriptions of NIS behaviours.
--  Notes:
--      * Make sure the NIS names match the names of NISs spawned in the campaign, to ensure proper pause-during-NIS behaviour.
--      * Forward slashes and backslashes in filenames are not the same!
--      * Make sure that NISs spawned in the campaign have the campaign-spawned flag set here, so you don't get two NISs spawned.
--  Format:
--    <NIS name>    <Motership- <Campaign- <Pause SP game
--                   relative>  spawned>    during playback>
--!!! shouldn't this be one per mission?  It's indexed by mission, after all...
SPAWN_MISSIONSTART = 0
SPAWN_CAMPAIGN = 1
SPAWN_MISSION = 2
nisR1Names = -- [NUMBER_SINGLEPLAYER_NIS][2] =
{
    { "nis/n01r1",     0,         1,        1,                  },
    { "nis/n02",       1,         0,        1,                  },
    { "nis/n04",       1,         0,        1,                  },
    { "nis/n03r1",     1,         0,        1,                  },
    { "nis/n05r1",     1,         0,        1,                  },
    { "nis/n06",       1,         0,        1,                  },
    { "nis/n07",       1,         0,        1,                  },
    { "nis/n08r1a",    1,         0,        1,                  },
    { "nis/n09",       1,         0,        1,                  },
    { "nis/n10r1",     1,         0,        1,                  },
    { "nis/n11r1",     1,         0,        1,                  },
    { "nis/n12r1",     1,         0,        1,                  },
}

missionNISNumbers = --[NUMBER_SINGLEPLAYER_MISSIONS]
{
    1,      --M01, intro NIS
    2,      --M02, P1 intro
    3,      --M03, Kharak burns
    4,      --M04, Traders intro
    -1,     --M09, traders intro NISlet
    -1,     --M06, rocks
    5,      --M07, P2 intro
    -1,     --M08
    -1,     --M09, traders intro NISlet
    6,      --M10, research station
    7,      --M11, traders in trouble (and later traders' exposition backstory)
    -1,     --M12
    -1,     --M13
    10,     --M14, hyperspace gate?
    9,      --M15, headshot?
    -1,     --M16
}

singlePlayerNISName = ""

singlePlayerNISHandle = NISHandle_Invalid

NISLETS_PER_LEVEL = 3
--typedef struct
--{
--    char *name[NISLETS_PER_LEVEL];
--    bool8 raceSpecific[NISLETS_PER_LEVEL];
--}
--nisletnames;

--see note above nisR1Names regarding nis\m03 being in mission 4
--in addition, Missions 14 and 15 were swapped
nisletNames = --[NUMBER_SINGLEPLAYER_MISSIONS] =
{
    {{"", "", ""},                              {0,0,0},      },
    {{"nis\\m02a", "", ""},                     {0,0,0},      },
    {{"", "", ""},                              {0,0,0},      },
    {{"nis\\m03a", "", ""},                     {0,0,0},      },
    {{"", "", ""},                              {0,0,0},      },
    {{"nis\\m06a", "", ""},                     {0,0,0},      },
    {{"nis\\m07a", "", ""},                     {0,0,0},      },
    {{"nis\\m08a", "", ""},                     {0,0,0},      },
    {{"nis\\m09a", "nis\\m09b", "nis\\m06a"},   {0,0,0},      },
    {{"nis\\m10a", "", ""},                     {0,0,0},      },
    {{"nis\\m11a", "", ""},                     {0,0,0},      },
    {{"nis\\m12a", "nis\\m12b", ""},            {0,1,0},      },
    {{"nis\\m13a", "", "nis\\m13c"},            {0,0,1},      },
    {{"nis\\m15a", "nis\\m15b", ""},            {0,0,0},      },
    {{"nis\\m14a", "", ""},                     {1,0,0},      },
    {{"nis\\m16a", "nis\\m16a", "nis\\m16a"},   {0,0,1},      },
    {{"", "", ""},                              {0,0,0},      },
}

-------------------------------------------------------------------------------
--  Name        : singlePlayerNISNamesGet
--  Description : Figure out the name of the nis and script file for a given
--                  nis number.
--  Inputs      : nisNumber - number of NIS to run
--  Outputs     : nisname - name of nis file
--                centreMothership - TRUE if the NIS is to be centred about player's mothership
--                spawnTime - SPAWN_MISSIONSTART, SPAWN_CAMPAIGN, SPAWN_MISSION
--  Return      : void
----------------------------------------------------------------------------*/
--function singlePlayerNISNamesGet(char **nisname, char **scriptname, bool *centreMothership, sdword nisNumber)
function singlePlayerNISNamesGet(nisNumber)
    singlePlayerNisNumber = nisNumber
    --nisNumber--;
    assert(nisNumber >= 0)
    assert(nisNumber <= NUMBER_SINGLEPLAYER_NIS)

    nisname = nisR1Names[nisNumber][1]
    --scriptname = nisR1Names[nisNumber][2]

    singlePlayerNISName = nisname
    centreMothership = nisR1Names[nisNumber][2]
    campaignSpawned = nisR1Names[nisNumber][3]
    return nisname, centreMothership, campaignSpawned
end

-------------------------------------------------------------------------------
--  Name        : singlePlayerNISletNamesGet
--  Description : Figure out the name of the nis and script file for a given
--                  nis number.
--  Inputs      : nisletNumber - number of NISlet to run
--  Outputs     : nisname - name of nis file
--                scriptname - name of nis script file
--  Return      : TRUE if the NIS can be played properly
----------------------------------------------------------------------------*/
--bool singlePlayerNISletNamesGet(char **nisname, char **scriptname, sdword nisletNumber)
function singlePlayerNISletNamesGet(nisletNumber)
    --sdword missionNumber, insertNumber;
    --static char nisFileName[16];
    --static char nisScriptName[16];

    singlePlayerNisletNumber = nisletNumber

    missionNumber = nisletNumber / 10
    insertNumber = 1 -- nisletNumber % 10
    --floor(insertNumber)
    --insertNumber = nisletNumber - (insertNumber * 10)
    --missionNumber--;
    assert(missionNumber > 0)
    assert(missionNumber <= NUMBER_SINGLEPLAYER_MISSIONS)
    --assert(insertNumber > 0)
    --assert(insertNumber <= NISLETS_PER_LEVEL)

    nisFileName = nisletNames[missionNumber][1][insertNumber]

    if (nisletNames[missionNumber][2][insertNumber] ~= 0) then
        nisFileName = nisFileName.."r1"
    end

    --nisScriptName = nisFileName..".script"
    --nisFileName = nisFileName..".nis"

    print("NISletNames: number "..nisletNumber.." specifies "..nisFileName)

    singlePlayerNISName = nisFileName

    return nisFileName
end

-------------------------------------------------------------------------------
--  Name        : singlePlayerStartNis
--  Description : Start a single player NIS or NISlet
--  Inputs      : nisname - name of NIS file
--                centreMothership - TRUE if this NIS plays relative to the
--                  player's mothership (does not apply to NISlets).
--                positionAndHeading - ?
--  Outputs     :
--  Return      : void
----------------------------------------------------------------------------*/
function singlePlayerStartNis(nisname, centreMothership, position, coordsys)
    print("singlePlayerStartNis("..nisname..", "..centreMothership..", ("..position[1]..", "..position[2]..", "..position[3].."))")

    spMainScreenAndLockout(SPLOCKOUT_EVERYTHING);

    NISLoad(nisname)

    --see if we should centre NIS around a ship
    nisCentreGroup = ""              --name of sobgroup, the first of which is the ship to centre the NIS about
    if (SobGroup_Count("GrowSelection_NisCentreShip") > 0) then

        nisCentreGroup = "GrowSelection_NisCentreShip"
        typeOfCentreShip = "GrowSelection_NisCentreShip"  --...Is there a better way of passing the type of the centre ship to C++?
    end

    centreShipFound = 0
    motherVector = 0
    motherMatrix = 0
    angle = 0
    if (nisCentreGroup ~= "") then

        print("singlePlayerStartNis: found SobGroup "..nisCentreGroup.." ")
        centreShipType = SobGroup_GetShipType(nisCentreGroup)
        centreInfo = NISShipStartPosition(nisname, centreShipType, -1)
        --to get the ships rotation abouts Z, get it's heading on the XY plane,
        --cross it with a 'normal' (zero degree) vector and check sign of Y to determine what to do with cross product
        --...do some math here
        centreShipFound = centreInfo[1]
        motherVector = {centreInfo[2], centreInfo[3], centreInfo[4] }
        motherMatrix = {centreInfo[5], centreInfo[6], centreInfo[7], centreInfo[8], centreInfo[9], centreInfo[10], centreInfo[11], centreInfo[12], centreInfo[13] }

        position = SobGroup_GetCoordSys(nisCentreGroup)
        heading = Matrix3_GetVector3FromCol(SobGroup_GetCoordSys(nisCentreGroup), 2)
        heading[3] = 0
        Vector3_Normalize(heading)
        normal = {1, 0, 0}
        dotProduct = Vector3_DotProduct(heading, normal)
        angle = 0
        if (heading[1] < 0) then
            angle = Trig_TWOPI - Trig_acos(dotProduct)
        else
            angle = Trig_acos(dotProduct)
        end
    else

        if (centreMothership ~= 0) then
            print("singlePlayerStartNis: looking for Hgn_Mothership or explicit ship to centre on...")

            nisCentreGroup = "StartNIS_MothershipGroup"
            KAS_PlayerMothership(nisCentreGroup, 0)                                                     --make a SobGroup with player's mothership in it

            centreInfo = NISShipStartPosition(nisname, SobGroup_GetShipType(nisCentreGroup), -1)        --Make this race-independent

            centreShipFound = centreInfo[1]
            motherVector = {centreInfo[2], centreInfo[3], centreInfo[4] }
            motherMatrix = {centreInfo[5], centreInfo[6], centreInfo[7], centreInfo[8], centreInfo[9], centreInfo[10], centreInfo[11], centreInfo[12], centreInfo[13] }
            print("singlePlayerStartNis: motherResult: {" ..centreInfo[1].."}")
            print("singlePlayerStartNis: motherVector: {" ..centreInfo[2]..  ", " ..centreInfo[3]..  ", " ..centreInfo[4]..  "}")
            print("singlePlayerStartNis: motherMatrix: {" ..centreInfo[5]..  ", " ..centreInfo[6]..  ", " ..centreInfo[7]..  "}")
            print("singlePlayerStartNis: motherMatrix: {" ..centreInfo[8]..  ", " ..centreInfo[9]..  ", " ..centreInfo[10].. "}")
            print("singlePlayerStartNis: motherMatrix: {" ..centreInfo[11].. ", " ..centreInfo[12].. ", " ..centreInfo[13].. "}")
            assert(centreInfo[1] == 1)

            --KAS_PlayerMothership(nisCentreGroup, 0)

            assert(SobGroup_Count(nisCentreGroup) == 1)
            --nisCentreGroup = nisCentreGroup
        end
    end

    if (centreShipFound ~= 0) then
        --we found the mothership or other centre ship, so let's play the NIS relative to it:
        print("singlePlayerStartNis: we found the mothership or other centre ship, so let's play the NIS relative to it")
        identityMatrix = Matrix3_Transpose(motherMatrix)
        groupCoordSys = SobGroup_GetCoordSys(nisCentreGroup)
        position = SobGroup_GetPosition(nisCentreGroup)
        nisMatrix = Matrix3_MultiplyByMatrix3(groupCoordSys, identityMatrix)
        tempVec = Matrix3_MultiplyVector3ByMatrix(motherVector, nisMatrix)
        position = Vector3_Subtract(position, tempVec)

    else
        --play about 0,0,0
        print("singlePlayerStartNis: No centre ship, play about 0,0,0")
        identityMatrix = Matrix3_Identity()
        nisMatrix = coordsys
    end

    NISPlayFromCoordSys(nisname, position, nisMatrix)
    singlePlayerGamePauseDuringNIS()
end

--
-- Dump the positions of a SobGroup.  Used to generate the formation for the scouts at the end M01NIS01
--
function singlePlayerShipFormationDump(scoutGroup)
    local nScouts = SobGroup_Count(scoutGroup)
    local iScout = 0
    local oneScoutGroup = "singlePlayerShipFormationDump_OneScout"


    --get leader's position
    SobGroup_CreateIfNotExist(oneScoutGroup)
    SobGroup_FillShipsByIndexRange(oneScoutGroup, scoutGroup, 0, 1)
    local leaderPosition = SobGroup_GetCentrePosition(oneScoutGroup)
    local leaderCoordsys = SobGroup_GetCoordSys(oneScoutGroup)

    print("leaderPosition = {"..leaderPosition[1]..", "..leaderPosition[2]..", "..leaderPosition[3].."},")

    iScout = 0
    while (iScout < nScouts) do
        if (SobGroup_FillShipsByIndexRange(oneScoutGroup, scoutGroup, iScout, 1) > 0) then
            local slotPosition = SobGroup_GetCentrePosition(oneScoutGroup)
            local offset = Vector3_Subtract(slotPosition, leaderPosition)
            offset = Matrix3_MultiplyVector3ByMatrix(offset, leaderCoordsys)

            --print("{")
            --print("    Name             = \"HW1NIS01Scout"..iScout.."\",")
            --print("    DesiredShipTypes = \"\",")
            print("    {"..slotPosition[1]..", "..slotPosition[2]..", "..slotPosition[3].."},")
            print("    formation( {"..offset[1].." * SCOUT_SQUAD_SPACING, "..offset[2].." * SCOUT_SQUAD_SPACING, "..offset[3].." * SCOUT_SQUAD_SPACING}, {0,0,1}, {0,1,0} );")
            --print("    Heading          = {0, 0, 0},")
            --print("},")
        end
        iScout = iScout + 1
    end
end

--
-- Re-arranges a sobgroup so that the first in the group (the leader) will have the maximal Z value
--
function singlePlayerShipsSortZ(scoutGroup)
    local nScouts = SobGroup_Count(scoutGroup)
    local iScout = 0

    --get leader's position
    local oneScoutGroup = "singlePlayerShipsSortZ_OneScout"
    SobGroup_CreateIfNotExist(oneScoutGroup)
    SobGroup_FillShipsByIndexRange(oneScoutGroup, scoutGroup, 0, 1)
    local leaderPosition = SobGroup_GetCentrePosition(oneScoutGroup)
    local leaderCoordsys = SobGroup_GetCoordSys(oneScoutGroup)

    --get max Z
    local averagePosition = leaderPosition

    --now re-arrange the list: put maxZ squad first
    local rearrangedScoutGroup = "singlePlayerShipsSortZ_Rearranged"
    SobGroup_CreateIfNotExist(rearrangedScoutGroup)
    SobGroup_Clear(rearrangedScoutGroup)
    --SobGroup_FillShipsByIndexRange(rearrangedScoutGroup, scoutGroup, iMaxZ, 1)

    local inputIndices = {1, 3, 2, 5, 4, 6, 0}

    --re-arrange
    iScout = 1
    while (iScout <= nScouts) do
        if (SobGroup_FillShipsByIndexRange(oneScoutGroup, scoutGroup, inputIndices[iScout], 1) > 0) then
            SobGroup_SobGroupAdd(rearrangedScoutGroup, oneScoutGroup)
        end
        iScout = iScout + 1
    end

    --replace input group
    SobGroup_Copy(scoutGroup, rearrangedScoutGroup)
end

function singlePlayerNisStoppedCB()
    print("singlePlayerNisStoppedCB() called: "..singlePlayerNisNumber)

    singlePlayerPreviousMusicRestore()

    bSaveFirstLevel = 0
    if (singlePlayerNisNumber == 1) then
        --get player mothership group?
        --put scouts in custom formation?
        local scoutGroup = "NIS_Scout_Group"
        SobGroup_CreateIfNotExist(scoutGroup)

        Player_GetShipsByFilterInclude(0, scoutGroup, "ShipType", "Kus_Scout")
        local nScouts = SobGroup_Count(scoutGroup)
        print("singlePlayerNisStoppedCB: found "..nScouts.." scouts for custom formation")
        if (SobGroup_Count(scoutGroup) > 0) then
            singlePlayerShipsSortZ(scoutGroup)
            --singlePlayerShipFormationDump(scoutGroup)
            SobGroup_FormStrikeGroup(scoutGroup, "M01NIS01ScoutCustom") --formations loaded from data:Scripts/Strike Groups/*.lua
            --SobGroup_FormSquadron(scoutGroup, "M01NIS01ScoutCustom")
            SobGroup_AvoidanceIgnore(scoutGroup, scoutGroup)
        end

        KAS_MusicPlayType( "data:sound/music/battle/A01_mission1and16", MUS_Ambient )
        --tell scouts not to avoid the resource collector next to them
--      local resColGroup = "NIS_ResCol_Group"
--      SobGroup_CreateIfNotExist(resColGroup)
--      Player_GetShipsByFilterInclude(0, resColGroup, "ShipType", "Kus_ResourceCollector")
--
--      if (SobGroup_Count(resColGroup) > 0) then
--          SobGroup_AvoidanceIgnore(scoutGroup, resColGroup)
--      end

        bSaveFirstLevel = 1
        G_Nis1Complete = 1
    elseif (singlePlayerNisNumber == 2) then
        G_Nis2Complete = 1
        --end of M02 NIS: move the shipwreck over to player 3 (CPU ally with special name)
        SobGroup_SwitchOwner("NIS_SobGroupShipwreck", 3)
    elseif (singlePlayerNisNumber == 3) then
        G_Nis3Complete = 1
    elseif (singlePlayerNisNumber == 4) then
        G_Nis4Complete = 1
    elseif (singlePlayerNisNumber == 5) then
        G_Nis5Complete = 1
    elseif (singlePlayerNisNumber == 6) then
        G_Nis6Complete = 1
    elseif (singlePlayerNisNumber == 7) then
        G_Nis7Complete = 1
    elseif (singlePlayerNisNumber == 8) then
        G_Nis8Complete = 1
    elseif (singlePlayerNisNumber == 9) then
        G_Nis9Complete = 1
    elseif (singlePlayerNisNumber == 10) then
        G_Nis10Complete = 1
    elseif (singlePlayerNisNumber == 11) then
        G_Nis11Complete = 1
    elseif (singlePlayerNisNumber == 12) then
        G_Nis12Complete = 1
    end

    --... also needed for the NISlets
    if (singlePlayerNisletNumber == 60) then
        G_Nislet60Complete = 1
    end

    --now set global variable indicating the NIS is complete
    spUnlockout();
    if (bSaveFirstLevel ~= 0) then
        --...save the game
    end

    singlePlayerNISName      = ""
    singlePlayerNisletNumber = -1
    singlePlayerNisNumber    = -1;
end

--
-- Functions to remember and restore the music after an NIS completes
--
spNIS_PreviousMusicTrack = ""
spNIS_PreviousMusicType = -1
function singlePlayerCurrentMusicRemember()
    spNIS_PreviousMusicTrack = Sound_CurrentMusicTrack()
    spNIS_PreviousMusicType = Sound_CurrentMusicType()
end
function singlePlayerPreviousMusicRestore(fadeTime)
    if (spNIS_PreviousMusicTrack ~= "") then
        Sound_MusicPlayType(spNIS_PreviousMusicTrack, spNIS_PreviousMusicType)
    end
end



--
-- This is the actual rule that waits for an NIS to complete, and then unpauses other KAS rules.
-- It will also call the NisStoppedCB() at the end of the NIS
--
function singlePlayer_Rule_WaitNISComplete()
    --see if the NIS is unpaused
    if (singlePlayerNISName ~= "") then
        --there's an NIS that should be playing
        singlePlayerNISHandle = NISGetAnyPlayingHandle()
        if (singlePlayerNISHandle ~= NISHandle_Invalid) then
            if ( NISComplete( singlePlayerNISHandle ) == 1 ) then
                --and it's complete now
                print("singlePlayer_Rule_WaitNISComplete: Unpausing KAS Rules after playback of "..singlePlayerNISName)
                singlePlayerNISHandle = NISHandle_Invalid
                KASRule_Remove("singlePlayerGame", "singlePlayer_Rule_WaitNISComplete", "singlePlayer_Rule_WaitNISComplete")
                KASRules_UnpauseOthers()
                singlePlayerNisStoppedCB()
            end
        else
            print("singlePlayer_Rule_WaitNISComplete: Unpausing KAS Rules: no longer playing "..singlePlayerNISName)
            KASRule_Remove("singlePlayerGame", "singlePlayer_Rule_WaitNISComplete", "singlePlayer_Rule_WaitNISComplete")
            KASRules_UnpauseOthers()
            singlePlayerNisStoppedCB()
        end
    else
        --else no NIS to unpause, kill this rule immediately
        print("singlePlayer_Rule_WaitNISComplete: Unpausing KAS Rules: no NIS ")
        KASRule_Remove("singlePlayerGame", "singlePlayer_Rule_WaitNISComplete", "singlePlayer_Rule_WaitNISComplete")
        KASRules_UnpauseOthers()
        singlePlayerNisStoppedCB()
    end
end

--
--This function will optionally pause KAS during playback of an NIS.
--This is done by pausing all other rules, except for the one this function creates.
--When the NIS ends, it'll unpause the other NISs.
--KAS will be paused during playback of the NISs with a nonzero <Pause SP Game...> column in nisR1Names
--
function singlePlayerGamePauseDuringNIS()

    singlePlayerCurrentMusicRemember()

    --!!! I'd love to refactor this messy bit of indexing, by combining these two arrays together, and using names directly
    if (missionNISNumbers[spGameInfo_currentMission] > 0) then
        if (nisR1Names[missionNISNumbers[spGameInfo_currentMission]][4] ~= 0) then
            --get the handle to current NIS
            print("Pausing KAS Rules during playback of "..singlePlayerNISName)
            --singlePlayerNISHandle = NISGetPlayingHandle(singlePlayerNISName)

            --if (singlePlayerNISHandle ~= NISHandle_Invalid) then

                --create a rule to watch the handle
    	        KASRule_Add("singlePlayerGame", "singlePlayer_Rule_WaitNISComplete",  "singlePlayerGamePauseDuringNIS")

                --pause other rules while watching
                KASRules_PauseExceptRules("singlePlayerGame", "singlePlayer_Rule_WaitNISComplete", "singlePlayer_Rule_WaitNISComplete")
            --end
        end
    else
        --if (nisR1Names[spGameInfo_currentMission]][4] ~= 0) then
            --get the handle to current NIS
            print("Pausing KAS Rules during playback of NISlet "..singlePlayerNISName)
            --singlePlayerNISHandle = NISGetPlayingHandle(singlePlayerNISName)

            --if (singlePlayerNISHandle ~= NISHandle_Invalid) then

                --create a rule to watch the handle
    	        KASRule_Add("singlePlayerGame", "singlePlayer_Rule_WaitNISComplete",  "singlePlayerGamePauseDuringNIS")

                --pause other rules while watching
                KASRules_PauseExceptRules("singlePlayerGame", "singlePlayer_Rule_WaitNISComplete", "singlePlayer_Rule_WaitNISComplete")
            --end
        --end
    end
end


