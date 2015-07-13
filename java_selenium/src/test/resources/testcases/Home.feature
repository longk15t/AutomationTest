Feature: Play around Home page

Background: User access Linkedin page and signin with valid credentials
    When user open browser and access page linkedin
    When user input valid username and password
    And clicks Signin button
    Then user see the home page

Scenario: Access profile page
    When user clicks the avatar
    Then profile page should be opened
