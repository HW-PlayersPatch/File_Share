dofilepath("data:scripts/playerspatch_ships_util.lua")

function Load_Tai_Mothership(playerIndex)	
	SobGroup_CreateIfNotExist("tai_mothership"..playerIndex)
	SobGroup_CreateIfNotExist("tai_production"..playerIndex)	
end

function Create_Tai_Mothership(CustomGroup, playerIndex, shipID) 		
	SobGroup_CreateIfNotExist("tai_mothership"..playerIndex)
	SobGroup_CreateIfNotExist("tai_production"..playerIndex)
	
	if playerIndex == Universe_CurrentPlayer() then
		UI_SetElementVisible("NewResearchMenu", "Platform", 0);
		UI_SetElementVisible("NewResearchMenu", "Utility", 0);
	end
end

function Update_Tai_Mothership(CustomGroup, playerIndex, shipID)	
	SobGroup_CreateIfNotExist("tai_mothership"..playerIndex)
	SobGroup_CreateIfNotExist("tai_production"..playerIndex)
	SobGroup_SobGroupAdd("tai_mothership"..playerIndex, CustomGroup)
	SobGroup_SobGroupAdd("tai_production"..playerIndex, CustomGroup)
	
	--preventing to have 2 research ship
	for i = 0,5,1 do
		res_ship_name = "tai_researchship"
		if i > 0 then res_ship_name = res_ship_name.."_"..i end
		if SobGroup_IsBuilding(CustomGroup, res_ship_name) == 1 then
			SobGroup_Create("other_production")
			SobGroup_FillSubstract("other_production", "tai_production"..playerIndex, CustomGroup)
			SobGroup_RestrictBuildOption("other_production", res_ship_name)
			SobGroup_Clear("other_production")
			break
		end
		
		if SobGroup_IsBuilding("tai_production"..playerIndex, res_ship_name) == 0 then
			SobGroup_UnRestrictBuildOption("tai_production"..playerIndex, res_ship_name)
		end
	end

	ShowProductionSubsystems(CustomGroup, playerIndex, "MS")
end

function Destroy_Tai_Mothership(CustomGroup, playerIndex, shipID)	
	
end