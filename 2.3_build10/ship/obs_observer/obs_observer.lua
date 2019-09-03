function Create_Obs_Observer(CustomGroup, playerIndex, shipID) 	
	Player_SetRU(playerIndex, 0) -- Set observer starting RU to 0
end

function Update_Obs_Observer(CustomGroup, playerIndex, shipID)	
	if Player_GetLevelOfDifficulty(playerIndex) == 0 then -- Player is a human
		Player_Kill(playerIndex) -- Kill observer, click yes to continue watching to remove fog of war
	end
end