Note: All proposed changes are suggestions/ideas, until deemed final.

# Kushan

Kushan are sitting in the same position as [Taiidan](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#taiidan), but *even worse*. This is due to severely underperforming race-specific units: updates here to cloaked fighters and drone frigates aim to bring both these units out of the 'never used' tier.

## Changes

### Gravwell Generators
*Colour is key*
* **Inner TO sphere now coloured according to this change:** The inner sphere has always denoted an accuracy debuff (`-7%`). The fighter-stunning active ability just happens to have the same radius.

## Buffs

### Mothership
*Givin' her all she's got*
* **Acceleration time down:** `8 => 6 (-25%)`
* **Max rotation speed up:** `4 => 8 (+100%)`
* **Rotation bake time down:** `0.6 => 0.3 (-50%)`

### Assault Frigates
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#assault-frigates) happening to Taiidan assaults.*
*Overall, vettes are a nightmare for HW1 players to deal with; this buff is a tentative step towards fixing this issue.*
* **Max rotation speed up:** `30 => 40 (+33%)` Assaults often cannot use their plasma bombs at all as they are constantly trying to bring this weapon to bear against circling vettes
* **Rotation acceleration time down:** `0.7 => 0.5 (-28%)`
* **Rotation brake time down:** `0.4 => 0.3 => (-25%)`
* **Side and rear damage multipliers removed:** `1.2 => 1.0 (-17%)`
* **Accuracy multiplier vs corvettes up:** 
* (*`kus_assaultgun.wepn`*):
  * vs `Corvette`: `0.8 => 0.912 (+14%)`
  * vs `Corvette_hw1`: `0.8 => 0.912 (+14%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `Corvette`: `0.55 => 0.627 (+14%)`
  * vs `Corvette_hw1`: `0.42 => 0.627 (+49%)`
* **Damage multiplier vs corvette up slightly:**
* (*`kus_assaultgun.wepn`*):
  * vs `LightArmour`: `0.5 => 0.6 (+20%)`
  * vs `LightArmour_hw1`: `0.5 => 0.6 (+20%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `LightArmour`: `1.25 => 1.3 (+4%)`
  * vs `LightArmour_hw1`: `1.05 => 1.3 (+24%)`
* **Accuracy multiplier vs collectors up:**
* (*`kus_assaultgun.wepn`*):
  * vs `Resource`: `0.89 => 1.0 (+6%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `Resource`: `1.0 => 3.0 (+200%)` Due to how accuracy works, 100% accuracy for a weapon does not equate to 100% of shots hit.
* **Damage multiplier vs collectors up a lot:** Assault frigates currently struggle to provide any value beyond fighting corvettes - making them decent collector killers is a natural fit for the unit, and for HW1 in general.
* (*`kus_assaultgun.wepn`*):
  * vs `ResArmour`: `0.6 => 1.5 (+150%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `ResArmour`: `0.2 => 1.2 (+500%)`
* **Plasma weapon firing cone increased:** `30 => 40 (+33%)` (*`kus_assaultbomb.wepn`*)

### Light Corvettes
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#light-corvettes) happening to Taiidan lights.*
* **Strafe speed up:** `235 => 320 (+36%)` For strike, *strafe* and *move* speed are usually the same. Lights have an usually low strafe (thrust) speed compared to their move (engine) speed
* **Move speed up:** `285 => 320 (+12%)`

### Heavy Corvettes
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#heavy-corvettes) happening to Taiidan heavies.*
* **Move speed up:** `245 => 290 (+18%)`
* **Damage multiplier vs frigates up:** `1.1 => 1.99 (+81%)` (*`kus_hvcorvette1.wepn; kus_hvcorvette2.wepn`*) This causes heavies to be worth about 0.3 torpedo frigates which reflects their cost and build time. Kushan heavy vettes fire half the shots of their Taiidan counterparts, so their weapons are twice as powerful.
* **Damage multiplier vs corvettes down:** `0.45 => 0.4 (-11%)`
* **Accuracy multiplier vs HW2 corvettes down:** `0.5 => 0.45 (-10%)`  

### Repair Corvettes
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#repair-corvettes) happening to Taiidan repair vettes (minus the changes to turret arc).*
* **Max speed up:** `255 => 290 (+14%)`
* **Rotation accel time down:** `0.6 => 0.3 (-50%)`
* **Rotation brake time down:** `0.3 => 0.2 (-33%)`
* **Evasive tactics no longer reduce weapon damage:** `0.9 => 1.0 (+9%)` Reducing weapon DPS means the healing weapon's output is also reduced.
* **Range for repair beam up:** `890 => 1112.5 (+25%)`
* **Beam now fires in a continuous stream.**

### Minelayers
*Values being shuffled, make sure to also check the nerfs. A slight buff to minelayers overall, but mostly to their ability to backstab RU operations.*
* **Max speed up:** `246 => 270 (+10%)`
* **HP up:** `900 => 1080 (+20%)` This counteracts the removal of `sidearmour` and `reararmour` modifiers, see nerfs section.
* **No damage penalty in evasive:** `0.9 => 1.0 (+9%)` See nerfs section about more of these changes and why they happened.

### Multigun Corvettes
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#multigun-corvettes) happening to Taiidan multiguns.*
* **Build time down:** `25 => 23 (-8%)`
* **Max speed up:** `275 => 305 (+11%)`
* **Max rotation speed up a lot:** `97 => 170 (+75%)` Contrast to gunships: `163`. Multiguns need to turn to face their targets due to their attack script (stationary pivot vs circling)
* **Rotation accel time down:** `1.65 => 0.65 (-61%)` Contrast to gunships: `0.6`
* **Rotation brake time down:** `0.825 => 0.4 (-51%)`
* **Weapon changes:**
* (*`kus_multigun1.wepn; kus_multigun2.wepn`*):
  * **Attack range up:** `1600 => 1800 (+13%)`
  * **Projectile speed up:** `1500 => 1900 (+26%)` Multiguns were unable to hit HW1 fighters hardly at all, but were reliable against HW2. This buff has a small effect against HW2, but a large one against HW1.
  * **Accuracy vs fighters up:**
    * vs `Fighter`: `0.6 => 0.81 (+35%)`
    * vs `Fighter_hw1`: `0.6 => 0.9 (+50%)`

### Support Frigates
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#support-frigates) happening to Taiidan support frigates.*
* **'Damage' multiplier vs frigates up:** `1.0 => 1.5 (+50%)` (*`kus_supportgunheal.wepn`*) More like anti-damage, this is a buff to the healing factor against frigates
* **Range for repair beam up:** `1000 => 1250 (+25%)`
* **Beam now fires in a continuous stream.**

### Resource Collectors
*See the [not for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#resource-collectors) happening to Taiidan resource collectors.*
* **Move speed up:** `110 => 206 (+106%)`
* **Build time down:** `50 => 45 (-10%)`

### Resource Controllers
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#resource-controllers) happening to Taiidan resource controllers.*
* **Build time down slightly:** `60 => 55 (-8%)`
* **Max speed up:** `100 => 165 (+65%)`
* **Max rotation speed up:** `18 => 36 (+100%)`
* **Max HP up:** `25000 => 30000 (+20%)`
* **Regen time down:** `1500 => 900 (-40%)`
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`

### Bombers
*Doing fine, but doing surprisingly low damage to collectors.*
* **Damage multiplier vs collectors slightly up:** `0.23 => 0.3 (+30%)` (*`hw1_bomber.wepn`*)

### Cloak Generators 
*Moving far too slowly to perform clutch carrier cloaks or to keep pace with frigates. Similar reasoning to the buffs to the field frigates. Cloak generators are also remarkably fragile.*
* **Max HP up:** `9000 => 11000 (+22%)`
* **Max speed up:** `165 => 206 (+24%)`
* **Max rotation speed up:"** `22 => 30 (+36%)`
* **Rotation accel time down:** `0.75 => 0.5 (-33%)`
* **Start moving sooner when turning:** `40 => 60 (+50%)` This value (`accelerationAngle`) defines a forwards facing cone which the ships target destination must lie within *before* it will begin accelerating
* **Default stance change:** `Neutral => Evasive`
* **Default tactics change:** `Defensive => Passive`
* **Maximum energy up:** `3000 => 4000 (+33%)` This translates into a buff in duration: `100 => 130 (+30%)`. Don't forget that activating the cloak costs energy too: one activation costs 100 energy, making the duration `130` instead, and so on.
* **Activation cost up:** `50 => 100 (+100%)`
* **Cloak strength up:** `1000 => 2000 (+100%)`

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
* **Projectile speed up:** `1200 => 1300 (+8%)` (*`kus_defender.wepn`*)
* **Accuracy vs fighters up:**
* (*`kus_defender.wepn`*)
  * **Accuracy buffs:**
    * vs `Fighter`: `0.7 => 0.95 (+26%)`
    * vs `Fighter_hw1`: `0.7 => 0.95 (+26%)`
  * **Damage multiplier buffs:**
    * vs `Fighter`: `0.7 => 0.95 (+36%)`
    * vs `Fighter_hw1`: `0.7 => 0.95 (+36%)`
  
### Carriers
*HW1 is currently unable to follow a hard macro / fast expand strategy as they simply cannot get a second carrier out in time to make use of the extra income. This change, in combination with the collector speed buff, will hopefully open macro play as an option for HW1 as a race. To compensate, their build price is going up (below).*
* **Build time down:** `210 => 165 (-21%)`

### Cloaked Fighters
*Cloaked fighters struggle to find a place in the game - their stats **would** let them be something akin to super-interceptors, however their costs and unit cap means they struggle to find a place here. These changes instead emphasise the guerilla aspects of cloaked fighters, making them a true harrassment tool to be feared.*
* **Unit caps raised by 1.5x:**
  * `12 => 18` in `small`
  * `20 => 30` in `normal`
  * `25 => 38` in `large`
  * `30 => 45` in `huge`
  * `60 => 90` in `vast`
* **Build time lowered slightly:** `15 => 13 (-13%)`
* **Weapon damage range removed:** `[10, 15] => [15, 15] (effective +25%)`
* **Damage multiplier vs collectors up slightly:** `1.1 => 1.3 (+18%)`
* **Damage multiplier vs subsystems up:** `1.25 => 3.0 (+140%)`
* **Regeneration added:** `0 => 240` The only strike with inherent regeneration. Cloaked fighters will regenerate completely in 4 minutes.
* **Energy usage removed:** `6 => 0` Yes, this means infinite cloaking.

### Drone Frigates
*Drone frigates are widely regarded as the worst frigate in the game. Even way back when I played classic campaign I never made these things. QOL upgrades along with slightly reduced deployment time are first steps for this unit.*
* **Drone deployment speed decreased:** `20 => 5 (-75%)`
* **Drones never expire**
* **Build time decreased a lot:** `77 => 45 (-42%)` Contrast with Hiigaran flaks: `50`, Vaygr assaults: `45`, keep in mind HW1 has no imp. manufacturing upgrade.
* **Max speed up:** `166 => 230 (+39%)`


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
*Far too versatile. Currently an outstanding anti-fight unit, light vettes also do great work against collectors and even other corvettes. This is not identical to the Kushan nerf since the Taiidan light has two guns instead of one.*
* **HP down:** `900 => 800 (-11%)`
* **Damage multiplier vs fighters slightly down:**
* (*`kus_ltcorvette.wepn`*) 
  * vs `Unarmoured`: `1.2 => 0.8 (-33%)` 
  * vs `Unarmoured_hw1`: `1.2 => 0.9 (-25%)`
* **Accuracy multiplier vs fighters down:**
* (*`kus_ltcorvette.wepn`*) 
  * vs `Fighter`: `0.95 => 0.9 (-5%)`
  * vs `Fighter_hw1`: `0.95 => 0.9 (-5%)`
* **Damage multiplier vs corvettes slightly down:**
* (*`kus_ltcorvette.wepn`*)
  * vs `LightArmour`: `0.5 => 0.4 (-20%)` 
  * vs `LightArmour_hw1`: `0.5 => 0.4 (-20%)`
  
### Heavy Corvettes
*No need to overlap the anti-corvette role with functioning assault frigates. Still decent.*
* (*`kus_hvcorvette1.wepn; kus_hvcorvette2.wepn`*)
  * vs `Unarmored`: `1.0 => 0.8 (-20%)`
  * vs `Unarmoured_hw1`: `1.0 => 0.8 (-20%)`
* **Accuracy multiplier vs fighters down:**
* (*`kus_hvcorvette1.wepn; kus_hvcorvette2.wepn`*)
  * vs `Fighter`: `0.51 => 0.1 (-80%)`
  * vs `Fighter_hw1`: `0.51 => 0.1 (-80%)`
* **Damage multiplier vs corvettes slightly down:** 
* (*`kus_hvcorvette1.wepn; kus_hvcorvette2.wepn`*)
 * vs `LightArmour`: `0.5 => 0.45 (-10%)`
 * vs `LightArmour_hw1`: `0.55 => 0.45 (-18%)`

### Minelayer Corvettes
*Compared to its 'never build' HW2 counterparts, the HW1 minelayer is much cheaper, faster building and more accessible. Its stats are a little worse and it can't clear mines, but ints can easily fill this role anyway. Weapons no longer affected by any stance - minelayers wanted to be evasive to lay mines faster, but also aggressive for a damage boost. Easiest resolution: no damage modifiers.*
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

### Cloaked Fighters
*This is a power unit. Making it should require time and money. This unit should also be vulnerable to thoughtless usage, so its becoming easier to chase down.*
* **Research cost up:** `500 => 750 (+50%)`
* **Research time up:** `100 => 130 (+30%)`
* **Max speed down slightly:** `430 => 420 (-2%)`
