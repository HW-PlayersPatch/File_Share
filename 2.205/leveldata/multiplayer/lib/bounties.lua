if (Locale_AddDictionary ~= nil) then
    Locale_AddDictionary("locale:LevelData\\Multiplayer\\lib\\bounties.dat")
end

Stats_TotalKillsInRUs_Last = {0,0,0,0,0,0,0,0}

function bounties_updating()		
		local playerIndex = 0				
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
							local bounty = floor((Stats_TotalKillsInRUs(playerIndex) - Stats_TotalKillsInRUs_Last[playerIndex+1])*bounties)
							if bounty > 0 then
									Player_SetRU(playerIndex,Player_GetRU(playerIndex)+bounty)
									Stats_BountiesRUs[playerIndex+1] = Stats_BountiesRUs[playerIndex+1] + bounty																		
									local subtitleMessage = Message_FormatFf("$14700", bounty)									
									Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\STATUS_BOUNTY_1", playerIndex)
							end
							Stats_TotalKillsInRUs_Last[playerIndex+1] = Stats_TotalKillsInRUs(playerIndex)
						end	
				end
		end 				
end		
		