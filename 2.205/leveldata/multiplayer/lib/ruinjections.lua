if (Locale_AddDictionary ~= nil) then
    Locale_AddDictionary("locale:LevelData\\Multiplayer\\lib\\ruinjections.dat")
end

function ruinjections_updating()	
		local playerIndex = 0				
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then								
								Player_SetRU(playerIndex,Player_GetRU(playerIndex)+ruinjections)
								Stats_RUInjectionRUs[playerIndex+1] = Stats_RUInjectionRUs[playerIndex+1] + ruinjections								
								local subtitleMessage = Message_FormatFf("$14705", ruinjections)
								Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\STATUS_RUINJECTION_1", playerIndex)
						end
				end 				
		end				
end


