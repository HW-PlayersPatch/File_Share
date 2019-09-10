# General
* All changes from Gearbox's 2.205 Patch Preview and the 2.3 Players Patch are listed below.



# Balance
* Fixed the major [666 Formation Targeting Bug](https://forums.gearboxsoftware.com/t/666-formation-targeting-bug/1541832/1) - Formations and squadrons now perform as they were intended to!
* With the 666 bug resolved, all fighters and corvettes went through a very thorough balance testing process. Tweaks were made as needed to align them with intended balance that Gearbox and the balance testers had crafted. Ships now perform like they are supposed to using balistic/simulation combat features (for example idle ships are generally a lot easier to hit than moving ships).
* Thousands of ship vs ship tests have been performed with Gearbox's developer balance testing tools, to fine tune combat performance.
* Balanced dock repair times for fighters and corvettes. Addressed a bug that caused squadrons to dock extremely fast. hw2 ships now repair slower, closer to their hw2c rate. hw1 corvettes repair 4.5x faster than before, to balance vs hw2.
* Decreased the sensors range of all scouts and probes by about 20%, 30% for Kushan/Taiidan scouts. Scouting is easy in HWR compared to other RTS games, so this is intended to make information harder to obtain.
* Tweaked rotational speeds on some units, for example to aid in positioning motherships around asteriod patches.
* Removed evasive stance bonuses from non-combat/utility ships (evasive stance re-routes power from weapons to engines, however this is not possible on non-combat ships and had no effect in hw1c)
* Hyperspace exit damage lowered from 25% to 10%, when running into a hyperspace inhibitor.
* Kamikaze damage adjusted on some units to prevent exploits, and resolve typos.
* Lowered death/scuttle blast range on frigates, motherships, carriers, shipyards, and battle cruisers (so fighters and corvettes can better survive capital ship battles).
* High unit caps: Destroyers 9->7, Missile Destroyers 4->3, Cruisers 4->3. Huge unit caps: Destroyers 14->11.
* Note: the base research times below get faster with each research ship/module.

 
## Hiigaran
* Hiigaran is largely the same as in Homeworld 2 Classic (hw2c), but with several improvements and many tweaks for better balance vs hw1 races. The biggest difference from hw2c is single tiered upgrades to balance against Homeworld 1 races that do not have upgrades (as implimented in the 2.0 patch).

**Scouts**
* Speed 512->480
* EMP Weapon:
  * Range 3000->1500
  * Now leads targets

**Interceptors**
Damage vs corvettes -31%
Damage vs frigs and capital-ships -60%
Damage vs subsystems +40%

**Bombers**
* Speed Upgrade Cost 600->400
* Speed 279->300
-Speed Upgrade Costs 600->400 (to balance vs Vaygr)
-Hiigaran bombers now check their line of fire like the other races do, to avoid friendly fire incidents
-Damage vs corvettes -30%
Accuracy vs corvettes 80%->20%
Damage vs frigates +40%

**Gunship Corvettes**
* Armor Upgrade Cost 800->600
* Armor Upgrade Time 40->35
* Speed 232->254
Damage vs fighters +13%

**Pulsar Corvettes**
-Damage vs hw2 corvettes -33% (to balance vs Vaygr)
-Damage vs frigates -10%
Damage vs fighters/probes increased 100%

**Minelayer Corvettes**
* Cost 800->400
* Speed 233->291
* Armor 900->1500
* Aggressive stance damage +32%->+10%
-Cost 800->400 -50% (buff, hw1 are 275)
-Damage bonus in aggressive stance 1.32->1.1 -17%

**Torpedo Frigates**
Damage vs hw2 resource collectors increased 30% (only helps vs upgraded hw2 collectors)
Damage vs fighters/probes increased 100%

**Flak Frigates**
* Speed Upgrade Cost 600->400
* Speed Upgrade Time 50->25
* Armor Upgrade Cost 1000->600
* Armor Upgrade Time 75->40
* Build Time 50->45
Damage vs hw1 fighters increased 64% (results in a decent buff)

**Marine Frigates**
* Speed 230->270
* Armor 20k->23.5k

**Defense Field Frigates**
* Build Time 60->55
* Speed 177->220
* Armor 20k->25k
-Cost 1000->1250 +25% (to match hw2c)
-Build Time 60->70 +17% (to match hw2c)
-Hull 20k->25k +25% (since this ship can't be upgraded, Taiidan Field Frigate is 30k)

**Motherships**
* Speed Upgrade Cost 600->400
* Armor Upgrade Cost 1000->800
Damage vs hw2 resource collectors -45%

**Carriers**
* Speed Upgrade Cost 600->400
* Armor Upgrade Cost 1000->800
* Build Speed Upgrade Cost 1500->2250
Damage vs hw2 resource collectors -45%

**Shipyards**
* Speed Upgrade Cost 600->400
* Armor Upgrade Cost 1000->800, Time 60->30
* Build Time 85->75 (to match hw2c)
-Addressed a gun alignment bug. They were shooting to the side of their targets, and rarely landing hits vs small targets like probes, fighters, and corvettes.
Damage vs hw2 resource collectors -45%

**Destroyers**
* Armor 80k->90k (closer to hw2c when upgraded)
* Regen Time 1074->750

**Battle Cruisers**
* Armor 170k->192k
* Ion Weapons Range 5800->5500
* Gun Weapons Range 5000->4500 
Range +3%
Fixed an issue where the hiigaran battlecruiser would sometimes sit pointed 10 degrees up or down vs a target on the same vertical level - causing the nose of the ship to block one ion turret from attacking.

**Gun Platforms**
* Speed 100->125 (to match hw2c)
Damage vs fighters +100% (A typo gave them less damage than intended)
Damage vs hw2 resource collectors -43%
Accuracy vs frigates and capital-ships 40%->80%

**Ion Platforms**
* Speed 100->125 (to match hw2c)
-Damage -16% (same as hw2c)
Damage vs idle fighters/probes increased a lot

**Resource Collectors**
* Armor Upgrade Cost 800->1000
* Armor Upgrade Value 2.0->1.6
* Repair Research Cost 750->200
* Repair Research Time 40->20
* Kamikazi multiplier 0.2->0.6

**Resource Controllers**
* Armor 18k->16k
Damage vs hw2 resource collectors -45%

**Probes**
* Cost 70->120
* Build Time 10->15
* Armor 800->400 (its now half way between hw1c and hw2c, as some ships were taking too long just to kill a probe.)

**Proximity Sensors**
* Proximity Sensor Research Time 35->45
* Build Time 15->20
* Armor 800->400

**Sensors Distortion Probes**
* Sensors Distortion Research Time 45->30
* Cost 600->500
* Build Time 20->25
* Armor 800->400

**Carrier Fighter/Corvette/Frigate Modules**
* Armor 28k->25k

**Carrier Platform Modules**
* Armor 20k->25k

**Proximity Sensor Modules**
* Cost 250->375
* Build Time 35->45

**Hyperspace Sensor Modules**
* Cost 250->500
* Build Time 35->45



## Vaygr
* Vaygr is largely the same as in Homeworld 2 Classic (hw2c), but with several improvements and many tweaks for better balance vs hw1 races. The biggest difference from hw2c is single tiered upgrades to balance against Homeworld 1 races that do not have upgrades (as implimented in the 2.0 patch).
* Re-balanced the Vaygr unit caps, to allow for fair transferring between players of different races. Interceptors/Bombers now count as 5 supply, and Missle/Laser Corvettes count now as 3 supply. Unit caps have been updated appropriately.

**Scouts**
* Speed 420->350
-Addressed a gun alignment bug. They were shooting to the side of their targets, and rarely landing hits vs small targets like probes and fighters.

**Assault Craft**
Damage vs corvettes -31%
Damage vs frigs and capital-ships -60%
Damage vs subsystems +40%

**Bombers**
* Speed 279->300
-Damage vs corvettes -30%
Accuracy vs corvettes 80%->20%
Damage vs frigates +40%

**Lance Fighters**
* Speed 279->314
* Armor 90->110
* Small/High unit caps increased to match bombers

**Corvettes**
* Armor Upgrade Cost 1600->1800 (to balance vs Hiigaran)

**Missile Corvettes**
* Kamikazi multiplier 1.0->0.6 (To prevent exploits)
-Damage vs hw1 fighters +110% (now performs similarly vs hw1 and hw2 fighters)
Damage vs fighters -55% (they now perform closer to hw2c)
Fixed a bug where they would deal zero damage to probes

**Laser Corvettes**
* Cost 650->625
* Armor 480->510
* Kamikazi multiplier 0.7->0.6 (To prevent exploits)
-Laser Corvettes were the only corvettes negatively impacted by the 666 Bug. They are now performing as intended: the best anti-frigate and anti-capital ship corvette in the game.
Fixed a bug with the attack script where laser corvettes would start doing evasive maneuvers and rarely attacking. This bug fix makes laser corvettes much more effective.

**Command Corvettes**
* Command Systems Research Time 60->45
* Cost 400->750
* Build Time 30->45
* Armor 900->1000
-Build Time 30->45 +50% (slows down the replenishment of these powerful units)
-Attack/accuracy bonus range -51% (forces these ships to be on the front line so they can be countered)

**Minelayer Corvettes**
* Cost 800->400
* Armor 900->1000
* Aggressive stance damage +32%->+10%
-Cost 800->400 -50% (buff, hw1 are 275)
-Damage bonus in aggressive stance 1.32->1.1 -17%

**Assault Frigate**
* Assault Research Cost 500->550
* Assault Research Time 40->35
* Armor 17k->18k
Cost 500->650 (was 650 in hw2c)
Research Time +12% (to same as hw2c)
Damage vs Hiig/Vaygr fighters -50% (results in a small nerf)
Damage vs hw1 fighters +400% (results in a decent buff)

**Heavy Missile Frigates**
* Build Time 45->50
* Armor 18.5k->18k
-Range -6% (closer to hw2c)

**Infiltrator Frigates**
* Infiltration Research Cost 1000->800, Time 60->50
* Speed 230->240
* Armor 20k->21k

**Capital Ships**
* Armor Upgrade Cost 3000->3500, Time 90->95 (to balance vs Hiig)
* Speed Upgrade Cost 1500->2000, Time 60->80 (to balance vs Hiig)

**Flagships**
Damage vs hw2 resource collectors -45%

**Carriers**
* Build Speed Upgrade Cost 1500->2500
* Cost 1900->2100
Damage vs hw2 resource collectors -45%

**Shipyards**
Damage vs hw2 resource collectors -45%

**Destroyers**
* Destroyer Research Cost 2000->1750
* Armor 80k->90k (closer to hw2c when upgraded)

**Battlecruiser**
* Armor 170k->192k
Trinity Cannon Range +1%
Damage vs capital-ships -6% (with no micro, makes 1 hiigaran cruiser vs 1 vaygr cruiser consistently come out even like in hw2c. With micro, vaygr can slightly out-range hiigaran and win.)

**Platforms**
* Armor Upgrade Cost 1500->1400
* Armor Upgrade Time 150->135
-Hull Upgrade Costs 1500->1600 (to balance vs Hiigaran)

**Gun Platforms**
* Speed 100->125 (to match hw2c)
Damage vs fighters +100% (A typo gave them less damage than intended)
Damage vs hw2 resource collectors -43%
Accuracy vs frigates and capital-ships 40%->80%

**Heavy Missile Platforms**
* Speed 100->125 (to match hw2c)
-Damage -16% (same as hw2c)

**Hyperspace Platforms**
* Hyperspace Research Cost 750->500
* Hyperspace Research Time 50->45
* Cost 375->325
* Build Time 45->20
* Speed 650->600
* Armor 18500->27750
* Now able to hyperspace jump.
-Build Time 45->20sec (these took too long to setup)
-Speed 650->600 -8% (to match hw2c as they should not be faster than a probe)

**Utility Ships**
* Armor Upgrade Cost 1200->1400
* Armor Upgrade Value 2.0->1.6

**Resource Collectors**
* Repair Research Cost 500->200
* Repair Research Time 30->20
* Speed 280->276
* Kamikazi multiplier 0.2->0.6
-Resource capacity 208->200 -4% (Now matches Hiigaran to better balance harvesting. Vaygr still start with one extra collector to make up for their Flagship's long collector drop off route. Harvesting for all four races is now within 1% of each other.)

**Resource Controllers**
* Armor 18k->16k
Damage vs hw2 resource collectors -45%

**Probes**
* Cost 70->120
* Build Time 10->15
* Armor 800->400 (its now half way between hw1c and hw2c, as some ships were taking too long just to kill a probe.)

**Proximity Sensors**
* Proximity Research Time 40->45
* Build Time 15->20
* Armor 800->400

**Sensors Distortion Probes**
* Sensors Distortion Research Time 60->50
* Build Time 20->25
* Armor 800->400

**Carrier Fighter/Corvette/Frigate Modules**
* Armor 28k->25k

**Carrier Platform Modules**
* Armor 20k->25k

**Hyperspace Sensor Modules**
* Cost 250->500
* Build Time 35->45



## Kushan and Taiidan
* Overhauled Kushan and Taiidan. These races were rushed into HWR at release, and repeatedly band-aided over the previous patches. All ship speeds, Hull, costs, Build Times, and research costs/times are now consistently translated into the HWR engine, with a robust design methodology. Kushan and Taiidan now feel much more like hw1 classic, while being better balanced against Hiigaran and Vaygr.
* Adjusted Kushan/Taiidan harvesting so that harvesting for all four races is balanced at the 10, 20, and 30 minute marks. Previously hw1 was behind hw2 at 10mins, and ahead at 30minutes. Harvesting is also now better balanced on maps with different asteriod layouts.
* Generally research costs have gone up, while research times have come down. This improves balance vs hw2 upgrade costs, while allowing hw1 to tech up faster, eliminating some pain points.
-Adjusted base Hull to remove hidden armour modifiers from all ships other than frigates. Relic only applied armour modifiers to frigates, however Gearbox used them sporadically on hw1 units. The ship Hull values listed below are the actual effective Hull.
* Corvettes now move around their targets a lot more in combat (similar to hw1c).
* Race specific unit abilities now perform closer to hw1c, details are below.
* Many changes below are to make ships relatively similar to hw1c, while also providing for better balance vs hw2 races.

**Scouts**
* Cost 70->100
* Speed 490->460
* Speed burst ability duration 50->30
Speed burst ability multiplier ?->?
-Kushan and Taiidan Scouts are now balanced, previously Kushan would always win. (Not intended)
Damage vs fighters -50% (A typo gave them twice their intended damage, causing major balance issues)
Damage vs corvettes -31%
Damage vs frigates and capital-ships -50%

**Interceptors**
* Fighter Drive Research:
    * Cost 100->200
    * Time 35->20
* Fighter Chassis Research:
    * Cost 200->300
    * Time 50->30
* Build Time 7->9
(was funny to have interceptors build faster than scouts)
-Kushan and Taiidan Interceptors are now balanced, previously Taiidan would always win. (Not intended)
Damage vs corvettes -31%
Damage vs frigates and capital-ships -50%
Damage vs subsystems +40%

**Bombers**
* Cost 120->130
* Speed 390->420
* Armor 135->125
Accuracy vs corvettes 80%->20%
Damage vs frigates +40%

**Defenders**
* Defender Sub-Systems Research:
    * Cost 400->800
    * Time 90->75
* Build Time 9->7
* Speed 140->214
* Armor -10% (removed a hidden multiplier)
* Armor 360->400

**Kushan Cloaked Fighters**
* Cloaked Fighter Research Cost 500->1000
* Cost 130->120
* Build Time 15->10
* Cloak ability now lasts indefinitely (same as hw1c)

**Taiidan Defense Fighters**
* Defense Fighter Research Cost 500->1000
* Built Time 18->15
* Armor +20% (removed a hidden multiplier)
* Armor 135->300
-Attack style is now closer to hw1c. Their laser weapon has been adjusted to be more consistent, and it now prioritizes mines over missiles.
-Added an accuracy reduction within the field of -1% (similar to Field Frigates, but a smaller effect)

**Repair Corvettes**
* Build Time 20->16
* Speed 255->320 (to be able to heal the fastest corvette)
* Armor -20% (removed a hidden multiplier)
-Healing beam arc increased

**Light Corvettes**
* Corvette Drive Research:
    * Cost 800->1000
    * Time 100->75
* Cost 225->215
* Build Time 18->17
* Speed 285->305
Damage vs fighters +20%

**Salvage Corvettes**
* Corvette Chassis Research:
    * Cost 900->700
    * Time 90->60
* Build Time 30->25
* Armor 1000->1200

**Heavy Corvettes**
* Heavy Corvette Research Cost 600->400
* Cost 315->230
* Build Time 22->19
* Speed 245->290
-Kushan and Taiidan Heavy Corvettes are now balanced, previously Taiidan would always win. (Not intended)
-No longer prioritize attacking fighters (since they aren't very good vs fighters)
Damage vs hw2 corvettes -9%

**Multi-Gun Corvettes**
* Fast-Tracking Turret Research Cost 700->500
* Cost 300->225
* Build Time 22->21
* Speed 275->320
* Armor 1100->1400
Damage vs fighters +38%

**Minelayer Corvettes**
* Minelaying Tech Research:
    * Cost 700->1200
    * Time 70->100
* Cost 275->325
* Build Time 25->35
* Speed 246->280
* Armor -20% (removed a hidden multiplier)
* Armor 900->1800
* Aggressive stance damage +32%->+10%

**Support Frigates**
* Capital Ship Drive Research:
    * Cost 800->1000
    * Time 100->75
* Cost 800->700
* Build Time 85->60
* Armor 26k->21k
-Healing beam arc increased

**Assault Frigates**
* Capital Ship Chassis Research:
    * Cost 1400->1200
    * Time 160->90
* Cost 800->700
* Build Time 68->60
* Now prioritize attacking corvettes over frigates.
* Rebalanced weapons to be more consistent vs fighters and corvettes, by increasing accuracy and decreasing damage.
* For Taiidan, fixed a gun alignment bug which caused 2 of their 4 guns to always miss small targets.
Capital Ship Chassis Research Time down 113->85 (allows hw1 to get assault frigates faster)
Damage vs corvettes -50%
Damage vs hw2 resource collectors -25%

**Ion Frigates**
* Ion Cannon Research:
    * Cost 1000->1700
    * Time 50->120
* Cost 900->750
* Build Time 73->60
Ion Cannon Research Time up 35->64 (same timing, considering the capital ship chassis research buff)
Damage vs frigates -24% (they still beat hw2 ion frigates with 10% Hull left. This was a big oversight in balance testing the 2.0 patch.)

**Kushan Drone Frigates**
* Drone Tech Research Time 40->80
* Cost 900->700
* Build Time 77->50
* Speed 166->222
* Armor 25500->27500
* Drone ability now lasts indefinitely and drones deploy 70% faster (same as hw1c). Drones now attack properly while the frigate is moving.

**Taiidan Field Frigates**
* Defense Field Research Time 40->80
* Build Time 77->70
* Speed 166->206
* Armor 26k->30k

**Motherships**
* Armor -15% (removed a hidden multiplier)
* Multiplayer Only: Armor 280k->420k (to match an upgraded Hiigaran Mothership)
Damage vs fighters +25%
Can now target any ship (previously couldn't target some ships)

**Carriers**
* Super Capital Ship Drive Research:
    * Cost 1300->1500
    * Time 100->50
* Cost 3000->3500 (with a frigate module Hiigaran is 3800 and Vaygr is 3100)
* Build Time 210->130 (it was a huge blow to lose a carrier, since they took so long to build)
* Armor 105k->120k
Damage vs fighters +25%
Damage vs hw2 resource collectors -45%
Can now target any ship (previously couldn't target some ships)

**Missile Destroyers**
* Guided Missile Research:
    * Cost 1400->3000
    * Time 60->100
* Cost 2000->2500
* Speed 130->145
* Armor 65k->75k
-Damage vs hw1 corvettes -40%
-Damage vs hw2 corvettes -20%
* Now count againt the destroyer unit cap like hw1c.

**Destroyers**
* Super Heavy Chassis Research:
    * Cost 1900->3000
    * Time 75->140
* Cost 1800->2250 (to balance vs hw2 destroyer ship and upgrade costs)
* Build Time 160->145 (to balance vs hw2)
* Armor 99k->112k

**Heavy Cruisers**
* Heavy Gun Research Cost 5500->7000

**Resource Collectors**
* Cost 600->500
* Build Time 50->40
* Speed 110->206 (to match assault frigates speed like hw1c)
* Armor 6000->5000
* Resource capacity 500->250
* Kamikazi multiplier 0.2->0.6

**Resource Controller**
* Speed 100->190
* Armor -10% (removed a hidden multiplier)
* Armor 25k->30k

**Research Ships**
* Build Time 50->45 (the first hub now builds as fast as the rest)
* Speed 100->175
* Taiidan Armor 30k->45k (to match Kushan Armor and fix a mistake from the 2.1 patch)

**Probes**
* Cost 70->120
* Hull 800->400 (its now half way between hw1c and hw2c, as some ships were taking too long just to kill a probe.)

**Proximity Sensors**
* Proximity Sensor Research:
    * Cost 250->600
    * Time 40->45
* Build Time 6->20
* Speed 350->450
* Hull 800->400

**Sensors Array**
* Sensor Array Research Cost 350->500
* Cost 700->500
* Build Time 70->60
* Speed 90->175

**Gravity Wells**
* Cost 800->1000
* Armor +20% (removed a hidden multiplier)
* Armor 18k->11k
* Now uses frigate armour (this is generally a armor buff, as most ships deal reduced damage to frigates)
* Ability duration 45->25 (they are extremely effective with ballistics)
-Ability Range -20%
* Can now be repaired (like in hw1c)

**Cloak Generators**
* Cloak Generator Research:
    * Cost 800->500
    * Time 100->50
* Cost 800->750
* Speed 114->206
* Armor +20% (removed a hidden multiplier)
* Ability duration 100->120
-Ability range +100%