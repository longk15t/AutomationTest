*** Settings ***
Documentation    This script starts apps on emulator
Library    AppiumLibrary
Library    Process
Resource    resource.robot
Suite Setup    resource.Start Appium Server and emulator
Test Teardown    Close Application
Suite Teardown    Terminate All Processes    kill=true

*** Test cases ***
Dial a number
    Given user start application Dialer
    When user click dialer button
    Then dial pad shows up