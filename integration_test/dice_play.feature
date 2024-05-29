
Feature: Random Dice Page -
  Background:
    Given The app is running
    When I login with email {'vicky@test.com'} and password {'000000'}
    Then I goto 'TotalNumber' page
    Then I goto 'PlayDice' page

  Scenario: Default picture and text display normally
    Then I see {'Play Dice'} text
    Then I see {Icons.play_arrow} icon

