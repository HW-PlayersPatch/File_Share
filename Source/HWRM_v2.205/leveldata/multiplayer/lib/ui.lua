function UI_init()		
	UI_SetElementVisible("NewTaskbar", "btnObjectives", 1)
  UI_SetElementVisible("NewTaskbar", "btnRecall", 1)	
	Rule_Remove("UI_init")
end

Stats_ChallengesRUs = {0,0,0,0,0,0,0,0}
Stats_RelicsRUs = {0,0,0,0,0,0,0,0}
Stats_RUInjectionRUs = {0,0,0,0,0,0,0,0}		
Stats_BountiesRUs = {0,0,0,0,0,0,0,0}	
Stats_CratesRUs = {0,0,0,0,0,0,0,0}

function UI_updating()

end