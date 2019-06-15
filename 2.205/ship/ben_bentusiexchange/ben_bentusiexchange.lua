function Update_Ben_BentusiExchange(CustomGroup, playerIndex, shipID)			
	--SobGroup_AbilityActivate(CustomGroup, AB_Attack, 0)
	--SobGroup_AbilityActivate(CustomGroup, AB_Move, 0)
    --setting the Bentusi to passiveTactics means they will not retaliate, but they can still attack if they want to
    SobGroup_SetROE(CustomGroup, PassiveROE)
end