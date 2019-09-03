--============================================================
-- lua functions for generating speech when a command is given
-- functions available from the game:
--	getFamily(shipName)				- return the DisplayFamily for shipName (displayFamily defined in data\scripts\FamilyList.lua) in upper case
--	playSpeech(speechName)				- speechName is the name of the all ships speech to play without path up to the _
--									  (so to play one of data/sound/speech/AllShips/CHATTER_CarrierOrMShipConstruction_1.mp3
--									   to data/sound/speech/AllShips/CHATTER_CarrierOrMShipConstruction_1.mp3 you'd use
--									   "CHATTER_CarrierOrMShipConstruction")
--	playSpeechFreq(speechName, frequency)	- speechName - same as above
--									- frequency is the minimum amount of time, in seconds, before this event will be played again.
--============================================================

-- move command issued to a ship with the given name

-- DEFINED IN TABLE (see Chatter.lua)
--~ function CommandMoveGiven(shipname, targetname)
--~ 	playSpeech( "COMMAND_Move" )
--~ end




-- DEFINED IN TABLE (see Chatter.lua)
--~ function CommandIdleGiven(shipname, targetname)
--~ 	playSpeech( "COMMAND_MoveCancelled" )
--~ end

--DefensefieldStatus types
DEF_on = 0
DEF_off = 1
DEF_out = 2
DEF_low = 3

-- ShipTypes (return values)
Resource = 2
Fighter = 3
Corvette = 4
Support = 5
MISC = 6
Capital = 7
Frigate = 8
SubSystem = 9
Platform = 10
Megalith = 11
Flagship = 12

-- Number of Actors per Actor type
NumAllPilots = 5
NumCapPilots = 4
NumFighterPilots = 3
NumInfiltratorPilots = 2
NumMarinePilots = 2
NumSupportPilots = 3
NumSalCapPilots = 3

-- Text for Actor folder names
NameAllPilot = "All_"
NameCapPilot = "Cap_"
NameFighterPilot = "Fighter_"
NameInfiltratorPilot = "Infiltrator_"
NameMarinePilot = "Marine_"
NameSupportPilot = "Support_"
NameFleetCommand = "Fleet"
NameMakaan = "Makaan"
NameEmperor = "Emperor"
NameSalCap = "SalCap_"

-- timeout values for speech events
Frequency_Command = 0.5
Frequency_Status = 2.0
Frequency_Chatter = 5.0

function raceHelper()
	if not bRaceID then
		bRaceID = 1
		dofilepath("player:racelist.lua")
	end

	if (Race_ID[currentRace] == "Vaygr" or Race_ID[currentRace] == "2x_Vaygr") then
		return NameMakaan
	elseif (Race_ID[currentRace] == "Taiidan" or Race_ID[currentRace] == "2x_Taiidan") then
		return NameEmperor
	else
		return NameFleetCommand
	end
end

-- Race IDs (Default reference with no restrictions, like in SP)
Race_ID =
{
	"Hiigaran",
	"Vaygr",
	"Keeper",
	"Bentusi",
	"Kushan",
	"Taiidan",
	"Turanic Raiders",
	"Kadeshi",
	"P3",
}
bRaceID = nil
Hiigaran = 1
Vaygr = 2
Taiidan = 6

function getType(shipnm)

	--first takes care of these special cases for which we don't want to use the AttackFamily
	
	if (shipnm == 'Hgn_MotherShip' or shipnm == 'Vgr_MotherShip') then
		return Flagship
	end
	
	shipnmU = strupper(shipnm)

	if ( (strfind (shipnmU, "PLATFORM") ~= nil) or (strfind (shipnmU, "TURRET") ~= nil))  then
		return Platform
	end
	
	if (strfind (shipnmU, "DEBRIS") ~= nil) then
		return MISC
	end
	
	if (strfind (shipnmU, "KPR_") ~= nil) then
		return MISC
	end
	familyName = ""..getFamily(shipnm)
	
	
	
	--print("*** GET TYPE for SHIP: "..shipnm.. " with FAMILY: "..familyName)
	
	if(familyName == "CAPITAL" or familyName == "SUPERCAP" or familyName =="SMALLCAPITALSHIP" or familyName =="BIGCAPITALSHIP") then
		return Capital
	end
	
	if (familyName == "FRIGATE" or familyName=="CAPTURER") then
		return Frigate
	end
	
	if(familyName == "UTILITY" or familyName == "RESOURCE" or familyName == "RESOURCELARGE") then
		return Resource
	end
	
	if(familyName == "CORVETTE") then
		return Corvette
	end	

	if(familyName == "FIGHTER") then
		return Fighter
	end	
	
	if(familyName == "MEGALITH") then
		return Megalith
	end	
	
	if(familyName == "FLAGSHIP" or familyName=="MOTHERSHIP") then
		return Flagship
	end			

	if(familyName == "SUBSYSTEM" or familyName == "SUBSYSTEMMODULE" or (strfind (shipnmU, "MODULE") ~= nil) ) then
		return SubSystem
	end		
	
	if(familyName == "PLATFORM") then
		return Platform
	end	

	--print("*** GET TYPE unknown FamilyType: "..familyName.." for ship:"..shipnm)
	
	return 0
end


function CommandMoveToSobGiven(shipname, targetname)

	--print ("movetosob targetname = "..targetname)
	
	if (strfind (strupper(targetname), "NEBULA") ~= nil) then
		playSpeechActor("COMMAND_OrderedToEnterNebula", NameAllPilot, NumAllPilots, Frequency_Command)
		return
	end
	
	CommandMoveGiven( shipname, targetname )
end


function isCapital(shipnm)

	if (getType(shipnm) == Capital) then
		return 1
	end
	
	return 0
end

function CommandWayPointMoveGiven(shipname, targetname)

	shiptype = getType(shipname)
	genericShipName = strsub(shipname,5)
	
	if (genericShipName=="ProximitySensor" or genericShipName=="SensorArray") then
		playSpeechActor("Command_Probe_Selected", NameAllPilot, 1, Frequency_Command )
		return
	end

	if (shiptype == Flagship and genericShipName~="Dreadnaught" ) then	
		playSpeechActor("COMMAND_Waypoint_1", raceHelper(), 0, Frequency_Command )
		return
	end
	
	if (strsub(shipname,0,4)=="Kpr_") then
		playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
		return
	end	
	
	playSpeechActor("COMMAND_WAYPOINT",  NameAllPilot, NumAllPilots, Frequency_Command)
		
	
