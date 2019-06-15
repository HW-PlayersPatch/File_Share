
aitrace("CPU: LOADING MISSION 4")

dofilepath("data:ai/default/default.lua")


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
	
	-- attack player 0 (put in override_init)
	cp_overrideChooseEnemy = 0
	
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
function Override_BuildDemandInit()

	-- these are basic offsets for the demand of each of these ships classes
	-- these can be changed at anytime (there are many more classes then this)
	sg_classPersonalityDemand[ eFighter ] = 3
	sg_classPersonalityDemand[ eCorvette ] = 1
	sg_classPersonalityDemand[ eFrigate ] = 0

end

-- add stuff in here to override the research initialization (upgrades and tech)
function Override_ResearchInit()

	sg_upgradeResearchDemand = 1
	sg_techResearchDemand = 1
	
end

-- override any military variables (and/or functions)
function Override_MilitaryInit()
	
	-- set the initial attack percentage - this changes too often - don't set it here (use Process functions to do this)
	cp_attackPercent = 100
			
	-- number of ships in group needed before it attacks OR value (if either exceed this number the ships will become active to attack defend)
	-- this is also overridden by other factors (or should be)
	cp_minSquadGroupSize = 3
	cp_minSquadGroupValue = 250
	
end

--
-- PROCESSING
--
--   if any of the following 'Override' functions are defined they will completely replaced the AI's default behaviour in the
--  corresponding area (research, building, resourcing, ...). You can use some of the default behaviour and optionally provide some
--  of your own. (Eg. let the AI build ships normally but give it a higher demand for corvettes, or minelayers, or research subsystems...)
--

-- include this function if you want to write your own demand rules for subsystems
function Override_SubSystemDemand()

	--SubSystemDemandSet( RESEARCH, -10 )
	
	-- this is the function the generic AI uses (you could use parts of this if you choose - copy and paste from it)
	--CpuBuild_DefaultSubSystemDemandRules
end

function AI_Carrier_Grp_1_Attack()
	cp_minSquadGroupSize = 1
	cp_minSquadGroupValue = 50
	AttackNow()
	print ( "AI Attacks" )
end


