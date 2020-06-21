*** Settings ***
Resource          ../../../../Common/Common_Keywords.robot
Resource          ../../../../Pages/Home/Home_Page.robot
Resource          ../../../../Pages/Banking/Payment/Payment_Page.robot
Resource          Payment_Variables.robot
Variables         Payment_${ENV}_Data.yaml

*** Keywords ***
User Selects Billing Name For Credit Card
    Select Billing Name    ${BILLING_NAME_CREDIT_CARD}

User Selects Billing Name For Hospital
    Select Billing Name    ${BILLING_NAME_HOSPITAL}

User Enters Amount
    Enter Value For Amount    ${BILL_PAYMENT_1.AMOUNT}

Verify That Error Message Should Be Displayed When Credit Card Value Is String
    Verify Value Of Element Attribute Should Be Equal    ${XP_INVALID_CREDIT_CARD_NUMBER}    ${ERR_MSG_CREDIT_CARD_IS_NUMERIC}

