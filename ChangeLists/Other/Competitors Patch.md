# Competitors Patch to Players Patch Change List | September 28, 2019
> The Competitors Patch was a separate mod based on the Players Patch. However it is no longer being updated, and has been folded back into / included in the Players Patch. Dual Command mode, balance improvements, bug fixes, etc have been included and further refined. This change list covers the balance changes from the old Competitors Patch Build 11.1 to the new Players Patch Build 11.

---

## Balance
> *General changes affecting multiple races.*
* Lowered death/scuttle blast range on motherships, and shipyards so fighters and corvettes can better survive capital ship battles.
* Damaged resource collectors latched onto RU drop-offs now heal 2.5 times faster, so they don't clog up resource drop-offs for so long.
* Kushan and Taiidan fighters and corvettes can now be EMP'd with just one squad of Hiigaran/Vaygr scouts, rather than two squads like before.

---

#### Death/Scuttle Damage Radius
> *Scuttling motherships is insanely difficult to react to, and effects different races in very different ways. This is a creative strategy and should definitely still be achievable, however opponents should have the ability to respond within a reasonable time window rather than half a second.*
* Motherships:
  * Death damage radius: `2175 -> 1500` (-31%)
  * Scuttle damage radius: `4350 -> 3000` (-31%)
* Shipyards:
  * Death damage radius: `1613 -> 1200` (-26%)
  * Scuttle damage radius: `3225 -> 2400` (-26%)

---

#### Unit Caps
> *Destroyer balls can be absolutely impossible to stop without cruisers. Too many destroyers can be too much of a snowball factor. Toning this back to its hw2c/v2.1 state for normal unit caps, and lowering similarly for high and huge.*
* Normal:
    * Destroyers: `6 -> 5` (-17%)
* High:
    * Destroyers: `9 -> 7` (-22%)
    * Missile Destroyers: `4 -> 3` (-25%)
* Huge:
    * Destroyers: `14 -> 11` (-21%)

---

### Hiigaran

> *Hiigaran have had some of their units reverted to their old stats as they were in 2.3b9, and for the early stages of the Competitors Patch. This is primarily to provide a clearer slate to balance off heading forwards - many buffs and nerfs were only in place to offset previous buffs and nerfs. Instead, we've just reverted a few steps back. Hyperspace time increased from 6 to 7 seconds for all hiigaran non-production ships, and 6 to 9.5 seconds for production ships.*

---

#### Scouts
> *Chipping away at this units escape factor. Keeping in mind that ints move with `488` speed when upgraded. Some reversions to EMP changes - EMP now stuns vettes in two hits and frigates in five - planning to make further changes. Finally, scouts should not be able to cut through dust clouds. There are units dedicated to this role (probes, proxies).*
* Speed: `485 -> 480`
* Weapons:
  * EMP:
    * Base damage down: `50 -> 20` (-40%)
    * Range down: `3000 -> 1500` (-50%)
    * Accuracy multipliers:
      * vs Corvettes: `0.15 -> 1` (+566%)
* Vision:
  * Vision range: `4000 -> 1500` (-63%)

---

#### Interceptors
> *Damage multipliers vs corvettes is half way between 2.3b9 and the Competitors Patch. Restoring damage vs subsystems.*
* Weapons:
  * Kinetic gun:
    * Damage Multipliers:
	  * vs HW2 Corvettes: `0.312 -> 0.286` (-8%)
	  * vs HW1 Corvettes: `0.48 -> 0.44` (-8%)
      * vs Resourcing: `0.5 -> 0.33` (-34%)
      * vs Subsystems: `1 -> 1.4` (+40%)

---

#### Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love. Updated the Basic Bomb Launcher to match the Upgraded Bomb Launcher vs everything other than subsystems.*
* Speed: `279 -> 300` (+7.3%)
* Weapons:
	* All bombs now have same projectile speed: `1200 -> 1800` (+50%)
  * Basic Bomb Launcher:
    * Damage Multipliers:
      * vs HW2 Corvettes: `1 -> 0.7` (-30%)
      * vs HW1 Corvettes: `1.15 -> 0.8` (-30%)
      * vs Frigates: `1 -> 1.2` (+20%)
      * vs Resourcing: `0.2 -> 0.17` (-15%)
    * Accuracy Multipliers:
      * vs HW2 Corvettes: `0.8 -> 0.2` (-75%)
      * vs HW1 Corvettes: `0.9 -> 0.225` (-75%)

