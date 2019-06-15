function Update_Drone0(CustomGroup, playerIndex, shipID)
	SobGroup_CreateIfNotExist("dronefrigate_temp")
	SobGroup_Clear("dronefrigate_temp")
	SobGroup_FillShipsByType("dronefrigate_temp", "Player_Ships"..playerIndex, "kus_dronefrigate")
	if SobGroup_FillProximitySobGroup ("temp", "dronefrigate_temp", CustomGroup, 1000) == 0 then
		SobGroup_TakeDamage(CustomGroup, 1)
	end
end