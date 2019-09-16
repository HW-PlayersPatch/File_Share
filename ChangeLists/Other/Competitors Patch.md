# Competitors Patch to Players Patch Change List | August 31, 2019
> The Competitors Patch is no longer being updated, and has been folded back into / included in the Players Patch. Dual Command mode, balance improvements, bug fixes, etc have all been included and further refined. This change list covers the changes from the old Competitors Patch Build 11.1 to the new Players Patch Build 10.

### All Races

> *Some interesting changes affecting multiple races this time.*

---

#### Fire Control Towers (HW2)
* **Now effect the host ship as well as surrounding ships**

---

#### Scuttle radius (HW2)
> *Scuttling motherships is insanely difficult to react to, and effects different races in very different ways. This is a creative strategy and should definitely still be achievable, however opponents should have the ability to respond within a reasonable time window rather than half a second.*
* **Radius:**
  * **Max damage radius:** `1075 => 800` (-25.6%)
  * **Min damage radius:** `1612 => 1200` (-25.6%)

---

#### Ion Frigates
> *These units have many issues with tracking its targets. Due to problems with the rm engine, sometimes they can get stuck in a misaligned position too. Upping their attack cone should improve the QOL for this unit, and hopefully help them compete with heavy missiles in a more organic way.*
* **Firing arc:** `6 => 12` (+100%)

---

#### 'Normal' unit caps
> *Destroyer balls can be absolutely impossible to stop without cruisers. Six destroyers is just too much of a snowball factor. Toning this back to its 2.1 state.*
* **Destroyers:** `6 => 5` (-16.7%)

---


#### 'High' unit caps
> *A tad too heavy on capitals.*
* **Destroyers:** `9 => 7` (-22.2%)
* **Missile Destroyers:** `4 => 3` (-25%%)
* **Heavy Cruisers:** `4 => 3` (-25%)

---

#### 'Huge' unit caps
> *Same story.*
* **Destroyers:** `14 => 11` (-21.4%)



### Hiigaran

> *Hiigaran have had a few of their units reverted to their old stats as they were in 2.3b9, and for the early stages of 2.4. This is primarily to provide a clearer slate to balance off heading forwards - many buffs and nerfs were only in place to offset **previous** buffs and nerfs. Instead, we've just reverted a few steps back.*

---

#### Scouts
> *Chipping away at this units escape factor. Keeping in mind that ints move with `488` speed when upgraded. Some reversions to EMP changes - EMP now stuns vettes in two hits and frigates in five - planning to make further changes. Finally, scouts should not be able to cut through dust clouds. There are units dedicated to this role (probes, proxies).*
* **Speed:** `485 => 480`
* **Weapons:**
  * **EMP:**
    * **Base damage down:** `50 => 20` (-40%)
    * **Range down:** `3000 => 1500` (-50%)
    * **Accuracy multipliers:**
      * **vs Corvettes:** `0.15 => 1` (+566%)
* **Vision:**
  * **Vision range:** `4000 => 1500` (-62.5%)

---

#### Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love.*
* **Speed:** `279 => 300` (+7.3%)
* **Weapons:**
	* **All bombs now have same projectile speed:** `1200 => 1800` (+50%)

---

#### Corvette Facilities
> *Carriers were building these 5s faster than motherships. Oops.*
* **Build time (carriers):** `55 => 60` (+10%)

---

#### Gunships
> *Gunship-core unit comps more viable.*
* **Research:**
  * **HP upgrade:**
    * **Cost:** `650 => 600` (-7.7%)

---

#### Pulsar Corvettes
> *Some reversions here - prior changes were not properly tested and have affected pulsars in unexpected ways.*
* **Weapons:**
  * **Up/down max angle of canon down.**
  * **Damage Multipliers:**
	  * **vs HW2 Fighters:** `0.19 => 0.24` (+23.3%)
	  * **vs HW1 Fighters:** `0.2 => 0.25` (+25%)

---

