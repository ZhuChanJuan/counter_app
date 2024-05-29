Feature: Counter Page -
  Background:
    Given The app is running
    When I login with email {'vicky@test.com'} and password {'000000'}

  Scenario: Initial text fields are correct
    # Given The app is running
    # the partial text can't be used , we must use the whole text to check whether the widget exists
    # Then I see {'You have pushed the button this many times'} text
    Then I see {'You have pushed the button this many times:'} text
    Then I see {'0'} text
    Then I see {Icons.add} icon

  Scenario: Number could add normally
    Then I tap {Icons.add} icon
    Then I see {'1'} text
    Then I don't see {'0'} text

  Scenario: Forworad icon work well
    Then I tap {Icons.add} icon
    Then I tap {Icons.arrow_forward} icon
    Then I see {'Total Number'} text
    Then I see {'The number is 1'} text
    Then I see {'Dice Screen'} text

