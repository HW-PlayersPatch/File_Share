Note: All proposed changes are suggestions/ideas, until deemed final.

# Taiidan

Taiidan (and Kushan even more so) are currently struggling to face up against the HW2 races on medium to large maps. This mostly boils down to insurmountable production differences, but also a few critical gaps in their unit coverage options. To mitigate the HW2 macro advantage, HW1 is forced to rush or play a perfect harrassment game. These changes hopefully open more options up for Taiidan (similar changes to Kushan), while retaining their identity as an agressive race.

## Changes

### Defense Fighters
*Currently decorative, this unit's tiny and mostly ineffective shield, coupled with extremely unreliable anti-missile capabilities make it 'never-use' tier. These changes hope to give some identity to the unit, and also to Taiidan.*
* **New attacking script:** `fighter_vs_fighter.lua => flyround_defensefighter.lua` Very similar to command vette behavior, albeit with a much smaller circling radius.
* **Guard closer:** `3000 => 500 (-83%)`
* **Defence field radius up slightly:** `600 => 700`
* **Defence field effectiveness vs projectiles up:** `0.85 => 0.4 (-53%)` This translates to percentage blocked: `15% => 60% (+300%)`
* **Easier to hit whilst idle:**
  * `ms <= 100ms`: `1.0 => 2.0 (+100%)` Against a DFF moving slower than 100ms, enemy ships have their accuracy multiplied by the given value (`2.0`)
  * `120 < ms <= 388`: `1.0`
  * `388 < ms <= 535`: `0.98`
  * `535 < ms`: `0.7`
* **Added max speed debuff field (for enemies):** `MaxSpeed`
  * Radius: `2000`
  * Effectiveness: `0.984` So an enemy units speed is multiplied by `0.984` for an effective `2.6%` debuff (no stacking cap)
* **Added damage debuff field (for enemies):**
  * Radius: `2000`
  * Effectiveness: `0.98` An effective debuff of `2%`
* **Added accuracy debuff field (for enemies):**
  * Radius: `2000`
  * Effectiveness: `0.95` An effective debuff of `5%`
* **Anti-weapon laser changes:**
* (*`tai_defenselaser.wepn`*)
  * **Is now a turret:**
    * Aiming cone removed: `40 => 0 (-100%)`
    * Tracking speed: `500`
    * Horizontal rotation: `[-45, 45]`
    * Vertical rotation: `[-45, 45]`
  * **Priorities:** Mines > Torpedoes > Heavy missiles > Small missiles > Munitions
  * **Base damage up:** `[18, 19] => 40 (avg +111%)` Now kills small missiles in a single shot, large ones in two shots, and mines in three.
  * **Beams sweep more slowly:** `0.5 => 0.1 (-80%)`
  * **Range down:** `2575 => 1575 (-39%)`
  * **Beam lifetime up:** `0.5 => 1.0 (+100%)`
  * **Time between shots up:** `1.0 => 5.0 (+400%)`
  * **No longer attacks in bursts**
  * **Can now attack targets which are not its assigned target:** `0 => 1` This effect will only occur if the assigned target is out of range or otherwise untargetable
  * **No longer tracks out-of-range targets:** `1 => 0`
  * **Damage multiplier vs torpedoes down:** `0.678 => 0.5 (-27%)`
  * **Damage multiplier vs missiles down:** `0.678 => 0.5 (-27%)`
  * **Damage multiplier vs munitions down:** `0.678 => 0.5 (-27%)`

