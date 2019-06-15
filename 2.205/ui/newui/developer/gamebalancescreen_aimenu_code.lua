
---------------------- Globals --------------------------

cpuplayer = 1
cpudebugmode = 1
cpudebugplayer = 1
cpudebugenabled = 0
numPlayers = 0
---------------------------------------------------------

	 -- Ship name dropdown item to clone
CpuListboxItem_ToClone = {
		type = "TextListBoxItem",
		name = "launchShipItem",
		pressedColor = COLOR_LISTITEM,

		buttonStyle = "IGListBoxItemButtonStyle",			
		resizeToListBox = 1,

		visible = 0,
		enabled = 0,
		ignored = 1,

		Text = {
			textStyle = "IGListBoxItemTextStyle",
			minShrink = 0.25,
		},
	}

----------------------- FUNCTIONS -----------------------
function AIMenuOnShow()

end
------------------------------------------------
function AIMenuOnUpdate()


end
------------------------------------------------
function AIMenuOnHide()

end
------------------------------------------------
------------------------------------------------
function AIMenuOnToggleDebug()	
	
	numPlayers = Universe_PlayerCount()

	AIMenu_UpdateCPUPlayerDropdown(1)

	if(cpudebugenabled == 0) then	
		print("AI Debug Toggled On")
		UI_SetElementEnabled("GameBalanceScreen","CpuDebugFrame",1)
		UI_SetButtonText("GameBalanceScreen","toggleAIDebugButton","Disable CPU Debug")

		AIMenu_SelectPlayer(cpuplayer)
		CPU_SetDebugPlayer(cpuplayer, cpudebugplayer)
		CPU_SetDebugFlag(cpuplayer, 0 )
		cpudebugenabled = 1
	else
		print("AI Debug Toggled Off")
		UI_SetElementEnabled("GameBalanceScreen","CpuDebugFrame",0)
		UI_SetButtonText("GameBalanceScreen","toggleAIDebugButton","Enable CPU Debug")
		
		AIMenu_TurnOffAll()
		cpudebugenabled = 0
	end

end

function AIMenu_TurnOffAll()
		
	numPlayers = Universe_PlayerCount()

	for i=0,numPlayers-1 do
		CPU_SetDebugMode(i, 0)
	end

end

function AIMenu_SelectPlayer( _playerID )
	AIMenu_TurnOffAll()
	print("AI Debug Player: ".._playerID)
	CPU_SetDebug(_playerID, 1)
	CPU_SetDebugMode(_playerID, cpudebugmode)
	cpuplayer = _playerID
end



function AIMenu_UpdateCPUPlayerDropdown(_resetselection)
		
	numPlayers = Universe_PlayerCount()
	UI_ClearDropDownListbox("GameBalanceScreen","CpuDebugSelection")

	for i=0,numPlayers-1 do
		local text = i

		if(Universe_CurrentPlayer()==i) then
			text = text.." - Player"
		end

		UI_AddDropDownListboxItem("GameBalanceScreen","CpuDebugSelection", "Player"..i,text,i,"")
	end
	
	if(_resetselection==1) then
		UI_SelectDropDownListboxItemIndex("GameBalanceScreen","CpuDebugSelection",cpuplayer)
	end

end

function AIMenu_SetDebugMode( _mode )
	AIMenu_TurnOffAll()
	print("CpuPlayer: "..cpuplayer.." mode: ".._mode)
	CPU_SetDebug(cpuplayer, 1)
	CPU_SetDebugMode(cpuplayer, _mode)
	cpudebugmode = _mode
end

function AIMenu_ToggleLookAtPlayer()
		
	cpudebugplayer = cpudebugplayer + 1
	
	if (cpudebugplayer >= Universe_PlayerCount()) then
		cpudebugplayer = 0
	end
	
	print("CpuPlayer: "..cpuplayer.." analyzing: "..cpudebugplayer)
	UI_SetButtonText("GameBalanceScreen","toggleLookAtPlayer","Analyzing: "..cpudebugplayer.." >")
	CPU_SetDebugPlayer(cpuplayer, cpudebugplayer)
		
end


function AIMenu_ToggleAllFlags()
	local flags = CPU_GetDebugFlag(cpuplayer);
	if (flags > 0) then
		print("CpuPlayer: "..cpuplayer.." setting flags: "..0)
		UI_SetButtonText("GameBalanceScreen","toggleAllFlags","Toggle All Flags Off")
	
		CPU_SetDebugFlag(cpuplayer, 0);
	else
		print("CpuPlayer: "..cpuplayer.." setting flags: "..31)
		UI_SetButtonText("GameBalanceScreen","toggleAllFlags","Toggle All Flags On")
	
		CPU_SetDebugFlag(cpuplayer, 31);
	end
end