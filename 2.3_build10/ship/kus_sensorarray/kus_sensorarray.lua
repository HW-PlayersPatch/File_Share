function Update_Kus_SensorArray(CustomGroup, playerIndex, shipID)	
	if Player_GetLevelOfDifficulty(playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter" ) == 1 then	
		if SobGroup_Empty("kus_mothership"..playerIndex) == 0 then 	
			SobGroup_ParadeSobGroup(CustomGroup, "kus_mothership"..playerIndex, 0)	
		elseif SobGroup_Empty("kus_carrier"..playerIndex) == 0 then
			SobGroup_ParadeSobGroup(CustomGroup, "kus_carrier"..playerIndex, 0)	
		end		
	end	
	
	NoSalvageScuttle(CustomGroup, playerIndex, shipID)
end
