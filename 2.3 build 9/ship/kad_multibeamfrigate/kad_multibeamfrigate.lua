function updateKad_MultiBeamFrigate(CustomGroup, playerID, shipID) 
		if SobGroup_OwnedBy(CustomGroup) ~= 0 then
			-- Updated mission 8 uses the tactics to control attack.  If is in OffensiveROE (0) then attack.
			if (SobGroup_GetROE(CustomGroup) == 0) then
			    SobGroup_AttackPlayer(CustomGroup, 0)	
			end				
		end	
end