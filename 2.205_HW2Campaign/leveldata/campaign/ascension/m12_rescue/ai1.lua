
aitrace("CPU: LOADING MISSION 12 PLAYER 1")

dofilepath("data:ai/default/default.lua")

setLevelOfDifficulty( 1 ) -- 0 = easy, 1 = standard, 2 = hard ( 0 is default )

--
-- INITIALIZATION
--
--  these functions are called once at the beginning of a level and override any variables the 'default' AI would have set. 
--  if these functions don't exist or are empty, nothing will happen. But these functions are called after the AI so they can 
--  be used to 'trump/ override' any AI set variables. These variables are used in the rules to guide/ manipulate/ constrain/ ...
-- Note: some of these variables may change by the default AI so by setting them once in the Init functions may not be enough
-- 

-- add stuff to override the initialization process
function Override_Init()

	-- global flag init
	-- setting any of these flags to 0 will turn off the named component
	
	-- build system - this builds ships and subsystems
	sg_dobuild = 1
	
	-- research system - this does the research
	sg_doresearch = 1
	
	-- this monitors and controls military stuffs - like group size, attack percentage, etc
	sg_domilitary = 1
	
	-- this turns off the code-level resource processing (refinery, collectors, ...)
	cp_processResource = 1
	
	-- this turns off the code-level military processing (attack, guard, scout, ...)
	cp_processMilitary = 1

end

-- add stuff in here to override the build initialization (ships and subsystems)
--function Override_BuildDemandInit()

	-- these are basic offsets for the demand of each of these ships classes
	-- these can be changed at anytime (there are many more classes then this)
	--sg_classPersonalityDemand[ eFighter ] = 1
	--sg_classPersonalityDemand[ eCorvette ] = 0
	--sg_classPersonalityDemand[ eFrigate ] = 3
	-- ...
	
	-- test tactic: this builds 10+ bombers and sends them at the enemy (could eventually be more)
	--sg_earlybomberattack = 0

--end

-- add stuff in here to override the research initialization (upgrades and tech)
--function Override_ResearchInit()

--	sg_upgradeResearchDemand = 1
--	sg_techResearchDemand = 1
	
--end

-- override any resource variables (and/or functions)
function Override_ResourceInit()

	-- control the number of collectors the AI will produce
	-- to control the logic of 'when' these are produced I will need to add another override (let me know if you need this)
	
--~ 	sg_minNumCollectors = 5
--~ 	sg_maxNumCollectors = 12

--~ 	-- this var specifies how many military units are needed before the AI builds its first refinery (deprecated)
--~ 	sg_refineryMilitaryLimit = 5
--~ 	
--~ 	-- how many collectors are needed before the first refinery-type ship is built (needs to be revisited)
--~ 	sg_collectorMinForRefinery = 6
--~ 	
    
    
    -- distances for assessing threats to a resource blob
    -- ships that are closer than this get all of their value added to the calculation
    cpMaxThreatAddedDistance = 6000
    -- ships that are between max and this get their value reduced, down to 0 at this value
    cpMinThreatAddedDistance = 12000
    -- anything beyond is ignored
    
    
    -- set the path used by collectors, code needs this to count up the paths on a refinery
    SetResourceDockFamily("Utility")

	sg_minNumCollectors = 5
	sg_maxNumCollectors = 12 -- based on unitcap and number of RUs on map
	-- should be getGameMaxUnitCaps()/4

	-- how many military ships does the player need to have before building a refinery
	sg_refineryMilitaryLimit = 100
	sg_collectorMinForRefinery = 100

end

-- override any military variables (and/or functions)
function Override_MilitaryInit()
	
	cp_attackPercent = 100
	
	-- number of ships in group needed before it attacks OR value (if either exceed this number the ships will become active to attack defend)
	-- this is also overridden by other factors (or should be)
	cp_minSquadGroupSize = 2
	cp_minSquadGroupValue = 100
		
	-- number of units a group will have before it will always attack - even if enemy has more/ better units
	cp_forceAttackGroupSize = 2
	
	-- what percentage modifier is used by the attackgroup when evaluating a target - so 70% means the enemy is reduced to 70% value increasing the chance of an attack
	cp_initThreatModifier = 0.1
		
	-- random number used for sending wave attacks
	sg_militaryRand = Rand(100)
	
end

rawset(globals(), "Logic_military_groupvars", nil)
function Logic_military_groupvars()
	-- min group size a group must be before accepting AttackNow commands
	cp_minSquadGroupSize = 1
	-- min value group must be before accepting AttackNow commands
	cp_minSquadGroupValue = 1
end

--~ -- overriding attack rules so as i can determine when to attack
--~ rawset(globals(), "Logic_military_attackrules", nil)
--~ function Logic_military_attackrules()
--~ 	-- get the max threat, a positive value means we are winning 
--~ 	local maxthreat = PlayersMilitary_Threat( player_enemy, player_max )
--~ 	
--~ 	-- if the AI has more than 1.5 times more creatures than
--~ 	-- have an all out attack, unless...
--~ 	--if (g_LOD>1 and maxthreat > 10 and sg_moreEnemies > 0) then
--~ 		AttackNow()
--~ 	--end
--~ end

-- functions that begin with Logic_ are replaceable chunks
rawset(globals(), "Logic_military_setattacktimer", nil)
function Logic_military_setattacktimer()
	
	-- when does the AI start attacking
	local timedelay = 60 -- based on map size and other factors
	-- how often does it send another wave
	local wavedelay = 60
	
	local gametime = gameTime()
	
	-- has the start time gone by or have we received a certain level of damage
	if (gametime >= timedelay or HaveBeenAttacked()==1) then -- insert other logic that would issue an attack
			
		if (Rule_Exists("attack_now_timer") == 0) then
			aitrace("Script: Attacktimer added by ME")
			-- this will also call attacknow instantly
			Rule_AddInterval("attack_now_timer", wavedelay )
		end
		
	end
	
end

--
-- PROCESSING
--
--   if any of the following 'Override' functions are defined they will completely replaced the AI's default behaviour in the
--  corresponding area (research, building, resourcing, ...). You can use some of the default behaviour and optionally provide some
--  of your own. (Eg. let the AI build ships normally but give it a higher demand for corvettes, or minelayers, or research subsystems...)
--

-- include this function if you want to write your own demand rules for ships
function Override_ShipDemand()

	-- call all the AI counter ship demand rules
	DetermineCounterDemand();
	
	-- if we already have more then 2 builder ships reduce the demand for these ships (shipyards, carriers,..)
	--if (numQueueOfClass( eBuilder ) > 2) then
		-- reduce demand of all 'builder' class ships
	
	ShipDemandAddByClass( eFighter, 3 )
	ShipDemandAddByClass( eCorvette, 3 )
	ShipDemandAddByClass( eFrigate, 2 )
	ShipDemandAddByClass( eCapital, 2 )
	ShipDemandAddByClass( eBuilder, -20 )
	--end
	
end

-- include this function if you want to write your own demand rules for subsystems
--function Override_SubSystemDemand()

	--SubSystemDemandSet( RESEARCH, -10 )
	
	-- this is the function the generic AI uses (you could use parts of this if you choose - copy and paste from it)
	--CpuBuild_DefaultSubSystemDemandRules
--end



-- override research demand
--function Override_ResearchDemand()

	-- this is the function the generic AI uses (you could use parts of this if you choose - copy and paste from it)
	--CpuResearch_DefaultResearchDemandRules
	
	-- eg. do this to reduce the chance of researching this ( could also use 'set')
	-- ResearchDemandAdd( PLATFORMIONWEAPONS, -10 )

--end



