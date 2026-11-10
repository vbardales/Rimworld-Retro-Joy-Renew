Feature: Retro Joy Renew loads and exposes its recreation content

  Scenario: the three recreation buildings and their joy kind load
    Then mod "nelim.retrojoy" is loaded
    And def "RimtendoESConsole" of type "ThingDef" exists
    And def "RockemSockemTable" of type "ThingDef" exists
    And def "DNRandiesTable" of type "ThingDef" exists
    And def "Gaming_Video" of type "JoyKindDef" exists
