
function nocruisers_init()
		local playerIndex = 0		
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								Player_RestrictBuildOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_nocruisers_build_restrict", ""))
								Player_RestrictResearchOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_nocruisers_research_restrict", ""))	
						end
				end
		end	
		Rule_Remove("nocruisers_init")		
end