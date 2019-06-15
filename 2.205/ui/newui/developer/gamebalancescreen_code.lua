
activeraceListbox = "hgn_listbox"
P1BuildCost = 0
P1BuildTime = 0
P1RunningHealth = 0
P2BuildCost = 0
P2BuildTime = 0
P2RunningHealth = 0
bLoaded = 0
bInstaFight = 0
----------------------- ON SHOW -----------------------
function GameBalanceScreenOnShow()

	if(bLoaded==1) then		
		return
	end

	print("LUA: Balance Screen Loading")
	bLoaded=1

	--Make sure it's visible and enabled
	UI_SetElementVisible("GameBalanceScreen","GameBalanceScreenWindow", 1)
	UI_SetElementEnabled("GameBalanceScreen","GameBalanceScreenWindow", 1)

	SobGroup_CreateIfNotExist("playerSob")
	SobGroup_CreateIfNotExist("enemySob")
	SobGroup_Clear("playerSob")
	SobGroup_Clear("enemySob")

	local firstplayer = 0
	for i = 0,5,1 do		
			if SobGroup_Empty("Player_Ships"..i) == 0 then
					firstplayer = i
					break
			end
	end
	if Player_FillProximitySobGroup("playerSob", -1, "Player_Ships"..firstplayer, 1000000) == 1 then
			SobGroup_FillShipsByType("enemySob", "playerSob", "Special_UnitTestMap")
			--if SobGroup_Count("enemySob") > 0 then
			--		cl[7] = 1
			--else
	--cl[7] = -1					
	--		end
	end

	Volume_AddSphere("battle",{0,0,0,},2000)

	for i = 1,50,1 do
		Volume_AddSphere("player"..i,{random(-1500,1500),random(-750,750),random(2600,3000),},2000)
		Volume_AddSphere("enemy"..i,{random(-1500,1500),random(-750,750),-random(2600,3000),},2000)
	end		

	SobGroup_Create("squadenemy")
	SobGroup_Create("squadplayer")		
	SobGroup_Create("tempSob")	 
end
------------------------------------------------
function GameBalanceScreenOnUpdate()

	local playershipcount = SobGroup_Count("squadplayer")
	local enemyshipcount = SobGroup_Count("squadenemy")	
	UI_SetTextLabelText("GameBalanceScreen", "PlayerCount", ""..playershipcount);
	UI_SetTextLabelText("GameBalanceScreen", "EnemyCount", ""..enemyshipcount);
	
	local playershiphealth = SobGroup_CurrentHealthTotal("squadplayer")
	local enemyshiphealth = SobGroup_CurrentHealthTotal("squadenemy")	
	UI_SetTextLabelText("GameBalanceScreen", "Player1RunningHealth", ""..playershiphealth);
	UI_SetTextLabelText("GameBalanceScreen", "Player2RunningHealth", ""..enemyshiphealth);
	
	if playershipcount == 0 or enemyshipcount == 0 then
		UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")

		if bInstaFight == 1 then
			SetTurboSpeed(1)
			bInstaFight = 0
		end

	end

end
------------------------------------------------
function GameBalanceScreenOnHide()
	print("LUA: Balance Screen Unloading")
	bLoaded = 0
end

----------------------- SPAWN UNIT -----------------------
function SpawnUnitFromDropdownListBoxSelection(_side, _playerID, _count, _formation)
	-- _side is either "player" or "enemy"
	-- _playerID is either 0=player or 1=enemy


	local shipType = UI_GetDropdownListBoxSelectedCustomDataString("GameBalanceScreen",activeraceListbox)
	SobGroup_Clear("tempSob")

	for i = 1,_count do 
	local r = random(1,50)
		-- Create the ship in volume _side..r
		SobGroup_SpawnNewShipInSobGroup(_playerID, shipType , _side, 'tempSob', _side..r)	
		
		-- Add _side.."Sob" to active list of ships to keep count of (squad*)
		SobGroup_SobGroupAdd(_side.."Sob", 'tempSob')	
		SobGroup_SobGroupAdd("squad".._side, _side.."Sob")		
	end 

	SobGroup_SelectSobGroup('tempSob')

	--SobGroup_FormStrikeGroup('tempSob','delta')
	--SobGroup_FormStrikeGroup('tempSob','x')
	--SobGroup_FormStrikeGroup('tempSob','broad')
	--SobGroup_FormStrikeGroup('tempSob','movers')
	--SobGroup_FormStrikeGroup('tempSob','wall')
	--SobGroup_FormStrikeGroup('tempSob','none')
	if(_formation ~= nil) then
		SobGroup_FormStrikeGroup('tempSob',_formation)
		--SobGroup_SetFixed('tempSob',1)
	end


	Subtitle_Message(_side.."Spawning ".. _count.. " ".. shipType, 5)
	

	-- Added now that the switch player debug option is available
	if(Universe_CurrentPlayer() == 0) then
		SobGroup_AbilityActivate("squadenemy", AB_Move, 0) -- So the enemy stays still
	else
		SobGroup_AbilityActivate("squadplayer", AB_Move, 0) -- So the enemy stays still
	end

	local buildCost = SobGroup_GetStaticF(shipType,"buildCost") * _count
	local buildTime = SobGroup_GetStaticF(shipType,"buildTime") * _count

	if _playerID == 0 then
		P1BuildCost = (P1BuildCost + buildCost)
		P1BuildTime = (P1BuildTime + buildTime)
		UI_SetTextLabelText("GameBalanceScreen", "Player1BuildCost", P1BuildCost);
		UI_SetTextLabelText("GameBalanceScreen", "Player1BuildTime", P1BuildTime);

	else
		P2BuildCost = (P2BuildCost + buildCost)
		P2BuildTime = (P2BuildTime + buildTime)
		UI_SetTextLabelText("GameBalanceScreen", "Player2BuildCost", P2BuildCost);
		UI_SetTextLabelText("GameBalanceScreen", "Player2BuildTime", P2BuildTime);
	end	

