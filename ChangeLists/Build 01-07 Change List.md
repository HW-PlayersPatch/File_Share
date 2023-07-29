# Homeworld Remastered Players Patch
# Build 1 Change List | Nov 3, 2017

## General
* Included all the changes from Gearbox’s 2.205 Patch Preview (which was released in the 2023 2.3 Patch) as described [here](https://github.com/HWRM/KarosGraveyard/wiki/Patch-Changes). In summary:
    * Fixed Hiigaran Mothership visual errors, including the badge being cut off.
    * Fixed the Turanic Carrier Engine missing icon.
    * Many balance improvements/fixes
    * Note that the Players Patch does not distribute the updated Exe, which enables two developer changes around ship patching and traceHODs that only affect modding.

## Balance
* The bulk of the balance changes are from Gearbox’s 2.205/2.3 Patches. Additional changes are listed below.
* Fixed the major [666 Formation Targeting Bug](http://web.archive.org/web/https://forums.gearboxsoftware.com/t/666-formation-targeting-bug/1541832). Formations and squadrons now perform as they were intended to!
* Reduced the amount of small low-RU debris for destroyers and cruisers. This improves the game’s performance in long games.
* High Unit Caps adjusted so cruisers are capped at 3, rather than 4.
* Hiigaran/Vaygr Gun Platforms, Ion Platforms, and Missile Platforms speed 100->125 (to match hw2c)
* Hiigaran/Vaygr Carriers and Battle Cruisers death/scuttle blast range down some
* Hiigaran Bombers speed Upgrade Costs 600->400 (to balance vs Vaygr)
* Hiigaran Defense Field Frigates cost 1000->1250 (to match hw2c), build Time 60->70 (to match hw2c)
* Vaygr Platform Health Upgrade costs 1500->1600 (to balance vs Hiigaran)
* Vaygr Corvette Health Upgrade costs 1600->1800 (to balance vs Hiigaran)
* Vaygr Laser Corvettes were the only corvettes negatively impacted by the 666 Bug. They are now performing as intended: the best anti-frigate and anti-capital ship corvette in the game.
* Vaygr Heavy Missile Frigates range down 6% (closer to hw2c)
* Kushan/Taiidan Research Ship speed up 55%
* Taiidan Research Ship health up 50% to match Kushan health (to fix a mistake from the 2.1 patch)
* Kushan/Taiidan Heavy Corvettes no longer prioritize attacking fighters (since they aren’t very good vs fighters)
* Kushan/Taiidan Destroyers build time 160->145 seconds (to balance vs Hiigaran/Vaygr)
* Kushan/Taiidan Sensors Array speed up 72% (relatively similar to hw1c)
* Kushan/Taiidan Cloak Generators ability range up 100%
* Kushan/Taiidan Gravity Well Generators can now be repaired (like in hw1c)



# Build 2 Change List | Nov 20, 2017

## Balance
* Kushan and Taiidan corvettes now move around their targets a lot more in combat (similar to homeworld 1 classic)



# Build 3 Change List | Nov 21, 2017

## HWR Bugs Fixes
* Fixed Kushan destroyer ion cannon sound effects (they were previously silent)



# Build 4 Change List | Dec 2, 2017

## HWR Bug Fixes
* Fixed Hiigaran Gunship weapon sound effects (they were playing pulsar sounds)
* Fixed Kushan and Taiidan Repair Corvette sound effects (so they no longer play gun noises while repairing)
* Fixed Taiidan Resource Controller nlips clipping (docked collectors would appear inside the controller when zoomed out)

## Balance
* Implemented the latest and greatest 666 Fix. With the 666 bug resolved, all fighters have now gone through a very thorough balance testing process. Tweaks were made as needed to align them with intended balance that Gearbox and the balance testers had crafted.
* Kushan and Taiidan Scouts are now balanced, previously Kushan would always win. (Not intended)
* Kushan and Taiidan Interceptors are now balanced, previously Taiidan would always win. (Not intended)
* Pulsar Corvettes, Missile Corvettes, and Heavy Corvettes are now properly balanced vs each other. There were some problems like Taiidan always beating Kushan, which was not intended.



# Build 5 Change List | Dec 3, 2017

## Improvements
* The patch name is now visible when hosting games in multiplayer.



# Build 6 Change List | Jan 12, 2018

## Gameplay Options
* Added a Vast unit cap option. This is double the size of Huge, and only recommended for very fast machines.

## HWR Bug Fixes
* Fixed the build/research/launch menu scaling problem, that primarily affects 4k resolutions
* Fixed the build and research queue pause buttons, so that they no longer get disabled
* Fixed the race specific research tabs, so that they are hidden based on the race your playing
* Fixed Taiidan's Emperor voice, when playing the 'Homeworld 1 Deathmatch' game type (it was playing Vaygr's Makaan voice)

## Campaign
### Homeworld 1
#### Mission 3
* Increased the cryo tray health (Gearbox increased the health on most Kushan/Taiidan ships to balance vs Hiigaran/Vaygr upgrades, but forgot some campaign only ships).
#### Mission 4
* The objective is now complete as soon as the carrier is killed, rather than after the explosion animation finishes (to prevent a timing error).
### Homeworld 2
#### Mission 2
* The mothership's engine speed now matches the audio cues and hw2c.
* The transport ships' speed now increases after events as they did hw2c.
* Increased Captain Soban's weapon damage to match hw2c.

## Balance
* Hiigaran bombers now check their line of fire like the other races do, to avoid friendly fire incidents



# Build 7 Change List | Mar 8, 2018

## Gameplay Options and Features
* Added a Mission Difficulty adjuster. At the start of each campaign mission, extra enemy AI reinforcement ships and RU are added based on your fleet size and RU. This dynamic scaling difficulty can now be adjusted.
* Added a Camera Pan Speed adjuster. This lets players increase the camera speed to move around maps faster with the arrow keys and edge of screen mouse pan.
* Added a Camera Max Zoom adjuster. This lets players increase the maximum distance the camera can zoom out before having to use the sensors manager.
* Added a Build/Research/Launch Panel adjuster. This lets players set and save the size of the Build/Research/Launch menus in the options. Previously these were adjustable, but their size was not saved across games.

## HWR Bugs Fixes and Improvements
* Improved the spacing in the build/research queues for better readability.
* The 'Research Ship Complete' audio is now played after each additional Kushan/Taiidan Research Ship Hub is built.
* Kushan Research Ship's with all six hubs, now spin like they did in hw1c.
* Kushan/Taiidan corvettes now respond quickly to certain attack orders, without a long delay.
* Removed Kushan/Taiidan repair ships from military selection priority.
* Fixed the player colors on the Kushan Heavy Cruiser ion turrets.
* In the Strikecraft & Support Only game mode, Kushan Drone Technology research is now disabled as intended.
* In the Strikecraft & Support Only game mode, Vaygr carrier health now matches the other races as intended.

## Campaign
### Homeworld 1
* Updated the parade formations to better handle salvaged ships.
* Fixed the turanic missile corvette's missile burn effects.
* Increased turanic ion array frigate speed to be relatively similar to hw1c.
* Properly balanced kushan ships vs swarmers to better reflect hw1c gameplay. Corrected swarmer behavior so they dock correctly, and don't stop attacking unexpectedly.
#### Mission 3
* Increased the cryo tray health to be closer to hw1c gameplay. (Gearbox increased the health on most Kushan/Taiidan ships to balance vs Hiigaran/Vaygr upgrades, but forgot some campaign only ships).
#### Mission 7
* The enemy AI reinforcements now work properly based on your starting fleet value.
* Fixed an issue where the multi-gun corvette research sometimes doesn't get enabled.
#### Mission 8
* Increased kadesh multi-beam frigate health and speed to be relatively similar to hw1c.
* Lowered the accuracy of the kadesh mothership ion cannons vs moving fighters and corvettes.
* Kadesh ships now properly defend the final area like in hw1c.
#### Mission 10
* Fixed the camera location at the start of the mission.

## Balance
* Hyperspace exit damage lowered from 25% to 10%, when running into a hyperspace inhibitor
* Probe cost 70->100 (half way between hw1c and hw2c)
* Addressed the gun alignment on the Hiigaran Shipyard and Vaygr Scout. They were shooting to the side of their targets, and rarely landing hits vs small targets like probes and fighters.
* Hiigaran Ion Cannon Platform/Vaygr Heavy Missile Platform damage -16% (same as hw2c)
* Kushan/Taiidan Multi-Gun Corvette Cost 300->235 (general buff, and to balance vs hw2 corvettes)
* Kushan/Taiidan Heavy Corvette Cost 285->240, Build time 22->20 (general buff, and to balance vs hw2 corvettes)
* Kushan/Taiidan Missile Destroyer damage vs hw1 corvettes -40%
* Kushan/Taiidan Missile Destroyer Speed 130->145 (relatively closer to hw1c)