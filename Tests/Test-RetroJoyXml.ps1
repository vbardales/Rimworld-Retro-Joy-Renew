param([string]$ModPath = (Join-Path $PSScriptRoot '..\Mod'))
$ErrorActionPreference = 'Stop'
function Require([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
$about = [xml](Get-Content -Raw (Join-Path $ModPath 'About\About.xml'))
Require ($about.ModMetaData.packageId -eq 'nelim.retrojoy') 'packageId changed.'
Require ($about.ModMetaData.incompatibleWith.li -contains 'CP.Retro.Joy') 'Original mod is not incompatible.'
$defs = @(); Get-ChildItem (Join-Path $ModPath 'Defs') -Recurse -Filter *.xml | ForEach-Object { $defs += ([xml](Get-Content -Raw $_.FullName)).Defs.ChildNodes | Where-Object NodeType -eq 'Element' }
foreach ($name in 'RimtendoESConsole','RockemSockemTable','DNRandiesTable','RetroArmchair','RetroSmallTable') { Require ($defs.defName -contains $name) "Missing ThingDef $name." }
$console = $defs | Where-Object defName -eq 'RimtendoESConsole'; Require ($console.building.watchBuildingInSameRoom -eq 'true') 'Console can watch through walls.'; Require ($console.building.effectWatching -eq 'WatchingTelevision') 'Console screen effect missing.'
foreach ($name in 'PlayRockemSockem','PlayDNRandies','PlayRimtendoES') { $job=$defs | Where-Object { $_.Name -eq 'JobDef' -and $_.defName -eq $name }; Require ($job.allowOpportunisticPrefix -eq 'true') "Job $name lacks opportunistic prefix." }
Require (($defs | Where-Object { $_.Name -eq 'JobDef' -and $_.defName -eq 'PlayRimtendoES' }).isCrawlingIfDowned -eq 'false') 'Downed pawn crawl guard missing.'
foreach ($file in Get-ChildItem (Join-Path $ModPath 'Languages\French\DefInjected') -Recurse -Filter *.xml) { [xml](Get-Content -Raw $file.FullName) | Out-Null }
Write-Host 'Retro Joy XML contracts: PASS'
