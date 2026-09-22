---
localization:   complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:            Retro Joy Renew
packageId:      nelim.retrojoy
repo:           Rimworld-Retro-Joy-Renew
visibility:     public
detached:       no
stage:          dansMonoRepo
licence:        silent
licence_at:     ATTRIBUTION.md documents five source checks and no permission
dependencies:   none
showcase:       preview
tested_on:
workshop:
remaining:
  - defect: public silent-source naming and notice do not meet PUBLISHING.md; the distributed name lacks ` (unofficial)` and the required opening notice is absent from About.xml and README.md
  - unverified: autonomous GitHub repository, remote, and first pushed commit; RetroJoyRenew is an untracked directory inside the rimworld monorepo
  - unverified: ModIcon.png is absent; the existing preview was syntax/dimension checked but not visually inspected during this audit
  - unverified: in-game loading, English/French display, recreation behaviour, log output, and save compatibility
  - unverified: no automated, XML-specific, functional, or Pickle test suite is present
session:        2026-09-22 audit, revision e1b09c690a205d3b179d5263e9458d6b63fe7984 (monorepo HEAD)
updated:        2026-09-22
---

# Retro Joy Renew — status

## Audit — 2026-09-22

**Retained stage: `dansMonoRepo`.** This checkout has no `.git` directory of its own; `git
rev-parse --show-toplevel` resolves to `C:/Users/nelim/Documents/rimworld`, and every RetroJoyRenew
file is untracked there. Therefore the first `dansMonoRepo → horsMonoRepo` transition is not
established: there is no autonomous repository, configured GitHub remote, or pushed initial commit.
The parent monorepo had local changes outside this directory; they were not touched.

The rights decision is `silent`: the distributed `LICENSE` and `ATTRIBUTION.md` consistently limit
MIT to Nelim's port work, record no permission for Chicken Plucker's source material, and preserve
removal-on-request wording. For a public `silent` mod, however, PUBLISHING.md requires the exact
` (unofficial)` suffix and opening notice. Their absence is a confirmed documentation/metadata
defect, not an inference about the author's consent.

### Preserved-content inventory

No separate local source copy of Retro Joy was found by searching Documents, Downloads and Desktop
for its Workshop ID (`1842663639`), `CP.Retro.Joy`, and its three recreation table/console defNames.
The current checkout itself contains the content documented as retained: five original concrete
`ThingDef` names, three `JoyGiverDef`s, three `JobDef`s, `Gaming_Video`, ten PNG textures, and
Chicken Plucker's `About/Preview.png`. The preview is a valid 630×330 PNG, 258,421 bytes
(SHA-256 `BD6B95D5718E6B1BE077864A451952B04669043597CB7301FD933D598BA2691A`). Its visual composition
was not assessed in this audit. `About/ModIcon.png` is absent.

### Static content checks

- Parsed all nine XML files under `Mod/`: all are well-formed.
- Confirmed the distributed attribution copy matches the root copy. Both licence copies carry the
  same scoped rights statement; their letter-case difference in the copyright holder prevents an
  identical-file hash and is not treated as a licence grant or loss.
- Confirmed no assemblies, C# source, `LoadFolders.xml`, hard dependencies, settings definitions,
  MainButtons definition, or test directory exists. This fixed-content mod has no useful player
  setting to expose; source/definition inspection also establishes that it exposes neither an empty
  Mod options page nor a shortcut. `settings_audit: not_applicable` is justified.

### Translation audit

The player-facing inventory consists of five `ThingDef` labels, five descriptions, three job report
strings, and the `Gaming_Video` label. English is provided by those source Def values. French
DefInjected resources cover every changed/localizable value: 13 explicit French entries across
`ThingDef`, `JobDef`, and `JoyKindDef`; `RockemSockemTable.label` intentionally remains the same
proper name from its English Def. No code-owned UI strings or Keyed resources exist. XML parsing and
the explicit inventory comparison found no missing or empty required French translation.

English and French display in a running game remain unverified and are tracked separately in
`remaining`; they do not invalidate the static localization gate.

## Next required transition

To reach `horsMonoRepo`, extract this directory into its own Git repository, configure and verify
the intended GitHub remote, make the initial commit, and push it. Resolve the public silent-source
metadata defect before treating the rights/publication decision as coherent. The ModIcon and final
description-link checks belong to later transitions and are retained as independent pending work.
