# Homeworld Remastered 2.3 Players Patch
# Build 11 Change List | September 28, 2019

## HWR Bugs Fixes and Improvements
* When salvage corvettes in a formation are given multiple different salvage targets, they often crash the game. To prevent this crash, salvage corvettes will no longer be able to join formations/strikegroups.
* Ships have always held their formation in aggressive stance, but now they also hold their formation in neutral stance like hw1c.
* The Taiidan Defense Fighter no longer shoots down missiles from allies.
* Fixed Hiigaran Pulsar Corvette weapon sound effects (they were missing).
* Vaygr Battlecruiser Trinity Cannon now has enhanced sound effects based on the original intended sound from hw2c.
* Kushan Drone Frigates no longer make such a loud explosion when all their drones die.

## Campaign Improvements
### Homeworld 1
* Enemy Kadeshi ships now have red hyperspace windows like hw1c.
#### Mission 3
* After salvaging the first frigate for research, most of the remaining frigates can now be captured like hw1c.



## Balance
* Following the Homeworld 3 announcement, we decided to release build 10 early as a 'work in progress'. Some balance changes were experimental and were further refined in build 11. The list below covers all balance changes made in build 10 (August 31, 2019) and build 11 (September 28, 2019). This amounts to a years worth of balance changes since build 9 was released on Aug 17, 2018.
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

#### Interceptors
* Weapon:
    * Damage vs corvettes 0.26->0.29

#### Bombers
* Speed 279->300
* Weapon:
   * Projectile Velocity 1200->1800 (so they can hit subsystems on moving carriers)
* Unupgraded Weapon:
   * These changes were made on the upgraded weapon back in v2.205, but were missed on the unupgraded weapon.
   * Damage vs corvettes 1.0->0.7
   * Damage vs frigates 1.0->1.2
   * Damage vs resourcing 0.2->0.17
   * Accuracy vs corvettes 0.8->0.2

#### Gunship Corvettes
* Weapon:
    * Velocity 1500->1600

#### Minlayer Corvettes
* Mine Duration 200->60 (to avoid stalemates)

#### Flak Frigates
* Armor 18000->18500 (to match ions)

#### Ion Cannon Frigates
* Weapon:
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)

#### Marine Frigates
* Armor 20000->22000

#### Defense Field Frigates
* Cost 1250->1000 (back to v2.1 value)
* Build Time 70->60
* Speed 77->220
* Armor 25k->22k

#### Motherships
* Weapons:
    * Damage vs fighters 3.0->2.25

#### Carriers
* Improved Manufacturing Upgrade Cost 1500->2250

#### Destroyers
* Armor Regeneration Time 1074->750

#### Battlecruisers
* Kinetic Weapons:
   * Range 5000->4500
* Ion Weapons:
   * Range 6000->5500

#### Ion Platforms
* Armor Upgrade Time 120->100

#### Resource Collectors
* Armor Upgrade Cost 800->1000
* Repair Research:
   * Cost 750->350
   * Time 40->25

#### Probes
* Cost 100->150

#### Proximity Sensors
* Cost 150->250
* Build Time 15->20

#### Sensors Distortion Probes
* Ability to reduce enemy sensor range is a bit stronger now.

#### Fire Control Modules
* Now affect the ship they are on. (this is intended to balance two Hiigaran cruisers with FCTs vs two Vaygr cruisers with command corvettes)

#### Proximity Sensor Modules
* Cost 250->500
* Build Time 35->45

#### Hyperspace Sensor Modules
* Cost 250->500
* Build Time 35->45



### Vaygr

#### Scouts
* Speed 420->350 (All scouts are now slower, still the fastest scout in the game when upgraded)
* EMP Weapon:
    * Kushan and Taiidan fighters and corvettes can now be EMP'd with just one squad of scouts, rather than two squads like before.

#### Assault Craft
* Weapon:
    * Damage corvettes vs 0.26->0.29