end

function CommandCancelOrder(shipname, prevOrders)
	local MoveOrder = 0
	local AttackOrder = 1
	
	if (strsub(shipname,0,4)=="Kpr_") then
		playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
		return
	end		
	
	shiptype = getType(shipname)
	genericShipName = strsub(shipname,5)

		if (prevOrders == AttackOrder) then

		if (shiptype == Flagship and genericShipName~="Dreadnaught" ) then	
			playSpeechActor("COMMAND_Attack_Cancelled_1", raceHelper(), 0, Frequency_Command )
			return
		end	
	
		if(shiptype==Capital) then
			playSpeechActor( "COMMAND_CAP_ATTACK_CANCELLED", NameCapPilot, NumCapPilots, Frequency_Command )
		else
			playSpeechActor( "COMMAND_ATTACK_CANCELLED", NameFighterPilot, NumFighterPilots, Frequency_Command )
		end
	else
		if (shiptype == Flagship and genericShipName~="Dreadnaught" ) then	
			playSpeechActor("COMMAND_MoveCancelled_1", raceHelper(), 0, Frequency_Command )
			return
		end
	--if (prevOrders == MoveOrder) then
		playSpeechActor( "COMMAND_MoveCancelled",  NameAllPilot, NumAllPilots, Frequency_Command)
	end
end

function CommandDefenseFieldChanged(shipname, defenseType)

	if (defenseType == DEF_on) then
		playSpeechActor( "COMMAND_DEFENSEFIELDON", NameCapPilot,  NumCapPilots, Frequency_Command )
	elseif (defenseType == DEF_off) then
		playSpeechActor( "COMMAND_DEFENSEFIELDOFF", NameCapPilot, NumCapPilots, Frequency_Command )
	elseif (defenseType == DEF_out) then
		playSpeechActor( "STATUS_DEFENCEFIELDOUTOFPOWER", NameCapPilot, NumCapPilots, Frequency_Command )
	elseif (defenseType == DEF_low) then
		--no speech
	end

end

-- resource command issued with a target of the given name
function CommandResourceGiven(shipname, targetname)
	--if (targetname == "Container") then
	-- string library not available in luaconfig, so can't use strfind, strlower, strsub

	if (targetname == "StaticContainer") then
		playSpeechActor( "COMMAND_ResourceSalvage", NameSupportPilot, NumSupportPilots, Frequency_Command )
	else
		playSpeechActor( "COMMAND_ResourceCollectorHarvest", NameSupportPilot, NumSupportPilots, Frequency_Command )
	end
end


MP_AllianceRequested = 0
MP_AllianceFormed = 1
MP_AllianceBroken = 2
MP_RUsTransferred = 3
MP_ShipsTransferred = 4

function CommandMultiplay(shipname, event)
	
	if (event==MP_AllianceRequested) then
		playSpeechActor("COMMAND_AllianceRequested_1", raceHelper(), 0, Frequency_Command )
	elseif (event==MP_AllianceFormed) then
		playSpeechActor("COMMAND_AllianceFormed_1", raceHelper(), 0, Frequency_Command )
	elseif (event==MP_AllianceBroken) then
		playSpeechActor("COMMAND_AllianceBroken_1", raceHelper(), 0, Frequency_Command )
	elseif (event==MP_RUsTransferred) then
		playSpeechActor("COMMAND_RUs_Transferred", raceHelper(), 0, Frequency_Command )
	elseif (event==MP_ShipsTransferred) then
		playSpeechActor("COMMAND_Ships_Transferred", raceHelper(), 0, Frequency_Command )
	end
	
end


-- capture command issued to a ship with the given name
function CommandCaptureGiven(shipname, targetname)
	if (shipname=="Hgn_MarineFrigate") then
		playSpeechActor( "COMMAND_MarineFrigate_Capture", NameMarinePilot, NumMarinePilots, Frequency_Command )
	else
		playSpeechActor( "COMMAND_INFILTRATORFRIGATE_CAPTURE", NameInfiltratorPilot, NumInfiltratorPilots, Frequency_Command )
	end
end

function CommandAttackGiven(shipname, targetname, attackType)

	print("******** COMMAND ATTACK: shipname, targetname, attackType = "..shipname..","..targetname..","..attackType)
	
	-- if special_attack given
	if (attackType == 3) then
		if (shipname=="Hgn_Dreadnaught") then
			playSpeechActor("COMMAND_Dreadnaught_BigGun", NameCapPilot, NumCapPilots, Frequency_Command )
			return
		elseif (shipname=="Hgn_Scout") then
			playSpeechActor("COMMAND_ScoutEmp", NameSupportPilot, NumSupportPilots, Frequency_Command )
			return
		end
	end
	
	if (strsub(shipname,0,4)=="Kpr_") then
		playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
		return
	end		

	local targetShipType = getType(targetname)
	local shipType = getType(shipname)
	

	genericShipName = strsub(shipname,5)
	
	
	print("******2- COMMAND ATTACK: shipType, targetShipType, genericShipName = "..shipType..","..targetShipType..","..genericShipName)
	
	if (attackType == 0 or attackType == 3) then

		if (shipType == Flagship and genericShipName~="Dreadnaught" ) then	
			playSpeechActor("COMMAND_Attack", raceHelper(), 0, Frequency_Command )
			return
		end	
		-- check if we can play Target-relevant speech first
		if(targetShipType==Capital) then
			playSpeechActor("COMMAND_Attack_CapShip", NameCapPilot, NumCapPilots, Frequency_Command )
		elseif ( targetShipType==SubSystem and targetname~="VGR_HYPERSPACEINHIBITOR") then
			playSpeechActor("COMMAND_BOMBERSUBSYSTEMATTACK", NameFighterPilot, NumFighterPilots, Frequency_Command )
		else
			if(shipType==Capital) then
				playSpeechActor( "COMMAND_CAPSHIP_TO_ATTACK", NameCapPilot, NumCapPilots, Frequency_Command )
			elseif (shipname=="STRIKE") then
				playSpeechActor( "COMMAND_StrikeGroup_Attack", NameAllPilot, NumAllPilots, Frequency_Command )
			else
				playSpeechActor( "COMMAND_Attack", NameFighterPilot, NumFighterPilots, Frequency_Command )
			end
		end
	elseif (attackType == 1) then
		if (shipType == Flagship and genericShipName~="Dreadnaught" ) then	
			playSpeechActor("COMMAND_ForceAttackFriendly_1", raceHelper(), 0, Frequency_Command )
			return
		end	
		playSpeechActor( "COMMAND_ForceAttackFriendly", NameCapPilot, NumCapPilots, Frequency_Command )
	elseif (attackType == 2) then
		if (targetShipType == Resource) then
            if (shipType == Flagship) then
	    		playSpeechActor("COMMAND_CombatMan_1", raceHelper(), 0, Frequency_Command )
            elseif (shipType == Capital) then
    			playSpeechActor("COMMAND_ForceAttack", NameCapPilot, NumCapPilots, Frequency_Command )
            else
				playSpeechActor( "COMMAND_Attack", NameFighterPilot, NumFighterPilots, Frequency_Command )
            end
        elseif (shipType == Flagship and genericShipName~="Dreadnaught" ) then	
		--if (shipType == Flagship and genericShipName~="Dreadnaught" ) then	
			playSpeechActor("COMMAND_ForceAttack_1", raceHelper(), 0, Frequency_Command )
        else
		    playSpeechActor( "COMMAND_ForceAttack", NameCapPilot, NumCapPilots, Frequency_Command )
        end
	end
