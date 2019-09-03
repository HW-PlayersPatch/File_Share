GravityWellGeneratorShipList =
{
  "hgn_scout","hgn_interceptor","hgn_attackbomber",  "hgn_assaultcorvette","hgn_pulsarcorvette","hgn_minelayercorvette",
  "vgr_scout","vgr_interceptor","vgr_lancefighter","vgr_bomber",  "vgr_missilecorvette","vgr_lasercorvette","vgr_commandcorvette","vgr_minelayercorvette",
  "kus_scout","kus_interceptor","kus_attackbomber","kus_defender","kus_cloakedfighter",  "kus_lightcorvette","kus_heavycorvette","kus_repaircorvette","kus_multiguncorvette","kus_minelayercorvette",
  "tai_scout","tai_interceptor","tai_attackbomber","tai_defender","tai_defensefighter",  "tai_lightcorvette","tai_heavycorvette","tai_repaircorvette","tai_multiguncorvette","tai_minelayercorvette",--32

  "junk_junkyarddog",
  "tur_fighter","tur_missilecorvette","tur_standardcorvette",
  "kad_swarmer","kad_advancedswarmer",
}

GravityWellGeneratorSalvageList = "kus_salvagecorvette, tai_salvagecorvette"
GravityWellDistance = 3000

function Start_Kus_GravWellGenerator(CustomGroup,playerIndex,shipID)
  FX_StartEvent(CustomGroup, "gravwellon_sfx"..random(1,6))

  SobGroup_CreateIfNotExist("GravWell_"..shipID)
  SobGroup_CreateIfNotExist("GravWell_Affected"..shipID)

  SobGroup_CreateIfNotExist("GravWell_Temp0"); SobGroup_CreateIfNotExist("GravWell_Temp1")
  SobGroup_CreateIfNotExist("GravWell_Temp2"); SobGroup_CreateIfNotExist("GravWell_Temp3")
end

function Do_Kus_GravWellGenerator(CustomGroup,playerIndex,shipID)
  local listCount = getn(GravityWellGeneratorShipList)
  local tumbleRange = 100

  for i = 0, Universe_PlayerCount()- 1 do
    if (Player_IsAlive(i)== 1) then
      for x = 1, listCount do
        SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships"..i, GravityWellGeneratorShipList[x])

        if (SobGroup_AreAnyOfTheseTypes("GravWell_Temp0", GravityWellGeneratorSalvageList)== 1) then
          if (AreAllied(playerIndex, SobGroup_OwnedBy("GravWell_Temp0"))== 0) then
            SobGroup_SobGroupAdd("GravWell_"..shipID, "GravWell_Temp0")
          end
        else
          SobGroup_SobGroupAdd("GravWell_"..shipID, "GravWell_Temp0")
        end
      end
    end
  end

  SobGroup_Clear("GravWell_Temp2")
  SobGroup_TakeDamage(CustomGroup, 0.0190)
  SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)

  FX_StartEvent(CustomGroup, "PowerUp")

  if (SobGroup_FillProximitySobGroup("GravWell_Temp0", "GravWell_"..shipID, CustomGroup, GravityWellDistance)== 1) then
    while (tumbleRange < GravityWellDistance) do
      if (SobGroup_FillProximitySobGroup("GravWell_Temp1", "GravWell_Temp0", CustomGroup, tumbleRange)== 1) then
        SobGroup_FillSubstract("GravWell_Temp3", "GravWell_Temp1", "GravWell_Temp2")
        SobGroup_AbilityActivate("GravWell_Temp3", AB_Attack, 0)

        local tSpeed = SobGroup_GetSpeed("GravWell_Temp3")
        local tVector = SobGroup_GetPosition("GravWell_Temp3")

        tSpeed = tSpeed / 2.5

        if (tSpeed < 0.05) then
          tSpeed = 0
        end
        if (Universe_GameTime() > 35) then
          SobGroup_SetSpeed("GravWell_Temp3", tSpeed)
        end
        if (SobGroup_GetActualSpeed("GravWell_Temp3") <= 50) then
          SobGroup_AbilityActivate("GravWell_Temp3", AB_Move, 0)
          FX_StartEvent("GravWell_Temp3", "PowerOff")
        end

        while (tVector[1] > 0.45 or tVector[1] < -0.45 or tVector[2] > 0.45 or tVector[2] < -0.45 or tVector[3] > 0.45 or tVector[3] < -0.45) do
          for i = 1,3 do
            if (tVector[i] > 0.45 or tVector[i] < -0.45) then
              tVector[i]= tVector[i]* 0.25
            end
          end
        end

        SobGroup_Tumble("GravWell_Temp3", tVector)
        SobGroup_SobGroupAdd("GravWell_Temp2", "GravWell_Temp3")
      end

      tumbleRange = tumbleRange + 100
    end
  end

  SobGroup_FillSubstract("GravWell_Temp3", "GravWell_Affected"..shipID, "GravWell_Temp2")

  if (SobGroup_Count("GravWell_Temp3") > 0) then
    SobGroup_SetSpeed("GravWell_Temp3", 1)

    SobGroup_AbilityActivate("GravWell_Temp3", AB_Targeting, 1)
    SobGroup_AbilityActivate("GravWell_Temp3", AB_Attack, 1)
    SobGroup_AbilityActivate("GravWell_Temp3", AB_Move, 1)

    SobGroup_ClearTumble("GravWell_Temp3")
  end

  SobGroup_Copy("GravWell_Affected"..shipID, "GravWell_Temp2")
