dofilepath("data:scripts/playerspatch_ships_util.lua")

function Load_Kus_Carrier(playerIndex)
	SobGroup_CreateIfNotExist("kus_carrier"..playerIndex)
	SobGroup_CreateIfNotExist("kus_production"..playerIndex)
end

function Create_Kus_Carrier(CustomGroup, playerIndex, shipID) 	
	SobGroup_CreateIfNotExist("kus_carrier"..playerIndex)
	SobGroup_CreateIfNotExist("kus_production"..playerIndex)
	
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kus_mothership") == 0 then
		if playerIndex == Universe_CurrentPlayer() then
			UI_SetElementVisible("NewResearchMenu", "Platform", 0);
			UI_SetElementVisible("NewResearchMenu", "Utility", 0);
		end
	end
end

function Update_Kus_Carrier(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("kus_carrier"..playerIndex)
	SobGroup_CreateIfNotExist("kus_production"..playerIndex)
	SobGroup_SobGroupAdd("kus_carrier"..playerIndex, CustomGroup)
	SobGroup_SobGroupAdd("kus_production"..playerIndex, CustomGroup)
	
	--preventing to have 2 research ship
	for i = 0,5,1 do
		res_ship_name = "kus_researchship"
		if i > 0 then res_ship_name = res_ship_name.."_"..i end
		if SobGroup_IsBuilding(CustomGroup, res_ship_name) == 1 then
			SobGroup_Create("other_production")
			SobGroup_FillSubstract("other_production", "kus_production"..playerIndex, CustomGroup)
			SobGroup_RestrictBuildOption("other_production", res_ship_name)
			SobGroup_Clear("other_production")
			break
		end
		
		if SobGroup_IsBuilding("kus_production"..playerIndex, res_ship_name) == 0 then
			SobGroup_UnRestrictBuildOption("kus_production"..playerIndex, res_ship_name)
		end
	end

	NoSalvageScuttle(CustomGroup, playerIndex, shipID)

	ShowProductionSubsystems(CustomGroup, playerIndex, "CC")
end

function Destroy_Kus_Carrier(CustomGroup, playerIndex, shipID)	
	
end
