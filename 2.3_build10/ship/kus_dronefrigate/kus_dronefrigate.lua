KUS_DRONEFRIGATE_DRONE_COUNT = 14
KUS_DRONEFRIGATE_WEAPON_RANGE = 2660

function SobGroup_AnyBeingCaptured(group)
	local group_being_captured = group .. "_being_captured"
	SobGroup_CreateAndClear(group_being_captured)
	SobGroup_GetSobGroupBeingCapturedGroup(group, group_being_captured)
	if (SobGroup_Count(group_being_captured) > 0) then
		return 1
	end
	return 0
end

function SobGroup_AnyAreAttacking(group)
	local group_attacking = group .. "_attacking"
	SobGroup_CreateAndClear(group_attacking)
	SobGroup_GetCommandTargets(group_attacking, group, COMMAND_Attack)
	if (SobGroup_Count(group_attacking) > 0) then
		return 1
	end
	return 0
end

function SobGroup_CreateAndClear(name)
	SobGroup_CreateIfNotExist(name)
	SobGroup_Clear(name)
	return name;
end

function DroneFrigate_IsReady(frigate)
	return (SobGroup_IsDoingAbility(frigate, AB_Hyperspace) == 0 and				
	SobGroup_IsDoingAbility(frigate, AB_HyperspaceViaGate) == 0 and
	SobGroup_AreAllInRealSpace(frigate) == 1 and
	SobGroup_IsDoingAbility(frigate, AB_Dock) == 0 and				
	SobGroup_IsDoingAbility(frigate, AB_Retire) == 0 and
	SobGroup_AnyBeingCaptured(frigate) == 0)
end

function CreateNewDrone(index, drone, frigate, frigate_id)
	SobGroup_CreateIfNotExist(drone)
	if SobGroup_Count(drone) == 0 and -- group for this drone is empty, create the drone and add to group
		DroneFrigate_IsReady(frigate) then
		local new_drone = SobGroup_CreateShip(frigate, "kus_drone" .. index) -- CreateShip simulates a build completion - ship will be launched from parent
		SobGroup_SobGroupAdd(drone, new_drone)
		SobGroup_SobGroupAdd("all_drones" .. frigate_id, drone)
		if index == 0 or index == 4 or index == 8 or index == 12 then
			FX_StartEvent(frigate, "dronelaunch1")
		elseif index == 1 or index == 5 or index == 9 or index == 13 then
			FX_StartEvent(frigate, "dronelaunch2")
		elseif index == 2 or index == 6 or index == 10 then	
			FX_StartEvent(frigate, "dronelaunch3")
		elseif index == 3 or index == 7 or index == 11 then	
			FX_StartEvent(frigate, "dronelaunch4")
		end
	end
end

function Drone_LaunchIfPossible(index, drone, frigate)
	if SobGroup_IsDockedSobGroup(drone, frigate) == 1 then-- drone was docked
		if DroneFrigate_IsReady(frigate) then
			SobGroup_Launch(drone, frigate)
			if index == 0 or index == 4 or index == 8 or index == 12 then
				FX_StartEvent(frigate, "dronelaunch1")
			elseif index == 1 or index == 5 or index == 9 or index == 13 then
				FX_StartEvent(frigate, "dronelaunch2")
			elseif index == 2 or index == 6 or index == 10 then	
				FX_StartEvent(frigate, "dronelaunch3")
			elseif index == 3 or index == 7 or index == 11 then	
				FX_StartEvent(frigate, "dronelaunch4")
			end
			local left_with = "left_overs"
			SobGroup_CreateAndClear(left_with)
			SobGroup_GetSobGroupDockedWithGroup(frigate, left_with)
		end
	end
end

function Drone_SetActive(drone, active)
	SobGroup_AbilityActivate(drone, AB_Attack, active)
	SobGroup_AbilityActivate(drone, AB_Targeting, active)
end

function Start_DroneFrigate(CustomGroup, playerIndex, shipID) 
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "dronelaunch_sfx"..r)

	for k = 0, KUS_DRONEFRIGATE_DRONE_COUNT - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if (SobGroup_Count(this_drone) == 0) then
			CreateNewDrone(k, this_drone, CustomGroup, shipID)
		end
	end
end

function Do_DroneFrigate(CustomGroup, playerIndex, shipID)
	
	local docked_with_frigate_group = "docked_with_" .. shipID
	SobGroup_CreateAndClear(docked_with_frigate_group)
	SobGroup_GetSobGroupDockedWithGroup(CustomGroup, docked_with_frigate_group)
	for k = 0, KUS_DRONEFRIGATE_DRONE_COUNT - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if (SobGroup_Count(this_drone) == 0) then
			CreateNewDrone(k, this_drone, CustomGroup, shipID)
		else
			Drone_LaunchIfPossible(k, this_drone, CustomGroup)
		end
	end		
end

