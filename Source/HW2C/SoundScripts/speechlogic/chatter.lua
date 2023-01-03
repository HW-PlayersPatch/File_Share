--  ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
--  =============================================================================

function Chatter_Init()
	setGlobalFrequencyModifier(0.8)
	setGlobalFrequencyMin(-10)
	setGlobalFrequencyMax(1.5)
end

currentRace = 1

Probabilities = {
	{name = "ChatterProb", randomWeight = 80, maxDistance = 20000, expDistance = 1, minWaveLength = 30, expWaveLength = 10, minRepeatProximity = 10000, expRepeatProximity = 0.8},
	{name = "ChatterProbNoLoc", randomWeight = 80, maxDistance = 20000, expDistance = 1, minWaveLength = 30, expWaveLength = 10, minRepeatProximity = 0, expRepeatProximity = 0},
	{name = "StatusProb", randomWeight = 99, maxDistance = 20000, expDistance = 1, minWaveLength = 2, expWaveLength = 1, minRepeatProximity = 2000, expRepeatProximity = 1},
	{name = "StatusProbHighNoRepeatLocation", randomWeight = 99, maxDistance = 20000, expDistance = 0, minWaveLength = 5, expWaveLength = 1, minRepeatProximity = 3000, expRepeatProximity = 2},
	{name = "StatusProbLow", randomWeight = 50, maxDistance = 2000, expDistance = 1, minWaveLength = 5, expWaveLength = 8, minRepeatProximity = 1000, expRepeatProximity = 2},
	{name = "StatusProbNoRepeat", randomWeight = 99, maxDistance = 20000, expDistance = 1, minWaveLength = 20, expWaveLength = 15, minRepeatProximity = 1000, expRepeatProximity = 2},
	{name = "CommandProb", randomWeight = 100, maxDistance = 400000, expDistance = 0, minWaveLength = 2, expWaveLength = 1, minRepeatProximity = 0, expRepeatProximity = 0},
	{name = "CommandProbNoRepeat", randomWeight = 100, maxDistance = 400000, expDistance = 0, minWaveLength = 50, expWaveLength = 100, minRepeatProximity = 0, expRepeatProximity = 0.8},
	{name = "FullProb", randomWeight = 100, maxDistance = 200000, expDistance = 0, minWaveLength = 0, expWaveLength = 0, minRepeatProximity = 0, expRepeatProximity = 0},
	{name = "ChatterRepeaterProb", randomWeight = 99, maxDistance = 40000, expDistance = 1, minWaveLength = 1, expWaveLength = 0, minRepeatProximity = 20000, expRepeatProximity = 0},
	{name = "StatusLowRandomProb", randomWeight = 30, maxDistance = 40000, expDistance = 1, minWaveLength = 3, expWaveLength = 1, minRepeatProximity = 2000, expRepeatProximity = 1},}

F_S = 1
F_N = 2
F_SS = 3
F_SN = 4
F_SSN = 5
F_SNN = 6

NumAllPilots = 5
NumCapPilots = 4
NumFighterPilots = 3
NumInfiltratorPilots = 2
NumMarinePilots = 2
NumSupportPilots = 3

NameAllPilot = "All_"
NameCapPilot = "Cap_"
NameFighterPilot = "Fighter_"
NameInfiltratorPilot = "Infiltrator_"
NameMarinePilot = "Marine_"
NameSupportPilot = "Support_"
NameFleetCommand = "Fleet"
NameMakaan = "Makaan"

