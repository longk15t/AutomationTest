*** Settings ***
Documentation     Test suite contains all the test cases of Login feature
Resource          ../../pages/login/login_actions.robot
Resource          ../../common/common_keywords.robot
Test Setup        Open browser and access to page    ${browser}    ${ENVIRONMENT.${ENV}.BASE_URL}
Test Teardown     Close Browser

*** Test Cases ***
Verify invalid credentials
    [Tags]    login_failed
    Access to Sign in page
    Input credentials    ${INVAILD_USER}    ${INVALID_PWD}
    Click Sign in button
    Verify error message display
