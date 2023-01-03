--===========================================================================
--  Purpose : Lua config file for the command feedback system, defines the 
--			  appearance of the feedback lines and circles
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

-- boolean defines
TRUE	= 1.0
FALSE	= 0.0

-- general command feedback values ------------------------------------------

pingScale						= 20.0							-- the amount a feedback ping scales
fullTime						= 4.0							-- how long the feedback stays fullbright (when using default values for the fade slider)
fadeTime						= 1.0							-- how long it takes the feedback to fade away
pingLifetime					= 0.4							-- how long the feedback ping lasts
pingETGEffect					= "etg/ping.etg"				-- the ETG effect that is spawned as the ping

-- default values for all command types -------------------------------------

Default = 
{
	showFeedback				= TRUE,							-- should  feedback be shown for this command
	pulseSize					= 0.1,							-- pulse size, in fraction of total line length
	pulseHertz					= 1.0,							-- number of times per seconds the pulse happens,
	pulseColour					= {0.0, 1.0, 0.0, 1.0},			-- the colour of the pulse of the feedback line
	headColour 					= {0.0, 1.0, 0.0, 1.0},   		-- the colour of the head of the feedback line
	tailColour 					= {0.0, 1.0, 0.0, 0.2},   		-- the colour of the tail of the feedback line
}

-- command specific values --------------------------------------------------
-- valid command names are: Idle, Move, Attack, Build, Dock, Resource, Cloak, 
--							Launch, WaypointMove, Parade, Guard, Capture, 
--							Hyperspace, MoveToSob, FormHyperspaceGate, 
--							HyperspaceViaGate, Repair, Retire, Despawn, LayMines, Salvage
-- you can override as many or as few of the default variables as you want --

Idle = 
{
	showFeedback				= FALSE,						-- should  feedback be shown for this command
}

Parade = 
{
	showFeedback				= FALSE,						-- should  feedback be shown for this command
}

Attack = 
{
	pulseColour					= {1.0, 0.0, 0.0, 1.0},			-- the colour of the pulse of the feedback line
	headColour 					= {1.0, 0.0, 0.0, 1.0},   		-- the colour of the head of the feedback line
	tailColour 					= {1.0, 0.0, 0.0, 0.2},   		-- the colour of the tail of the feedback line
}

AttackMove = 
{
	pulseColour					= {1.0, 0.0, 0.0, 1.0},			-- the colour of the pulse of the feedback line
	headColour 					= {1.0, 0.0, 0.0, 1.0},   		-- the colour of the head of the feedback line
	tailColour 					= {1.0, 0.0, 0.0, 0.2},   		-- the colour of the tail of the feedback line
}

Resource = 
{
	pulseColour					= {1.0, 1.0, 0.0, 1.0},			-- the colour of the pulse of the feedback line
	headColour 					= {1.0, 1.0, 0.0, 1.0},			-- the colour of the head of the feedback line
	tailColour 					= {1.0, 1.0, 0.0, 0.2},			-- the colour of the tail of the feedback line
}

Capture = 
{
	pulseColour					= {0.0, 1.0, 1.0, 1.0},			-- the colour of the pulse of the feedback line
	headColour 					= {0.0, 1.0, 1.0, 1.0},			-- the colour of the head of the feedback line
	tailColour 					= {0.0, 1.0, 1.0, 0.2},			-- the colour of the tail of the feedback line
}

Repair = 
{
	pulseColour					= {0.0, 1.0, 1.0, 1.0},			-- the colour of the pulse of the feedback line
	headColour 					= {0.0, 1.0, 1.0, 1.0},			-- the colour of the head of the feedback line
	tailColour 					= {0.0, 1.0, 1.0, 0.2},			-- the colour of the tail of the feedback line
}

Hyperspace = 
{
	pulseColour					= {1.0, 0.0, 1.0, 1.0},			-- the colour of the pulse of the feedback line
	headColour 					= {1.0, 0.0, 1.0, 1.0},			-- the colour of the head of the feedback line
	tailColour 					= {1.0, 0.0, 1.0, 0.2},			-- the colour of the tail of the feedback line
}