end

HYP_Entering = 0
HYP_EnteringGate = 1
HYP_Exiting = 2
HYP_Interrupted = 3
HYP_GateFormed = 4
HYP_EnteredInhibitorVolume = 5
HYP_NotEnoughCash = 6

function CommandHyperspaceGiven(shipname,code)

	print("** CommandHyperspaceGiven: shipname = "..shipname.." code = "..code)
	genericShipName = strsub(shipname,5)

	--special case for intteruption (same priority)
	if (code == HYP_Interrupted) then
		if (genericShipName=="MotherShip") then
			playSpeechActor("STATUS_HyperspaceInterupted_1",  raceHelper(), 0, Frequency_Command)
		else
			playSpeechActor("STATUS_OutofHS", NameCapPilot, NumCapPilots, Frequency_Command )
		end
		return
	end
	
	--special case for intteruption due to inhibitor(same priority)
	if (code == HYP_EnteredInhibitorVolume) then
		playSpeechActor("STATUS_HyperSpaceInhib_Detected", NameSupportPilot, NumSupportPilots, Frequency_Command)
		return
	end	
	
	if (code == HYP_NotEnoughCash) then
		playSpeechActor("STATUS_HYPERSPACEINSUFFICENT_1", raceHelper(), 0, Frequency_Command)
		return
	end		

	if (code == HYP_EnteringGate) then
		playSpeechActor("STATUS_HyperspaceGateJump_1", raceHelper(), 0, Frequency_Command)
		return
	end			

	shipType = getType(shipname)
	
	if (shipType == Flagship) then
		playSpeechActor("COMMAND_HS", raceHelper(), 0 , Frequency_Command)
		return
	end		

	if (shipType==Capital) then
		playSpeechActor("COMMAND_CAPHS", NameCapPilot, NumCapPilots, Frequency_Command )
	else
		playSpeechActor("COMMAND_HS", NameCapPilot, NumCapPilots, Frequency_Command )
	end

end

function CommandCombatMan(shipname, targetname)

	shipType = getType(shipname)	
	genericShipName = strsub(shipname,5)

	if (shipType == Flagship and genericShipName~="Dreadnaught" ) then		
		playSpeechActor("COMMAND_CombatMan_1", raceHelper(), 0, Frequency_Command )
		return
	end		

	
	if (shipType==Capital) then
		playSpeechActor("COMMAND_CAP_COMBATMAN", NameCapPilot, NumCapPilots, Frequency_Command )
	else
		playSpeechActor("COMMAND_COMBATMAN", NameFighterPilot, NumFighterPilots, Frequency_Command )
	end

end

function CommandMoveAttackGiven(shipname, targetname)

	shiptype = getType(shipname)
	genericShipName = strsub(shipname,5)

	if (shiptype == Flagship and genericShipName~="Dreadnaught" ) then
		playSpeechActor("COMMAND_MoveAttack_1", raceHelper(), 0, Frequency_Command )
		return
	end
	
	if (shiptype==Capital) then
		playSpeechActor("COMMAND_CAP_MOVEATTACK", NameCapPilot, NumCapPilots, Frequency_Command )
	else
		playSpeechActor("COMMAND_MOVEATTACK", NameFighterPilot, NumFighterPilots, Frequency_Command )
	end

end

function CommandLaunchGiven(shipname, targetname)

	if (shipname =="Hgn_Probe") then
		--playSpeechActor( "COMMAND_ProbeLaunched",raceHelper(), 0)
		return
	end
	
	shipFamily = getFamily(shipname)
	if (shipFamily == "FIGHTER" or shipFamily == "CORVETTE") then
		-- can't find in new speech
		playSpeechActor( "COMMAND_StrikeCraftLaunch",NameSupportPilot, NumSupportPilots, Frequency_Command)
	elseif (shipFamily == "CAPITAL" or shipFamily == "SUPERCAP") then
		playSpeechActorLinked( "STATUS_CARRIERORMSHIPCAPITALSHIPLAUNCHED", NameSupportPilot, NumSupportPilots, Frequency_Command, CE_STS_CAPWELCOME)
	end
end


-- DEFINED IN TABLE (see Chatter.lua)
function CommandGuardGiven(shipname, targetname)

	shiptype = getType(shipname)
	genericShipName = strsub(shipname,5)

	if (shiptype == Flagship and genericShipName~="Dreadnaught" ) then		
		playSpeechActor("COMMAND_Guard_1", raceHelper(), 0, Frequency_Command )
		return
	end
	
	if (strsub(shipname,0,4)=="Kpr_") then
		playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
		return
	end	
	
	if (shiptype==Capital) then
		playSpeechActor( "COMMAND_CAP_GUARD", NameCapPilot, NumCapPilots, Frequency_Command )
	elseif (shiptype==Fighter) then
		playSpeechActor( "COMMAND_Guard", NameFighterPilot, NumFighterPilots, Frequency_Command )
	else
		playSpeechActor( "COMMAND_Guard", NameAllPilot, NumAllPilots, Frequency_Command )
	end
end

