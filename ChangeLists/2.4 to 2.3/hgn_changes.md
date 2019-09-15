# Hiigaran

> *Hiigaran have had a few of their units reverted to their old stats as they were in 2.3b9, and for the early stages of 2.4. This is primarily to provide a clearer slate to balance off heading forwards - many buffs and nerfs were only in place to offset **previous** buffs and nerfs. Instead, we've just reverted a few steps back.*

---

## Scouts
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

## Bombers
> *With the overall improvement to anti-fighter measures across many unit classes, both ints and bombers have felt the strain. While ints have been checked well, the already-underused bombers need a little love.*
* **Speed:** `279 => 300` (+7.3%)
* **Weapons:**
	* **All bombs now have same projectile speed:** `1200 => 1800` (+50%)

---

## Corvette Facilities
> *Carriers were building these 5s faster than motherships. Oops.*
* **Build time (carriers):** `55 => 60` (+10%)

---

## Gunships
> *Gunship-core unit comps more viable.*
* **Research:**
  * **HP upgrade:**
    * **Cost:** `650 => 600` (-7.7%)

---

## Pulsar Corvettes
> *Some reversions here - prior changes were not properly tested and have affected pulsars in unexpected ways.*
* **Weapons:**
  * **Up/down max angle of canon down.**
  * **Damage Multipliers:**
	  * **vs HW2 Fighters:** `0.19 => 0.24` (+23.3%)
	  * **vs HW1 Fighters:** `0.2 => 0.25` (+25%)

---

## Minelayer Corvettes
> *The lifetime of mines is significantly down since vanilla.*
* **HP:** `900 => 1500` (+50%)
* **Speed:** `233 => 291` (+22%)

---

## Defense Field Frigates
> *Small reversion, field frigates are outpacing normal combat frigates.*
* **Speed**: `250 => 220` (-30%)

---

## Torpedo Frigates
> *A nerf which was put in place after various other nerfs to corvettes. In practice, had very little effect as the damage load of a torpedo is so high that the weapon needs very strong nerfs to make a difference. Various corvettes have their old HP values, so this is also going back.*
* **Weapons:**
  * **Cluster torpedo:**
	* **Damage multipliers:**
		* **vs HW1 Corvettes:** `0.4 => 0.8` (+100%)

---

## Flak Frigates
> *A planned buff in 2.4, finally implemented here. Flaks are fairly niche compared to other anti-fighter options.*
* **Research:**
  * **HP upgrade:**
    * **Cost:** `1000 => 600` (-40%)
	* **Time:** `75 => 40` (-60%)
  * **Speed upgrade:**
    * **Cost:** `600 => 400` (-18.1%)
* **Build time:** `50 => 45` (-10%)

---

## Destroyers
> *Total reversion of this unit. Many of the later buffs were implemented to offset early nerfs. This has made a mess of the unit overall. Destroyers overall had their damage cut against resourcing. This has made them extremely linear in their gameplan as they are hard pressed to inflict logistical damage without significant numbers. Reverting this.*
* **Research:**
  * **Unit unlock:**
    * **Time:** `100 => 90` (-10%)
* **Weapons:**
  * **Torpedoes:**
    * **Damage multipliers:**
      * **vs Resourcing:** `0.3 => 0.6` (+100%)

---

## Battlecruisers
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

## Mothership
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

## Shipyards
> *Same idea behind a similar change the Mothership.*
* **Research:**
  * **Production speed upgrade:**
	* **Cost:** `1750 => 1000` (-54.5%)
    * **Time:** `60 => 40` (-33%)

---

## Resource Collectors
> *This tech is such a defensive freebie it hurts to think about. Small nerf to make it more of an actual decision.*
* **Research:**
  * **HP upgrade:** `800 => 1000` (+25%)

---

## Mobile Refineries
> *Go backstab these guys.*
* **HP:** `18000 => 16000` (-11.8%)

---

## Probes
> *Part of wider nerfs to vision overall.*
* **Cost:** `100 => 120` (+20%)
* **Vision:**
  * **Vision range:** `5000 => 4000` (-20%)
  * **Primary sensors range:** `12000 => 10000` (-18.1%)
  * **Secondary sensors range:** `12000 => 10000` (-18.1%)

---

## Proximity Sensors
> *Reverting this to its 2.3 state.*
* **Research:**
  * **Unit unlock:**
	* **Cost:** `600 => 500` (-18.1%)
* **Build time:** `15 => 20` (+33%)

---

## Sensor Distortion Probes
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

## Advanced Research Modules
> *Part of general timing resets for Hiigaran.*
* **Build time:** `140 => 150` (+7.1%)