end

----------------------- SHOW LISTBOX -----------------------
function ShowRaceListbox(listbox)

	UI_SetElementVisible("GameBalanceScreen", 'hgn_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'vgr_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'kus_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'tai_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'hw1_misc_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'hw2_misc_listbox', 0)
	UI_SetElementVisible("GameBalanceScreen", 'mp_misc_listbox', 0)

	UI_SetElementVisible("GameBalanceScreen", listbox, 1)
	activeraceListbox = listbox

end
---------------------------------------------------------------------
function Fight()
	SobGroup_Attack(0, "squadplayer", "squadenemy")
	--SobGroup_AbilityActivate("squadenemy", AB_Move, 1)
	SobGroup_Attack(1, "squadenemy", "squadplayer")			
	Subtitle_Message("Fight!", 5)
	UI_TimerStart("GameBalanceScreen", "BalanceFightTimer")
end

function InstaFight()
	bInstaFight = 1
	SetTurboSpeed(64)
	SobGroup_Attack(0, "squadplayer", "squadenemy")
	--SobGroup_AbilityActivate("squadenemy", AB_Move, 1)
	SobGroup_Attack(1, "squadenemy", "squadplayer")			
	Subtitle_Message("Insta-Fight!", 5)
	UI_TimerStart("GameBalanceScreen", "BalanceFightTimer")

end


function DestroyAll()
	SobGroup_TakeDamage("squadplayer", 1)		
	SobGroup_TakeDamage("squadenemy", 1)		
	Subtitle_Message("Destroy!", 5)
	P1BuildCost = 0
	P1BuildTime = 0
	P2BuildCost = 0
	P2BuildTime = 0

	bInstaFight = 0
	SetTurboSpeed(1)
	InstaFight = 0

	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildCost", P1BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildTime", P1BuildTime);
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildCost", P2BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildTime", P2BuildTime);
	UI_TimerReset("GameBalanceScreen", "BalanceFightTimer")
	UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")
end

function DestroyPlayer()
	SobGroup_TakeDamage("squadplayer", 1)		
	Subtitle_Message("Destroy Player!", 5)
	P1BuildCost = 0
	P1BuildTime = 0
	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildCost", P1BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player1BuildTime", P1BuildTime);
	UI_TimerReset("GameBalanceScreen", "BalanceFightTimer")
	UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")
end

function DestroyEnemy()
	SobGroup_TakeDamage("squadenemy", 1)		
	Subtitle_Message("Destroy Enemy!", 5)
	P2BuildCost = 0
	P2BuildTime = 0
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildCost", P2BuildCost);
	UI_SetTextLabelText("GameBalanceScreen", "Player2BuildTime", P2BuildTime);
	UI_TimerReset("GameBalanceScreen", "BalanceFightTimer")
	UI_TimerStop("GameBalanceScreen", "BalanceFightTimer")
end


HandyTimerState = 0

function CycleHandyTimer()
	
	if HandyTimerState == 1 then
		UI_TimerStop("GameBalanceScreen", "HandyTimer")
		HandyTimerState = 0
		return 0
	end

	if HandyTimerState == 0 then
		UI_TimerReset("GameBalanceScreen", "HandyTimer")
		UI_TimerStart("GameBalanceScreen", "HandyTimer")
		HandyTimerState = 1
		return 0
	end
	

end
----------------------------------------------------
-- AI Debug

-- the cpu player to query
cpuplayer = 1
-- the current debug mode 0 being off
cpudebugmode = 1
-- this is the player the cpu player is analyzing from its point of view
cpudebugplayer = 1

enabled = 0

rawset(globals(), "ToggleAIDebug", nil )

function ToggleAIDebug()

	if (enabled == 0) then
		CPU_SetDebug(cpuplayer, 1)
		CPU_SetDebugMode(cpuplayer, cpudebugmode)
		CPU_SetDebugPlayer(cpuplayer, cpudebugplayer)
		-- set flag 1 and 2
		CPU_SetDebugFlag(cpuplayer, 0 )	
		enabled=1
	else
		local numPlayers = Universe_PlayerCount();
		for i=0,numPlayers do
			CPU_SetDebugMode(i, 0)
		end
		enabled=0
	end
end

function SwapSides()
	if(Universe_CurrentPlayer() == 0) then
		SobGroup_AbilityActivate("squadplayer", AB_Move, 0) 
	else
		SobGroup_AbilityActivate("squadenemy", AB_Move, 0) 
	end
	--swap
	MainUI_UserEvent(eSwitchPlayer)

	if(Universe_CurrentPlayer() == 0) then
		SobGroup_AbilityActivate("squadplayer", AB_Move, 1) 
	else
		SobGroup_AbilityActivate("squadenemy", AB_Move, 1) 
	end


end