function CommandMoveGiven(shipnm, targetnm)

	--print("** CommandMoveGiven: shipnm="..shipnm)

	shiptype = getType(shipnm)
	genericShipName = strsub(shipnm,5)

	if (shiptype == Flagship and genericShipName~="Dreadnaught" ) then		
		playSpeechActor("COMMAND_MOVE_1", raceHelper(), 0, Frequency_Command )
		return
	end
	
	if (genericShipName=="ProximitySensor" or genericShipName=="SensorArray") then
		playSpeechActor("Command_Probe_Selected", NameAllPilot, NumAllPilots, Frequency_Command )
		return
	end	
	
	genericShipName = strsub(shipnm,5)
	
	if (strfind (strupper(shipnm), "PROBE") ~= nil) then
		playSpeechActor("COMMAND_ProbeLaunched", raceHelper(), 0, Frequency_Command )	
		return
	end
	
	if (strsub(shipnm,0,4)=="Kpr_") then
		playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
		return
	end	
	
	if (genericShipName=="GunTurret" or genericShipName=="GunPlatform" or genericShipName=="IonTurret" or genericShipName=="WeaponPlatform_gun"or genericShipName=="WeaponPlatform_missile") then
		playSpeechActor( "COMMAND_Turret_Fold", NameSupportPilot, NumSupportPilots, Frequency_Command )
	elseif (shipnm=="STRIKE") then
		playSpeechActor( "COMMAND_StrikeGroup_Move", NameAllPilot, NumAllPilots, Frequency_Command )
	else
		playSpeechActor( "COMMAND_Move", NameAllPilot, NumAllPilots, Frequency_Command )
	end

end

function CommandStrikeGroupFormed(shipnm, code)

	if (shipnm ~= nil) then
	
		if (strfind (shipnm, "Kpr_") ~= nil) then
			playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
			return
		end
	
	end

	if (code==1) then
		playSpeechActor( "COMMAND_STRIKEGROUP_FORM_RESPONSE", NameAllPilot, NumAllPilots, Frequency_Command )
	elseif(code == 2) then
		playSpeechActor( "COMMAND_STRIKEGROUP_FORMATIONSET", NameAllPilot, NumAllPilots, Frequency_Command )
	elseif (code == 3) then
		playSpeechActor( "COMMAND_STRIKEGROUP_DISBAND", NameAllPilot, NumAllPilots, Frequency_Command )
	end
end

function CommandDockGiven(shipname, targetname)
	shipType = getType(shipname)
	
	--eliminate race
	genericShipName = strlower(strsub(targetname,5))
	
--~ 	-- this can get WAY too annoying (happens constantly, latch=dock in code), so disable
--~ 	if (shipType==Resource and genericShipName == "ResourceController") then
--~ 		return
--~ 	end

	if (strsub(shipname,0,4)=="Kpr_") then
		playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
		return
	end	

	--if (shipType == Fighter or shipType == Corvette) then
	--	playSpeechActor("COMMAND_StrikeCraftDock", NameFighterPilot, NumFighterPilots, Frequency_Command )
	--	return
	--end
	
	if (genericShipName=="carrier") then
		playSpeechActor("COMMAND_AnyShipGenericDockCarrier_1", NameAllPilot, NumAllPilots, Frequency_Command)
	elseif (genericShipName=="mothership") then
		playSpeechActor("COMMAND_AnyShipGenericDockMothership_1", NameAllPilot, NumAllPilots, Frequency_Command)
	elseif (genericShipName=="shipyard") then
		playSpeechActor("COMMAND_AnyShipGenericDockShipyard_1", NameAllPilot, NumAllPilots, Frequency_Command)
	elseif (genericShipName=="supportfrigate") then
		playSpeechActor("COMMAND_AnyShipGenericDockSupportFrigate_1", NameAllPilot, NumAllPilots, Frequency_Command)
	elseif (genericShipName=="battlecruiser") then
		playSpeechActor("COMMAND_AnyShipGenericDockBattlecruiser_1", NameAllPilot, NumAllPilots, Frequency_Command)
	elseif (genericShipName=="resourcecontroller") then
		playSpeechActor("COMMAND_AnyShipGenericDockResourceController_1", NameAllPilot, NumAllPilots, Frequency_Command )
	else
		playSpeechActor("COMMAND_StrikeCraftDock", NameFighterPilot, NumFighterPilots, Frequency_Command)
	end
	
	
end

function CommandParadeGiven(shipname, targetname)

	if (shipname=="STRIKE") then
		-- can't find in new speech
		playSpeech("STATUS_StrikeCraftNowFollowing")
		return
	end
	familyName = getFamily(shipname)
	if(familyName == "FIGHTER" or familyName == "CORVETTE") then
		-- can't find in new speech
		playSpeechFreq("STATUS_StrikeCraftNowFollowing", 15)
	end
end

function CommandRetireGiven(shipname, targetname)

	local shipType = getType(shipname)

	if (shipType==Capital ) then
		playSpeechActor("COMMAND_CapitalShipRetire", NameCapPilot, NumCapPilots, Frequency_Command )
	elseif (shipType==Frigate) then
		playSpeechActor("COMMAND_FrigateRetire", NameCapPilot, NumCapPilots, Frequency_Command )
	elseif (shipType==Fighter) then
		playSpeechActor("COMMAND_FighterRetire", NameFighterPilot, NumFighterPilots, Frequency_Command )
	elseif (shipType==Support) then
		playSpeechActor("COMMAND_SupportShipRetire", NameSupportPilot, NumSupportPilots, Frequency_Command )
	else
		playSpeechActor("COMMAND_FighterRetire", NameFighterPilot, NumFighterPilots, Frequency_Command )
	end
end

-- DEFINED IN TABLE (see Chatter.lua)

--~ function CommandCouldNotBeIssued(shipname)
--~ 	playSpeech( "COMMAND_CANNOT" )
--~ end

--~ function CommandCloakTurnedOn(shipname)
--~ 	playSpeech( "COMMAND_CloakingShipsCloakingOn_Report" )
--~ end

--~ function CommandCloakTurnedOff(shipname)
--~ 	playSpeech( "COMMAND_CloakingShipsDeCloak" )
--~ end

--~ function CommandCloakOutOfPower(shipname)
--~ 		-- can't find in new speech
--~ 	playSpeech( "COMMAND_CloakingShipsInsufficientPowerToCloak" )
--~ end

AggressiveTactics = 0
DefensiveTactics = 1
PassiveTactics = 2

