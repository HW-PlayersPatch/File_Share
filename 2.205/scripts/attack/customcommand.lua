

GravityWellGeneratorShipList = {"hgn_scout",
															 "hgn_interceptor",
															 "hgn_attackbomber",
															 "hgn_assaultcorvette",
															 "hgn_pulsarcorvette",
															 "hgn_minelayercorvette",
															 "vgr_scout",
															 "vgr_interceptor",
															 "vgr_lancefighter",
															 "vgr_bomber",
															 "kus_scout",
															 "kus_interceptor",
															 "kus_attackbomber",
															 "kus_defender",
															 "kus_cloakedfighter",
															 "kus_lightcorvette",
															 "kus_heavycorvette",
															 "kus_salvagecorvette",
															 "kus_repaircorvette",
															 "kus_multiguncorvette",
															 "kus_minelayercorvette",
															 "tai_scout",
															 "tai_interceptor",
															 "tai_attackbomber",
															 "tai_defender",
															 "tai_defensefighter",
															 "tai_lightcorvette",
															 "tai_heavycorvette",
															 "tai_salvagecorvette",
															 "tai_repaircorvette",
															 "tai_multiguncorvette",
															 "tai_minelayercorvette",--32
															}

function startGravityWell(CustomGroup, playerIndex, shipID)
    print("startGravityWell: "..CustomGroup.." containing player "..playerIndex.."ship"..shipID)
	SobGroup_Create("gravitywellgenerators_ships")		
	local playerIndex = 0
	while playerIndex < Universe_PlayerCount() do
		if Player_IsAlive(playerIndex) == 1 then
			if Player_HasShipWithBuildQueue(playerIndex) == 1 then
				for i = 1,getn(GravityWellGeneratorShipList),1 do
					SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, GravityWellGeneratorShipList[i])
					SobGroup_SobGroupAdd("gravitywellgenerators_ships", "temp")
				end
			end
		end
		playerIndex = playerIndex + 1
	end
end

function updateGravityWell(CustomGroup, playerIndex, shipID)
    print("updateGravityWell: "..CustomGroup)
	SobGroup_TakeDamage(CustomGroup, 0.011)
	FX_StartEvent(CustomGroup, "PowerUp")
	local distance = 6500
	local modifier = 0.8
	for k = 1,6,1 do
		if SobGroup_FillProximitySobGroup ("temp", "gravitywellgenerators_ships", CustomGroup, distance) == 1 then
			SobGroup_SetSpeed("temp", modifier)
			--SobGroup_SetMaxSpeedMultiplier("temp", modifier)
			FX_StartEvent("temp", "PowerOff")
		end
		distance = distance - 950
		modifier = modifier - 0.155
	end
end

function finishGravityWell(CustomGroup, playerIndex, shipID)
    print("finishGravityWell: "..CustomGroup)
end
