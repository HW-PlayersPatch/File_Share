function carriersonly_init()
		local playerIndex = 0
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								Player_RestrictBuildOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_carriersonly_build_restrict", ""))
								Player_RestrictResearchOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_carriersonly_research_restrict", ""))
								Player_GrantResearchOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_carriersonly_research_grant", ""))
						end
				end
		end	
		Rule_Remove("carriersonly_init")
end