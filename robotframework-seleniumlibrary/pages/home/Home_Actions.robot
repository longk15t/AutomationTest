*** Settings ***
Resource          Home_Locators.robot

*** Keywords ***
Click On Logout Button
    [Documentation]    This keyword is used to Logout application.
    Wait Until Page Contains Element    ${LOGOUT_BUTTON}
    Click Element    ${LOGOUT_BUTTON}

Click On OK Button From Confirmation Dialog
    [Documentation]    This keyword is used to click on OK button on Confirmation Dialog.
    Handle Alert

Select Frame On Home Page
    [Documentation]    This keyword is used to select into Frame on Home page.
    [Arguments]    ${iframe}
    Wait Until Element Is Visible    ${iframe}    50s
    Select Frame    ${iframe}

Unselect Frame On Home Page
    [Documentation]    This keyword is used to unselect Frame on Home page.
    Unselect Frame