#### Minelayer Corvettes
> *The lifetime of mines is significantly down since vanilla.*
* **HP:** `900 => 1500` (+50%)
* **Speed:** `233 => 291` (+22%)

---

#### Defense Field Frigates
> *Small reversion, field frigates are outpacing normal combat frigates.*
* **Speed**: `250 => 220` (-30%)

---

#### Torpedo Frigates
> *A nerf which was put in place after various other nerfs to corvettes. In practice, had very little effect as the damage load of a torpedo is so high that the weapon needs very strong nerfs to make a difference. Various corvettes have their old HP values, so this is also going back.*
* **Weapons:**
  * **Cluster torpedo:**
	* **Damage multipliers:**
		* **vs HW1 Corvettes:** `0.4 => 0.8` (+100%)

---

#### Flak Frigates
> *A planned buff in 2.4, finally implemented here. Flaks are fairly niche compared to other anti-fighter options.*
* **Research:**
  * **HP upgrade:**
    * **Cost:** `1000 => 600` (-40%)
	* **Time:** `75 => 40` (-60%)
  * **Speed upgrade:**
    * **Cost:** `600 => 400` (-18.1%)
* **Build time:** `50 => 45` (-10%)

---

#### Destroyers
> *Total reversion of this unit. Many of the later buffs were implemented to offset early nerfs. This has made a mess of the unit overall. Destroyers overall had their damage cut against resourcing. This has made them extremely linear in their gameplan as they are hard pressed to inflict logistical damage without significant numbers. Reverting this.*
* **Research:**
  * **Unit unlock:**
    * **Time:** `100 => 90` (-10%)
* **Weapons:**
  * **Torpedoes:**
    * **Damage multipliers:**
      * **vs Resourcing:** `0.3 => 0.6` (+100%)

---

#### Battlecruisers
> *Reverting a 2.4 change. Cruisers were very fragile, however a flat buff would be a step back with this unit. BC range was reduced by 10% in 2.4, we've changed this to be a flat 500 range nerf now. This is because a % nerf was interacting in unexpected ways in cruiser duels due to various factors such as turret placements and the fact that not all cruiser weapons have the same range. Since cruiser are so large, the tricannon needs less range that the Hiigaran ions for example in order to engage in combat.*
* **Research:**
  * **Unit unlock:**
    * **Time:** `150 => 140` (-6.9%)
  * **HP upgrade:**
    * **Cost:** `2000 => 1500` (-25%)
  * **Speed upgrade:** `900 => 600` (-33%)
* **HP:** `160000 => 192000` (+18%)
* **Speed:** `87 => 79` (-10.9%)
* **Weapons:**
  * **Main ions**
    * **Range:** `5400 => 5500` (+1.9%)

---

#### Mothership
> *Part of rollbacks to 2.3 stats.*
* **Research:**
  * **HP upgrade:**
    * **Time:** `45 => 30` (-33%)
  * **Production speed upgrade:**
    * **Cost:** `1500 => 1000` (-33%)
* **Weapons:**
  * **Damage multipliers:**
	* **vs Fighters:** `3 => 1.8` (-40%)
* **Hyperspace animation time up:** `6 => 9.5` (+58%)

---

#### Shipyards
> *Same idea behind a similar change the Mothership.*
* **Research:**
  * **Production speed upgrade:**
	* **Cost:** `1750 => 1000` (-54.5%)
    * **Time:** `60 => 40` (-33%)

---

#### Resource Collectors
> *This tech is such a defensive freebie it hurts to think about. Small nerf to make it more of an actual decision.*
* **Research:**
  * **HP upgrade:** `800 => 1000` (+25%)

---

#### Mobile Refineries
> *Go backstab these guys.*
* **HP:** `18000 => 16000` (-11.8%)

---

#### Probes
> *Part of wider nerfs to vision overall.*
* **Cost:** `100 => 120` (+20%)
* **Vision:**
  * **Vision range:** `5000 => 4000` (-20%)
  * **Primary sensors range:** `12000 => 10000` (-18.1%)
  * **Secondary sensors range:** `12000 => 10000` (-18.1%)

