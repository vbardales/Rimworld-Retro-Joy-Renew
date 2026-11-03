# Test plan

`Tests/Test-RetroJoyXml.ps1` checks identity, original-mod incompatibility, the five retained building defs and the four port corrections outside RimWorld. XML parsing, duplicate defNames and French key coverage belong to the shared `Check-ModBasics`, `Check-Translations` and `Check-DefInjected`.

Run by hand: `powershell -NoProfile -ExecutionPolicy Bypass -File Tests\Test-RetroJoyXml.ps1`.

Pickle covers only game-owned evidence: loading the definitions, observing the three recreation buildings in a colony, and reviewing English/French captures. There are no settings, dependencies, optional integrations, DLC branches, C# logic, or restart-specific state to duplicate.
