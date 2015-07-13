*** Settings ***
Documentation    A demo project for using robot framework
Library    Selenium2Library
Resource    resource.robot
Test Teardown    Close Browser

*** Test Cases ***
Login to Linkedin page
    Given user open Linkedin page
    When user maximize window
    Then page should contains element Signin button

Search a keyword in Google
    Given user open Google page
    When user maximize window
    Then page should contains element Search bar