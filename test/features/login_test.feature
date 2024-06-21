import 'package:golden_toolkit/golden_toolkit.dart';

@integration
Feature: Home Screen Validates and then Login -
  Background:
    Given The app is running
  # When I set browser dimension width {437} and height {900}

  Scenario: Initial text fields are empty
    # Given The app is running
    Then I see {'Welcome Back'} text
    Then I see {'Username'} text
    Then I see {'Password'} text

  @tag3
  @testMethodName: testGoldens
  Scenario: The login header is purple
    Then The {'login'} header is verified

  @tag1
  @tag2
  Scenario: Login when username and password are in specified format
    # Given The app is running
    Then I see element with key {"LoginUserName"}
    Then I see element with key {"LoginPwd"}
    Then I see element with key {"LoginBtn"}
    # Then I have field with key {"LoginUserName"} and key {"LoginPwd"} and key {"LoginBtn"}
    When I enter {"vicky@test.com"} into {0} input field
    And I enter {"000000"} into {1} input field
    Then I see enabled elevated button
    Then I tap element with key {"LoginBtn"}
    Then I see page with title {"Flutter Demo Counter Page"}

