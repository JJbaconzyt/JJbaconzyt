# Anime TD (Roblox) – Full Plan

Status: draft. Everything under "Design" is a proposal, not tested. Claims about Roblox policy and player opinion are marked [Unverified].

## 1. Vision
Lane-based anime tower defense on Roblox. Hook: PvZ-style lanes (the mode Balakay praised in the Vanguards anniversary video), gacha kept (genre staple), but no "one best option" chase.

Open decision: characters. User wants existing anime IP. [Unverified] this risks copyright takedown/ban, worse with paid gacha. Safe path: original characters built on familiar archetypes. User to decide.

## 2. Research basis (Balakay transcripts, one creator's opinion)
| Complaint | Source video | Design response |
|---|---|---|
| 1-placement 250% trait makes other traits useless | Galaxies | Every unit/trait has a tradeoff; pick-rate cap in playtests |
| Gambling OK, broken 0.1% chase is the problem | Galaxies | Pity + no best-in-slot rare |
| Autoplay beats whole game | Galaxies | Hard stages need manual counters |
| 2x gems/gold paywall = "greedy" | Galaxies | Free speed toggle, no multiplier paywall on core income |
| Samey unit passives | Galaxies | Each unit changes how you play |
| 3-4h boring grind to unlock a unit | Vanguards | Hard, short unlock challenges |
| Months spent on one unit | Vanguards | Roadmap spreads effort across many units/modes |
| Damage and HP divided by 10, powercreep unfixed | Vanguards | Fixed power band; new units = sidegrades |
| Raid HP up, drops unchanged | Vanguards | Change drop rate with any difficulty change |
| New mode has no tutorial | Vanguards | Tutorial stage per mechanic |
| Fake choice (Daggers of Destruction 99%) | Vanguards | Same pick-rate rule |

## 3. Units + gacha + balance

### 3.1 Roles (each lane unit fits one)
- Shooter: single-lane steady damage.
- Burst: high damage, long cooldown.
- Area: hits 3 lanes, short range.
- Wall: blocks, low damage.
- Support: buff adjacent tiles / heal.
- Economy: generates energy (placement currency).
- Control: slow, stun, push back.
- Lane-swapper: moves enemies between lanes.

### 3.2 Rarity (power band stays tight)
| Rarity | Role of rarity | Rule |
|---|---|---|
| Common | Core roles, cheap | Always viable late game |
| Rare | Specialized twist | Sidegrade only |
| Epic | Unique mechanic | Strong in niche, weak outside |
| Mythic | Build-defining mechanic | Not higher raw DPS than best Common in same role |

Rule: no rarity has strictly higher stats than a lower one in the same role. Rarer = more interesting, not just bigger numbers.

### 3.3 Balance rules
1. Pick-rate telemetry per unit per mode. Any unit >40% of top-tier clears gets reviewed. (Threshold is a starting guess.)
2. Every unit gets one clear weakness (cost, range, cooldown, vulnerability).
3. Numbers frozen: HP and damage scale bands set before launch; new content may not widen them.
4. Traits: if added, only small modifiers, never multiplicative with placement count.
5. New unit ships with a counter-enemy or counter-stage so it is not strictly best.
6. Quarterly rebalance patch buffs old units before adding new ones.

### 3.4 Gacha
- Currency: gems, earnable free (stage clears, daily, hard challenges); optional paid packs.
- Pity: guaranteed Epic+ by pull N, guaranteed Mythic by pull M (starting guess 30 / 90; tune after tests).
- Rate-up banner rotates, carrying 1 featured unit; featured unit never power-creeps.
- Duplicates convert to upgrade shards (small, capped bonus).
- Odds shown in the summon screen.
- Not included: trait gambling, 0.1% do-it-all outcomes.

## 4. Enemies + stages

### 4.1 Enemy types (MVP set of 8)
| Enemy | Behavior | Forces |
|---|---|---|
| Grunt | Walks lane | Baseline |
| Runner | Fast | Burst/control |
| Tank | High HP | Sustained DPS |
| Shielded | Immune to first N hits or one damage type | Mixed damage |
| Lane-jumper | Switches lane at set column | Area/support cover |
| Flyer | Skips walls | Anti-air or range |
| Pusher | Knocks back a unit row | Wall placement |
| Summoner | Spawns grunts | Priority targeting |

### 4.2 Bosses
Weak-point or phase mechanics (not HP sponges). Example: boss alternates lanes and exposes a weak spot only mid-lane-switch.

### 4.3 Difficulty curve
- World 1 teaches mechanics one at a time (tutorial stage per mechanic).
- Normal / Hard / Nightmare per stage. Hard and Nightmare require manual play: autoplay may not place counters.
- Challenge stages with restrictions (no Economy units, only 4 slots) for bonus gems.
- Endless mode with scaling enemy variety, not just HP inflation.

### 4.4 Grind rule
Unlocks come from short hard challenges, not repeated stages. Any grind has varied stages. [Inference] from Vanguards video: long easy grind was the complaint, hard final stage was liked.

## 5. Monetization
- Free: 2x/3x speed, autoplay on easy content, UI options (colorblind mode, UI size; Balakay noted these positively).
- Paid: gem packs, cosmetics, convenience.
- Avoid: paywalled gem/gold multipliers.
- [Unverified] Roblox requires odds disclosure for paid random items and restricts some gambling-like mechanics. Check current Roblox rules before launch.

## 6. Roadmap
| Phase | Deliverable |
|---|---|
| 0 | Resolve IP decision, name, art style |
| 1 | Prototype: lane grid, 3 units, 3 enemies, one stage |
| 2 | MVP: 6 units, 8 enemies, 10 waves + boss, tutorial, summon with pity, save data |
| 3 | Closed playtest + pick-rate telemetry; tune balance |
| 4 | Launch: World 1, 3 modes (story, challenge, endless) |
| 5 | Update cadence: small frequent updates (new unit + stage + counter), one rebalance patch per quarter |

Update principle: no single unit absorbs months of dev time; ship breadth (units, modes, QoL) per update.

## 7. Open questions
1. Original vs existing-IP characters (user leaning existing).
2. Team size and art pipeline (Roblox-style models vs high-poly; Vanguards comments disliked uncanny high-poly models).
3. Solo vs co-op lanes.
4. Art style and setting.
5. Exact pity numbers and odds.
