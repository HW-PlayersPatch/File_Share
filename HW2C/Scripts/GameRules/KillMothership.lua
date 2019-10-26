-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/scar/restrict.lua")

function OnInit()
	MPRestrict();
	Rule_Add("MainRule")
end

function MainRule()
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
	if (Player_IsAlive(playerIndex) == 1 and Player_HasShipWithBuildQueue(playerIndex) == 0) then
	Player_Kill(playerIndex)
	end
	playerIndex = playerIndex + 1
	end
	local numAlive = 0;
	local numEnemies = 0;
	local gameOver = 1;
	playerIndex = 0;
	while (playerIndex < playerCount) do
	if (Player_IsAlive(playerIndex) == 1) then
	local otherPlayerIndex = 0;
	while (otherPlayerIndex < playerCount) do
	if (AreAllied(playerIndex, otherPlayerIndex) == 0) then
	if (Player_IsAlive(otherPlayerIndex) == 1) then
	gameOver = 0
	else
	numEnemies = numEnemies + 1
	end
	end
	otherPlayerIndex = otherPlayerIndex + 1;
	end
	numAlive = numAlive + 1;
	end
	playerIndex = playerIndex + 1
	end
	if (numEnemies == 0 and numAlive > 0) then
	gameOver = 0;
	end
	if (gameOver == 1) then
	setGameOver()
	Rule_Remove("MainRule")
	end
end
