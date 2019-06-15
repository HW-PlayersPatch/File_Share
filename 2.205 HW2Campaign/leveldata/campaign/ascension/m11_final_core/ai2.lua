
aitrace("CPU: LOADING MISSION 11 AI Player 3")


dofilepath("data:ai/default/default.lua")
-- set AI level of difficulty to hard
setLevelOfDifficulty(2)

--
-- INITIALIZING
--

-- turn research off - assumes I've activated the research I want the AI to have (i.e. frig tech, corv tech, ...)
function Override_Init()

	-- turn off his research and upgrades - assuming h
	sg_doresearch = 0
	sg_doupgrades = 0
	
end

function Override_ResourceInit()

    -- make sure AI doesn't build more then 6 collectors
	sg_maxNumCollectors = 2

end

-- set this to get player3 to always attack player 0
cp_overrideChooseEnemy = 0

-- override any military variables (and/or functions)
function Override_MilitaryInit()
	
	-- make sure groups are always in attack mode
	cp_attackPercent = 100
	-- set group min size to 4 and value 100 (so it waits to have a few ships before attacking)
	cp_minSquadGroupSize = 4
	cp_minSquadGroupValue = 100
	-- never create group with more than 8 guys - keeps groups from clumping up
	cp_maxGroupSize = 8 
    -- if group reaches 8 guys and hasn't decided to attack - now attack no matter what
	cp_forceAttackGroupSize = 8
	-- increase the chance the AI will attack even if it will lose
	cp_initThreatModifier = 0.3
	
end

rawset(globals(), "Logic_military_attackrules", nil)
Logic_military_attackrules = function() end

--
-- PROCESSING
--

-- include this function if you want to write your own demand rules for ships
function Override_ShipDemand()

	CpuBuild_DefaultShipDemandRules()
	
	-- never build other builder ships, platforms or explorer ships
	ShipDemandAddByClass( eBuilder, -100)
	ShipDemandAddByClass( ePlatform, -100)
	ShipDemandAddByClass( eScout, -100)

end