---

#### Proximity Sensors
> *Reverting this to its 2.3 state.*
* **Research:**
  * **Unit unlock:**
	* **Cost:** `600 => 500` (-18.1%)
* **Build time:** `15 => 20` (+33%)

---

#### Sensor Distortion Probes
> *A planned buff in 2.4, part of wider buffs to anti-vision tech, and nerfs to vision overall. Vision nerfs to the unit itself are, in fact, part of this too.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `600 => 500` (-18.1%)
    * **Time:** `30 => 25` (-16%)
* **Cost:** `600 => 500` (-18.18%)
* **Build speed:** `30 => 25` (-18.1%)
* **Vision:**
  * **Vision range:** `5000 => 4000` (-20%)
  * **Primary sensors range:** `16000 => 14000` (-12.5%)
  * **Secondary sensors range:** `16000 => 14000` (-12.5%)

---

#### Advanced Research Modules
> *Part of general timing resets for Hiigaran.*
* **Build time:** `140 => 150` (+7.1%)



### Vaygr

> *Like the Hiigarans, Vaygr have experienced a number of reversions compared to their 2.4 state. This is because several changes to the race were counterbalancing other, prior changes. Instead of that, we've cleaned the slate somewhat. With that said, Vaygr have kept many of their more interesting changes over from 2.4.*

---

#### Scouts
> *Scouts should not be able to cut through dust clouds. There are units dedicated to this role (probes, proxies).*
* **Vision:**
  * **Vision range:** `4000 => 1500` (-62.5%)

---

#### Lance Fighters
> *Overperforming somewhat against vettes since some overzealous 2.4 changes. Maybe overperforming lot actually. Toning these back down so they don't melt entire squads in a single sweep.*
* **Weapons:**
  * **Lance Beam:**
    * **Damage Multipliers::**
      * **vs HW2 Corvettes:** `1.0 => 0.65` (-35%)
      * **vs HW1 Corvettes:** `1.45 => 1.25` (-13.8%)

---

#### Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love.*
* **Speed:** `279 => 300` (+7.3%)
* **Weapons:**
	* **All bombs now have same projectile speed:** `1200 => 1800` (+50%)

---

#### CORVETTES
> *Reverting the normalisation between base and upgraded HP for now. This change needs to be more universal if attempted again. A reversion to 2.3 state.*
* **Research:**
  * **HP upgrade:**
    * **Multiplier:** `1.35 => 1.5` (+11.1%)

---

#### Corvette Facilities
> *Another case of buffs to offset other nerfs. With other reversions, this can go back to its old state.*
* **Cost:** `850 => 725` (-14.7%)
* **Time:** `65 => 60` (-7.7%)

---

#### Missile Corvettes
> *Reversions to offset the change to the HP upgrade.*
* **HP:** `510 => 480` (-5.9%)
* **Weapons:**
  * **Missiles:**
    * **Damage Multipliers::**
      * **vs Frigates:** `0.42 => 0.6` (+42.9%)

---

#### Laser Corvettes
> *Overperforming a little. Currently beating out the other options Vaygr have in their role - reverting this research.*
* **Research:**
  * **Unit unlock:**
    * **Time:** `45 => 60` (33.33%)

---

#### Command Corvettes
> *The best fire control in the game for 400ru is quite crazy. Bringing the cost of this unit more in-line with its value, but also adding some needed survivability to the unit.*
* **Cost:** `400 => 750` (+55.6%)
* **HP:** `900 => 1000` (+11.1%)

---

#### Minelayer Corvettes
> *A little more survibable, so they can actually do their job without dying to a single sweep of one lance squad, or a stray destroyer hit.*
* **HP:** `900 => 1000` (+11.1%)

---

#### Assault Frigates
> *Some reversions.*
* **HP:** `17500 => 18000` (+2.8%)

