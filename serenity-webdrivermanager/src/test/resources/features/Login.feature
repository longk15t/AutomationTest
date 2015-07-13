Feature: Login with invalid credentials

  Background: user open web browser and navigate to Github Login page
    Given user opened web browser

  Scenario: Login with incorrect password
    When user logged in using username as 'longk15t' and password as 'randompassword'
    Then error message 'Incorrect username or password.' should be displayed