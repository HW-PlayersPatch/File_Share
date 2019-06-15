
dofilepath("data:scripts/scar/restrict.lua")

-- rule entry point
function OnInit()

	-- restrict options for tuning reseaons for each player
	MPRestrict();
	
	-- add this rule
	Rule_Add("MainRule")
end


-- main rule to call for this game type
function MainRule()

	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	
	while (playerIndex < playerCount) do
		if (Player_IsAlive(playerIndex) == 1 and 
			Player_HasShipWithBuildQueue(playerIndex)==0) then
			-- kill this player
			Player_Kill(playerIndex)
		end
		-- go to next player
		playerIndex = playerIndex+1
	end
		
	local numAlive = 0;
	local numEnemies = 0;
	local gameOver = 1;
	
	-- check to see if ALL of our enemies are dead
	playerIndex = 0;
	while (playerIndex < playerCount) do --  and gameOver
		
		-- only process 'alive' players
		if (Player_IsAlive(playerIndex)==1) then
			-- compare this player against all others
			local otherPlayerIndex = 0;
			while (otherPlayerIndex < playerCount) do
				-- are enemies?
				if (AreAllied(playerIndex, otherPlayerIndex) == 0) then
					-- is the enemy alive - if so the game is still on
					if (Player_IsAlive(otherPlayerIndex)==1) then
						gameOver = 0
					else
						numEnemies = numEnemies + 1
					end
					
				end
				otherPlayerIndex = otherPlayerIndex+1;
			end
			numAlive = numAlive + 1;
		end
		
		-- go to next player
		playerIndex = playerIndex+1
	end
		
	-- special case - if there are no enemies then never end
	if (numEnemies == 0 and numAlive>0) then
		gameOver = 0;
	end
	
	-- if gameOver flag is still set then the game is OVER
	if (gameOver==1) then
		setGameOver()
		Rule_Remove("MainRule")
	end
	
end