---

#### Heavy Missile Frigates
> *Heavy missiles being rolled back.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1600 => 1800` (+12.5%)
    * **Time:** `110 => 120` (+9.1%)

---

#### Carriers
> *Minmaxing the cost of production speed upgrades.*
* **Research:**
  * **Production speed upgrade:**
    * **Cost:** `2250 => 2500` (+11.1%)

---

#### Destroyers
> *Destroyers overall had their damage cut against resourcing. This has made them extremely linear in their gameplan as they are hard pressed to inflict logistical damage without significant numbers. Reverting this. For some reason Vaygr destroyers had their damage against swarm was essentially removed - Vaygr destroyers have historically always been able to dent strike clouds at least a little. Revert. Finally, Destroyers were a little undesirable compared to lasers or heavy missiles due to the cost of fielding them. Slight buff here.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `2000 => 1750` (-12.5%)
* **Weapons:**
  * **Fusion Missiles:**
    * **Damage Multipliers::**
      * **vs Resourcing:** `0.1 => 0.2` (+100%)
  * **Flachette Cannons:**
    * **Damage Multipliers:**
      * **vs all Fighters:** `0.005 => 0.01` (+100%)
      * **vs all Corvettes::** `0.005 => 0.01` (+100%)

---

#### Battlecruisers
> *Reverting a 2.4 change. Cruisers were very fragile, however a flat buff would be a step back with this unit. BC range was reduced by 10% in 2.4, we've changed this to be a flat 500 range nerf now. This is because a % nerf was interacting in unexpected ways in cruiser duels due to various factors such as turret placements and the fact that not all cruiser weapons have the same range. Since cruiser are so large, the tricannon needs less range that the Hiigaran ions for example in order to engage in combat.*
* **HP:** `160000 => 192000` (+18%)
* **Speed:** `87 => 79` (-10.9%)
* **Weapons:**
  * **Trinity Cannon:**
    * **Range:** `4995 => 5050` (+1.1%)
  * **Fusion Missiles:**
    * **Range:** `5400 => 5500` (+1.9%)

---

#### Flagship
> *Minmaxing production time upgrades.*
* **Research:**
  * **Production time upgrade:**
    * **Cost:** `1750 => 1000` (-42.9%)

---

#### Shipyards
> *See the entry on the Flagship.*
* **Research:**
  * **Production time upgrade:**
    * **Cost:** `1750 => 1000` (-42.9%)

---

#### Platform Facilities
> *Just a tad too free.*
* **Cost:** `600 => 625` (+4.2%)

---

#### Hyperspace Platforms
> *Normalised the speed boys (probes) to 600 movespeed. Gates want to maintain this speed too. Gates themselves now a little more survivable so you can actually use them once before they get popped. This unit now also has its own distortion field, and **can now hyperspace into position.***
* **Research:**
  * **Unit unlock:**
    * **Cost:** `750 => 500` (33.3%)
    * **Time:** `50 => 45` (-10%)
* **HP:** `18500 => 27750` (+50%)
* **Speed:** `800 => 600` (-25%)
* **HP Regen time:** `1200 => 600` (-50%)
* **Vision:**
  * **Vision range:** `1000 => 4000` (+300%)
  * **Primary sensors range:** `4000 => 7500` (+87.5%)
  * **Secondary sensors range:** `4000 => 7500` (+87.5%)
* **Can now hyperspace jump**

---

#### Mobile Refineries
> *Go backstab these guys.*
* **HP:** `18000 => 16000` (-11.8%)

---

#### Probes
> *Part of wider nerfs to vision overall.*
* **Cost:** `100 => 120` (+20%)
* **Vision:**
  * **Vision range:** `5000 => 4000` (-20%)
  * **Primary sensors range:** `12000 => 10000` (-18.1%)
  * **Secondary sensors range:** `12000 => 10000` (-18.1%)

---

#### Proximity Sensors
> *Reverting this to its 2.3 state.*
* **Research:**
  * **Unit unlock:**
	* **Cost:** `600 => 500` (-18.1%)
* **Build time:** `15 => 20` (+33%)

---

#### Sensor Distortion Probes
> *Part of wider nerfs to vision overall.*
* **Vision:**
  * **Vision range:** `5000 => 4000` (-20%)
  * **Primary sensors range:** `16000 => 14000` (-12.5%)
  * **Secondary sensors range:** `16000 => 14000` (-12.5%)

---

#### Hyperspace Sensors
> *Reversion here.*
* **Cost:** `750 => 500` (-33.3%)



### Kushan

> *Many aspects of the HW1 races have been reverted. However, there are included here some new changes, as well as a couple of bugfixes. Finally, some tech is now actually viable (although we're still working on cruisers), through tweaks to research for hw1 frigate+ ships overall.*

---

#### FIGHTERS
> *Reversions to 2.3 state.*
* **Fighter Drive:**
  * **Cost:** `250 => 200` (-20%)
  * **Time:** `25 => 20` (-20%)
* **Fighter Chassis (ints + bombers):**
  * **Cost:** `650 => 300` (-53.8%)

---

#### Scouts
> *This was an extreme price for scouts to be placed at. While we don't mind this unit being as costly as an interceptor, it shouldn't be significantly more.*
* **Cost:** `150 => 100` (-33%)
* **Speed:** `465 => 460` (-1.1%)
* **Vision:**
  * **Vision range:** `4000 => 1500` (-62.5%)

---

#### Interceptors
> *This unit went on quite a wild ride in 2.4. We've restored it back to its 2.3 state and will keep an eye on it moving forwards. Check out the entry for fighters overall for details on research changes.*
* **Build time:** `8 => 9` (+12.5%)
* **HP:** `100 => 90` (-10%)
* **Weapons:**
  * **Kinetic guns:**
    * **Damage Multipliers:**
      * **vs all Fighters:** `0.5 => 0.41` (-18%)
      * **vs HW2 Corvettes:** `0.8 => 0.4` (-50%)
      * **vs Frigates:** `1 => 0.5` (-50%)
      * **vs Capitals:** `1 => 0.5` (-50%)
      * **vs Platforms:** `0.7 => 0.5` (-28.6%)
    * **Accuracy Multipliers:**
      * **vs Resourcing:** `0.8 => 1` (+25%)

---

#### Attack Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love. With that said, HW1 bombers are infamous for being extremely obnoxious in earlygame int/bomber soup rushes, so a small HP reduction will allow early anti-fighter options to clear them a little easier.*
* **HP:** `135 => 125` (-7.4%)
* **Speed:** `390 => 420` (+7.7%)

---

#### Defenders
> *This unit's combat performance was significantly improved with 2.4. As such, the infamous hyper-defender all-in is now quite crushing. Small tone back on this aspect of the unit.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `650 => 800` (+23.1%)

---

#### Light Corvettes
> *Unlocking the base corvette is now cheaper - corvettes should be a totally viable opening for HW1 and not simply a countertech. Vettes higher in the tree have had this cost reduction spread amongst them instead.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1500 => 1000` (-33%)

