function Update_Tai_CloakGenerator(CustomGroup, playerIndex, shipID)	
	if Player_GetLevelOfDifficulty(playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter" ) == 1 then	
		if SobGroup_Empty("tai_mothership"..playerIndex) == 0 then 	
			SobGroup_ParadeSobGroup(CustomGroup, "tai_mothership"..playerIndex, 0)	
		elseif SobGroup_Empty("tai_carrier"..playerIndex) == 0 then
			SobGroup_ParadeSobGroup(CustomGroup, "tai_carrier"..playerIndex, 0)	
		end					
	end
	
	NoSalvageScuttle(CustomGroup, playerIndex, shipID)
end
