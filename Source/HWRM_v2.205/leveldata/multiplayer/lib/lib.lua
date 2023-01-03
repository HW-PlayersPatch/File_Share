function sobgroups_init()		
		SobGroup_Create("temp")
		SobGroup_Create("temp1")
		SobGroup_Create("Special_Splitter")
		SobGroup_SpawnNewShipInSobGroup(-1, "Special_Splitter", "Special_Splitter", "Special_Splitter", "centre")
		SobGroup_SetInvulnerability("Special_Splitter", 1)
		SobGroup_MakeUntargeted("Special_Splitter")
		--to keep compatibility with test levels, can be removed with the shipping of the game
		for i = 0,7,1 do
				SobGroup_Create("kus_mothership"..i)
				SobGroup_Create("tai_mothership"..i)
				SobGroup_Create("kus_carrier"..i)
				SobGroup_Create("tai_carrier"..i)
		end
		Rule_Remove("sobgroups_init")
end

function sobgroups_updating()	
		local playerIndex = 0
		while playerIndex < Universe_PlayerCount() do
				if Player_IsAlive(playerIndex) == 1 then
						if Player_HasShipWithBuildQueue(playerIndex) == 1 then
								SobGroup_Create("kus_mothership"..playerIndex)	
								SobGroup_Clear("kus_mothership"..playerIndex)
								SobGroup_FillShipsByType("kus_mothership"..playerIndex, "Player_Ships"..playerIndex, "kus_mothership")
						end
				end
				playerIndex = playerIndex + 1
		end		
end

function SobGroup_UpdateClass(Group, LastGroup, Counter)
		if SobGroup_Count(Group) > SobGroup_Count(LastGroup) then
				SobGroup_Clear ("temp")
				SobGroup_FillSubstract("temp", Group, LastGroup)
				if SobGroup_Count("temp") == 1 then
						for i = 0,Counter,1 do
								SobGroup_Create("split" .. tostring(Group) .. tostring(i))
								if SobGroup_Empty ("split" .. tostring(Group) .. tostring(i)) == 1 then
										SobGroup_SobGroupAdd("split" .. tostring(Group) .. tostring(i), "temp")
										if i == Counter then
												Counter = Counter + 1
										end
										break
								end
						end
				else
						local SobNum = SobGroup_SplitGroupFromGroup("temp1", "temp", SobGroup_Count("temp"), "Special_Splitter")
						if SobNum >= 1 then
								for i = 0,(SobNum - 1),1 do
										for z = 0,Counter,1 do
												SobGroup_Create("split" .. tostring(Group) .. tostring(z))
												if SobGroup_Empty ("split" .. tostring(Group) .. tostring(z)) == 1 then
														SobGroup_SobGroupAdd("split" .. tostring(Group) .. tostring(z), "temp1"..i)
														if z == Counter then
																Counter = Counter + 1
														end
														break
												end
										end
								end
						end
			end
				SobGroup_Clear(LastGroup)
				SobGroup_SobGroupAdd(LastGroup, Group)
		elseif SobGroup_Count(Group) == 0 then
				Counter = 0
				SobGroup_Clear(LastGroup)
		else
				if Counter >= 15 then
						for z = (Counter-1),0,-1 do
								if SobGroup_Empty ("split" .. tostring(Group) .. tostring(z)) == 1 then
										Counter = Counter - 1
								else
										break
								end
						end
				end
				SobGroup_Clear(LastGroup)
				SobGroup_SobGroupAdd(LastGroup, Group)
		end
		return Counter
end

