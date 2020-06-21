*** Settings ***
Resource          Payment_Actions.robot

*** Keywords ***
User Navigates To Bill Payment Page
    [Documentation]    This keyword is used to access to Payment page.
    User Is In Payment Menu
    Click On Payment Sub Menu

User Navigates To New Billing Template Page
    [Documentation]     This keyword is used to access to Template page.
    Click On Template Button
    Wait Until Element Is Visible   ${NAME_BILLING_NAME_EDT}
    Wait Until Element Is Visible   ${XP_PP_GET_CATEGORY}
    Wait Until Element Is Visible   ${XP_PP_GET_COMPANY}
    Wait Until Element Is Visible   ${XP_PP_GET_ACCOUNT}
    Wait Until Element Is Visible   ${NAME_PP_GET_CREDIT_CARD_NUMBER}
    Wait Until Element Is Visible   ${XP_SAVE_BILLING_TEMPLATE}
