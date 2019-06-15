
if (Locale_AddDictionary ~= nil) then
    Locale_AddDictionary("locale:LevelData\\Multiplayer\\lib\\research.dat")
end

function research_init()
		local playerIndex = 0		
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								local isAI = Player_GetLevelOfDifficulty(playerIndex)
								Player_RestrictBuildOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_allresearch_build_restrict", ""))
--								Player_RestrictResearchOption(playerIndex, PlayerRace_GetString(playerIndex, "dm_allresearch_research_restrict", ""))						
								research = nil

								dofilepath(PlayerRace_GetString(playerIndex, "path_research", ""))

								for z, iCount in research do
									local grantThis = 1
										
									if (iCount.DoNotGrant ~= nil) then grantThis = 0 end
									if (iCount.AIOnly ~= nil) and (isAI <= 0) then grantThis = 0 end
									if (iCount.HumanOnly ~= nil) and (isAI > 0) then grantThis = 0 end

									if (grantThis == 1) then
										Player_GrantResearchOption(playerIndex,iCount.Name)
									end
										
								end
								Subtitle_Message_Handler("$14760", 2, "data:sound\\sfx\\ui\\frontend\\CHATMESSAGERECEIVED", playerIndex)	--to localize		
						end							
				end
		end
		Rule_Remove("research_init")		
end