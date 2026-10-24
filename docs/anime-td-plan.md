# Anime TD (Roblox) – Full Plan

Status: draft. Items marked "User:" are decisions quoted or paraphrased closely from the user. Everything else is a proposal, not tested. Claims about Roblox policy and player opinion are marked [Unverified]. Inferences are marked [Inference].

## 0. PIVOT (User): PvE auto battler
User decision: instead of classic ATD, a PvE auto battler. Players place a team, units fight automatically, and the player adjusts between rounds. This supersedes the path-TD content in sections 1, 4, and 6 below, which are kept as reference until rewritten.

What carries over: gacha units, rarity gaps, powercreep, classes and traits, trait rolls (5 per unit, pick), Demon Slayer first update with Infinity Castle, farm/cash economy (per-wave cash as round income), codes, challenges.

What changes ([Inference]):
- Enemies are teams/waves of fighters, not path walkers; the enemy table in 4.1 is obsolete.
- Autoplay: user said it "has upgrade, no ability". In an auto battler, combat is already automatic; what "autoplay" means now needs redefining (question 18).
- Macro problem mostly disappears: the skill is team building and placement.
- Risks: it's no longer an ATD (audience expectation), synergies multiply balance work, units need combat AI.

Open: question 18-21.

## 1. Vision
(Superseded by section 0.) Classic path-based anime tower defense on Roblox (User decision: PvZ-style lanes scrapped, "it turns into way more of a defender"). Gacha kept (genre staple). Traits kept, balanced as a hierarchy. Balanced powercreep is wanted.

Hook (User): "unique game modes, traits, and units." [Inference] This is a direction, not yet a design. Classic path TD is the genre default, so at least one concrete mechanic or mode needs specifying to avoid the "slop" feel. Earlier suggestion: units bend or block the path (maze). Not decided.

Open decision: characters. User wants existing anime IP. [Unverified] this risks copyright takedown/ban, worse with paid gacha. Safe path: original characters built on familiar archetypes. User to decide.

## 2. Research basis (Balakay transcripts, one creator's opinion)
| Complaint | Source video | Design response |
|---|---|---|
| 1-placement 250% trait makes other traits useless | Galaxies | Trait hierarchy with class fit; pick-rate cap in playtests |
| Gambling OK, broken 0.1% chase is the problem | Galaxies | Pity + no do-it-all best-in-slot trait |
| Autoplay beats whole game | Galaxies | Hard stages need manual counters |
| 2x gems/gold paywall = "greedy" | Galaxies | Free speed toggle, no multiplier paywall on core income |
| Samey unit passives | Galaxies | Passives matter for big units, kept simple |
| 3-4h boring grind to unlock a unit | Vanguards | Hard, short unlock challenges |
| Months spent on one unit | Vanguards | Roadmap spreads effort across many units/modes |
| Damage and HP divided by 10, powercreep unfixed | Vanguards | Planned, scheduled powercreep (3.2) with rebalance patches |
| Raid HP up, drops unchanged | Vanguards | Change drop rate with any difficulty change |
| New mode has no tutorial | Vanguards | Tutorial stage per mechanic |
| Fake choice (Daggers of Destruction 99%) | Vanguards | Same pick-rate rule |

## 3. Units + gacha + balance

### 3.1 Units, roles, classes, passives
- Roles (proposal): Shooter, Burst, Area, Wall, Support, Economy (Farm), Control.
- Classes (User): each unit has a class that corresponds to a trait. If the unit's trait matches its class, the trait is 20% stronger. Class examples given: Speedster, Ranger, Controller, Specialist, Punisher, "etc." Class-to-trait mapping not yet decided (question 9).
- Passives (User): should matter for big units. Not "anime last stand" style where there are around 5 complex passives; simple, but present.
- One trait per unit (User).

### 3.2 Rarity and powercreep
User decisions:
- "There should be seen gaps between the rarities, because if a common can technically beat the game, why would anyone go for a mythic."
- Powercreep is needed, "or else there's no incentive to play and grind"; wanted: balanced powercreep. A Common shouldn't be equal to a Mythic when the Mythic costs far more grind/summons.
- Commons shouldn't be used permanently. Chosen mechanism: both content gating and evolve/fodder use.
- Rarity power and trait power multiply.

| Rarity | Intent |
|---|---|
| Common | Clears early/Normal content; falls off in Hard+; evolve/fodder material |
| Rare | Clears Normal; viable early Hard |
| Epic | Clears Hard |
| Mythic | Needed for top-end content (Nightmare, endless depth) |

