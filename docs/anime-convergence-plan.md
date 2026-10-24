# Anime Convergence (Roblox auto battler) – Full Plan

Status: draft, planned in a cloud session; building will happen in a separate environment with Roblox tooling.
Legend: "User:" = decision or wording from the user. [Inference] / [Speculation] / [Unverified] = my labels. "Proposal" = my idea, not approved.

## 1. Vision
A PvE anime auto battler on Roblox (User: instead of classic ATD). Gacha units, trait system, Demon Slayer as the first update with an expanded Infinity Castle. Not meant to read like Anime Rangers X (User).

Core loop (User):
- 5v5. Team stays fixed during a run, no shop.
- Grid placement.
- The player progresses up a map. Enemies are spread out in groups (about 25 enemies total, roughly 5 groups of 5; confirmed by user).
- Units fight automatically. When a group dies, the player recalls units. Damage persists. Units are placed again to fight the next group.
- A round lasts until all enemies are gone and should not last too long.
- Enemies scale up with the player's unit strength, not down (User: "loosely").

[Inference] Risks: no longer an ATD (audience expectation), synergy balance is harder, units need combat AI, and the persistent-damage hook must stay fun rather than just tedious.

Characters: existing anime IP. User accepts the risk. [Unverified] takedown/ban risk, worse with paid gacha.

## 2. Research basis (Balakay transcripts; one creator's opinion)
| Complaint | Source video | Design response |
|---|---|---|
| 1-placement 250% trait makes other traits useless | Galaxies | Traits balanced as a hierarchy; class fit; pick-rate telemetry |
| Gambling OK, broken 0.1% chase is the problem | Galaxies | Pity-based pulls; mythic-only traits with equal odds |
| Autoplay beat the whole game | Galaxies | Autoplay has upgrades but no abilities; abilities are strong and manual |
| 2x gems/gold paywall = "greedy" | Galaxies | Free speed toggle, no paywalled income multipliers |
| Samey unit passives | Galaxies | Passives matter on big units, kept simple |
| 3-4h boring grind to unlock a unit | Vanguards | Short, hard unlock challenges |
| Months spent on one unit | Vanguards | Roadmap spreads effort across units/modes |
| Damage and HP divided by 10, powercreep unfixed | Vanguards | Scheduled, bounded powercreep with rebalance patches |
| Raid HP up, drops unchanged | Vanguards | Change drops with any difficulty change |
| New mode has no tutorial | Vanguards | Tutorial per mechanic/mode |
| Fake choice (Daggers of Destruction 99%) | Vanguards | Same pick-rate rule |

## 3. Combat and run structure

### 3.1 Run flow
1. Pick a 5-unit team (fixed for the run).
2. Enter a map. Enemy groups sit along the route.
3. Place units on the grid, fight automatically.
4. Group cleared: recall units (player or autoplay). Damage persists.
5. Re-place units, next group. Repeat until the map's enemies are gone.
6. Rewards.

### 3.2 Enemies
- ~25 enemies total per round, in groups.
- Scale up with unit strength, never down (User). [Inference] The floor keeps weak teams facing baseline enemies so rarity gaps stay visible; stronger teams face harder enemies and need better rewards.
- Boss enemies: reduced percent-damage effects and Control resistance (see traits).
- Enemy types (User): same types as player units (tank, DPS, medic, debuffs, AoE, DoT, etc.).
- Bosses (User): stronger, with 1-2 passives.
- [Inference] Mirroring player unit types lets enemies reuse unit code and models, which cuts scope.

### 3.3 Autoplay and abilities
User decisions:
- Autoplay is available everywhere and has upgrades but no abilities.
- Abilities are player-triggered. There is an autocast toggle. It is not locked, but autoplay never enables it. A player can enable it, but then they are playing or running an external macro.
- The autocast toggle resets every run.
- Easy grinds should not need abilities; abilities are "exclusive and strong".
- Recall: both the player and autoplay can recall. Autoplay recalls once the enemies die.
- Autoplay is deliberately weaker on hard stages.

[Inference] Autoplay still has to decide placement and recall, which is where it should fall behind a human on hard content.
[Unverified] Roblox rules on macros/automation; check before building anti-macro measures.

### 3.4b Shop potions (approved by user; potions only, no temporary equipment)
Bought with in-run cash (per-wave cash ~1000). Not available in Gauntlet. Autoplay does not buy them.

| Potion | Effect (one unit) | Price |
|---|---|---|
| Stamina Tonic | -30% tiredness | 600 |
| Power Elixir | +25% damage for the next group | 800 |
| Haste Draught | -20% SPA (faster) for the next group | 800 |
| Healing Potion | Heal 30% max HP | 600 |
| Skip Scroll (User: "possible", e.g. skip round) | Skip the next enemy group | 3000, max 1 per run |

[Inference] Skip Scroll: skipping a group should give no loot from it, or it becomes a free loot shortcut. Healing Potion adds a third heal source beside medics and sitting out; the price is the limiter.

### 3.4 Economy
- Per-wave cash is a set number (about 1000 as a starting guess, User).
- Team stays fixed (no unit shop), but a shop sells potions (potions only, no temporary equipment) for in-run cash (User). [Inference] Keep it in-run cash only; Robux-bought potions would hit Balakay's "greedy" complaint.
- Shop uses in-run cash only (User). Cash also buys unit upgrades (User). Autoplay does not use the shop (User).

### 3.5 Health, bench, tiredness (User)
- Bench: 2 units in reserve (5 on field + 2 reserve).
- Recall does not heal.
- Sitting out heals 20% per round.
- Healing sources: medics and sitting out. No revive (User: two forms of healing is enough). A unit at 0 HP stays down for the run.
- SPA sets how often a unit moves (and acts): high SPA = slow, low SPA = fast.
- Tiredness bar (nerfs SPA as it fills):

