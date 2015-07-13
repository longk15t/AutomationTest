Feature: Visit GitHub page

    Background: Open web browser
        Given I was redirected to url "http://github.com"

    Scenario: Search public repository (this is a passed test case)
        When I search with keyword "python"
        Then I am navigated to Search result page
        And I see the label "Python is a dynamically typed programming language"
    
    Scenario: Access to signup page (this is a failed test case)
        When I click Sign Up button
        Then I am navigated to Join GitHub page
        And I see field Username, Email address, Password
    
    Scenario: Explore Github (this is a passed test case)
        When I hover my mouse to Explore menu
        And I clicks the "Explore Github" option
        Then I am navigated to Explore GitHub page