end

function Finish_Kus_GravWellGenerator(CustomGroup,playerIndex,shipID)
  FX_StartEvent(CustomGroup, "gravwellcollapse_sfx"..random(1,3))

  SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 1)

  SobGroup_SetSpeed("GravWell_Affected"..shipID, 1)
  SobGroup_AbilityActivate("GravWell_Affected"..shipID, AB_Targeting, 1)
  SobGroup_AbilityActivate("GravWell_Affected"..shipID, AB_Attack, 1)
  SobGroup_AbilityActivate("GravWell_Affected"..shipID, AB_Move, 1)
  SobGroup_ClearTumble("GravWell_Affected"..shipID)

  SobGroup_Clear("GravWell_Affected"..shipID)
  SobGroup_Clear("GravWell_"..shipID)
end


function Create_Kus_GravWellGenerator(CustomGroup,playerIndex,shipID)
  SobGroup_CreateIfNotExist("GravWell_"..shipID)
  SobGroup_CreateIfNotExist("GravWell_Affected"..shipID)
  SobGroup_CreateIfNotExist("GravWell_Temp0")
  SobGroup_CreateIfNotExist("GravWell_Temp1")
end

function Update_Kus_GravWellGenerator(CustomGroup,playerIndex,shipID)
  NoSalvageScuttle(CustomGroup, playerIndex, shipID)

  if (Player_GetLevelOfDifficulty(playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter")== 1) then
    local listCount = getn(GravityWellGeneratorShipList)
    local alliedShips,enemyShips = 0,0

    for i = 0, Universe_PlayerCount()- 1 do
      if (Player_IsAlive(i)== 1) then
        SobGroup_Clear("GravWell_Temp0")

        for x = 1, listCount do
          SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships"..i, GravityWellGeneratorShipList[x])
          SobGroup_SobGroupAdd("GravWell_Temp1", "GravWell_Temp0")
        end

        if (SobGroup_FillProximitySobGroup("GravWell_Temp0", "GravWell_Temp1", CustomGroup, GravityWellDistance)== 1) then
          if (AreAllied(playerIndex, i)== 1) then
            alliedShips = alliedShips + SobGroup_Count("GravWell_Temp0")
          else
            enemyShips = enemyShips + SobGroup_Count("GravWell_Temp0")
          end
        end
      end
    end

    if (enemyShips > 8 and enemyShips > (alliedShips * 2)) then
      SobGroup_CustomCommand(CustomGroup)
    end

    SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships"..playerIndex,  PlayerRace_GetString(playerIndex, "def_type_mothership", ""))

    if (SobGroup_Count("GravWell_Temp0") > 0) then
      SobGroup_ParadeSobGroup(CustomGroup, "GravWell_Temp0", 0)
    else
      SobGroup_FillShipsByType("GravWell_Temp0", "Player_Ships"..playerIndex,  PlayerRace_GetString(playerIndex, "def_type_carrier", ""))

      if (SobGroup_Count("GravWell_Temp0") > 0) then
        SobGroup_ParadeSobGroup(CustomGroup, "GravWell_Temp0", 0)
      end
    end
  end
end

function Destroy_Kus_GravWellGenerator(CustomGroup,playerIndex,shipID)
  SobGroup_SetSpeed("GravWell_Affected"..shipID, 1)
  SobGroup_AbilityActivate("GravWell_Affected"..shipID, AB_Targeting, 1)
  SobGroup_AbilityActivate("GravWell_Affected"..shipID, AB_Attack, 1)
  SobGroup_AbilityActivate("GravWell_Affected"..shipID, AB_Move, 1)
  SobGroup_ClearTumble("GravWell_Affected"..shipID)
  SobGroup_Clear("GravWell_Affected"..shipID)
  SobGroup_Clear("GravWell_"..shipID)
end