| Event | Tiredness |
|---|---|
| Each move | +3% |
| Each kill | +5% |
| Taking damage | +7.5% |
| Recall | -10% |
| Upgrade | -5% |
| Sitting out | -40% per round |

- Taking damage is per hit (User). Tanks have 30% natural tiredness resistance (User).
- Taunt rule (User): tanks must be killed before any other unit can be attacked, for both sides.
  - AoE can hit units behind a living tank (User). With multiple tanks, any of them can be targeted (User). Bosses are not tanks (User).
  - Enemies get every option players have: debuffs, healers, AoE, DoT, etc. (User).
  - Lifesteal is a passive (trait), not an active heal source (User).
  - Tanks naturally have high SPA, so they only get ~1-2 hits per round (User); lifesteal tank stall is low risk.
  - No stacking traits (User; one trait per unit).
  - Boss wave (User): boss + 4 DPS, no tank, no healer.
  - Anti-heal (User): units with anti-heal heal 50% less, both healing themselves (incl. lifesteal) and others. Lasts 2 turns. Both sides. Confirmed (User): 50% less replaces the earlier 'blocks lifesteal'; you counter an enemy medic by debuffing the medic.
  - [Inference] Barrage at 50%: vs 5 enemies, 0.5 x 5 = 2.5x total damage, below the Damage trait's 4x single target. It still passes tanks (AoE). Playtest.
  - [Inference] Three classless traits (Damage, Barrage, Control) get no 20% class bonus for anyone; the class system now covers fewer traits.
- Tired effect (User): at 75%+ the unit skips every other turn. SPA nerf: "divide the tired bar by 2, then multiply that number onto the spa." Confirmed (User: "Slower"): SPA x (1 + bar/2), so 100% tired = 1.5x SPA. Skip-turn plus SPA nerf at 75%+ stacks on purpose (User).
- No extra tiredness reduction for low-SPA / SPA-trait units (User): they tire faster, but a multiplier on a low SPA is a smaller absolute nerf, which compensates.

Review flags ([Inference]):
- +7.5% per hit: handled for tanks by natural resistance; other units hit often (melee) still tire fast.
- Recall happens after every group, so -10% is a guaranteed reset each group; the real tiredness budget is per group.
- Effect at 100% tired is undefined (how much SPA nerf, any other penalty).
- Many systems (HP, bench, tiredness, shop) need tutorials and autoplay logic for each.

## 4. Units
- Roles (proposal): Shooter, Burst, Area, Wall, Support/Medic, Economy, Control.
- Classes (User): each unit has a class that corresponds to a trait; matching class and trait makes the trait 20% stronger. Classes given: Speedster, Ranger, Controller, Specialist, Punisher, etc.
- Passives (User): matter for big units; not "anime last stand" style with about 5 complex passives.
- One trait per unit (User).
- Medic (User): a unit, with several types (buff-oriented, pure heal, cleanser, etc.), so no single default medic. [Inference] With persistent damage, healing is close to mandatory, so medic types must have clear tradeoffs.
- Class-to-trait map (User): Punisher→Lifesteal. Ranger and Controller classes removed. Classless traits: Damage ("such a high buff"), Barrage, Control. Tank is a unit type, not a class (User). Medic is a class with no trait bonus. Rest is proposal: Speedster→SPA, Specialist→Contagious, Economy→Farm, Balanced→All rounder.

## 5. Rarity and powercreep
User decisions:
- "There should be seen gaps between the rarities, because if a common can technically beat the game, why would anyone go for a mythic."
- Powercreep is wanted but balanced; a Common should not equal a Mythic given the grind.
- Commons shouldn't be used permanently: content gating plus evolve/fodder use.
- Rarity power and trait power multiply.

| Rarity | Intent |
|---|---|
| Common | Clears early content; falls off in hard content; evolve/fodder material |
| Rare | Clears normal content; viable early hard |
| Epic | Clears hard |
| Legendary | Between Epic and Mythic (User: new tier) |
| Mythic | Needed for top-end content |

Power numbers (User):
- No set rate per tier; each unit has its own base stats. Example given: Common ~50, Mythic ~375 base DPS; later raised for bigger gaps (see next line).
- All Mythics around the same power level; a small hierarchy or niche units is fine.
- No cap on combined rarity x trait x equipment. Enemies are balanced around units, not the other way around. "Monkey brain likes big number."
- DPS ladder (User chose more gap, Mythic raised): Common ~50, Rare ~110, Epic ~220, Legendary ~420, Mythic ~800 base DPS. Roughly 2x per tier; individual units vary around these.

[Inference] Risks: no cap plus ongoing powercreep inflates numbers over time (Balakay mentioned ALS reaching billions/trillions, and disliked Vanguards dividing everything by 10 to fix it). Plan number formatting (K/M/B) from day one. Balancing enemies around top units can leave weaker accounts behind; the heist/scaling floor helps.

Balance rules:
1. Pick-rate telemetry per unit and trait; above 40% of top-tier clears gets reviewed (starting guess).
2. Every unit has a clear weakness.
3. Quarterly rebalance patch.
4. New units ship with counter content.

## 6. Traits
User: only mythic traits; all trait rarities equal, but a trait matching the unit's class has double chance. The player picks the trait on the 3rd roll on the same unit (was 5). Example odds (User): class-matched trait 20%, every other trait 10% (other traits lowered to compensate). [Inference] That example has 9 entries, but there are 8 traits (Farm, Lifesteal, Damage, SPA, Control, Contagious, All rounder, Barrage); with 8 traits the same 2:1 weighting is 22.2% / 11.1%. Units with no class-matched trait (e.g. Medic): 12.5% each. Confirmed (User): 22.2% / 11.1% / 12.5% with 8 traits. Rolls come from codes (1-2 per code, restricted to updates) and challenges. Traits also come from story. One trait per unit. Goal: a hierarchy of traits, but no default trait that nearly every unit runs.

