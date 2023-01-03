function start_dronefrigate(CustomGroup, playerIndex, shipID) 
end

function do_dronefrigate(CustomGroup, playerIndex, shipID)  
	for k = 0,13,1 do
		SobGroup_Create("kus_drone" .. tostring(shipID) .. tostring(k))
		SobGroup_Clear("temp")
		SobGroup_Clear("temp1")
		SobGroup_GetSobGroupDockedWithGroup(CustomGroup, "temp")
		SobGroup_FillShipsByType("temp1", "temp", "kus_drone"..k)
		SobGroup_SobGroupAdd("kus_drone" .. tostring(shipID) .. tostring(k), "temp1")
		if SobGroup_Count("kus_drone" .. tostring(shipID) .. tostring(k)) == 0 then
			SobGroup_CreateShip(CustomGroup, "kus_drone"..k)								
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
			if SobGroup_IsDockedSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) == 1 then
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
			if SobGroup_IsDoingAbility("kus_drone" .. tostring(shipID) .. tostring(k), AB_Parade) == 0 and SobGroup_IsDoingAbility("kus_drone" .. tostring(shipID) .. tostring(k), AB_Dock) == 0 then
				SobGroup_ParadeSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup, 0)
			end
			if SobGroup_GetDistanceToSobGroup("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup) > 275 then
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Targeting, 0)
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Attack, 0)
			else
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Targeting, 1)
				SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Attack, 1)
			end
			if SobGroup_IsDoingAbility(CustomGroup, AB_Hyperspace) == 1 or SobGroup_IsDoingAbility(CustomGroup, AB_HyperspaceViaGate) == 1 or SobGroup_IsDoingAbility(CustomGroup, AB_Dock) == 1 then
				SobGroup_DockSobGroupInstant("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
			end
		end
	end
end

function finish_dronefrigate(CustomGroup, playerIndex, shipID)
	for k = 0,13,1 do
		SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Targeting, 0)
		SobGroup_AbilityActivate("kus_drone" .. tostring(shipID) .. tostring(k), AB_Attack, 0)
		SobGroup_DockSobGroupAndStayDocked("kus_drone" .. tostring(shipID) .. tostring(k), CustomGroup)
	end
end

function create_dronefrigate(CustomGroup, playerIndex, shipID)	
end

function update_dronefrigate(CustomGroup, playerIndex, shipID)	
end

function destroy_dronefrigate(CustomGroup, playerIndex, shipID)	
	for k = 0,13,1 do
		SobGroup_TakeDamage("kus_drone" .. tostring(shipID) .. tostring(k), 1)
	end
end

function SobGroup_GetDistanceToSobGroup(sg_Group1, sg_Group2)
	if SobGroup_Empty(sg_Group1) == 0 and SobGroup_Empty(sg_Group2) == 0 then
		local t_position1 = SobGroup_GetPosition(sg_Group1)
		local t_position2 = SobGroup_GetPosition(sg_Group2)
		local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
		return li_distance
	else
		return nil
	end
end