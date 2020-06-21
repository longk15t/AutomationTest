*** Variables ***
${XP_GET_NAME_BILLING}                  //table[@id='bill_payment_main']//tr//a
${XP_BILLPAYMENT_SUBMENU}               //div[@id='DDp']//a[contains(text(), Payment')]
${XP_CREATE_BILLING_TEMPLATE_BTN}       //img[contains(@alt, Billing Template')]/parent::a
#Billing Name Template
${NAME_BILLING_NAME_EDT}                name=templateSaveAsName
${XP_SAVE_BILLING_TEMPLATE}             //input[contains(@src,'SaveBilling')]
${XP_RETURN_TO_BILLING_LIST_BTN}        //input[contains(@src,'ReturntoPayment')]

