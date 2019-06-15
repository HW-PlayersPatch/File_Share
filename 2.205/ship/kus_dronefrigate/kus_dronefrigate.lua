drone_attacking = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 }

function Start_DroneFrigate(CustomGroup, playerIndex, shipID) 
	SobGroup_SetSpeed(CustomGroup, 0.9)
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "dronelaunch_sfx"..r)
end

function Do_DroneFrigate(CustomGroup, playerIndex, shipID)  	
	SobGroup_CreateIfNotExist("dronefrigate_temp")
	SobGroup_CreateIfNotExist("dronefrigate_temp1")
	SobGroup_CreateIfNotExist("dronefrigate_temp2")				
	SobGroup_Clear("dronefrigate_temp2")		
	SobGroup_GetSobGroupBeingCapturedGroup(CustomGroup, "dronefrigate_temp2")		
	for k = 0,13,1 do
		SobGroup_CreateIfNotExist("kus_drone" .. tostring(shipID) .. tostring(k))		
		SobGroup_Clear("dronefrigate_temp")
		SobGroup_Clear("dronefrigate_temp1")
		SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "dronefrigate_temp")
		SobGroup_FillShipsByType("dronefrigate_temp1", "dronefrigate_temp", "kus_drone"..k)
		SobGroup_SobGroupAdd("kus_drone" .. tostring(shipID) .. tostring(k), "dronefrigate_temp1")
		if SobGroup_Count("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 0 and				
			SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceViaGate) == 0 and
			SobGroup_AreAllInRealSpace(CustomGroup) == 1 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 0 and				
			SobGroup_IsDoingAbility(CustomGroup, AB_Retire) == 0 and
			SobGroup_Count("dronefrigate_temp2") == 0 then
			local CreateGroup = SobGroup_CreateShip(CustomGroup, "kus_drone"..k)
			SobGroup_SobGroupAdd("kus_drone" .. tostring(shipID) .. tostring(k), CreateGroup)
			if k == 0 or k == 4 or k == 8 or k == 12 then
				FX_StartEvent(CustomGroup, "dronelaunch1")
			elseif k == 1 or k == 5 or k == 9 or k == 13 then
				FX_StartEvent(CustomGroup, "dronelaunch2")
			elseif k == 2 or k == 6 or k == 10 then	
				FX_StartEvent(CustomGroup, "dronelaunch3")
			elseif k == 3 or k == 7 or k == 11 then	
				FX_StartEvent(CustomGroup, "dronelaunch4")
			end
			break
		else
			--SobGroup_SwitchOwner("kus_drone" .. tostring(shipID) .. tostring(k), playerIndex)
			if SobGroup_IsDockedSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) == 1 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 0 and
			SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceViaGate) == 0 and
			SobGroup_AreAllInRealSpace(CustomGroup) == 1 and
			SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 0 and				
			SobGroup_IsDoingAbility(CustomGroup, AB_Retire) == 0 and
			SobGroup_Count("dronefrigate_temp2") == 0 then
				SobGroup_Launch("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
				if k == 0 or k == 4 or k == 8 or k == 12 then
					FX_StartEvent(CustomGroup, "dronelaunch1")
				elseif k == 1 or k == 5 or k == 9 or k == 13 then
					FX_StartEvent(CustomGroup, "dronelaunch2")
				elseif k == 2 or k == 6 or k == 10 then	
					FX_StartEvent(CustomGroup, "dronelaunch3")
				elseif k == 3 or k == 7 or k == 11 then	
					FX_StartEvent(CustomGroup, "dronelaunch4")
				end
				break
			end				
		end			
	end		
end

function Finish_DroneFrigate(CustomGroup, playerIndex, shipID)	
	SobGroup_SetSpeed(CustomGroup, 1)
	local r = random(1,6)
	FX_StartEvent(CustomGroup, "droneretract_sfx"..r)
	for k = 0,13,1 do
		if SobGroup_Empty("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 then
			SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Targeting, 0)
			SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Attack, 0)
			SobGroup_DockSobGroupAndStayDocked("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
		end	
	end	
end

-----------------------------------------------------------------------------------

function Create_DroneFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_SetSwitchOwnerFlag(CustomGroup, 0)
	SobGroup_CreateIfNotExist("dronefrigate_temp")
	SobGroup_CreateIfNotExist("dronefrigate_temp1")
	SobGroup_CreateIfNotExist("dronefrigate_temp2")
	for k = 0,13,1 do
		SobGroup_CreateIfNotExist("kus_drone" .. tostring(shipID) .. tostring(k))		
	end
end

function Update_DroneFrigate(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("dronefrigate_temp2")
	SobGroup_Clear("dronefrigate_temp2")	
	SobGroup_GetSobGroupBeingCapturedGroup(CustomGroup, "dronefrigate_temp2")
	if Player_GetLevelOfDifficulty(playerIndex) > 0 then
		local playerIndex_ai = 0		
		local enemyships = 0
		while playerIndex_ai < Universe_PlayerCount() do
			if Player_IsAlive(playerIndex_ai) == 1 then								
				local distance = 4000
				if SobGroup_FillProximitySobGroup("dronefrigate_temp1", "Player_Ships"..playerIndex_ai, CustomGroup, distance) == 1 then									
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
	for k = 0,13,1 do
		if SobGroup_Empty("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 then
			if SobGroup_IsDockedSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) == 0 and
			SobGroup_IsDoingAbility("kus_drone" .. tostring(shipID) .. tostring(k), AB_Parade) == 0 and
			SobGroup_IsDoingAbility("kus_drone" .. tostring(shipID) .. tostring(k), AB_Dock) == 0 then
				SobGroup_ParadeSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup, 0)
			end
			if SobGroup_GetDistanceToSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) > 950 then
				SobGroup_TakeDamage("kus_drone" .. tostring(shipID) .. tostring(k), 1)
			elseif SobGroup_GetDistanceToSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) > 275 then
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Targeting, 0)
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Attack, 0)
			else
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Targeting, 1)
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Attack, 1)
				SobGroup_GuardSobGroup ("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) 
			end			
			if SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 1 or
			SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceViaGate) == 1 or
			SobGroup_AreAllInRealSpace(CustomGroup) == 0 or
			SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 1 or			
			SobGroup_IsDoingAbility(CustomGroup, AB_Retire) == 1 or
			SobGroup_Count("dronefrigate_temp2") > 0 or
			SobGroup_OwnedBy("kus_drone" .. tostring(shipID) .. tostring(k)) ~= playerIndex then					
				SobGroup_TakeDamage("kus_drone" .. tostring(shipID) .. tostring(k), 1)
				--SobGroup_DockSobGroupInstant("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
			end
			if SobGroup_IsDoingAbility(CustomGroup, AB_Attack) == 1 then
				if drone_attacking[k] == -1 or drone_attacking[k] == DefensiveROE then
					SobGroup_SetROE("kus_drone" .. tostring(shipID) .. tostring(k), OffensiveROE) 
					drone_attacking[k] = OffensiveROE
				end
			else
			if SobGroup_IsDoingAbility(CustomGroup, AB_Attack) == 0 then
				if drone_attacking[k] == -1 or drone_attacking[k] == OffensiveROE then
					SobGroup_SetROE("kus_drone" .. tostring(shipID) .. tostring(k), DefensiveROE) 
					drone_attacking[k] = DefensiveROE
				end
			end
			end
		end	
	end	
end

function Destroy_DroneFrigate(CustomGroup, playerIndex, shipID)	
	for k = 0,13,1 do
		if SobGroup_Empty("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 then
			SobGroup_TakeDamage("kus_drone" .. tostring(shipID) .. tostring(k), 1)
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