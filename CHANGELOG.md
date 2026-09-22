# Changelog

All notable changes to this mod are documented here.

## [1.0.0] — 2026-09-05

First release. Port of Chicken Plucker's **[CP] Retro Joy** to RimWorld 1.6.

Nothing in 1.6 had broken the mod: every XML element it writes still maps to a field on the 1.6
class, every def it references still exists, and all five RimWorld classes it names are still
there. Everything below is either a fault that predates the port or housekeeping.

### Fixed

- `watchBuildingInSameRoom` set to `true` on `RimtendoESConsole`. The field defaults to `false`,
  and all five watch-buildings in the game — the three televisions, the horseshoes pin, the
  hoopstone ring — set it. Without it the console's watch cells are not constrained to its room:
  the area `PlaceWorker_WatchArea` draws ran through walls, and colonists went and sat in the next
  room to play.
- `allowOpportunisticPrefix` set to `true` on `PlayRockemSockem`, `PlayDNRandies` and
  `PlayRimtendoES`. It defaults to `false` and every recreation `JobDef` in Core sets it; it is
  what lets a colonist heading for the table haul something on the way.
- `isCrawlingIfDowned` set to `false` on `PlayRimtendoES`, as on vanilla's `WatchTelevision` and
  for the same reason: the job carries `canDoWhileInBed`, so a downed colonist should watch from
  where they are rather than crawl to the console.

### Added

- `effectWatching` `WatchingTelevision` on `RimtendoESConsole` — the screen glow the three vanilla
  televisions have and nothing else in the game does.
- `Languages/French/`, 13 entries. *Dungeons and Randies* is **Donjons et Randys**: the pun is on
  Dragons and on Randy Random, whom the French game calls Randy Hasard.

### Changed

- Seven of the nine abstract bases in `CPMods_Bases.xml` dropped — apparel, meals, weapons,
  workbenches, none of which this mod inherits from — and the two it does use renamed to
  `RetroJoy_BuildingBase` and `RetroJoy_FurnitureBase`. Abstract def names never reach a save, so
  this is invisible in game. The rename is for legibility only: eight subscribed mods ship that
  file with the same nine `Name=` attributes, and that is not a clash. `XmlInheritance` stores
  `nodesByName` as a list per name, each node carrying its `ModContentPack`, and `GetBestParentFor`
  resolves homonyms to the nearest mod in load order, so every mod gets its own copy and nothing is
  logged.
- As a consequence, the mod's only two dead fields are gone: `CPBenchBase` wrote
  `workSpeedPenaltyOutdoors` and `workSpeedPenaltyTemperature`, neither of which is on
  `BuildingProperties` in 1.6. Nothing inherited from it, so they had never done anything.
- Textures moved from `Things/Furniture/` to `Things/RetroJoy/` and renamed after the defs that use
  them. RimWorld keys its texture database on path across all mods and the last one loaded wins;
  `SmallTable` and `SofaChair` are one collision away from any other furniture mod.
- Labels: `Retro armchair` → `retro armchair`, `Retro table (small)` → `retro table (small)`,
  `Rimtendo Console` → `Rimtendo console`. RimWorld capitalises a label itself at the start of a
  sentence and leaves it alone mid-sentence, which is why Core writes them lowercase but for proper
  nouns. `Rock'em Sock'em` and `Dungeons and Randies` are proper nouns and were left alone.
- `<watchBuildingStandDistanceRange>` written as `2~4` instead of `<min>2</min><max>4</max>`.
  Readability only — both forms load, and Core writes ranges the second way itself in three places.
- `packageId` changed from `CP.Retro.Joy` to `nelim.retrojoy`, and `CP.Retro.Joy` declared in
  `<incompatibleWith>`.
- `<supportedVersions>` set to 1.6.
- `About/preview.png` renamed to `Preview.png`. RimWorld looks for it by that exact name; the
  lowercase spelling worked only because the file system is case-insensitive. `About/modicon.png`
  was renamed the same way, and then removed — see below.
- `About/Changelog.txt` dropped; its four entries are folded into the history below.

### Removed

- `About/ModIcon.png`, which was Chicken Plucker's Rock'em Sock'em texture at 64 px. A mod icon
  inherited from the source is the source author's work standing in for the identity of the port,
  and the identity is the one thing a port should carry itself. A replacement in the repository's
  own style is pending; until then the mod ships with no icon, which RimWorld allows — about forty
  mods in this repository are in the same state. `Preview.png` is untouched and stays his.

### Unchanged

- The five buildings' stats, costs, stuff categories, damage rects, shadow volumes and draw sizes;
  the research that gates the console; the recreation durations, gain rates and participant counts;
  the skills the games train; the `Gaming_Video` recreation type; and all ten textures.
- The original `defName`s — `RimtendoESConsole`, `RockemSockemTable`, `DNRandiesTable`,
  `RetroArmchair`, `RetroSmallTable` — so a save moves between the two mods without losing
  anything.
- `About/Preview.png`, Chicken Plucker's own mock game-box showcase.
- The retro armchair's stats, which are strictly better than vanilla's armchair on every axis
  (Comfort 1.0 against 0.8, 220 hit points against 120, half the work to build, no research and no
  skill requirement). Changing them would be a rebalance, not a port. Noted in the README.

---

## Before the port

From the mod's own `About/Changelog.txt` and from its B18 ancestor
([1131675461](https://steamcommunity.com/sharedfiles/filedetails/?id=1131675461)). These are
Chicken Plucker's and dninemfive's changes, not this port's.

### B19 / 1.0 — dninemfive

- Updated to B19/1.0, which is where the game renamed `GamingDexterity` and `GamingCerebral` to
  `Gaming_Dexterity` and `Gaming_Cerebral`.
- A mask added to the Dungeons and Randies table so the figures stand out against the table's stuff
  colour.
- Rock'em Sock'em now trains **melee** instead of intellectual. ("Maybe I'm not getting a
  reference, but this seemed more appropriate.")
- The Rimtendo console given its own recreation type, `Gaming_Video`, instead of sharing cerebral
  play, so it is worth having next to a chess table. Its gain rate was cut from 1.5 to 1.35 to pay
  for it.
- Dungeons and Randies raised from 4 players to 8, enough to fill all eight cells around the 2×2
  table.

### 1.1 — Chicken Plucker

- The small table given the square texture it has now. It had been a hexagon, and the Steam page
  still says so.

### B18 — Chicken Plucker

- The original mod: five buildings, three recreation jobs, and a hexagonal tea table.
