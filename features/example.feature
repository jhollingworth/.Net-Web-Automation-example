@story-1
Feature: Example
  So that I can understand how to use cucumber and capybara
  As a developer
  I want some example scenarios

  Scenario: I do not enter a name
    Given I am on the test page
    And I fill in the form correctly
    But I set "Name" to be ""
    When I click "Submit"
    Then I should see the error message "Please enter your name"

  @dev
  Scenario: I do not enter a date
    Given I am on the test page
    And I fill in the form correctly
    But I set "Date" to be ""
    When I click "Submit"
    Then I should see the error message "Please enter a valid date"

  Scenario: I enter an invalid date
    Given I am on the test page
    And I fill in the form correctly
    But I set "Date" to be "foo"
    When I click "Submit"
    Then I should see the error message "Please enter a valid date"

  @james
  Scenario: I correctly fill in the form
    Given I am on the test page
    And I set "Name" to be "Foo"
    And I set the date to be tomorrow
    When I click "Submit"
    Then the page should show "Foo"
    And the page should show tomorrow's date

