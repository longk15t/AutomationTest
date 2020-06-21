*** Settings ***
Resource          Home_Actions.robot
Resource          ../../Common/Common_Keywords.robot
Variables         ../../Common/Settings.yaml
Resource          ../Login/Login_Page.robot

*** Keywords ***
User Logs In To XX Home Page
    [Documentation]    This keyword is used to access to XX Home Page.
    FOR    ${index}    IN RANGE    0    3
        ${status} =    Run Keyword And Return Status    Run Keywords
        ...    Go To XX Login Page With English Language    ${ENVIRONMENT.${ENV}.LOGIN_URL}
        ...    AND    Login To XX    ${ACCOUNTS.${ENV}.USERNAME_1}    ${ACCOUNTS.${ENV}.PASSWORD}
        Run Keyword Unless    ${status}    Logout XX And Close Browser
        EXIT FOR LOOP IF    ${status}
    END

User Logs Out And Goes To XX Home Page
    [Documentation]    This keyword is used to perform logout action and login to Home page.
    Logout IB
    Click On Go To Login Page Button
    Login To XX    ${ACCOUNTS.${ENV}.USERNAME_1}    ${ACCOUNTS.${ENV}.PASSWORD}

Logout XX
    [Documentation]    This keyword is used to perform logout successfully.
    Unselect Frame On Home Page
    Click On Logout Button
    Click On OK Button From Confirmation Dialog
    Verify That Logout Successful

Logout XX And Close Browser
    [Documentation]    This keyword is used to perform logout website and close browser.
    Logout XX
    Close Browser

User Is In Main Page Menu
    ${status} =    Run Keyword And Return Status    Element Should Be Visible    ${MAIN_PAGE}
    Run Keyword Unless    ${status}    Scroll To Element    ${MAIN_PAGE}
    Click Link    ${MAIN_PAGE}
    Sleep    5s
