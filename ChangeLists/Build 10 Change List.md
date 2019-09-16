# Homeworld Remastered 2.3 Players Patch
# Build 10 Change List | August 31, 2019

## Gameplay Options and Features
* Added a Dual Command mode to allow one player to control two fleets. Change your race to a Dual Command race, and then change a CPU ally to the same Dual Command race. You will start with two fleets, double the starting RUs, double the research costs, and will have double the unit caps.
* Observer mode has been improved. When prompted to continue watching, click yes to observe.
* Added a Camera Rotation Speed adjuster. This lets players increase the camera speed to rotate faster with the right mouse button.
* Added a Max Tactical Overlay level that keeps unit feedback lines and ability spheres on all the time if desired.
* Added an option set the Default Tactical Overlay. This adjusts the default level of detail for the tactical overlay around units.
* Added an option to Show Base Production Times. This displays the base production times for ships and research items in the production popup menus. The value of research modifiers are also shown.

## HWR Bugs Fixes and Improvements
* Prevented attempting to hyperspace ships inside a hyperspace inhibitor. This resolves the exploit to reset marine/infiltrator frigate capture progress for free, which previously rendered them useless. This hyperspace in gravity well exploit has finally been fixed!
* When salvage corvettes latch on and return enemy frigate/capital ships to their mothership or carrier, an exploit allowed those ships to be scuttled right before they were captured. This prevented salvage corvettes from capturing frigate/capital ships, however the salvage scuttle exploit has now been fixed!
* Addressed kamikaze exploits that allowed cheap ships to kill expensive ships, and that allowed squadrons to kill targets and then dock-heal for free.
* When a docking squadron is under attack, they sometimes glitch out and stop moving. Affected Squadrons are now automatically issued another dock order to dock with the closest ship.
* The Kushan/Taiidan Gravity Well ability previously continued to lock down strikecraft in an area after it had moved away. The area of affect now stays with the Gravity Well.
* Fixed the bug that allowed Kushan/Taiidan players to build two research ships at once on separate carriers.
* The score screen now treats ru spent on subsystems the same as ru spent on research for the building and research score total.
* Slightly changed the advanced research module icon to differentiate it more from the regular research module icon.
* When a private message is sent, everyone in the lobby hears the audio alert even when they are not the recipient. As a workaround the audio alert has been removed, as the chat window already visually flashes for the recipient.
* Hiigaran Marine Frigates, Vaygr Infiltrator Frigates, and all Minelayer corvettes are no longer included in the military selection priority. This prevents accidentally de-latching capture frigates, or messing up mine walls.
* ‘Platform Complete’ audio is now played for Vaygr Gun Platforms and Missile Platforms.
* In the carrier only gamemode, all races now start with the same number of carriers.
* The 'No Cruisers' game option text now displays in your current locale language rather than always in English.
* Reduced the Kushan probe death explosion to an appropriate size.

## Campaign Improvements
**Homeworld 1**
* Bentusi Trade research costs have been increased to align with normal research costs. However if your in a bind, you may be offered a discount.
* The RU available on each mission has been tweaked to account for the Kushan research cost changes below.

## Balance
* Note, build 10 was released in a hurry following the Homeworld 3 announcement. Some balance changes are experimental and may be reverted in the next build.
* Kushan and Taiidan research costs went up too high in build 9, and have been reduced accordingly in build 10. Fighters -1100ru, Corvettes -1500ru, Frigates -1100ru, Capitals -4700ru, and Non-Combat -700 for a total of -9100ru.
* Mine duration reduced from 200 to 60sec to avoid stalemates.
* All probes can now travel through hyperspace gates, but can not move again after they exit the hyperspace gate.
* Vaygr Hyperspace Gates can now hyperspace to a destination on their own. Slightly increased the built in sensors distortion ability, that helps it hide from probes.
* Non-attackable subsystem icons now appear in the UI for Kushan/Taiidan Motherships and Carriers after researching Fighter, Corvette, Frigate, and Capital Ship research.
* Kushan and Taiidan fighters and corvettes can now be EMP'd with just one squad of Hiigaran/Vaygr scouts, rather than two squads like before.
* Kushan and Taiidan Salvage Corvettes can now kamikaze.
* Kushan Drone Frigates can now attack while they are moving. Previously the drones rarely ever fired while the frig was moving. We plan to continue to improve this ship.
* Kushan and Taiidan Heavy Cruisers no longer take hyperspace damage when they hit a hyperspace inhibitor mid-jump. Hiigaran/Vaygr Cruisers have always been immune to such damage.
* The changes above are just a small sample of the many balance refinements included. The full Build 10 balance change list will be available soon.



### Hiigaran

#### Scouts
* There has been a general reduction in scout speed. Vision is too powerful these are part of overall vision nerf.*
* Sensors Range 11000->8500
* Speed 512->480

#### Bombers
* Projectiles were too slow and caused them to be less effective vs Frigates and Subs, this has been changed.
* Weapon:
   * Projectile Velocity 1200->1800   
* Speed 279->300  

#### Gunships
* Speed increased along with upgrade for HP reduced.
* Armor Upgrade Cost 800->600
* Speed 232->254

