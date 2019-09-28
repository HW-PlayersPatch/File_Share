# Homeworld Remastered 2.3 Players Patch
# Build 11 Change List | September ??, 2019

## HWR Bugs Fixes and Improvements
* When salvage corvettes in a formation are given multiple different salvage targets, they often crash the game. To prevent this crash, salvage corvettes will no longer be able to join formations/strikegroups.
* Ships have always held their formation in aggressive stance, but now they also hold their formation in neutral stance like hw1c.
* The Taiidan Defense Fighter no longer shoots down missiles from allies.
* Fixed Hiigaran Pulsar Corvette weapon sound effects (they were missing).
* Drone frigates with launched drones no longer make such a loud death explosion.

## Campaign Improvements
### Homeworld 1
* Kadeshi ships now have red hyperspace windows like hw1c.

## Balance
* Following the Homeworld 3 announcement, we decided to release build 10 early as a 'work in progress'. Some balance changes were experimental and were further refined in build 11. The list below covers all balance changes made in build 10 and 11.
* Decreased the sensors range of all scouts and probes by about 20%, and 30% for the cheaper Kushan/Taiidan scouts. Scouting is easy in HWR compared to other RTS games, so this is intended to make information harder to obtain.
* Lowered death/scuttle blast range on frigates, motherships, and shipyards (so fighters and corvettes can better survive capital ship battles).
* Damaged resource collectors latched onto RU drop-offs now heal 2.5 times faster (so they don't clog up resource drop-offs for so long).
* Normal unit caps: Destroyers 6->5 (back to v2.1 value). High unit caps: Destroyers 9->7, Missile Destroyers 4->3. Huge unit caps: Destroyers 14->11.



### Hiigaran
* Hyperspace time reduced from 9.5 to 7 seconds for all non-production ships to add some race flavor.

#### Scouts
* Speed 512->480 (All scouts are now slower to make scouting harder)
* EMP Weapon:
    * Range 3000->1500 (Improves accuracy vs moving targets)
    * Now leads targets
    * Accuracy vs corvettes 0.15->1.0
    * Kushan and Taiidan fighters and corvettes can now be EMP'd with just one squad of scouts, rather than two squads like before.

#### Bombers
* Speed 279->300
* Weapon:
   * Projectile Velocity 1200->1800 (so they can hit subsystems on moving carriers)

#### Gunships
* Armor Upgrade:
   * Cost 800->600
   * Time 40->35
* Speed 232->254

#### Minlayer Corvettes
* Speed 233->291
* Armor 900->1500
* Mine Duration 200->60 (to avoid stalemates)

#### Flak Frigates
* Flaks are quite expensive to upgrade and use, they shouldnt be so punishing to the player just to use.
* Speed Upgrade:
   * Cost 600->400
   * Time 50->25
* Armor Upgrade:
   * Cost 1000->600
   * Time 75->40
* Build Time 50->45

#### Ion Cannon Frigates
* Weapon:
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)

#### Marine Frigates
* Speed 230->270
* Armor 20000->23500

#### Defense Field Frigates
* Cost 1250->1000
* Build Time 70->55
* Speed 77->220

#### Carriers
* Improved Manufacturing Upgrade Cost 1500->2250

#### Destroyers
* Armor Regeneration Time 1074->750

#### Battlecruisers
* Kinetic Weapons Range 5000->4500
* Ion Weapons Range 6000->5500

#### Resource Collectors
* Armor Upgrade Cost 800->1000
* Repair Research:
   * Cost 750->200
   * Time 40->20

#### Resource Controllers
* Armor 18000->16000

#### Probes
* Cost 100->120

#### Proximity Sensors
* Proximity Research Time 35->45
* Build Time 15->20

#### Sensors Distortion Probes
* Sensors Distortion Research Time 45->30
* Cost 600->500
* Build Time 30->25
* Ability to reduce enemy sensor range is a bit stronger now.

#### Fire Control Modules
* Now affect the ship they are on. (this is intended to balance two Hiigaran cruisers with FCTs vs two Vaygr cruisers with command corvettes)

#### Proximity Sensor Modules
* Cost 250->375
* Build Time 35->45

#### Hyperspace Sensor Modules
* Cost 250->500
* Build Time 35->45



### Vaygr

#### Scouts
* Speed 420->350 (All scouts are now slower, still the fastest scout in the game when upgraded)
* EMP Weapon:
    * Kushan and Taiidan fighters and corvettes can now be EMP'd with just one squad of scouts, rather than two squads like before.

#### Bombers
* Speed 279->300

