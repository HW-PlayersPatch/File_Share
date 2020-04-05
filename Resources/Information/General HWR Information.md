# General HWR Information


## Controls Tips
* Ctrl+F11 can bind the mouse in full-screen with multiple monitors
* Hold Alt to Pan up/down


## Change In-Game Speed
* While you're in a game valid key combos are:
    * Speed Up: Shift + \ 
    * Normal Speed: \
    * Slow Down: Ctrl + \

* Put this code in your HomeworldRM\Bin\Profiles\Profile1\PLAYERCFG.LUA file in the ControlsOptions area:
```
{
0,
"TurboEnable(4)",
0,
0,
"debugbind2",
{
16,
220,
},
},
{
0,
"TurboEnable(1)",
0,
0,
"debugbind2",
{
17,
220,
},
},
{
0,
"TurboEnable(2)",
0,
0,
"debugbind1",
{
220,
},
},
```
* Alternatively create a text file here "C:\Program Files (x86)\Steam\steamapps\common\Homeworld\HomeworldRM\Bin\Release\autoexec.lua" with this code:
```
bind2("TurboEnable(4)", SHIFTKEY, BACKSLASHKEY )
bind2("TurboEnable(1)", CONTROLKEY, BACKSLASHKEY )
bind1("TurboEnable(2)", BACKSLASHKEY )
```


## Follow Camera
* Create a text file here "C:\Program Files (x86)\Steam\steamapps\common\Homeworld\HomeworldRM\Bin\Release\autoexec.lua" with this code:
```
bind1("camAction_EnableMirroring(-1)", HKEY)
```


## Command Line Shortcuts
* -nomovies (Skip intro movies)
* -luatrace (Adds lua trace information to the HwRM.log file, useful for debugging scripts and issues)
* -traceHODs (Adds HOD trace information to the HwRM.log file, useful for debugging .HOD files)
* -fullMiniDump (Full dump crash file, useful for Gearbox)
* -logfilename=LOGFILEPATH (C:\Test\Logs\Player1.log - Custom log file name and path)
* -windowed (Windowed mode)
* -forceResolution -w 1910 -h 1010 (Custom resolution)
* -fakeFullscreen (Fullscreen without any border, doesn't respond to window focus changes the same way either. Handy for testing FS on a multi-mon system.)
* -facetCount 24
* -facetAutoFOV (use with facetcount to limit total horizontal FOV)
* -w 3840
* -h 1080
* -x -1920 (assuming your 'main' screen is on the right)
* -y 0
* -freeWindow
* -CameraDragX mouse speed multiplier
* -CameraDragY mouse speed multiplier
* -mpbeta (no longer needed, used to launch multiplayer)
* -GameRules=BalanceMod (Use a gamerule)
* -lvlPassTags=balance (Include map level tags)
* -startFleet 0 (0, 1, 2, etc. Use custom starting fleet file for MP)
* -campaign <campaign name>
* -startingLevel M05_Gehenna -persist (persist uses default persist files)
* -workshopmod <Mod> (???\???\Mod.big - Loads a workshop mod .big file)
* -moddatapath <DataMyMod> (Git\Mod - Reads loose files in your custom folder to override all other .big files)
* -overridebigfile (Reads loose files in your Data folder to override all other .big files)
* -balance (Developer internal build only. Enables the in game balance screen.)
* -developer (Developer internal build only. Enables developer menus in game.)


## Text Colors
* In the multiplayer chat room, you can use text color codes like these:
    * Red: <c=ff0000></c>
    * Orange: <c=ffa500></c>
    * Yellow: <c=ffff00></c>
    * Green: <c=00ff00></c>


## Crash and Sync Logs
* The HwRM.log file is over-written each time the game is started. So its important to grab this file before starting the game again.
* Access violations/crashes generate three logs in the release folder:
    * C:\Program Files (x86)\Steam\steamapps\common\Homeworld\HomeworldRM\Bin\Release
        * 5-19-2019_19_10_48_ErrorLog.txt
        * 5-19-2019_19_10_48_MiniDump.dmp
        * homeworldrm_1237961_crash_2019_5_19T23_10_46C0.mdmp
* Note that pressing Alt+F4 and ending the game via task manager both close the game cleanly with no crash logs. If someone is recording their game, you can tell if they pressed Alt+F4 as their cursor changes to an eye icon.
* Multiplayer syncs generate logs in the syncerror folder:
    * C:\Program Files (x86)\Steam\steamapps\common\Homeworld\HomeworldRM\Bin\SYNCERROR\
        * sync-5BE353028492499497CBBC1022F397F3-00005994-DOOS-CLOAKED-Kick-110000101FD47E5.sav
