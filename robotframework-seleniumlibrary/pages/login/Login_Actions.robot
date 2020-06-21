*** Settings ***
Resource          Login_Locators.robot

*** Keywords ***
Choose Language For XX Web
    [Documentation]    This keyword is used to choose language for XX website.
    [Arguments]    ${language}
    Wait Until Element Is Visible    ${language}
    Click Element    ${language}
    Verify Login Page Appears

Input Userame And Password
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Password    ${PASSWORD_FIELD}    ${password}

Click On Login Button
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Set Focus To Element    ${LOGIN_BUTTON}
    Click Button    ${LOGIN_BUTTON}

Click On Go To Login Page Button
    Wait Until Element Is Visible    ${TO_LOGIN_BUTTON}
    Click Element    ${TO_LOGIN_BUTTON}
