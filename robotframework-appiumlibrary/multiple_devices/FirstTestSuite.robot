*** Settings ***
Documentation    Test cases for multiple devices interact each other
Library    AppiumLibrary
Resource    resource.robot
Suite Setup    resource.Start Appium Server and devices
Test Setup    resource.User opens Messages app
Test Teardown    resource.User clears chat and close Messages app
Suite Teardown    resource.Terminate processes on devices

*** Test cases ***
both users send text messages
    Given user1 and user2 want to send text message together
    When user1 sends message "Hello buddy"
    Then user2 receives message "Hello buddy"
    When user2 sends message "Hello there. how r u?"
    Then user1 receives message "Hello there. how r u?"