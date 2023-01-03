function Start_Kus_MissileDestroyer(CustomGroup, playerIndex, shipID)  
	print("volley")
	for w = 0,3,1 do 
		SobGroup_ChangePower(CustomGroup, "Weapon_Gun"..w, 0)
		SobGroup_ChangePower(CustomGroup, "Weapon_GunV"..w, 1)
	end	
end

function Do_Kus_MissileDestroyer(CustomGroup, playerIndex, shipID)  	
	
end

function Finish_Kus_MissileDestroyer(CustomGroup, playerIndex, shipID)	
	print("normal")
	for w = 0,3,1 do 
		SobGroup_ChangePower(CustomGroup, "Weapon_Gun"..w, 1)
		SobGroup_ChangePower(CustomGroup, "Weapon_GunV"..w, 0)
	end	
end

function Create_Kus_MissileDestroyer(CustomGroup, playerIndex, shipID)	
	--print("create")
	--for w = 0,3,1 do		
		--SobGroup_ChangePower(CustomGroup, "Weapon_GunV"..w, 0)
	--end	
end

function Update_Kus_MissileDestroyer(CustomGroup, playerIndex, shipID)	
	if SobGroup_IsDoingAbility(CustomGroup, AB_SpecialAttack) == 1 then
	  Decrease_Kus_MissileDestroyer_HPHealth(CustomGroup,"MissileBay",0.2)
	  if SobGroup_GetHardPointHealth(CustomGroup, "MissileBay") <= 0.2 then
			for w = 0,3,1 do		
				SobGroup_ChangePower(CustomGroup, "Weapon_GunV"..w, 0)				
				SobGroup_AbilityActivate(CustomGroup, AB_SpecialAttack, 0) 
			end	
		end	 
	else
		Increase_Kus_MissileDestroyer_HPHealth(CustomGroup,"MissileBay",0.2)
		if SobGroup_GetHardPointHealth(CustomGroup, "MissileBay") >= 0.8 then
			for w = 0,3,1 do		
				SobGroup_ChangePower(CustomGroup, "Weapon_GunV"..w, 1)
				SobGroup_AbilityActivate(CustomGroup, AB_SpecialAttack, 1)
			end	
		end	 
	end		
end

function Destroy_Kus_MissileDestroyer(CustomGroup, playerIndex, shipID)	
end

function Increase_Kus_MissileDestroyer_HPHealth(ship,hp,value)
	local hphealth = SobGroup_GetHardPointHealth(ship,hp)
	if hphealth <= 1-value then
		SobGroup_SetHardPointHealth(ship,hp,hphealth+value) 
	end
end

function Decrease_Kus_MissileDestroyer_HPHealth(ship,hp,value)
	local hphealth = SobGroup_GetHardPointHealth(ship,hp)
	if hphealth >= value then
		SobGroup_SetHardPointHealth(ship,hp,hphealth-value) 
	end
end