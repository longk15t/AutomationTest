*** Settings ***
Resource          ../../Common/Common_Keywords.robot
Resource          ../../Pages/Home/Home_Page.robot
Resource          ../../Pages/Login/Login_Page.robot
Resource          Login_Variables.robot

*** Keywords ***
User Inputs Valid Username And Password
    Input Userame And Password    ${ACCOUNTS.${ENV}.USERNAME_1}    ${ACCOUNTS.${ENV}.PASSWORD}

User Inputs Wrong Username
    Input Userame And Password    ${INVAILD_USER}    ${ACCOUNTS.${ENV}.PASSWORD}

User Inputs Wrong Password
    Input Userame And Password    ${ACCOUNTS.${ENV}.USERNAME_1}    ${INVALID_PWD}

User Inputs Wrong Username And Wrong Password
    Input Userame And Password    ${INVAILD_USER}    ${INVALID_PWD}

User Inputs Empty For Username
    Input Userame And Password    ${EMPTY}    ${ACCOUNTS.${ENV}.PASSWORD}

User Inputs Empty For Password
    Input Userame And Password    ${ACCOUNTS.${ENV}.USERNAME_1}    ${EMPTY}

User Inputs Empty For Username And Password
    Input Userame And Password    ${EMPTY}    ${EMPTY}
