-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

TRUE = 1
FALSE = 0

pingScale = 20
fullTime = 4
fadeTime = 1
pingLifetime = 0.4
pingETGEffect = "etg/ping.etg"

Default = {showFeedback = TRUE, pulseSize = 0.1, pulseHertz = 1, pulseColour = {0, 1, 0, 1}, headColour = {0, 1, 0, 1}, tailColour = {0, 1, 0, 0.2},}
Idle = {showFeedback = FALSE}
Parade = {showFeedback = FALSE}
Attack = {pulseColour = {1, 0, 0, 1}, headColour = {1, 0, 0, 1}, tailColour = {1, 0, 0, 0.2},}
AttackMove = {pulseColour = {1, 0, 0, 1}, headColour = {1, 0, 0, 1}, tailColour = {1, 0, 0, 0.2},}
Resource = {pulseColour = {1, 1, 0, 1}, headColour = {1, 1, 0, 1}, tailColour = {1, 1, 0, 0.2},}
Capture = {pulseColour = {0, 1, 1, 1}, headColour = {0, 1, 1, 1}, tailColour = {0, 1, 1, 0.2},}
Repair = {pulseColour = {0, 1, 1, 1}, headColour = {0, 1, 1, 1}, tailColour = {0, 1, 1, 0.2},}
Hyperspace = {pulseColour = {1, 0, 1, 1}, headColour = {1, 0, 1, 1}, tailColour = {1, 0, 1, 0.2},}
