*** Settings ***
Resource          Payment_Locators.robot
Resource          ../../../Tests/Banking/Payment/Bill_Payment/Payment_Variables.robot

*** Keywords ***


Get Current Date DD/MM/YYYY Format
    ${datetime}=    Get Current Date    UTC    + 7 hours    result_format=%d/%m/%Y
    [Return]    ${datetime}

Click On Bill Payment Sub Menu
    [Documentation]    This keyword is used to click on Bill Payment Sub-menu.
    Wait Until Element Is Visible    ${XP_BILLPAYMENT_SUBMENU}
    Click Element    ${XP_BILLPAYMENT_SUBMENU}
    Wait Until Element Is Visible    ${XPBILLING_TEMPLATE_BTN}

Click On Confirm Button
    Wait Until Element Is Visible    ${NAME_CONFIRM_BUTTON}
    Click Element    ${NAME_CONFIRM_BUTTON}

Click On Billing Button
    Wait Until Element Is Visible    ${XPBILLING_TEMPLATE_BTN}
    Click Element    ${XPBILLING_TEMPLATE_BTN}

Get Text Element Of Dropdown
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${text}=    Get Selected List Label    ${locator}
    [Return]    ${text}

Get Value Element Of Input
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${value}=    Get Value    ${locator}
    [Return]    ${value}

