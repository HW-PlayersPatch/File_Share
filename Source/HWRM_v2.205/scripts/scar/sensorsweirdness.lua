--
-- SensorsWeirdness.lua
-- An emulation of HW1's sensors weirdness in M07, M08 (Gardens of Kadesh)
--


--
-- Rule function that is called once every WEIRDNESS_INTERVAL seconds to update sensors weirdness
-- This is ported somewhat directly from smSensorWeirdnessDraw
--
KASWeird_Redraw      = 0
KASWeird_Num_points  = 0
smWeird = {}
NUM_WEIRD_POINTS     = 600
MAX_REPLACEMENTS     = 5
WEIRDUNIVERSESTRETCH = 5/4
smwPingTemplates = {"objective", "hyperspaceIn", "hyperspaceOut", "newShip", "anomaly", "battle", "damage", "circleandarrows"}
smwDotPingTemplates = {"newShip", "objective", "battle", "damage", "damage", "damage", "damage"}
function KAS_WeirdnessUpdate(name)
    if (KASWeird_Redraw <= 0) then
        KASWeird_Num_points = RandomRange(0, KAS_WeirdnessLevel / 3)
        KASWeird_Num_points = KASWeird_Num_points + (2 * KAS_WeirdnessLevel / 3)
        KASWeird_Redraw     = RandomRange(20, 30)
    else
        KASWeird_Redraw = KASWeird_Redraw - 1
    end

    local num_replaces = RandomIntMax(MAX_REPLACEMENTS)
    local iReplace = 0
    while (iReplace < num_replaces) do
        --choose a random point
        local j = RandomIntMax(KAS_WeirdnessLevel)

        if (smWeird[j] == nil) then
            smWeird[j] = {}
        end

        --generate a random location for it
        smWeird[j]["location"] = smwGenerateRandomPoint()
        smWeird[j]["color"]    = smwGenerateRandomColor()
        smWeird[j]["fade"]     = 0.0
        smwGeneratePing(smWeird[j]["location"])

        if (smWeird[j]["dotPingID"] ~= nil) then
            Ping_Remove(smWeird[j]["dotPingID"])
            smWeird[j]["dotPingID"] = nil
        end
        local dotPingTemplateName = smwDotPingTemplates[1 + RandomIntMax(7)]
        smWeird[j]["dotPingID"] = Ping_AddVector("dotPing", dotPingTemplateName, smWeird[j]["location"])
        iReplace = iReplace + 1
    end
end

--
-- Generate a point mostly (but possibly somewhat outside) the world bounds.
--
function smwGenerateRandomPoint()
    local vec = {}

    local worldBounds = Universe_GetWorldBounds()       --[x] x,z are half-axes and y is half-height of oval cylindrical volume to limit movement
    vec[1] = RandomRange(-worldBounds[1] * WEIRDUNIVERSESTRETCH, worldBounds[1]*WEIRDUNIVERSESTRETCH)
    vec[2] = RandomRange(-worldBounds[2] * WEIRDUNIVERSESTRETCH, worldBounds[2]*WEIRDUNIVERSESTRETCH)
    vec[3] = RandomRange(-worldBounds[3] * WEIRDUNIVERSESTRETCH, worldBounds[3]*WEIRDUNIVERSESTRETCH)

    return vec
end

--
-- Generates a random color for the point from a few presets
--
function smwGenerateRandomColor()
    local  col = {0,0,0}
    local colornum = RandomIntMax(7)

    if (colornum >= 3) then
        col = {217,0,0}
    else
        col = {157,118,91}
    end

    return col
end

--
-- possibly creates a ping at some point
--
smwPingIDs = {}
smwChanceOfPing = 120
smwPingCount = 12
function smwGeneratePing(location)
    --char name[20] = "0";

    --very small chance of a new ping
    if (RandomIntMax(smwChanceOfPing) <= 1) then
        local pingcnt = RandomIntMax(smwPingCount)
        local locName =  "$60544"
        local name =  "Weirdness"..pingcnt

        --pingAnomalyPingRemove(name);
        if (smwPingIDs[name] ~= nil) then
            Ping_Remove(smwPingIDs[name])
        end

        --pingAnomalyPositionPingAdd(name, &location);
        local iTemplate = 1 + RandomIntMax(8)
        local templateName = smwPingTemplates[iTemplate]
        smwPingIDs[name] = Ping_AddVector(locName, templateName, location)
    end
end