---

#### Corvette Facilities
> *Carriers were building these 5s faster than motherships. Oops.*
* Build time (carriers): `55 -> 60` (+10%)

---

#### Gunship Corvettes
> *Reverted research to 2.3b9 state, all hw2 research will be reviewed in the future. Reverted speed to 2.3b9 to ensure fighters maintain their mobility advantage. Weapon effectiveness is half way between 2.3b9 and the Competitors Patch.*
* Research:
  * Armor upgrade:
    * Cost: `650 -> 800` (+23%)
    * Time: `35 -> 40` (+14%)
* Speed: `254 -> 232` (-9%)
* Weapons:
  * Kinetic turret:
    * Projectile speed: `1800 -> 1600` (-11%)
  	* Range: `2200 -> 1600` (-27%)
    * Damage Multipliers:
      * vs HW2 Fighters: `1.7 -> 1.6` (-6%)
    * Accuracy Multipliers:
      * vs HW2 Fighters: `1 -> 0.9` (-10%)

---

#### Pulsar Gunship Corvettes
> *Some reversions here - prior changes were not properly tested and have affected pulsars in unexpected ways.*
* Weapons:
  * Damage Multipliers:
	  * vs HW2 Fighters: `0.19 -> 0.24` (+23%)
	  * vs HW1 Fighters: `0.2 -> 0.25` (+25%)

---

#### Flak Frigates
> *Reverted build time, armor up to match ion frigates.*
* Build time: `45 -> 50` (+11%)
* Armor: `18000 -> 18500` (+3%)

---

#### Torpedo Frigates
> *A nerf which was put in place after various other nerfs to corvettes. In practice, had very little effect as the damage load of a torpedo is so high that the weapon needs very strong nerfs to make a difference. Various corvettes have their old armor values, so this is also going back.*
* Weapons:
  * Cluster torpedo:
	  * Damage multipliers:
		  * vs HW1 Corvettes: `0.4 -> 0.8` (+100%)

---

#### Ion Cannon Frigates
> *This unit has issues with aligning to its targets. Upping their attack cone should improve the QOL for this unit, and hopefully help them compete with heavy missiles in a more organic way.*
* Weapons:
  * Ion cannon:
    * Firing arc: `6 -> 12` (+100%)

---

#### Marine Frigates
> *Reverted speed, armor down some but still up from 2.3b9. Vaygr infiltrator frigates are intended to be superior with upgrades.*
* Speed: `270 -> 230` (-15%)
* Armor: `23500 -> 22000` (-6%)

---

#### Defense Field Frigates
> *Build time up some, still buffed from 2.3b9. Speed reversion, defense field frigates are outpacing normal combat frigates. Armor standardized with marines.*
* Build time: `55 -> 60` (+9%)
* Speed: `250 -> 220` (-30%)
* Armor: `25000 -> 22000` (-12%)

---

#### Mothership
> *Part of rollbacks to 2.3b9 stats. Overperforming vs HW1 fighters.*
* Research:
  * Armor upgrade:
    * Time: `45 -> 30` (-33%)
  * Production speed upgrade:
    * Cost: `1500 -> 1000` (-33%)
* Weapons:
  * Hull guns:
    * Damage Multipliers:
      * vs all Fighters: `3 -> 2.25` (-25%)
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Carriers
> *Overperforming vs HW1 fighters.*
* Weapons:
  * Hull guns:
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Shipyards
> *Same idea behind a similar change the Mothership.*
* Research:
  * Production speed upgrade:
	* Cost: `1750 -> 1000` (-55%)
    * Time: `60 -> 40` (-33%)
* Weapons:
  * Hull guns:
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Destroyers
> *Reversion of this unit. Destroyers overall had their damage cut against resourcing. This has made them extremely linear in their gameplan as they are hard pressed to inflict logistical damage without significant numbers. Reverting this.*
* Research:
  * Unit unlock:
    * Time: `100 -> 90` (-10%)
* Weapons:
  * Torpedoes:
    * Damage multipliers:
      * vs Resourcing: `0.3 -> 0.6` (+100%)

---

#### Battlecruisers
> *Reverting a Competitors Patch change. Cruisers were very fragile, however a flat buff would be a step back with this unit. BC range was reduced by 10% in the Competitors Patch, we've changed this to be a flat 500 range nerf now. This is because a % nerf was interacting in unexpected ways in cruiser duels due to various factors such as turret placements and the fact that not all cruiser weapons have the same range.*
* Research:
  * Unit unlock:
    * Time: `150 -> 140` (-7%)
  * Armor upgrade:
    * Cost: `2000 -> 1500` (-25%)
  * Speed upgrade:
    * Cost: `900 -> 600` (-33%)
