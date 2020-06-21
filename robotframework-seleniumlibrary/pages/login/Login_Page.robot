*** Settings ***
Resource          Login_Actions.robot
Resource          ../Home/Home_Locators.robot
Resource          ../../Common/Common_Keywords.robot

*** Keywords ***
Go To XX Login Page With English Language
    [Arguments]  ${login_url}
    [Documentation]    This keyword is used to go to login page with English language.
    Open Browser And Go To Login Page    ${login_url}
    Verify Login Page Appears
    Choose Language For XX Web    ${ENG_LANGUAGE}

Verify Login Page Appears
    [Documentation]    This keyword is used to verify Login page is appear.
    Wait Until Element Is Visible    ${USERNAME_FIELD}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Page Should Contain Element    ${LOGIN_BUTTON}

Login To XX
    [Documentation]    Login to XX with given username and password
    [Arguments]    ${username}    ${password}
    Verify Login Page Appears
    Input Userame And Password    ${username}    ${password}
    Click On Login Button
    Verify Login Success

Verify Login Success
    Wait Until Location Is    ${ENVIRONMENT.${ENV}.HOME_PAGE_URL}
    Select Frame On Home Page    ${IFRAME_1}
    Wait Until Element Is Visible    ${SERVICE_MENU}    100s
    Page Should Contain Element    ${SERVICE_MENU}

Verify That Logging In Is Failed
    Verify Login Page Appears
    Page Should Contain Element    ${ERROR_LOCATOR}
    ${error_message}=    Get Text    ${ERROR_LOCATOR}
    Should Contain Any    ${error_message}    ${ERROR_USER_MSG}    ${ERROR_PWD_MSG}    ${EMPTY_USER_MSG}    ${EMPTY_PWS_MSG}
    Take Page Screenshot

Verify That Logout Successful
    Wait Until Location Is    ${ENVIRONMENT.${ENV}.LOGOUT_URL}
    Wait Until Element Is Visible    ${TO_KASIKORN_BUTTON}
    Page Should Contain Element    ${TO_KASIKORN_BUTTON}
