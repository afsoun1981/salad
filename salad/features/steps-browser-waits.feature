Feature: Ensuring that the 'wait for' steps work
    In order to make sure that the wait module works
    As a developer
    I test against the javascript test files

    Scenario: 1. I can wait for an element to appear
        Given I visit the salad test url "browser/wait.html"
         When I look around
         Then I should see the element with the id "always_there" within 3 seconds
          And I wait for the element with the id "js2_block" to be visible within 5 seconds

    Scenario: 2. I can wait for an element to appear
        Given I visit the salad test url "browser/wait.html"
         When I look around
         Then I should see the element with the id "always_there" within 3 seconds
          And I wait for the element with the id "js2_block" to be visible

