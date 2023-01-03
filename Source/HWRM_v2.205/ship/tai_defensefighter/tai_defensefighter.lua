--
-- Finds and attacks missiles of any player not us.
--
function findAndAttackEnemyMissiles(CustomGroup, playerID, shipID)
    local numberEnemyMissiles = 0
    Selection_Create("AllMissiles")
    if (Selection_GetMissiles("AllMissiles") > 0) then
        --get nearby missiles
        Selection_Create("IncomingMissiles")
        --...should not attack allied missiles either
        if (Selection_FilterExclude("IncomingMissiles", "AllMissiles", "PlayerOwner", ""..playerID, "") > 0) then
            local defensePoint = SobGroup_GetPosition(CustomGroup)
            local defensePointString = defensePoint[1]..","..defensePoint[2]..","..defensePoint[3]
            Selection_Create("IncomingMissiles")
            numberEnemyMissiles = Selection_FilterInclude("IncomingMissiles", "IncomingMissiles", "NearPoint", defensePointString, ""..4500)

            --We only attack enemy missiles when the selection of nearby missiles changes.
            --Rather than compare the list of local missiles, just cache the number of local missiles.
            if (numberEnemyMissiles > 0) then
                --print("updateDefenseFighterAttack: shipID "..shipID.." "..numberEnemyMissiles.." missiles nearby")
                if (defenseFighterMissileTargets[shipID] ~= numberEnemyMissiles) then
                    --print("updateDefenseFighterAttack: shipID "..shipID.." attacking "..numberEnemyMissiles.." missiles")
                    defenseFighterMissileTargets[shipID] = numberEnemyMissiles
                    SobGroup_AttackSelection(playerID, CustomGroup, "IncomingMissiles", 1)
                end
            end
        end

    end
    return numberEnemyMissiles
end

--
-- Update a defense fighter that's guarding someone.
--
function updateDefenseFighterDefense(CustomGroup, playerID, shipID)

    --print("updateDefenseFighterDefense: shipID "..shipID)
    local guardGroup = "defenseFighterGuardTargets"
    local guardGroupPlusMe = "defenseFighterGuardTargetsPlusMe"
    local guardGroupAttackers = "defenseFighterGuardTargetAttackers"
    SobGroup_CreateIfNotExist(guardGroup)
    SobGroup_CreateIfNotExist(guardGroupAttackers)

    Selection_Create("AllMissiles")
    if (Selection_GetMissiles("AllMissiles") > 0) then
        --print("updateDefenseFighterDefense: DETECTED missiles")
        SobGroup_GetCommandTargets(guardGroup, CustomGroup, COMMAND_Guard)
        if (SobGroup_Count(guardGroup) > 0) then

            SobGroup_CreateIfNotExist(guardGroupPlusMe)
            SobGroup_Copy(guardGroupPlusMe, guardGroup)
            SobGroup_SobGroupAdd(guardGroupPlusMe, CustomGroup)

            --print("updateDefenseFighterDefense: we're guarding someone")
            SobGroup_GetAttackers(guardGroupPlusMe, guardGroupAttackers)
            if (SobGroup_Count(guardGroupAttackers) > 0) then
                local enemyPlayerID = SobGroup_GetPlayerOwner(guardGroupAttackers);
                --print("updateDefenseFighterDefense: player "..enemyPlayerID.." is attacking")
                --
                --somebody's attacking our guard target: find their missiles and kill them
                --
                Selection_Create("IncomingMissiles")
                if (Selection_FilterInclude("IncomingMissiles", "AllMissiles", "PlayerOwner", ""..enemyPlayerID, "") > 0) then
                    --print("updateDefenseFighterDefense: attacking INCOMING missiles.")
                    -- Save the current guard targets for later use
                    SobGroup_CreateIfNotExist("DefenseFighterGuardTargets"..shipID)
                    SobGroup_Copy("DefenseFighterGuardTargets"..shipID, guardGroup)
                    SobGroup_AttackSelection(playerID, CustomGroup, "IncomingMissiles", 1)
                end
            else
                --
                -- nobody attacking: see if there are missiles or mines in the area
                --
                local numberEnemyMissiles = findAndAttackEnemyMissiles(CustomGroup, playerID, shipID)
                if (numberEnemyMissiles == 0) then
                    --
                    -- no nearby missiles: just defend our defend target
                    --
                    if (SobGroup_Count("DefenseFighterGuardTargets"..shipID) > 0) then
                        SobGroup_GuardSobGroup(CustomGroup, "DefenseFighterGuardTargets"..shipID)
                        SobGroup_Clear("DefenseFighterGuardTargets"..shipID)
                    end
                end
            end

        end

    end

end

--
-- Defense fighter attack logic.
-- If attacking ships, find neadby missiles.  If missiles changed, attack them.
-- If no missiles, try to go to guarding those who aree being attacked.
--
defenseFighterMissileTargets = {}
function updateDefenseFighterAttack(CustomGroup, playerID, shipID)

    --print("updateDefenseFighterAttack: shipID "..shipID)

    --get attack targets
    local attackGroup = "defenseFighterAttackTargets"
    SobGroup_CreateIfNotExist(attackGroup)
    SobGroup_GetCommandTargets(attackGroup, CustomGroup, COMMAND_Attack)
    if (SobGroup_Count(attackGroup) == 0) then
        --print("updateDefenseFighterAttack: shipID "..shipID.." attacking nobody.  Maybe attacking missiles?")
        return
    end

    local numberEnemyMissiles = findAndAttackEnemyMissiles(CustomGroup, playerID, shipID)

    if (numberEnemyMissiles == 0) then
        --else no local missiles.  Go back to guarding whoever the attack targets are guarding
        --get their attack targets, save as potential guard target
        local guardGroup = "defenseFighterGuardTargets"
        SobGroup_CreateIfNotExist(guardGroup)
        SobGroup_GetAttackers(attackGroup, guardGroup)
        --...only player/allied ships

        if (SobGroup_Count(guardGroup) > 0) then
            --print("updateDefenseFighterAttack: shipID "..shipID.." no missiles - guarding nearby attackees")
            SobGroup_GuardSobGroup(CustomGroup, guardGroup)
            SobGroup_Copy("DefenseFighterGuardTargets"..shipID, guardGroup)
        else
            --no missiles incoming
            --print("updateDefenseFighterAttack: shipID "..shipID.." no guard targets - halting")
            SobGroup_Stop(playerID, CustomGroup)
            --...try to find someone to guard
        end

    end

end

function updateDefenseFighter(CustomGroup, playerID, shipID)

    --print("updateDefenseFighter: shipID "..shipID)

    if (SobGroup_GetCurrentOrder(CustomGroup) == COMMAND_Guard) then
        updateDefenseFighterDefense(CustomGroup, playerID, shipID)
    elseif (SobGroup_GetCurrentOrder(CustomGroup) == COMMAND_Attack) then
        updateDefenseFighterAttack(CustomGroup, playerID, shipID)
    end

end



