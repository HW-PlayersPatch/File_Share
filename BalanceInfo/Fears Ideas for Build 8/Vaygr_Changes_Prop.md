Note: All proposed changes are suggestions/ideas, until deemed final.

# Vaygr

Generally reckoned to be the best race on large maps, Vaygr gameplay is currently consigned to a linear `SCOUT -> MACRO -> BUILD -> PUSH` playstyle. In this domain they are certainly top dog, to the point where the other races stuggle to prevent the macro machine from running out of control.

In addition to nerfing and adding weak points to the unstoppable macro engine, theses changes also attempt to open up more variety in Vaygr play - not just units, but playstyles as well.

## Buffs

### Flagship
*Makaan has tried to make up for his lack of Hyperspace Cores with slightly faster engines. Power to him.*
* **Max speed up:** `40 => 42 (+5%)` The meaning of life
* **Acceleration time down:** `8 => 6 (-25%)`
* **Max rotation speed up:** `4 => 8 (+100%)`
* **Rotation brake time down:** `0.4 => 0.2 (-50%)`

### Hyperspace Gates
*A 'never used' unit, the hyperspace gate struggles to offer any tangeble advantages in comparison to close production or regular jumps - not only are gates time-intensive to build (1m30s to build a pair), the cost of opening a gate isn't negligable (especially with rolling build queues in HWR, stockpiling 1000 RUs can be quite an annoyance). In addition, the gates themselves can be blocked by inhibs (simply inherent to HS), and are easily sniped.*
* **Build time down:** `45 => 20 (-55%)`
* **Move speed up:** `650 => 750 (+15%)`
* **Cost to link:** `1000 => 700 (-30%)`
* **Base HP up:** `18500 => 20000 (+8%)`
* **Regenerate quickly:** `1200 => 210 (-85%)`

### Minelayer Corvettes
*A 'never used' unit, the minelayer is capable of higher DPS than any other strikecraft. However, the slow build times and inconvenience of having to research an extra vette type of dubious effectiveness means minelayers are never on the table (that, and they clash with laser vettes somewhat). Minelayers have great potential as a backstab unit, these changes are designed to make them easier to deploy during normal build cycles.*
* **Base HP up:** `900 => 1080 (+20%)` To match changes happening to HW1 mines
* **Cost down:** `800 => 600 (-25%)` Contrast with laser vettes: `650`
* **Build time down:** `45 => 40 (-9%)`
* **Max speed up:** `233 => 270 (+16%)`
* **Max rotation speed up:** `131 => 171 (+31%)` These agility changes are to match the Vaygr minelayer with the Hiigaran one
* **Engine acceleration time down:** `3 => 2.6 (-13%)`
* **No damage penalty in evasive:** `0.9 => 1.0 (+9%)` See nerfs section about more of these changes and why they happened.
* **Regeneration added:** `0 => 240` To compensate for changes happening to dock healing (see nerfs). Fully healed in 4 minutes.

### Command Corvettes
* **Regeneration added:** `0 => 240` To compensate for changes happening to dock healing (see nerfs). Fully healed in 4 minutes.

### Destroyers
*Straddling the line between 'never used' and 'sometimes okay?', Vaygr destroyers are certainly more viable than their Hiigaran counterparts (largely due to easy access to imp. manufacturing), however they are still somewhat less desirable than their HW1 counterparts. Moreover, they are much worse in their role than HMFs (who are so spammable they represent more HP AND more DPS per unit time in a typical game) and especially laser corvettes, who are immune / highly resistant to most frigates and completely wipe them off the map in turn. Rather than compete with these other units and try to overlap their roles, these changes attempt to buff destroyers while keeping their identity unique.*
* **Regeneration time down:** `1074 => 750 (-30%)` This translates to HP per second: `110.8 => 158.7 (+43%)`. High HP with a relatively low DPS at high range puts destroyers in an interesting (and mostly unique) position. A group of 2 or more destroyers is able to handle frigates and other destroyers extremely effectively if kited correctly (imagine a cycle of destroyers moving forwards and backwards). Upping their regeneration allows them identify themselves in this role, and provides value to the unit without forcing them to overlap into a DPS role already occupied by so many other units.