* Armor: `160000 -> 192000` (+18%)
* Speed: `87 -> 79` (-11%)
* Weapons:
  * Main ions:
    * Range: `5400 -> 5500` (+2%)

---

#### Gun Platforms
> *Some reversions*
* Weapons:
  * Kinetic turret:
    * Damage: `60 -> 40` (-33%)
    * Projectile speed: `2300 -> 2200` (-4%)

---

#### Ion Cannon Platforms
> *Small buff.*
* Health Upgrade:
    * Time `120 -> 100` (-17%)

---

#### Resource Collectors
> *This armor upgrade is such a defensive freebie it hurts to think about. Small nerf to make it more of an actual decision. Repair research requires a decision, but still much lower than 2.3b9*
* Research:
  * Armor upgrade:
    * Cost `800 -> 1000` (+25%)
  * Repair:
    * Cost `200 -> 350` (+75%)
    * Time `20 -> 25` (+25%)

---

#### Probes
> *Part of wider nerfs to vision overall.*
* Cost: `100 -> 150` (+50%)
* Vision:
  * Vision range: `5000 -> 4000` (-20%)
  * Primary sensors range: `12000 -> 10500` (-13%)
  * Secondary sensors range: `12000 -> 10500` (-13%)

---

#### Proximity Sensors
> *Reverting research to its 2.3b9 state. Cost and build time part of wider nerfs to vision overall.*
* Research:
  * Unit unlock:
	  * Cost: `600 -> 500` (-18%)
    * Time: `45 -> 35` (-22%)
* Cost: `150 -> 250` (+67%)
* Build time: `15 -> 20` (+33%)

---

#### Sensor Distortion Probes
> *A planned buff in the Competitors Patch, part of wider buffs to anti-vision tech, and nerfs to vision overall. Vision nerfs to the unit itself are, in fact, part of this too.*
* Research:
  * Unit unlock:
    * Cost: `600 -> 500` (-18%)
* Vision:
  * Vision range: `5000 -> 4000` (-20%)
  * Primary sensors range: `16000 -> 14000` (-13%)
  * Secondary sensors range: `16000 -> 14000` (-13%)

---

#### Advanced Research Modules
> *Part of general timing resets for Hiigaran.*
* Build time: `140 -> 150` (+7.1%)

---

#### Fire Control Towers
> *Now effects the host ship as well as surrounding ships.*

---

#### Anti-Cloaking Sensors Modules
> *Further nerfed.*
* Cost: `375 -> 500` (+33%)

---

### Vaygr

> *Like the Hiigarans, Vaygr have experienced a number of reversions compared to their Competitors Patch state. This is because several changes to the race were counterbalancing other, prior changes. Instead of that, we've cleaned the slate somewhat. With that said, Vaygr have kept many of their more interesting changes over from the Competitors Patch.*

---

#### Scouts
> *Scouts should not be able to cut through dust clouds. There are units dedicated to this role (probes, proxies).*
* Vision:
  * Vision range: `4000 -> 1500` (-63%)

---

#### Assault Craft
> *Rolled back to 2.3b9 levels.*
* Weapons:
  * Flechette cannon:
    * Damage Multipliers:
	    * vs HW1 Fighters: `0.6 -> 0.57` (-5%)
      * vs Resourcing: `0.5 -> 0.33` (-34%)
      * vs Subsystems: `1 -> 1.4` (+40%)
    * Accuracy Multipliers:
      * vs HW1 Fighters: `1 -> 0.93` (-7%)
      * vs Resourcing: `1 -> 0.8` (-20%)

---

#### Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love. Updated the Basic Bomb Launcher to match the Upgraded Bomb Launcher vs everything other than subsystems.*
* Speed: `279 -> 300` (+7.3%)
* Weapons:
	* All bombs now have same projectile speed: `1200 -> 1800` (+50%)
  * Basic Bomb Launcher:
    * Damage Multipliers:
      * vs HW2 Corvettes: `1 -> 0.7` (-30%)
      * vs HW1 Corvettes: `1.15 -> 0.8` (-30%)
      * vs Frigates: `1.05 -> 1.1` (+5%)
      * vs Resourcing: `0.2 -> 0.17` (-15%)
    * Accuracy Multipliers:
      * vs HW2 Corvettes: `0.8 -> 0.2` (-75%)
      * vs HW1 Corvettes: `0.9 -> 0.225` (-75%)

