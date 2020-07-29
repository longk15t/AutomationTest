*** Settings ***
Resource          login_locators.robot

*** Keywords ***
Verify login page appears
    [Documentation]    This keyword is used to verify Login page appears
    Wait Until Element Is Visible    ${username_field}
    Wait Until Element Is Visible    ${password_field}
    Wait Until Element Is Visible    ${submit_btn}

Access to Sign in page
    Sleep    5s
    # Wait Until Element Is Visible    ${signin_button}
    Click Element    ${signin_button}
    Verify login page appears

Input credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${username_field}    ${username}
    Input Password    ${password_field}    ${password}

Click Sign in button
    Click Button    ${submit_btn}

Verify error message display
    Wait Until Element Is Visible    ${error_elem}
    Page Should Contain Element    ${error_elem}
