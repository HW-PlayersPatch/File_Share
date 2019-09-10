# Build 8 - Mar 8, 2018

## Gameplay Options and Features
* Added an Observer mode to spectate multiplayer matches.
* Added an AI Attack Damage adjuster to multiplayer and player vs cpu. This can be used to increase the AI's attack damage for a more challenging game.

## HWR Bugs Fixes and Improvements
* Addressed the major Cross Race Docking Bug. Fighters and corvettes will now only dock with ships from their own race. Previously, regenerated Hiigaran/Vaygr ships would be unable to launch from Kushan/Taiidan Repair Corvettes, Support Frigates, and Resource Controllers leading to major game lag and multiple glitches.
* Kushan/Taiidan repair units now have a continous beam like hw1c
* Kushan Ion Cannon Frigates are now pronounced correctly as 'Cannon', previously they were being pronounced as 'Cannit'.
* Improved parade formations for resource collectors, to reduce collisions with the motherships.
* Expert Taiidan AI now harvests resources at the same rate as the other races. (it was 10% higher by mistake)
* Kushan/Taiidan accuracy reduction abilities are now painted orange in the tactical overlay

## Campaign Improvements
**Homeworld 1**
* Fixed a rules of engagement bug that caused many Turanic, Kadeshi, and Junkyard ships to sometimes stop attacking unexpectedly and behave passively.
* Updated research costs to match multiplayer, and research times to 1.5x slower than multiplayer (the campaign research is slower paced). These hadn't been updated since HWR v1.0. Mission resources were also adjusted to support the changes.
* Captured Turanic Standard Corvettes can now be repaired.
* Captured Turanic Ion Array Frigates and Kadeshi Multi-beam Frigates can now be retired immediately.
**Homeworld 2**
* Fixed a rules of engagement bug that caused Keeper ships to sometimes stop attacking unexpectedly and behave passively.
* Applied some research cost/build time changes from the 2.0, 2.1, and 2.205 patches. These changes were made in multiplayer, but were accidently missed in the campaign. The campaign research stats now better match multiplayer.
* The base health of Vaygr missile platforms, destroyers, cruisers, and flagships have been slightly tweaked to align with multiplayer as they did in hw2c.
Mission 5:
* Lowered the Vaygr captial ship health upgrade to be closer to hw2c. (this was unintentionally altered in the 2.0 patch)
Mission 13:
* Lowered the Vaygr corvette, frigate, and captial ship health upgrades to be closer to hw2c. (these were unintentionally altered in the 2.0 patch)

## Balance
* Balanced dock repair times for fighters and corvettes (addressed a bug that caused squadrons to dock extremely fast. hw2 ships now repair slower, closer to their hw2c rate. hw1 corvettes repair 4.5x faster than before, to balance vs hw2.)
* Removed evasive stance bonuses from non-combat/utility ships (evasive stance re-routes power from weapons to engines, however this is not possible on non-combat ships and had no effect in hw1c)
* Tweaked rotational speeds on some units, for example to aid in positioning motherships around asteriod patches.
* Tweaked ship damage vs resourcing units, to be closer to the classics.
* Thousands of ship vs ship tests have been performed with Gearbox's developer balance testing tools, to fine tune combat performance.

### Hiigaran and Vaygr
Resource Collectors:
* Upgraded Health 5000->4000 -20% (to match hw2c)
Bombers:
* Damage vs corvettes -30%
Minelayer Corvettes:
* Cost 800->400 -50% (buff, hw1 are 275)
* Damage bonus in aggressive stance 1.32->1.1 -17%
Destroyers:
* Health 85k->90k +6% (+13% over v2.1, closer to hw2c when upgraded by popular demand)

