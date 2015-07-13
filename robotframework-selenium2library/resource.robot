*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library    Selenium2Library
Library    OperatingSystem
Resource    PageObject.robot

*** Keywords ***
user open ${url} page
    Run Keyword If    '${url}' == 'Linkedin'    Open Browser    ${LINKEDIN_URL}    ${BROWSER}
    Run Keyword If    '${url}' == 'Google'    Open Browser    ${GOOGLE_URL}    ${BROWSER}

user maximize window
    Maximize Browser Window

page should contains element ${elem}
    Run Keyword If    '${elem}' == 'Signin button'    Page Should Contain Element    ${SIGNIN_BUTTON}
    Run Keyword If    '${elem}' == 'Search bar'    Page Should Contain Element    ${SEARCH_BAR}