| Trait | Definition |
|---|---|
| Farm | 30% money applies only to units whose sole purpose is to generate income. Per-wave cash is a set number. Kills made by the unit with the Farm trait give double cash. Doubling applies only when a unit that does not generate cash has the trait and is on the field killing |
| Lifesteal (replaces Range, User) | 20% of damage dealt is returned as health; halved by anti-heal (User) |
| Barrage (User; classless) | 50% damage nerf (was 30%); every attack hits all targets |
| Damage | "300% damage boost, no passives allowed" |
| SPA | "Cuts SPA in half, nerfs all other stats by 20%" (attacks twice as often) |
| Control | "each hit applies random debuff effect"; bosses resist |
| Contagious (1 per team) | Reworked: no spread; the marked enemy takes 25% of max HP (5% of max HP for bosses); slow dropped; no proc limit (rounds are short) |
| All rounder | "buff all stats by 20%" (SPA shortened too) |

Review flags ([Inference]):
- Chosen-trait pick on the 3rd roll is the Galaxies pattern in cheaper form: everyone can pick the best trait. The hierarchy depends on traits being close in power and on class fit.
- Damage trait stays at 300% (User: keep).
- Contagious at 25% max HP with no proc limit kills normal enemies in four hits; revisit in playtest.
- Farm is only useful if cash matters in a run with no shop.
- 3 rolls per unit is cheap; class-match double chance mostly matters for the first 2 rolls; codes and challenges must supply them without making them trivial.

## 7. Gacha
- Gems earnable free (stage clears, daily, challenges); optional paid packs.
- Unit pity: Mythic at 200 pulls, Mythic rate 1%; Legendary at 40 pulls (User).
- Rate-up banner rotates, carrying one featured unit.
- Duplicates convert to upgrade shards (small, capped); Commons also usable as evolve fodder.
- Odds shown in the summon screen.

## 8. Modes (brainstorm; proposals, not decided)
User: unique game modes, traits, and units; challenges play into the "oddity" idea.

- Infinity Castle (first update, Demon Slayer): endless floors up the map. Ideas: floor modifiers (one rule per floor), a boss every 10th floor, persistent damage across floors with limited recovery.
- Rest sites between groups (like a campfire): heal part of the team or take a buff, costs something.
- Branching map (User: in): both sides random, drawn from multiple enemy squad presets; no fixed hard side vs weak side. [Inference] It is a coin flip rather than a decision; acceptable if the goal is variety (and resisting macros), not choice.
- Daily oddity: one rule set per day (e.g. no medics, double enemy speed) with bonus rolls.
- Ghost duels: fight another player's saved team asynchronously, no live PvP netcode needed.
- Raid boss: a large boss fight with abilities mattering most.
- Gauntlet (User: a difficulty level): no shop, no heals, 1.5x tiredness, 250% luck boost on all drops in the stage.
  - 250% luck = 2.5x (User). User: Gauntlet is "practically unmatchable", requires really good units, and that is fair.
  - [Inference] Only top teams can farm 2.5x drops, so the strongest players get stronger faster (rich-get-richer); watch the gap in playtest.
- Counter pick: enemy composition reacts to the class you used most.

