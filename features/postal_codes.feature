Feature: Understand Canadian postal codes

  Scenario: Typical postal code
    When I enter postal code J5L 1A8
    Then it is valid

  Scenario Outline: LDL DLD
    When I enter postal code <input>
    Then it's an error

    Examples:
      | input  |
      | 11A 1A1 |
      | AAA 1A1 |
      | A11 1A1 |
      | A1A AA1 |
      | A1A 111 |
      | A1A 1AA |
      | 1A1 A1A |

  Scenario Outline: Gibberish
    When I enter postal code <input>
    Then it's an error

    Examples:
      | input  |
      | BOB LOBLAW |
      | U*FOO      |
      | foofooo    |
      | JP1 DDD    |
      | GGGGgg!    |
      | ++++       |
      | Marcel     |
      | Leboeuf    |
      | 0          |
      | J7Y        |

  Scenario Outline: Forbidden letters
    When I enter postal code <input>
    Then it is softly invalid

    Examples:
      | input   |
      | D1A 1A1 |
      | F1A 1A1 |
      | I1A 1A1 |
      | O1A 1A1 |
      | Q1A 1A1 |
      | U1A 1A1 |
      | W1A 1A1 |
      | A1W 1A1 |
      | A1A 1Q1 |

  Scenario Outline: Spaces don't matter
    When I enter postal code <input>
    Then the canonical representation is "J7Y 6B1"

    Examples:
      | input   |
      | J7Y 6B1 |
      | J7Y6B1  |
      | J7Y-6B1 |