#### Bombers
* Speed 279->300
* Weapons:
    * Velocity 1200->1800 (so they can hit subsystems on moving carriers)
* Unupgraded Weapon:
   * These changes were made on the upgraded weapon back in v2.205, but were missed on the unupgraded weapon.
   * Damage vs corvettes 1.0->0.7
   * Damage vs frigates 1.05->1.1
   * Damage vs resourcing 0.2->0.17
   * Accuracy vs corvettes 0.8->0.2

#### Lance Fighters
* Speed 279->300
* Armor 90->110
* Weapon: (after the 666 bug was fixed, this weapon was overperforming vs everything)
    * Damage vs corvettes 0.55->0.61
    * Penetration vs subsystems 0.5->1.0 (to match v2.1, this was a typo from an earlier build)

#### Missile Corvettes
* Weapon:
   * Now checks line of fire

#### Command Corvettes
* Cost 400->600

#### Minelayer Corvettes
* Mine Duration 200->60 (to avoid stalemates)

#### Assault Frigates
* Armor 17000->18500

#### Infiltrator Frigates
* Armor 20k->22k

#### Capitals
* Armor Upgrade Cost 4000->3500

#### Carriers
* Improved Manufacturing Upgrade Cost 1500->2500

#### Motherships
* Weapons:
    * Damage vs fighters 3.0->2.25

#### Battlecruiser
* Missile Launcher Weapon:
    * Range 6000->5500 (All race cruiser ranges were reduced)
* Trinity Cannon Weapon
    * Range 5550->5050 (Being on the nose of the ship, the trinity cannon has 50 more effective range than all other cruiser weapons. With precise micro, vaygr can slightly out-range other cruisers and win.)
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)
   
#### Platforms
* Armor Upgrade Research:
   * Time 150->140

#### Hyperspace Gates
* Vaygr Hyperspace Gates can now hyperspace to a destination on their own. Slightly increased the built in sensors distortion ability, that helps it hide from probes.
* Build Time 20->25
* Armor 18500->25900
* All probes can now travel through hyperspace gates.

#### Utility Research
* Utility Research Upgrade Cost 1200->1400

#### Resource Collectors
* Repair Ability Research:
   * Cost 500->250
   * Time 30->20

#### Probes
* Cost 100->150

#### Prosimity Sensors
* Cost 150->250
* Build Time 15->20

#### Sensors Distortion Probes
* Ability to reduce enemy sensor range is a bit stronger now.

#### Fire Control Modules
* Now affect the ship they are on.

#### Hyperspace Sensor Modules
* Cost 250->500
* Build Time 35->45



### Kushan and Taiidan
* Kushan and Taiidan research costs went up too high in build 9, and have been reduced accordingly. Fighters -1100ru, Corvettes -1500ru, Frigates -1100ru, Capitals -3200ru, and Non-Combat -800 for a total of -7700ru.
* Non-attackable subsystem icons now appear in the UI for Kushan/Taiidan Motherships and Carriers after researching Fighter, Corvette, Frigate, and Capital Ship research.

#### Scouts
* Cost 70->90
* Speed 490->460 (All scouts are now slower to make scouting harder)
* Speed burst ability multiplier 1.25->1.10

#### Interceptors
* Fighter Drive Research:
    * Cost 500->200
* Fighter Chassis Research:
    * Cost 800->300
* Weapon:
    * Damage vs corvettes 0.3->0.33

#### Attack Bombers
* Speed 390->420
* Weapons:
   * Velocity 1200->1800 (so they can hit subsystems on moving carriers)
   * Damage vs subsystems 2.5->2.0

#### Defenders
* Defender Sub-Systems Research:
    * Cost 1000->800
* Weapon:
    * Velocity 1200->1750
    * Damage vs fighters 1.0->0.5

#### Kushan Cloaked Fighters
* Cloaked Fighter Research:
    * Cost 1100->1000