### Missile Corvettes
*Nerfed against fighters in the current version of 2.3, missile vettes currently take decades to clear HW1 fighters (in part due to their lack of close formations). This buff aims to level missile vette performance against all fighters.*
* **Missile explosion damage up vs HW1 fighters:** `0.7 => 0.155 (+121%)`
* **Missile explosion damage up vs HW1 corvettes:** `0.2 => 0.85 (+325%)` Losing to multiguns isn't a good look

### Laser Corvettes
*This update aims to have a neat ladder of anti-heavy corvettes looking like so: Lasers > Heavies > Pulsars. Currently, lasers are often tying with pulsars, and are always outperformed by heavies. Buffs to bring this unit out of the gutter once and for all (hopefully)*
* **Damage multiplier vs frigates up:** `0.85 => 1.2 (+41%)`
* **Damage multiplier vs capitals up:** `0.51 => 0.8 (+56%)`

### Assault Craft
*Doing fine, however struggling to follow up a clear sky with good econ damage*
* **Damage multiplier vs collectors slightly up:** `0.33 => 0.5 (+51%)` (*`vgr_flechettecannon.wepn`*) Unscouted int rushes should hurt. Being flanked should hurt.

### Bombers
*Same as ints*
* **Damage multiplier vs collectors slightly up:** `0.17 => 0.3 (+76%)` (*`vgr_antishipbomblauncher.wepn`*) Same as ints, minus the rush?

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
* **Time taken for fighter recovery up (repair factor down: `36 => 15/7 (-94%)`):**
  * **Scouts:** `0.83 => 14 (+1587%)`
  * **Assault Craft:** `0.36 => 6 (+1567%)` Other fighter times are balanced around ensuring Vgr AC and Hgn int both take 6s
  * **Lances:** `0.5 => 8.4 (+1580%)`
  * **Bombers:** `0.53 => 9.01 (1600%)`
