pass = 0

function cpuplayers_updating()			
		local playerIndex = 0
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								if Player_GetLevelOfDifficulty(playerIndex) > 0 then
										
										--behaviour		
										if pass == 0 then
											if cpuplayers == 1 then
													Flag_Research(playerIndex,"cpuplayers_defensive")
													Restrict_Research(playerIndex,"cpuplayers_aggressive")
													Restrict_Research(playerIndex,"cpuplayers_dynamic")
											elseif cpuplayers == 2 then
													Restrict_Research(playerIndex,"cpuplayers_defensive")
													Restrict_Research(playerIndex,"cpuplayers_aggressive")
													Restrict_Research(playerIndex,"cpuplayers_dynamic")
											elseif cpuplayers == 3 then
													Restrict_Research(playerIndex,"cpuplayers_defensive")
													Flag_Research(playerIndex,"cpuplayers_aggressive")
													Restrict_Research(playerIndex,"cpuplayers_dynamic")
											elseif cpuplayers == 4 then
													Restrict_Research(playerIndex,"cpuplayers_defensive")
													Restrict_Research(playerIndex,"cpuplayers_aggressive")
													Flag_Research(playerIndex,"cpuplayers_dynamic")
											end
										end	
										
										--attack damage		
										if pass == 0 then
											if PlayersPatch_AIAttackDamage == 1 then
													Restrict_Research(playerIndex,"WeaponDamageUpgrade125")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade150")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade175")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade200")
											elseif PlayersPatch_AIAttackDamage == 2 then
													Flag_Research(playerIndex,"WeaponDamageUpgrade125")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade150")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade175")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade200")
											elseif PlayersPatch_AIAttackDamage == 3 then
													Restrict_Research(playerIndex,"WeaponDamageUpgrade125")
													Flag_Research(playerIndex,"WeaponDamageUpgrade150")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade175")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade200")
											elseif PlayersPatch_AIAttackDamage == 4 then
													Restrict_Research(playerIndex,"WeaponDamageUpgrade125")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade150")
													Flag_Research(playerIndex,"WeaponDamageUpgrade175")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade200")
											elseif PlayersPatch_AIAttackDamage == 5 then
													Restrict_Research(playerIndex,"WeaponDamageUpgrade125")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade150")
													Restrict_Research(playerIndex,"WeaponDamageUpgrade175")
													Flag_Research(playerIndex,"WeaponDamageUpgrade200")
											end
										end	
										
										--no-rush time
										if norushtime > 0 then
											if pass == 0 then
												--prevents the AI to attack												
												if norushtime == 5 then
														Flag_Research(playerIndex,"cpuplayers_norushtime5")		
														Restrict_Research(playerIndex,"cpuplayers_norushtime10")
														Restrict_Research(playerIndex,"cpuplayers_norushtime15")
												elseif norushtime == 10 then
														Restrict_Research(playerIndex,"cpuplayers_norushtime5")		
														Flag_Research(playerIndex,"cpuplayers_norushtime10")
														Restrict_Research(playerIndex,"cpuplayers_norushtime15")
												elseif norushtime == 15 then
														Restrict_Research(playerIndex,"cpuplayers_norushtime5")		
														Restrict_Research(playerIndex,"cpuplayers_norushtime10")
														Flag_Research(playerIndex,"cpuplayers_norushtime15")																
												end		
											end	
											--prevents the AI to move
											local mothership = PlayerRace_GetString(playerIndex, "def_type_mothership", "hgn_mothership")
											local carrier = PlayerRace_GetString(playerIndex, "def_type_carrier", "hgn_carrier")								
											SobGroup_CreateIfNotExist("temp")
											SobGroup_Clear("temp")
											SobGroup_CreateIfNotExist("norushtime_nomove"..playerIndex)
											SobGroup_Clear("norushtime_nomove"..playerIndex)
											SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, mothership)
											SobGroup_SobGroupAdd("norushtime_nomove"..playerIndex, "temp")
											SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, carrier)
											SobGroup_SobGroupAdd("norushtime_nomove"..playerIndex, "temp")											
											if norushtime > 1 then
												SobGroup_AbilityActivate("norushtime_nomove"..playerIndex, AB_Move, 0)
											else
												SobGroup_AbilityActivate("norushtime_nomove"..playerIndex, AB_Move, 1)
											end										
										end	
										
										--build speed balancing, based on level of difficulty
										if pass == 0 then
											if Player_GetLevelOfDifficulty(playerIndex) == 1 or Player_GetLevelOfDifficulty(playerIndex) == 2 then
													Flag_Research(playerIndex,"AllShipBuildSpeed")
													Restrict_Research(playerIndex,"AllShipBuildSpeedHard")
													Restrict_Research(playerIndex,"AllShipBuildSpeedExpert")
											elseif Player_GetLevelOfDifficulty(playerIndex) == 3 then
													Restrict_Research(playerIndex,"AllShipBuildSpeed")
													Flag_Research(playerIndex,"AllShipBuildSpeedHard")
													Restrict_Research(playerIndex,"AllShipBuildSpeedExpert")
											elseif Player_GetLevelOfDifficulty(playerIndex) == 4 then
													Restrict_Research(playerIndex,"AllShipBuildSpeed")
													Restrict_Research(playerIndex,"AllShipBuildSpeedHard")
													Flag_Research(playerIndex,"AllShipBuildSpeedExpert")
											end
										end	
										
										--ru speed balancing, based on level of difficulty
										if pass == 0 then
											if Player_GetLevelOfDifficulty(playerIndex) == 3 then
													Flag_Research(playerIndex,"ResourceCollectionRateHard")
													Restrict_Research(playerIndex,"ResourceCollectionRateExpert")													
											elseif Player_GetLevelOfDifficulty(playerIndex) == 4 then
													Restrict_Research(playerIndex,"ResourceCollectionRateHard")
													Flag_Research(playerIndex,"ResourceCollectionRateExpert")													
											end
										end	
										
										--enables AI special weapons
										if pass == 0 then
											AI_Special_Research = nil
										
											dofilepath(PlayerRace_GetString(playerIndex, "path_ai_special", ""))
											
											if (AI_Special_Research ~= nil) then
												AI_Special_Research(playerIndex)
												AI_Special_Research = nil
											end
														
										end	
											
										--relics
										if relics > 0 then
												if Universe_GameTime() > relic_start+10 then
														for i = 1,relic_max,1 do
																if SobGroup_Empty("Relic"..i) == 0 then
																		if SobGroup_AreAnyOfTheseTypes("Relic"..i, "Meg_Relic_RUGenerator") == 1 then									
																				local relic_weight = 150
																				-- Don't need to clear this since FillProximitySobGroup will clear it
																				SobGroup_CreateIfNotExist("temp")
																				if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..playerIndex, "Relic"..i, 50000) == 1 then																						
																						if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..playerIndex, "Relic"..i, 15000) == 1 then
																								relic_weight = relic_weight + 150
																						end																					
																						if playerIndex ~= SobGroup_OwnedBy("Relic"..i) and SobGroup_OwnedBy("Relic"..i) >= 0 and AreAllied(playerIndex, SobGroup_OwnedBy("Relic"..i)) == 0 then
																								relic_weight = relic_weight + 150																								
																								if Player_GetLevelOfDifficulty(SobGroup_OwnedBy("Relic"..i)) > 0 then
																										relic_weight = relic_weight + 300
																								end
																						end																				
																						CPU_AddDefendSobGroup(playerIndex, "Relic"..i, relic_weight)
																				end
																		end
																end
														end
												end
										end
										--crates
										if crates > 0 then
												if Universe_GameTime() > timer_interval*46 then
														for i = 0,Universe_PlayerCount()-1,1 do
																if SobGroup_Empty("CrateSpawnGroup"..i) == 0 then
																		if SobGroup_AreAnyOfTheseTypes("CrateSpawnGroup"..i, "Meg_Crate_HW1Container") == 1 then																				
																				-- FillShipsByType does not clear out the destination sob group, so if we didn't create it then clear it
																				if SobGroup_CreateIfNotExist("temp") == 0 then
																					SobGroup_Clear("temp")
																				end
																				-- FillProximitySobGroup clears the destination sob group, so we don't need to clear it if it already existed
																				SobGroup_CreateIfNotExist("temp1")
																				
																				local scout = PlayerRace_GetString(playerIndex, "def_type_scout", "hgn_scout")
																				
																				SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, scout)
																						
																				if SobGroup_FillProximitySobGroup ("temp1", "temp", "CrateSpawnGroup"..i, 25000) == 1 then																						
																						SobGroup_MoveToSobGroup("temp1", "CrateSpawnGroup"..i)																						
																				end
																		end
																end
														end
												end		
										end
								else										
								end
						end
				end
		end		
		if pass == 0 then
			Rule_Remove("cpuplayers_updating")
		  Rule_AddInterval("cpuplayers_updating",12)
		end
		pass = pass + 1
end