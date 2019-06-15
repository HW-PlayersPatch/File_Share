--Tai_FieldGeneratorDummyTumbleFlag = {0,0,0,0,0,0,0,0,0}
Tai_FieldGeneratorDummyTumbleFlag = 0
Tai_FieldGeneratorDummyDockFlag = {0,0,0,0,0,0,0,0}
Tai_FieldGeneratorSegmentIndex = 1
Tai_FieldGeneratorLaunchFlag = {0,0,0,0,0,0,0,0}
Tai_FieldGeneratorDeadFlag = {0,0,0,0,0,0,0,0}

function Create_Tai_FieldGeneratorDummy(CustomGroup, playerIndex, shipID)	
    print("Create_Tai_FieldGeneratorDummy("..shipID..")")

    Tai_FieldGeneratorDummyTumbleFlag = 0
    Tai_FieldGeneratorDummyDockFlag = {0,0,0,0,0,0,0,0}
    Tai_FieldGeneratorSegmentIndex = 1
    Tai_FieldGeneratorLaunchFlag = {0,0,0,0,0,0,0,0}
    Tai_FieldGeneratorDeadFlag = {0,0,0,0,0,0,0,0}
	
    local pos = SobGroup_GetPosition(CustomGroup)
	for i = 1,8,1 do
		Volume_AddSphere("segment"..i,{pos[1],pos[2]+600*i,pos[3],},100)
		SobGroup_CreateIfNotExist("tai_fieldgeneratorsegment"..i)
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "tai_fieldgeneratorsegment"..i, "segment"..i, "tai_fieldgeneratorsegment"..i, "segment"..i)
	end	
end

function Update_Tai_FieldGeneratorDummy(CustomGroup, playerIndex, shipID)
    --Tumble the whole conglomeration, can't tumble it in the Create function as the sobgroup is not populated yet
    if (Tai_FieldGeneratorDummyTumbleFlag == 0) then
        Tai_FieldGeneratorDummyTumbleFlag = 1
        MINING_BASE_ROTATION_SPEED = 0.016
        tumbleVector = {0, 0, MINING_BASE_ROTATION_SPEED}
        SobGroup_Tumble(CustomGroup, tumbleVector)
    end

    --only check one segment per update
    Tai_FieldGeneratorSegmentIndex = Tai_FieldGeneratorSegmentIndex + 1
    if (Tai_FieldGeneratorSegmentIndex > 8) then
        Tai_FieldGeneratorSegmentIndex = 1
    end

    --for Tai_FieldGeneratorSegmentIndex = 1,8,1 do
		SobGroup_CreateIfNotExist("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex)
		SobGroup_FillShipsByType("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex, "Player_Ships"..playerIndex, "tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex)
		SobGroup_ForceStayDockedIfDocking("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex)

		if SobGroup_IsDocked("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex) == 0 then
			if Tai_FieldGeneratorDummyDockFlag[Tai_FieldGeneratorSegmentIndex] == 0 then
				SobGroup_DockSobGroupInstant("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex, CustomGroup) 	
			--elseif Tai_FieldGeneratorDummyTumbleFlag[Tai_FieldGeneratorSegmentIndex] == 1 then				
			--	SobGroup_SetHealth("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex, 0)	
			end
		end

		if SobGroup_Count("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex) > 0 then
            if (SobGroup_HealthPercentage("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex) <= 0.075 and Tai_FieldGeneratorLaunchFlag[Tai_FieldGeneratorSegmentIndex] == 0) then
                Tai_FieldGeneratorLaunchFlag[Tai_FieldGeneratorSegmentIndex] = 1
    			SobGroup_Launch("tai_fieldgeneratorsegment"..Tai_FieldGeneratorSegmentIndex, CustomGroup)			
                print("Update_Tai_FieldGeneratorDummy("..shipID.."): launching segment #"..Tai_FieldGeneratorSegmentIndex)
            end
        elseif Tai_FieldGeneratorDeadFlag[Tai_FieldGeneratorSegmentIndex] == 0 then
            --else fully dead
            Tai_FieldGeneratorDeadFlag[Tai_FieldGeneratorSegmentIndex] = 1
            SobGroup_SetHealth(CustomGroup, SobGroup_HealthPercentage(CustomGroup) - 1/8)	--when a segment is at low health, set the main group at low health (so the level script knows)
            local currentHealth = SobGroup_HealthPercentage(CustomGroup)
            print("Update_Tai_FieldGeneratorDummy("..shipID.."): lost segment #"..Tai_FieldGeneratorSegmentIndex.."... setting health to "..currentHealth)
		end
	--end		

    Tai_FieldGeneratorDummyDockFlag[Tai_FieldGeneratorSegmentIndex] = 1
end

function Destroy_Tai_FieldGeneratorDummy(CustomGroup, playerIndex, shipID)	
    print("Destroy_Tai_FieldGeneratorDummy("..shipID..")")
	for i = 1,8,1 do
		SobGroup_SetHealth("tai_fieldgeneratorsegment"..i, 0)	
		SobGroup_Clear("tai_fieldgeneratorsegment"..i)
	end	
end