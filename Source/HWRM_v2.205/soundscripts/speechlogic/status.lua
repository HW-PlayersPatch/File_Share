--========================================
-- lua functions for generating speech for status events
-- functions available from the game:
--	getFamily(shipName)						- return the DisplayFamily for shipName (displayFamily defined in data\scripts\FamilyList.lua) in uppercase
--	playSpeechActor(speechName)					- speechName is the name of the all ships speech to play without path up to the _ 
--											  (so to play one of data/sound/speech/AllShips/CHATTER_CarrierOrMShipConstruction_1.mp3 
--											   to data/sound/speech/AllShips/CHATTER_CarrierOrMShipConstruction_1.mp3 you'd use 
--											   "CHATTER_CarrierOrMShipConstruction")
--	playSpeechActor(speechName, frequency)	- speechName - same as above
--									- frequency is the minimum amount of time, in seconds, before this event will be played again.
--========================================

g_default_frequency = 10.0
g_low_frequency = 30.0



-- Number of Actors per Actor type   - - defined in commands.lua
-- Text for Actor folder names   - - defined in commands.lua
--function getType(shipnm)   - - defined in commands.lua
--function raceHelper()   - - defined in commands.lua


--------- START CHATTER-specific functions

--codes
CD_MissileIncoming = 1
CD_DefenseFieldFound = 2
CD_CapturedAtUnitCap = 3
CD_CaptureHalfway = 4
CD_CaptureStarted = 5
--~ CD_StrikeGroupDisband = 6
--~ CD_StrikeGroupFormChange = 7
CD_ShipArrived = 8
CD_ShipSpotted = 9
CD_ShipEmergingFromHyperpace = 10
CD_EnemyCaptureStarted = 11
CD_EnteredInhibitorVolume = 14

-- timeout values for speech events
Frequency_Command = 0.5
Frequency_Status = 2.0
Frequency_Chatter = 5.0