* **Time taken for corvette recovery up (repair factor down: `75 => 24 (-68%)`:**
  * **Missiles and Lasers (no upgrade):** `1.6 => 5 (+138%)` Other vette times are balanced around ensuring Vgr missile and Hgn pulsar both take 5s base
  * **Missiles and Lasers (upgrade):** `2.4 => 7.5 (+115%)`
  * **Command vettes (no upgrade):** `12 => 37.5 (+213%)`
  * **Command vettes (upgrade):** `18 => 56.3 (+213%)`
  * **Minelayers (no upgrade):** `12 => 45 (+275%)` HP increase (below) is factored in
  * **Minelayers (upgrade):** `18 => 67.5 (+275%)` HP increase (below) is factored in

### Improved Manufacturing (Carriers)
*One of the most oppressive aspects of facing a Vaygr player is attempting to keep up with their production. Vaygr have the fastest building and cheapest carriers in the game, which is a core tenet of their playstyle - however, the decision of 'carrier or not to carrier' is largely answered for the Vaygr player by the presence of a cheap, easy-access upgrade which they can use to superdrive their production even further. Since Vaygr will almost always have **more** carriers, this upgrade will naturally effect more ships. This, in tandem with its easy access, is too overbearing to deal with. (FYI, all imp. manufacturing upgrades are a 1.3x multiplier)*
* **Cost up:** `1500 => 2000 (+33%)`
* **Research time up:** `100 => 120 (+20%)`

### Lance Fighters
*Slightly too good against fighters. This was always supposed to be a niche unit, these changes solidify this identity for lance fighters.*
* **Weapon changes:**
  * (*`vgr_lightplasmalance.wepn`*):
  * **Damage multiplier vs fighters down:**
    * vs `Unarmored`: `0.3 => 0.2 (-33%)`
    * vs `Unarmoured_hw1`: `0.4 => 0.35 (-13%)`
  * **Accuracy multiplier vs fighters down:**
    * vs `Fighter`: `0.1 => 0.05 (-50%)`
    * vs `Fighter_hw1`: `0.1 => 0.06 (-40%)`
  * **Damage multiplier vs HW1 corvettes up:**
    * vs `LightArmour_hw1`: `0.55 => 0.7 (+27%)`

### Bombers
*Counter subystems? Sure. Counter frigates? Sure. Counter capitals? Sure. Counter corvettes? Hmm.*
* **Damage multiplier vs corvetes down:**
  * vs `LightArmour`: `1.0 => 0.7 (-30%)`
  * vs `LightArmour_hw1`: `1.15 => 0.8 (-30%)`
	
### Minelayers
*Weapons no longer affected by any stance - minelayers wanted to be evasive to lay mines faster, but also aggressive for a damage boost. Easiest resolution: no damage modifiers.*
* **Aggressive stance damage multiplier removed:** `1.32 => 1.0 (-24%)` This value of `1.32` is the product of the `WEAPONDAMAGE` and `DAMAGEAPPLIED` modifiers which were `1.2` and `1.1` respectively.
* **Aggressive stance mine speed multiplier removed** `1.1 => 1.0 (-9%)`
* **Strafe acceleration time up:** `1 => 2.6 (+126%)` These agility changes are to match the Vaygr minelayer with the Hiigaran one
* **Rotation acceleration time up:** `0.2 => 0.6 (+200%)`
* **Rotation brake time up:** `0.2 => 0.3 (+50%)`

### Missile Corvettes
*Missile corvettes utterly wipe collectors off the face of the galaxy. No unit even comes close to their collector kill speed. Combined with their high survivability, missile vettes are **slightly** too good in this role.*
* **Damage multiplier vs collectors slightly down:** `1.0 => 0.9` (*`vgr_concussionmissilelauncher.wepn`*)

### Scouts
*Part of a larger problem in HWR, scouts are currently waypointable to provide extremely hard to kill vision for a low cost and low attention investment.*
* **Primary sensor radius down (blue sphere in manager):** `8000 => 6500 (-18%)`
* **Secondary sensor radius down (works the same, but invisible):** `11000 => 8030 (-27%)` 11000 is almost as high as a probe (`12000`) - way too high.

### EMP
*Vaygr scouts have access to a the superior EMP - so superior, that other races have to behave extremely cautiously around a Vaygr swarm, to the point where it forces a lot of actions on the opponents end in comparison to the Vaygr player's end. This is fine by itself, however:*
* *EMP is cheap enough to the point where its a guaranteed factor in a non-rush game*
* *Vaygr swarm performs well enough without it*
* *Vaygr are already superior in other unit classes*
* *It introduces extra volatility into an already volatile game*

*Removing EMP or changing its mechanics would be short sighted - this is a still a skill-based ability which should reward a player for correct positioning and timing, however it is simply too oppressive, especially for races trying to prevent Vaygr macro from spiralling out of control. Instead of changing EMP itself, some peripheral factors are changing, such as scout EMP shielding (so they stun themselves more easily, making EMP have an associated risk for its reward).*
* **Cost up:** `1500 => 2000 (+33%)` Having unrivalled dominance in fighter battles should come with a price tag.
* **Research time up:** `70 => 80 (+14%)` It should also be pre-meditated.

### Mobile Refineries
*Losing refineries due to poor scouting/defence is currently a minor annoyance at best. Incentivising refinery snipes on smaller maps leads to less linear gameplay.*
* **Cost up:** `800 => 1000 (+25%)`

### Resource Collectors
*Very slightly supercharged, this change brings Vaygr collectors back in line with the other races. Also, not a torpedo.*
* **RU capacity down slightly:** `208 => 200 (-4%)`
* **Kamikazi damage multiplier down:** `1.0 => 0.6 (-40%)`

### Utility Armour Upgrade
*Collectors are currently shrugging off harrassment damage with no problems - harrassment requires planning, decision making, calculation and multitasking for the harrasser, so it should demand these things from the defender too. Tanky workers mean the defender has far less to worry about (sometimes nothing at all), and the harrasser will find their return-on-investment depressingly low. Fighters in particular trade quite poorly against even a single layer of hull defence. Vaygr in particular should be weak to economic harrass, as their core strength is overwhelming their opponent with a superior economy - opponents should be able to exploit a sloppy Vaygr player's lack of defensive foresight.*
* **Upgrade HP down:** `5000 => 4000 (-20%)`
