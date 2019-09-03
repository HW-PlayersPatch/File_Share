dofilepath("data:scripts/playerspatch_ships_util.lua")

function Create_Vgr_Carrier(CustomGroup, playerIndex, shipID)  
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") == 0 then
		if playerIndex == Universe_CurrentPlayer() then
			UI_SetElementVisible("NewResearchMenu", "NonCombat", 0);
		end
	end
end

function Update_Vgr_Carrier(CustomGroup, playerIndex, shipID)	  
	--SobGroup_CreateIfNotExist("vgr_carrier"..playerIndex)	
	--SobGroup_Clear("vgr_carrier"..playerIndex)
	--SobGroup_SobGroupAdd("vgr_carrier"..playerIndex, CustomGroup)	
	NoSalvageScuttle(CustomGroup, playerIndex, shipID)
end
