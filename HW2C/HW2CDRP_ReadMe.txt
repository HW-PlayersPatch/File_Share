-- ====================================================================================== --
-- Homeworld 2 Clean Data Resource Project						  --
-- By S110										  --
-- Version 1.0										  --
-- Begun 01/25/2010, cleaning and decompiling finished by 02/06/2010.			  --
-- First full release 03/10/2010							  --
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0  --
-- ====================================================================================== --

About This Data Project:

	-- This the first release of the HW2CDRP. There were a number of minor issues here and there with the retail game that now
-- hopefully have been fixed. All the scripts seem to run without console  errors (except a few specific unavoidable cases) or CTDs.
-- Where possible, comparisons between LuaDC, CFLuaDC, and the RDN scripts were made when there were any
-- issues to solve, or problems with getting it all running. Hopefully there are no problems with the finished package,
-- but there will probably be something.
	-- If there is, please bring it to my attention by PM in the Relic Forums. I'll do what I can to solve any issues. Any
-- retail version bugs I may have missed that need fixing fall into this category too.
	-- The shader files have been left as is as they were not compiled Lua files.
	-- One issue that did come up during testing was that the HW2 has a habit of reading any text file placed within many of its folders,
-- which can cause many headaches. To be on the safe side, use the commenting marks ( -- ) to ensure anything you don't want run isn't. This
-- document is an example of what I mean.
	-- A bit of credit for the many many hours of hard work would be nice if you base your mod on this data package. That is what
-- it is for: to use as a mod's foundation. I did not write the origionals, however I did decompile, clean, correct, and patch what issues
-- I could find, and bear in mind that there will be mismatches between what I have done here and what Relic did.
-- If you aren't a modder, if you just want to play the game, a few annoying issues detailed below have been patched, so you
-- might like to use this for that reason. Whatever you do with these files, above all have fun.

-- S110

-- Corrections and tweaks:

-- SCAR_Util.lua:
	-- Changed SensDisProbe to level 4 to fix bug where can be researched at tech level 2, but not built until level 4

-- Ships.ucs
	-- 1505 Anti-Capital Ship Fighter: changed to: 1505 Anti-Capital Ship Squadron
	-- 1601 Reconnaissance unit: changed to: 1601 Reconnaissance Unit
	-- 1602 Assault Craft: changed to 1602 Interceptor to match Makaan's voice file for the type.
-- Added (Quickly!) updated and debugged "Resource Race" Game Type from RDN including missions. May upgrade in future release.
-- Data\UI\newui\research\research.lua
	-- Changed Hgn_Bomber to Hgn_AttackBomber: Fixes bug where Hiigaran Fighter Class icon displays default icon.
-- Some minor fixes to spelling in dictionary (.ucs) files.
-- Changed Hiigaran research: Improved Plasma Bombs now unavailable for research without a Fighter Facility.

-- Tutorial Campaign:
	-- Mission 1: Minor event camera bug fixes noted in M01.lua.
		-- 50427	"Some settings display more information than others." corrected to match audio:
		-- 50427	"Some TO settings display more information than others."
	-- Mission 2: Corrected sound file and text inconsistencies.
		-- 50541  "The Build Manager is organized according to Production Facilities." corrected to match audio:
		-- 50541  "Click on the Scout Icon to begin construction of a Scout squadron."
	-- Mission 3: Changed race of Player 1 to "raceID = 2" so carrier could build Fighter Production Facility.
		-- Commented out unused SobGroups in level file

-- Ascension Campaign:
	-- Mission 2: Added line to enable second pair of the Elite Bombers Reward - looks like may have been copy/paste error, and 2 more
	-- don't seem to cause a notable balance issue for the campaign.
	-- Mission 3: Commented out "Player_UnrestrictResearchOption(0, "ResourceCollectorHealthUpgrade2")" as wrong tech level.
		-- Added rule to trigger upgrades seperate from Carrier handoff.
		-- Made seperate rule to add upgrades for above fix.
		-- Commented out "Player_UnrestrictResearchOption(0, "InterceptorMAXSPEEDUpgrade2")" & 
		-- "Player_UnrestrictResearchOption(0, "AttackBomberMAXSPEEDUpgrade2")" as wrong tech level.
		-- Marine Frigate could sometimes be granted without a Frigate Facility. Seems logical to add in the associated items.
		-- Console complains because Marine Frigate has usually been already granted so it gives a can't unrestrict error,
		-- but no issues to gameplay found otherwise. This is done in two seperate places.
	-- Mission 4: Commented out unsused items: "g_rein_2_sent = 0" & "g_rein_3_sent = 0".
		-- Unrestrict the Proximity Sensor Research Option here: 
		-- It was researchable at M03_Staging's tech level but not available once researched because its build option is level 4.
		-- Comment out unused SobGroup "SobGroup_RepairSobGroup("Comm_Station_Repair_Group", "Communications_Station")", also:
		-- unused sobgroups/not present in level file. "CPU_RemoveSobGroup(3, "rein_2")" & "CPU_RemoveSobGroup(3, "rein_3")".
	-- Mission 9: Added "Rule_Remove("Rule_Test_Lauch_Or_Destruction")" to "function Rule_Dread_Repairs_Complete()"
		-- to correct the issue in the mission where the "Dreadnaught" undocks from the shipyard and you get the warning to
		-- "Dock the Dreadnaught with the Shipyard." This happens because undocking triggers the above rule at every
		-- undock event even if repairs completed.
		-- (Ugh! "Dreadnaught"! I really wish the devs had spelled it right: should be "Dreadnought"! One of my pet peeves. - S110)
	-- Mission 10: AgressiveTactics corrected to AggressiveTactics in event section.
	-- Mission 13: Commented out redundant research unrestrict call "Player_GrantResearchOption(1, "SuperCapHealthUpgradeSPGAME")"