---

#### Lance Fighters
> *Overperforming somewhat against vettes since some overzealous Competitors Patch changes. Maybe overperforming lot actually. Toning these back down so they don't melt entire squads in a single sweep. Speed to match bombers.*
* Speed: `314 -> 300` (-4%)
* Weapons:
  * Lance beam:
    * Damage Multipliers:
      * vs Subsystems: `0.5 -> 1.0` (+50%)
    * Damage Multipliers:
      * vs HW2 Corvettes: `1 -> 0.605` (-40%)
      * vs HW1 Corvettes: `1.45 -> 1.21` (-17%)

---

#### Corvettes
> *Reverting the normalisation between base and upgraded armor for now. This change needs to be more universal if attempted again. A reversion to 2.3b9 state.*
* Research:
  * Armor upgrade:
    * Multiplier: `1.35 -> 1.5` (+11%)

---

#### Corvette Facilities
> *Another case of buffs to offset other nerfs. With other reversions, this can go back to its old state.*
* Cost: `850 -> 725` (-15%)
* Build time: `65 -> 60` (-8%)

---

#### Missile Corvettes
> *Reversions to offset the change to the armor upgrade.*
* Armor: `510 -> 480` (-6%)
* Weapons:
  * Missiles:
    * Damage Multipliers:
      * vs Frigates: `0.42 -> 0.6` (+43%)

---

#### Laser Corvettes
> *Currently beating out the other options Vaygr have in their role - reverting some changes.*
* Research:
  * Unit unlock:
    * Time: `45 -> 60` (33%)
* Cost: `625 -> 650` (+4%)
* Armour: `510 -> 480` (-6%)
* Weapons:
  * Laser:
    * Damage Multipliers:
      * vs Capitals: `0.587 -> 0.51` (-13%)

---

#### Command Corvettes
> *Reverted research to 2.3b9 state. The best fire control in the game for 400ru is quite crazy. Bringing the cost of this unit more in-line with its value.*
* Research:
  * Unit unlock:
    * Time: `45 -> 60` (+33%)
* Cost: `400 -> 600` (+50%)

---

#### Assault Frigates
> *Some reversions, standardized frigate armor with heavy missile frigates.*
* Research:
  * Unit unlock:
    * Cost: `550 -> 650` (+18%)
    * Time: `35 -> 45` (+29%)
