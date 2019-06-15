norushtime_timing = 1
norushtime_flag = 1

if (Locale_AddDictionary ~= nil) then
    Locale_AddDictionary("locale:LevelData\\Multiplayer\\lib\\norushtime.dat")
end

function norushtime_updating()		
		local playerIndex = 0
		if norushtime_flag == 1 then
				for playerIndex = 0,Universe_PlayerCount()-1,1 do
						if Player_IsAlive(playerIndex) == 1 then
								if Player_HasShipWithBuildQueue(playerIndex) == 1 then	
										local position = SobGroup_GetPosition("Player_Ships"..playerIndex)
										Volume_AddSphere("norushtime_volume"..playerIndex,{position[1],position[2],position[3],},6600)		
										
										UI_TimerReset("NewTaskbar", "GameTimer")	
										UI_TimerStart("NewTaskbar", "GameTimer")
										UI_SetTimerOffset("NewTaskbar", "GameTimer", 0-(norushtime*60))	
								end
						end
				end
				norushtime_flag = 0
		end		
		for playerIndex = 0,Universe_PlayerCount()-1,1 do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then								
								if norushtime > 0 then			
									SobGroup_Clear("temp1")
									local norushtime_volumeIndex = 0
									for norushtime_volumeIndex = 0,Universe_PlayerCount()-1,1 do
										if Player_IsAlive(norushtime_volumeIndex) == 1 and playerIndex ~= norushtime_volumeIndex and AreAllied(playerIndex, norushtime_volumeIndex) == 0 then
											Player_FillSobGroupInVolume("temp", playerIndex, "norushtime_volume"..norushtime_volumeIndex)
											SobGroup_SobGroupAdd("temp1", "temp")
										end
									end
									if SobGroup_Count("temp1") > 0 then
										SobGroup_TakeDamage("temp1", 0.15)										
										Subtitle_Message_Handler("$14770", 2, "data:sound\\sfx\\ui\\frontend\\CHATMESSAGERECEIVED", playerIndex)	--to localize
									end
									if norushtime_timing == 1 then
										local subtitleMessage = Message_FormatFf("$14771", norushtime)																				
										Subtitle_Message_Handlerw(subtitleMessage, 2, "data:sound\\sfx\\ui\\frontend\\CHATMESSAGERECEIVED", playerIndex)	--to localize
									end										
								else									
									Subtitle_Message_Handler("$14772", 2, "data:sound\\sfx\\ui\\frontend\\CHATMESSAGERECEIVED", playerIndex)	--to localize
								end								
						end
				end 				
		end
		if norushtime <= 0 then
			for i = 0,Universe_PlayerCount()-1,1 do							
				Volume_Delete("norushtime_volume"..i)								
			end
			Rule_Remove("norushtime_updating")
			return
		end	
		norushtime_timing = norushtime_timing + 1
		if norushtime_timing > 6 then
				norushtime_timing = 1
				norushtime = norushtime - 1	
		end		
end


