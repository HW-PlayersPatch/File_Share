dofilepath("data:scripts/playerspatch_ships_util.lua")

function Load_Kus_Mothership(playerIndex)	
	SobGroup_CreateIfNotExist("kus_mothership"..playerIndex)
	SobGroup_CreateIfNotExist("kus_production"..playerIndex)
end

function Create_Kus_Mothership(CustomGroup, playerIndex, shipID)  	
	SobGroup_CreateIfNotExist("kus_mothership"..playerIndex)
	SobGroup_CreateIfNotExist("kus_production"..playerIndex)
	
	if playerIndex == Universe_CurrentPlayer() then
		UI_SetElementVisible("NewResearchMenu", "Platform", 0);
		UI_SetElementVisible("NewResearchMenu", "Utility", 0);
	end
end

function Update_Kus_Mothership(CustomGroup, playerIndex, shipID)		
	SobGroup_CreateIfNotExist("kus_mothership"..playerIndex)
	SobGroup_CreateIfNotExist("kus_production"..playerIndex)
	SobGroup_SobGroupAdd("kus_mothership"..playerIndex, CustomGroup)
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
	
	
	--SP
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(-1, "Special_Splitter" ) == 0 then		
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 0)
		SobGroup_AbilityActivate(CustomGroup, AB_Dock, 0)				
		--btn hyperspace
		if UI_IsNamedElementVisible("NewTaskbar", "btnHW1SPHyperspace") == 1 then		
			--SobGroup_AbilityActivate("Player_Ships0", AB_Hyperspace, 1)
		else
			SobGroup_AbilityActivate("Player_Ships0", AB_Hyperspace, 0)
		end	
	else
		SobGroup_AbilityActivate(CustomGroup, AB_Move, 1)
		SobGroup_AbilityActivate(CustomGroup, AB_Dock, 1)	
	end

	ShowProductionSubsystems(CustomGroup, playerIndex, "MS")
end

function Destroy_Kus_Mothership(CustomGroup, playerIndex, shipID)	
		
end