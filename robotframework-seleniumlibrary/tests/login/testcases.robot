*** Settings ***
Documentation     Test suite contains all the test cases of Authentication feature
Resource          Login_Keywords.robot
Force Tags        XX    Login
Test Setup        Go To XX Login Page With English Language    ${ENVIRONMENT.${ENV}.LOGIN_URL}
Test Teardown     Close Browser

*** Test Cases ***
Verify That User Can Login XX With Valid Username And Password
    [Tags]    Login_Success
    User Inputs Valid Username And Password
    Click On Login Button
    Verify Login Success
    Take Page Screenshot
    [Teardown]    Logout XX And Close Browser

Verify That User Can Not Login With Invalid Username
    [Tags]    Login_Failure
    User Inputs Wrong Username
    Click On Login Button
    Verify That Logging In Is Failed

Verify That User Can Not Login With Invalid Password
    [Tags]    Login_Failure
    User Inputs Wrong Password
    Click On Login Button
    Verify That Logging In Is Failed

Verify That User Can Not Login With Invalid Username And Password
    [Tags]    Login_Failure
    User Inputs Wrong Username And Wrong Password
    Click On Login Button
    Verify That Logging In Is Failed

Verify That User Can Not Login With Empty Username
    [Tags]    Login_Failure
    User Inputs Empty For Username
    Click On Login Button
    Verify That Logging In Is Failed

Verify That User Can Not Login With Empty Password
    [Tags]    Login_Failure
    User Inputs Empty For Password
    Click On Login Button
    Verify That Logging In Is Failed

Verify That User Can Not Login With Empty Username And Password
    [Tags]    Login_Failure
    User Inputs Empty For Username And Password
    Click On Login Button
    Verify That Logging In Is Failed
