*** Settings ***
Documentation     Test suite contains all the test cases of Payment feature.
Resource          Payment_Keywords.robot
Force Tags        XX    Banking    Bill_Payment
Suite Setup       User Logs In To IB Home Page
Suite Teardown    Logout XX And Close Browser
Test Teardown     Run Keywords    User Is In Main Page Menu
...               AND    Register Keyword To Run On Failure    User Logs Out And Goes To XX Home Page

*** Test Cases ***
Verify That User Can Not Perform Paying If Not Select From Account Field
    [Documentation]    This test case is used to verify that error message should be displayed
    ...    If user doesn't select From Account.
    [Tags]    Payment_Invalid_2
    User Navigates To Payment Page
    User Selects Billing Name For Credit Card
    User Does Not Select Text Into From Account Field
    User Clicks On Paying Button
    Verify That Error Message Should Be Displayed When From Account Is Not Select