---

#### Heavy Corvettes
> *Restoring this unit's HP, res, and damage as part of general reversions from 2.4.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `800 => 400` (-50%)
    * **Time:** `50 => 30` (-40%)
* **HP:** `1600 => 1700` (+6.25%)
* **Weapons:**
  * **Kinetic guns:**
    * **Damage Multipliers**
      * **vs HW2 Corvettes:** `0.7 => 0.6` (-14.2%)

---

#### Multigun Corvettes
> *Some reversions here - this unit was overengineered somewhat during 2.4. Many of its needed changes have been preserved however.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `800 => 500` (-37.5%)
    * **Time:** `50 => 40` (-20%)
* **HP:** `1300 => 1400` (+7.7%)
* **Weapons:**
  * **Kinetic guns:**
    * **No longer shoots at surrounding enemies beyond its assigned targets**

---

#### Salvage Corvettes
> *Corvettes higher in the tree are taking up the slack of a cheaper light corvette research.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `500 => 700` (+40%)
    * **Time:** `30 => 60` (+100%)
* **Can now kamikazi**

---

#### Minelayer Corvettes
> *Restoring this unit to its 2.3 state. Mines have been hurt for a long time after a breif hysteria in the early days on 2.4. Since the lifetime of mines themselves has long since been reduced, the unit itself can go back to its original state.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1500 => 1200` (-20%)
* **Cost:** `375 => 325` (-13.3%)
* **Build time:** `30 => 35` (+16.7%)

---

#### Support Frigates
> *Base healing reverted, but frigate-specific healing staying high.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `800 => 1000` (+25%)
    * **Time:** `60 => 75` (+25%)
* **Weapons:**
  * **Heal beam:**
    * **Base damage:** `-20.7 => -14.17` (-31.5%)
    * **Damage multipliers**
      * **vs Frigates:** `1.5 => 2.0` (+33%) // 2.4: `20.7 * 1.5 == 31`, 2.3: `14.17 * 2.0 = 28.3`

---

#### Assault Frigates
> *Projectile speed was way out of hand. Toning this back - they still land their shots just fine.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1500 => 1200` (-20%)
* **Weapons:**
  * **Kinetic cannons:**
	* **Projectile speed:** `3000 => 1800` (-40%)

