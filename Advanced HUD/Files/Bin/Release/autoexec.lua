--HWR Advanced HUD v3 by Cloaked


--Hotkeys
bind2([[ToggleAdvancedHUD()]], ALTKEY, IKEY); --Toggle Advanced HUD
bind2([[ToggleObserverHUD()]], ALTKEY, OKEY); --Toggle Observer HUD
--Note, the Advanced HUD and Observer HUD can not be used at the same time.


function ToggleAdvancedHUD()
	if (Rule_Exists("RunObserverHUD") == 0) then --If Observer HUD disabled
		if (Rule_Exists("RunAdvancedHUD") == 0) then --Start Advanced HUD
			EndAdvancedHUD();
			--HideNonEssentialUI();
			Rule_AddInterval("RunAdvancedHUD", 10);
		else --End Advanced HUD
			EndAdvancedHUD();
		end
	end
end


function EndAdvancedHUD()
	Rule_Remove("RunAdvancedHUD");
	ClearAdvancedHUD();
	--ShowNonEssentialUI();
end


function ClearAdvancedHUD()
	dr_clear("HUD");
	dr_setautoclear("HUD",0);
end


function RunAdvancedHUD()
	ClearAdvancedHUD();
	AdvancedHUD();
	RUDisplay();
end


function AdvancedHUD()
	--Timer
	local time = Universe_GameTime();
	local h = floor(time / 3600);
	local m = floor(time / 60 - h * 60);
	local s = floor(time - m * 60 - h * 3600);
	local strTime = format("%02d:%02d:%02d", h, m, s);
	dr_text2d("HUD", 0.471, 0.08, strTime, 255, 255, 255);

	--RU Warning
	local RUWarning = 0;
	local MyRUs = 0;
	local strRUwarning = "";
	MyRUs = Player_GetRU(FE_GetCurrentPlayerIndex());
	if (MyRUs < 100) then
		strRUwarning = "Low RU!";
		RUWarning = 1;
	end
	if ((h == 0) and (m >= 1) and (m < 10) and (MyRUs > 2000)) then
		strRUwarning = "High RU!";
		RUWarning = 1;
	end
	if ((h == 0) and (m >= 10) and (m < 15) and (MyRUs > 3000)) then
		strRUwarning = "High RU!";
		RUWarning = 1;
	end
	if ((h == 0) and (m >= 15) and (m < 20) and (MyRUs > 4000)) then
		strRUwarning = "High RU!";
		RUWarning = 1;
	end
	if ((h == 0) and (m >= 20) and (MyRUs > 5000)) then
		strRUwarning = "High RU!";
		RUWarning = 1;
	end
	if (RUWarning == 1) then
		if (mod(s,6) == 0) then --flash
			dr_text2d("HUD", 0.474, 0.89, strRUwarning, 0, 255, 0);
		else --solid
			dr_text2d("HUD", 0.474, 0.89, strRUwarning, 255, 255, 255);
		end
	end

	--Macro Reminder
	local MacroReminder = 0;
	local strMacroReminder = "";
	if ((m >= 1) and (s >= 0) and (s <= 10)) then
		strMacroReminder = "Macro!";
		MacroReminder = 1;
		if (m >= 23) then
			strMacroReminder = "Macro! Asteriods!";
		end
	end
	if (MacroReminder == 1) then
		if (mod(s,2) == 0) then --flash
			dr_text2d("HUD", 0.477, 0.11, strMacroReminder, 0, 255, 0);
		else --solid
			dr_text2d("HUD", 0.477, 0.11, strMacroReminder, 255, 255, 255);
		end
	end

	----Build Order
	--local BuildOrder = 0;
	--local strBuildOrder = "";
    	--if ((h == 0) and (m == 0) and (s >= 5) and (s <= 20)) then
	--	strBuildOrder = "[0:10] MS:ResMod";
	--	BuildOrder = 1;
	--end
    	--if ((h == 0) and (m == 1) and (s >= 0) and (s <= 59)) then
	--	strBuildOrder = "[1:00] Fighters";
	--	BuildOrder = 1;
	--end
	--if ((h == 0) and (m == 2) and (s >= 40) and (s <= 55)) then
	--	strBuildOrder = "[2:45] GW";
	--	BuildOrder = 1;
	--end
	--if (BuildOrder == 1) then
	--	if (mod(s,2) == 0) then --flash
	--		dr_text2d("HUD", 0.45, 0.17, strBuildOrder, 0, 255, 0);
	--	else --solid
	--		dr_text2d("HUD", 0.45, 0.17, strBuildOrder, 255, 255, 255);
	--	end
	--end
