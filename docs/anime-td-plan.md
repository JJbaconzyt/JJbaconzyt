# Anime Auto Battler (Roblox) – Full Plan

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

### 3.4 Economy
- Per-wave cash is a set number (about 1000 as a starting guess, User).
- Team stays fixed (no unit shop), but a shop exists for temporary equipment/potions bought with in-run cash (User). [Inference] Keep it in-run cash only; Robux-bought potions would hit Balakay's "greedy" complaint.
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

Guardrails ([Inference]): scheduled powercreep with written multipliers; new units fill existing tiers; old units buffed in rebalance patches; a hard cap on combined rarity x trait multiplier, set by playtest. Example: Mythic 3x with a 4x trait is 12x over a plain Common.

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
- Damage trait at 300% needs rebalancing now that all traits are mythic with equal odds.
- Contagious at 25% max HP with no proc limit kills normal enemies in four hits; revisit in playtest.
- Farm is only useful if cash matters in a run with no shop.
- 3 rolls per unit is cheap; class-match double chance mostly matters for the first 2 rolls; codes and challenges must supply them without making them trivial.

## 7. Gacha
- Gems earnable free (stage clears, daily, challenges); optional paid packs.
- Unit pity: Mythic at 200 pulls, Mythic rate 1% (User). Lower-tier pity open.
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
| 3 | Closed playtest + pick-rate telemetry; tune balance and the multiplier cap |
| 4 | Launch (heavy, see 12): story, challenges, raid, daily/weekly heist, Infinity Castle with Demon Slayer units |
| 5 | Update 1 drops with release (User), i.e. launch = update 1 (Demon Slayer + Infinity Castle) |
| 6 | Cadence: small frequent updates, one rebalance patch per quarter |

Update principle: no single unit absorbs months of dev time.

Launch strategy (User):
- Heavy launch, since the project is vibecoded (AI-assisted).
- Timing: not now; user says Anime Adventures is coming back ([Unverified]; a recent Anime Adventures "Update 21" video title was seen in related videos, not confirmed). Best window: after competitors ship several flop updates or during a content drought.

[Inference] Risks:
- AI speeds up code, not balance testing, art, animation, Roblox data-save bugs, or playtesting. Bigger scope = more bugs at launch.
- Galaxies commenters criticized it for feeling "AI generated". Hand-made art and UI matter.
- A drought can't be predicted. Build now, keep a launch-ready build, pick the date by watching competitors.
- Proposal: define a cut line, so if the window opens early, the launch ships with the core and the rest becomes the first update.

## 12. Launch content and economy (User)
- Story: 3 stages x 5 acts.
- Challenges.
- One raid, any anime; capsules give 1-3 units from that anime; side content.
- Unit roster (User: cut filler; counts are my proposal): 4 Common, 4 Rare, 4 Epic, 3 Legendary, 11 Mythic = 26 units, varied anime (was 35: 8/6/6/5/10). Demon Slayer units are inside the 35 and are all Mythic.
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
    - Common: Usopp (One Piece), Yamcha (Dragon Ball), Ino (Naruto), Mineta (My Hero Academia)
    - Rare: Rock Lee (Naruto), Nobara (Jujutsu Kaisen), Kirishima (My Hero Academia), Renji (Bleach)
    - Epic: Todo (Jujutsu Kaisen), Shikamaru (Naruto), Kurapika (Hunter x Hunter), Power (Chainsaw Man)
    - Legendary: Byakuya (Bleach), Hawks (My Hero Academia), Killua (Hunter x Hunter)
    - Evolution candidates (proposal): Rock Lee, Killua, Todo, Kurapika.
  - Total 11 Mythics; user is increasing Mythic count because Common-Legendary units are filler that nobody uses past the first hour.

Flags ([Inference]):
- Mythic count rising (11+) while Common-Legendary are "filler" (User). Filler cut to 15 non-Mythics (User decision, counts proposed). [Inference] Give them a lasting job (evolve fodder, equipment materials).
- Most gacha pulls (99%) land on filler, and only 3 Mythics are on the banner while 8 come from content. The banner's main value is Sung Jin-woo + 2.
- Sung Jin-woo was the center of Balakay's Vanguards backlash; expect comparisons.
- Rarity x trait x equipment = three stacked multipliers; the combined cap matters more now.
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

## 11. Open questions
1. Original vs existing-IP characters (user leaning existing; Demon Slayer first update).
2. Team size and art pipeline (Roblox-style models vs high-poly).
3. Solo vs co-op.
4. Art style and setting.
5. Pity numbers and odds for units.
6. Rarity multiplier per tier and the combined cap with traits.
7. Which classes exist in full, and the final class-to-trait map.
8. Enemy types and boss mechanics for the auto battler.
9. Shop: item list (equipment, potions), prices, and whether cash also buys unit upgrades.
10. Fallen units: resolved (stay down for the run; no revive).
11. Recall: resolved (no heal; sitting out heals 20%/round).
12. Rolls per challenge, and whether the trait pick resets on a later reroll.
13. Which of the section 8 modes are in the first release.
14. Infinity Castle "expansion": what is the twist?
15. Bench: resolved (2 reserve).
16. Tiredness: resolved.
21. Taunt rule: resolved. Class list accepted as-is (User: "I like what we have"): Speedster, Specialist, Punisher, Medic, Economy, Balanced.
17. Gauntlet: resolved (see section 8).
18. Branching map: resolved (random presets both sides).
19. Autoplay and shop: resolved (autoplay does not use the shop).
20. Does the bench count toward "3 rolls per unit" or team limits for Contagious (1 per team)?
22. Weekly heist: resolved.
23. Equipment: item list and stats (slots resolved).
24. Raid: resolved.
25. Infinity Castle: resolved (1250 first clear, 1/5 on repeats). Banner picks confirmed (User). Open: raid payout (300 proposed), and roster counts (26 proposed); raid clear length (User: decide in testing; tune raid payout to it).
26. Update 1: ships with release; next update content open.
27. Equipment: resolved (approved; one prestigious per unit). Numbers tuned in playtest.