function CommandTacticsChanged(shipname, newSetting)
	local drone = strfind(strlower(shipname), "kus_drone")
	local dronefrigate = strfind(strlower(shipname), "kus_dronefrigate")
	if drone == nil or dronefrigate ~= nil then
		if(newSetting == AggressiveTactics) then
			playSpeechActor( "COMMAND_SetTacticsAggressive", NameAllPilot, NumAllPilots, Frequency_Command )
		elseif(newSetting == DefensiveTactics) then
			playSpeechActor( "COMMAND_SetTacticsDefensive", NameAllPilot, NumAllPilots, Frequency_Command )
		elseif(newSetting == PassiveTactics) then
			playSpeechActor( "COMMAND_SetTacticsPassive", NameAllPilot, NumAllPilots, Frequency_Command )
		end
	end
end

CloseRange = 0
MediumRange = 1
LongRange = 2

function CommandEngagementRangeChanged(shipname, newSetting)
	if(newSetting == CloseRange) then
		playSpeechActor( "COMMAND_SetRangeShort", NameAllPilot, NumAllPilots, Frequency_Command )
	elseif(newSetting == MediumRange) then
		playSpeechActor( "COMMAND_SetRangeMedium", NameAllPilot, NumAllPilots, Frequency_Command )
	elseif(newSetting == LongRange) then
		playSpeechActor( "COMMAND_SetRangeLong", NameAllPilot, NumAllPilots, Frequency_Command )
	end
end

function CommandEngagementRangeForceChanged(shipname, force)
	if(force == 1) then
		playSpeechActor( "COMMAND_SetRangeForce" , NameAllPilot, NumAllPilots, Frequency_Command )
	end
end

ACT_Selected = 1
ACT_Created = 2
ACT_Reinforced = 3

function CommandHotKeyGroupSelected(shipname, groupNumber, keyAction)

	if (strfind (shipname, "Kpr_") ~= nil) then
		return
	end

	if (keyAction==ACT_Created) then

		if (groupNumber==10) then
			playSpeechActor("COMMAND_GROUP_Assigned_10", raceHelper(), 0, Frequency_Command )
		else
			playSpeechActor("COMMAND_GROUP_Assigned_0"..groupNumber, raceHelper(), 0, Frequency_Command )
		end
		
		return
	
	end

	if (keyAction==ACT_Reinforced) then

		if (groupNumber==10) then
			playSpeechActor("STATUS_HotkeyGroup_Added_20_2", raceHelper(), 0, Frequency_Command )
		else
			playSpeechActor("STATUS_HotkeyGroup_Added_0"..groupNumber.."_2", raceHelper(), 0, Frequency_Command )
		end
		
		return
	
	end
	
	if (groupNumber==10) then
		playSpeechActor("COMMAND_SelectGroup10", NameCapPilot, NumCapPilots, Frequency_Command )
	else
		playSpeechActor("COMMAND_SelectGroup0"..groupNumber, NameCapPilot, NumCapPilots, Frequency_Command )
	end
	
end

-- was DEFINED IN TABLE (see Chatter.lua)
function CommandShipsSelected(shipname)

	--print("**** CommandShipsSelected = "..shipname)

	genericShipName = strsub(shipname,5)
	
	if (strfind (strupper(shipname), "PROBE") ~= nil or genericShipName=="ProximitySensor" or genericShipName=="SensorArray" or genericShipName=="CryoTray"or genericShipName=="CryoTray_M03") then
		playSpeechActor("Command_Probe_Selected", NameAllPilot, 1, Frequency_Command )
		return
	end
	
	if (strfind (shipname, "Kpr_") ~= nil) then
		playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command )
		return
	end	

	--NOTE TODO: for selecting mothership, play shipname (SHIPNAME_Pride_1 or SHIPNAME_Mothership_1)
	shiptype = getType(shipname)
	
	
	if (shiptype == Flagship and shipname~="Hgn_Dreadnaught" and shipname~="Vgr_Dreadnaught") then
		playSpeechActor("COMMAND_SELECTED_1", raceHelper(), 0, Frequency_Command )
		return
	end

	familyName = getFamily(shipname)
	
	if(familyName == "FRIGATE" or familyName == "CAPITAL" or familyName == "SUPERCAP") then
		playSpeechActor("COMMAND_CAPITALSELECTED", NameCapPilot, NumCapPilots, Frequency_Command )
	else
		playSpeechActor("COMMAND_Selected", NameFighterPilot, NumFighterPilots, Frequency_Command )
	end
	
end

-- construction map
sscMap = {}
sscMap["Battlecruiser"] = {}
sscMap["Carrier"] = {}
sscMap["Shipyard"] = {}
sscMap["MotherShip"] = {}

sscMap["Carrier"].C_PRODUCTION_FIGHTER = "STATUS_FighterFacilityConstructedFromCarrier_1"
sscMap["Carrier"].C_PRODUCTION_CORVETTE = "STATUS_CorvetteFacilityConstructedFromCarrier_1"
sscMap["Carrier"].C_PRODUCTION_FRIGATE = "STATUS_FrigateFacilityConstructedFromCarrier_1"
sscMap["Carrier"].C_PRODUCTION_FRIGATEADVANCED = "STATUS_AdvancedFrigateFacilityConstructedFromCarrier_1"
sscMap["Carrier"].C_MODULE_PLATFORMCONTROL = "STATUS_PlatformFacilityConstructedFromCarrier_1"
sscMap["Carrier"].C_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromCarrier_1"
sscMap["Carrier"].C_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromCarrier_1"
sscMap["Carrier"].C_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromCarrier_1"
sscMap["Carrier"].C_SENSORS_ADVANCEDARRAY = "STATUS_SensorsArrayConstructedFromCarrier_1"
sscMap["Carrier"].C_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromCarrier_1"

sscMap["Shipyard"].MS_PRODUCTION_FIGHTER = "STATUS_FighterFacilityConstructedFromShipyard_1"
sscMap["Shipyard"].MS_PRODUCTION_CORVETTE = "STATUS_CorvetteFacilityConstructedFromShipyard_1"
sscMap["Shipyard"].MS_PRODUCTION_FRIGATE = "STATUS_FrigateFacilityConstructedFromShipyard_1"
sscMap["Shipyard"].MS_PRODUCTION_FRIGATEADVANCED = "STATUS_AdvancedFrigateFacilityConstructedFromShipyard_1"
sscMap["Shipyard"].MS_MODULE_PLATFORMCONTROL = "STATUS_PlatformFacilityConstructedFromShipyard_1"
sscMap["Shipyard"].SY_PRODUCTION_CAPSHIP = "STATUS_CapitalShipFacilityConstructedFromShipyard_1"
sscMap["Shipyard"].MS_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromShipyard_1"
sscMap["Shipyard"].MS_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromShipyard_1"
sscMap["Shipyard"].MS_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromShipyard_1"
sscMap["Shipyard"].MS_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromShipyard_1"