* Armor: `17500 -> 18500` (+3%)
* Weapons:
  * Flechette cannon:
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.85 -> 0.72` (-15%)
      * vs all Corvettes: `0.35 -> 0.14` (-60%)

---

#### Heavy Missile Frigates
> *Heavy missiles being rolled back.*
* Research:
  * Unit unlock:
    * Cost: `1600 -> 1800` (+13%)
    * Time: `110 -> 120` (+9%)
* Build time: `50 -> 45` (-10%)
* Armor: `18000 -> 18500` (+3%)

---

#### Infiltrator Frigates
> *Some reversions. Base armor to match marine frigates, however upgrades make this unit even better.*
* Research:
  * Unit unlock:
    * Cost: `800 -> 1000` (+25%)
    * Time: `50 -> 60` (+20%)
* Speed: `240 -> 230` (-4%)
* Armour: `21000 -> 22000` (+5%)

---

#### Flagships
> *Minmaxing production time upgrades. Overperforming vs HW1 fighters.*
* Research:
  * Production time upgrade:
    * Cost: `1750 -> 1000` (-43%)
* Weapons:
  * Hull guns:
    * Damage Multipliers:
      * vs all Fighters: `3 -> 2.25` (-25%)
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Carriers
> *Minmaxing the cost of production speed upgrades. Overperforming vs HW1 fighters.*
* Research:
  * Production speed upgrade:
    * Cost: `2250 -> 2500` (+11%)
* Weapons:
  * Hull guns:
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Shipyards
> *See the entry on the Flagship.*
* Research:
  * Production time upgrade:
    * Cost: `1750 -> 1000` (-43%)
* Weapons:
  * Hull guns:
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Destroyers
> *Destroyers overall had their damage cut against resourcing. This has made them extremely linear in their gameplan as they are hard pressed to inflict logistical damage without significant numbers. Reverting this. For some reason Vaygr destroyers had their damage against swarm was essentially removed - Vaygr destroyers have historically always been able to dent strike clouds at least a little. Revert.*
* Weapons:
  * Fusion Missiles:
    * Damage Multipliers::
      * vs Resourcing: `0.1 -> 0.2` (+100%)
  * Flachette Cannons:
    * Damage Multipliers:
      * vs all Fighters: `0.005 -> 0.01` (+100%)
      * vs all Corvettes:: `0.005 -> 0.01` (+100%)

---

#### Battlecruisers
> *Reverting a Competitors Patch change. Cruisers were very fragile, however a flat buff would be a step back with this unit. BC range was reduced by 10% in the Competitors Patch, we've changed this to be a flat 500 range nerf now. This is because a % nerf was interacting in unexpected ways in cruiser duels due to various factors such as turret placements and the fact that not all cruiser weapons have the same range. Being on the nose of the ship, the trinity cannon now has 50 more effective range than all other cruiser weapons. With precise micro, vaygr can slightly out-range other cruisers and win. Firing arc increased so it doesn't have to line up so precisely with its targets.*
* Armor: `160000 -> 192000` (+18%)
* Speed: `87 -> 79` (-11%)
* Weapons:
  * Trinity Cannon:
    * Range: `4995 -> 5050` (+1%)
    * Firing arc `6 -> 12` (+50%)
  * Fusion Missiles:
    * Range: `5400 -> 5500` (+2%)

---

#### Platform Control Modules
> *Just a tad too cheap, revert.*
* Cost: `600 -> 625` (+4%)

---

#### Platforms
> *Some reversions.*
* Research:
  * Armor upgrade:
    * Cost: `1300 -> 1600` (+23%)
    * Time: `135 -> 140` (+4%)

---

#### Gun Platforms
> *Some reversions*
* Weapons:
  * Kinetic turret:
    * Damage: `60 -> 40` (-33%)
    * Projectile speed: `2300 -> 2200` (-4%)

---

#### Hyperspace Gate Platforms
> *Some reversions. Normalised the speed boys (probes) to 600 movespeed. Gates want to maintain this speed too. Gates themselves now a little more survivable so you can actually use them once before they get popped. This unit now also has its own distortion field, and can now hyperspace into position.*
* Cost: `325 -> 375` (+15%)
* Build time: `20 -> 25` (+25%)
* Armor: `18500 -> 25900` (+40%)
* Speed: `800 -> 600` (-25%)
* Vision:
  * Secondary sensors range: `4000 -> 5000` (+25%)
* Can now hyperspace jump
* All probes can now travel through hyperspace gates, but can not move again after they exit the hyperspace gate.

---

#### Resource Collectors
> *Repair research requires a decision, but still much lower than 2.3b9*
* Research:
  * Repair:
    * Cost `200 -> 250` (+25%)

---

#### Probes
> *Part of wider nerfs to vision overall.*
* Cost: `100 -> 150` (+50%)
* Vision:
  * Vision range: `5000 -> 4000` (-20%)
  * Primary sensors range: `12000 -> 10500` (-13%)
  * Secondary sensors range: `12000 -> 10500` (-13%)

---

#### Proximity Sensors
> *Reverting research to its 2.3b9 state. Cost and build time part of wider nerfs to vision overall.*
* Research:
  * Unit unlock:
	  * Cost: `600 -> 500` (-18%)
    * Time: `45 -> 40` (-11%)
* Cost: `150 -> 250` (+67%)
* Build time: `15 -> 20` (+33%)

---

#### Sensor Distortion Probes
> *Part of wider nerfs to vision overall.*
* Research:
  * Unit unlock:
    * Time: `50 -> 60` (+20%)
* Vision:
  * Vision range: `5000 -> 4000` (-20%)
  * Primary sensors range: `16000 -> 14000` (-13%)
  * Secondary sensors range: `16000 -> 14000` (-13%)

---

#### Fire Control Towers
> *Now effects the host ship as well as surrounding ships.*

---

#### Hyperspace Sensors
> *Reversion here.*
* Cost: `750 -> 500` (-33%)

---

### Kushan and Taiidan

> *Many aspects of the HW1 races have been reverted. However, there are included here some new changes, as well as a couple of bugfixes. Finally, some tech is now actually viable, through tweaks to research for hw1 ships overall.*

---

#### Scouts
> *This was an extreme price for scouts to be placed at. Chipping away at this units escape factor.*
* Cost: `150 -> 90` (-40%)
* Build time: `10 -> 8` (-20%)
* Speed: `465 -> 460` (-1%)
* Vision:
  * Vision range: `3000 -> 1500` (-50%)
  * Secondary sensors range: `7500 -> 7000` (-7%)

---

#### Interceptors
> *This unit went on quite a wild ride in the Competitors Patch. We've restored much of it back to its 2.3b9 state and will keep an eye on it moving forwards. Research costs reduced and damage multipliers vs corvettes half way between 2.3b9 and the Competitors Patch.*
* Fighter Drive:
  * Cost: `250 -> 200` (-20%)
  * Time: `25 -> 20` (-20%)
* Fighter Chassis (ints + bombers):
  * Cost: `650 -> 300` (-54%)
* Build time: `8 -> 9` (+13%)
* Armor: `100 -> 90` (-10%)
* Weapons:
  * Kinetic guns:
    * Damage Multipliers:
      * vs HW2 Corvettes: `0.36 -> 0.33` (-8%)
      * vs HW1 Corvettes: `0.72 -> 0.66` (-8%)
      * vs Resourcing: `0.6 -> 0.5` (-17%)
      * vs Subsystems: `1 -> 1.4` (+40%)
    * Accuracy Multipliers:
      * vs Resourcing: `1 -> 0.8` (-20%)

---

#### Defenders
> *This unit's combat performance was significantly improved with the Competitors Patch. As such, the infamous hyper-defender all-in is now quite crushing. Small tone back on this aspect of the unit.*
* Research:
  * Unit unlock:
    * Cost: `650 -> 800` (+23%)
* Weapons:
  * Guns:
    * Damage Multipliers:
      * vs HW2 Fighters: `1.0 -> 0.5` (-50%)
      * vs HW1 Fighters: `1.2 -> 0.6` (-50%)

---

#### Attack Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love and have received a movement speed increase.*
* Speed: `390 -> 420` (+8%)
* Weapons:
  * Bomb launcher:
    * Damage Multipliers:
      * vs Subsystems: `2.3 -> 2` (-13%)
    * Accuracy Multipliers:
      * vs Frigates: `0.8 -> 0.6` (-25%)

---

#### Kushan Cloaked Fighters
> *Reverted cost, build time increased some but still significantly faster than 2.3b9.*
* Cost: `120 -> 130` (+8%)
* Build time: `10 -> 12` (+20%)
* Kushan Cloaked fighters can now repair themselves when idle and not taking damage.

---

#### Taiidan Defense Fighters
> *Buff to match Kushan Cloaked Fighters.*
* Build time: `15 -> 12` (-20%)

---

#### Light Corvettes
> *Unlocking the base corvette is now cheaper - corvettes should be a totally viable opening for HW1 and not simply a countertech. Vettes higher in the tree have had this cost reduction spread amongst them instead.*
* Research:
  * Unit unlock:
    * Cost: `1500 -> 1000` (-33%)

---

#### Salvage Corvettes
> *Corvettes higher in the tree are taking up the slack of a cheaper light corvette research.*
* Research:
  * Unit unlock:
    * Cost: `500 -> 700` (+40%)
    * Time: `30 -> 60` (+100%)

---

#### Heavy Corvettes
> *Restoring this unit's armor, res, and damage as part of general reversions from the Competitors Patch.*
* Research:
  * Unit unlock:
    * Cost: `800 -> 400` (-50%)
    * Time: `50 -> 30` (-40%)
* Armor: `1600 -> 1700` (+6%)
* Weapons:
  * Kinetic guns:
    * Damage Multipliers
      * vs HW2 Corvettes: `0.7 -> 0.5` (-29%)

---

#### Multi-Gun Corvettes
> *Some reversions here - this unit was overengineered somewhat during the Competitors Patch. Many of its needed changes have been preserved however.  Weapon effectiveness is half way between 2.3b9 and the Competitors Patch.*
* Research:
  * Unit unlock:
    * Cost: `800 -> 500` (-38%)
    * Time: `50 -> 40` (-20%)
* Armor: `1300 -> 1400` (+8%)
* Weapons:
  * Guns:
    * Damage: `12 -> 9` (-25%)
    * Range: `2000 -> 1600` (-20%)
    * Damage Multipliers:
      * vs HW2 Fighters: `0.8 -> 0.88` (+10%)
      * vs HW1 Fighters: `1.2 -> 1.21` (+1%)
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.85 -> 0.75` (+12%)

