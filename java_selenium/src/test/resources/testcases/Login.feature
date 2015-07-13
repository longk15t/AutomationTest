Feature: Login to Linkedin page

Background: User access Linkedin page
    When user open browser and access page linkedin
    Then user should see Login page of Linkedin

Scenario: Login invalid
    When user input invalid username and password
    And clicks Signin button
    Then user see the error message

Scenario: Login valid
    When user input valid username and password
    And clicks Signin button
    Then user see the home page