* Build Time 15->12
* Now repair themselves in 60 seconds when idle and not taking damage

#### Taiidan Defense Fighters
* Defense Fighter Research:
    * Cost 1100->1000
* Build Time 15->12

#### Light Corvettes
* Corvette Drive Research:
    * Cost 1500->1000
* Cost 225->215
* Build Time 18->17

#### Salvage Corvettes
* Corvette Chassis Research:
    * Cost 1200->700
* Build Time 30->25
* Armor 1000->1200
* Can now kamikaze

#### Heavy Corvettes
* Heavy Corvette Research:
    * Cost 600->400
* Cost 240->230
* Build Time 20->19

#### Multigun Corvettes
* Fast-Tracking Turret Research:
    * Cost 800->500
* Cost 235->225
* Build Time 22->21
* Weapons:
   * Damage vs fighters 0.8->0.88

#### Minelayer Corvettes
* Cost 275->325
* Mine Duration 200->60 (to avoid stalemates)

#### Support Frigates
* Capital Ship Drive Research:
    * Cost 1300->1000

#### Assault Frigates
* Capital Ship Chassis Research:
    * Cost 1500->1200

#### Ion Cannon Frigates
* Ion Cannon Research:
    * Cost 2000->1700
* Weapon:
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)

#### Kushan Drone Frigates
* Kushan Drone Frigates can now attack while they are moving. Previously the drones rarely ever fired while the frig was moving. The drones now stay in a sphere while move-attacking (edit: due to an error, we had to temporarily remove this in build 12). Drones frigates are also now less demanding on your PC hardware, they spray less bullets that pack a harder bunch.
* Drone Tech Research:
    * Cost 1300->1100
* Drone Weapons:
    * Damage 15->50
    * Fire Delay 0.3->1.0 (Increased damage and reduced fire rate to improve the game's performance)
    * Velocity 1700->2100
    * Damage vs fighters 1.0->0.15
    * Damage vs corvettes 0.4->0.07
    * Damage vs frigates 0.7->0.2
    * Damage vs capitals 0.88->0.25
    * Damage vs platforms 1.0->0.2
    * Damage vs resourcing 0.47->0.25

#### Taiidan Field Frigates
* Defense Field Research:
    * Cost 1300->1100

#### Carriers
* Super Capital Ship Drive Research:
    * Cost 1700->1500
* Build Time 165->130
* Weapons:
   * Penetration vs fighters 3.75->3.0

#### Missile Destroyers
* Research Time 100->160
* Missile Launcher Weapon:
   * Range 4500->4000
   * Damage vs corvettes 1.0->0.8
* Missile Volley Weapon:
   * Range 4500->4000
   * Fire Delay 30->50
   * Damage vs frigates/capitals 1.0->2.0

#### Destroyers
* Super Heavy Chassis Research:
    * Cost 5000->4000
* Weapon:
    * Damage vs fighters 1.0->0.5
    * Damage vs corvettes 1.0->0.5

#### Heavy Cruisers
* Heavy Gun Research:
    * Cost 9000->7000
* Gun Weapons:
   * Range 5500->5000
* Ion Weapons:
   * Range 5300->4800
* No longer take hyperspace damage when they hit an inhibitor/GW. (like hw2 cruisers)

#### Resource Collectors
* Minimum hyperspace cost 300->350
* Maximum hyperspace cost 800->700

#### Probes
* Cost 100->150
 
#### Proximity Sensors
* Cost 150->250
* Build Time 15->20
* Can now guard ships (like hw1c)

#### Sensor Arrays
* Sensor Array Research:
    * Cost 1000->500
    * Time 80->50
* Cost 700->500
* Build Time 70->50

#### Gravity Well Generators
* Cost 800->1000
* Ability update interval 1.9->1 (so ships are caught faster)

#### Cloak Generators
* Cloak Generator Research:
    * Cost 800->500
    * Time 100->50
* Cost 800->600