---

#### Minelayer Corvettes
> *Restoring this unit to its 2.3b9 state. Mines have been hurt for a long time after a breif hysteria in the early days in the Competitors Patch. Since the lifetime of mines themselves has long since been reduced, the unit itself can go back to its original state. Unit cost will still be a tad higher than 2.3b9 to balance vs HW2 minelayer costs.*
* Research:
  * Unit unlock:
    * Cost: `1500 -> 1200` (-20%)
* Cost: `375 -> 325` (-13%)
* Build time: `30 -> 35` (+17%)
* Speed: `280 -> 255` (-9%)

---

#### Support Frigates
> *Some reversions. Base healing reverted, but frigate-specific healing staying high.*
* Research:
  * Unit unlock:
    * Cost: `800 -> 1000` (+25%)
    * Time: `60 -> 75` (+25%)
* Cost: `700 -> 600` (-14%)
* Build time: `60 -> 65` (+8%)
* Weapons:
  * Heal beam:
    * Base damage: `-20.7 -> -14.17` (-32%)
    * Damage multipliers
      * vs Frigates: `1.5 -> 2.0` (+33%)

---

#### Assault Frigates
> *Projectile speed was way out of hand. Toning this back - they still land their shots just fine.*
* Research:
  * Unit unlock:
    * Cost: `1500 -> 1200` (-20%)
