# Retro Joy Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent.
If the original author contacts me to request its removal, I undertake to take it down promptly.

Port of **Chicken Plucker's [CP] Retro Joy** to RimWorld 1.6.

**I am not the author of this mod.** The buildings, the artwork and the balance are Chicken
Plucker's — all I did was the work needed to make it run on 1.6, fix what the port turned up, and
write the French. Credit goes to them; mistakes in the port are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=1842663639 — declares 1.5 and
nothing further. The page is still online; the mod is abandoned, not withdrawn. Its B19-to-1.0
update was dninemfive's.

## What the mod does

Three recreation buildings, two pieces of matching furniture, and a recreation type of its own.
No assembly, no patch, no dependency beyond the base game.

| Building | Tab | Recreation | Trains | Cost | Gate |
|---|---|---|---|---|---|
| **Rimtendo console** | Recreation | video gaming | — | 100 steel, 8 industrial components | tube television, construction 8 |
| **Rock'em Sock'em** | Recreation | dexterity play | melee | 80 stuff (metal / wood / stone) | — |
| **Dungeons and Randies** | Recreation | cerebral play | intellectual | 50 stuff (metal / wood / stone) | — |
| **retro armchair** | Furniture | — | — | 110 fabric or leather | — |
| **retro table (small)** | Furniture | — | — | 15 stuff | — |

The console draws 200 W, is watched like a television — a bedridden colonist can play from bed —
and seats up to eight watchers. Rock'em Sock'em seats two facing each other; Dungeons and Randies
seats up to eight around its 2×2 table, and both need chairs adjacent to be used.

### The point of the console: a recreation type of its own

`Gaming_Video` — *video gaming* — sits next to Core's `Gaming_Dexterity` and `Gaming_Cerebral`.
Recreation tolerance is tracked per type: a colony that only owns a chess table gets less and less
out of it, while a console is a fresh column rather than more of the same. That is Chicken
Plucker's design and it is unchanged; the console's gain rate was already nerfed to 1.35 to pay for
it.

A recreation type with nothing to satisfy it costs a colony nothing. Tolerance is only ever raised
by actually doing the activity, and the boredom alert asks whether a pawn is bored of the types
*available* on the map. The one visible effect is a line of text: an unbuilt console leaves *video
gaming* in the list of recreation types the map does not offer, exactly as vanilla lists telescope
study on a colony with no telescope.

Available in English and French.

Content mod: removing it mid-save destroys any of these buildings already built.

## What changed in the 1.6 port

**Nothing in 1.6 had broken it.** That is the unusual part of this port. The mod has been carried
from 0.19 to 1.5 and stops one version short; every XML element it writes still maps to a field on
the 1.6 class, every def it references still exists, and all five RimWorld classes it names —
`JoyGiver_WatchBuilding`, `JoyGiver_InteractBuildingSitAdjacent`, `JobDriver_SitFacingBuilding`,
`JobDriver_PlayPoker`, `JobDriver_WatchTelevision` — are still there. The three static checks in
`scripts/` came back clean on the source as it stands.

So the work was not repair-by-version. It was reading fourteen `ThingDef`s against their vanilla
counterparts, which is what turned up the four things below.

### Four faults that predate the port

**The console could be watched through a wall.** `RimtendoESConsole` never set
`watchBuildingInSameRoom`, which defaults to `false`. There are exactly five watch-buildings in the
whole game — the three televisions, the horseshoes pin, the hoopstone ring — and all five set it.
Without it, the watch cells are not constrained to the console's room: the area drawn by
`PlaceWorker_WatchArea` runs into whatever is next door, and colonists go and sit there. Set to
`true`, so it behaves like the television it is a copy of.

**No opportunistic prefix on the three recreation jobs.** `allowOpportunisticPrefix` defaults to
`false`; every recreation `JobDef` in Core sets it to `true`. It is what lets a colonist walking to
the table pick up something lying in their path and haul it on the way. Set on all three.

**A downed colonist would crawl to the console.** `isCrawlingIfDowned` defaults to `true`. Vanilla's
`WatchTelevision` sets it to `false` precisely because the job carries `canDoWhileInBed`:
a bedridden pawn should watch from where they are, not crawl across the room. `PlayRimtendoES` is
the same driver with the same flag, and now says the same thing.

**No screen glow.** `effectWatching` is `WatchingTelevision` on all three vanilla televisions and
on nothing else in the game. The console is a CRT. Added.

### Two pieces of housekeeping, invisible in game

**Seven unused abstract bases dropped, two renamed.** Chicken Plucker shipped one
`CPMods_Bases.xml` across all his mods, holding nine abstract `ThingDef`s — apparel, meals,
weapons, workbenches. Retro Joy inherits from two of them.

The two survivors are now `RetroJoy_BuildingBase` and `RetroJoy_FurnitureBase`; abstract def names
never reach a save, so nothing about this is visible to a player.

