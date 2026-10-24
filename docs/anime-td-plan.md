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

Open decision: characters. User wants existing anime IP. [Unverified] this risks copyright takedown/ban, worse with paid gacha. Safe path: original characters built on familiar archetypes. User to decide.

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
- Enemy types, mechanics, and bosses: to be designed (question 8).

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
  - [Inference] Range trait (global, targets highest current HP) conflicts with taunt: does it bypass tanks? (question 21)
  - [Inference] Open: AoE/splash onto non-tanks while a tank lives? Multiple tanks, which first? Is a boss a tank?
  - [Inference] Medic + tank behind taunt can stall fights; enemy squads need answers (anti-heal, armor pierce).
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
- Class-to-trait map (proposal): Ranger→Range, Speedster→SPA, Controller→Control, Specialist→Contagious, Punisher→Damage, Economy→Farm, Balanced→All rounder.

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
| Mythic | Needed for top-end content |

Guardrails ([Inference]): scheduled powercreep with written multipliers; new units fill existing tiers; old units buffed in rebalance patches; a hard cap on combined rarity x trait multiplier, set by playtest. Example: Mythic 3x with a 4x trait is 12x over a plain Common.

Balance rules:
1. Pick-rate telemetry per unit and trait; above 40% of top-tier clears gets reviewed (starting guess).
2. Every unit has a clear weakness.
3. Quarterly rebalance patch.
4. New units ship with counter content.

## 6. Traits
User: only mythic traits, equal odds; select the trait after 5 rolls per unit. Rolls come from codes (1-2 per code, restricted to updates) and challenges. Traits also come from story. One trait per unit. Goal: a hierarchy of traits, but no default trait that nearly every unit runs.

| Trait | Definition |
|---|---|
| Farm | 30% money applies only to units whose sole purpose is to generate income. Per-wave cash is a set number. Kills made by the unit with the Farm trait give double cash. Doubling applies only when a unit that does not generate cash has the trait and is on the field killing |
| Range | Reworked (approved): global range on the grid, single target only, always targets the highest current HP enemy |
| Damage | "300% damage boost, no passives allowed" |
| SPA | "Cuts SPA in half, nerfs all other stats by 20%" (attacks twice as often) |
| Control | "each hit applies random debuff effect"; bosses resist |
| Contagious (1 per team) | Reworked: no spread; the marked enemy takes 25% of max HP (5% of max HP for bosses); slow dropped; no proc limit (rounds are short) |
| All rounder | "buff all stats by 20%" (SPA shortened too) |

Review flags ([Inference]):
- Chosen-trait pick after 5 rolls is the Galaxies pattern in cheaper form: everyone can pick the best trait. The hierarchy depends on traits being close in power and on class fit.
- Damage trait at 300% needs rebalancing now that all traits are mythic with equal odds.
- Contagious at 25% max HP with no proc limit kills normal enemies in four hits; revisit in playtest.
- Farm is only useful if cash matters in a run with no shop.
- 5 rolls per unit across a roster is many rolls; codes and challenges must supply them without making them trivial.

## 7. Gacha
- Gems earnable free (stage clears, daily, challenges); optional paid packs.
- Unit pity: guaranteed Epic+ by pull N, Mythic by pull M (starting guess 30 / 90; tune after tests).
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
| 4 | Launch: first map set, story, challenges, endless |
| 5 | First update (User): Demon Slayer with an expanded Infinity Castle |
| 6 | Cadence: small frequent updates, one rebalance patch per quarter |

Update principle: no single unit absorbs months of dev time.

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
21. Taunt rule: does Range bypass tanks; AoE onto non-tanks; order with multiple tanks; are bosses tanks?
17. Gauntlet: resolved (see section 8).
18. Branching map: resolved (random presets both sides).
19. Autoplay and shop: resolved (autoplay does not use the shop).
20. Does the bench count toward "5 rolls per unit" or team limits for Contagious (1 per team)?
