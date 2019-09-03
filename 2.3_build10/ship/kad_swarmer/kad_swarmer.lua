--A table, by shipIP, of fuel tank values
Kad_Swarmer_FuelTanks = {}
Kad_Swarmer_TurnCounter = 0
--Added per a suggested fix by a customer
Kad_Swarmer_Count = 0
Kad_Swarmer_CurrentUnit = 0
--End suggested fix by a customer

function createSwarmerFuel(CustomGroup, playerID, shipID)	
	SobGroup_CreateIfNotExist("swarmerFuelPodGroup")
	SobGroup_CreateIfNotExist("swarmerNearbyFuelPodGroup")
    Kad_Swarmer_FuelTanks[shipID] = 1
--Added per a suggested fix by a customer
    Kad_Swarmer_Count = Kad_Swarmer_Count + 1
--End suggested fix by a customer
end

function updateSwarmerFuel(CustomGroup, playerID, shipID)
    --
    -- A lot of swarmers can cause the game to chug as they're all updated at once.  Spread them out a bit...
    --
    Kad_Swarmer_TurnCounter = Kad_Swarmer_TurnCounter + 1
    if (Kad_Swarmer_TurnCounter > 4) then
    --When TurnLimit is reached update current unit, so we know where we are now 
        Kad_Swarmer_CurrentUnit = Kad_Swarmer_CurrentUnit + 5 
        if Kad_Swarmer_CurrentUnit < Kad_Swarmer_Count then 
        --if we have not processed all swarmers, reset the TurnCounter and continue to run the fuel script 
            Kad_Swarmer_TurnCounter = 0 
        elseif Kad_Swarmer_CurrentUnit > Kad_Swarmer_Count then 
        --We have at least gone through all Units once. Reset values to start next cycle. 
            Kad_Swarmer_CurrentUnit = 0 
            Kad_Swarmer_TurnCounter = 0 
        else 
        --if we have the case that swarmers are an even number and we reached the end, skip one to break the balance. 
            return 
        end 
    else 
    -- if it's not our turn, skip 
        return	
    end

    --
    -- Don't do anything while docked (as in, not yet lauched from mothership)
    --
    if (SobGroup_CountByFilterInclude(CustomGroup, "CurrentCommandState", "DOCKSTATE_Docked") > 0) then
        --print("Swarmer "..shipID.." is docked - nothing to do.")
        return
    end

    SobGroup_FillShipsByType("swarmerFuelPodGroup", "Player_Ships"..playerID, "kad_fuelpod")
    if SobGroup_FillProximitySobGroup("swarmerNearbyFuelPodGroup", "swarmerFuelPodGroup", CustomGroup, 40) == 0 then
        local consume = SobGroup_GetActualSpeed(CustomGroup)/11500000

        Kad_Swarmer_DecreaseFuel(shipID,consume)

        if Kad_Swarmer_FuelTanks[shipID] <= 0.2 then
            if SobGroup_GetActualSpeed(CustomGroup) > 10 then
                FX_StartEvent(CustomGroup, "EngineFailure")
            end
            local speed = Kad_Swarmer_FuelTanks[shipID] * 2
            if speed < 0.35 then
                speed = 0.35
            end	
            SobGroup_SetSpeed(CustomGroup, speed)
            if SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 0 then
								if SobGroup_FillProximitySobGroup("swarmerNearbyFuelPodGroup", "swarmerFuelPodGroup", CustomGroup, 100000) == 1 then										
										if SobGroup_Count("swarmerNearbyFuelPodGroup") > 1 then
												local r = random(0,SobGroup_Count("swarmerNearbyFuelPodGroup")-1)
												SobGroup_CreateIfNotExist("swarmerFuelPodToDock")
												SobGroup_FillShipsByIndexRange("swarmerFuelPodToDock", "swarmerNearbyFuelPodGroup", r, 1)
												SobGroup_DockSobGroup(CustomGroup, "swarmerFuelPodToDock")
										else														
												SobGroup_DockSobGroup(CustomGroup, "swarmerNearbyFuelPodGroup")
										end
								else
									-- SobGroup_SetSpeed(CustomGroup, 0)
									if SobGroup_OwnedBy(CustomGroup) ~= 0 then
									--KAS uses the tactics to control retaliation.  Sometimes it's set to non-retaliatory mode via PassiveROE (2).
										if (SobGroup_GetROE(CustomGroup) ~= 2) then
											SobGroup_AttackPlayer(CustomGroup, 0)	
										end
									end
								end
			elseif ( (SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 1) and (SobGroup_Count("swarmerFuelPodGroup") == 0) ) then
				if SobGroup_OwnedBy(CustomGroup) ~= 0 then
                    --KAS uses the tactics to control retaliation.  Sometimes it's set to non-retaliatory mode via PassiveROE (2).
                    if (SobGroup_GetROE(CustomGroup) ~= 2) then
					    SobGroup_AttackPlayer(CustomGroup, 0)	
                    end
				end
            end
        elseif Kad_Swarmer_FuelTanks[shipID] > 0.2 then
            SobGroup_SetSpeed(CustomGroup, 1)
						if SobGroup_OwnedBy(CustomGroup) ~= 0 then
                            --KAS uses the tactics to control retaliation.  Sometimes it's set to non-retaliatory mode via PassiveROE (2).
                            if (SobGroup_GetROE(CustomGroup) ~= 2) then
							    SobGroup_AttackPlayer(CustomGroup, 0)	
                            end
						end
        end
    else
        Kad_Swarmer_FuelTanks[shipID] = 1
        SobGroup_SetSpeed(CustomGroup, 1)
    end
end

function destroySwarmerFuel(CustomGroup, playerID, shipID)
    Kad_Swarmer_FuelTanks[shipID] = nil
	Kad_Swarmer_Count = Kad_Swarmer_Count - 1
end

--
-- Take some fuel off
--
function Kad_Swarmer_DecreaseFuel(shipID,value)
    if (Kad_Swarmer_FuelTanks[shipID] == nil) then
        Kad_Swarmer_FuelTanks[shipID] = 1
    end

    if Kad_Swarmer_FuelTanks[shipID] >= value then
        Kad_Swarmer_FuelTanks[shipID] = Kad_Swarmer_FuelTanks[shipID] - value
    end
end

