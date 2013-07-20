Feature: Determine whether postal code is in range

  Scenario: One FSA
    Given the zone is J7Y
    Then J7Y 4B1 should be included
    But J7Z 1A1 shouldn't be included

  Scenario: One letter
    Given the zone is H
    Then H2J 1B1 should be included
    But J4C 1P3 shouldn't be included

  Scenario: Hyphen range
    Given the zone is G5U-G5X
    Then G5V 1S1 should be included
    But G5Z 0A0 shouldn't be included

  Scenario: Multiple ranges
    Given the zone is "H2, H3A-H3C"
    Then H2J 1X1 should be included
    And H3A 1B7 should be included
    And H3B 2B9 should be included
    And H3C 3B6 should be included
    But H3D 5A5 should not be included

  Scenario: Three ranges
    Given the zone is "H2H, H2J, H2T"
    Then H2J 1B9 should be included
    But H2K 0A3 should not be included

  Scenario: No range
    Given the zone is ""
    Then H0H 0H0 should not be included
    Then V1A 0B3 should not be included

  Scenario: Everywhere
    Given the zone is "*"
    Then H0H 0H0 should be included
    Then T1A 2P4 should be included

  Scenario Outline: Less than perfect input
    Given the zone is <zone>
    Then <location> should be included

    Examples:
      | zone    | location |
      | J7Z     | j7z 1a1   |
      | j7z     | j7z 2a2   |
      | j7x     | J7X 9P3   |
      | H2x     | h2X 1z7   |
      | t1r     | t1r-5s2   |
      | A1B3    | a1b 3r0   |