### Gravwell Generators
*Colour is key*
* **Inner TO sphere now coloured according to [this](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Feature_Changes_Prop.md#weapon-accuracy-modifier-colour) change:** The inner sphere has always denoted an accuracy debuff (`-7%`). The fighter-stunning active ability just happens to have the same radius.

## Buffs

### Flagship
*Emperor Riesstiu's got places to be.*
* **Acceleration time down:** `8 => 6 (-25%)`
* **Max rotation speed up:** `4 => 8 (+100%)`
* **Rotation bake time down:** `0.6 => 0.3 (-50%)`

### Assault Frigates
*Assault frigates are a Taiidan player's best solution to corvettes. You might be thinking that they barely handle these units, and you'd be right. Neither HW1 race has viable options for handling vette cloud spam:*
* *Heavy corvettes are widly outclassed in this role due to higher build times, costs, research times, move speed and lack of squadron replenishment mechanics*
* *Assault frigates are **laughably** innaccurate. Occasionally you will get an extremely lucky series of rolls, however assault frigates routinely fail to hit corvettes for periods lasting as long as a full minute. They pair decently with gravwell generators, which bumps up their accuracy somewhat. Despite this, assaults are lacking in this role due to higher build times, costs, research times, move speed, lack of docking (obviously), and being forced to rely on an additional supporting unit to cover a unit type they are supposed to specialise in. As if this wasn't enough, many corvette builds transition extremely well into fighters or frigates, and both HW2 races have vettes which kill frigates much more efficiently than assaults kill corvettes.*
* *Missile destroyers are without a doubt the best anti-corvette unit available for any race in a staged fight... however they have enourmous cumulative research times (and costs), as well as high build times. To top it off, they are fragile enough that they lose the matchup against pulsars if unsupported, and lasers in general. Finally, they move too slowly to keep up with any harrassment or backstabs. They pair up very well with gravwells, however this is yet another layer of cost and time required to handle a low-tech/cost unit class.*

*Overall, vettes are a nightmare for HW1 players to deal with; this buff will hopefully give players pause before blindly opening vettes against a HW1 opponent.*
* **Max rotation speed up:** `30 => 40 (+33%)` Assaults often cannot use their plasma bombs at all as they are constantly trying to bring this weapon to bear against circling vettes
* **Rotation acceleration time down:** `0.7 => 0.5 (-28%)`
* **Rotation brake time down:** `0.4 => 0.3 => (-25%)`
* **Side and rear damage multipliers removed:** `1.2 => 1.0 (-17%)`
* **Weapon subsytems fixed:** Two hardpoints use the `tai_assaultcannon2.subs` subsytem which was incorrectly duplicating its model from another subsystem: `tai_frigatecannon.subs`. It now correctly duplicates from `tai_assaultcannon.subs`.
* **Accuracy multiplier vs corvettes up:** 
* (*`tai_assaultgun1.wepn; tai_assaultgun2.wepn`*):
  * vs `Corvette`: `0.8 => 0.912 (+14%)`
  * vs `Corvette_hw1`: `0.8 => 0.912 (+14%)`
* (*`tai_assaultbomb.wepn`*):
  * vs `Corvette`: `0.55 => 0.627 (+14%)`
  * vs `Corvette_hw1`: `0.42 => 0.627 (+49%)`
* **Damage multiplier vs corvette up slightly:**
* (*`tai_assaultgun1.wepn; tai_assaultgun2.wepn`*):
  * vs `LightArmour`: `0.5 => 0.6 (+20%)`
  * vs `LightArmour_hw1`: `0.5 => 0.6 (+20%)`
* (*`tai_assaultbomb.wepn`*):
  * vs `LightArmour`: `1.25 => 1.3 (+4%)`
  * vs `LightArmour_hw1`: `1.05 => 1.3 (+24%)`
* **Accuracy multiplier vs collectors up:**
* (*`tai_assaultgun1.wepn; tai_assaultgun2.wepn`*):
  * vs `Resource`: `0.89 => 1.0 (+6%)`
* (*`tai_assaultbomb.wepn`*):
  * vs `Resource`: `1.0 => 3.0 (+200%)` Due to how accuracy works, 100% accuracy for a weapon does not equate to 100% of shots hit.
* **Damage multiplier vs collectors up a lot:** Assault frigates currently struggle to provide any value beyond fighting corvettes - making them decent collector killers is a natural fit for the unit, and for HW1 in general.
* (*`tai_assaultgun1.wepn; tai_assaultgun2.wepn`*):
  * vs `ResArmour`: `0.6 => 1.5 (+150%)`
* (*`tai_assaultbomb.wepn`*):
  * vs `ResArmour`: `0.2 => 1.2 (+500%)`
* **Plasma weapon firing cone increased:** `30 => 40 (+33%)` (*`tai_assaultbomb.wepn`*)

### Light Corvettes
*Of all corvettes, this should be the one rushing and outmaveuvering. However, due to the overall sluggish engines HW1 currently have on many ships, this would-be blitz unit is outsped by supposedly heavyweight counterparts from HW2.*
* **Strafe speed up:** `235 => 320 (+36%)` For strike, *strafe* and *move* speed are usually the same. Lights have an usually low strafe (thrust) speed compared to their move (engine) speed
* **Move speed up:** `285 => 320 (+12%)`

### Heavy Corvettes
*Heavy vettes are currently trapped in the 'I used this once and it really sucked' tier of units. Their infastructure stats are way out of tune for what the unit actually provides. However, this unit is receiving a (small) nerf vs its vette accuracy, in tandem with these buffs. This is to solidify its role as an anti-**frigate** unit rather than a competetor with the assault frigate for its role. This update aims to have a neat ladder of anti-heavy corvettes looking like so: Lasers > Heavies > Pulsars.*
* **Move speed up:** `245 => 290 (+18%)` This is a corvette, not a frigate
* **Damage multiplier vs frigates up:** `0.55 => 1.0 (+81%)` (*`tai_hvcorvette1.wepn; tai_hvcorvette2.wepn`*) This causes heavies to be worth about 0.3 torpedo frigates which reflects their cost and build time.
* **Damage multiplier vs corvettes down:** `0.225 => 0.2 (-11%)`
* **Accuracy multiplier vs HW2 corvettes down:** `0.5 => 0.45 (-10%)`  

### Repair Corvettes
*Not bad, however their main role (fast response repairer) is sabotaged by a lackluster speed stat. Repair vettes will often fail to move into range with a friendly vette / whatever before its already dead. In the case of vettes, they can often strafe or move away faster than the repair vette can follow. Taiidan repair vettes also have a specific issue where their repair beam is fixed forwards, this means they waste tons of time positioning themselves before they think they can shoot.*
* **Max speed up:** `255 => 290 (+14%)`
* **Rotation accel time down:** `0.6 => 0.3 (-50%)`
* **Rotation brake time down:** `0.3 => 0.2 (-33%)`
* **Evasive tactics no longer reduce weapon damage:** `0.9 => 1.0` Reducing weapon DPS means the healing weapon's output is also reduced.
* **Weapon turret can now turn:** (*`tai_repairgunheal.wepn`*) Now matches Kushan repair vette behavior.
  * Horizontally: `[0, 0] => [-45, 45]`
  * Vertically: `[0, 0] => [-1, 10]`
* **Removed nonsensical firing cone range:** `80 -> 0` (*`tai_repairgunheal.wepn`*)
* **Repair beam now plays the correct sound on firing** (*`tai_repairgunheal.wepn`*)
* **Range for repair beam up:** `890 => 1112.5 (+25%)`
* **Beam now fires in a continuous stream.**

### Minelayers
*Values being shuffled, make sure to also check the nerfs. A slight buff to minelayers overall, but mostly to their ability to backstab RU operations.*
* **Max speed up:** `246 => 270 (+10%)`
* **HP up:** `900 => 1080 (+20%)` This counteracts the removal of `sidearmour` and `reararmour` modifiers, see nerfs section.
* **No damage penalty in evasive:** `0.9 => 1.0 (+9%)` See nerfs section about more of these changes and why they happened.

### Multigun Corvettes
*Outclassed by light vettes on all fronts, multiguns should come into the fore with the light vette nerf (below). However, even when uncontested in fighter sniping, the speed and especially agility of multiguns leaves a lot to be desired, especially considering their target unit class. The main cause of unreliability for multiguns is *time spent not firing*, which is influenced by many factors - these changes aim to up the amount of time multiguns actually spend firing at the enemy, and make them a viable upgrade to lights.*
* **Build time down:** `25 => 23 (-8%)`
* **Max speed up:** `275 => 305 (+11%)`
* **Max rotation speed up a lot:** `97 => 170 (+75%)` Contrast to gunships: `163`. Multiguns need to turn to face their targets due to their attack script (strafe + pivot vs circling)
* **Rotation accel time down:** `1.65 => 0.65 (-61%)` Contrast to gunships: `0.6`
* **Rotation brake time down:** `0.825 => 0.4 (-51%)`
* **Weapon changes:**
* (*`tai_multigun1.wepn; tai_multigun2.wepn`*):
  * **Attack range up:** `1600 => 1800 (+13%)`
  * **Projectile speed up:** `1500 => 1900 (+26%)` Multiguns were unable to hit HW1 fighters hardly at all, but were reliable against HW2. This buff has a small effect against HW2, but a large one against HW1.
  * **Accuracy vs fighters up:**
    * vs `Fighter`: `0.6 => 0.81 (+35%)`
    * vs `Fighter_hw1`: `0.6 => 0.9 (+50%)`

### Support Frigates
*Support frigates only come into their own when in numbers above three or more healing the same target (usually a destroyer): this makes them quite undesirable as an earlygame unit due to their high build time and lackluster healing power against the units that are on the field at that stage of the game (frigates). Rather than keep this unit consigned to the lategame, this is a buff intended to make support frigates an option in the earlygame (not always outclassed by building an extra dps frigate).*
* **'Damage' multiplier vs frigates up:** `1.0 => 1.5 (+50%)` (*`tai_supportgun1heal.wepn`*) More like anti-damage, this is a buff to the healing factor against frigates
* **Range for repair beam up:** `1000 => 1250 (+25%)` (*`tai_supportgun1heal.wepn`*)
* **Beam now fires in a continuous stream.**
* **Changed healing gun firing cone to match the Kushan Support Frigate's one.**

### Resource Collectors
*HW1 resourcing is currently something tourturous. Collectors slower than carriers meant expanding or relocations were extremely difficult or impossible under many circumstances, and even if they **were** possible, they weren't desirable. This also makes HW1 collectors a huge liability to replace, as it could be minutes before a collector can get back to harvesting, else the HW1 player hyperspace it into position at an extra charge on top of the build cost... A mess, in essence. These changes have been tested extensively so **HW1 collection rate is the same**, however HW1 strategy is now much more flexible, and their economy is much less fragile (although still not quite as robust as HW2).*
* **Move speed up:** `110 => 206 (+106%)`
* **Build time down:** `50 => 45 (-10%)`

### Resource Controllers
*Outclassed heavily by its HW2 counterpart, with just one dropoff, no hull defence, glacial movement speed / agility, and more expensive to boot, HW1 refineries also need some love.*
* **Build time down slightly:** `60 => 55 (-8%)`
* **Max speed up:** `100 => 150 (+50%)`
* **Max rotation speed up:** `18 => 36 (+100%)`
* **Max HP up:** `25000 => 30000 (+20%)`
* **Regen time down:** `1500 => 900 (-40%)`
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`

### Bombers
*Fine, but doing surprisingly low damage to collectors.*
* **Damage multiplier vs collectors slightly up:** `0.2 => 0.3 (+50%)` (*`hw1_bomber.wepn`*)

### Cloak Generators 
*Moving far too slowly to perform clutch carrier cloaks or to keep pace with frigates. Similar reasoning to the buffs to the field frigates. Cloak generators are also remarkably fragile.*
* **Max speed up:** `165 => 206 (+24%)`
* **Max rotation speed up:"** `22 => 30 (+36%)`
* **Rotation accel time down:** `0.75 => 0.5 (-33%)`
* **Start moving sooner when turning:** `40 => 60 (+50%)` This value (`accelerationAngle`) defines a forwards facing cone which the ships target destination must lie within *before* it will begin accelerating
* **Default stance change:** `Neutral => Evasive`
* **Default tactics change:** `Defensive => Passive`
* **Max HP up:** `9000 => 11000 (+22%)`

### Probes
*No reason not to.*
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`

### Proximity Detector
* **Default stance change:** `Neutral => Evasive`
* **Default tactics change:** `Defensive => Passive`

### Defenders
*Defenders are currently garbage; their price tag is okay, but their survivability and killing efficienty is just awful. This unit is designed to hold key objectives against fighters, but is currently a minor annoyance at best. Throw in the unit cap to ensure they're always outnumbered, add in the difficulty docking, and you realise there is no current reason to ever make this unit. These change*
* **Max HP up:** `360 => 400 (+11%)`
* **Unit caps raised 1.25x:**
  * `12 => 15` in `small`
  * `20 => 25` in `normal`
  * `25 => 32` in `large`
  * `30 => 38` in `huge`
  * `60 => 75` in `vast`
* **Projectile speed up:** `1200 => 1300 (+8%)` (*`tai_defender.wepn`*)
* **Weapon changes:**
* (*`tai_defender.wepn`*)
  * **Accuracy buffs:**
    * vs `Fighter`: `0.7 => 0.95 (+26%)`
    * vs `Fighter_hw1`: `0.7 => 0.95 (+26%)`
  * **Damage multiplier buffs:**
    * vs `Fighter`: `0.7 => 0.95 (+36%)`
    * vs `Fighter_hw1`: `0.7 => 0.95 (+36%)`
  
### Carriers
*HW1 is currently unable to follow a hard macro / fast expand strategy as they simply cannot get a second carrier out in time to make use of the extra income. This change, in combination with the collector speed buff, will hopefully open macro play as an option for HW1 as a race. To compensate, their build price is going up (below).*
* **Build time down:** `210 => 165 (-21%)`

### Field Frigates
*Similar reasoning to the agility buff to [Hiigaran field frigates](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Hiigaran_Changes_Prop.md#defence-field-frigates), Taiidan field frigates are simply too slow to react accordingly to the threats they are designed to handle (light munitions).*
* **Max speed up:** `166 => 210 (+26%)`
* **Max rotation speed up:** `25 => 30 (+20%)`
* **Rotation accel time down:** `0.75 => 0.5 (-33%)`
* **Default stance change:** `Neutral => Evasive`
* **Default tactics change:** `Defensive => Passive`
* **Anti fire control radius up:** `1200 => 2250 (+88%)`
* **Accuracy debuff field stronger:** `0.95 => 0.6 (-37%)` This is a change from `-5%` accuracy to `-40%` accuracy for enemy ships.
* **Damage debuff field stronger:** `0.95 => 0.9 (-5%)` This is a change from `-5%` damage to `-10%` damage for enemy ships.


## Nerfs

### Scouts
*Part of a larger problem in HWR, scouts are currently waypointable to provide extremely hard to kill vision for a low cost and low attention investment.*
* **Primary sensor radius down (blue sphere in manager):** `9000 => 6500 (-27%)`
* **Secondary sensor radius down (works the same, but invisible):** `11000 => 8030 (-27%)` 11000 is almost as high as a probe (`12000`) - way too high.
* **Speed boost nerf:** 
  * **Duration down:** `50s => 30s (-40%)`
    * **Energy capacity up:** `1000 => 1200 (+20%)`
    * **Energy usage per second up:** `20 => 40 (+100%)`
  * **Speed multiplier down:** `1.25 => 1.2 (-4%)` resulting in a speed nerf: `613 => 588 (-4%)`

### Light Corvettes
*Far too versatile. Currently an outstanding anti-fighter unit, light vettes also do great work against collectors and even other corvettes. This is not identical to the Kushan nerf since the Taiidan light has two guns instead of one.*
* **HP down:** `900 => 800 (-11%)`
* **Damage multiplier vs fighters slightly down:**
* (*`tai_ltcorvette.wepn`*) 
  * vs `Unarmoured`: `1.2 => 0.8 (-33%)` 
  * vs `Unarmoured_hw1`: `1.2 => 0.9 (-25%)`
* **Accuracy multiplier vs fighters down:**
* (*`tai_ltcorvette.wepn`*) 
  * vs `Fighter`: `0.95 => 0.9 (-5%)`
  * vs `Fighter_hw1`: `0.95 => 0.9 (-5%)`
* **Damage multiplier vs corvettes slightly down:**
* (*`tai_ltcorvette.wepn`*)
  * vs `LightArmour`: `0.5 => 0.4 (-20%)` 
  * vs `LightArmour_hw1`: `0.5 => 0.4 (-20%)`

### Heavy Corvettes
*No need to overlap the anti-corvette role with functioning assault frigates. Still decent. No longer worth their weight in RUs against fighters.*
* **Damage multiplier vs fighters down:**
* (*`tai_hvcorvette1.wepn; tai_hvcorvette2.wepn`*)
  * vs `Unarmored`: `0.5 => 0.4 (-20%)`
  * vs `Unarmoured_hw1`: `0.5 => 0.4 (-20%)`
* **Accuracy multiplier vs fighters down:**
* (*`tai_hvcorvette1.wepn; tai_hvcorvette2.wepn`*)
  * vs `Fighter`: `0.51 => 0.1 (-80%)`
  * vs `Fighter_hw1`: `0.51 => 0.1 (-80%)`
* **Damage multiplier vs corvettes slightly down:** 
* (*`tai_hvcorvette1.wepn; tai_hvcorvette2.wepn`*)
  * vs `LightArmour`: `0.25 => 0.225 (-10%)`
  * vs `LightArmour_hw1`: `0.275 => 0.225 (-18%)`
 
### Minelayer Corvettes
*Compared to its 'never build' HW2 counterparts, the HW1 minelayer is much cheaper, faster building and more accessible. Its stats are a little worse and it can't clear mines, but ints fill this role anyway.*
* **Build time slightly up:** `25 => 30`
* **Directional damage modifiers removed:** These modifers multiply with incoming damage to reduce its effect
  * **Rear:** `0.8 => 1.0 (+25%)`
  * **Side:** `0.8 => 1.0 (+25%)`
* **Aggressive stance damage multiplier removed:** `1.32 => 1.0 (-24%)` This value of `1.32` is the product of the `WEAPONDAMAGE` and `DAMAGEAPPLIED` modifiers which were `1.2` and `1.1` respectively.
* **Aggressive stance mine speed multiplier removed** `1.1 => 1.0 (-9%)`

### Multigun Corvettes
*The power in these stats has mostly been routed into more relevant stats (see buffs). Multiguns have still been buffed overall.*
* **HP down:** `1100 => 900 (-18%)`
* **Weapon changes:**
  * (*`tai_multigun1.wepn; tai_multigun2.wepn`*):
    * **Damage range down:** `[8, 10] => [8, 9] (avg -5.5%)`
    * **Time between shots up:** `2.0 => 2.5 (+25%)`
    * **Damage multiplier vs fighters down:**
      * vs `Unarmoured`: `1.8 => 0.8 (-55%)`
      * vs `Unarmoured_hw1`: `1.8 => 0.93 (-48%)`
    * **Damage multiplier vs corvettes down:** `1.0 => 0.75 (-25%)`

### Missile Destroyers
*Performance vs HW2 corvettes a little high. These changes level this closer to their performance vs HW1 vettes.*
* **Damage vs HW2 vettes down:** `1.25 => 1.0 (-20%)`
* **Now use up a supply slot for Destroyers (still have their own cap of 2)** `0 => 1`  Since MDs are the end-all unit against strikecraft, allowing two of these in addition to the six destroyers available made HW1 lategame deathballs extremely difficult to deal with.

### Resource Collectors
*These are not torpedoes, despite appearances. Also a nerf to capacity balance against buffed speeds; overall 0 change to RU/s*
* **Collision multiplier down:** `0.8 => 0.6 (-20%)`
* **RU capacity down:** `500 => 300 (-40%)`

### Carriers
*To compensate for their reduced build times, the price of carriers is going up: they are, after all, superior to HW2 carriers on almost all fronts.*
* **Build cost up:** `3000 => 3500 (+17%)`

### Field Frigates
*This is a power unit. Making it should require time and money.*
* **Research cost up:** `1100 => 1250 (+14%)`
* **Research time up:** `40 => 60 (+50%)`