sscMap["Battlecruiser"].C_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromBattlecruiser_1"
sscMap["Battlecruiser"].C_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromBattlecruiser_1"
sscMap["Battlecruiser"].C_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromBattlecruiser_1"
sscMap["Battlecruiser"].C_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromBattlecruiser_1"


sscMap["MotherShip"].MS_PRODUCTION_FIGHTER = "STATUS_FighterFacilityConstructedFromMothership_1"
sscMap["MotherShip"].MS_PRODUCTION_CORVETTE = "STATUS_CorvetteFacilityConstructedFromMothership_1"
sscMap["MotherShip"].MS_PRODUCTION_FRIGATE = "STATUS_FrigateFacilityConstructedFromMothership_1"
sscMap["MotherShip"].MS_PRODUCTION_FRIGATEADVANCED = "STATUS_AdvancedFrigateFacilityConstructedFromMothership_1"
sscMap["MotherShip"].MS_MODULE_PLATFORMCONTROL = "STATUS_PlatformFacilityConstructedFromMothership_1"
sscMap["MotherShip"].MS_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromMothership_1"
sscMap["MotherShip"].MS_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromMothership_1"
sscMap["MotherShip"].MS_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromMothership_1"
sscMap["MotherShip"].MS_SENSORS_ADVANCEDARRAY = "STATUS_SensorsArrayConstructedFromMothership_1"
sscMap["MotherShip"].MS_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromMothership_1"
sscMap["MotherShip"].MS_MODULE_RESEARCHADVANCED = "STATUS_AdvResearchModuleConstructedFromMothership_1"
sscMap["MotherShip"].MS_PRODUCTION_CAPSHIP = "STATUS_CapitalShipFacilityConstructedFromMothership_1"
sscMap["MotherShip"].MS_PRODUCTION_CAPSHIPADVANCED = "STATUS_AdvancedCapitalShipFacilityConstructedFromMothership_1"


--Makaaaaaaan
--sscMap["Vgr_MotherShip"].VGR_MS_MODULE_HYPERSPACEINHIBITOR = "STATUS_VHyperspaceInhibitorConstructed_1"


--STATUS_SensorsArrayConstructedFromShipyard_1
--STATUS_AdvancedCapitalShipFacilityConstructedFromShipyard_1
--STATUS_SensorsArrayConstructedFromBattlecruiser_1
stdCMap = {}
stdCMap["HGN_SCOUT"] = "STATUS_ScoutConstructed_1"
stdCMap["HGN_INTERCEPTOR"] = "STATUS_InterceptorConstructed_1"
stdCMap["HGN_ATTACKBOMBER"] = "STATUS_BomberConstructed_1"
stdCMap["HGN_ATTACKBOMBERELITE"] = "STATUS_BomberConstructed_1"
stdCMap["HGN_ASSAULTCORVETTE"] = "STATUS_AssaultCorvetteConstructed_1"
stdCMap["HGN_ASSAULTCORVETTEELITE"] = "STATUS_AssaultCorvetteConstructed_1"
stdCMap["HGN_PULSARCORVETTE"] = "STATUS_PulsarCorvetteConstructed_1"
stdCMap["HGN_MINELAYERCORVETTE"] = "STATUS_MinelayerCorvetteConstructed_1"
stdCMap["HGN_ASSAULTFRIGATE"] = "STATUS_AssaultFrigateConstructed_1"
stdCMap["HGN_TORPEDOFRIGATE"] = "STATUS_TorpedoFrigateConstructed_1"
stdCMap["HGN_TORPEDOFRIGATEELITE"] = "STATUS_TorpedoFrigateConstructed_1"
stdCMap["HGN_IONCANNONFRIGATE"] = "STATUS_IonBeamFrigateConstructed"
stdCMap["HGN_SUPPORTFRIGATE"] = "STATUS_SupportFrigateConstructed_1"
stdCMap["HGN_MARINEFRIGATE"] = "STATUS_MarineFrigateConstructed_1"
stdCMap["HGN_DEFENSEFIELDFRIGATE"] = "STATUS_DefenseFieldFrigateConstructed_1"
stdCMap["HGN_DESTROYER"] = "STATUS_DestroyerConstructed_1"
stdCMap["HGN_CARRIER"] = "STATUS_CarrierConstructed_1"
stdCMap["HGN_BATTLECRUISER"] = "STATUS_BattlecruiserConstructed_1"
stdCMap["KPR_MOVER"] = "STATUS_MoverConstructed_1"
stdCMap["HGN_SHIPYARD"] = "STATUS_ShipyardConstructed_1"
stdCMap["HGN_GUNTURRET"] = "STATUS_GunTurretConstructed_1"
stdCMap["HGN_IONTURRET"] = "STATUS_IonBeamPlatformConstructed"
stdCMap["HGN_RESOURCECOLLECTOR"] = "STATUS_ResourceCollectorConstructed_1"
stdCMap["HGN_RESOURCECONTROLLER"] = "STATUS_ResourceControllerConstructed_1"
stdCMap["HGN_PROBE"] = "STATUS_ProbeConstructed_1"
stdCMap["HGN_ECMPROBE"] = "STATUS_SensorsDistortionProbeConstructed_1"
stdCMap["HGN_PROXIMITYSENSOR"] = "STATUS_ProximitySensorConstructed_1"

