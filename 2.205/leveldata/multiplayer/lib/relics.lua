function relics_init()		
	Preload_Ship("Meg_Relic_RUGenerator")			
end

Relic_PrevPos = {
								{0,0,0},
								{0,0,0},
								{0,0,0},								
								}								
relics_counter = {0,0,0}
relics_reset = {0,0,0}
relics_timing = 1
relic_start = 240
relic_max = 1

if (Locale_AddDictionary ~= nil) then
    Locale_AddDictionary("locale:LevelData\\Multiplayer\\lib\\relics.dat")
end

function relics_updating()		
		if Universe_GameTime() < relic_start then
				return			
		else
				local universesize = Universe_GetWorldBounds()
				--create spawn coordinates
				local x = floor(-universesize[1]*0.75+(RandomRUBased(universesize[1]*0.75*2/1000)*1000))
				local y = floor(-universesize[2]*0.45+(RandomRUBased(universesize[2]*0.45*2/1000)*1000))
				local z = floor(-universesize[3]*0.75+(RandomRUBased(universesize[3]*0.75*2/1000)*1000))
				--how many players we have
				local howmanyplayers = 0
				for i = 0,Universe_PlayerCount()-1,1 do
						if Player_IsAlive(i) == 1 then
								if Player_HasShipWithBuildQueue(i) == 1 then
										howmanyplayers = howmanyplayers + 1
								end
						end			
				end			
				if howmanyplayers <= 6 then
					howmanyplayers = 1
				else
					howmanyplayers = 2
				end					
				--how many relis we have
				local howmanyrelics = 0
				for i = 1,relic_max,1 do
						SobGroup_CreateIfNotExist("Relic"..i)
						if SobGroup_Empty("Relic"..i) == 0 then
							howmanyrelics = howmanyrelics + 1
						else
							Volume_Delete("Relic"..i)	
						end
				end				
				--loop on objects
				for i = 1,relic_max,1 do	
						local relic_objdescription = " "											
						--create object if empty
						if SobGroup_Empty("Relic"..i) == 1 then
								if relics_timing == 1 and howmanyrelics < howmanyplayers then
										--check if we've objects and in the same map quadrant
										local xyz = 1
										local wehaverelic = 0
										for k = 1,relic_max,1 do
												if SobGroup_Empty("Relic"..k) == 0 then
														wehaverelic = wehaverelic + 1
														if matchpos(Relic_PrevPos[k][1],x) + matchpos(Relic_PrevPos[k][2],y) + matchpos(Relic_PrevPos[k][3],z) == 0 then
																xyz = 0
														end
												end
										end
										--if xyz are in a free quadrant or we have no objects
										if xyz == 1 or wehaverelic == 0 then
												local spacebasedonmapsize = 10000
												if universesize[1] < 20000 then
													spacebasedonmapsize = 4000
												elseif universesize[1] < 40000 then
													spacebasedonmapsize = 8000												
												else
													spacebasedonmapsize = 10000
												end
												Volume_AddSphere("Relic"..i,{x,y,z,},spacebasedonmapsize)
												--check if the sphere is alone in space
												local alone = 0
												for k = 0,Universe_PlayerCount()-1,1 do
														if Player_IsAlive(k) == 1 then
																if SobGroup_FillSobGroupInVolume("temp", "Player_Ships"..k, "Relic"..i) == 1 then
																		alone = alone + 1
																		break
																end			
																if k ~= 0 and k ~= i and k <= relic_max then
																		if SobGroup_FillSobGroupInVolume("temp", "Relic"..k, "Relic"..i) == 1 then
																				alone = alone + 1
																				break
																		end
																end
														end
												end
												if alone > 0 then
														Volume_Delete("Relic"..i)
												end
												--if alone, spawn object
												if alone == 0 then	--spawn												
														Volume_Delete("Relic"..i)
														Volume_AddSphere("Relic"..i,{x,y,z,},5000)														
														SobGroup_SpawnNewShipInSobGroup(-1, "Meg_Relic_RUGenerator", "Relic"..i, "Relic"..i, "Relic"..i)														
														Camera_FocusSave()
														Camera_Object("Relic"..i,3000,2000,4,7)													
														objrelic1 = Objective_Add("$14805", OT_Secondary)	--Examine relic.
														Objective_AddDescription(objrelic1, "$14806")	--Sensors are detecting an unidentified relic. Send ships to investigate.		
														Subtitle_Message_Handler("$14807", 4, "data:sound\\speech\\allships\\emperor\\CHALLENGE_NEWRELIC_1", Universe_CurrentPlayer())	--Relic: sensors are detecting an unidentified relic. Send ships to investigate.
														Sound_SpeechPlay("data:sound\\speech\\allships\\emperor\\CHALLENGE_ANALYZERELIC_1")	--Send ships to investigate.
														local position = SobGroup_GetPosition("Relic"..i)
														relics_counter[i] = 0  -- clear this in case a relic is destroyed and the new relic is immediately captured HICKORY-3971
														for k = 1,relic_max,1 do
																if position[k] >= 0 then
																		Relic_PrevPos[i][k] = 1
																else
																		Relic_PrevPos[i][k] = -1
																end
														end														
														break
												end
										end
								end
						--we've an object		
						else																														
								if SobGroup_AreAnyOfTheseTypes("Relic"..i, "Meg_Relic_RUGenerator") then
										--check invaders and owner around the object
										SobGroup_Clear("temp1")
										local invader = 0				
										local owner = 0
										local dronecount = 0
										for k = 0,Universe_PlayerCount()-1,1 do
												if Player_IsAlive(k) == 1 then
														if SobGroup_FillSobGroupInVolume("temp", "Player_Ships"..k, "Relic"..i) == 1 then
																if SobGroup_OwnedBy("Relic"..i) >= 0 then														
																		if k == SobGroup_OwnedBy("Relic"..i) then																		
																				owner = SobGroup_Count("temp")
																				-- drones should not be included in this list counting and subtracting.  (using drone dockfamily as filter)
																				dronecount = SobGroup_CountByFilterInclude("temp", "DockFamily", "drone") + SobGroup_CountByFilterInclude("temp", "DockFamily", "drone1") + SobGroup_CountByFilterInclude("temp", "DockFamily", "drone2") + SobGroup_CountByFilterInclude("temp", "DockFamily", "drone3")
																				owner = owner - dronecount
																		elseif AreAllied(k, SobGroup_OwnedBy("Relic"..i)) == 1 then		
																		else
																				SobGroup_SobGroupAdd("temp1", "temp")
																				invader = invader + 1																				
																		end
																else	
																		SobGroup_SobGroupAdd("temp1", "temp")
																		invader = invader + 1																		
																end
														end
												end
										end
										--case 1, object has no owner and there's an invader
										if invader == 1 and owner == 0 then
												ping_r = Ping_AddSobGroup("", "circleandarrows", "Relic"..i)
												Ping_LabelVisible(ping_r, 1)				
												Ping_AddDescription(ping_r, 0, "$14808")	--Unknown relic, can generate RUs												
												--resetting the relic
												if relics_reset[i] == 0 and SobGroup_OwnedBy("Relic"..i) ~= SobGroup_OwnedBy("temp1") then
													relics_reset[i] = 1
													relics_counter[i] = 0	
												end												
												if SobGroup_OwnedBy("Relic"..i) ~= SobGroup_OwnedBy("temp1") then
														SobGroup_SetSwitchOwnerFlag("Relic"..i, 0)
														SobGroup_SwitchOwner("Relic"..i, SobGroup_OwnedBy("temp1"))
														if SobGroup_OwnedBy("temp1") == Universe_CurrentPlayer() then
																Camera_FocusSave()
																Camera_Object("Relic"..i,3000,2000,4,7)
																FX_StartEvent("Relic"..i, "analyze")
																Objective_SetState(objrelic1, OS_Complete)	
																Objective_AddDescription(objrelic1, "$14809")	--Analysis of unknown relic complete. Allocate combat ships to to prevent relic being captured by enemy fleets.
																Subtitle_Message_Handler("$14810", 4, "data:sound\\speech\\allships\\emperor\\CHALLENGE_ANALYZERELICCOMPLETE_1", Universe_CurrentPlayer())	--Relic: analysis of unknown relic complete. Allocate combat ships to to prevent relic being captured by enemy fleets.
																Sound_SpeechPlay("data:sound\\speech\\allships\\emperor\\CHALLENGE_DEFENDRELIC_1")	--Allocate combat ships to to prevent relic being captured by enemy fleets.	
														else
																Objective_SetState(objrelic1, OS_Failed)	
																local playeronrelic = SobGroup_OwnedBy("Relic"..i)
																local playerName = Player_GetName(playeronrelic)																
																local subtitleMessage = Message_FormatFw("$14811", playerName)	--Relic: Examine unknown relic, <c=c80000>failed.</c>  Awarded to %[0]wS.
																Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\CHALLENGE_ANALYZERELICFAILED_1", Universe_CurrentPlayer())
														end
												end												
										--case 2, object has owner and there's an invader
										elseif invader == 1 and owner > 0 then
												ping_r = Ping_AddSobGroup("", "circleandarrows", "Relic"..i)
												Ping_LabelVisible(ping_r, 1)		
												Ping_AddDescription(ping_r, 0, "$14812")	--Relic unsafe
												if owner == 1 then
														--resetting the relic
														if relics_reset[i] == 0 and SobGroup_OwnedBy("Relic"..i) ~= SobGroup_OwnedBy("temp1") then
															relics_reset[i] = 1
															relics_counter[i] = 0	
														end																				
														if SobGroup_OwnedBy("Relic"..i) ~= SobGroup_OwnedBy("temp1") then
																SobGroup_SetSwitchOwnerFlag("Relic"..i, 0)
																SobGroup_SwitchOwner("Relic"..i, SobGroup_OwnedBy("temp1"))
																if SobGroup_OwnedBy("temp1") == Universe_CurrentPlayer() then																		
																		Objective_SetState(objrelic1, OS_Complete)	
																		Objective_AddDescription(objrelic1, "$14813")	--Relic captured.
																		Subtitle_Message_Handler("$14814", 2, "data:sound\\speech\\allships\\emperor\\CHALLENGE_RELICCAPTURED_1", Universe_CurrentPlayer())	--Relic: examine unknown relic, <c=00c800>complete.</c>
																else
																		Objective_SetState(objrelic1, OS_Failed)
																		local playeronrelic = SobGroup_OwnedBy("Relic"..i)
																		local playerName = Player_GetName(playeronrelic)																		
																		local subtitleMessage = Message_FormatFw("$14811", playerName)	--Relic: Examine unknown relic, <c=c80000>failed.</c>  Awarded to %[0]wS.
																		Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\CHALLENGE_ENEMYRELICSECURED_1", Universe_CurrentPlayer())
																end														
														end
												else
													relics_reset[i] = 0
												end					
										--case 3, object has no owner and no invader		
										elseif invader == 0 and owner == 0 then
												ping_r = Ping_AddSobGroup("", "circleandarrows", "Relic"..i)
												Ping_LabelVisible(ping_r, 1)	
												Ping_AddDescription(ping_r, 0, "$14808")
												relics_reset[i] = 0	
												relics_counter[i] = 0												
										--case 4, object has owner and no invader		
										elseif invader == 0 and owner > 0 then
												relics_reset[i] = 0
												if relics_counter[i] < 100 then
													relics_counter[i] = 100
												end
												relics_counter[i] = relics_counter[i] + 1												
												local relicruinjection = floor(200*(owner/5))
												if relicruinjection < 100 then
														relicruinjection = 100
												end
												ping_r = Ping_AddSobGroup("", "circleandarrows", "Relic"..i)
												Ping_LabelVisible(ping_r, 1)												
												local subtitleMessage = Message_FormatFff("$14816", relicruinjection, (7-relics_timing)*(5.1*4))
												Ping_AddDescriptionW(ping_r, 0, subtitleMessage)											
												--Ping_AddDescription(ping_r, 0, "Relic safe, generating " .. relicruinjection .. " RU" .. " (Age " .. relics_counter[i] .. ")")
												if relics_timing == i then		
														FX_StartEvent("Relic"..i, "PowerUp")	
														local subtitleMessage = Message_FormatFf("$14815", relicruinjection)
														Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\speech\\allships\\emperor\\CHALLENGE_RELICRU_1", SobGroup_OwnedBy("Relic"..i))	
														Player_SetRU(SobGroup_OwnedBy("Relic"..i),Player_GetRU(SobGroup_OwnedBy("Relic"..i)) + relicruinjection)	
														Stats_RelicsRUs[SobGroup_OwnedBy("Relic"..i)+1] = Stats_RelicsRUs[SobGroup_OwnedBy("Relic"..i)+1] + relicruinjection														
												end
										--case 5, all other cases		
										else		
												relics_reset[i] = 0		
										end									
								end
						end
				end
		end		
		relics_timing = relics_timing + 1
		if relics_timing > 6 then
				relics_timing = 1				
		end
end

function matchpos(prev,now)
		if now >= 0 then
				now = 1
		else
				now = -1
		end			
		if now == prev then
				return 0
		else
				return 1
		end
end