### Hiigaran
Pulsar Corvettes:
* Damage vs frigates -10%
Defense Field Frigates:
* Health 20k->25k +25% (since this ship can't be upgraded, Taiidan Field Frigate is 30k)

### Vaygr
Resource Collectors:
* Resource capacity 208->200 -4% (Now matches Hiigaran to better balance harvesting. Vaygr still start with one extra collector to make up for their Flagship's long collector drop off route. Harvesting for all four races is now within 1% of each other.)
Hyperspace Platforms:
* Build Time 45->20sec (these took too long to setup)
* Speed 650->600 -8% (to match hw2c as they should not be faster than a probe)
Missile Corvettes:
* Damage vs hw1 fighters +110% (now performs similarly vs hw1 and hw2 fighters)
Command Corvettes:
* Build time 30->45sec +50% (slows down the replenishment of these powerful units)
* Attack/accuracy bonus range -51% (forces these ships to be on the front line so they can be countered)

### Kushan and Taiidan
* Overhauled Kushan and Taiidan. These races were rushed into HWR at release, and repeatedly band-aided over the previous patches. All ship speeds, health, costs, build times, and research costs/times are now consistently translated into the HWR engine, with a robust design methodology. Kushan and Taiidan now feel much more like hw1 classic, while being better balanced against Hiigaran and Vaygr.
* Harvesting for all four races is now balanced at the 10, 20, and 30 minute marks. Previously hw1 was behind hw2 at 10mins, and ahead at 30minutes. Harvesting is also now better balanced on maps with different asteriod layouts.
* Generally research costs have gone up, while research times have come down. This improves balance vs hw2 upgrade costs, while allowing hw1 to tech up faster, eliminating some pain points.
* Adjusted base health to remove hidden armour modifiers from all ships other than frigates. Relic only applied armour modifiers to frigates, however Gearbox used them sporadically on hw1 units.
* Race specific unit abilities now perform closer to hw1c, details are below.
* Many changes below are to make ships relatively similar to hw1c, while also providing for better balance vs hw2 races.

__Scouts__
-Build Time 10->8sec -20%
-Sensors range -9% (scouting was too hard to deny)
-Speed burst ability duration 50->30secs -40%

__Interceptors__
-Fighter Drive Research Cost 100->500, Time 25->14sec
-Fighter Chassis Research Cost 200->800, Time 35->21sec
-Build Time 7->9sec +29% (was funny to have interceptors build faster than scouts)

__Bombers__
-Cost 120->130 +8%

__Defenders__
-Defender Sub-Systems Research Cost 400->1000, Time 64->53sec
-Build Time 9->7sec -22%

__Kushan Cloaked Fighters__
-Cloaked Fighter Research Cost 500->1100
-Cloak ability now lasts indefinitely (same as hw1c)

__Taiidan Defense Fighters__
-Defense Fighter Research Cost 500->1100
-Built Time 18->15sec -17%
-Health 108->300 +178%
-Attack style is now closer to hw1c. Their laser weapon has been adjusted to be more consistent, and it now prioritizes mines over missiles.
-Added an accuracy reduction within the field of -1% (similar to Field Frigates, but a smaller effect)

__Repair Corvettes__
-Build Time 20->16sec -20%
-Speed 255->320 +25% (to be able to heal the fastest corvette)
-Health 1440->1200 -17%
-Healing beam arc increased

__Light Corvettes__
-Corvette Drive Research Cost 800->1500, Time 71->53sec
-Speed 285->305 +7%

__Salvage Corvettes__
-Corvette Chassis Cost 900->1200, Time 64->42sec

__Heavy Corvettes__
-Speed 245->290 +18%

__Multi-Gun Corvettes__
-Fast-Tracking Turret Research Cost 700->800
-Speed 275->320 +16%
-Health 1100->1400 +27%

__Minelayer Corvettes__
-Minelaying Tech Research Cost 700->1200, Time 49->71sec
-Build Time 25->35sec +40%
-Speed 246->255 +4%
-Health 1080->1800 +67%
-Damage bonus in aggressive stance 1.32->1.1 -17%

__Support Frigates__
-Capital Ship Drive Research Cost 800->1300, Time 71->53sec
-Cost 800->600 -25%
-Build Time 85->65sec -24%
-Health 26000->21000 -19%
-Healing beam arc increased

__Assault Frigates__
-Capital Ship Chassis Research Cost 1400->1500, Time 85->64sec
-Cost 800->700 -13%
-Build Time 68->60sec -12%
-Now prioritize attacking corvettes over frigates.
-Rebalanced weapons to be more consistent vs fighters and corvettes, by increasing accuracy and decreasing damage.
-For Taiidan, fixed a gun alignment bug which caused 2 of their 4 guns to always miss small targets.

__Ion Frigates__
-Ion Cannon Research Cost 1000->2000, Time 64->85sec
-Cost 900->800 -11%
-Build Time 73->60sec -18%

__Kushan Drone Frigates__
-Drone Tech Research Cost 1100->1300, Time 28->57sec
-Build Time 77->70sec -9%
-Speed 166->206 +24%
-Health 25500->27500 +8%
-Drone ability now lasts indefinitely and drones deploy 70% faster (same as hw1c)

__Taiidan Field Frigates__
-Defense Field Research Cost 1100->1300, Time 28->57sec
-Build Time 77->70sec -9%
-Speed 166->206 +24%
-Health 26000->30000 +15%

__Motherships__
-Multiplayer Only: Health 322k->420k +30% (to match an upgraded Hiigaran Mothership)

__Carriers__
-Super Capital Ship Drive Research Cost 1300->1700, Time 71->35sec
-Cost 3000->3500 +17% (with a frigate module Hiigaran is 3800 and Vaygr is 3100)
-Build time 210->165sec -21% (it was a huge blow to lose a carrier, since they took so long to build)
-Health 105k->120k +14%

__Destroyers__
-Super Heavy Chassis Research Cost 1900->5000, Time 53->99sec
-Cost 2500->2250 -10%
-Health 106k->112k +6%

__Missile Destroyers__
-Guided Missile Research Cost 1400->3500, Time 42->71sec
-Cost 2000->2500 +25%
-Health 65k->106k +63%
-Damage vs hw2 corvettes -20%
-Now count againt the destroyer unit cap like hw1c. Normal unit caps allow for six destroyers, two of which can be missile destroyers.

__Heavy Cruisers__
-Heavy Gun Research Cost 5500->9000

__Resource Collectors__
-Cost 600->500 -17%
-Build Time 50->40sec -20%
-Health 6000->5000 -17%
-Speed 110->206 +87% (to match assault frigates speed like hw1c)
-Resource capacity 500->250 -50%

__Resource Controller__
-Health 27500->30000 +9%
-Speed 100->190 +90%

__Research Ships__
-Build Time 50->45sec -10% (the first hub now builds as fast as the rest)
-Speed 100->175 +75%

__Proximity Sensors__
-Proximity Sensor Research Cost 250->500
-Speed 350->450 +29%

__Sensors Array__
-Sensor Array Research Cost 350->1000
-Speed 90->175 +94%
-Sensors range +8%

__Gravity Wells__
-Gravity Generator Research Time 35->71sec (same as v2.1)
-Cost 800->1000 +25%
-Health 14400->11000 -24%
-Ability duration 30->25sec (they are extremely effective with ballistics)

__Cloak Generators__
-Speed 165->206 +25%
-Health 7500->9000 +17%
-Ability duration 100->120sec +20%