function SobGroup_SplitGroupFromGroup(SobGroupOut, SobGroupToSplit, NumberToSplit, SobGroupFrom)
		local index = 0
		local distance = 0
		local distancemax = 250000
		local bool = 0
		local SobNum = 0
		SobGroup_Create ("TempSobGroup")
		SobGroup_Create ("TempSobGroup1")
		SobGroup_Clear ("TempSobGroup")
		SobGroup_Clear ("TempSobGroup1")
		SobGroup_SobGroupAdd ("TempSobGroup", SobGroupToSplit)
		if SobGroup_Empty (SobGroupToSplit) == 1 then
				return 0
		end
		if NumberToSplit > SobGroup_Count(SobGroupToSplit) then
				NumberToSplit = SobGroup_Count(SobGroupToSplit)
		end
		if levelweareplaying == 0 then
				distancemax = 1000000
		end
		while index < NumberToSplit do
				bool = 0
				interval = 625.0
				while bool == 0 do
						distance = distance + interval
						if distance > distancemax then
								bool = 1
								return SobNum
						end
						SobGroup_FillProximitySobGroup ("TempSobGroup1", "TempSobGroup", SobGroupFrom, distance)
						if SobGroup_Empty ("TempSobGroup1") == 1 then
						else
								if SobGroup_Count ("TempSobGroup1") > 1 then
										if interval <= .2 then
												SobGroup_Create(SobGroupOut .. tostring(SobNum))
												SobGroup_Clear (SobGroupOut .. tostring(SobNum))
												SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
												SobGroup_Create("tempsob")
												SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
												SobGroup_Clear ("TempSobGroup")
												SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
												bool = 1
										else
												distance = distance - interval
												interval = interval / 5
										end
								else
										SobGroup_Create(SobGroupOut .. tostring(SobNum))
										SobGroup_Clear (SobGroupOut .. tostring(SobNum))
										SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
										SobGroup_Create("tempsob")
										SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
										SobGroup_Clear ("TempSobGroup")
										SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
										bool = 1
								end
						end
				end
				index = index + SobGroup_Count(SobGroupOut .. tostring(SobNum))
				SobNum = SobNum + 1
		end
		return SobNum
end

function Grant_Research(player,tech)
		if Player_CanResearch(player,tech) == 1 then
				Player_GrantResearchOption(player,tech)
				return 1
		else
				return 0
		end
end

function Research_Research(player,tech)
		if Player_CanResearch(player,tech) == 1 then
				Player_Research(player,tech)
				return 1
		else
				return 0
		end
end

function Restrict_Research(player,tech)
		if Player_CanResearch(player,tech) == 1 then
				Player_RestrictResearchOption(player,tech)
				return 1
		else
				return 0
		end
end

function Flag_Research(player,tech)
		if research == 1 then
			Research_Research(player,tech)
		else
			Player_GrantResearchOption(player,tech)
		end
end

function SobGroup_CreateSubSystemCheck(ship,hp,sub)
	if SobGroup_GetHardPointHealth(ship,hp) == 0 then
			SobGroup_CreateSubSystem(ship,sub)
		end
end

randomsimulator = 2

function RandomRUBased(value)		
		randomsimulator = randomsimulator + 1		
		if randomsimulator >= 10 then
				randomsimulator = 2
		end
		local val = 0		
		for playerIndex = 0,Universe_PlayerCount()-1,1 do				
				if Player_IsAlive(playerIndex) == 1 then		
						val = val + Player_GetRU(playerIndex)
				end
		end							
		while val > value do
				val = floor(val / randomsimulator)
		end			
		if val < 1 then
				val = 1
		end
		if val >= 1 then
				return val
		end					
end

function Subtitle_Message_Handler(text, seconds, sound, playerID)
		if playerID == Universe_CurrentPlayer() then
			Subtitle_Message(text, seconds)
			Sound_SpeechPlay(sound)
			--if Subtitle_IsMessageDone() == 1 then
				--Subtitle_Message(text, seconds)
				--Sound_SpeechPlay(sound)	
			--else				
				--Subtitle_Message_Handler(text, seconds, sound, playerID)
			--end			
		end	
end

function Subtitle_Message_Handlerw(text, seconds, sound, playerID)
		if playerID == Universe_CurrentPlayer() then
			Subtitle_Messagew(text, seconds)
			Sound_SpeechPlay(sound)
		end	
end

function Camera_Object(sobgroup,distance,buffer,duration,restore)
		if Sensors_ManagerIsUp() == 1 then	
			return
		end
		Event_Start("startcinematic")
		UI_BindKeyEvent(ESCKEY, "Camera_Object_Restore")		
		Camera_FocusSobGroupWithBuffer(sobgroup, distance, buffer, duration)				
		Rule_AddInterval("Camera_Object_Restore",restore)				
end

function Camera_Object_Restore()		
		UI_UnBindKeyEvent(ESCKEY)
		Event_Start("stopcinematic_focusrestore")		
		Rule_Remove("Camera_Object_Restore")
end

function fadedown()
	Universe_Fade(1,0.85)
	Rule_Remove("fadedown")
	Rule_AddInterval("fadeup",0.925)
end

function fadeup()
	Universe_Fade(0,0.85)
	Rule_Remove("fadeup")
end