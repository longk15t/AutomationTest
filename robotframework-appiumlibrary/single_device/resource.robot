*** Settings ***
Documentation    This script starts apps on emulator
Library    AppiumLibrary
Library    Process
Resource    PageObject.robot

*** Keywords ***
Start Appium Server and emulator
    Start Process    ${CMD_EXE}    /k    ${APPIUM_APP}    >    appium_log.txt    alias=appium_call
    Wait For Process    appium_call    timeout=10s
    Process Should Be Running    appium_call
    Run Keyword If    '${DEVICE}' == 'emulator'    Start Process    ${CMD_EXE}    /k
    ...    ${ANROID_EMULATOR}    >    emulator_log.txt      alias=emulator_call
    Wait For Process    emulator_call    timeout=10s
    Process Should Be Running    emulator_call

user start application Dialer
    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}
    ...    newCommandTimeout=${COMMAND_TIMEOUT}    appActivity=${APP_ACTIVITY}
    Sleep    3s

user click dialer button
    Click Element    ${DIAL_BUTTON}
    Sleep    3s

dial pad shows up
    Element Should Be Visible    ${DIAL_PAD}
