function Load_Kus_Carrier(playerIndex)
	SobGroup_Create("kus_carrier"..playerIndex)		
end

function Create_Kus_Carrier(CustomGroup, playerIndex, shipID) 	
	SobGroup_CreateIfNotExist("kus_carrier"..playerIndex)		
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kus_mothership") == 0 then
		if playerIndex == Universe_CurrentPlayer() then
			UI_SetElementVisible("NewResearchMenu", "Platform", 0);
			UI_SetElementVisible("NewResearchMenu", "Utility", 0);
		end	
	end	
end

function Update_Kus_Carrier(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("kus_carrier"..playerIndex)			
	--SobGroup_Clear("kus_carrier"..playerIndex)
	SobGroup_SobGroupAdd("kus_carrier"..playerIndex, CustomGroup)	
end

function Destroy_Kus_Carrier(CustomGroup, playerIndex, shipID)	
	--SobGroup_Clear("kus_carrier"..playerIndex)	
end