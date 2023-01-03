-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

GUID = {65, 62, 117, 241, 187, 35, 105, 73, 167, 90, 159, 159, 12, 42, 50, 74}

GameRulesName = "Resource Race"

Description = "The first player to reach the specified Target Resources wins.\nWinner take all!"

Directories = {Levels = "data:LevelData\\Multiplayer\\ResourceRace\\", AI = "data:AI\\"}

GameSetupOptions = {
{name = "targetresources",
	locName = "Target Resources",
	tooltip = "HOW MANY RESOURCES YOU MUST EARN",
	default = 0,
	visible = 1,
	choices = {"2000", "2000", "5000", "5000", "10000", "10000", "15000", "15000"},},}

dofilepath("data:scripts/scar/restrict.lua")

resourcesNeeded = 0

RRPI_PlayerName = 0
RRPI_PlayerProgress = 1
RRPI_PlayerColour = 2
RRPN_Parameters = 3

function OnInit()
	MPRestrict();
	resourcesNeeded = GetGameSettingAsNumber("targetresources")
	Rule_Add("MainRule")
	ATI_LoadTemplates("data:LevelData\\Multiplayer\\ResourceRace\\ATI.lua")
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
	local gameOver = 0;
	local victoriousPlayer = 0;
	playerIndex = 0
	while (playerIndex < playerCount) do
	if (Player_IsAlive(playerIndex) == 1) then
	if (Player_GetRU(playerIndex) >= resourcesNeeded) then
	gameOver = 1
	victoriousPlayer = playerIndex
	end
	end
	playerIndex = playerIndex + 1
	end
	if (gameOver == 1) then
	playerIndex = 0
	while (playerIndex < playerCount) do
	if (playerIndex ~= victoriousPlayer) then
	Player_Kill(playerIndex)
	end
	playerIndex = playerIndex + 1
	end
	setGameOver()
	Rule_Remove("MainRule")
	end
	ATI_Clear()
	local TitleRect = {0.5, 0.51, 0.5, 0.1}
	ATI_CreateParameters(1)
	ATI_AddString(0, "Player Progress")
	ATI_Display2D("progressTitle", TitleRect, 0)
	playerIndex = 0
	local ATIRect = {0.5, 0.5, 0.5, 0.02}
	while (playerIndex < playerCount) do
	ATI_CreateParameters(RRPN_Parameters)
	local playerName = Player_GetName(playerIndex)
	ATI_AddWString(RRPI_PlayerName, playerName)
	local progress = Player_GetRU(playerIndex) / resourcesNeeded
	ATI_AddFloat(RRPI_PlayerProgress, progress)
	local playerColour = {1.0, 1.0, 1.0, 1.0}
	ATI_AddColour(RRPI_PlayerColour, playerColour)
	ATI_Display2D("playerProgress", ATIRect, 0)
	ATIRect[2] = ATIRect[2] - 0.025
	playerIndex = playerIndex + 1
	end
end