end


function RUDisplay()
	--Teamate RU Display
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;
	local me = FE_GetCurrentPlayerIndex();
	local PlayerRUs = 0;
	local strRU = "";
	while (playerIndex < playerCount) do
		if ((me ~= playerIndex) and (AreAllied(me, playerIndex)==1)) then
			PlayerRUs = Player_GetRU(playerIndex);
			strRU = format("P%1.0f: %1.0f", playerIndex + 1, PlayerRUs);
			if (PlayerRUs ~= 0) then --exclude Observers (and also players with no RU)
			if (playerIndex < 4) then
				dr_text2d("HUD", 0.24, 0.89 - (playerIndex/50), strRU, 255, 255, 0);
			else
				dr_text2d("HUD", 0.32, 0.89 - ((playerIndex - 4)/50), strRU, 255, 255, 0);
			end
			end
		end
		playerIndex = playerIndex+1;
	end
end


function HideNonEssentialUI()
	UI_SetElementVisible('NewTaskbar', 'frame_UpperLeft', 0);
	UI_SetElementVisible('NewTaskbar', 'frame_LeftTabs', 0);
	if (Rule_Exists("RunObserverHUD") == 0) then  --If Observer HUD disabled
		UI_SetElementVisible('NewTaskbar', 'GameTimer', 0);
	end
	UI_SetElementVisible('NewTaskbar', 'frame_UpperRight', 0);
	UI_SetElementVisible('NewTaskbar', 'btnShipBack', 0);
	UI_SetElementVisible('NewTaskbar', 'frame_controlgroups', 0);
	UI_SetElementVisible('NewTaskbar', 'HideFrame', 0);
end


function ShowNonEssentialUI()
	UI_SetElementVisible('NewTaskbar', 'frame_UpperLeft', 1);
	UI_SetElementVisible('NewTaskbar', 'frame_LeftTabs', 1);
	UI_SetElementVisible('NewTaskbar', 'GameTimer', 1); --ideally would only show if enabled in options
	UI_SetElementVisible('NewTaskbar', 'frame_UpperRight', 1);
	UI_SetElementVisible('NewTaskbar', 'btnShipBack', 1);
	UI_SetElementVisible('NewTaskbar', 'frame_controlgroups', 1);
	UI_SetElementVisible('NewTaskbar', 'HideFrame', 1);
end


function ToggleObserverHUD()
	if (Rule_Exists("RunAdvancedHUD") == 0) then --If Advanced HUD disabled
		if (Rule_Exists("RunObserverHUD") == 0) then --Start Observer HUD
			--Hide UI elements that arent necessary for observers. Everything except the timer and the lower left corner.
			Rule_AddInterval("RunObserverHUD", 600);
			HideNonEssentialUI();
			UI_SetElementVisible('NewTaskbar', 'Command_Palette', 0);
			UI_SetElementVisible('NewTaskbar', 'specialButtons', 0);
			UI_SetElementVisible('NewTaskbar', 'Command_Palette_Common', 0);
			UI_SetElementVisible('NewTaskbar', 'CommandButtonsFrame', 0);
			UI_HideScreen('ResourceMenu');
		else --End Observer HUD to show UI elements again
			ShowNonEssentialUI();
			UI_SetElementVisible('NewTaskbar', 'Command_Palette', 1);
			UI_SetElementVisible('NewTaskbar', 'specialButtons', 1);
			UI_SetElementVisible('NewTaskbar', 'Command_Palette_Common', 1);
			UI_SetElementVisible('NewTaskbar', 'CommandButtonsFrame', 1);
			UI_ShowScreen('ResourceMenu', ePopup);
			Rule_Remove("RunObserverHUD");
		end
	end
end


function RunObserverHUD()
--Used to track toggle state
end


--AutoStart
--ToggleAdvancedHUD();
