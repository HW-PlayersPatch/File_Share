function Load_Tai_Mothership(playerIndex)	
	SobGroup_Create("tai_mothership"..playerIndex)		
end

function Create_Tai_Mothership(CustomGroup, playerIndex, shipID) 		
	SobGroup_CreateIfNotExist("tai_mothership"..playerIndex)		
	if playerIndex == Universe_CurrentPlayer() then
		UI_SetElementVisible("NewResearchMenu", "Platform", 0);
		UI_SetElementVisible("NewResearchMenu", "Utility", 0);
	end		
end

function Update_Tai_Mothership(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("tai_mothership"..playerIndex)
	SobGroup_Clear("tai_mothership"..playerIndex)
	SobGroup_SobGroupAdd("tai_mothership"..playerIndex, CustomGroup)	
	--preventing to have 2 research ship
	if SobGroup_IsBuilding("tai_mothership"..playerIndex, "tai_researchship") == 1 then
		SobGroup_RestrictBuildOption("tai_carrier"..playerIndex, "tai_researchship")
	else
		SobGroup_UnRestrictBuildOption("tai_carrier"..playerIndex, "tai_researchship")
	end
	for i = 1,5,1 do
		if SobGroup_IsBuilding("tai_mothership"..playerIndex, "tai_researchship_"..i) == 1 then
			SobGroup_RestrictBuildOption("tai_carrier"..playerIndex, "tai_researchship_"..i)
		else
			SobGroup_UnRestrictBuildOption("tai_carrier"..playerIndex, "tai_researchship_"..i)
		end
	end
end

function Destroy_Tai_Mothership(CustomGroup, playerIndex, shipID)	
	SobGroup_Clear("tai_mothership"..playerIndex)	
end