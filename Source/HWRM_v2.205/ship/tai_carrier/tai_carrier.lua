function Load_Tai_Carrier(playerIndex)    
	SobGroup_Create("tai_carrier"..playerIndex)		
end

function Create_Tai_Carrier(CustomGroup, playerIndex, shipID) 	
	SobGroup_CreateIfNotExist("tai_carrier"..playerIndex)		
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "tai_mothership") == 0 then
		if playerIndex == Universe_CurrentPlayer() then
			--UI_SetElementSize("NewResearchMenu", "Utility", 0, 0);
			UI_SetElementSize("NewResearchMenu", "Platform", 0, 0);
		end			
	end	
end

function Update_Tai_Carrier(CustomGroup, playerIndex, shipID)	  
	SobGroup_CreateIfNotExist("tai_carrier"..playerIndex)	
	--SobGroup_Clear("tai_carrier"..playerIndex)
	SobGroup_SobGroupAdd("tai_carrier"..playerIndex, CustomGroup)	
	--SP
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter" ) == 1 then			
		SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 1)	
	else
		SobGroup_AbilityActivate(CustomGroup, AB_Hyperspace, 0)	
	end
end

function Destroy_Tai_Carrier(CustomGroup, playerIndex, shipID)	  
	--SobGroup_Clear("tai_carrier"..playerIndex)	
end