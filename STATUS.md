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
showcase:       generated preview and maintainer-generated ModIcon checked
tested_on:
workshop:
remaining:
  - unverified: in-game loading, English/French display, recreation behaviour, log output, and save compatibility
  - unverified: execute the written Pickle suite in separate English and French WSL passes and review the capture
session:        2026-09-22, revision 8530395
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

## Independent test evidence

`Tests/Test-RetroJoyXml.ps1` was executed successfully against `Mod/`. It validates package identity,
the original-mod incompatibility, five retained ThingDefs, all four port corrections, and French XML
resources. `Tests/Pickle/` contains the isolated companion and Gherkin suite: its no-dependency scenario
checks the loaded mod and core Defs, while its review scenario reserves the colony-visible recreation
evidence for a real game. No Windows RimWorld was launched.

## Next required transition

To reach `done`, rerun the offline test after this asset/documentation change and record the result.
The later Pickle execution remains pending and must use the shared WSL launcher and machine lock;
Windows RimWorld must not be launched.