## 9b. Art style (User)
- Blocky Roblox characters, semi-high quality. Target: Anime Last Stand level. Not Anime Vanguards level (too high quality for what is needed).
- [Inference] Supports the Vanguards feedback: commenters called the high-poly Sung Jin-woo model uncanny in Roblox.
- References: Anime Last Stand on Roblox (https://www.roblox.com/games/12886143095/Anime-Last-Stand) and its fan wiki (https://alsroblox.fandom.com/wiki/Units).
- ALS game thumbnails (Roblox thumbnails API, viewed 2026-10-24):
  - https://tr.rbxcdn.com/180DAY-a2d20bf051ff960d44f7805f9e029890/768/432/Image/Png/noFilter
  - https://tr.rbxcdn.com/180DAY-d8eb9578cfac15acb64f0becc1c201b3/768/432/Image/Png/noFilter
  - https://tr.rbxcdn.com/180DAY-e7f6ccfca8c0a789f9b351a6b9251767/768/432/Image/Png/noFilter
  - https://tr.rbxcdn.com/180DAY-30f013a8379e2b1f7a53002ed2a98dab/768/432/Image/Png/noFilter
- What the thumbnails show (my reading; these are marketing art, so in-game models are likely simpler):
  - Blocky Roblox bodies with custom anime hair, accessories, and hand-drawn anime faces (expressive eyes, gritted teeth).
  - Very saturated colors, heavy glow, particles, and energy effects.
  - Bold chrome/gradient logo text with outlines.
  - Layout: square art centered on a blurred, enlarged copy of itself.
  - Two of four look painted/illustrated rather than rendered.
- In-game model references (fan wikis, viewed 2026-10-24 via the MediaWiki API):
  - Anime Last Stand (target): https://alsroblox.fandom.com/wiki/File:Saitama_in_game.png, https://alsroblox.fandom.com/wiki/File:Sukuna_in_game.png, https://alsroblox.fandom.com/wiki/File:Whitebeard_in_game.png, https://alsroblox.fandom.com/wiki/File:Zuffy(TimeSkip)Model.png, https://alsroblox.fandom.com/wiki/File:Vagata(Super)Model.png, https://alsroblox.fandom.com/wiki/File:Frieren-new-model.png, https://alsroblox.fandom.com/wiki/File:Kokushibo-CB.png, https://alsroblox.fandom.com/wiki/File:RengokuEvo-CB.png, https://alsroblox.fandom.com/wiki/File:NEWSukunaCB.png
  - Anime Adventures: https://animeadventures.fandom.com/wiki/File:Golden_King_(Lord_of_Heroes).png, https://animeadventures.fandom.com/wiki/File:Sea_God_(Tyrant_of_the_Seas).png, https://animeadventures.fandom.com/wiki/File:Spearer_(Child_of_Light).png, https://animeadventures.fandom.com/wiki/File:Illusionist_(Fusion).png
  - Anime Defenders: https://animedefenders.fandom.com/wiki/File:Jadefire_knight_model.png, https://animedefenders.fandom.com/wiki/File:Ocean_Guardian.png, https://animedefenders.fandom.com/wiki/File:Electric_Cyborg1.png
  - Anime Vanguards (contrast, what NOT to aim for): https://animevanguards.fandom.com/wiki/File:Lord_Friezo_Golden_Model.png, https://animevanguards.fandom.com/wiki/File:Riner_Giant_Model.png, https://animevanguards.fandom.com/wiki/File:Scientist_Model.png, https://animevanguards.fandom.com/wiki/File:Cu_Chulainn_(Child_of_Light)_Pose.png
- Art notes from these images (my reading):
  - Body: standard R6 blocky body (box limbs, square torso). Keep it.
  - Identity comes from 4 things: a big custom hair mesh, a 2D anime face decal (large eyes with highlights, clear expression), clothing textures with drawn shading (abs, folds, trims), and 1-3 signature accessories (hat, weapon, horns, mask).
  - Quality ladder: ALS 2024 models are simple; ALS 2025 card art and Anime Adventures have cel-shaded, more detailed faces and layered hair. Vanguards uses fully sculpted custom body meshes (golden Frieza-style body, giant titan), which is the level the user does not want; reserve that for giant bosses at most.
  - Evolved/shiny variants add aura glow and particles rather than new models.
  - ALS shows a ground ring under placed units.
- Naming pattern ([Inference]): every game checked uses parody names for licensed characters (ALS: Zuffy, Vagata, Kohan, Baldy, Strongest Sorcerer; Vanguards: Vogita, Lord Friezo, Alucord, Song Jinwu; Anime Adventures: Golden King, Experiment X; Anime Defenders: Muscular Sorcerer). This looks like the genre's standard way to lower takedown risk. Our roster uses real names (Zenitsu, Muzan, Gojo...). User accepted the IP risk; parody names are a cheap extra safeguard (question 15).

## 9. Monetization
- Free: 2x/3x speed, autoplay, UI options (colorblind mode, UI size).
- Paid: gem packs, cosmetics, convenience.
- Avoid: paywalled gem/gold multipliers.
- [Unverified] Roblox requires odds disclosure for paid random items and restricts some gambling-like mechanics; check current rules before launch.

## 10. Roadmap
| Phase | Deliverable |
|---|---|
| 0 | Resolve IP decision, name, art style, enemy design |
| 1 | Prototype: grid, 5v5 auto-combat, recall with persistent damage, 3 units, 1 enemy group |
| 2 | MVP: one map (~25 enemies), 6 units including a medic, traits, autoplay and ability toggle, tutorial, summon with pity, save data |
| 3 | Closed playtest + pick-rate telemetry; tune balance and enemy scaling |
| 4 | Launch (heavy, see 12): story, challenges, raid, daily/weekly heist, Infinity Castle with Demon Slayer units |
| 5 | Update 1 drops with release (User), i.e. launch = update 1 (Demon Slayer + Infinity Castle) |
| 6 | Cadence: small frequent updates, one rebalance patch per quarter |

Update principle: no single unit absorbs months of dev time.

Launch strategy (User):
- Heavy launch, since the project is vibecoded (AI-assisted).
- Market snapshot (live player counts, Roblox search/games API, 2026-10-24, one moment in time): Vanguards ~31.9k, Anime Adventures ~29.5k, Anime Expeditions ~1.5k, Anime Origins ~640, Anime Frontier ~540, Anime Galaxies ~470, Anime Last Stand 43, Re:Rangers X 24. [Inference] Two games hold most players; recent releases sit in the hundreds. ALS's art is the target, but the game itself has fallen off. ALS data: 1.08B visits, R6 avatars, not officially licensed, carries an "inspired content" disclaimer (precedent for the IP approach).
- Timing: not now; user says Anime Adventures is coming back (supported by the snapshot: ~29.5k live players). Best window: after competitors ship several flop updates or during a content drought.

[Inference] Risks:
- AI speeds up code, not balance testing, art, animation, Roblox data-save bugs, or playtesting. Bigger scope = more bugs at launch.
- Galaxies commenters criticized it for feeling "AI generated". Hand-made art and UI matter.
- A drought can't be predicted. Build now, keep a launch-ready build, pick the date by watching competitors.
- Proposal: define a cut line, so if the window opens early, the launch ships with the core and the rest becomes the first update.

## 12. Launch content and economy (User)
- Story: 3 stages x 5 acts.
- Challenges.
- One raid, any anime; capsules give 1-3 units from that anime; side content.
- Unit roster (User: cut filler; counts are my proposal): 4 Common, 4 Rare, 5 Epic, 3 Legendary, 13 Mythic = 29 units, varied anime (was 35: 8/6/6/5/10). All Demon Slayer units are Mythic.
- Infinity Castle (at launch): alternating buffs/debuffs per floor, gems per clear, no cap, enemies scale forever. Eventually too hard even for the best players; more unlocks per update via balanced powercreep.
- Demon Slayer units from Infinity Castle floor milestones: 5 Zenitsu, 10 Inosuke, 20 Giyu, 35 Douma, 50 Kokushibo, 100 Muzan.
- Daily heist: max 10 rounds; enemies start scaled under you and end over you; ~4 rounds beatable no matter what; 1k gems per round, boss +5k. May also give equipment materials.
- Summon cost: 250 gems. User: players who need summons get ~4-5k/day (16-20 pulls); rich players need them less.
- Trait rolls: challenges 1-3% drop, daily heist 10%, weekly heist guaranteed, plus codes. Pick on the 3rd roll per unit.
- Equipment: more customization; buffs stack on top of traits; crafted from story/raid/challenge resources. Prestigious equipment locked behind weekly heist; higher rounds give better chance.
- No stat rerolls.
- Weekly heist: same as daily heist, higher loot, resets weekly.
- Equipment slots: 3 (helmet, chest plate, weapon).
- Raid: 35% chance for 1-3 capsules. Capsules contain all currencies except trait rolls (materials count as currency); 10% chance for units.
- Infinity Castle: 1250 gems per floor on first clear (changed from 2500); repeats give 1/5 (250 gems = 1 pull).
- Gacha (User): Mythic rate 1%, Mythic pity 200 pulls (50k gems).
- Infinity Castle floor = 5 rounds; boss every 5 floors (User).
- User expects players to grind raids rather than repeat Infinity Castle floors (better payout per effort). [Unverified] prediction; raid gem payout is not yet defined.
- Mythic sources:
  - Infinity Castle (6): Zenitsu, Inosuke, Giyu, Douma, Kokushibo, Muzan.
  - Raid (2): Gojo, Sukuna (so the launch raid is Jujutsu Kaisen).
  - Banner (3): Sung Jin-woo (User) + 2 picked by me (proposal): Luffy (One Piece), Goku (Dragon Ball). Chosen for popularity and anime variety.
  - Raid gems (proposal): 300 gems per clear, plus the 35% capsule roll. Beats an Infinity Castle repeat (250). At ~5 min per clear: ~3.6k gems/hour (~14 pulls/hour), so Mythic pity (200 pulls) is ~14 hours of raid. Daily heist stays the best per-run payout.
  - Non-Mythic units (User): lesser-known characters from big anime; some may evolve into Mythics in later updates, giving them a future use. List below is my proposal (no Demon Slayer, since all Demon Slayer units are Mythic):
    - Current list and kits: see section 15.
  - Total 11 Mythics; user is increasing Mythic count because Common-Legendary units are filler that nobody uses past the first hour.

Flags ([Inference]):
- Mythic count rising (11+) while Common-Legendary are "filler" (User). Filler cut to 16 non-Mythics (User decision, counts proposed). [Inference] Give them a lasting job (evolve fodder, equipment materials).
- Most gacha pulls (99%) land on filler, and only 3 Mythics are on the banner while 8 come from content. The banner's main value is Sung Jin-woo + 2.
- Sung Jin-woo was the center of Balakay's Vanguards backlash; expect comparisons.
- Rarity x trait x equipment stack with no cap (User); enemies are tuned around them.
- Infinity Castle self-caps by difficulty, so gem inflation is limited; top players still earn most.
- Floor 100 Muzan is a top-player skill chase; Balakay liked hard unlock stages over long grinds.
- Prestigious gear behind high weekly rounds: rich-get-richer.
- Infinity Castle at 1250/floor: floor 20 = 25k (100 pulls), floor 100 = 125k (500 pulls = 2.5 Mythic pities). Repeats at 250/floor: if a floor takes ~5 min, that is ~12 pulls/hour, close to a full day of heist (16-20 pulls). Repeat farming may outpace heist; depends on floor length.
- 1% Mythic rate: about 13% of players reach the 200 pity without a Mythic (0.99^200). Pity = ~10-12 days of heist income.
- 1-3% trait-roll drops plus 3 rolls per unit = slow trait progress for most players (likely intended).

## 13. Equipment (approved by user)
User: 3 slots (helmet, chest plate, weapon); buffs stack on top of traits; crafted from story/raid/challenge materials; prestigious gear from the weekly heist (higher rounds = better chance). No stat rerolls.

Slot roles (proposal):
- Helmet = utility (tiredness, debuffs, healing).
- Chest = defense (HP, damage reduction).
- Weapon = offense (damage, SPA, crit).

Tiers: Basic (common materials), Advanced (raid/challenge materials), Prestigious (weekly heist only).
Rule: every piece has one upside and one downside, so there is no single best item (Balakay's "Daggers of Destruction 99%" complaint).

| Slot | Item | Upside | Downside |
|---|---|---|---|
| Helmet | Calm Band | -25% tiredness gain | -10% damage |
| Helmet | Clear Mind Mask | Debuffs on this unit last 1 turn less | -10% HP |
| Helmet | Healer's Hood | +25% healing done | +10% tiredness gain |
| Chest | Iron Plate | +25% HP | +15% SPA (slower) |
| Chest | Light Vest | -10% SPA (faster) | -15% HP |
| Chest | Thorn Mail | Reflect 10% damage taken | -20% healing received |
| Weapon | Heavy Blade | +25% damage | +15% SPA (slower) |
| Weapon | Quick Edge | -20% SPA (faster) | -10% damage, +10% tiredness gain |
| Weapon | Sharp Fang | +15% crit chance | -10% HP |

Prestigious (weekly heist), one unique effect each:
- Helmet "Second Wind": first time tiredness hits 75% in a run, reset it to 40%.
- Chest "Last Stand": survive one lethal hit at 1 HP per run; then -20% HP for the rest of the run.
- Weapon "Executioner": +50% damage to enemies under 25% HP; -15% damage otherwise.

- Max one prestigious item per unit (User).

Balance guardrails:
- Equipment bonuses add together; their total is capped (e.g. +40% damage, -30% SPA from equipment).
- Advanced/Prestigious = stronger numbers on the same tradeoff shape, not strictly better.
- Numbers are placeholders; tune in playtest.

## 14. Mythic kits (approved by user)
Rules: base DPS ~800 for all Mythics, small hierarchy allowed (Muzan strongest, per user). Most units should not have abilities (User); units without one get a 2nd passive. Proposal: only 4 Mythics keep an ability (Giyu, Muzan, Gojo, Sukuna); non-Mythic units get none. Numbers are placeholders. Canon references are from my knowledge, [Unverified].

| Unit | Source | Class | User's role | SPA | Passive 1 | Passive 2 / Ability |
|---|---|---|---|---|---|---|
| Zenitsu | Castle 5 | Speedster | Low SPA | Very fast | Thunderclap: every 4th attack hits the backline, ignoring taunt | Passive, Sleeping Thunder: +30% damage while 50%+ tired |
| Inosuke | Castle 10 | Punisher | Boss killer | Fast | Beast Sense: +40% damage to bosses and enemies above 50% HP | Passive, Wild Frenzy: each kill +10% attack speed for the group (max 3 stacks) |
| Giyu | Castle 20 | Balanced | Ability / AoE / all-rounder | Medium | Calm Water: no tiredness from taking damage | Ability, Dead Calm: 2 turns, takes no damage, counters every hit with an AoE slash |
| Douma | Castle 35 | Specialist | Debuff | Medium | Frozen Lotus: attacks apply Frostbite (slower SPA, stacks 2) and anti-heal | Passive, Ice Lotus: 20% chance an attack freezes the target, skipping its next turn (bosses immune) |
| Kokushibo | Castle 50 | Punisher | Raw damage | Slow | Moon Blades: each attack also hits 1 random enemy for 40% | Passive, Upper Moon One: +20% damage while above 50% HP |
| Muzan | Castle 100 | Specialist | DoT, strongest | Medium | Blood Curse: attacks apply Bleed (stacks to 5) | Ability, Demon King: every enemy takes all remaining Bleed damage instantly |
| Gojo | Raid | Balanced | Support / damage | Medium | Infinity: first hit on Gojo each group does 0 damage; adjacent allies +15% damage | Ability, Unlimited Void: enemies skip 1 turn, allies +30% damage for 2 turns |
| Sukuna | Raid | Punisher | AoE, lesser DoT | Medium | Dismantle: attacks hit up to 3 enemies | Ability, Malevolent Shrine: 3 turns, all enemies take slashes each turn (weaker DoT than Muzan) |
| Sung Jin-woo | Banner | Specialist | Summoner (proposal) | Medium | Arise: 25% chance a slain non-boss enemy rises as a shadow ally for the group (max 2) | Passive, Monarch: +10% damage per active shadow |
| Luffy | Banner | Speedster | Brawler (proposal) | Fast | Gum-Gum Barrage: every 3rd attack hits 3 times | Passive, Gear 5: first time HP drops below 50% in a run, attacks hit all enemies and are debuff immune for 2 turns |
| Goku | Banner | Punisher | Burst damage (proposal) | Medium | Saiyan Rage: +5% damage each time he is hit (max +50%, resets on recall) | Passive, Kamehameha: every 5th attack is a line hit for 3x damage |
| Tsunade (new) | Banner | Medic (heal-type) | Mythic healer (proposal) | Medium | Medical Ninjutsu: heals the lowest-HP ally each turn | Passive, Strength of a Hundred: once per group, an ally dropping below 30% HP is healed 30% |
| Gyomei (new) | Banner | Balanced, Tank type | Mythic tank (User) | Slow | Stone Body: takes 20% less damage | Passive, Prayer: each hit he takes gives adjacent allies +5% damage (max +25%, resets each group) |

Changes from the first draft (User feedback): Gojo is no longer a medic (no canonical healing besides reverse cursed technique), Luffy is not a tank, most units have no ability: only Giyu, Muzan, Gojo, Sukuna keep one, Tsunade added as the Mythic healer (she is Naruto's best-known medical ninja).

[Inference] Notes:
- Mythic count is now 13 (6 Castle, 2 raid, 5 banner).
- Gyomei (User pick, banner) is the only Mythic tank so far; more can come in updates. Tanks have high SPA, so his DPS should sit below ~800; his value is HP and taunt.
- Sung Jin-woo is kept simple on purpose (Balakay's Vanguards criticism).
- Zenitsu ignoring taunt on every 4th hit could be strong. Watch it.
- Abilities are now rare, matching "exclusive and strong"; the 4 ability units become the hard-content picks.
- Damage trait disables passives, so it costs Mythics more than filler units.

## 15. Non-Mythic kits (approved by user)
Rules: passives only, no abilities. Commons have no passive (their role is the kit). Base DPS anchors: Common ~50, Rare ~110, Epic ~220, Legendary ~420. Canon references are from my knowledge, [Unverified].
Swaps vs the earlier list: Usopp -> Nami (gives an early Economy unit), Renji -> Sakura (gives an early heal medic). Chad added as the Epic tank (User asked for one).

| Unit | Rarity | Class / type | Role | SPA | Passive |
|---|---|---|---|---|---|
| Nami (One Piece) | Common | Economy | Income | - | None (generates cash each round) |
| Yamcha (Dragon Ball) | Common | Punisher | Single-target DPS | Medium | None |
| Ino (Naruto) | Common | Medic (heal) | Small heals | Medium | None (heals lowest-HP ally) |
| Mineta (My Hero Academia) | Common | Specialist | Slow | Medium | None (attacks slow by 10%) |
| Rock Lee (Naruto) | Rare | Speedster | Fast DPS | Fast | Gates: -5% SPA per attack, max 5 stacks, resets on recall |
| Nobara (Jujutsu Kaisen) | Rare | Specialist | DoT | Medium | Resonance: hits apply a small DoT for 2 turns |
| Kirishima (My Hero Academia) | Rare | Balanced, Tank type | Early tank | Slow | Hardening: takes 15% less damage |
| Sakura (Naruto) | Rare | Medic (heal) | Heals | Medium | Healing Palm: heals +20% on allies under 50% HP |
| Todo (Jujutsu Kaisen) | Epic | Balanced | Support | Medium | Brotherhood: adjacent allies +15% damage |
| Shikamaru (Naruto) | Epic | Specialist | Control | Medium | Shadow Bind: every 4th attack makes the target skip a turn (bosses immune) |
| Kurapika (Hunter x Hunter) | Epic | Punisher | Boss damage | Medium | Chain Jail: +40% damage to bosses |
| Power (Chainsaw Man) | Epic | Punisher | Bruiser | Medium | Blood Fiend: +20% damage while below 50% HP |
| Chad (Bleach) | Epic | Balanced, Tank type | Counter tank | Slow | El Directo: when hit, 25% chance to counterattack for 50% damage |
| Byakuya (Bleach) | Legendary | Balanced | AoE | Slow | Senbonzakura: attacks also hit all other enemies for 30% |
| Hawks (My Hero Academia) | Legendary | Speedster | Fast multi-hit | Fast | Feathers: each attack also hits a random enemy for 25% |
| Killua (Hunter x Hunter) | Legendary | Speedster | Fast control | Fast | Lightning: 15% chance to stun on hit (bosses immune) |

Evolution candidates (proposal): Rock Lee, Killua, Todo, Kurapika.

[Inference] Tank line: Kirishima (Rare, damage reduction), Chad (Epic, counter), Gyomei (Mythic, ally buff). Remaining gaps (no Legendary tank, no Epic/Legendary medic, Economy only at Common) are accepted (User): lower-rarity units get replaced, so not every role needs every rarity. Fine for filler, but mid-game teams may lack a tank/medic between Rare and Mythic.

## 16. In-game names (approved by user)
Kit tables above use the real names for clarity; the game uses these. They avoid copying competitors' parody names (Zuffy, Vogita, Song Jinwu, etc.). Final approach (User): the first set of light changes, plus one more letter swapped or added (e.g. Ruffy -> Ruffey, Muzen -> Muuzen).

| Character | In-game name | Rarity |
|---|---|---|
| Zenitsu | Zennitzu | Mythic |
| Inosuke | Inozuka | Mythic |
| Giyu | Ghiyo | Mythic |
| Douma | Doomah | Mythic |
| Kokushibo | Kokkushiba | Mythic |
| Muzan | Muuzen | Mythic |
| Gojo | Gojju | Mythic |
| Sukuna | Sukanno | Mythic |
| Sung Jin-woo | Sung Jhinu | Mythic |
| Luffy | Ruffey | Mythic |
| Goku | Gokko | Mythic |
| Tsunade | Tzunada | Mythic |
| Gyomei | Gyommay | Mythic |
| Nami | Nammy | Common |
| Yamcha | Yamchuu | Common |
| Ino | Inah | Common |
| Mineta | Minnetta | Common |
| Rock Lee | Rokk Li | Rare |
| Nobara | Noburra | Rare |
| Kirishima | Kirrishimo | Rare |
| Sakura | Sakkra | Rare |
| Todo | Taddo | Epic |
| Shikamaru | Shikkamaro | Epic |
| Kurapika | Kurrapica | Epic |
| Power | Powah | Epic |
| Chad | Chaddo | Epic |
| Byakuya | Byakkuyo | Legendary |
| Hawks | Hawkze | Legendary |
| Killua | Kiluah | Legendary |

[Inference] Altered names lower takedown risk but do not remove it; models stay recognizable. ALS also carries an "inspired content" disclaimer in its game description; do the same.

## 17. Setting, mode, name (User)
- Setting: multiverse (fits the varied-anime roster).
- Solo only (no co-op).
- Trait rerolls: a later reroll also lets the player pick on the 3rd roll again.
- Contagious (1 per team) counts the bench too (7-unit run roster).
- Name (User): **Anime Convergence**. Other candidates considered, checked against Roblox search on 2026-10-24: Anime Rift, Anime Convergence, Anime Crossfire, Anime Fracture, Anime Warbands showed no same-name game in top results. Taken: Anime Nexus (an RNG game, ~630 players), Anime Multiverse (tiny game). [Inference] Roblox does not reserve names; a clash only matters for search.

## 18. Tech plan (for the build session; planning only, no code here)
Roblox API and library names below are from my knowledge, [Unverified]; confirm in the build session.

### 18.1 Principles
- **Server-authoritative.** The client only sends intents (place unit, recall, bench, use ability, buy potion, summon). The server checks everything (ownership, cash, cooldowns, rate limits). The client only displays.
- **Data-driven content.** Units, traits, equipment, potions, enemies, and stages live in config tables. Balance changes are data edits, not code edits.
- **One modifier pipeline.** Traits, passives, equipment, potions, status effects, and buffs all plug into the same stat/hook system. That keeps "stacking with no cap" predictable and testable.
- **Pure combat simulation.** The combat sim is a plain Luau module with no Roblox instances, so it can be unit-tested outside Studio.

### 18.2 Tooling
- Luau with type checking (`--!strict`).
- Rojo (files on disk sync into Studio) + Git, so code lives in this repo.
- Lint/format: Selene + StyLua.
- Tests: pure modules tested with a standalone Luau runtime (e.g. Lune) so a cloud session without Studio can still run tests; seeded `Random` makes combat tests repeatable.
- Optional: a Roblox Studio MCP server in the build environment (needs Studio running locally).

### 18.3 Places and servers
- **Lobby place:** summoning, inventory, crafting, mode select.
- **Match place:** one run per reserved server (TeleportService reserved servers). Solo game, so one player per match server: isolated state, no lobby lag, simpler anti-cheat.
- Match server loads the profile itself from the DataStore; teleport data is only a hint (clients can tamper with it).

### 18.4 Code layout (Rojo)
```
src/
  shared/          -> ReplicatedStorage.Shared
    Config/        Units, Traits, Equipment, Potions, Enemies, Stages, Gacha, Economy
    Combat/        pure sim: Grid, Unit, Targeting (taunt), Damage, Status, Tiredness, Turns
    Types          shared type definitions
    Util/          NumberFormat (K/M/B/T), Random helpers
  server/          -> ServerScriptService.Server
    Services/      Data, Match, Autoplay, Gacha, Traits, Crafting, Shop, Heist, Castle, Purchase, Policy, Analytics
    Remotes        intent validation + rate limiting
  client/          -> StarterPlayerScripts.Client
    Controllers/   Lobby UI, Summon UI, Placement, CombatView, HUD (HP/tired bars, damage numbers), Settings
places/            lobby.project.json, match.project.json
tests/             sim + economy tests
```

### 18.5 Player data (DataStore)
- Session locking to prevent item duplication (a library such as ProfileStore, or a hand-written lock).
- Schema with a `version` field for migrations.
- Contents: gems, materials, units (id, level, trait, equipment slots), trait rolls and per-unit roll counter, equipment inventory, summon pity counters (Mythic 200, Legendary 40), story/challenge progress, Infinity Castle best floor + first-clear flags, heist daily/weekly reset keys (UTC day/week index), redeemed codes, settings, purchase receipts.
- Save on interval, on leave, and on server shutdown.
- Infinity Castle leaderboard: an ordered DataStore.
- No trading planned; if added later it is the biggest dupe risk.

### 18.6 Combat simulation
- **Clock:** fixed tick on the server. Each unit has an action timer = SPA x (1 + tired/2). At 75%+ tired it skips every other turn.
- **A turn** = move one step on the grid toward a legal target, or attack. Tiredness: move +3%, kill +5%, hit taken +7.5% (tanks 30% less).
- **Targeting:** living tanks must be killed first (both sides); AoE still hits units behind; bosses are not tanks.
- **Hooks:** onTurnStart, onAttack, onHit, onKill, onGroupStart, onRecall. Passives, traits, equipment, and statuses register on these hooks.
- **Status effects:** bleed, DoT, frostbite, freeze/skip turn, stun, slow, anti-heal (healer heals 50% less for 2 turns). Bosses resist control.
- **Run state:** 5 on field + 2 bench; recall after each group (-10% tired, no heal); sitting out heals 20%/round and -40% tired; fallen units stay down.
- **Output:** the server sends a compact event stream (moves, hits, damage, deaths) to the client, which animates it. The client never computes results.

### 18.7 Run flow and modes
- Match service: load stage config, spawn enemy groups (random squad presets, scaling up to the player's power), cash per wave, unit upgrades, potions shop, recall/bench, win/lose, rewards.
- Modes are stage configs + reward tables: story (3 stages x 5 acts), challenges, raid, daily/weekly heist (10 rounds, scaling under->over), Infinity Castle (5 rounds per floor, boss every 5 floors, alternating buffs/debuffs), Gauntlet difficulty (no shop, no heals, 1.5x tired, 2.5x luck).

### 18.8 Autoplay and abilities
- Autoplay runs on the server: placement heuristic (tanks front, others behind), buys upgrades, recalls when a group dies. Never uses abilities or the shop.
- Autocast toggle is a per-run flag, reset at run start.

### 18.9 Gacha, traits, crafting
- All rolls on the server with `Random`.
- Summon: 250 gems; Mythic 1% with 200 pity; Legendary pity 40; odds shown in UI from the same config.
- Traits: 8 traits; class match 22.2%, others 11.1% (12.5% if no class match); pick on the 3rd roll per unit; resets on later rerolls; Contagious max 1 per team including bench.
- Crafting: recipes in config; one prestigious item per unit enforced on equip.

### 18.10 Monetization and policy
- Developer products (gem packs) via MarketplaceService receipt processing; idempotent (store receipt IDs in the profile).
- Check PolicyService for regions where paid random items are restricted; block paid summons there. [Unverified] exact rules.
- Game description carries an "inspired content" disclaimer (as ALS does).

### 18.11 UI and quality of life
- Free 2x/3x speed, autoplay toggle, colorblind mode, UI scale, K/M/B number formatting.
- Tutorial stage per mechanic (placement, recall, bench, tiredness, traits).

### 18.12 Telemetry
- Log per run: units/traits/equipment used, mode, result, floor/round reached. Feeds the pick-rate review and the raid/heist payout tuning. (AnalyticsService custom events or own logging; [Unverified].)

### 18.13 Build order (milestones)
| # | Milestone | Done when |
|---|---|---|
| M0 | Repo setup: Rojo projects, folders, lint, tests running | Empty lobby + match places build from the repo |
| M1 | Config tables + data layer (profile, session lock, schema) | Data saves/loads; no dupes across rejoin |
| M2 | Combat sim core (grid, timers, targeting/taunt, damage, death, tiredness) | Tests pass for a 5v5 group fight |
| M3 | Match flow (groups, recall, bench, healing, cash, upgrades, win/lose) | A full ~25-enemy round plays on the server |
| M4 | Client view (placement UI, animations from events, bars, numbers) | Playable in Studio end to end |
| M5 | Passives, traits, statuses, equipment modifiers | All 29 kits work in tests |
| M6 | Abilities, autocast toggle, autoplay | Autoplay clears early story, struggles on hard stages |
| M7 | Gacha, pity, inventory, trait rolls, crafting | Summon/craft/roll loops work with saved data |
| M8 | Modes: story, challenges, raid, heists, Infinity Castle, Gauntlet, branching, shop | All modes playable |
| M9 | Monetization, policy checks, tutorial, settings | Purchases safe; tutorial complete |
| M10 | Playtest, telemetry, balance pass, launch prep | Ready to launch when the market window opens |

### 18.14 Tech risks ([Inference])
- DataStore limits and failures: retries, budgets, session locking.
- Exploiters: never trust the client; rate-limit remotes.
- Server cost: one reserved server per solo run is simple but means many small servers; acceptable on Roblox [Unverified].
- Event stream size with big DoT/AoE fights: batch per tick.
- Art is the long pole, not code: 29 R6 models + animations + VFX.

## 11. Open questions
Resolved (see sections above): IP (existing anime, risk accepted), classes, enemies and bosses, launch content, Infinity Castle, heists, raid, equipment, traits and odds, Mythic kits, tiredness, bench, recall, fallen units, Gauntlet, branching map, autoplay, roster (29 units), role gaps.

Still open:
8. Raid payout (300 gems proposed) and clear length: set in testing.
12. Tech plan: drafted in section 18; review it.
13. Content for the update after launch: TBD (User).
14. Pre-launch checks: [Unverified] Roblox rules on paid random items and on macros.
