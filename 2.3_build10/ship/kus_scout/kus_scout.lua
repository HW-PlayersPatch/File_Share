function Start_Kus_Scout(CustomGroup, playerIndex, shipID)  
	SobGroup_SetMaxSpeedMultiplier(CustomGroup, 1.1)		
end

function Do_Kus_Scout(CustomGroup, playerIndex, shipID)		
	if SobGroup_GetActualSpeed(CustomGroup) >= 110 then
		FX_StartEvent(CustomGroup, "SpeedBurst")
	end	
end

function Finish_Kus_Scout(CustomGroup, playerIndex, shipID)	
	SobGroup_SetMaxSpeedMultiplier(CustomGroup, 1)
end