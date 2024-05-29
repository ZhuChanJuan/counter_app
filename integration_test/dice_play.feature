
Feature: Random Dice Page -
  Background:
    Given The app is running

  Scenario: Default picture and text display normally
    Then I see {'Play Dice'} text
    Then I see {Icons.play_arrow} icon

