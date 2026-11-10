# The functional scenarios of TESTING.md that only a running game can show (1 to 6, 8, 10).
#
# Scenario 7 (opportunistic hauling) is covered offline: Tests/Rule-OwnValues.ps1 asserts allowOpportunisticPrefix on the three
# Play jobs, and what the flag does is the game's own behaviour. Scenario 9 (English and French) is the label scenario at the end,
# run in both languages; the console label itself is not asserted because the two languages differ.
# Every scenario builds its own 5 by 5 room at (70, 85) on a freshly loaded test-colony; Jet is a colonist of that save.
# Written 2026-11-10 on steps compiled and not yet played: a red scenario may be a step to fix, read the failure before the mod.
@requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.research @requires:nelim.pickletools.deffields @requires:nelim.pickletools.screenshotstudio
Feature: Retro Joy Renew recreation behaves as the description promises

  Background:
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: a closed roofed room is built at (70, 85) of 5 by 5

  @timeout:300
  Scenario: the console is buildable only once tube television is researched
    Given Nelim's Pickle Tools: all research is reset
    Then Nelim's Pickle Tools: the architect tab "Joy" does not show the def "RimtendoESConsole"
    Given Nelim's Pickle Tools: all research is finished
    Then Nelim's Pickle Tools: the architect tab "Joy" shows the def "RimtendoESConsole"

  @timeout:300
  Scenario: a colonist plays on the console like on a television
    Given Nelim's Pickle Tools: I place the decor "RimtendoESConsole" owned by the colonists at (72, 88)
    And Nelim's Pickle Tools: the building "RimtendoESConsole" at (72, 88) is powered
    And Nelim's Pickle Tools: I place the decor "Armchair" on a cardinal cell next to the nearest "RimtendoESConsole"
    And Nelim's Pickle Tools: the schedule of "Jet" is joy all day
    When Nelim's Pickle Tools: I remember "Jet"'s joy level
    And Nelim's Pickle Tools: I remember "Jet"'s joy tolerance for the kind "Gaming_Video"
    And Nelim's Pickle Tools: the joy giver "PlayRimtendoES" job is forced on "Jet"
    Then "Jet" has job "PlayRimtendoES"
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Jet"'s joy level is higher than remembered
    And Nelim's Pickle Tools: "Jet"'s joy tolerance for the kind "Gaming_Video" is higher than remembered
    And no errors were logged

  @review @timeout:300
  Scenario: a colonist in the next room cannot use the console through the wall
    Given Nelim's Pickle Tools: I place the decor "RimtendoESConsole" owned by the colonists at (72, 88)
    And Nelim's Pickle Tools: the building "RimtendoESConsole" at (72, 88) is powered
    And Nelim's Pickle Tools: "Jet" stands at (77, 88)
    When Nelim's Pickle Tools: the reasons why "Jet" cannot take "RimtendoESConsole" at (72, 88) for joy are logged
    Then no errors were logged

  @timeout:300
  Scenario: a downed colonist plays on the console from bed
    Given Nelim's Pickle Tools: I place the decor "RimtendoESConsole" owned by the colonists at (72, 88)
    And Nelim's Pickle Tools: the building "RimtendoESConsole" at (72, 88) is powered
    And Nelim's Pickle Tools: I place the decor "Bed" owned by the colonists at (73, 86)
    And Nelim's Pickle Tools: "Jet" is downed in the bed at (73, 86)
    And Nelim's Pickle Tools: the schedule of "Jet" is joy all day
    When Nelim's Pickle Tools: I remember "Jet"'s joy level
    And Nelim's Pickle Tools: the joy giver "PlayRimtendoES" job is forced on "Jet"
    Then "Jet" has job "PlayRimtendoES"
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Jet"'s joy level is higher than remembered
    And no errors were logged

  @timeout:300
  Scenario: colonists play Rock'em Sock'em and train melee
    Given Nelim's Pickle Tools: I place the decor "RockemSockemTable" owned by the colonists at (72, 88)
    And Nelim's Pickle Tools: I place the decor "DiningChair" on a cardinal cell next to the nearest "RockemSockemTable"
    And Nelim's Pickle Tools: the schedule of "Jet" is joy all day
    When Nelim's Pickle Tools: I remember "Jet"'s skill "Melee" experience
    And Nelim's Pickle Tools: I remember "Jet"'s joy tolerance for the kind "Gaming_Dexterity"
    And Nelim's Pickle Tools: the joy giver "PlayRockemSockem" job is forced on "Jet"
    Then "Jet" has job "PlayRockemSockem"
    When I wait 900 ticks
    Then Nelim's Pickle Tools: "Jet"'s skill "Melee" experience is higher than remembered
    And Nelim's Pickle Tools: "Jet"'s joy tolerance for the kind "Gaming_Dexterity" is higher than remembered
    And no errors were logged

  @timeout:300
  Scenario: colonists play Dungeons and Randies and train intellectual
    Given Nelim's Pickle Tools: I place the decor "DNRandiesTable" owned by the colonists at (72, 87)
    And Nelim's Pickle Tools: I place the decor "DiningChair" on a cardinal cell next to the nearest "DNRandiesTable"
    And Nelim's Pickle Tools: the schedule of "Jet" is joy all day
    When Nelim's Pickle Tools: I remember "Jet"'s skill "Intellectual" experience
    And Nelim's Pickle Tools: I remember "Jet"'s joy tolerance for the kind "Gaming_Cerebral"
    And Nelim's Pickle Tools: the joy giver "PlayDNRandies" job is forced on "Jet"
    Then "Jet" has job "PlayDNRandies"
    When I wait 900 ticks
    Then Nelim's Pickle Tools: "Jet"'s skill "Intellectual" experience is higher than remembered
    And Nelim's Pickle Tools: "Jet"'s joy tolerance for the kind "Gaming_Cerebral" is higher than remembered
    And no errors were logged

  @timeout:300
  Scenario: the armchair and the small table are in the Furniture tab
    Then Nelim's Pickle Tools: the architect tab "Furniture" lists the def "RetroArmchair"
    And Nelim's Pickle Tools: the architect tab "Furniture" lists the def "RetroSmallTable"

  @timeout:300
  Scenario: Rock'em Sock'em keeps its English name in both languages
    Then Nelim's Pickle Tools: the def "RockemSockemTable" of type "ThingDef" is labelled "Rock'em Sock'em"
    And no errors were logged

  @review @requires:nelim.pickletools.camerazoom @timeout:300
  Scenario: the recreation furniture is visible in a loaded colony
    Given Nelim's Pickle Tools: I place the decor "RimtendoESConsole" exactly at (70, 87)
    And Nelim's Pickle Tools: I place the decor "RockemSockemTable" exactly at (72, 89)
    And Nelim's Pickle Tools: I place the decor "DNRandiesTable" exactly at (74, 87)
    And Nelim's Pickle Tools: I place the decor "RetroArmchair" exactly at (71, 85)
    And Nelim's Pickle Tools: I place the decor "RetroSmallTable" exactly at (73, 85)
    When Nelim's Pickle Tools: I frame the cells (69, 84) to (75, 90) filling 85 percent of the screen
    And Nelim's Pickle Tools: the framed cells fill at least 80 percent of the screen
    And Nelim's Pickle Tools: the map is shown alone for a capture
    Then I take a screenshot "recreation furniture in a colony"
    And no errors were logged
