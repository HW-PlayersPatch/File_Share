Tai_ResearchShipBuildingBlocker = { 
															{0,1,1,1,1,1,0,0,0,0,0},			
															{0,1,1,1,1,1,0,0,0,0,0},
															{0,1,1,1,1,1,0,0,0,0,0},
															{0,1,1,1,1,1,0,0,0,0,0},
															{0,1,1,1,1,1,0,0,0,0,0},
															{0,1,1,1,1,1,0,0,0,0,0},
															{0,1,1,1,1,1,0,0,0,0,0},
															{0,1,1,1,1,1,0,0,0,0,0},
															}
--Owner = {8,8,8,8,8,8,8,8}
															
function Load_Tai_ResearchShip(playerIndex)
	Player_RestrictBuildOption(playerIndex, "Tai_ResearchShip_1,Tai_ResearchShip_2,Tai_ResearchShip_3,Tai_ResearchShip_4,Tai_ResearchShip_5")
end

function Create_Tai_ResearchShip(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("researchship_temp")
	--Owner[playerIndex+1] = playerIndex
end

function Update_Tai_ResearchShip(CustomGroup, playerIndex, shipID)		
	--if SobGroup_OwnedBy(CustomGroup) ~= Owner[playerIndex+1] then
		--SobGroup_SwitchOwner(CustomGroup, Owner[playerIndex+1])
	--end
	if Player_GetLevelOfDifficulty(playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter" ) == 1 then	
		if SobGroup_Empty("tai_mothership"..playerIndex) == 0 then 	
			SobGroup_ParadeSobGroup(CustomGroup, "tai_mothership"..playerIndex, 0)	
		elseif SobGroup_Empty("tai_carrier"..playerIndex) == 0 then
			SobGroup_ParadeSobGroup(CustomGroup, "tai_carrier"..playerIndex, 0)	
		end			
	end
	Restrict_Tai_Ship(playerIndex, "tai_researchship", 1)
  for i = 1,5,1 do
		SobGroup_Create("tai_researchship_" .. tostring(i) .. tostring(playerIndex))		
		SobGroup_FillShipsByType("researchship_temp", "Player_Ships"..playerIndex, "tai_researchship_"..i)
		SobGroup_SobGroupAdd("tai_researchship_" .. tostring(i) .. tostring(playerIndex), "researchship_temp")
  end
	SobGroup_SetHardPointHealth(CustomGroup, "Research Module", 0.5)    
	local numberofdockedresearchships = 0
	for i = 1,5,1 do		
		if SobGroup_Empty("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then
			if SobGroup_AreAnyOfTheseTypes("tai_researchship_" .. tostring(i) .. tostring(playerIndex), "tai_researchship_"..i) == 1 then
				SobGroup_SetHardPointHealth("tai_researchship_" .. tostring(i) .. tostring(playerIndex), "Research Module", 0.5)
				if SobGroup_IsDocked("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then					
					SobGroup_DockSobGroupAndStayDocked("tai_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup)
					Tai_ResearchShipBuildingBlocker[playerIndex+1][6+i] = 0
				else                                        
					numberofdockedresearchships = numberofdockedresearchships + 1              
					Increase_Tai_HPHealth(CustomGroup,"Research Module",0.1)
					Increase_Tai_HPHealth("tai_researchship_" .. tostring(i) .. tostring(playerIndex),"Research Module",0.1)  
				end
				if SobGroup_Tai_GetDistanceToSobGroup("tai_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup) < 175 and
					 SobGroup_IsDoingAbility("tai_researchship_" .. tostring(i) .. tostring(playerIndex), AB_Dock) == 1 and
					 SobGroup_IsDocked("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then
					FX_StartEvent("tai_researchship_" .. tostring(i) .. tostring(playerIndex), "Docking")
				end
				if SobGroup_IsDocked("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 1 and
					 Tai_ResearchShipBuildingBlocker[playerIndex+1][6+i] == 0 then
					FX_StartEvent("tai_researchship_" .. tostring(i) .. tostring(playerIndex), "Docked")
					Tai_ResearchShipBuildingBlocker[playerIndex+1][6+i] = 1
				end
			end
		end		
	end
	if numberofdockedresearchships <= 5 then 
		SobGroup_SetSpeed(CustomGroup, 1-numberofdockedresearchships/10)
	end	
	for i = 1,5,1 do
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "tai_researchship_"..i) > 0 then
			Restrict_Tai_Ship(playerIndex,"tai_researchship_"..i, i+1)
			if i == 5 then
				UnRestrict_Tai_Ship(playerIndex, "tai_researchship", 1)
			end
		else
			UnRestrict_Tai_Ship(playerIndex, "tai_researchship_"..i, i+1)
			for k = i+1,5,1 do
				Restrict_Tai_Ship(playerIndex, "tai_researchship_"..k, k+1)
			end
			break
		end
	end	
end

function Destroy_Tai_ResearchShip(CustomGroup, playerIndex, shipID)	
	UnRestrict_Tai_Ship(playerIndex, "tai_researchship", 1)
	for i = 1,5,1 do
		if SobGroup_Empty("tai_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then
			if SobGroup_AreAnyOfTheseTypes("tai_researchship_" .. tostring(i) .. tostring(playerIndex), "tai_researchship_"..i) == 1 then
				SobGroup_TakeDamage("tai_researchship_" .. tostring(i) .. tostring(playerIndex), 1)
			end
		end
		Restrict_Tai_Ship(playerIndex, "tai_researchship_"..i, i+1)
	end	
	if Player_GetLevelOfDifficulty(playerIndex) == 0 then								
		dofilepath([[data:scripts/Races/Taiidan/Scripts/Research/AI_Properties.LUA]])									
		for z, iCount in research do
			if iCount.Name == "cpuplayers_defensive" then
				break
			end
			if Player_HasQueuedResearch(playerIndex, iCount.Name) == 1 then			
				Player_CancelResearch(playerIndex, iCount.Name)					     	   
			end
		end		
	end	
end

function Restrict_Tai_Ship(player,ship,index)
	if Tai_ResearchShipBuildingBlocker[player+1][index] == 0 then
		Player_RestrictBuildOption(player, ship)
		Tai_ResearchShipBuildingBlocker[player+1][index] = 1
	end
end

function UnRestrict_Tai_Ship(player,ship,index)
	if Tai_ResearchShipBuildingBlocker[player+1][index] == 1 then
		Player_UnrestrictBuildOption(player, ship)
		Tai_ResearchShipBuildingBlocker[player+1][index] = 0
	end
end

function Increase_Tai_HPHealth(ship,hp,value)
	local hphealth = SobGroup_GetHardPointHealth(ship,hp)
	if hphealth <= 1-value then
		SobGroup_SetHardPointHealth(ship,hp,hphealth+value) 
	end
end

function SobGroup_Tai_GetDistanceToSobGroup(sg_Group1, sg_Group2)
	if SobGroup_Empty(sg_Group1) == 0 and SobGroup_Empty(sg_Group2) == 0 then
		local t_position1 = SobGroup_GetPosition(sg_Group1)
		local t_position2 = SobGroup_GetPosition(sg_Group2)
		local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
		return li_distance
	else
		return nil
	end
end