ChatterEvents = {
	{id = CE_CMD_MOVE, name = "CommandMoveGiven", probability = "CommandProb", customFnc = {"CommandMoveGiven", F_SS},},
	{id = CE_CMD_WPMOVE, name = "CommandWayPointMoveGiven", probability = "CommandProb", customFnc = {"CommandWayPointMoveGiven", F_SS},},
	{id = CE_CMD_MOVETOSOB, name = "CommandMoveToSobGiven", probability = "CommandProb", customFnc = {"CommandMoveToSobGiven", F_SS},},
	{id = CE_CMD_IDLE, name = "CommandIdleGiven", probability = "CommandProb", speechFile = "COMMAND_MoveCancelled", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_CMD_RESOURCE, name = "CommandResourceGiven", probability = "CommandProb", customFnc = {"CommandResourceGiven", F_SS},},
	{id = CE_CMD_CAPTURE, name = "CommandCaptureGiven", probability = "CommandProb", customFnc = {"CommandCaptureGiven", F_SS},},
	{id = CE_CMD_ATTACK, name = "CommandAttackGiven", probability = "CommandProb", customFnc = {"CommandAttackGiven", F_SSN},},
	{id = CE_CMD_LAUNCH, name = "CommandLaunchGiven", probability = "CommandProb", customFnc = {"CommandLaunchGiven", F_SS},},
	{id = CE_CMD_GUARD, name = "CommandGuardGiven", probability = "CommandProb", customFnc = {"CommandGuardGiven", F_SS}},
	{id = CE_CMD_DOCK, name = "CommandDockGiven", probability = "CommandProb", customFnc = {"CommandDockGiven", F_SS},},
	{id = CE_CMD_PARADE, name = "CommandParadeGiven", probability = "CommandProb", customFnc = {"CommandParadeGiven", F_SS},},
	{id = CE_CMD_RETIRE, name = "CommandRetireGiven", probability = "CommandProb", customFnc = {"CommandRetireGiven", F_SS},},
	{id = CE_CMD_COULDNOT, name = "CommandCouldNotBeIssued", probability = "CommandProb", speechFile = "COMMAND_CANNOT", actor = {NameAllPilot, NumAllPilots}},
	{id = CE_CMD_CLOAKON, name = "CommandCloakTurnedOn", probability = "CommandProb", speechFile = "COMMAND_CloakingShipsCloakingOn_Report", actor = {NameCapPilot, NumCapPilots},},
	{id = CE_CMD_CLOAKOFF, name = "CommandCloakTurnedOff", probability = "CommandProb", speechFile = "COMMAND_CloakingShipsDeCloak", actor = {NameCapPilot, NumCapPilots},},
	{id = CE_CMD_CLOAKPOWEROUT, name = "CommandCloakOutOfPower", probability = "CommandProb", speechFile = "COMMAND_CloakingShipsInsufficientPowerToCloak", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_CMD_CLOAKLOWPOWER, name = "CommandCloakLowPower", probability = "StatusProb", speechFile = "STATUS_CloakingShipsCloakingPowerLow_Report", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_CMD_TACTICSCHANGE, name = "CommandTacticsChanged", probability = "CommandProb", customFnc = {"CommandTacticsChanged", F_SN}},
	{id = CE_CMD_RANGECHANGE, name = "CommandEngagementRangeChanged", probability = "CommandProb", customFnc = {"CommandEngagementRangeChanged", F_SN},},
	{id = CE_CMD_RANCEFORCECHANGE, name = "CommandEngagementRangeForceChanged", probability = "CommandProb", customFnc = {"CommandEngagementRangeForceChanged", F_SN},},
	{id = CE_CMD_HOTKEYGRP, name = "CommandHotKeyGroupSelected", probability = "CommandProb", customFnc = {"CommandHotKeyGroupSelected", F_SNN},},
	{id = CE_CMD_SHIPSELECTED, name = "CommandShipsSelected", probability = "CommandProb", customFnc = {"CommandShipsSelected", F_S},},
	{id = CE_CMD_CONSTRUCTIONCOMPLETE, name = "CommandConstructionComplete", probability = "CommandProb", customFnc = {"CommandConstructionComplete", F_SSN},},
	{id = CE_CMD_CONSTRUCTIONSTARTED, name = "CommandConstructionStarted", probability = "CommandProb", customFnc = {"CommandConstructionStarted", F_SS},},
	{id = CE_CMD_RESOURCESDEPLETED, name = "StatusResources", probability = "StatusProb", customFnc = {"StatusResources", F_SN},},
	{id = CE_CMD_STRIKEGROUPFORMED, name = "CommandStrikeGroupFormed", probability = "CommandProb", customFnc = {"CommandStrikeGroupFormed", F_SN},},
	{id = CE_STS_RETALIATING, name = "StatusRetaliating", probability = "StatusProbNoRepeat", customFnc = {"StatusRetaliating", F_SN},},
	{id = CE_STS_UNDERFIRENEEDORDERS, name = "StatusUnderFireNeedOrders", probability = "StatusProbHighNoRepeatLocation", customFnc = {"StatusUnderFireNeedOrders", F_SSN},},
	{id = CE_STS_ATTACKCOMPLETE, name = "StatusAttackComplete", probability = "StatusProb", customFnc = {"StatusAttackComplete", F_SN},},
	{id = CE_STS_CAPTURECOMPLETE, name = "StatusCaptureComplete", probability = "CommandProb", customFnc = {"StatusCaptureComplete", F_SSN},},
	{id = CE_STS_CAPTUREFAILED, name = "StatusCaptureFailed", probability = "StatusProb", speechFile = "STATUS_MarineFrigate_Failure", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_STS_REPAIRS, name = "StatusRepairs", probability = "StatusProb", customFnc = {"StatusRepairs", F_SSN},},
	{id = CE_STS_SHIPDESTROYED, name = "StatusShipDestroyed", probability = "CommandProb", customFnc = {"StatusShipDestroyed", F_SN},},
	{id = CE_STS_COLLECTORFULL, name = "StatusCollectorFull", probability = "StatusProbLow", speechFile = "CHATTER_ResourceCollectorFull", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_STS_RESOURCESTRANSFERRED, name = "StatusResourcesTransferred", probability = "StatusProbLow", speechFile = "CHATTER_ResourceCollectorResourcesTransferred", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_STS_SHIPDOCKED, name = "StatusShipDocked", probability = "StatusProb", customFnc = {"StatusShipDocked", F_SS},},
	{id = CE_STS_LIGHTDAMAGE, name = "StatusTakingLightDamage", probability = "StatusProbHighNoRepeatLocation", customFnc = {"StatusTakingLightDamage", F_SN},},
	{id = CE_STS_HEAVYDAMAGE, name = "StatusTakingHeavyDamage", probability = "StatusProbHighNoRepeatLocation", customFnc = {"StatusTakingHeavyDamage", F_S},},
	{id = CE_STS_DAMAGED, name = "StatusDamaged", probability = "StatusProbHighNoRepeatLocation", customFnc = {"StatusDamaged", F_S},},
	{id = CE_STS_INMINEFIELD, name = "StatusInMineField", probability = "FullProb", customFnc = {"StatusInMineField", F_SN},},
	{id = CE_STS_CRITICALDAMAGE, name = "StatusCriticallyDamaged", probability = "FullProb", customFnc = {"StatusCriticallyDamaged", F_S},},
	{id = CE_STS_BATTLEMOMENTUM, name = "StatusBattleMomentum", probability = "StatusLowRandomProb", customFnc = {"StatusBattleMomentum", F_N},},
	{id = CE_CMD_HYPERSPACE, name = "CommandHyperspaceGiven", probability = "CommandProb", customFnc = {"CommandHyperspaceGiven", F_SN},},
	{id = CE_CMD_HYPERSPACEFORMGATE, name = "CommandFormHyperspaceGate", probability = "CommandProb", speechFile = "COMMAND_HYPERGATEDEPLOY", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CMD_HYPERSPACEGATELINKED, name = "CommandHyperspaceGateLinked", probability = "CommandProb", speechFile = "COMMAND_HYPERGATELINKED", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CMD_BUILD, name = "CommandBuild", probability = "CommandProb", speechFile = "COMMAND_CARRIERORMSHIPBUILDCAPITALSHIP", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CMD_LAYMINES, name = "CommandLayMines", probability = "CommandProb", speechFile = "COMMAND_MinelayerCorvette_LayMines_1", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CMD_REPAIR, name = "CommandRepair", probability = "CommandProb", speechFile = "COMMAND_STARTEDREPAIRS", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CMD_CANCEL, name = "CommandCancel", probability = "CommandProb", customFnc = {"CommandCancelOrder", F_SN},},
	{id = CE_CHT_DOCK, name = "ChatterDock", probability = "ChatterProb", speechFile = "CHATTER_ANYSHIPDOCKING", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CHT_FIGHTERCHASED, name = "ChatterFighterChased", probability = "ChatterProb", speechFile = "CHATTER_FIGHTERCHASED_REPORT", actor = {NameFighterPilot, NumFighterPilots},},
	{id = CE_CMD_MOVEATTACK, name = "CommandMoveAttack", probability = "CommandProb", customFnc = {"CommandMoveAttackGiven", F_SS},},
	{id = CE_CMD_COMBATMAN, name = "CommandCombatManeuvers", probability = "CommandProb", customFnc = {"CommandCombatMan", F_SS},},
	{id = CE_STS_HYPERSPACEEXIT, name = "StatusHyperSpaceExit", probability = "CommandProb", customFnc = {"StatusHyperspaceExit", F_S},},
	{id = CE_CMD_DEFENSEFIELDCHANGED, name = "CommandDefenseFieldChanged", probability = "CommandProb", customFnc = {"CommandDefenseFieldChanged", F_SN},},
	{id = CE_CHT_MISC, name = "ChatterMisc", probability = "ChatterProb", customFnc = {"ChatterMisc", F_SSN},},
	{id = CE_STS_UNDERATTACK, name = "StatusUnderAttack", probability = "StatusProbHighNoRepeatLocation", customFnc = {"StatusUnderAttack", F_SSN},},
	{id = CE_STS_SUBSYS, name = "StatusSubsystem", probability = "StatusProbHighNoRepeatLocation", customFnc = {"StatusSubsystem", F_SSN},},
	{id = CE_STS_CAPWELCOME, name = "ChatterWelcomeShip", probability = "ChatterProb", speechFile = "STATUS_AnyShipCapitalShipWelcomed", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_STS_CLOUD, name = "StatusCloud", probability = "StatusProbNoRepeat", customFnc = {"StatusCloud", F_SN},},
	{id = CE_CHT_SMALLHITRESPONSE, name = "ChatterSmallHitResponse", probability = "ChatterProb", speechFile = "CHATTER_CAPITALSHIPSMALLHITS_RESPONSE", actor = {NameCapPilot, NumCapPilots},},
	{id = CE_STS_RESOURCERSTOOBUSY, name = "StatusResourcersTooBusy", probability = "StatusProbNoRepeat", speechFile = "STATUS_RESOURCEPOCKETTOOBUSY_1", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_STS_RESEARCHCOMPLETE, name = "StatusResearchComplete", probability = "CommandProb", customFnc = {"StatusResearchComplete", F_S},},
	{id = CE_CHT_BUILDINGSHIP, name = "ChatterBuildingShip", probability = "ChatterProbNoLoc", speechFile = "CHATTER_CarrierOrMShipConstruction", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CMD_BUILDPAUSE, name = "CommandPaused", probability = "CommandProbNoRepeat", customFnc = {"CommandPaused", F_S},},
	{id = CE_CHT_BATTLEMISC, name = "BattleChatMisc", probability = "ChatterProb", customFnc = {"BattleChatMisc", F_SSN},},
	{id = CE_STS_HYPERSPACEINTERRUPTED, name = "StatusHyperspaceInterrupted", probability = "CommandProb", customFnc = {"StatusHyperspaceInterrupted", F_S},},
	{id = CE_STS_RESEARCHAVAILABLE, name = "StatusResearchAvailable", probability = "CommandProb", customFnc = {"StatusResearchAvailable", F_S},},
	{id = CE_STS_RESEARCHNORUS, name = "StatusResearchNoRUs", probability = "CommandProbNoRepeat", customFnc = {"StatusResearchNoRUs", F_S},},
	{id = CE_STS_UPGRADECOMPLETE, name = "StatusUpgradeComplete", probability = "CommandProb", customFnc = {"StatusUpgradeComplete", F_S},},
	{id = CE_STS_UPGRADEAVAILABLE, name = "StatusUpgradeAvailable", probability = "CommandProb", customFnc = {"StatusUpgradeAvailable", F_S},},
	{id = CE_STS_UPGRADENORUS, name = "StatusUpdgradeNoRUs", probability = "CommandProbNoRepeat", customFnc = {"StatusUpdgradeNoRUs", F_S},},
	{id = CE_STS_INHIBITORONLINE, name = "StatusInhibOnline", probability = "CommandProb", speechFile = "STATUS_HYPERSPACEINHIB_ON", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CHT_LOSERESPONSE, name = "StatusLosingResponse", probability = "ChatterProb", speechFile = "CHATTER_GenericGroupLosingBattle_Response", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_CHT_WINRESPONSE, name = "StatusWinningResponse", probability = "ChatterProb", speechFile = "CHATTER_GenericGroupWinningBattle_Response", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_STS_RESOURCESDEPLETED, name = "StatusResourcersDepleted", probability = "CommandProb", speechFile = "STATUS_RESOURCECOLLECTORNOMORERUS", actor = {NameSupportPilot, NumSupportPilots},},
	{id = CE_CHT_ADVRESPONSE, name = "ChatBattleAdvantageResponse", probability = "ChatterProb", speechFile = "CHATTER_GenericGroupStartBattleAdvantaged_Response", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_CHT_FAIRRESPONSE, name = "ChatBattleFairResponse", probability = "ChatterProb", speechFile = "CHATTER_GenericGroupStartBattleFair_Response", actor = {NameAllPilot, NumAllPilots},},
	{id = CE_CHT_MISCHI, name = "ChatterMiscHighPriority", probability = "CommandProb", customFnc = {"ChatterMiscHighPriority", F_SSN},},
	{id = CE_CHT_MULTIPLAY, name = "CommandMultiplay", probability = "CommandProb", customFnc = {"CommandMultiplay", F_SN},},}
