function Create_Hgn_Mothership(CustomGroup, playerIndex, shipID) 	
	if playerIndex == Universe_CurrentPlayer() then
		UI_SetElementSize("NewResearchMenu", "NonCombat", 0, 0);
	end
end

function Update_Hgn_Mothership(CustomGroup, playerIndex, shipID)	
	--SobGroup_CreateIfNotExist("hgn_mothership"..playerIndex)
	--SobGroup_Clear("hgn_mothership"..playerIndex)
	--SobGroup_SobGroupAdd("hgn_mothership"..playerIndex, CustomGroup)	
end