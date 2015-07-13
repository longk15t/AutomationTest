*** Settings ***
Documentation    This script automate Windows desktop app (Notepad)
Resource    resource.robot
Test Setup    resource.Open Notepad app
Test Teardown    resource.Close Notepad app

*** Test cases ***
Print document to PDF
    Given user type "abcxyz" to notepad
    When user open Print dialog and click Print button
    Then document is printed in pdf file

Check version of Notepad
    Given user type "Hello world" to notepad
    When user click menu Help then About to check the version
    Then notepad version should be 1709