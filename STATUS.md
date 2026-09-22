---
localization:   complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:            Retro Joy Renew (unofficial)
packageId:      nelim.retrojoy
repo:           Rimworld-Retro-Joy-Renew
visibility:     public
detached:       yes
stage:          preTest
licence:        silent
licence_at:     ATTRIBUTION.md documents five source checks and no permission
dependencies:   none
showcase:       ModIcon and preview checked
tested_on:
workshop:
remaining:
  - unverified: in-game loading, English/French display, recreation behaviour, log output, and save compatibility
  - unverified: no automated, XML-specific, functional, or Pickle test suite is present; these are required for preTest → done
session:        2026-09-22, revision 088c925e20bed23224774613c750f57fdb5468fc
updated:        2026-09-22
---

# Retro Joy Renew — status

## Audit — 2026-09-22

**Current stage: `preTest`.** RetroJoyRenew is now an autonomous `main` repository connected to
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
The current checkout itself contains the content documented as retained: five original concrete
`ThingDef` names, three `JoyGiverDef`s, three `JobDef`s, `Gaming_Video`, ten PNG textures, and
Chicken Plucker's `About/Preview.png`. The preview is a valid 630×330 PNG, 258,421 bytes
(SHA-256 `BD6B95D5718E6B1BE077864A451952B04669043597CB7301FD933D598BA2691A`). Its visual composition
was inspected directly: it is an authored game-box presentation and remains attributed to Chicken
Plucker. An original generated ModIcon is installed at `Mod/About/ModIcon.png`: 128×128 px,
22,023 bytes, SHA-256 `382126BEB490E236EA82D1797C39F78EE77AE871F83888ADBD6BA7EBC8A7B1E1`.
The 32 px QA image confirms that the mascot and CRT silhouette remain distinct; its full-resolution
source is retained at `Art/ModIcon-source.png`.

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
link, and its name/suffix, preview, icon, options, localization, and no-dependency declaration
support the completed transitions through `l10n → preTest`.

## Next required transition

To reach `done`, add proportionate functional scenarios, executable XML validation, and an isolated
Pickle suite for the features only a running game can demonstrate. Execute the non-game checks and
record their results against the distributed version. Pickle execution, English/French UI review,
logs, save coverage, and captures remain `done → tested` work and must not launch Windows RimWorld.
