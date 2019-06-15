Kus_ResearchShipSpinTime = {-60,-60,-60,-60,-60,-60,-60,-60}  --SpinAnimation
Kus_ResearchShipEngine = {0,0,0,0,0,0,0,0}  --EngineGlow
Kus_ResearchShipBuildingBlocker = {
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

function Load_Kus_ResearchShip(playerIndex)
	Player_RestrictBuildOption(playerIndex, "kus_researchship_1,kus_researchship_2,kus_researchship_3,kus_researchship_4,kus_researchship_5")
end

function Create_Kus_ResearchShip(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("researchship_temp")
	--Owner[playerIndex+1] = playerIndex
end

function Update_Kus_ResearchShip(CustomGroup, playerIndex, shipID)
	--if SobGroup_OwnedBy(CustomGroup) ~= Owner[playerIndex+1] then
		--SobGroup_SwitchOwner(CustomGroup, Owner[playerIndex+1])
	--end
	if Player_GetLevelOfDifficulty(playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter" ) == 1 then
		if SobGroup_Empty("kus_mothership"..playerIndex) == 0 then
			SobGroup_ParadeSobGroup(CustomGroup, "kus_mothership"..playerIndex, 0)
		elseif SobGroup_Empty("kus_carrier"..playerIndex) == 0 then
			SobGroup_ParadeSobGroup(CustomGroup, "kus_carrier"..playerIndex, 0)
		end
	end
	Restrict_Kus_Ship(playerIndex, "kus_researchship", 1)
	for i = 1,5,1 do
		SobGroup_Create("kus_researchship_" .. tostring(i) .. tostring(playerIndex))
		SobGroup_FillShipsByType("researchship_temp", "Player_Ships"..playerIndex, "kus_researchship_"..i)
		SobGroup_SobGroupAdd("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "researchship_temp")
	end
	SobGroup_SetHardPointHealth(CustomGroup, "Research Module", 0.5)
	local numberofdockedresearchships = 0
	for i = 1,5,1 do
		if SobGroup_Empty("kus_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then
			if SobGroup_AreAnyOfTheseTypes("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "kus_researchship_"..i) == 1 then
				SobGroup_SetHardPointHealth("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "Research Module", 0.5)
				if SobGroup_IsDocked("kus_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then
          if (Kus_ResearchShipBuildingBlocker[playerIndex+1][6+i]== 1) then
            SobGroup_AutoEngineGlow("kus_researchship_" .. tostring(i) .. tostring(playerIndex))  --EngineGlow
          end
					SobGroup_DockSobGroupAndStayDocked("kus_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup)
					Kus_ResearchShipBuildingBlocker[playerIndex+1][6+i] = 0
				else
					numberofdockedresearchships = numberofdockedresearchships + 1
					Increase_Kus_HPHealth(CustomGroup,"Research Module",0.1)
					Increase_Kus_HPHealth("kus_researchship_" .. tostring(i) .. tostring(playerIndex),"Research Module",0.1)
				end
				if SobGroup_Kus_GetDistanceToSobGroup("kus_researchship_" .. tostring(i) .. tostring(playerIndex), CustomGroup) < 125 and
					 SobGroup_IsDoingAbility("kus_researchship_" .. tostring(i) .. tostring(playerIndex), AB_Dock) == 1 and
					 SobGroup_IsDocked("kus_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then
					FX_StartEvent("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "Docking")
				end
				if SobGroup_IsDocked("kus_researchship_" .. tostring(i) .. tostring(playerIndex)) == 1 and
					 Kus_ResearchShipBuildingBlocker[playerIndex+1][6+i] == 0 then
					FX_StartEvent("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "Docked")
          SobGroup_ManualEngineGlow("kus_researchship_" .. tostring(i) .. tostring(playerIndex), 0)  --EngineGlow
					Kus_ResearchShipBuildingBlocker[playerIndex+1][6+i] = 1
				end
			end
		end
	end
	if numberofdockedresearchships <= 5 then
		SobGroup_SetSpeed(CustomGroup, 1-numberofdockedresearchships/10)
	end

--EngineGlow [BEG]
  if (Kus_ResearchShipEngine[playerIndex + 1]== 0) then
    Kus_ResearchShipEngine[playerIndex + 1]= 1
    SobGroup_ManualEngineGlow(CustomGroup, 0)
  end
  if (numberofdockedresearchships < 5 and Kus_ResearchShipEngine[playerIndex + 1]== 1) then
    Kus_ResearchShipEngine[playerIndex + 1]= 0
    SobGroup_AutoEngineGlow(CustomGroup)
  end
--EngineGlow [END]
--SpinAnimation [BEG]
  if (numberofdockedresearchships == 5) then
    local game_time = Universe_GameTime()

    if (Kus_ResearchShipSpinTime[playerIndex + 1]+ 60 < game_time) then
      Kus_ResearchShipSpinTime[playerIndex + 1]= game_time
      SobGroup_SetMadState(CustomGroup, "NIS00")

      for i = 1,5 do
        SobGroup_SetMadState("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "NIS00")
      end
    end
  end
--SpinAnimation [END]

	for i = 1,5,1 do
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kus_researchship_"..i) > 0 then
			Restrict_Kus_Ship(playerIndex,"kus_researchship_"..i, i+1)
			if i == 5 then
				UnRestrict_Kus_Ship(playerIndex, "kus_researchship", 1)
			end
		else
			UnRestrict_Kus_Ship(playerIndex, "kus_researchship_" .. tostring(i), i+1)
			for k = i+1,5,1 do
				Restrict_Kus_Ship(playerIndex, "kus_researchship_"..k, k+1)
			end
			break
		end
	end
end

function Destroy_Kus_ResearchShip(CustomGroup, playerIndex, shipID)
	UnRestrict_Kus_Ship(playerIndex, "kus_researchship", 1)
	for i = 1,5,1 do
		if SobGroup_Empty("kus_researchship_" .. tostring(i) .. tostring(playerIndex)) == 0 then
			if SobGroup_AreAnyOfTheseTypes("kus_researchship_" .. tostring(i) .. tostring(playerIndex), "kus_researchship_"..i) == 1 then
				SobGroup_TakeDamage("kus_researchship_" .. tostring(i) .. tostring(playerIndex), 1)
			end
		end
		Restrict_Kus_Ship(playerIndex, "kus_researchship_"..i, i+1)
	end
	if Player_GetLevelOfDifficulty(playerIndex) == 0 then
		dofilepath([[data:scripts/Races/Kushan/Scripts/Research/AI_Properties.LUA]])
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

function Restrict_Kus_Ship(player,ship,index)
	if Kus_ResearchShipBuildingBlocker[player+1][index] == 0 then
		Player_RestrictBuildOption(player, ship)
		Kus_ResearchShipBuildingBlocker[player+1][index] = 1
	end
end

function UnRestrict_Kus_Ship(player,ship,index)
	if Kus_ResearchShipBuildingBlocker[player+1][index] == 1 then
		Player_UnrestrictBuildOption(player, ship)
		Kus_ResearchShipBuildingBlocker[player+1][index] = 0
	end
end

function Increase_Kus_HPHealth(ship,hp,value)
	local hphealth = SobGroup_GetHardPointHealth(ship,hp)
	if hphealth <= 1-value then
		SobGroup_SetHardPointHealth(ship,hp,hphealth+value)
	end
end

function SobGroup_Kus_GetDistanceToSobGroup(sg_Group1, sg_Group2)
	if SobGroup_Empty(sg_Group1) == 0 and SobGroup_Empty(sg_Group2) == 0 then
		local t_position1 = SobGroup_GetPosition(sg_Group1)
		local t_position2 = SobGroup_GetPosition(sg_Group2)
		local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
		return li_distance
	else
		return nil
	end
end