-- Makaan stuff
stdCMap["VGR_SCOUT"] = "STATUS_VScoutConstructed_1"
stdCMap["VGR_INTERCEPTOR"] = "STATUS_VAssaultCraftConstructed_1"
stdCMap["VGR_CRUSADER"] = "STATUS_VCrusaderConstructed_1"
stdCMap["VGR_LANCEFIGHTER"] = "STATUS_VLanceFighterConstructed_1"
stdCMap["VGR_BOMBER"] = "STATUS_VBomberConstructed_1"
stdCMap["VGR_LASERCORVETTE"] = "STATUS_VLaserCorvetteConstructed_1"
stdCMap["VGR_MISSILECORVETTE"] = "STATUS_VMissileCorvetteConstructed_1"
stdCMap["VGR_MINELAYERCORVETTE"] = "STATUS_VMinelayerCorvetteConstructed_1"
stdCMap["VGR_COMMANDCORVETTE"] = "STATUS_VCommandCorvetteConstructed_1"
stdCMap["VGR_ASSAULTFRIGATE"] = "STATUS_VAssaultFrigateConstructed_1"
stdCMap["VGR_INFILTRATORFRIGATE"] = "STATUS_VInfiltratorFrigateConstructed_1"
stdCMap["VGR_HEAVYMISSILEFRIGATE"] = "STATUS_VHvyMissilFrigateConstructed_1"
stdCMap["VGR_TRANSPORTFRIGATE"] = "STATUS_VTransportFrigateConstructed_1"
stdCMap["VGR_SHIPYARD"] = "STATUS_VShipyardConstructed_1"
stdCMap["VGR_CARRIER"] = "STATUS_VCarrierConstructed_1"
stdCMap["VGR_BATTLECRUISER"] = "STATUS_VBattleCruiserConstructed_1"
stdCMap["VGR_DESTROYER"] = "STATUS_VDestroyerConstructed_1"
stdCMap["VGR_RESOURCECOLLECTOR"] = "STATUS_VResourceCollectorConstructed_1"
stdCMap["VGR_RESOURCECONTROLLER"] = "STATUS_VResourceControllerConstructed_1"
stdCMap["VGR_PROBE"] = "STATUS_VProbeConstructed_1"
stdCMap["VGR_PROBE_ECM"] = "STATUS_VSensorDistortionProbeConstructed_1"
stdCMap["VGR_PROBE_PROX"] = "STATUS_VProxProbeConstructed_1"
stdCMap["VGR_HYPERSPACE_PLATFORM"] = "STATUS_VHyperspacePlatformConstructed_1"
stdCMap["VGR_WEAPONPLATFORM_GUN"] = "STATUS_VGunPlatformConstructed_1"
stdCMap["VGR_WEAPONPLATFORM_MISSILE"] = "STATUS_VMissilePlatformConstructed_1"

-- Kushan stuff
stdCMap["KUS_SCOUT"] = "STATUS_ScoutConstructed"
stdCMap["KUS_INTERCEPTOR"] = "STATUS_InterceptorConstructed"
stdCMap["KUS_ATTACKBOMBER"] = "STATUS_AttackBomberConstructed_1"
stdCMap["KUS_DEFENDER"] = "STATUS_DefenderConstructed_1"
stdCMap["KUS_CLOAKEDFIGHTER"] = "STATUS_CloakedFighterConstructed_1"
stdCMap["KUS_LIGHTCORVETTE"] = "STATUS_LightCorvetteConstructed_1"
stdCMap["KUS_HEAVYCORVETTE"] = "STATUS_HeavyCorvetteConstructed_1"
stdCMap["KUS_MULTIGUNCORVETTE"] = "STATUS_MultiGunCorvetteConstructed_1"
stdCMap["KUS_MINELAYERCORVETTE"] = "STATUS_MinelayerCorvetteConstructed_1"
stdCMap["KUS_REPAIRCORVETTE"] = "STATUS_RepairCorvetteConstructed_1"
stdCMap["KUS_SALVAGECORVETTE"] = "STATUS_SalvageCorvetteConstructed_1"
stdCMap["KUS_SUPPORTFRIGATE"] = "STATUS_SupportFrigateConstructed_1"
stdCMap["KUS_ASSAULTFRIGATE"] = "STATUS_AssaultFrigateConstructed"
stdCMap["KUS_IONCANNONFRIGATE"] = "STATUS_IonBeamFrigateConstructed"
stdCMap["KUS_DRONEFRIGATE"] = "STATUS_DroneFrigateConstructed_1"
stdCMap["KUS_DESTROYER"] = "STATUS_DestroyerConstructed_1"
stdCMap["KUS_MISSILEDESTROYER"] = "STATUS_MissileDestroyerConstructed_1"
stdCMap["KUS_CARRIER"] = "STATUS_CarrierConstructed_1"
stdCMap["KUS_HEAVYCRUISER"] = "STATUS_HeavyCruiserConstructed_1"
stdCMap["KUS_RESOURCECOLLECTOR"] = "STATUS_ResourceCollectorConstructed_1"
stdCMap["KUS_RESOURCECONTROLLER"] = "STATUS_ResourceControllerConstructed"
stdCMap["KUS_RESEARCHSHIP"] = "STATUS_ResearchShipConstructed_1"
stdCMap["KUS_RESEARCHSHIP_1"] = "STATUS_ResearchShipConstructed_1"
stdCMap["KUS_RESEARCHSHIP_2"] = "STATUS_ResearchShipConstructed_1"
stdCMap["KUS_RESEARCHSHIP_3"] = "STATUS_ResearchShipConstructed_1"
stdCMap["KUS_RESEARCHSHIP_4"] = "STATUS_ResearchShipConstructed_1"
stdCMap["KUS_RESEARCHSHIP_5"] = "STATUS_ResearchShipConstructed_1"
stdCMap["KUS_PROBE"] = "STATUS_ProbeConstructed_1"
stdCMap["KUS_PROXIMITYSENSOR"] = "STATUS_ProximitySensorConstructed_1"
stdCMap["KUS_CLOAKGENERATOR"] = "STATUS_CloakGeneratorConstructed_1"
stdCMap["KUS_GRAVWELLGENERATOR"] = "STATUS_GravWellGeneratorConstructed_1"
stdCMap["KUS_SENSORARRAY"] = "STATUS_SensorsArrayConstructed_1"

