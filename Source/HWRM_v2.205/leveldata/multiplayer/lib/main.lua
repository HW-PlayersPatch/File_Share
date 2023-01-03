mainrule_flag = 1

function mainrule_updating()		
		if mainrule_flag == 1 then
				objectivePrimary = Objective_Add("$3005", OT_Primary)
				Objective_AddDescription(objectivePrimary, "$3006")
				Subtitle_Message_Handler("$3007", 2, "data:sound\\speech\\allships\\emperor\\CHALLENGE_DESTROYMOTHERSHIPS_2", Universe_CurrentPlayer())		
				mainrule_flag = 0
		end		
		local playerIndex = 0
		local playerCount = Universe_PlayerCount()
		while (playerIndex < playerCount) do
				if (Player_IsAlive(playerIndex) == 1 and Player_HasShipWithBuildQueue(playerIndex) == 0) then
						Player_Kill(playerIndex)
						if playerIndex ~= Universe_CurrentPlayer() then
--								UI_SetScreenEnabled("PlayerDestroyedScreen", 1)
--								UI_SetScreenVisible("PlayerDestroyedScreen", 1)			
								local playerNameW = Player_GetName(playerIndex)								
--								UI_SetTextLabelTextWF1("PlayerDestroyedScreen", "lblDescription1", "$1231", playerNameW);
								Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
								Player_AddLocalChatMessage("$1231", playerNameW);
						end
				end
				playerIndex = playerIndex+1
		end
		local numAlive = 0
		local numEnemies = 0
		local gameOver = 1
		playerIndex = 0
		while (playerIndex < playerCount) do
				if (Player_IsAlive(playerIndex) == 1) then
						local otherPlayerIndex = 0
						while (otherPlayerIndex < playerCount) do
								if (AreAllied(playerIndex, otherPlayerIndex) == 0) then
										if (Player_IsAlive(otherPlayerIndex) == 1) then
												gameOver = 0
										else
												numEnemies = numEnemies + 1
										end
								end
								otherPlayerIndex = otherPlayerIndex + 1
						end
						numAlive = numAlive + 1
				end
				playerIndex = playerIndex + 1
		end
		if (numEnemies == 0 and numAlive > 0) then
				gameOver = 0
		end
		if (gameOver == 1) then
				Rule_Add("waitForEnd")
				Event_Start("endGame")
				Rule_Remove("mainrule_updating")
		end
end

function waitForEnd()
		if(Event_IsDone("endGame")) then
				setGameOver()
				Rule_Remove("waitForEnd")
		end
end
		