function Finish_DroneFrigate(CustomGroup, playerIndex, shipID)	
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "droneretract_sfx"..r)
	for k = 0, SobGroup_Count("all_drones" .. shipID) - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if SobGroup_Empty(this_drone) == 0 then
			SobGroup_AbilityActivate(this_drone, AB_Targeting, 0)
			SobGroup_AbilityActivate(this_drone, AB_Attack, 0)
			SobGroup_DockSobGroupAndStayDocked(this_drone, CustomGroup)
		end	
	end	
end

-----------------------------------------------------------------------------------

function Create_DroneFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_SetSwitchOwnerFlag(CustomGroup, 0)

	SobGroup_CreateIfNotExist("all_drones" .. shipID)
	SobGroup_CreateIfNotExist("frigate_attack_targets" .. shipID)
	SobGroup_CreateIfNotExist("drone_attack_targets" .. shipID)
end

function Update_DroneFrigate(CustomGroup, playerIndex, shipID)
    NoSalvageScuttle(CustomGroup, playerIndex, shipID)

	-- forces AI cpu drone activation if enemy ships are nearby
	if Player_GetLevelOfDifficulty(playerIndex) > 0 then
		local playerIndex_ai = 0		
		local enemyships = 0
		while playerIndex_ai < Universe_PlayerCount() do
			if Player_IsAlive(playerIndex_ai) == 1 then								
				local distance = 4000
				if SobGroup_FillProximitySobGroup(SobGroup_CreateAndClear("temp_" .. shipID), "Player_Ships"..playerIndex_ai, CustomGroup, distance) == 1 then									
					if AreAllied(playerIndex, playerIndex_ai) == 0 then						
						enemyships = 1
					end					
				end				
			end
			playerIndex_ai = playerIndex_ai + 1
		end
		if enemyships > 0 then
			if SobGroup_IsDoingAbility(CustomGroup, AB_Custom) == 0 then
				SobGroup_CustomCommand(CustomGroup)
			end
		end
	end

	for k = 0, SobGroup_Count("all_drones" .. shipID) - 1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		SobGroup_SetROE(this_drone, SobGroup_GetROE(CustomGroup))
		Drone_SetActive(this_drone, 1)
		if SobGroup_Empty(this_drone) == 0 then
			if 	SobGroup_IsDockedSobGroup(this_drone, CustomGroup) == 0 and
				SobGroup_IsDoingAbility(this_drone, AB_Dock) == 0 then

				if SobGroup_GetDistanceToSobGroup(this_drone, CustomGroup) > 950 then -- too far from frigate, die
					SobGroup_TakeDamage(this_drone, 1)
				end

				if SobGroup_AnyAreAttacking(CustomGroup) == 1 then -- override our target to attack anything the frigate itself is attacking
					local frigate_attack_targets = "frigate_attack_targets" .. shipID
					SobGroup_GetCommandTargets(frigate_attack_targets, CustomGroup, COMMAND_Attack)
					if (SobGroup_GetDistanceToSobGroup(this_drone, frigate_attack_targets) <= KUS_DRONEFRIGATE_WEAPON_RANGE) then
						SobGroup_Attack(playerIndex, this_drone, frigate_attack_targets)
					end
				elseif SobGroup_IsCloaked(CustomGroup) == 1 or SobGroup_GetROE(CustomGroup) == PassiveROE then
					Drone_SetActive(this_drone, 0)
					SobGroup_ParadeSobGroup(this_drone, CustomGroup, 0)
				end

				if (SobGroup_AnyAreAttacking(this_drone) == 1) then -- this check is seperate so the frigate can (uniquely) do move commands while shooting
					if (SobGroup_GetDistanceToSobGroup(this_drone, CustomGroup) > 300) then
						SobGroup_MoveToPoint(SobGroup_GetPlayerOwner(this_drone), this_drone, SobGroup_GetPosition(CustomGroup)) -- move close to frigate
					end
				else
					SobGroup_ParadeSobGroup(this_drone, CustomGroup, 0) -- reform parade around frigate
				end

			end
		end		

		if (SobGroup_OwnedBy(this_drone) ~= playerIndex or not DroneFrigate_IsReady(CustomGroup)) then					
			SobGroup_TakeDamage(this_drone, 1)
			--SobGroup_DockSobGroupInstant("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
		end
	end

end



function Destroy_DroneFrigate(CustomGroup, playerIndex, shipID)	
	for k = 0,SobGroup_Count("all_drones" .. shipID) - 1,1 do
		local this_drone = "kus_drone" .. tostring(shipID) .. tostring(k)
		if SobGroup_Empty(this_drone) == 0 then
			SobGroup_TakeDamage(this_drone, 1)
		end	
	end
end

function SobGroup_GetDistanceToSobGroup(sg_Group1, sg_Group2)
	if SobGroup_Empty(sg_Group1) == 0 and SobGroup_Empty(sg_Group2) == 0 then
		local t_position1 = SobGroup_GetPosition(sg_Group1)
		local t_position2 = SobGroup_GetPosition(sg_Group2)
		local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
		return li_distance
	else
		return 0
	end
end