Feature: Google shopping filters
  In order to find the products that I want
  As a user on google shopping
  I want to be able to filter my results

  Scenario: I can find items less than £15
    Given I am on the google shopping page
    And I search for "Marmite"
    Then I get "Marmite" results
    When I click on up to £15
    Then None of the results are more that £15

  Scenario: I can find only books
    Given I am on the google shopping page
    And I search for "Marmite"
    Then I get "Marmite" results
    When I click on books
    Then the results are all books

  Scenario: I can find products sold by Tesco
    Given I am on the google shopping page
    And I search for "Marmite"
    Then I get "Marmite" results
    When I click on Ocado
    Then the results are for Ocado

  Scenario: I can find products sold by Eat big
    Given I am on the google shopping page
    And I search for "Marmite"
    Then I get "Marmite" results
    When I click more
    And I click on Eat big
    Then the results are for Eat big

  Scenario: I can find products between £20 and £30
    Given I am on the google shopping page
    And I search for "Marmite"
    Then I get "Marmite" results
    When I enter £20
    And I enter £30
    And I click go
    Then the results are all between £20 and £30