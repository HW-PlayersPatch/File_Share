
aitrace("CPU: LOADING MISSION 4")

dofilepath("data:ai/default/default.lua")

-- to change the level of difficulty call the following: (no need to put it in an override function)
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

	-- turn off upgrades
	sg_doupgrades = 0
	
	-- this monitors and controls military stuffs - like group size, attack percentage, etc
	sg_domilitary = 1
	
	-- this turns off the code-level resource processing (refinery, collectors, ...)
	cp_processResource = 1
	
	-- this turns off the code-level military processing (attack, guard, scout, ...)
	cp_processMilitary = 1

end

-- add stuff in here to override the build initialization (ships and subsystems)
function Override_BuildDemandInit()

	-- these are basic offsets for the demand of each of these ships classes
	-- these can be changed at anytime (there are many more classes then this)
	sg_classPersonalityDemand[ eFighter ] = 1
	sg_classPersonalityDemand[ eCorvette ] = 0
	sg_classPersonalityDemand[ eFrigate ] = 3

end

-- override any resource variables (and/or functions)
function Override_ResourceInit()

	-- control the number of collectors the AI will produce
	-- to control the logic of 'when' these are produced I will need to add another override (let me know if you need this)
	
	--sg_minNumCollectors = 5
	sg_maxNumCollectors = 10

	-- this var specifies how many military units are needed before the AI builds its first refinery (deprecated)
	--sg_refineryMilitaryLimit = 5
	
	-- how many collectors are needed before the first refinery-type ship is built (needs to be revisited)
	--sg_collectorMinForRefinery = 8

end

-- override any military variables (and/or functions)
function Override_MilitaryInit()
	
	-- set the initial attack percentage - this changes too often - don't set it here (use Process functions to do this)
	cp_attackPercent = 80
			
	-- number of ships in group needed before it attacks OR value (if either exceed this number the ships will become active to attack defend)
	-- this is also overridden by other factors (or should be)
	cp_minSquadGroupSize = 3
	cp_minSquadGroupValue = 150

	cp_maxGroupSize = 8

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

	CpuBuild_DefaultShipDemandRules_Hard()

	-- set demand for these ships to 5
	-- ShipDemandSet( VGR_BOMBER, 5 )
	-- ShipDemandSet( VGR_INTERCEPTOR, 5 )
	ShipDemandSet( VGR_SHIPYARD, -100 )	-- don't want the CPU player to ever build Shipyards in this mission
	ShipDemandSet( VGR_CARRIER, -100 )	-- don't want the CPU player to ever build Carriers in this mission
	-- ShipDemandSetByClass( eCorvette, 2 )
	
	-- this is the function the generic AI uses (you could use parts of this if you choose - copy and paste from it)

end

-- include this function if you want to write your own demand rules for subsystems
function Override_SubSystemDemand()

	CpuBuildSS_DefaultSubSystemDemandRules()

	--SubSystemDemandSet( RESEARCH, -10 )
	SubSystemDemandSet( HYPERSPACE, -100 )
	SubSystemDemandSet( CAPSHIPPRODUCTION, -100 )
	
	-- this is the function the generic AI uses (you could use parts of this if you choose - copy and paste from it)
end



-- override research demand
function Override_ResearchDemand()

	-- this is the function the generic AI uses (you could use parts of this if you choose - copy and paste from it)
	CpuResearch_DefaultResearchDemandRules()
	
	-- eg. do this to reduce the chance of researching this ( could also use 'set')
	-- ResearchDemandAdd( PLATFORMIONWEAPONS, -10 )

end