---

#### Ion Cannon Frigates
> *General revisions. This unit is not stellar so far as anti-heavy frigates go, and was generally undesirable in 2.4.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `2000 => 1700` (-15%)
    * **Time:** `135 => 120` (-11.1%)

---

#### Kushan Drone Frigates
> *Speed down just a tad so they aren't outpacing everything else. Drones themselves now move very quickly. This unit has had a massive overhaul on its drone AI - you'll notice drones no longer keep a clean sphere if the frigate is moving while attacking but instead will clump a little. This is still a bit of a work in progress, but drones will now actually fire correctly and can move while shooting. Please try them out!*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1000 => 1100` (+10%)
    * **Time:** `60 => 80` (+33.3%)
* **Speed:** `230 => 222` (-3.5%)

---

#### Kushan Drones
> *Drones (from the frigate) now have totally reworked AI. Prior to this, they had their attack orders interrupted every script call (every `1.15s`) by a parade command which caused them to totally stop what they were doing. This was causing huge drops in their DPS and reliability to fire correctly. This was even worse for a moving drone frigate. Their behavior has been completely revamped and they now act more like corvettes with orders to stick very close to the frigate - the sphere will only be kept if the frigate is out of combat.*
* **Speed:** `210 => 350` (+66.7%)
* **Weapons:**
  * **Kinetic gun:**
	  * **Base damage:** `15 => 10` (-33%)
	  * **Projectile speed:** `1700 => 2500` (+47.1%)
	  * **Range:** `2660 => 3000` (+12.8%)
    * **Now checks line of fire**
    * **Delay between shots:** `0.3 => 0.2` (-33%%)
    * **Damage Multipliers:**
      * **vs HW2 Fighters:** `1 => 0.25` (-75%)
      * **vs HW1 Fighters:** `1 => 0.2` (-80%)
      * **vs all Corvettes:** `0.4 => 0.1` (-75%)
      * **vs Frigates:** `0.7 => 0.2` (-71.4%)
      * **vs Capitals:** `0.88 => 0.25` (-71.6%)
      * **vs Resourcing:** `0.47 => 0.3` (-36.2%)
    * **Accuracy Multipliers:**
      * **vs all Fighters:** `1 => 0.425` (-57.5%)
      * **vs HW2 Corvettes:** `0.75 => 0.5` (-33.3%)
      * **vs HW1 Corvettes:** `0.87 => 0.5` (-42.5%)
      * **vs Frigates:** `0.55 => 0.95` (+72.7%)
      * **vs Capitals:** `0.55 => 1` (+81.8%)

---

#### Carriers
> *With destroyer and assault tech cheaper, the costs are being somewhat reassigned here. Destoryers are still overall cheaper to reach however.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1000 => 1500` (+50%)

