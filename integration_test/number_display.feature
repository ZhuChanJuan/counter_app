Feature: Total Number Page -
  Background:
    Given The app is running

  Scenario: Forward icon works well
    # Given The app is running
    Then I don't see {'Random Dice Page'} text
    Then I tap {Icons.arrow_forward_ios_rounded} icon
    Then I see {'Random Dice Page'} text
