---
mod: Retro Joy Renew (unofficial)
packageId: nelim.retrojoy
repo: Rimworld-Retro-Joy-Renew
remote: https://github.com/vbardales/Rimworld-Retro-Joy-Renew.git
visibility: public
detached: yes
workflow_stage: playTests[1.0.0]
licence: silent
licence_at: "2026-09-22: ATTRIBUTION.md documents five source checks (no LICENSE file, no About.xml mention, no linked repository, nothing in the Steam description, nothing on the author's profile) and no permission"
upstream_mod_remotes: N/A      # source mod 1842663639 links no repository (ATTRIBUTION.md, five checks)
settings_audit: not_applicable
localization: complete
translation_en: complete
translation_fr: complete
dependencies: none
workshop: 3811391689           # Mod/About/PublishedFileId.txt (untracked)
published: hidden              # 0.1.0, Workshop visibility hidden (owner, 2026-11-02)
tested_on: 2026-11-06 pickle 323b25d
remaining:
  - "2026-11-12: ticket aac2 GREEN 2/2 (downed from bed + vanilla TV control), proof minified in Tests/Pickle/Evidence/downed-west. Whole suite refiled on 6102805: EN 20261112-142622-500-31db, FR 20261112-142628-742-35db (-DepMap wsl-deps.sans-facultatifs.map). Read summary.json and junit.xml at RUN_DONE; then 8.i, 8.k, 8.m, tested_on"
  - "2026-11-12: TM rule 6.g: the ChatGPT review of 2026-11-03 falls in the faulty-header window (2026-10-17 to 2026-11-11), so /review-translation must be rerun on the French before it counts; Docs/review-refusals.md written (3 refusals of 2026-11-03). translation_fr stays complete (Virginie review 2026-11-03) until the rerun says otherwise"
  - "2026-11-11: (superseded by aac2 green) NPT 9a629c9 fixed the ambiguous powered step (battery one renamed `is powered by a battery`). Downed + control TV refiled: ticket 20261111-183347-775-aac2 (c8de38f, map sans-facultatifs, filter 02-recreation::downed): read summary.json and junit.xml at RUN_DONE"
  - "2026-11-11: ticket 20261111-175952-068-9069 (NPT 6630f9e) FAILED 0/2: Ambiguous step DecorSteps.BuildingPowered (StageDecor) vs WorldProbeSteps.Powered (ColonistRace) on \"the building ... is powered\". Asked NPT (PiT session) to disambiguate; report read and deleted from Inbox. Next: refile downed + control TV scenario on the new NPT sha"
  - "2026-11-11: downed scenario (02-recreation.feature, scenario 4): setup bugs found one by one with NPT diagnostics: step order (schedule before lay down), bed on a watch cell (72, 89), console and TV facing north, and the BED rotation gate of CanWatchFromBed (bed facing North fails when the building is south of the pawn): bed now facing west. Ticket 20261111-175952-068-9069 filed (downed + control TV scenario, NPT 6630f9e), result pending: read summary.json and junit.xml at RUN_DONE; if green, delete the control scenario or keep it (owner of the test: me), commit, then whole suite EN then FR. Inbox triaged, empty. CI dry-run green (run 42887356749 on 490714a)"
  - "2026-11-10: CI dry-run run 42887356749 on 490714a (ref = that SHA, 1.0.0): GREEN. Change note read from PUBLICATION.md, upload path and workshop.vdf checked, nothing sent to Steam. Gallery folder Art/Gallery not in the commit (gallery not made yet, expected); public page not readable (hidden item), comparisons skipped"
  - "2026-11-10: CI dry-run run 42887147624 on 7ff4216 (ref = that SHA, 1.0.0): change note OK, then FAILED ENOENT Mod/About/PublishedFileId.txt (untracked, not in the pinned commit). Commit it, push, rerun the dry-run on the new SHA (needs a new owner go)"
  - "2026-11-10: CI dry-run publish-tag.yml run 42886403096 on f4ca814 (ref main, version 1.0.0, mode dry-run): FAILED in changenote.mjs, Error: no \"### 1.0.0\" section found. PUBLICATION.md has no change note section for 1.0.0: owner text to write, then rerun the dry-run. No Steam contact, no secret"
  - "2026-11-10: verified: initial Pickle suite green EN and FR (2/2 each, exitReason passed, run 2026-11-06 on 1.6.4871), loading, no ERROR from this mod in Player.log; evidence minified in Tests/Pickle/Evidence/initial-en and initial-fr. Still unverified: English/French display, recreation behaviour, log output beyond load, save compatibility. The @review scenario only asserts 'no errors were logged' and takes no capture: nothing to review visually"
  - "2026-11-10: playTests state: Tests/Pickle/Mod/Pickle/Features/02-recreation.feature scripted (9 scenarios) with the PickleTools bundle-only map. Green one by one in English: console research (ticket 4136), television and Dungeons and Randies XP (1148), Rock'em Melee (2d23), furniture tab and Rock'em label (71cd), capture read and kept (8.d, Evidence/capture-furniture). Whole suite in English filed as ticket 20261110-192301-822-7df3 on 8f3f93f: read summary.json and junit.xml at RUN_DONE; the downed-from-bed and wall scenarios are the first play of NPT in-bed giver and no-job steps. Then: whole suite in French, 8.i (EN/FR display, the console label is not asserted because languages differ), 8.k, 8.m code review (Opus once), tested_on to refresh"
  - "2026-11-10: Check-Status WARN rimworld-version (About.xml description names 1.6, touches Mod/). Test-shape conversion done: Rule-OwnValues.ps1 validated by Audit, Test-Mod.ps1 and .github generated, 6 passed. PublishedFileId.txt untracked: commit before publication"
  - "2026-11-10: scenario 7 (opportunistic haul) covered offline by Rule-OwnValues.ps1, in game n/a (engine behaviour of the flag); scenario 3 wall case asserts the negative giver step"
  - "2026-11-03: unverified: 8.m code review (Opus sub-agent, once after the tests), 8.l evidence and tested_on"
  - "2026-11-03: decision owner: CHANGELOG.md heading [1.0.0] 2026-09-05 First release vs hidden 0.1.0; About.xml description names 1.6 (Check-Status WARN, touches Mod/)"