---

#### Destroyers
> *With a price reduction on their tech, expect to see HW1 fielding this unit once more. With that said, this unit is by no means underpowered when actually on the field. HW1 capitals do not require upgrades either. Even after HW2 upgrades, HW1 capitals have the unique advantage of support units. All considered, a small price increase to offset these advantages is apt. All destroyers are regaining some potency against resourcing.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `4000 => 3000` (-25%)
* **Cost:** `2000 => 2250` (+12.5%)
* **Weapons:**
  * **Heavy kinetic cannons:**
	* **Damage Multipliers:**
	  * **vs Resourcing:** `0.225 => 0.45` (+100%)
  * **Heavy ion turrets:**
	* **Damage Multipliers:**
	  * **vs Resourcing::** `0.1 => 0.2` (+100%)

---

#### Missile Destroyers
> *Unfortunately, units in remastered will always hover at the range of their highest ranged weapon. For 2.4 MDDs, this meant they were hovering at the massive range of their special burst attack, and often didn't enter into range to start firing normally. These weapons now have the same range, although this is a work in progress.*
* **Weapons:**
  * **Regular missiles:**
	* **Range:** `3750 => 4000` (+6.7%)
  * **Burst attack:**
    * **Range:** `5500 => 4000` (-27.3%)

---

#### Heavy Cruisers
> *HCs are a little too hard to field and are an ongoing project. The weapon range is now going down by a flat amount (see entries for HW2 cruisers) instead of a % amount as per 2.4. The price of their research is up to compensate for an equal reduction to destroyer tech. The extra cost is to offset the lack of required upgrades.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `6000 => 7000` (+16.67%)
* **Cost:** `4000 => 4500` (+12.5%)
* **HP:** `200000 => 240000` (+20%)
* **Speed:** `120 => 115` (-4.2%)
* **Weapons:**
  * **Heavy kinetic cannons:**
	* **Range:** `4950 => 5050` (+2%)
  * **Heavy ion turrets:**
    * **Range:** `4770 => 4800` (+0.6%)
* **No longer take damage when hitting an inhibitor**

---

#### Resource Collectors
> *Due to their larger profile and slower movement speed, these guys absorb a significantly higher amount of incoming fire compared to their HW2 counterparts. As such, to provide similar survivability, they need a little extra bulk.*
* **HP:** `4000 => 5000` (+25%)

---

#### Probes
> *Part of wider nerfs to vision overall.*
* **Cost:** `100 => 120` (+20%)
* **Vision:**
  * **Vision range:** `5000 => 4000` (-20%)
  * **Primary sensors range:** `12000 => 10000` (-18.1%)
  * **Secondary sensors range:** `12000 => 10000` (-18.1%)

---

#### Proximity Detectors
> *Aligning build time with HW2 changes.*
* **Build time:** `15 => 20` (+33%)

---

#### Sensors Arrays
> *This unit doesn't provide total map vision like it did in classic - instead, its much more akin to HW2 advanced sensor arrays. The only difference here is that its mobile. This unit is currently unused in multiplayer as it's quite pricey and very fragile, while being slow as molasses. Easing the cost to field this unit will hopefully help.*
* **Research:**
  * **Unit unlock:**
    * **Time:** `60 => 80` (+33.3%)
* **Cost:** `700 => 500` (-28.6%)
* **Build time:** `70 => 60` (-14.3%)

---

#### Cloak Generators
> *Having fields on ships instead of modules is neither better or worse, its a mixed bag. With that said, HW1 cloaks have historically been much more difficult to field compared to their HW2 counterparts. Small buff here.*
* **Cost:** `800 => 750` (-6.25%)
