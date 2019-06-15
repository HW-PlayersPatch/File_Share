Note: All proposed changes are suggestions/ideas, until deemed final.

# Hiigaran

Hiigaran are currently struggling to find diversity in their overarching playstyle.
Some of these issues stem from outclassed units, but many early rushes and game-long harrassment options have been knocked heavily in terms of viability. This is due to iterative indirect nerfs to their harrassment options.

Several buffs are included to open up these options to Hiigaran again, and also to diversify their roster.
**Nerfs to utility are affecting all races.**

## Buffs

### Mothership
*Givin' her all she's got. In the future.*
* **Max speed up:** `40 => 42 (+5%)` The meaning of life
* **Acceleration time down:** `8 => 6 (-25%)`
* **Max rotation speed up:** `4 => 8 (+100%)`
* **Rotation brake time down:** `0.4 => 0.2 (-50%)`
### Minelayers
*Currently in the 'never used' tier of units, minelayers are currently held back not by their stats or DPS, but their infastructure (and their own) cost and build times. Minelayers have great potential as a backstab unit, these changes are designed to make them easier to deploy during normal build cycles.*
* **Base HP up:** `900 => 1080 (+20%)` To match changes happening to HW1 mines
* **Cost down:** `800 => 600 (-25%)`
* **Build time down:** `45 => 40 (-9%)`
* **Max speed up:** `233 => 270 (+16%)`
* **No damage penalty in evasive:** `0.9 => 1.0 (+9%)` See nerfs section about more of these changes and why they happened.
* **Regeneration added:** `0 => 240` To compensate for changes happening to dock healing (see nerfs). Fully healed in 4 minutes.
### Minelayer Research
* **Cost down:** `750 => 600 (-20%)`
* **Research time down:** `40 => 30 (-25%)`
### Torpedo Frigates
*Currently consigned to killing collectors only, torpedo frigates are fine by the numbers: however some minimal micro from your opponent will leave you wishing you never built a frigate facility. HW2 collectors and most vettes can **outrun** current torpedo missiles. No more!*
* **Base cluster torpedo speed up:** `250 => 320 (+28%)` (*`hgn_clustertorpedoa.miss`*)
* **Breakaway cluster torpedo speed up:** `250 => 420 (+68%)` (*`hgn_clustertorpedob.miss`*)
* **Long range (anti-frigate) torpedo speed up:** `250 => 320 (+28%)` (*`hgn_longrangetorpedo.miss`*)
### Defence Field Frigates
*Already slow to build and expensive, this is one unit which should reward quick reactions. Currently defence fields struggle to keep up with the action due to low agility. Upping these values rewards an attentive user.*
* **Max rotation speed:** `22 => 30 (36%)`
* **Rotation accel time:** `0.75 => 0.5 (-33%)`
### Destroyers
*Destroyers are currently not worth the build time; even their relatively high HP value is offset by a 165 second build time: ion cannons build *more than three times faster*, from easier to build (and more plentiful) queues, and whats worse: four ions are already a match for the HP a destroyer represents. Factor in other options such as ion platforms, battlecruisers and pulsars, and destroyers are simply outclassed on all fronts. Rather than compete with these other units and try to overlap their roles, these changes attempt to buff destroyers while keeping their identity unique.*
* **Regeneration time down:** `1074 => 750 (-30%)` This translates to HP per second: `110.8 => 158.7 (+43%)`. High HP with a relatively low DPS *at high range* puts destroyers in an interesting (and mostly unique) position. A group of 2 or more destroyers is able to handle frigates and other destroyers extremely effectively if kited correctly (imagine a cycle of destroyers moving forwards and backwards). Upping their regeneration allows them identify themselves in this role, and provides value to the unit without forcing them to overlap into a DPS role already occupied by so many other units.
* **Damage multiplier vs collectors up:** `0.7 => 1.0 (+42%)` (*`hgn_kineticburstcannondestroyer.wepn`*) Destroyers are currently underperforming against collectors. Jumping a destroyer at an angle / through a gap in inhibs in order to snipe collectors is an old style which is currently never used. This is *partly* because of their other issues, however collectors (especially upgraded HW2 collectors) are shrugging off the damage coming from a super-capital ship too easily.
* **Long range (anti-frigate) torpedo speed up:** `250 => 320 (+28%)` (*`hgn_longrangetorpedo.miss`*)
### Interceptors
*Doing fine, however struggling to follow up a clear sky with good econ damage*
* **Damage multiplier vs collectors slightly up:** `0.33 => 0.5 (+51%)` (*`hgn_kineticautogun.wepn`*) Unscouted int rushes should hurt. Being flanked should hurt.
### Bombers
*Same as ints*
* **Damage multiplier vs collectors slightly up:** `0.17 => 0.25 (+32%)` (*`hgn_antishipbomblauncher.wepn`*) Same as ints, minus the rush?
### Probes
*No reason not to.*
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`
### Proximity Probes
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`
### Sensor Distortion Probes
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`
* **Base HP up:** `400 => 800 (+100%)`


## Nerfs

### Strikecraft Dock Healing
*Since the #666 fix, HW1 strike have suddenly run out of advantages to lever over their HW2 counterparts. This means an unmicroed fight will usually come out even as expected, but any decent HW2 player will be using dock micro to replenish and heal their squadrons. To tone down this advantage somewhat, the time taken to heal is going up for fighters and corvettes. Due to the mechanics of dock healing in HW, a single calculated value determines the times for all units in a class, and this value is inversely proportional to squad size. This means smaller squads have always healed slower.*
* **Time taken for fighter recovery up:**
  * **Scouts:** `0.86 => 10 (+1062%)`
  * **Interceptors:** `0.5 => 6 (+1100%)` Other fighter times are balanced around ensuring Vgr AC and Hgn int both take 6s
  * **Bombers:** `0.69 => 8.3 (1103%)`
* **Time taken for corvette recovery up:**
  * **Gunships and Pulsars (no upgrade):** `2.1 => 5 (+138%)`  Other vette times are balanced around ensuring Vgr missile and Hgn pulsar both take 5s base
  * **Gunships and Pulsars (upgrade):** `3.2 => 7.5 (+134%)`
  * **Minelayers:** `12 => 33.75 (+181%)` HP increase (below) is factored in
### Bombers
*Counter subystems? Sure. Counter frigates? Sure. Counter capitals? Sure. Counter corvettes? Hmm.*
* **Damage multiplier vs corvetes down:**
  * vs `LightArmour`: `1.0 => 0.7 (-30%)`
  * vs `LightArmour_hw1`: `1.15 => 0.8 (-30%)`
### Minelayers
*Weapons no longer affected by any stance - minelayers wanted to be evasive to lay mines faster, but also aggressive for a damage boost. Easiest resolution: no damage modifiers.*
* **Aggressive stance damage multiplier removed:** `1.32 => 1.0 (-24%)` This value of `1.32` is the product of the `WEAPONDAMAGE` and `DAMAGEAPPLIED` modifiers which were `1.2` and `1.1` respectively.
* **Aggressive stance mine speed multiplier removed** `1.1 => 1.0 (-9%)`
### Pulsar Corvettes
*Currently the focal point of Hiigaran play (in part due to corvettes being so amazing in general now), pulsars have too much power in too many scenarios. Distributing some of this power to torpedoes and destroyers is a healthier solution*
* **Damage multiplier vs frigates slightly down:** `1.5 => 1.38 (-8%)` (*`hgn_pulsar.wepn`*) Hiigaran have many options for dealing with frigates - most of them are designed for this role and are simply underpowered. Pulsars should not act as a bandaid for underperforming partners.
* **Damage multiplier vs collectors down:** `0.59 => 0.4 (-32%)` (*`hgn_pulsar.wepn`*) There is no reason for pulsars to perform this well against collectors. They are already outperforming most other vettes (except missiles) in this role whilst also outperforming most other vettes in most other roles. Generalist units are fine, but not to this extent.
### Scouts
*Part of a larger problem in HWR, scouts are currently waypointable to provide extremely hard to kill vision for a low cost and low attention investment.*
* **Primary sensor radius down (blue sphere in manager):** `9000 => 6500 (-27%)`
* **Secondary sensor radius down (works the same, but invisible):** `11000 => 8030 (-27%)` 11000 is almost as high as a probe (`12000`) - way too high.
### Mobile Refineries
*Losing refineries due to poor scouting/defence is currently a minor annoyance at best. Incentivising refinery snipes on smaller maps leads to less linear gameplay.*
* **Cost up:** `800 => 1000 (+25%)`
### Mobile Refinery Armor Upgrade
*In the same vein as the price hike for building refineries, the cost of upgrading this unit is stunningly low. This is currently a 'why not?' upgrade; there is no investment being made.*
* **Cost up:** `400 => 1000 (+150%)`
* **Research time up:** `60 => 75 (+25%)`
### Resource Collectors
*Not a torpedo.*
* **Kamikazi damage multiplier down:** `1.0 => 0.6 (-40%)`
### Resource Collector Armor Upgrade
*Collectors are currently shrugging off harrassment damage with no problems - harrassment is an attention-intensive option for the harrasser, so it should be for the harrassed also. Tanky workers mean the defender has far less to worry about, and the harrasser will find their return-on-investment depressingly low. Fighters in particular trade quite poorly against even a single layer of hull defence.*
* **Upgrade HP down:** `5000 => 4000 (-20%)`
