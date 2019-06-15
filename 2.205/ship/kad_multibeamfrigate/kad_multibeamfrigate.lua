function updateKad_MultiBeamFrigate(CustomGroup, playerID, shipID) 
		if SobGroup_OwnedBy(CustomGroup) ~= 0 then	
			SobGroup_AttackPlayer(CustomGroup, 0)	
		end	
end