* Weapons:
  * Kinetic cannons:
	* Projectile speed: `3000 -> 1500` (-50%)
    * Accuracy Multipliers:
      * vs all Fighters: `0.72 -> 0.9` (+25%)
  * Assault bombs:
    * Projectile speed: `3500 -> 1750` (-50%)

---

#### Ion Cannon Frigates
> *Some revisions and a research cost buff. This unit has issues with aligning to its targets. Upping their attack cone should improve the QOL for this unit, and hopefully help them compete with heavy missiles in a more organic way.*
* Research:
  * Unit unlock:
    * Cost: `2000 -> 1700` (-15%)
    * Time: `135 -> 120` (-11%)
* Cost: `750 -> 800` (+7%)
* Weapons:
  * Ion Cannon:
    * Firing arc: `6 -> 12` (+100%)

---

#### Kushan Drone Frigates
> *Some reversions, speed down a tad so they aren't outpacing everything else. Drones themselves now move quickly. This unit has had a massive overhaul on its drone AI - you'll notice drones no longer keep a clean sphere if the frigate is moving while attacking but instead will clump a little. This is still a bit of a work in progress, but drones will now actually fire correctly and can move while shooting. Please try them out!*
* Research:
  * Unit unlock:
    * Cost: `1000 -> 1100` (+10%)
    * Time: `60 -> 80` (+33%)
* Cost: `700 -> 900` (+29%)
* Build time: `50 -> 70` (+40%)
* Speed: `230 -> 206` (-10%)

---

#### Kushan Drones
> *Drones (from the frigate) now have totally reworked AI. Prior to this, they had their attack orders interrupted every script call (every `1.15s`) by a parade command which caused them to totally stop what they were doing. This was causing huge drops in their DPS and reliability to fire correctly. This was even worse for a moving drone frigate. Their behavior has been completely revamped and they now act more like corvettes with orders to stick very close to the frigate - the sphere will only be kept if the frigate is out of combat.*
* Speed: `210 -> 250` (+19%)
* Weapons:
  * Kinetic gun:
	  * Base damage: `15 -> 50` (+333%)
	  * Projectile speed: `1700 -> 2100` (+24%)
    * Delay between shots: `0.3 -> 1.0` (+333%)
    * Damage Multipliers:
      * vs all Fighters: `1 -> 0.15` (-85%)
      * vs all Corvettes: `0.4 -> 0.07` (-83%)
      * vs Frigates: `0.7 -> 0.2` (-71%)
      * vs Capitals: `0.88 -> 0.25` (-72%)
      * vs Platforms: `1 -> 0.2` (-80%)
      * vs Resourcing: `0.47 -> 0.25` (-47%)
    * Accuracy Multipliers:
      * vs all Fighters: `1 -> 0.9` (-10%)
      * vs Frigates: `0.55 -> 0.9` (+64%)
      * vs Capitals: `0.55 -> 0.9` (+64%)

---