protocols_read_sha: 9481d090854f082b638e84ad647a202fec7de6d2
updated: 2026-11-10    # initial Pickle runs read and sorted, protocols re-read
---

# Retro Joy Renew — status

## Translation audit (localize) — 2026-11-03

English comes from the Def values; French lives in `Mod/Languages/French/DefInjected` (14 keys across
`ThingDef`, `JobDef`, `JoyKindDef`). `Check-Translations` PASS (10 source texts, 3 nested) and
`Check-DefInjected` 0 errors on 14 keys. `RockemSockemTable.label` now has an explicit French entry equal
to its English name, kept on purpose (the toy's name). Agreement and register read sentence by sentence:
`RockemSockemTable.description` had "votre" and "nous", both forbidden in text read by the player;
rewritten with the owner's wording ("pour le plaisir de tous", "les mécanoïdes détestent l'humanité").
No text agrees with a pawn, so no gendered form is needed. `FRENCH_REVIEW.md` generated by
`Make-FrenchReview.ps1`. Two ChatGPT passes (`/review-translation`) read it: the console description
was reworded (« qui ne viole absolument aucun droit d'auteur »); the other points were judged not
relevant (Core's own "Pluies toxiques" term, the owner's "pour le plaisir de tous", the inherited
`RetroSmallTable` description). Virginie's French review: done 2026-11-03, revision 5b31971, corrections
as listed above, no further correction. `translation_fr: complete`. Unverified: in-game display of
English and French (`playTests`).

## Tests written (writeTests) — 2026-11-03, tested sha 5b31971

`Tests/Test-RetroJoyXml.ps1` PASS, `Check-ModBasics` PASS (9 XML files, 12 defs), `Check-Translations`
PASS, `Check-DefInjected` 0 errors on 14 keys, all on 5b31971. No unit-test project: nothing to unit
test, the mod has no code. Ten functional scenarios are written in `TESTING.md`; the Pickle suite
`Tests/Pickle` (two scenarios, one `@review`) is written and not run. `PUBLICATION.md` written. No
`@requires`: no optional mod. A later commit to `Mod/` reopens these checks.

## Settings audit — 2026-11-03, revision 8252f82

`settings_audit: not_applicable`. Inventory read in `Mod/`: no assembly and no `Source/`, so no
`ModSettings` class and no Mod options page; no `MainButtonDef` and no word "Settings" in `Mod/Defs` or
`Mod/Languages`, so no MainButtons shortcut; no inherited setting (no dependency, no optional
integration, see Dependencies). The mod is fixed content: five buildings, three jobs, three joy givers
and one joy kind, with the values of the source mod. No behaviour gives a player a concrete reason to
tune it, so no option is proposed. Absence of an empty page and of a shortcut is established from these
sources, not from the absence of C#. Application moments, persistence and RIMMSQOL checks do not apply.
In-game confirmation that no Mod options entry appears is part of `playTests`.

## Dependencies — 2026-11-03, revision 37c2f95

None. `About.xml` declares no `modDependencies`, `loadAfter` or `loadBefore`; `incompatibleWith` lists
`CP.Retro.Joy` (the source mod, same defNames). `Mod/` has no `Patches/`, no `LoadFolders.xml` and no
`MayRequire`; every referenced type and def resolves to Core. No DLC is referenced. The mod adds no
animal, so the four animal integrations of ANIMALS.md do not apply. `supportedVersions`: 1.6.

## 1.a duplicate check — 2026-11-03

`Search-Workshop.sh` over the five retained building defNames (`RetroArmchair`, `RetroSmallTable`,
`RimtendoESConsole`, `RockemSockemTable`, `DNRandiesTable`): 15 hits, in three places only. They are
the source mod 1842663639, this mod's own Workshop item 3811391689 and the local
`Mods/RetroJoyRenew` link. No other Workshop mod declares them. Hits file:
`%LOCALAPPDATA%\Temp\rimworld-search\retrojoy-dup\hits.txt`.

## Audit — 2026-09-22

**Current stage: `done`.** RetroJoyRenew is now an autonomous `main` repository connected to
`https://github.com/vbardales/Rimworld-Retro-Joy-Renew.git`. Its pre-existing remote history
(`2c61b21`) was fetched and merged into the local root commit rather than replaced; the resulting
merge commit `088c925` was pushed and verified at `origin/main`. The parent monorepo's unrelated
local changes were not touched.

The rights decision remains `silent`: the distributed `LICENSE` and `ATTRIBUTION.md` consistently
limit MIT to Nelim's port work, record no permission for Chicken Plucker's source material, and
preserve removal-on-request wording. The public metadata now carries the exact ` (unofficial)`
suffix and required opening notice in both About.xml and README.md.

### Preserved-content inventory

No separate local source copy of Retro Joy was found by searching Documents, Downloads and Desktop
for its Workshop ID (`1842663639`), `CP.Retro.Joy`, and its three recreation table/console defNames.
The current checkout contains the retained game content: five original concrete `ThingDef` names,
three `JoyGiverDef`s, three `JobDef`s, `Gaming_Video`, and ten PNG textures. The original Preview
is installed at `Mod/About/Preview.png`: 896×504 px and 885,309 bytes; its full-resolution source
is retained at `Art/Preview.png`. The maintainer-generated ModIcon is installed at 128×128 px, with
its full-resolution source in `Art/ModIcon-source.png` and a 32 px QA rendition in
`Art/ModIcon-32px-QA.png`.

### Static content checks

- Parsed all nine XML files under `Mod/`: all are well-formed.
- Confirmed the distributed attribution copy matches the root copy. Both licence copies carry the
  same scoped rights statement; their letter-case difference in the copyright holder prevents an
  identical-file hash and is not treated as a licence grant or loss.
- Confirmed no assemblies, C# source, `LoadFolders.xml`, hard dependencies, settings definitions,
  MainButtons definition, or test directory exists. This fixed-content mod has no useful player
  setting to expose; source/definition inspection also establishes that it exposes neither an empty
  Mod options page nor a shortcut. `settings_audit: not_applicable` is justified.
- Ran the supplied checks against the distributed folder: `Check-XmlFields.ps1` found no unknown
  1.6 field across six Def files; `Check-XmlClasses.ps1` resolved all 12 referenced types; and
  `Check-DefRefs.ps1` completed its Core reference scan.

### Translation audit

The player-facing inventory consists of five `ThingDef` labels, five descriptions, three job report
strings, and the `Gaming_Video` label. English is provided by those source Def values. French
DefInjected resources cover every changed/localizable value: 13 explicit French entries across
`ThingDef`, `JobDef`, and `JoyKindDef`; `RockemSockemTable.label` intentionally remains the same
proper name from its English Def. No code-owned UI strings or Keyed resources exist. XML parsing and
the explicit inventory comparison found no missing or empty required French translation.

English and French display in a running game remain unverified and are tracked separately in
`remaining`; they do not invalidate the static localization gate.

`Check-DefInjected.ps1 -TransMod .\\Mod` indexed 11,595 defs and checked all 13 French injection
keys with zero errors. The primary description ends with the required exact GitHub BBCode source
link. Options, localization, no-dependency declaration, tests and Pickle scenarios support the
completed ordered transitions through `preTest`.

## Tests for `preTest → done`

`Tests/Test-RetroJoyXml.ps1` was re-executed successfully after the asset delivery. It validates
package identity, the original-mod incompatibility, five retained ThingDefs, all four port
corrections, and French XML resources. The supplied XML field/type/reference and DefInjected checks
also pass. `Tests/Pickle/` contains the isolated companion and Gherkin suite: its no-dependency
scenario checks the loaded mod and core Defs, while its review scenario reserves colony-visible
recreation evidence for a real game. No Windows RimWorld was launched.

## Next required transition

To reach `tested`, execute the written Pickle suite in separate English and French WSL passes,
inspect the required capture, and record the logs and evidence. This must use the shared WSL launcher
and machine lock; Windows RimWorld must not be launched.