**The rename is for legibility, not a fix, and the difference is worth writing down** because this
file first claimed otherwise. Eight subscribed mods ship that same file with the same nine `Name=`
attributes, which looks like a clash. It is not one. `XmlInheritance` keeps `nodesByName` as a
`Dictionary<string, List<XmlInheritanceNode>>` — a **list** per name — each node carrying the
`ModContentPack` it came from, and `GetBestParentFor` picks among the homonyms the one belonging to
the nearest mod in load order. Every mod resolves to its own copy, and nothing is logged. Abstract
names are not a flat global namespace; they are resolved by proximity in load order.

What the rename buys is that a file named after this mod no longer defines two bases named after
somebody else's.

Dropping the other seven removed the mod's only two dead fields as a side effect: `CPBenchBase`
wrote `workSpeedPenaltyOutdoors` and `workSpeedPenaltyTemperature`, neither of which is on
`BuildingProperties` in 1.6. Nothing inherited from it, so they had never done anything.

**Textures moved out of `Things/Furniture/`.** RimWorld's texture database is keyed on path across
all mods, and the last one loaded wins. `Things/Furniture/SmallTable` and
`Things/Furniture/SofaChair` are one collision away from any other furniture mod. They now live
under `Things/RetroJoy/`, named after the defs that use them.

### The text

Two labels were lowercased and one had a stray capital — `retro armchair`, `retro table (small)`,
`Rimtendo console`. RimWorld capitalises a label itself where a sentence starts with it
(`Def.LabelCap`) and leaves it alone mid-sentence, which is why every label in Core is lowercase
but for proper nouns. `Rock'em Sock'em` and `Dungeons and Randies` are proper nouns and kept their
capitals.

French was added: 13 entries. *Dungeons and Randies* is **Donjons et Randys** — the pun is on
Dragons and on Randy Random, whom the French game calls Randy Hasard, and that spelling keeps both
halves.

### What did not change

The buildings' stats, their costs, their stuff categories, the research that gates the console, the
recreation durations and gain rates, the skills the games train, the `JoyKindDef`, and all ten
textures. The original `defName`s are kept — `RimtendoESConsole`, `RockemSockemTable`,
`DNRandiesTable`, `RetroArmchair`, `RetroSmallTable` — so a save moves between the two mods without
losing anything.

## One thing left as it was

The retro armchair is **strictly better than vanilla's armchair** on every axis, and this was not
touched: changing it would be a rebalance, not a port.

| | retro armchair | vanilla armchair |
|---|---|---|
| Comfort | **1.0** | 0.8 |
| Max hit points | **220** | 120 |
| Work to build | **7500** | 14000 |
| Mass | 15 | 35 |
| Research | **none** | complex furniture |
| Construction skill | **none** | 5 |
| Beauty | 2 | 4 |
| Cost | 110 fabric/leather | 110 fabric/leather |

Comfort 1.0 is above anything in the game: the highest vanilla value is 0.90, on the royal bed and
the grand armchair. If that is not wanted, it is one line.

## Compatibility with the original

The two cannot run together: `CP.Retro.Joy` is declared in `<incompatibleWith>`. Run one or the
other. Because the `defName`s match, swapping one for the other in an existing save keeps every
building already built.

**Shared Joys** needs nothing added for these three buildings. It accepts a building as a hangout
spot when a `JoyGiverDef` names its `ThingDef` in `<thingDefs>`, and all three do — that is the
case *Shared Joys - All Recreation* exists to work around, not one it has to handle.

## Repository layout

```
RetroJoy/
  Mod/     <- what goes on the Workshop; the NTFS junction into RimWorld/Mods points here
```

## Verification

The port was checked with the repository's three static checks:

```bash
pwsh -File scripts/Check-XmlFields.ps1  -ModPath RetroJoy/Mod
pwsh -File scripts/Check-XmlClasses.ps1 -ModPath RetroJoy/Mod -TypeLists rw16_types.txt
pwsh -File scripts/Check-DefRefs.ps1    -ModPath RetroJoy/Mod
```

One question they could not settle came up on the way and was settled by hand.
`<watchBuildingStandDistanceRange>` was written as `<min>2</min><max>4</max>` where Core writes
`2~4`, and `IntRange` is a `ParseHelper` type — a node with element children never reaches
`ParseHelper`, so this looked like a field that had been silently loading as `(0, 0)` for six years.
It was not: `DirectXmlToObject` falls through to reflection over the type's own fields, which are
named `min` and `max`, and Core writes ranges that way itself in three places, among them
`metalShrapnelCountRange` in `Ethereal_Skyfallers.xml`. Rewritten as `2~4` for readability only.

## Credits

- **Chicken Plucker** — the mod, the five buildings, the artwork, the balance.
- **dninemfive** — the B19-to-1.0 update, the melee-instead-of-intellectual change on Rock'em
  Sock'em, and the `Gaming_Video` recreation type that gives the console its reason to exist.

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence position and what exactly was carried over.

The 1.6 port was made with help from Claude (Anthropic), under human direction and in-game
testing.
