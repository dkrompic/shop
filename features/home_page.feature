# features/home_page.feature
Feature: Home page

  Scenario: Viewing application's home page
    Given there's is a product titled "BDD test" 
    When I am on the homepage
    Then I should see the "BDD test" product