function ChatterMisc(shipnm,parm2,code)

	--print("******* ChatterMisc! shipnm="..shipnm..", parm2="..parm2..", code="..code)

	shiptype = getType(shipnm)
	
	genericshipnm = strsub(shipnm,5)

	if (code==CD_MissileIncoming and shiptype==Capital) then -- only if the victim is a Capital ship
		--in this case, parm2 is the Ship that fired the missile. Only these 2 type of ships apply
		if (parm2=="Hgn_TorpedoFrigate" or parm2=="Hgn_TorpedoFrigateElite" or parm2=="Hgn_Destroyer") then
			playSpeechActor("STATUS_CapitalShipTorpedoHit_Report",NameCapPilot,NumCapPilots, Frequency_Status)
		end
	elseif(code==CD_DefenseFieldFound) then
		playSpeechActor("STATUS_ATTACKINGTARGETINSIDEDEFENSEFIELD_1",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (code==CD_EnteredInhibitorVolume) then
		playSpeechActor("STATUS_HyperSpaceInhib_Detected", NameSupportPilot, NumSupportPilots, Frequency_Command)
	end
end

function ChatterMiscHighPriority(shipnm,parm2,code)

	--print("******* ChatterMiscHighPriority - shipnm="..shipnm..", parm2="..parm2..", code="..code)

	shiptype = getType(shipnm)
	
	genericshipnm = strsub(shipnm,5)

	if(code==CD_CapturedAtUnitCap) then
		if (shipnm=="Hgn_MarineFrigate") then
			playSpeechActor("STATUS_MARINEFRIGATE_SUCCESS_CAPFULL",NameMarinePilot,NumMarinePilots, Frequency_Command)
		else
			playSpeechActor("STATUS_INFILTRATORFRIGATE_SUCCESS_CAPFULL",NameInfiltratorPilot,NumInfiltratorPilots, Frequency_Command)
		end
	elseif(code==CD_CaptureHalfway) then
		if (shipnm=="Hgn_MarineFrigate") then
			playSpeechActor("CHATTER_MARINEFRIGATE_50PERCENT",NameMarinePilot,NumMarinePilots, Frequency_Command)
		else
			playSpeechActor("CHATTER_INFILTRATORFRIGATE_50PERCENT",NameInfiltratorPilot,NumInfiltratorPilots, Frequency_Command)
		end
	elseif(code==CD_CaptureStarted) then
		if (shipnm=="Hgn_MarineFrigate") then
			playSpeechActor("CHATTER_MARINEFRIGATE_BEGIN",NameMarinePilot,NumMarinePilots, Frequency_Command)
		else
			playSpeechActor("CHATTER_INFILTRATORFRIGATE_BEGIN",NameInfiltratorPilot,NumInfiltratorPilots, Frequency_Command)
		end
	elseif(code==CD_EnemyCaptureStarted) then
	
		if (genericshipnm=="Carrier") then
			playSpeechActor("STATUS_EnemyMarineFrigateAttack_Carrier_1",raceHelper(),0, Frequency_Command)
		elseif (genericshipnm=="Destroyer") then
			playSpeechActor("STATUS_EnemyMarineFrigateAttack_Destroyer_1",raceHelper(),0, Frequency_Command)
		elseif (strupper(genericshipnm)=="BATTLECRUISER") then
			playSpeechActor("STATUS_EnemyMarineFrigateAttack_Battlecruiser_1",raceHelper(),0, Frequency_Command)
		elseif (genericshipnm=="MotherShip") then
			playSpeechActor("STATUS_EnemyMarineFrigateAttack_Mothership_1",raceHelper(),0, Frequency_Command)
		elseif (genericshipnm=="Shipyard") then
			playSpeechActor("STATUS_EnemyMarineFrigateAttack_Shipyard_1",raceHelper(),0, Frequency_Command)
		elseif (genericshipnm=="Dreadnaught") then
			playSpeechActor("STATUS_EnemyMarineFrigateAttack_Dreadnaught_1",raceHelper(),0, Frequency_Command)
		elseif (shiptype==Frigate) then
			playSpeechActor("STATUS_EnemyMarineFrigateAttack_Frigate_1",raceHelper(),0, Frequency_Command)
		end

	elseif(code==CD_ShipArrived and genericshipnm=="Probe") then
		playSpeechActor("STATUS_ProbeArrived",raceHelper(),0, Frequency_Command)
	elseif(code==CD_ShipArrived and genericshipnm=="Probe_ECM" or genericshipnm=="ECMProbe") then
		playSpeechActor("STATUS_EMPProbeArrived_1",raceHelper(),0, Frequency_Command)	
	elseif(code==CD_ShipArrived and genericshipnm=="HSInhibitor") then
		playSpeechActor("STATUS_InhibitorProbeArrived_1",raceHelper(),0, Frequency_Command)
	elseif(code==CD_ShipEmergingFromHyperpace) then
		playSpeechActor("STATUS_HyperspaceUnitEmerging_1",raceHelper(),0, Frequency_Command)
	elseif(code==CD_ShipSpotted and genericshipnm=="Probe") then
		if (parm2 == "c") then
			playSpeechActor("STATUS_ProximityProbeWarning_1",raceHelper(),0, Frequency_Command)
		else
			playSpeechActor("STATUS_ProbeDetected",raceHelper(),0, Frequency_Command)
		end
	end

end

 

attackMap = {}
attackMap["STRIKE"] = {"STATUS_StrikeGroup_UnderAttack", NameAllPilot,NumAllPilots}

attackMap["Hgn_ResourceController"] = {"STATUS_ResourceControllerUnderAttack", NameSupportPilot, NumSupportPilots}

attackMap["Hgn_Interceptor"] = {"STATUS_Int_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Hgn_AttackBomber"] = {"STATUS_Bomb_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Hgn_AssaultCorvette"] = {"STATUS_Corvette_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Hgn_MinelayerCorvette"] = {"STATUS_Minelayer_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Hgn_MarineFrigate"] = {"STATUS_MarineFrigate_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Hgn_TorpedoFrigate"] = {"STATUS_TorpFrigate_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Hgn_IonCannonFrigate"] = {"STATUS_IonFrigate_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Hgn_DefenseFieldFrigate"] = {"STATUS_DDFrigate_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Hgn_SupportFrigate"] = {"STATUS_SupportFrigate_Under_Attack", NameSupportPilot,NumSupportPilots}
attackMap["Hgn_Destroyer"] = {"STATUS_Destroyer_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Hgn_Battlecruiser"] = {"STATUS_Battlecruiser_Attack", NameCapPilot,NumCapPilots}
attackMap["Hgn_Shipyard"] = {"STATUS_Shipyard_Under_Attack", NameSupportPilot,NumSupportPilots}
attackMap["Vgr_Interceptor"] = {"STATUS_V_Int_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Vgr_Crusader"] = {"STATUS_V_Crusader_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Vgr_LanceFighter"] = {"STATUS_V_LanceFighter_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Vgr_Bomber"] = {"STATUS_V_Bomb_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Vgr_LaserCorvette"] = {"STATUS_V_LaserCorvette_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Vgr_MissileCorvette"] = {"STATUS_V_MissileCorvette_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Vgr_MinelayerCorvette"] = {"STATUS_V_Minelayer_Under_Attack", NameFighterPilot, NumFighterPilots}
attackMap["Vgr_CommandCorvette"] = {"STATUS_COMMANDCorvette_Under_Attack", NameCapPilot,NumCapPilots}
--attackMap["Vgr_AssaultFrigate"] = {"STATUS_V_AssF_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Vgr_InfiltratorFrigate"] = {"STATUS_V_InfFrigate_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Vgr_HeavyMissileFrigate"] = {"STATUS_V_HMFrigate_Under_Attack", NameCapPilot,NumCapPilots}
attackMap["Vgr_TransportFrigate"] = {"STATUS_V_SupportFrigate_Under_Attack", NameSupportPilot,NumSupportPilots}
attackMap["Vgr_Destroyer"] = {"STATUS_V_Destroyer_Under_Attack",  NameCapPilot,NumCapPilots}
attackMap["Vgr_Battlecruiser"] = {"STATUS_V_Battlecruiser_Attack",  NameCapPilot,NumCapPilots}
attackMap["Vgr_ShipYard"] = {"STATUS_V_Shipyard_Under_Attack", NameSupportPilot,NumSupportPilots}

attackMapFC = {}
attackMapFC["Hgn_Destroyer"] = "STATUS_DestoryerUnderAttack_0"
attackMapFC["Hgn_Carrier"] = "STATUS_CarrierUnderAttack_1"
attackMapFC["Hgn_Battlecruiser"] = "STATUS_BattlecruiserUnderAttack_1"
attackMapFC["Hgn_Shipyard"] = "STATUS_ShipyardUnderAttack_1"

attackMapMak = {}
attackMapMak["Vgr_Destroyer"] = "STATUS_DestoryerUnderAttack_0"
attackMapMak["Vgr_Carrier"] = "STATUS_CarrierUnderAttack_1"
attackMapMak["Vgr_Battlecruiser"] = "STATUS_BattlecruiserUnderAttack_1"
attackMapMak["Vgr_Shipyard"] = "STATUS_ShipyardUnderAttack_1"

FC_OVERRIDE_DISTSQR = 2000

function StatusUnderAttack(shipnm, enemy, attackcode)

	print("****** StatusUnderAttack: shipnm, enemy, attackcode = {"..shipnm..","..enemy..","..attackcode.."}")
	
	if (attackcode > FC_OVERRIDE_DISTSQR) then
		if (currentRace == Vaygr) then
			if (attackMapMak[""..shipnm] ~= nil) then
				playSpeechActor(attackMapMak[""..shipnm],NameMakaan,0, Frequency_Status)
				return
			end
		else
			if (attackMapFC[""..shipnm] ~= nil) then
				playSpeechActor(attackMapFC[""..shipnm],NameFleetCommand,0, Frequency_Status)
				return
			end
		end
	end

	if (attackMap[""..shipnm] ~= nil) then
		playSpeechActor(attackMap[""..shipnm][1], attackMap[""..shipnm][2], attackMap[""..shipnm][3], Frequency_Status)
		return
	end
	
	--check family
	shiptype = getType(shipnm)
	
	if (shiptype==Frigate) then
		playSpeechActor("STATUS_Frigate_Under_Attack",NameCapPilot,NumCapPilots, Frequency_Status)
	elseif (shipType==SubSystem) then
		playSpeechActor("STATUS_GenericSubsystemUnderAttack",NameCapPilot,NumCapPilots, Frequency_Status)
	elseif (shipType==Resource) then
		playSpeechActor("STATUS_ResourcePocketEnemiesDetected_1",NameSupportPilot, NumSupportPilots, Frequency_Status)
	else
		playSpeechActor("STATUS_V_GENERIC_UNDER_ATTACK",NameCapPilot,NumCapPilots, Frequency_Status)
	end

end


--------- END CHATTER-specific functions

AggressiveTactics = 0
DefensiveTactics = 1
PassiveTactics = 2

function StatusRetaliating(retaliatingShipName, currentTactics)

	if (currentTactics == AggressiveTactics) then
		playSpeechActor("STATUS_GenericGroupUnderAttackRetaliate_Aggressive",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (currentTactics == DefensiveTactics) then
		playSpeechActor("STATUS_GenericGroupUnderAttackRetaliate_Defensive",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (currentTactics == PassiveTactics) then
		playSpeechActor("STATUS_GenericGroupUnderAttackRetaliate_Passive",NameAllPilot,NumAllPilots, Frequency_Status)
	end
end



function StatusUnderFireNeedOrders(underFireShipName, targetShipName, groupNumber)
	if(groupNumber == -1) then
		playSpeechActor("STATUS_GenericGroupUnderAttack_Report",NameAllPilot,NumAllPilots, Frequency_Status)
	else
		playSpeechActor("STATUS_AssignedGroupUnderAttack_Report_G"..groupNumber, raceHelper(), 0, Frequency_Status)
	end
end

MAX_CAMERA = 5000 -- beyond this distance, FLEETCOMMAND will inform player

function StatusCaptureComplete(shipnm, targetnm, cameradistance)

	
	shipType = getType(targetnm)
	generictargetnm = strsub(targetnm,5)

	if (cameradistance > MAX_CAMERA) then
		if (generictargetnm == "Destroyer") then
			playSpeechActor("STATUS_EnemyDestroyerCaptured_1",raceHelper(),0, Frequency_Status)
		elseif(generictargetnm == "Shipyard") then
			playSpeechActor("STATUS_EnemyShipyardCaptured_1",raceHelper(),0, Frequency_Status)
		elseif(shipType == Frigate) then
			playSpeechActor("STATUS_EnemyFrigateCaptured_1",raceHelper(),0, Frequency_Status)
		elseif(generictargetnm == "Carrier") then
			playSpeechActor("STATUS_EnemyCarrierCaptured_1",raceHelper(),0, Frequency_Status)
		elseif(generictargetnm == "Battlecruiser") then
			playSpeechActor("STATUS_EnemyBattlecrusierCaptured_1",raceHelper(),0, Frequency_Status)
		else
			if (currentRace == Hiigaran) then
				playSpeechActor("STATUS_MarineFrigate_Success",NameMarinePilot,NumMarinePilots, Frequency_Status)
			elseif (currentRace == Vaygr) then
				playSpeechActor("STATUS_InfiltratorFrigate_Success",NameInfiltratorPilot,NumInfiltratorPilots, Frequency_Status)
			end	
		end
	else
		if (currentRace == Hiigaran) then
			playSpeechActor("STATUS_MarineFrigate_Success",NameMarinePilot,NumMarinePilots, Frequency_Status)
		elseif (currentRace == Vaygr) then
			playSpeechActor("STATUS_InfiltratorFrigate_Success",NameInfiltratorPilot,NumInfiltratorPilots, Frequency_Status)
		end	
	end


end

function StatusInMineField(underFireShipName, groupNumber)
	if(groupNumber == -1) then
		if (underFireShipName=="STRIKE") then
			playSpeechActor("STATUS_StrikeGroup_InMines",NameAllPilot,NumAllPilots, Frequency_Status)
		else
			playSpeechActor("STATUS_GenericGroupInMineField",NameAllPilot,NumAllPilots, Frequency_Status)

		end
	else
	-- can't find this event in new speech
		mineAttackSnd = "STATUS_GROUP"
		if (groupNumber < 10) then
			mineAttackSnd = mineAttackSnd.."0"
		end
		mineAttackSnd = mineAttackSnd..groupNumber.."_INMINEFIELD"
		playSpeechActor(mineAttackSnd, NameAllPilot,NumAllPilots, Frequency_Status)
	end
end

function StatusAttackComplete(shipName, groupnum)
	--if(getFamily(shipName) == "FIGHTER") then
	--	playSpeechActor("STATUS_StrikeCraftAttackComplete", g_default_frequency)
	--end
	--playSpeechActor("STATUS_ ATTACKCOMPLETE",NameAllPilot,NumAllPilots)
	if (groupnum==-1) then
		playSpeechActor("CHATTER_GenericGroupBattleWon_Report",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (groupnum<0) then
		playSpeechActor("STATUS_AttackComplete",NameAllPilot,NumAllPilots, Frequency_Status)
	else
		grpWonSnd = "STATUS_HotkeyGroup_Victory_"
		if (groupnum < 10) then
			grpWonSnd = grpWonSnd.."0"
		end
		playSpeechActor(grpWonSnd..groupnum,raceHelper(),0, Frequency_Status)
	end
end

-- DEFINED IN TABLE (see Chatter.lua)
--~ function StatusCaptureComplete(capturingName, capturedName)
--~ 	playSpeechActor("STATUS_MarineFrigate_Success", g_default_frequency)
--~ end

-- DEFINED IN TABLE (see Chatter.lua)
--~ function StatusCaptureFailed(capturingName, capturedName)
--~ 	-- can't find this event in new speech
--~ 	playSpeechActor("STATUS_MarineFrigate_Failure", g_default_frequency)
--~ end

StartingRepairs = 0
WorkingOnRepairs = 1
FinishedRepairs = 2

function StatusRepairs(shipName, targetName, repairStatus)
	if(repairStatus == StartingRepairs) then
	-- can't find this event in new speech
		playSpeechActor("COMMAND_StartedRepairs", NameSupportPilot, NumSupportPilots, Frequency_Status)
	elseif(repairStatus == FinishedRepairs) then
		playSpeechActor("STATUS_FinishedRepairs",  NameSupportPilot, NumSupportPilots, Frequency_Status)
	end
end

function StatusShipDestroyed(shipName, code)

	print("**** StatusShipDestroyed: shipName ="..shipName..", and code = "..code)


	if (code > 0) then
		if (code==10) then
			playSpeechActor("STATUS_HOTKEYGROUP_DEFEAT_10", raceHelper(),0, Frequency_Command)
		else
			playSpeechActor("STATUS_HOTKEYGROUP_DEFEAT_0"..code, raceHelper(),0, Frequency_Command)
		end
		
		return
	
	end
	
	--familyName = getFamily(shipName)
	shipType = getType(shipName)
	
	genericshipnm = strsub(shipName,5)
	
	
	--print("**** StatusShipDestroyed: genericshipnm="..genericshipnm)
	--print("**** StatusShipDestroyed: shipType ="..shipType)
	
	if (genericshipnm=="ResourceController") then
		playSpeechActor("STATUS_MobileRefineryDies_1", raceHelper(),0, Frequency_Command)
	elseif(genericshipnm=="Destroyer") then
		playSpeechActor("STATUS_DestroyerDies_1", raceHelper(),0, Frequency_Command)
	elseif(genericshipnm=="Carrier") then
		playSpeechActor("STATUS_CarrierDies_1", raceHelper(),0, Frequency_Command)
	elseif(genericshipnm=="Shipyard") then
		playSpeechActor("STATUS_ShipyardDies_1", raceHelper(),0, Frequency_Command)
	elseif(genericshipnm=="Battlecruiser") then
		playSpeechActor("STATUS_BattlecruiserDies_1", raceHelper(),0, Frequency_Command)
	elseif (shipType==Frigate) then
		playSpeechActor("STATUS_FrigateDies_1", raceHelper(), 0, Frequency_Command)
	elseif(shipType == Capital) then
		playSpeechActor("STATUS_CapitalShipDies", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(shipType == SubSystem) then --vary between 2 files
		
		RAND_SWITCH = 1 - RAND_SWITCH
		
		if (RAND_SWITCH == 1) then
			playSpeechActor("STATUS_SubsystemDestroyed_2", raceHelper(),0, Frequency_Command)
		else
			playSpeechActor("STATUS_SubsystemDestroyed", NameCapPilot,NumCapPilots, Frequency_Command)
		end
		
	elseif(genericshipnm == "ResourceCollector") then
		playSpeechActor("STATUS_ResourceCollectorDestroyed_Report", raceHelper(),0, Frequency_Command)
	end
end


-- DEFINED IN TABLE (see Chatter.lua)
--~ function StatusCollectorFull(shipName)
--~ 	playSpeechActor("CHATTER_ResourceCollectorFull", g_low_frequency)
--~ end

-- DEFINED IN TABLE (see Chatter.lua)
--~ function StatusResourcesTransferred(shipName)
--~ 	playSpeechActor("CHATTER_ResourceCollectorResourcesTransferred", g_low_frequency)
--~ end

function StatusShipDocked(shipName, dockedWithName)
	--dockedShipFamily = getFamily(shipName)
	shipType = getType(shipName)
	if(shipType == Frigate or shipType == Capital) then
		playSpeechActor("STATUS_CapitalShipsShipDocked", NameCapPilot,NumCapPilots, Frequency_Status)
	else
		playSpeechActor("CHATTER_AnyShipDocking", NameSupportPilot, NumSupportPilots, Frequency_Status)
	end
end

TOOLOW = 0.28

function StatusTakingLightDamage(shipName, healthpercentage)

	print(" *** StatusTakingLightDamage: name = "..shipName.." Health = "..healthpercentage)

	if (healthpercentage < TOOLOW) then
		return
	end
	
	genericShipName = strsub(shipName,5)

	--familyName = getFamily(shipName)
	shipType = getType(shipName)
	-- checking shipName b/c family(Mothership) returns "CAPITAL"
	if(shipName == "Vgr_MotherShip" or shipName=="Hgn_MotherShip") then
		playSpeechActor("STATUS_MothershipUnderSmallAttack_Report", raceHelper(), 0, Frequency_Command)
	elseif(shipType ==Frigate or shipType == Capital) then
		-- link these two (CHATTER_CAPITALSHIPSMALLHITS_RESPONSE)
		playSpeechActorLinked( "CHATTER_CapitalShipSmallHits_Query",raceHelper(), 0, CE_CHT_SMALLHITRESPONSE, Frequency_Command)
	elseif(genericShipName == "ResourceController") then
		playSpeechActor("STATUS_ResourceControllerDamaged",NameSupportPilot, NumSupportPilots, Frequency_Command)
	elseif (genericShipName == "ResourceCollector") then
		playSpeechActor("STATUS_ResourceCollectorDamaged",NameSupportPilot, NumSupportPilots, Frequency_Command)		
	end
end

function StatusTakingHeavyDamage(shipName)

	print(" *** StatusTakingHeavyDamage: "..shipName)
	
	--familyName = getFamily(shipName)
	shipType = getType(shipName)
	
	genericShipName = strsub(shipName,5)
	
	-- checking shipName b/c family(Mothership) returns "CAPITAL"
	if(shipName == "Vgr_MotherShip" or shipName=="Hgn_MotherShip") then
		playSpeechActor("STATUS_MothershipUnderLargeAttack_Report", raceHelper(), 0, Frequency_Command)
	elseif(shipType == Fighter) then
		playSpeechActor("CHATTER_StrikeCraftDamaged",NameFighterPilot, NumFighterPilots, Frequency_Command)
	elseif(shipType == Frigate or shipType == Capital) then
		-- can't find in new speech
		--playSpeechActor("STATUS_CapitalShipLargeHit_Response", 30)
		playSpeechActor("STATUS_CapitalShip_Damaged_Report", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(genericShipName == "ResourceController") then
		playSpeechActor("STATUS_ResourceControllerDamaged",NameSupportPilot, NumSupportPilots, Frequency_Command)
	elseif (genericShipName == "ResourceCollector") then
		playSpeechActor("STATUS_ResourceCollectorDamaged",NameSupportPilot, NumSupportPilots, Frequency_Command)				
	end
end

RAND_SWITCH = 0

function StatusDamaged(shipName)

	print(" *** StatusDamaged: "..shipName)
	
	--familyName = getFamily(shipName)
	shipType = getType(shipName)
	
	genericShipName = strsub(shipName,5)
	
	RAND_SWITCH = 1 - RAND_SWITCH

	if (genericShipName == "SupportFrigate") then
		playSpeechActor("STATUS_SUPPORTDAMAGED_REPORT_1",NameSupportPilot, NumSupportPilots, Frequency_Command)
	elseif(genericShipName == "Carrier") then
		playSpeechActor("STATUS_CarrierDamaged_Report_1",NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(genericShipName == "Battlecruiser") then
		playSpeechActor("STATUS_BattlecruiserDamaged_Report_1",NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(genericShipName == "IonCannonFrigate") then
		playSpeechActor("STATUS_IonCannonFrigateDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(genericShipName == "AssaultFrigate") then
		playSpeechActor("STATUS_AssaultFrigateDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(genericShipName == "Dreadnaught") then
		playSpeechActor("STATUS_DreadnaughtDamaged_Report_1",NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(genericShipName == "TorpedoFrigate") then
		playSpeechActor("STATUS_TorpedoFrigateDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif(genericShipName == "ResourceController") then
		playSpeechActor("STATUS_ResourceControllerDamaged",NameSupportPilot, NumSupportPilots, Frequency_Command)
--~ 		if (RAND_SWITCH==1) then
--~ 			playSpeechActor("STATUS_ResourceControllerDamaged_1", raceHelper(), 0, Frequency_Command)
--~ 		else -- this speech actually says: Mobile Refinery under attack
--~ 			playSpeechActor("STATUS_ResourceCollectorDamaged_1", raceHelper(), 0, Frequency_Command)
--~ 		end
	elseif (genericShipName == "ResourceCollector") then
		playSpeechActor("STATUS_ResourceCollectorDamaged",NameSupportPilot, NumSupportPilots, Frequency_Command)
	elseif (genericShipName == "MarineFrigate") then
		playSpeechActor("STATUS_MarineFrigateDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif (genericShipName == "DefenseFieldFrigate") then
		playSpeechActor("STATUS_DefenseFieldFrigateDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif (genericShipName == "Destroyer") then
		playSpeechActor("STATUS_DestroyerDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif (genericShipName == "Shipyard") then
		playSpeechActor("STATUS_ShipyardDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif (genericShipName == "CommandCorvette") then
		playSpeechActor("STATUS_VCOMMANDDAMAGED_REPORT_1",NameSupportPilot, NumSupportPilots, Frequency_Command)
	elseif (shipName == "Vgr_InfiltratorFrigate") then
		playSpeechActor("STATUS_VINFILTRATORDAMAGED_REPORT_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif (genericShipName == "HeavyMissileFrigate") then
		playSpeechActor("STATUS_VMissilefrigDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif (genericShipName == "TransportFrigate") then
		playSpeechActor("STATUS_VTransportDamaged_Report_1", NameCapPilot,NumCapPilots, Frequency_Command)
	elseif (genericShipName == "HyperSpace_Platform") then
		playSpeechActor("STATUS_VHYPERGATEDAMAGED_REPORT_1", NameSupportPilot, NumSupportPilots, Frequency_Command)
	--generic fighter ship damage report
	elseif(shipType == Fighter) then
		playSpeechActor("CHATTER_StrikeCraftDamaged",NameFighterPilot, NumFighterPilots, Frequency_Command)
	--generic capital ship damage report
	elseif(shipType == Capital or shipType == Frigate) then
		playSpeechActor("STATUS_CapitalShip_Damaged_Report", NameCapPilot,NumCapPilots, Frequency_Command)
	end
end


function StatusResources(shipname, actionType)
	
	if (actionType==1) then
		playSpeechActor("STATUS_RESOURCEPOCKETEXHAUSTEDGOINGTONEXTPOCKET_1",NameSupportPilot,NumSupportPilots, Frequency_Status)
	elseif (actionType==2) then
		playSpeechActor("STATUS_RESOURCEPOCKETENEMIESDETECTED_1",NameSupportPilot,NumSupportPilots, Frequency_Status)
	elseif (actionType==3) then
		playSpeechActor("STATUS_RESOURCEPOCKETEXHAUSTEDGOINGIDLE_1",NameSupportPilot,NumSupportPilots, Frequency_Status)
	elseif (actionType==6) then
		playSpeechActor("STATUS_RESOURCECOLLECTORIDLE",NameSupportPilot,NumSupportPilots, Frequency_Status)
	end
-- This speech has its own chatter event, needing a higher priority filter		
--	elseif (actionType==5) then
--		playSpeechActor("STATUS_RESOURCEPOCKETTOOBUSY_1")	
--~ 	elseif (actionType==4) then
--~ 		playSpeechActor("STATUS_RESOURCECOLLECTORNOMORERUS",NameSupportPilot,NumSupportPilots)

end


-- DEFINED IN TABLE (see Chatter.lua)
--~ function StatusInMineField(shipName)
--~ 	playSpeechActor("STATUS_GenericGroupInMineField", 30)
--~ end

function StatusCriticallyDamaged(shipName)

	print(" *** StatusCriticallyDamaged: "..shipName)
	
	if(shipName == "Vgr_MotherShip" or shipName=="Hgn_MotherShip") then
		playSpeechActor("STATUS_MothershipUnderLargeAttack_Report", raceHelper(), 0, Frequency_Command)
		return
	end
	
	--familyName = getFamily(shipName)
	shipType = getType(shipName)
	if(shipType == Frigate or shipType == Capital) then
		-- can't find in new speech
		--playSpeechActor("STATUS_CapitalShipLethallyDamaged_Report", g_default_frequency)
		playSpeechActor("STATUS_CapitalShip_Damaged_Report", NameCapPilot,NumCapPilots, Frequency_Command)
		
	end
end

-- DEFINED IN TABLE (see Chatter.lua)
--~ function CommandCloakLowPower(shipName)
--~ 	playSpeechActor("STATUS_CloakingShipsCloakingPowerLow_Report", 30)
--~ end

-- 1.0 is neutral, the number is friendlyValue / enemyValue so 0->1 is losing, > 1 is winning
function StatusBattleMomentum(momentum)

	print("** Battle Momentum Value: "..momentum)

	if(momentum > 5.0) then
		playSpeechActorLinked( "CHATTER_GenericGroupStartBattleAdvantaged_Report",NameAllPilot,NumAllPilots, Frequency_Status, CE_CHT_ADVRESPONSE)
	elseif(momentum > 4.0) then
		playSpeechActorLinked( "CHATTER_GenericGroupWinningBattle_Report",NameAllPilot,NumAllPilots, Frequency_Status, CE_CHT_WINRESPONSE)
	elseif(momentum > 2.0) then
		playSpeechActor("CHATTER_GenericGroupPositiveBattle_Report", NameAllPilot,NumAllPilots, Frequency_Status)
	elseif(momentum > 0.125) then
		playSpeechActorLinked("CHATTER_GenericGroupStartBattleFair_Report",NameAllPilot,NumAllPilots, Frequency_Status, CE_CHT_FAIRRESPONSE)
	elseif(momentum < 0.125) then
		-- can't find in new speech
		playSpeechActor("STATUS_GenericGroupLosingBadly_Report", NameAllPilot,NumAllPilots, Frequency_Status)
	elseif(momentum < 0.25) then
		playSpeechActorLinked( "CHATTER_GenericGroupLosingBattle_Report",NameAllPilot,NumAllPilots, Frequency_Status, CE_CHT_LOSERESPONSE)
	elseif(momentum < 0.5) then
		playSpeechActor("CHATTER_GenericGroupNegativeBattle_Report", NameAllPilot,NumAllPilots, Frequency_Status)
	end
end

CLOUD_OrderedToEnterNebula = 0
CLOUD_EnteringNebula = 1
CLOUD_EnteringDustcloud = 2
CLOUD_LostEnemy = 3
CLOUD_TakingDamage = 4
CLOUD_LostEnemyNebula = 5

function StatusCloud(shipname, evtype)

	if (evtype == CLOUD_OrderedToEnterNebula) then
		playSpeechActor("COMMAND_OrderedToEnterNebula",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (evtype == CLOUD_EnteringNebula) then

		if (shipname=="Kpr_Mover") then
			return
		end	
		
		if (strupper(shipname, "PROBE") ~= nil) then
			return
		end
		
		playSpeechActor("STATUS_Entering_Nebula",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (evtype == CLOUD_EnteringDustcloud) then
		playSpeechActor("STATUS_Entering_DustCloud",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (evtype == CLOUD_LostEnemy) then
		playSpeechActor("STATUS_Lost_EnemyinDustCloud",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (evtype == CLOUD_TakingDamage) then
	
		if (shipname=="Kpr_Mover") then
			return
		end
		
		if (strupper(shipname, "PROBE") ~= nil) then
			return
		end		
		
		playSpeechActor("STATUS_TakingDamageFromCloud",NameAllPilot,NumAllPilots, Frequency_Status)
	elseif (evtype == CLOUD_LostEnemyNebula) then
		playSpeechActor("STATUS_ENEMY_HEADED_TO_NEBULA_01",NameAllPilot,NumAllPilots, Frequency_Status)
	end
end



ssMap = {}
ssMap["Battlecruiser"] = {}
ssMap["Carrier"] = {}
ssMap["Shipyard"] = {}
ssMap["MotherShip"] = {}
--~ ssMap["Vgr_Battlecruiser"] = {}
--~ ssMap["Vgr_Carrier"] = {}
--~ ssMap["Vgr_ShipYard"] = {}
--~ ssMap["Vgr_MotherShip"] = {}

ssMap["Battlecruiser"].BATTLECRUISERENGINE = {"STATUS_BATTLECRUISER_EnginesUnderAttack_1","STATUS_BATTLECRUISER_EnginesDamaged_1","STATUS_BATTLECRUISER_EnginesDisabled_1"}
ssMap["Battlecruiser"].C_MODULE_CLOAKGENERATOR = {"STATUS_BATTLECRUISER_CloakGeneratorUnderAttack_1","STATUS_BATTLECRUISER_CloakGeneratorDamaged_1","STATUS_BATTLECRUISER_CloakGeneratorDestroyed_1"}
ssMap["Battlecruiser"].C_MODULE_FIRECONTROL = {"STATUS_BATTLECRUISER_FireControlTowerUnderAttack_1","STATUS_BATTLECRUISER_FireControlTowerDamaged_1","STATUS_BATTLECRUISER_FireControlTowerDestroyed_1"}
ssMap["Battlecruiser"].C_MODULE_HYPERSPACE = {"STATUS_BATTLECRUISER_HyperspaceCoreUnderAttack_1","STATUS_BATTLECRUISER_HyperspaceCoreDamaged_1","STATUS_BATTLECRUISER_HyperspaceCoreDestroyed_1"}
ssMap["Battlecruiser"].C_MODULE_RESEARCH = {"STATUS_BATTLECRUISER_ResearchModuleUnderAttack_1","STATUS_BATTLECRUISER_ResearchModuleDamaged_1","STATUS_BATTLECRUISER_ResearchModuleDestroyed_1"}

ssMap["Carrier"].C_ENGINE = {"STATUS_CARRIER_EnginesUnderAttack_1","STATUS_CARRIER_EnginesDamaged_1","STATUS_CARRIER_EnginesDisabled_1"}
ssMap["Carrier"].C_MODULE_CLOAKGENERATOR = {"STATUS_CARRIER_CloakGeneratorUnderAttack_1","STATUS_CARRIER_CloakGeneratorDamaged_1","STATUS_CARRIER_CloakGeneratorDestroyed_1"}
ssMap["Carrier"].C_MODULE_FIRECONTROL = {"STATUS_CARRIER_FireControlTowerUnderAttack_1","STATUS_CARRIER_FireControlTowerDamaged_1","STATUS_CARRIER_FireControlTowerDestroyed_1"}
ssMap["Carrier"].C_MODULE_HYPERSPACE = {"STATUS_CARRIER_HyperspaceCoreUnderAttack_1","STATUS_CARRIER_HyperspaceCoreDamaged_1","STATUS_CARRIER_HyperspaceCoreDestroyed_1"}
ssMap["Carrier"].C_MODULE_PLATFORMCONTROL = {"STATUS_CARRIER_PlatformFacilityUnderAttack_1","STATUS_CARRIER_PlatformFacilityDamaged_1","STATUS_CARRIER_PlatformFacilityDestroyed_1"}
ssMap["Carrier"].C_MODULE_RESEARCH = {"STATUS_CARRIER_ResearchModuleUnderAttack_1","STATUS_CARRIER_ResearchModuleDamaged_1","STATUS_CARRIER_ResearchModuleDestroyed_1"}
ssMap["Carrier"].C_PRODUCTION_CORVETTE = {"STATUS_CARRIER_CorvetteFacilityUnderAttack_1","STATUS_CARRIER_CorvetteFacilityDamaged_1","STATUS_CARRIER_CorvetteFacilityDestroyed_1"}
ssMap["Carrier"].C_PRODUCTION_FIGHTER = {"STATUS_CARRIER_FighterFacilityUnderAttack_1","STATUS_CARRIER_FighterFacilityDamaged_1","STATUS_CARRIER_FighterFacilityDestroyed_1"}
ssMap["Carrier"].C_PRODUCTION_FRIGATE = {"STATUS_CARRIER_FrigateFacilityUnderAttack_1","STATUS_CARRIER_FrigateFacilityDamaged_1","STATUS_CARRIER_FrigateFacilityDestroyed_1"}
ssMap["Carrier"].C_PRODUCTION_FRIGATEADVANCED = {"STATUS_CARRIER_AdvancedFrigateFacilityUnderAttack_1","STATUS_CARRIER_AdvancedFrigateFacilityDamaged_1","STATUS_CARRIER_AdvancedFrigateFacilityDestroyed_1"}
ssMap["Carrier"].C_SENSORS_ADVANCEDARRAY = {"STATUS_CARRIER_SensorArrayUnderAttack_1","STATUS_CARRIER_SensorArrayDamaged_1","STATUS_CARRIER_SensorArrayDestroyed_1"}

ssMap["Shipyard"].MS_MODULE_CLOAKGENERATOR = {"STATUS_SHIPYARD_CloakGeneratorUnderAttack_1","STATUS_SHIPYARD_CloakGeneratorDamaged_1","STATUS_SHIPYARD_CloakGeneratorDestroyed_1"}
ssMap["Shipyard"].MS_MODULE_FIRECONTROL = {"STATUS_SHIPYARD_FireControlTowerUnderAttack_1","STATUS_SHIPYARD_FireControlTowerDamaged_1","STATUS_SHIPYARD_FireControlTowerDestroyed_1"}
ssMap["Shipyard"].MS_MODULE_HYPERSPACE = {"STATUS_SHIPYARD_HyperspaceCoreUnderAttack_1","STATUS_SHIPYARD_HyperspaceCoreDamaged_1","STATUS_SHIPYARD_HyperspaceCoreDestroyed_1"}
ssMap["Shipyard"].MS_MODULE_RESEARCH = {"STATUS_SHIPYARD_ResearchModuleUnderAttack_1","STATUS_SHIPYARD_ResearchModuleDamaged_1","STATUS_SHIPYARD_ResearchModuleDestroyed_1"}
ssMap["Shipyard"].MS_MODULE_PLATFORMCONTROL = {"STATUS_SHIPYARD_PlatformFacilityUnderAttack_1","STATUS_SHIPYARD_PlatformFacilityDamaged_1","STATUS_SHIPYARD_PlatformFacilityDestroyed_1"}
ssMap["Shipyard"].MS_PRODUCTION_CORVETTE = {"STATUS_SHIPYARD_CorvetteFacilityUnderAttack_1","STATUS_SHIPYARD_CorvetteFacilityDamaged_1","STATUS_SHIPYARD_CorvetteFacilityDestroyed_1"}
ssMap["Shipyard"].MS_PRODUCTION_FIGHTER = {"STATUS_SHIPYARD_FighterFacilityUnderAttack_1","STATUS_SHIPYARD_FighterFacilityDamaged_1","STATUS_SHIPYARD_FighterFacilityDestroyed_1"}
ssMap["Shipyard"].MS_PRODUCTION_FRIGATE = {"STATUS_SHIPYARD_FrigateFacilityUnderAttack_1","STATUS_SHIPYARD_FrigateFacilityDamaged_1","STATUS_SHIPYARD_FrigateFacilityDestroyed_1"}
ssMap["Shipyard"].MS_PRODUCTION_FRIGATEADVANCED = {"STATUS_SHIPYARD_AdvancedFrigateFacilityUnderAttack_1","STATUS_SHIPYARD_AdvancedFrigateFacilityDamaged_1","STATUS_SHIPYARD_AdvancedFrigateFacilityDestroyed_1"}
ssMap["Shipyard"].SY_INNATE_ENGINE = {"STATUS_SHIPYARD_EnginesUnderAttack_1","STATUS_SHIPYARD_EnginesDamaged_1","STATUS_SHIPYARD_EnginesDisabled_1"}
ssMap["Shipyard"].SY_PRODUCTION_CAPSHIP = {"STATUS_SHIPYARD_CapitalShipFacilityUnderAttack_1","STATUS_SHIPYARD_CapitalShipFacilityDamaged_1","STATUS_SHIPYARD_CapitalShipFacilityDestroyed_1"}

ssMap["MotherShip"].MS_MODULE_CLOAKGENERATOR = {"STATUS_Mothership_CloakGeneratorUnderAttack_1","STATUS_Mothership_CloakGeneratorDamaged_1","STATUS_Mothership_CloakGeneratorDestroyed_1"}
ssMap["MotherShip"].MS_MODULE_FIRECONTROL = {"STATUS_Mothership_FireControlTowerUnderAttack_1","STATUS_Mothership_FireControlTowerDamaged_1","STATUS_Mothership_FireControlTowerDestroyed_1"}
ssMap["MotherShip"].MS_MODULE_HYPERSPACE = {"STATUS_Mothership_HyperspaceCoreUnderAttack_1","STATUS_Mothership_HyperspaceCoreDamaged_1","STATUS_Mothership_HyperspaceCoreDestroyed_1"}
ssMap["MotherShip"].MS_MODULE_RESEARCH = {"STATUS_Mothership_ResearchModuleUnderAttack_1","STATUS_Mothership_ResearchModuleDamaged_1","STATUS_Mothership_ResearchModuleDestroyed_1"}
ssMap["MotherShip"].MS_MODULE_PLATFORMCONTROL = {"STATUS_Mothership_PlatformFacilityUnderAttack_1","STATUS_Mothership_CorvetteFacilityDamaged_1","STATUS_Mothership_PlatformFacilityDestroyed_1"}
ssMap["MotherShip"].MS_PRODUCTION_CORVETTE = {"STATUS_Mothership_CorvetteFacilityUnderAttack_1","STATUS_SHIPYARD_CorvetteFacilityDamaged_1","STATUS_Mothership_CorvetteFacilityDestroyed_1"}
ssMap["MotherShip"].MS_PRODUCTION_FIGHTER = {"STATUS_Mothership_FighterFacilityUnderAttack_1","STATUS_Mothership_FighterFacilityDamaged_1","STATUS_Mothership_FighterFacilityDestroyed_1"}
ssMap["MotherShip"].MS_PRODUCTION_FRIGATE = {"STATUS_Mothership_FrigateFacilityUnderAttack_1","STATUS_SHIPYARD_FrigateFacilityDamaged_1","STATUS_Mothership_FrigateFacilityDestroyed_1"}
ssMap["MotherShip"].MS_PRODUCTION_FRIGATEADVANCED = {"STATUS_Mothership_AdvancedFrigateFacilityUnderAttack_1","STATUS_Mothership_AdvancedFrigateFacilityDamaged_1","STATUS_Mothership_AdvancedFrigateFacilityDestroyed_1"}
ssMap["MotherShip"].MS_INNATE_ENGINE = {"STATUS_Mothership_EnginesUnderAttack_1","STATUS_Mothership_EnginesDamaged_1","STATUS_Mothership_EnginesDisabled_1"}
ssMap["MotherShip"].MS_PRODUCTION_CAPSHIP = {"STATUS_Mothership_CapitalShipFacilityUnderAttack_1","STATUS_Mothership_CapitalShipFacilityDamaged_1","STATUS_Mothership_CapitalShipFacilityDestroyed_1"}
ssMap["MotherShip"].MS_SENSORS_ADVANCEDARRAY = {"STATUS_Mothership_SensorArrayUnderAttack_1","STATUS_Mothership_SensorArrayDamaged_1","STATUS_Mothership_SensorArrayDestroyed_1"}
ssMap["MotherShip"].MS_PRODUCTION_CAPSHIPADVANCED = {"STATUS_Mothership_AdvancedCapitalShipFacilityUnderAttack_1","STATUS_Mothership_AdvancedCapitalShipFacilityDamaged_1","STATUS_Mothership_AdvancedCapitalShipFacilityDestroyed_1"}
ssMap["MotherShip"].MS_MODULE_RESEARCHADVANCED = {"STATUS_ARM_UnderAttack_2","STATUS_ARM_Damaged_1","STATUS_ARM_Destroyed_1"}

-- for reference, this is the "event" parameter
UnderAttack = 1
Damaged = 2
Destroyed = 3
Repaired = 4

varyEngineSpeech = 0

function StatusSubsystem(ssname, shipName, event)

	--eliminate race
	genericShipName = strsub(shipName,5)
	genericssname = strsub(ssname,5)
	
	if (genericssname=="MS_INNATE_RESOURCE") then
		return
	end
	
	-- filter out repetitive engine speech
	if (strfind (genericssname, "ENGINE") ~= nil)  then
		varyEngineSpeech = varyEngineSpeech + 1
		if (mod(varyEngineSpeech,3)~=0) then
			return
		end
	end

	print("*****---- StatusSubsystem : ssname="..ssname..", shipName="..shipName..", event="..event)
	
	if (ssMap[""..genericShipName] ~= nil) and (ssMap[""..genericShipName][""..genericssname] ~= nil and event ~= Repaired) then
		if (genericShipName == "Shipyard") then
			playSpeechActor(ssMap[""..genericShipName][""..genericssname][event], NameSupportPilot, NumSupportPilots, Frequency_Status)
		elseif (genericShipName == "Carrier" or genericShipName == "Battlecruiser") then
			playSpeechActor(ssMap[""..genericShipName][""..genericssname][event],  NameCapPilot,NumCapPilots, Frequency_Status)
		elseif (genericShipName == "MotherShip") then			
			playSpeechActor(ssMap[""..genericShipName][""..genericssname][event], raceHelper(), 0, Frequency_Status)
		end
		
		--print("*****---- ssMap[genericShipName][genericssname][event] = "..ssMap[""..genericShipName][""..genericssname][event])
		return
	elseif (event == Repaired) then
		if (genericShipName == "Shipyard") then
			playSpeechActor("STATUS_SHIPYARD_EnginesRepaired_1", NameSupportPilot, NumSupportPilots, Frequency_Status)
		elseif (genericShipName == "Carrier") then			
			playSpeechActor("STATUS_CARRIER_EnginesRepaired_1", NameCapPilot,NumCapPilots, Frequency_Status)
		elseif (genericShipName == "Battlecruiser" and genericssname=="BATTLECRUISERENGINE") then
			playSpeechActor("STATUS_BATTLECRUISER_EnginesRepaired_1",  NameCapPilot,NumCapPilots, Frequency_Status)
		end
		
		return
	end
	
	if (event==Destroyed) then
		playSpeechActor("STATUS_SubsystemDestroyed_2",raceHelper(),0, Frequency_Status)
	end
	
end

function BattleChatMisc(ssname, parm2, code)

	--print(" *** BattleChatMisc: ssname, parm2, code="..ssname","..parm2..","..code)

	shipType = getType(ssname)
	shipTypeEnemy = getType(parm2)

	if (code==1 and shipType==Capital and shipTypeEnemy==Capital) then
		playSpeechActor("CHATTER_CapitalShipHitFromBehind",NameCapPilot,NumCapPilots, Frequency_Status)
	elseif (code==2 and shipType==Capital and shipTypeEnemy==Capital) then
		playSpeechActor("CHATTER_CapitalShipHitFromTopOrBottom",NameCapPilot,NumCapPilots, Frequency_Status)
	elseif (code==3 and shipType==Capital) then
		playSpeechActor("CHATTER_OneManStanding_Report",NameCapPilot,NumCapPilots, Frequency_Status)
	elseif ( (code==1 or code==2) and shipType==Capital and shipTypeEnemy==Fighter) then
		playSpeechActor("CHATTER_FIGHTERCHASED_REPORT",NameFighterPilot, NumFighterPilots, Frequency_Status)
	end

end

function StatusBuildAvailable(shipName)
    print("build available")
    familyName = getFamily(shipName)
    
    shipType = getType(shipName)
    
	if(shipName == "") then
        print("generic build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildAvaliable_1",raceHelper(),0, Frequency_Status)
        
	elseif (shipType == Resource) then
        print("utility build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildUtilityAvaliable_1",raceHelper(),0, Frequency_Status)
        
	elseif(shipType ==  Fighter) then
        print("strike craft build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildStrikeAvaliable_1",raceHelper(),0, Frequency_Status)
        
	elseif(shipType ==Corvette) then
        print("corvette build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildCorvetteAvaliable_1",raceHelper(),0, Frequency_Status)
        
	elseif(shipType == Frigate) then
        print("frigate build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildFrigateAvaliable_1",raceHelper(),0, Frequency_Status)
        
	elseif(shipType == Capital) then
        print("capital build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildCapitalAvaliable_1",raceHelper(),0, Frequency_Status)
        
	elseif(shipType == Platform) then
        print("platform build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildPlatformAvaliable_1",raceHelper(),0, Frequency_Status)
        
	elseif(shipName == "RESEARCH") then
        print("research build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_ReseachModAvaliable",raceHelper(),0, Frequency_Status)
        
	elseif(shipName == "ADVANCEDRESEARCH") then
        print("advresearch build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_AdvReseachModAvaliable",raceHelper(),0, Frequency_Status)
        
	else
        print("generic build available "..shipName.."  "..familyName)
		playSpeechActor("STATUS_BuildAvaliable_1",raceHelper(),0, Frequency_Status)
        
	end
end	

function StatusHyperspaceExit(shipName)

	genericshipnm = strsub(shipName,5)
	
	if (genericshipnm=="MotherShip") then
		playSpeechActor("STATUS_HyperspaceComplete_1", raceHelper(), 0, Frequency_Command )
	else
		playSpeechActor("STATUS_HS_EXIT", NameCapPilot, NumCapPilots, Frequency_Command )
	end

end

function StatusResearchComplete(temp)

	playSpeechActor("STATUS_RESEARCHCOMPLETE_1", raceHelper(), 0, Frequency_Status)
end

function StatusHyperspaceInterrupted(temp)

	playSpeechActor("STATUS_HyperspaceInterupted_1",raceHelper(),0, Frequency_Status)
end

function StatusResearchAvailable(temp)

	playSpeechActor("STATUS_ResearchAvaliable_1",raceHelper(),0, Frequency_Status)
end

function StatusResearchNoRUs(temp)

	playSpeechActor("STATUS_ResearchNoRUs_1",raceHelper(),0, Frequency_Status)
end

function StatusUpgradeComplete(temp)

	playSpeechActor("STATUS_UpgradeComplete_1",raceHelper(),0, Frequency_Status)
end

function StatusUpgradeAvailable(temp)

	playSpeechActor("STATUS_UpgradeAvaliable_1",raceHelper(),0, Frequency_Status)
end

function StatusUpdgradeNoRUs(temp)

	playSpeechActor("STATUS_UpgradeNoRUs_1",raceHelper(),0, Frequency_Status)
end

function StatusBuildNoRUs(temp)

	playSpeechActor("STATUS_BuildNoRUs_1",raceHelper(),0, Frequency_Status)
end

