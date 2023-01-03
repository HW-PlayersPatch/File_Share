function Load_Kus_Mothership(playerIndex)	
	SobGroup_Create("kus_mothership"..playerIndex)		
end

function Create_Kus_Mothership(CustomGroup, playerIndex, shipID)  	
	if playerIndex == Universe_CurrentPlayer() then
		--UI_SetElementSize("NewResearchMenu", "Utility", 0, 0);
		UI_SetElementSize("NewResearchMenu", "Platform", 0, 0);
	end		
	SobGroup_CreateIfNotExist("kus_mothership"..playerIndex)		
end

function Update_Kus_Mothership(CustomGroup, playerIndex, shipID)		
	SobGroup_CreateIfNotExist("kus_mothership"..playerIndex)	
	SobGroup_Clear("kus_mothership"..playerIndex)
	SobGroup_SobGroupAdd("kus_mothership"..playerIndex, CustomGroup)	
	--preventing to have 2 research ship
	if SobGroup_IsBuilding("kus_mothership"..playerIndex, "kus_researchship") == 1 then
		SobGroup_RestrictBuildOption("kus_carrier"..playerIndex, "kus_researchship")
	else
		SobGroup_UnRestrictBuildOption("kus_carrier"..playerIndex, "kus_researchship")
	end
	for i = 1,5,1 do
		if SobGroup_IsBuilding("kus_mothership"..playerIndex, "kus_researchship_"..i) == 1 then
			SobGroup_RestrictBuildOption("kus_carrier"..playerIndex, "kus_researchship_"..i)
		else
			SobGroup_UnRestrictBuildOption("kus_carrier"..playerIndex, "kus_researchship_"..i)
		end
	end
	--SP
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter" ) == 0 then		
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 0)
		SobGroup_AbilityActivate(CustomGroup, AB_Dock, 0)				
		--btn hyperspace
		if UI_IsNamedElementVisible("NewTaskbar", "btnHW1SPHyperspace") == 1 then		
			--SobGroup_AbilityActivate("Player_Ships0", AB_Hyperspace, 1)
		else
			SobGroup_AbilityActivate("Player_Ships0", AB_Hyperspace, 0)
		end	
	else
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 1)
		SobGroup_AbilityActivate(CustomGroup, AB_Dock, 1)	
	end
end

function Destroy_Kus_Mothership(CustomGroup, playerIndex, shipID)	
	SobGroup_Clear("kus_mothership"..playerIndex)	
end