-- Taiidan stuff
stdCMap["TAI_SCOUT"] = "STATUS_ScoutConstructed"
stdCMap["TAI_INTERCEPTOR"] = "STATUS_InterceptorConstructed"
stdCMap["TAI_ATTACKBOMBER"] = "STATUS_AttackBomberConstructed"
stdCMap["TAI_DEFENDER"] = "STATUS_DefenderConstructed"
stdCMap["TAI_DEFENSEFIGHTER"] = "STATUS_DefenseFighterConstructed"
stdCMap["TAI_LIGHTCORVETTE"] = "STATUS_LightCorvetteConstructed"
stdCMap["TAI_HEAVYCORVETTE"] = "STATUS_HeavyCorvetteConstructed"
stdCMap["TAI_MULTIGUNCORVETTE"] = "STATUS_MultiGunCorvetteConstructed"
stdCMap["TAI_MINELAYERCORVETTE"] = "STATUS_MinelayerCorvetteConstructed_1"
stdCMap["TAI_REPAIRCORVETTE"] = "STATUS_RepairCorvetteConstructed"
stdCMap["TAI_SALVAGECORVETTE"] = "STATUS_SalvageCorvetteConstructed"
stdCMap["TAI_SUPPORTFRIGATE"] = "STATUS_SupportFrigateConstructed"
stdCMap["TAI_ASSAULTFRIGATE"] = "STATUS_AssaultFrigateConstructed"
stdCMap["TAI_IONCANNONFRIGATE"] = "STATUS_IonCannonFrigateConstructed"
stdCMap["TAI_FIELDFRIGATE"] = "STATUS_FieldFrigateConstructed"
stdCMap["TAI_DESTROYER"] = "STATUS_DestroyerConstructed_1"
stdCMap["TAI_MISSILEDESTROYER"] = "STATUS_MissileDestroyerConstructed"
stdCMap["TAI_CARRIER"] = "STATUS_CarrierConstructed_1"
stdCMap["TAI_HEAVYCRUISER"] = "STATUS_HeavyCruiserConstructed"
stdCMap["TAI_RESOURCECOLLECTOR"] = "STATUS_ResourceCollectorConstructed_1"
stdCMap["TAI_RESOURCECONTROLLER"] = "STATUS_ResourceControllerConstructed"
stdCMap["TAI_RESEARCHSHIP"] = "STATUS_ResearchShipConstructed"
stdCMap["TAI_RESEARCHSHIP_1"] = "STATUS_ResearchShipConstructed"
stdCMap["TAI_RESEARCHSHIP_2"] = "STATUS_ResearchShipConstructed"
stdCMap["TAI_RESEARCHSHIP_3"] = "STATUS_ResearchShipConstructed"
stdCMap["TAI_RESEARCHSHIP_4"] = "STATUS_ResearchShipConstructed"
stdCMap["TAI_RESEARCHSHIP_5"] = "STATUS_ResearchShipConstructed"
stdCMap["TAI_PROBE"] = "STATUS_ProbeConstructed_1"
stdCMap["TAI_PROXIMITYSENSOR"] = "STATUS_ProxProbeConstructed_1"
stdCMap["TAI_CLOAKGENERATOR"] = "STATUS_CloakGeneratorConstructed"
stdCMap["TAI_GRAVWELLGENERATOR"] = "STATUS_GravWellGeneratorConstructed"
stdCMap["TAI_SENSORARRAY"] = "STATUS_SensorsArrayConstructed"

BUILD_Std = 1
BUILD_Subsystem = 2

function CommandConstructionComplete(buildingShip, builtItem, buildType)

	print("*****---- CommandConstructionComplete : buildingShip="..buildingShip..", builtItem="..builtItem..", buildType="..buildType)
		
	if (buildingShip==nil or builtItem==nil) then
		return
	end
	
	--eliminate race
	genericbuildingShipName = strsub(buildingShip,5)
	genericbuiltItemName = strsub(builtItem,5)
	
	if (buildType==BUILD_Subsystem) then
	
		--print("sscMap[''..buildingShip][''..builtItem]  = "..sscMap[""..buildingShip][""..builtItem])
	
		if (sscMap[""..genericbuildingShipName]~= nil and sscMap[""..genericbuildingShipName][""..genericbuiltItemName] ~= nil) then
		
			if (strfind (strupper(builtItem), "INHIBITOR") ~= nil) then
			
				if (genericbuildingShipName=="Carrier") then
					playSpeechActorLinked("STATUS_HyperspaceInhibConstructedFromCarrier_1", NameCapPilot, NumCapPilots, Frequency_Command, CE_STS_INHIBITORONLINE )
				elseif (genericbuildingShipName=="Shipyard") then
					playSpeechActorLinked("STATUS_HyperspaceInhibConstructedFromShipyard_1", NameSupportPilot, NumSupportPilots , Frequency_Command, CE_STS_INHIBITORONLINE)
				elseif (genericbuildingShipName=="Battlecruiser") then
					playSpeechActorLinked( "STATUS_HyperspaceInhibConstructedFromBattle_1", NameCapPilot, NumCapPilots, Frequency_Command, CE_STS_INHIBITORONLINE)
				else
					playSpeechActor( "STATUS_HYPERSPACEINHIB_ON", NameSupportPilot, NumSupportPilots, Frequency_Command)
				end
			end
			
			if (genericbuildingShipName == "Shipyard") then
				playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], NameSupportPilot, NumSupportPilots, Frequency_Command )
			elseif (genericbuildingShipName == "MotherShip") then
				playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], raceHelper(), 0, Frequency_Command)
			else
				playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], NameCapPilot, NumCapPilots, Frequency_Command )
			end
		else
			playSpeechActor("COMMAND_SubsystemConstructed", NameCapPilot, NumCapPilots, Frequency_Command )
		end
		
		
	elseif (buildType==BUILD_Std) then
		
		builtItem = strupper(builtItem)
		if (stdCMap[""..builtItem] ~= nil) then
			playSpeechActor(stdCMap[""..builtItem], raceHelper(), 0, Frequency_Command)
		end
	
	end
end

function CommandConstructionStarted(buildingShip, builtItem)
	
	--builtItemFamily = getFamily(builtItem)
	--if(builtItemFamily == "FRIGATE" or builtItemFamily == "CAPITAL" or builtItemFamily == "SUPERCAP") then
	--	playSpeechActor("COMMAND_CarrierOrMShipBuildCapitalShip", NameSupportPilot, NumSupportPilots, Frequency_Command )
	--	return
	--end
	
	genericbuildingShipName = strsub(buildingShip,5)
	
	if (genericbuildingShipName=="MotherShip") then
		playSpeechActor("STATUS_ConstructionBegun_1", raceHelper(), 0, Frequency_Command)
	else
		playSpeechActor("COMMAND_CarrierOrMShipBuildCapitalShip", NameSupportPilot, NumSupportPilots, Frequency_Command )
	end
	

end

function CommandPaused(temp)
	--print("*** build paused")
	playSpeechActor("COMMAND_Build_Paused", raceHelper(), 0, Frequency_Command)
end


-- DEFINED IN TABLE (see Chatter.lua)

--~ function CommandResourcesDepleted(shipname)
--~ 	playSpeech("COMMAND_ResourceCollectorNoMoreRUs")
--~ end

--~ function CommandStrikeGroupFormed()
--~ 	playSpeech("COMMAND_StrikeGroup_Form_Report")
--~ end
