-- Currently configured for 1 call per second. Heals when it hasn't been damaged in the last 12 seconds.

-- variables here are stored globally and are accessable via this script regardless of invokation time
-- as such we need a persistant dictionary to identify which CF info we want to work with
combat_ticks_length = 12
global_cloakedfighters = {}

-- init a new entry
function log_new_cf(shipID)
    local new_cf = {
        combat_ticks_queue = {},
        current_HP = nil,
        last_checked_HP = nil
    }
    for i = 1, combat_ticks_length do
        new_cf.combat_ticks_queue[i] = 0
    end
    global_cloakedfighters[shipID] = new_cf
    return new_cf
end

-- get if exists, otherwise create new and return
function fetch_info(shipID)
    if global_cloakedfighters[shipID] == nil then
        return log_new_cf(shipID)
    else
        return global_cloakedfighters[shipID]
    end
end

-- main loop
-- We store the unit's combat status as the last entry of an N-length queue,
-- and every update (every r seconds), this value is moved down the queue.
-- If the entire queue contains a non-combat status (0), the ship will begin regerating
-- at an accelerated pace.
-- The time taken for a unit to begin regenerating is therefore N * r.
-- 
-- This is done to ensure granularity - consider the case where we check a descrete time-block
-- for combat. If we check every 5 seconds, then a unit which took damage 4.9 seconds ago
-- and a unit which took damage 0.1 seconds ago will both fail that check and must wait
-- an additional 5 seconds, resulting in an unfair wait time
-- To mitigate this, we could reduce the timeframe. However this obviously has a huge drawback in
-- that there is no way to control a reasonable time after taking damage in which to start healing.
--
-- However we can combine the granularity of the rapid-checking and the controllable nature of
-- long-checking by rapidly checking into a queue (granularity), but requiring a totally clean
-- queue for regeneration to kick in (controllability).
function Update_Kus_CloakedFighter(CustomGroup, playerIndex, shipID)

    local this_cf = fetch_info(shipID)

    this_cf.current_HP = SobGroup_HealthPercentage(CustomGroup)
    for i = 1, combat_ticks_length - 1 do
        this_cf.combat_ticks_queue[i] = this_cf.combat_ticks_queue[i + 1]
    end
    
    if this_cf.last_checked_HP ~= nil then
        if this_cf.current_HP < this_cf.last_checked_HP then
            this_cf.combat_ticks_queue[combat_ticks_length] = 1
        else
            this_cf.combat_ticks_queue[combat_ticks_length] = 0
        end

        local regen_enabled = 1
        for i = 1, combat_ticks_length do
            if this_cf.combat_ticks_queue[i] == 1 then -- in combat within window
                regen_enabled = 0
            end
        end
        if this_cf.current_HP == 1 then -- fully healed
            regen_enabled = 0
        end

        if regen_enabled == 1 then
            SobGroup_SetHealth(CustomGroup, this_cf.current_HP + 0.008)
        end
    end

    this_cf.last_checked_HP = SobGroup_HealthPercentage(CustomGroup)
end

function Destroy_Kus_CloakedFighter(CustomGroup, playerIndex, shipID)
    global_cloakedfighters[shipID] = nil
end