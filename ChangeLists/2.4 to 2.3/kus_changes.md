# Kushan

> *Many aspects of the HW1 races have been reverted. However, there are included here some new changes, as well as a couple of bugfixes. Finally, some tech is now actually viable (although we're still working on cruisers), through tweaks to research for hw1 frigate+ ships overall.*

---

## Assault Frigates
> *Projectile speed was way out of hand. Toning this back - they still land their shots just fine.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1500 => 1200` (-20%)
* **Weapons:**
  * **Kinetic cannons:**
	* **Projectile speed:** `3000 => 1800` (-40%)

---


## Attack Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love. With that said, HW1 bombers are infamous for being extremely obnoxious in earlygame int/bomber soup rushes, so a small HP reduction will allow early anti-fighter options to clear them a little easier.*
* **HP:** `135 => 125` (-7.4%)
* **Speed:** `390 => 420` (+7.7%)

---

## Carriers
> *With destroyer and assault tech cheaper, the costs are being somewhat reassigned here. Destoryers are still overall cheaper to reach however.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1000 => 1500` (+50%)

---


## Cloak Generators
> *Having fields on ships instead of modules is neither better or worse, its a mixed bag. With that said, HW1 cloaks have historically been much more difficult to field compared to their HW2 counterparts. Small buff here.*
* **Cost:** `800 => 750` (-6.25%)

---

## Defenders
> *This unit's combat performance was significantly improved with 2.4. As such, the infamous hyper-defender all-in is now quite crushing. Small tone back on this aspect of the unit.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `650 => 800` (+23.1%)

---


## Destroyers
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

## Drones
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

## Drone Frigates
> *Speed down just a tad so they aren't outpacing everything else. Drones themselves now move very quickly. This unit has had a massive overhaul on its drone AI - you'll notice drones no longer keep a clean sphere if the frigate is moving while attacking but instead will clump a little. This is still a bit of a work in progress, but drones will now actually fire correctly and can move while shooting. Please try them out!*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1000 => 1100` (+10%)
    * **Time:** `60 => 80` (+33.3%)
* **Speed:** `230 => 222` (-3.5%)

---

## Heavy Corvettes
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

## Heavy Cruisers
> *HCs are a little too hard to field and are an ongoing project. The weapon range is now going down by a flat amount (see entries for HW2 cruisers) instead of a % amount as per 2.4.*
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

---

## Interceptors
> *This unit went on quite a wild ride in 2.4. We've restored it back to its 2.3 state and will keep an eye on it moving forwards.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `650 => 300` (-53.8%)
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

## Ion Cannon Frigates
> *General revisions. This unit is not stellar so far as anti-heavy frigates go, and was generally undesirable in 2.4.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `2000 => 1700` (-15%)
    * **Time:** `135 => 120` (-11.1%)


---


## Light Corvettes
> *Unlocking the base corvette is now cheaper - corvettes should be a totally viable opening for HW1 and not simply a countertech. Vettes higher in the tree have had this cost reduction spread amongst them instead.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1500 => 1000` (-33%)

---


## Minelayer Corvettes
> *Restoring this unit to its 2.3 state. Mines have been hurt for a long time after a breif hysteria in the early days on 2.4. Since the lifetime of mines themselves has long since been reduced, the unit itself can go back to its original state.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `1500 => 1200` (-20%)
* **Cost:** `375 => 325` (-13.3%)
* **Build time:** `30 => 35` (+16.7%)

---

## Missile Destroyers
> *Unfortunately, units in remastered will always hover at the range of their highest ranged weapon. For 2.4 MDDs, this meant they were hovering at the massive range of their special burst attack, and often didn't enter into range to start firing normally. These weapons now have the same range, although this is a work in progress.*
* **Weapons:**
  * **Regular missiles:**
	* **Range:** `3750 => 4000` (+6.7%)
  * **Burst attack:**
    * **Range:** `5500 => 4000` (-27.3%)

---


## Multigun Corvettes
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

## Probes
> *Part of wider nerfs to vision overall.*
* **Cost:** `100 => 120` (+20%)
* **Vision:**
  * **Vision range:** `5000 => 4000` (-20%)
  * **Primary sensors range:** `12000 => 10000` (-18.1%)
  * **Secondary sensors range:** `12000 => 10000` (-18.1%)

---

## Proximity Detectors
> *Aligning build time with HW2 changes.*
* **Build time:** `15 => 20` (+33%)

---

## Resource Collectors
> *Due to their larger profile and slower movement speed, these guys absorb a significantly higher amount of incoming fire compared to their HW2 counterparts. As such, to provide similar survivability, they need a little extra bulk.*
* **HP:** `4000 => 5000` (+25%)

---

## Salvage Corvettes
> *Corvettes higher in the tree are taking up the slack of a cheaper light corvette research.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `500 => 700` (+40%)
    * **Time:** `30 => 60` (+100%)

---

## Scouts
> *This was an extreme price for scouts to be placed at. While we don't mind this unit being as costly as an interceptor, it shouldn't be significantly more.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `250 => 200` (-20%)
    * **Time:** `25 => 20` (-20%)
* **Cost:** `150 => 100` (-33%)
* **Speed:** `465 => 460` (-1.1%)
* **Vision:**
  * **Vision range:** `4000 => 1500` (-62.5%)

---

## Sensors Arrays
> *This unit doesn't provide total map vision like it did in classic - instead, its much more akin to HW2 advanced sensor arrays. The only difference here is that its mobile. This unit is currently unused in multiplayer as it's quite pricey and very fragile, while being slow as molasses. Easing the cost to field this unit will hopefully help.*
* **Research:**
  * **Unit unlock:**
    * **Time:** `60 => 80` (+33.3%)
* **Cost:** `700 => 500` (-28.6%)
* **Build time:** `70 => 60` (-14.3%)

---

## Support Frigates
> *Base healing reverted, but frigate-specific healing staying high.*
* **Research:**
  * **Unit unlock:**
    * **Cost:** `800 => 1000` (+25%)
    * **Time:** `60 => 75` (+25%)
* **Weapons:**
  * **Heal beam:**
    * **Base damage:** `-20.7 => -14.17` (-31.5%)
    * **Damage multipliers**
      * **vs Frigates:** `1.5 => 2.0` (+33%) // 2.4: `20.7 * 1.5 == 31`, 2.3: `14.17 * 1.5 = 28.3`