Proposed guardrails ([Inference], from Balakay's powercreep complaint):
- Powercreep is scheduled and bounded: each tier has a written multiplier; new units fill tiers instead of opening a new top tier unannounced.
- Old units get buffs in rebalance patches so powercreep does not obsolete them completely.
- Because rarity and trait multiply, set a hard cap on the combined multiplier and playtest it. Example: Mythic 3x with Damage trait 4x is 12x over a no-trait Common. [Inference] this gap is large and could invalidate lower tiers or content tuning.

### 3.3 Balance rules
1. Pick-rate telemetry per unit and per trait. Any trait or unit above 40% of top-tier clears gets reviewed (starting guess).
2. Every unit has a clear weakness (cost, range, cooldown, vulnerability).
3. Combined rarity x trait multiplier capped (see 3.2).
4. Trait goal (User): a hierarchy, but no default trait that practically every unit runs. Class bonus (20%) is the spreading mechanism.
5. New unit ships with a counter-enemy or counter-stage.
6. Quarterly rebalance patch.

### 3.4 Gacha
- Currency: gems, earnable free (stage clears, daily, hard challenges); optional paid packs.
- Pity: guaranteed Epic+ by pull N, guaranteed Mythic by pull M (starting guess 30 / 90; tune after tests).
- Rate-up banner rotates, carrying 1 featured unit.
- Duplicates convert to upgrade shards (small, capped bonus). Commons also usable as evolve fodder (3.2).
- Odds shown in the summon screen.
- Trait acquisition method (roll vs fixed): open question 7.

### 3.5 Traits
One per unit. Goal (User): "to have a hierarchy of traits, but to not have one that is the default and practically every unit runs it." Traits are spread so each can be used; class matching gives 20% extra.

| Trait | Definition |
|---|---|
| Farm | User: 30% money applies only to units whose sole purpose is to generate income. Base money per wave about 1000, trait doubles that; any enemy killed by a unit with the Farm trait gives double the money it normally would. User clarification: "Doubling effect only applies when a unit that doesn't generate cash has the trait and is on the field killing when applicable". Final (User): per-wave cash is a set number; kills made by the unit with the Farm trait give double cash |
| Range | "Unit gains whole map range, and will target the closest enemy. Force single target only." Closest = closest to the base (User) |
| Damage (rarest) | "300% damage boost, no passives allowed" |
| SPA | "Cuts SPA in half, nerfs all other stats by 20%" (User confirmed: attacks twice as often) |
| Control | "each hit applies random debuff effect"; bosses resist (User) |
| Contagious (biggest, 1 per team) | "mark any enemy hit with the status effect 'contagious'. Once a contagious enemy gets hit by a unit causing the status effect, they will instantly take 10% damage and spread it along to 3 other enemies. Contagious enemies getting hit 3 times get slowed by 15%". User: damage is 10% of max HP or of the hit, whichever does more; bosses take 5% of current HP |
| All rounder | "buff all stats by 20%" (User confirmed: SPA shortened too) |

Obtaining traits (User): through story, codes, and challenges. Codes give 1-2 rerolls, restricted to updates.
Latest decision (User): "there's only gonna be mythic traits, each equal odds, select your trait after 5 rolls/unit". Earlier statements ("hella rare" rerolls, random mythic guarantee, "Damage (rarest)") are superseded where they conflict.
- [Inference] Selecting a trait after 5 rolls is a chosen-trait guarantee. Balakay's Galaxies criticism: the guarantee hands everyone the same best trait. With only 5 rolls it is cheap, so every player can pick the best trait for each unit. The hierarchy goal (some traits above others) and the "no default trait" goal now depend entirely on traits being close in power, and on class/role fit.
- [Inference] With equal odds and all traits mythic, the "Damage (rarest)" label no longer fits; the Damage trait's 300% needs rebalancing against the others.
- [Inference] Rerolls were called rare, but 5 rolls per unit across a roster is many rolls. How rolls are earned must match that (question 14).

Review flags:
- [Inference] Damage trait 300% is the rarest and resembles Balakay's 250% trait complaint. "No passives" only costs units that have meaningful passives; small units with weak passives may still default to it.
- [Inference] Contagious: 10% max HP spreading to 3 enemies per hit scales well against swarms. Chain rules not yet defined.
- [Inference] Seven traits need at least as many classes; Contagious (1/team) and All rounder need a class or no class bonus.

## 4. Enemies + stages

### 4.1 Enemy types (MVP set of 8, proposal, adapted to path TD)
| Enemy | Behavior | Forces |
|---|---|---|
| Grunt | Walks path | Baseline |
| Runner | Fast | Burst/control |
| Tank | High HP | Sustained DPS |
| Shielded | Immune to first N hits or one damage type | Mixed damage |
| Flyer | Ignores path blockers / flies straight | Range or anti-air |
| Pusher | Knocks back or disables nearby units | Unit placement |
| Summoner | Spawns grunts | Priority targeting |
| Path-skipper | Teleports forward at set points | Coverage near the base |

### 4.2 Bosses
Weak-point or phase mechanics (not HP sponges). Bosses resist Control debuffs and take reduced Contagious damage (5% current HP).

### 4.3 Difficulty curve
- World 1 teaches mechanics one at a time (tutorial stage per mechanic).
- Normal / Hard / Nightmare per stage. Hard and Nightmare require manual play: autoplay may not place counters.
- Content gates by rarity (3.2); Commons fall off in Hard+.
- Challenge stages with restrictions for bonus gems.
- Endless mode with scaling enemy variety, not just HP inflation.

### 4.3b Macroing tension
User: ATD players love macroing, so the design is at a crossroads. Wants gameplay "engaging, but not soul sucking" (user's text read "my soul sucking"; confirm).

User decisions: likes the autoplay system. Autoplay is available everywhere, but it "won't work efficiently on stages" (read as: it is available in all content but is weak on stages that need manual play; confirm).

Proposals ([Inference], untested):
- Built-in autoplay everywhere, so players do not need external macros. Balakay praised Galaxies' autoplay quality but said it beat the whole game, so autoplay must be a weaker player than a human on hard content.
- Hard/Nightmare use variation macros handle poorly: randomized enemy order or timing, mid-wave events, abilities that need manual timing.
- Reward manual skill on hard content (bonus gems, challenge unlocks).
- Keep grinds short so macroing is not the only way to cope with them.
- [Unverified] Roblox rules on macros/automation; check before designing anti-macro measures.

### 4.4 Grind rule
Unlocks come from short hard challenges, not repeated stages. [Inference] from Vanguards video: long easy grind was the complaint, hard final stage was liked.

## 5. Monetization
- Free: 2x/3x speed, autoplay on easy content, UI options (colorblind mode, UI size; Balakay noted these positively).
- Paid: gem packs, cosmetics, convenience.
- Avoid: paywalled gem/gold multipliers.
- [Unverified] Roblox requires odds disclosure for paid random items and restricts some gambling-like mechanics. Check current Roblox rules before launch.

## 6. Roadmap
| Phase | Deliverable |
|---|---|
| 0 | Resolve IP decision, name, art style, distinguishing hook |
| 1 | Prototype: path, placement, 3 units, 3 enemies, one stage |
| 2 | MVP: 6 units, 8 enemies, 10 waves + boss, tutorial, summon with pity, traits, save data |
| 3 | Closed playtest + pick-rate telemetry; tune balance and multiplier cap |
| 4 | Launch: World 1, 3 modes (story, challenge, endless) |
| 5 | First update (User): Demon Slayer, built around Infinity Castle ("a staple in these games, but we can expand on it") |
| 6 | Update cadence: small frequent updates (new unit + stage + counter), one rebalance patch per quarter |

Update principle: no single unit absorbs months of dev time; ship breadth (units, modes, QoL) per update.

## 7. Open questions
1. Original vs existing-IP characters (user leaning existing).
2. Distinguishing hook for path TD (maze/path bending, or something else).
3. Team size and art pipeline (Roblox-style models vs high-poly; Vanguards comments disliked uncanny high-poly models).
4. Solo vs co-op.
5. Pity numbers and odds.
6. Rarity multiplier per tier and combined cap with traits.
7. Which source (story, codes, challenges) gives which trait; any trait caps per source.
8. Farm trait: does the 30% stack with the doubling, or replace it?
9. Full class list and which class maps to which trait (incl. Contagious and All rounder). Given so far: Speedster, Ranger, Controller, Specialist, Punisher.
13. Concrete unique game modes, traits, and units (the hook).
14. Trait rolls (User confirmed): 5 rolls per unit, then pick the trait. Rolls come from codes and challenges. Open: how many rolls per challenge, and does the pick reset if the player rerolls later?
15. Infinity Castle: what is the "expansion" beyond a standard endless/floor mode?
16. Autoplay: exactly what makes it "not efficient" on stages (randomized waves, ability timing, resource limits)?
17. Demon Slayer update uses existing IP; see section 1 risk.
18. Auto battler: what does autoplay mean now (auto-place team, auto-upgrade, auto-start next round)? User said autoplay has upgrade and no ability.
19. Round structure (User): 5v5, multiple rounds, enemies can loosely scale with the player's unit strength. Open: grid or free placement, round length, how "loosely" scaling works.
   - [Inference] Scaling enemies to unit strength can erase the visible rarity gaps and the reason to grind (user wants Mythic >> Common). Cap the scaling, e.g. floors/modes have a minimum and maximum enemy power.
   - [Inference] Only 5 enemies at a time: Contagious ("spread to 3 other enemies") hits most of the enemy team; Farm trait on one of 5 slots costs a combat slot; 1/team Contagious is easier to enforce.
20. Abilities (User): abilities are player-triggered. There is an autocast toggle; it is not locked, but autoplay never selects or enables it. A player can toggle it on themselves, but then they are either actively playing or running an external macro. Easy grinds shouldn't need abilities; abilities are "exclusive and strong" (hard content). Open ([Inference]): if the toggle persists between runs, autoplay plus a saved toggle equals full AFK, defeating the design. Decided (User): the autocast toggle resets every run.
21. Does the team grow between rounds (shop, merges) or is it fixed pre-fight?
10. Contagious: does the spread chain from newly infected enemies? Per-hit or per-trigger limit?
11. Control: debuff pool and proc limits for fast attackers.
12. Commons: evolve/fodder rules (how many Commons per upgrade, which target units).
