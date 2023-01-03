ObjectiveList = {
								{20000,20,20,10,20,0,0,0,0,0,0},
								{20000,20,20,10,20,0,0,0,0,0,0},
								{20000,20,20,10,20,0,0,0,0,0,0},
								{20000,20,20,10,20,0,0,0,0,0,0},
								{20000,20,20,10,20,0,0,0,0,0,0},		
								{20000,20,20,10,20,0,0,0,0,0,0},
								{20000,20,20,10,20,0,0,0,0,0,0},		
								{20000,20,20,10,20,0,0,0,0,0,0},
								}
challenges_timing = 1
startingships = 8

if (Locale_AddDictionary ~= nil) then
    Locale_AddDictionary("locale:LevelData\\Multiplayer\\lib\\challenges.dat")
end

function challenges_updating()
		--if Universe_GameTime() >= 4 and Universe_GameTime() < 10  then
			--...print a test formatted localized string
			--Subtitle_MessageFss("Formatted: At %[1]lwS%% time(z), %[0]lwS gets something.", "5", "Some String", "33")
			--Subtitle_MessageFsf("Formatted: At %[1].1f%% time(z), %[0]llwS gets something.", "5", "Some String", Universe_GameTime())
		--end					
		if Universe_GameTime() <= 20 then
			return	
		end					
		UI_SetElementVisible("ObjectivesList", "ObjectiveStats", 1)
		local secureaccess = {0,0,0,0,0}
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then	
								local playerIndexList = playerIndex + 1							
								for i = 1,5,1 do			
										--Harvest
										if i == 1 and secureaccess[i] == 0 and challenges_timing == 1 then		
												if playerIndex == Universe_CurrentPlayer() then
														UI_SetTextLabelText("ObjectivesList", "Harvest", "Harvest " .. Stats_GatheredRUAsteroid(playerIndex) .. "/" .. ObjectiveList[playerIndexList][i]);
												end
												--set string for audio
												local targetharvest_audio = ObjectiveList[playerIndexList][i]/1000
												if ObjectiveList[playerIndexList][i] > 160000 then
														targetharvest_audio = 0
												end											
												--reset the challenge
												if ObjectiveList[playerIndexList][i] > ObjectiveList[playerIndexList][i+5] then
														if playerIndex == Universe_CurrentPlayer() then																
																local objectiveMessage = Message_FormatFf("$14730", ObjectiveList[playerIndexList][i]);
																objharvest = Objective_Addw(objectiveMessage, OT_Secondary);
																objectiveMessage = Message_FormatFff("$14731", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*0.1)
																Objective_AddDescriptionw(objharvest, objectiveMessage)
																local subtitleMessage = Message_FormatFf("$14713", ObjectiveList[playerIndexList][i])
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_harvestru\\CHALLENGE_HARVESTRU_" .. tostring(targetharvest_audio), playerIndex)																
														end											
														ObjectiveList[playerIndexList][i+5] = ObjectiveList[playerIndexList][i]
												end
												--a player gets the challenge
												if Stats_GatheredRUAsteroid(playerIndex) >= ObjectiveList[playerIndexList][i] then											
														if playerIndex == Universe_CurrentPlayer() then
																Objective_SetState(objharvest, OS_Complete)	
																local subtitleMessage = Message_FormatFff("$14714", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*0.1)																
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_harvestcomplete\\CHALLENGE_HARVESTCOMPLETE_" .. tostring(targetharvest_audio), playerIndex)																
														end
														if playerIndex ~= Universe_CurrentPlayer() then
																Objective_SetState(objharvest, OS_Failed)				
																local playerName = Player_GetName(playerIndex)
																local subtitleMessage = Message_FormatFffw("$14715", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*0.1, playerName)																
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_harvestfailed\\CHALLENGE_HARVESTFAILED_" .. tostring(targetharvest_audio), Universe_CurrentPlayer())																
														end			
														Player_SetRU(playerIndex,Player_GetRU(playerIndex)+ObjectiveList[playerIndexList][i]*0.1)
														Stats_ChallengesRUs[playerIndexList] = Stats_ChallengesRUs[playerIndexList] + ObjectiveList[playerIndexList][i]*0.1		
														for k = 1,8,1 do																																
															ObjectiveList[k][i] = ObjectiveList[playerIndexList][i] * 2																
														end
														secureaccess[i] = 1			
												end	
										--Kill		
										elseif i == 2 and secureaccess[i] == 0 and challenges_timing == 2 then 	
												if playerIndex == Universe_CurrentPlayer() then
														UI_SetTextLabelText("ObjectivesList", "Kill", "Kill " .. Stats_TotalKills(playerIndex) .. "/" .. ObjectiveList[playerIndexList][i]);
												end
												--set string for audio
												local targetkill_audio = ObjectiveList[playerIndexList][i]
												if ObjectiveList[playerIndexList][i] > 160 then
														targetkill_audio = 0
												end				
												--reset the challenge
												if ObjectiveList[playerIndexList][i] > ObjectiveList[playerIndexList][i+5] then
														if playerIndex == Universe_CurrentPlayer() then															
																local objectiveMessage = Message_FormatFf("$14732", ObjectiveList[playerIndexList][i]);
                                objkill = Objective_Addw(objectiveMessage, OT_Secondary);
																objectiveMessage = Message_FormatFff("$14733", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Objective_AddDescriptionw(objkill, objectiveMessage)
																local subtitleMessage = Message_FormatFf("$14716", ObjectiveList[playerIndexList][i])
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_destroyships\\CHALLENGE_DESTROYSHIPS_" .. tostring(targetkill_audio), playerIndex)
														end											
														ObjectiveList[playerIndexList][i+5] = ObjectiveList[playerIndexList][i]
												end
												--a player gets the challenge
												if Stats_TotalKills(playerIndex) >= ObjectiveList[playerIndexList][i] then												
														if playerIndex == Universe_CurrentPlayer() then
																Objective_SetState(objkill, OS_Complete)						
																local subtitleMessage = Message_FormatFff("$14717", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_destroycomplete\\CHALLENGE_DESTROYCOMPLETE_" .. tostring(targetkill_audio), playerIndex)
														end
														if playerIndex ~= Universe_CurrentPlayer() then
																Objective_SetState(objkill, OS_Failed)			
																local playerName = Player_GetName(playerIndex)
                                local subtitleMessage = Message_FormatFffw("$14718", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100, playerName)
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_destroyfailed\\CHALLENGE_DESTROYFAILED_" .. tostring(targetkill_audio), Universe_CurrentPlayer())
														end
														Player_SetRU(playerIndex,Player_GetRU(playerIndex)+ObjectiveList[playerIndexList][i]*100)
														Stats_ChallengesRUs[playerIndexList] = Stats_ChallengesRUs[playerIndexList] + ObjectiveList[playerIndexList][i]*100		
														for k = 1,8,1 do																																
															ObjectiveList[k][i] = ObjectiveList[playerIndexList][i] * 2																
														end
														secureaccess[i] = 1			
												end
										--Build		
										elseif i == 3 and secureaccess[i] == 0 and challenges_timing == 3 then
												if playerIndex == Universe_CurrentPlayer() then
														UI_SetTextLabelText("ObjectivesList", "Build", "Build " .. Stats_TotalShipsBuilt(playerIndex)-8 .. "/" .. ObjectiveList[playerIndexList][i]);
												end
												--set string for audio
												local targetbuild_audio = ObjectiveList[playerIndexList][i]
												if ObjectiveList[playerIndexList][i] > 160 then
														targetbuild_audio = 0
												end			
												--reset the challenge
												if ObjectiveList[playerIndexList][i] > ObjectiveList[playerIndexList][i+5] then
														if playerIndex == Universe_CurrentPlayer() then															
																local objectiveMessage = Message_FormatFf("$14734", ObjectiveList[playerIndexList][i]);
																objbuild = Objective_Addw(objectiveMessage, OT_Secondary);
																objectiveMessage = Message_FormatFff("$14735", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Objective_AddDescriptionw(objbuild, objectiveMessage)
																local subtitleMessage = Message_FormatFf("$14719", ObjectiveList[playerIndexList][i])
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_buildships\\CHALLENGE_BUILDSHIPS_" .. tostring(targetbuild_audio), playerIndex)
														end											
														ObjectiveList[playerIndexList][i+5] = ObjectiveList[playerIndexList][i]
												end
												--a player gets the challenge
												if Stats_TotalShipsBuilt(playerIndex)-startingships >= ObjectiveList[playerIndexList][i] then												
														if playerIndex == Universe_CurrentPlayer() then
																Objective_SetState(objbuild, OS_Complete)						
																local subtitleMessage = Message_FormatFff("$14720", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_buildcomplete\\CHALLENGE_BUILDCOMPLETE_" .. tostring(targetbuild_audio), playerIndex)
														end
														if playerIndex ~= Universe_CurrentPlayer() then
																Objective_SetState(objbuild, OS_Failed)			
																local playerName = Player_GetName(playerIndex)
																local subtitleMessage = Message_FormatFffw("$14721", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100, playerName)
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_buildfailed\\CHALLENGE_BUILDFAILED_" .. tostring(targetbuild_audio), Universe_CurrentPlayer())
														end			
														Player_SetRU(playerIndex,Player_GetRU(playerIndex)+ObjectiveList[playerIndexList][i]*100)
														Stats_ChallengesRUs[playerIndexList] = Stats_ChallengesRUs[playerIndexList] + ObjectiveList[playerIndexList][i]*100		
														for k = 1,8,1 do																																
															ObjectiveList[k][i] = ObjectiveList[playerIndexList][i] * 2																
														end
														secureaccess[i] = 1					
												end
										--Research		
										elseif i == 4 and secureaccess[i] == 0 and challenges_timing == 4 and research == 1 then
												local ResearchCount = 0
												if Player_GetLevelOfDifficulty(playerIndex) == 0 then	
													ResearchCount = Stats_ResearchCount(playerIndex) 	
												else
													ResearchCount = Stats_ResearchCount(playerIndex)-PlayerRace_GetNumber(playerIndex, "dm_challenge_research_baseline", 0)
												end											
												if playerIndex == Universe_CurrentPlayer() then
														UI_SetTextLabelText("ObjectivesList", "Research", "Research " .. ResearchCount .. "/" .. ObjectiveList[playerIndexList][i]);
												end
												--set string for audio
												local targetresearch_audio = ObjectiveList[playerIndexList][i]												
												--reset the challenge
												if ObjectiveList[playerIndexList][i] > ObjectiveList[playerIndexList][i+5] then
														if playerIndex == Universe_CurrentPlayer() then															
																local objectiveMessage = Message_FormatFf("$14736", ObjectiveList[playerIndexList][i]);
																objresearch = Objective_Addw(objectiveMessage, OT_Secondary)
																objectiveMessage = Message_FormatFff("$14737", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Objective_AddDescriptionw(objresearch, objectiveMessage)
																local subtitleMessage = Message_FormatFf("$14722", ObjectiveList[playerIndexList][i])
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_researchtech\\CHALLENGE_RESEARCHTECH_" .. tostring(targetresearch_audio), playerIndex)
														end											
														ObjectiveList[playerIndexList][i+5] = ObjectiveList[playerIndexList][i]
												end
												--a player gets the challenge
												if ResearchCount >= ObjectiveList[playerIndexList][i] then												
														if playerIndex == Universe_CurrentPlayer() then
																Objective_SetState(objresearch, OS_Complete)						
																local subtitleMessage = Message_FormatFff("$14723", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_researchcomplete\\CHALLENGE_RESEARCHCOMPLETE_" .. tostring(targetresearch_audio), playerIndex)
														end																
														if playerIndex ~= Universe_CurrentPlayer() then
																Objective_SetState(objresearch, OS_Failed)			
																local playerName = Player_GetName(playerIndex)
																local subtitleMessage = Message_FormatFffw("$14724", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100, playerName)
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_researchfailed\\CHALLENGE_RESEARCHFAILED_" .. tostring(targetresearch_audio), Universe_CurrentPlayer())
														end			
														Player_SetRU(playerIndex,Player_GetRU(playerIndex)+ObjectiveList[playerIndexList][i]*100)
														Stats_ChallengesRUs[playerIndexList] = Stats_ChallengesRUs[playerIndexList] + ObjectiveList[playerIndexList][i]*100	
														for k = 1,8,1 do																																
															ObjectiveList[k][i] = ObjectiveList[playerIndexList][i] + 10																
														end
														secureaccess[i] = 1																																
												end	
										--Survive		
										elseif i == 5 and challenges_timing == 5 then 		
												if playerIndex == Universe_CurrentPlayer() then
														UI_SetTextLabelText("ObjectivesList", "Survive", "Survive " .. floor(Universe_GameTime()/60) .. "/" .. ObjectiveList[playerIndexList][i]);
												end
												--set string for audio
												local targetsurvive_audio = 20
												--reset the challenge
												if ObjectiveList[playerIndexList][i] > ObjectiveList[playerIndexList][i+5] then
														if playerIndex == Universe_CurrentPlayer() then															
																local objectiveMessage = Message_FormatFf("$14738", ObjectiveList[playerIndexList][i]);
																objsurvive = Objective_Addw(objectiveMessage, OT_Secondary);
																objectiveMessage = Message_FormatFff("$14739", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Objective_AddDescriptionw(objsurvive, objectiveMessage)
																local subtitleMessage = Message_FormatFf("$14725", ObjectiveList[playerIndexList][i])
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_surviveduration\\CHALLENGE_SURVIVEDURATION_" .. tostring(targetsurvive_audio), playerIndex)
														end											
														ObjectiveList[playerIndexList][i+5] = ObjectiveList[playerIndexList][i]
												end
												--a player gets the challenge
												if floor(Universe_GameTime()/60) - ObjectiveList[playerIndexList][i]	>= 0 then												
														if playerIndex == Universe_CurrentPlayer() then
																Objective_SetState(objsurvive, OS_Complete)					
																local subtitleMessage = Message_FormatFff("$14726", ObjectiveList[playerIndexList][i], ObjectiveList[playerIndexList][i]*100)
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\challenge_survivecomplete\\CHALLENGE_SURVIVECOMPLETE_" .. tostring(targetsurvive_audio), playerIndex)
														end
														Player_SetRU(playerIndex,Player_GetRU(playerIndex)+ObjectiveList[playerIndexList][i]*100)
														Stats_ChallengesRUs[playerIndexList] = Stats_ChallengesRUs[playerIndexList] + ObjectiveList[playerIndexList][i]*100
														ObjectiveList[playerIndexList][i] = ObjectiveList[playerIndexList][i] + 20
												end									
										end											
								end								
						end
				end
		end			
		challenges_timing = challenges_timing + 1
		if challenges_timing > 5 then
				challenges_timing = 1				
		end
		if Universe_GameTime() >= 100 and Universe_GameTime() < 150 then
			Rule_Remove("challenges_updating")			
			Rule_AddInterval("challenges_updating",timer_interval*2/5)	
		end		
end