#### Minlayer Corvettes
* Speed and Armor increased.
* Speed 233->291
* Armor 900->1500

#### Flak Frigates
* Flaks are quite expensive to upgrade and use, they shouldnt be so punishing to the player just to use.
* Speed Upgrade Cost 600->400
* Speed Upgrade Time 75->40
* Build Time 50->25

#### Marine Frigates
* Minor buffs to increase usability.
* Speed 230->270
* Armor 20000->23500

#### Defense Field Frigates
* Minor buffs to increase usability.
* Cost 1250->1000
* Build Time 70->50
* Speed 77->220

#### Carriers
* Increased cost of Improved Manufacture due to it being so powerful it needs to cost more.
* Improved Manufacturing Upgrade Cost 1500->2250

#### Destroyers
* Reduced time it takes to regen HP, HW2 repair is already weak.
* Regen Time 1074->750

#### Battlecruisers
* Battlecruisers are oppresive and their range is a large part of that, this has been reduced.
* Kinetic Weapons Range 5000->4500
* Ion Weapons Range 6000->5500

#### Resource Collectors
* HP upgrade is too cheap and overpowered, HP upgrade now costs more. In addition repair is rather sub-par and this is a QOL chagne to it.
* Armor Upgrade Cost 800->1000
* Repair Research Cost 750->200

#### Resource Controllers
* Controlers are a bit too tanky so HP is reduced.
* Armor 18000->16000

#### Probes
* Vision is too powerful and this is apart of the overall vision nerf.
* Cost 70->120
* Sensor Range 5000->4000

#### Proximity Sensors
* Quality of life changes
* Build Time 15->20

#### Sensors Distortion Probes
* Quality of life changes.
* Cost 600->500
* Build Time 30->25



### Vaygr

#### Scouts
* There has been a general reduction in scout speed. Vision is too powerful these are part of overall vision nerf.
* Speed 420->350
* Sensor Range 11000->8500

#### Lance Fighters
* Lance fighters have had their HP increased aswell as their speed to help Vaygr deal with corvettes better.
* Speed 279->314
* Armor 90->110

#### Laser Corvettes
* Lasers have received QOL changes in cost and HP.
* Cost 650->625
* Armor 480->510

#### Command Corvettes
* Command vetts have been buffed so that they actualy live long enough to be effective in battles, thier cost has increased to offset.
* Command Corvette Reseach Time 60->45
* Cost 400->750
* Armor 900->1000

#### Minelayer Corvettes
* Rebalance changes
* Armor 900->1000

#### Assault Frigates
* QOL changes to make assautls more effictive as an anti-fighter option.
* Assault Frigate Research Cost 650->500
* Armor 17000->18000

#### Heavy Missile Frigates
* HMF have been far too oppressive due to investment for HP+DMG+Build time (lol vaygr carrier) this has been reduced.
* Build Time 45->50
* Armor 18500->18000

#### Infiltrator Frigates
* QOL changes to make them more effective at their role.
* Infiltrator Frigate Research Cost 1000->800
* Infiltrator Frigate Research Time 60->50
* Speed 230->240
* Armor 20000->21000    

#### Hyperspace Gates
* This tool is not used often, so here are some QOL changes.
* Hyperspace Gates Research Cost 750->500
* Cost 75->25
* Armor 18500->27750

#### Utility Research
* Part of overall nerfs to utility research for HW2.
* Utility Research Upgrade Cost 1200->1400

#### Resource Controllers
* Controlers are a bit too tanky so HP is reduced.
* Armor 18000->16000

#### Probes
* Vision is too powerful and this is apart of the overall vision nerf.
* Cost 100->120
* Sensor Range 5000->4000

#### Prosimity Sensors
* Quality of life changes
* Build Time 15->20

#### Sensors Distortion Probes
* Quality of life changes.
* Cost 600->500
* Build Time 30->25



### Kushan and Taiidan

#### Scouts
* Cost 70->100
* Speed 490->460
* Build Time 8->10

#### Attack Bombers
* Speed 390->420
* Armor 135->125

#### Kushan Cloaked Fighters
* Cost 130->120
* Build Time 15->10
* Now repair themselves quickly when not taking damage

#### Light Corvettes
* Cost 225->215

#### Salvage Corvettes
* Armor 1000->1200

#### Heavy Corvettes
* Cost 240->230

#### Multigun Corvettes
* Cost 235->225

#### Minelayer Corvettes
* Cost 275->325
* Speed 255->280

#### Support Frigates
* Cost 600->700
* Build Time 65->60

#### Ion Cannon Frigates
* Cost 800->750

#### Kushan Drone Frigates
* Cost 900->700
* Build Time 70->50
* Speed 206->222

#### Carriers
* Build Time 165->130

#### Missile Destroyers
* Armor 106000->75000

#### Probes
 * Cost 100->120 
 * Sensor Range 5000->4000
 
#### Proximity Sensors
 * Build Time 15->20
 
#### Sensor Arrays
* Cost 700->500
* Build Time 70->60 

#### Gravity Well Generators
* Cost 800->1000

#### Cloak Generators
* Cost 800->750
