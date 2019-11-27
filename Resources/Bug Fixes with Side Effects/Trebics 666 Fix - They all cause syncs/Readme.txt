* Earlier versions contained the 666 fix and the compatibility mod, but the latest version just contains the 666 fix.
* You only need 4 files for the 666 fix:
Data\scripts\scar\targetfix\default.lua
Data\scripts\scar\functions.lua
Data\scripts\scar\restrict.lua
Data\scripts\scar\targetfix.lua
(The soundscripts folder was a holdover from an older version.)
* restrict.lua has been modified to include the 666 Fix
* default.lua specifies the ships the 666 Fix applies to. Its currently set to the ships that are affected by the 666 bug in the default game (fighters that don't have turrets).


11/28/2017 Edit: Unfortunately Trebic’s fix causes syncs in multiplayer. A better multiplayer safe fix can be found here:
https://forums.gearboxsoftware.com/t/bug-666-partial-fix-multi-mod-compatability/1638548/17