#### Motherships
> *Overperforming vs HW1 fighters.*
* Weapons:
  * Hull guns:
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Carriers
> *With assault tech cheaper, the costs are being somewhat reassigned here. Overperforming vs HW1 fighters.*
* Research:
  * Unit unlock:
    * Cost: `1000 -> 1500` (+50%)
* Weapons:
  * Hull guns:
    * Damage Multipliers:
      * vs all Fighters: `3.75 -> 3.0` (-20%)
    * Accuracy Multipliers:
      * vs HW1 Fighters: `0.34 -> 0.17` (-58%)

---

#### Missile Destroyers
> *Some reversions to the 2.3b9 state. Unfortunately, units in remastered will always hover at the range of their highest ranged weapon. For the Competitors Patch MDDs, this meant they were hovering at the massive range of their special burst attack, and often didn't enter into range to start firing normally. These weapons now have the same range.*
* Research:
  * Unit unlock:
    * Cost: `3000 -> 3500` (+17%)
    * Time: `100 -> 120` (+20%)
* Armor: `75000 -> 106000` (+41%)
* Weapons:
  * Regular missiles:
	  * Range: `3750 -> 4000` (+7%)
    * Damage Multipliers:
      * vs all Fighters: `0.3 -> 0.576` (+92%)
  * Missile volley:
    * Range: `5500 -> 4000` (-27%)
    * Damage Multipliers:
      * vs all Fighters: `0.75 -> 0.72` (-4%)
      * vs Capitals: `3 -> 2` (-33%)

---

#### Destroyers
> *HW1 capitals do not require upgrades. Even after HW2 upgrades, HW1 capitals have the unique advantage of support units. All considered, a small price increase to offset these advantages is apt. All destroyers are regaining some potency against resourcing.*
* Cost: `2000 -> 2250` (+13%)
* Weapons:
  * Heavy kinetic cannons:
  	* Damage Multipliers:
      * vs all Corvettes: `0.6 -> 0.5` (-17%)
	    * vs Resourcing: `0.225 -> 0.45` (+100%)
  * Heavy ion turrets:
	  * Damage Multipliers:
	    * vs Resourcing:: `0.1 -> 0.2` (+100%)

---

#### Heavy Cruisers
> *The weapon range is now going down by a flat amount (see entries for HW2 cruisers) instead of a % amount as per the Competitors Patch. The extra cost is to offset the lack of required upgrades.*
* Research:
  * Unit unlock:
    * Cost: `6000 -> 7000` (+17%)
* Cost: `4000 -> 4500` (+13%)
* Armor: `200000 -> 240000` (+20%)
* Speed: `120 -> 115` (-4%)
* Weapons:
  * Heavy kinetic cannons:
  	* Range: `4950 -> 5050` (+2%)
  * Heavy ion turrets:
    * Range: `4770 -> 4800` (+1%)
* No longer take damage when hitting an inhibitor

---

#### Resource Collectors
> *Due to their larger profile and slower movement speed, these guys absorb a significantly higher amount of incoming fire compared to their HW2 counterparts. As such, to provide similar survivability, they need a little extra bulk.*
* Armor: `4000 -> 5000` (+25%)

---

#### Probes
> *Part of wider nerfs to vision overall.*
* Cost: `100 -> 150` (+50%)
* Vision:
  * Vision range: `5000 -> 4000` (-20%)
  * Primary sensors range: `12000 -> 10500` (-13%)
  * Secondary sensors range: `12000 -> 10500` (-13%)

---

#### Proximity Sensors
> *Aligning with HW2 changes.*
* Research:
  * Unit unlock:
    * Cost: `600 -> 500` (-17%)
    * Time: `45 -> 40` (-11%)
* Cost: `150 -> 250` (+67%)
* Build time: `15 -> 20` (+33%)
* Can now guard ships.

---

#### Sensors Arrays
> *In multiplayer this unit doesn't provide total map vision like it did in classic - instead, its much more akin to HW2 advanced sensor arrays. The only difference here is that its mobile. This unit is currently unused in multiplayer as it's quite pricey and very fragile, while being slow as molasses. Easing the cost to field this unit will hopefully help.*
* Research:
  * Unit unlock:
    * Time: `60 -> 50` (-17%)
* Cost: `700 -> 500` (-29%)
* Build time: `70 -> 50` (-29%)

---

#### Cloak Generators
> *Having fields on ships instead of modules is neither better or worse, its a mixed bag. With that said, HW1 cloaks have historically been much more difficult to field compared to their HW2 counterparts. Small buff here.*
* Cost: `800 -> 600` (-25%)
