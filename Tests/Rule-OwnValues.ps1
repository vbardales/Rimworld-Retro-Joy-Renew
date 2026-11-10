param([Parameter(Mandatory)][string]$ModRoot, [string]$SharedDir)

# Own values and facts of this port's content: the About identity (packageId nelim.retrojoy) and the incompatibility with the source
# mod CP.Retro.Joy, the five retained ThingDefs, and the four port corrections (console watched only in its own room with the
# television screen effect, opportunistic prefix on the three Play jobs, no crawl to the console when downed). One consumer, nothing
# shareable; Tests/Test-Mod.ps1 (generated) runs it after the shared checks. Prints findings, exit 1 on any.
# XML well formed, unique defNames, About shape and "(unofficial)", images: Check-ModBasics. French key coverage: Check-Translations
# and Check-DefInjected. Def references: Check-DefRefs. None of them is repeated here.
$ErrorActionPreference = 'Stop'
$mod = Join-Path (Resolve-Path -LiteralPath $ModRoot).Path 'Mod'
$script:findings = @()

# One rule: the block returns its problems; each is printed under the rule name.
function It([string]$name, [scriptblock]$body) {
    try { $problems = @(& $body | Where-Object { $_ }) } catch { $problems = @("threw: $($_.Exception.GetBaseException().Message)") }
    foreach ($p in $problems) { $script:findings += "[$name] $p" }
}
function Read-Xml([string]$p) { [xml](Get-Content -LiteralPath $p -Raw -Encoding UTF8) }
function Def([string]$type, [string]$name) {
    $node = $script:index["${type}:$name"]
    if ($null -eq $node) { throw "Missing $type $name" }
    return $node
}

$script:index = @{}
foreach ($file in Get-ChildItem -LiteralPath (Join-Path $mod 'Defs') -Recurse -File -Filter *.xml) {
    foreach ($node in (Read-Xml $file.FullName).SelectNodes('/Defs/*[defName]')) { $script:index["$($node.Name):$($node.defName)"] = $node }
}

It 'About identity and incompatibility with the source mod' {
    $about = (Read-Xml (Join-Path $mod 'About/About.xml')).ModMetaData
    if ($about.packageId -cne 'nelim.retrojoy') { "packageId is '$($about.packageId)', expected nelim.retrojoy" }
    if ($about.incompatibleWith.li -notcontains 'CP.Retro.Joy') { 'The source mod CP.Retro.Joy is not declared incompatible' }
}
It 'The five retained building defNames exist as ThingDef' {
    foreach ($name in 'RimtendoESConsole', 'RockemSockemTable', 'DNRandiesTable', 'RetroArmchair', 'RetroSmallTable') { $null = Def 'ThingDef' $name }
}
It 'Console is watched like a television, in its own room only' {
    $console = Def 'ThingDef' 'RimtendoESConsole'
    if ($console.building.watchBuildingInSameRoom -cne 'true') { 'Console can be watched through a wall (watchBuildingInSameRoom not true)' }
    if ($console.building.effectWatching -cne 'WatchingTelevision') { 'Console screen effect is not WatchingTelevision' }
}
It 'The three Play jobs allow an opportunistic prefix' {
    foreach ($name in 'PlayRockemSockem', 'PlayDNRandies', 'PlayRimtendoES') {
        if ((Def 'JobDef' $name).allowOpportunisticPrefix -cne 'true') { "Job $name lacks allowOpportunisticPrefix" }
    }
}
It 'A downed pawn does not crawl to the console' {
    if ((Def 'JobDef' 'PlayRimtendoES').isCrawlingIfDowned -cne 'false') { 'PlayRimtendoES lets a downed pawn crawl (isCrawlingIfDowned not false)' }
}

if ($script:findings.Count) { $script:findings | ForEach-Object { Write-Host $_ }; exit 1 }
Write-Host 'Retro Joy own values: PASS'