#### Lance Fighters
* Speed 279->314
* Armor 90->110
* Weapon:
   * Penetration vs subsystems 0.5->1.0 (to match v2.1, this was a typo from an earlier build)

#### Laser Corvettes
* Cost 650->625
* Armor 480->510

#### Command Corvettes
* Command Corvette Reseach Time 60->45
* Cost 400->750
* Armor 900->1000

#### Minelayer Corvettes
* Armor 900->1000
* Mine Duration 200->60 (to avoid stalemates)

#### Assault Frigates
* Assault Frigate Research:
   * Cost 650->550
   * Time 45->35
* Armor 17000->18000

#### Heavy Missile Frigates
* Build Time 45->50
* Armor 18500->18000

#### Infiltrator Frigates
* Infiltrator Frigate Research:
   * Cost 1000->800
   * Time 60->50
* Speed 230->240
* Armor 20000->21000

#### Capitals
* Armor Upgrade Cost 4000->3500

#### Carriers
* Improved Manufacturing Upgrade Cost 1500->2500

#### Destroyers
* Destroyer Technology Cost 2000->1750

#### Battlecruiser
* Trinity Cannon Weapon:
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)
   
#### Platforms
* Armor Upgrade Research:
   * Cost 1600->1400
   * Time 150->135

#### Hyperspace Gates
* Vaygr Hyperspace Gates can now hyperspace to a destination on their own. Slightly increased the built in sensors distortion ability, that helps it hide from probes.
* Hyperspace Gates Research:
   * Cost 750->500
   * Time 50->45
* Cost 375->325
* Armor 18500->27750
* All probes can now travel through hyperspace gates.

#### Utility Research
* Utility Research Upgrade Cost 1200->1400

#### Resource Collectors
* Repair Ability Research:
   * Cost 500->200
   * Time 30->20

#### Resource Controllers
* Armor 18000->16000

#### Probes
* Cost 100->120

#### Prosimity Sensors
* Proximity Research Time 40->45
* Build Time 15->20

#### Sensors Distortion Probes
* Sensors Distortion Research:
    * Time 60->50
* Cost 600->500
* Build Time 30->25
* Ability to reduce enemy sensor range is a bit stronger now.

#### Fire Control Modules
* Now affect the ship they are on.

#### Hyperspace Sensor Modules
* Cost 250->500
* Build Time 35->45



### Kushan and Taiidan
* Kushan and Taiidan research costs went up too high in build 9, and have been reduced accordingly. Fighters -1100ru, Corvettes -1500ru, Frigates -1100ru, Capitals -4700ru, and Non-Combat -700 for a total of -9100ru.
* Non-attackable subsystem icons now appear in the UI for Kushan/Taiidan Motherships and Carriers after researching Fighter, Corvette, Frigate, and Capital Ship research.


Need to add research times and weapons.


#### Scouts
* Cost 70->100
* Speed 490->460
* Build Time 8->10
* Speed burst ability multiplier 1.25->1.10

#### Attack Bombers
* Speed 390->420
* Armor 135->125

#### Kushan Cloaked Fighters
* Cost 130->120
* Build Time 15->10
* Now repair themselves in 60 seconds when idle and not taking damage

#### Light Corvettes
* Cost 225->215

#### Salvage Corvettes
* Armor 1000->1200
* Can now kamikaze

#### Heavy Corvettes
* Cost 240->230

#### Multigun Corvettes
* Cost 235->225

#### Minelayer Corvettes
* Cost 275->325
* Speed 255->280
* Mine Duration 200->60 (to avoid stalemates)

#### Support Frigates
* Cost 600->700
* Build Time 65->60

#### Ion Cannon Frigates
* Cost 800->750
* Weapon:
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)

#### Kushan Drone Frigates
* Kushan Drone Frigates can now attack while they are moving. Previously the drones rarely ever fired while the frig was moving.
* Cost 900->700
* Build Time 70->50
* Speed 206->222

#### Carriers
* Build Time 165->130

#### Missile Destroyers
* Armor 106000->75000

#### Heavy Cruisers
* No longer take hyperspace damage when they hit an inhibitor/GW. (like hw2 cruisers)

#### Resource Collectors
* Minimum hyperspace cost 300->350

#### Probes
* Cost 100->120 
 
#### Proximity Sensors
* Build Time 15->20
 
#### Sensor Arrays
* Cost 700->500
* Build Time 70->60 

#### Gravity Well Generators
* Cost 800->1000
* Ability update interval 1.9->1 (so ships are caught faster)

#### Cloak Generators
* Cost 800->750
