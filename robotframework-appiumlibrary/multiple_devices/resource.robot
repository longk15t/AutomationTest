*** Settings ***
Documentation    This script starts apps on emulator
Library    AppiumLibrary
Library    Process
Library    OperatingSystem
Resource    PageObject.robot

*** Keywords ***
Start Appium Server and devices
    Log to console    ${\n}INFO: Starting appium server port 4723...
    Start Process    ${CMD_EXE}    /k    ${APPIUM_APP1}    >    appium_log1.txt    alias=appium_call1
    Log to console    ${\n}INFO: Starting appium server port 4725...
    Start Process    ${CMD_EXE}    /k    ${APPIUM_APP2}    >    appium_log2.txt    alias=appium_call2
    Wait For Process    appium_call1    timeout=5s
    Wait For Process    appium_call2    timeout=5s
    Process Should Be Running    appium_call1
    Log to console    ${\n}INFO: Started appium server port 4723
    Process Should Be Running    appium_call2
    Log to console    ${\n}INFO: Started appium server port 4725
    Run Keyword If    '${DEVICE1}' == 'emulator'    Start Process    ${CMD_EXE}    /k
    ...    ${ANROID_EMULATOR1}    >    emulator_log1.txt      alias=emulator_call1
    Wait For Process    emulator_call1    timeout=30s
    Process Should Be Running    emulator_call1
    Run Keyword If    '${DEVICE2}' == 'emulator'    Start Process    ${CMD_EXE}    /k
    ...    ${ANROID_EMULATOR2}    >    emulator_log2.txt      alias=emulator_call2
    Wait For Process    emulator_call2    timeout=30s
    Process Should Be Running    emulator_call2

User opens Messages app
# Both devices use same app so appPackage and appActivity are same
    Log to console    ${\n}INFO: Open Messages app on device 1
    ${user1}    Open Application    ${APPIUM_SERVER1}    platformName=${PLATFORM_NAME1}    platformVersion=${PLATFORM_VERSION1}
    ...    deviceName=${DEVICE_NAME1}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}
    ...    newCommandTimeout=${COMMAND_TIMEOUT}    appActivity=${APP_ACTIVITY}
    Sleep    10s
    Set Suite Variable    ${user1}
    Log to console    ${\n}INFO: Open Messages app on device 2
    ${user2}    Open Application    ${APPIUM_SERVER2}    platformName=${PLATFORM_NAME2}    platformVersion=${PLATFORM_VERSION2}
    ...    deviceName=${DEVICE_NAME2}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}
    ...    newCommandTimeout=${COMMAND_TIMEOUT}    appActivity=${APP_ACTIVITY}
    Sleep    10s
    Set Suite Variable    ${user2}

User clears chat and close Messages app
    Log to console    ${\n}INFO: Users clears chat and close Messages app
    Switch Application    ${user1}
    Click Element    ${CONTACT_OPTIONS}
    Sleep    1s
    Click Element    ${DELETE_MESS_BUTTON}
    Sleep    1s
    Click Element    ${DELETE_CONFIRM_BUTTON}
    Sleep    1s
    Close Application
    Switch Application    ${user2}
    Click Element    ${CONTACT_OPTIONS}
    Sleep    1s
    Click Element    ${DELETE_MESS_BUTTON}
    Sleep    1s
    Click Element    ${DELETE_CONFIRM_BUTTON}
    Sleep    1s
    Close Application

Terminate processes on devices
    Log to console    ${\n}INFO: Teardown - Terminate process on both devices
    Run Process    ${CMD_EXE}    /c    ${ABD_KILL_COMMAND}
    Switch Application    ${user1}
    Terminate All Processes
    Switch Application    ${user2}
    Terminate All Processes

user1 and user2 want to send text message together
    Log to console    ${\n}user1 and user2 want to send text message together
    Switch Application    ${user1}
    Click Element    ${NEW_CONVERSATION_BUTTON}
    Wait Until Element Is Visible    ${TYPE_NUM_FIELD}
    Click Element    ${TYPE_NUM_FIELD}
    Input Text    ${TYPE_NUM_FIELD}    ${NUMBER_USER2}
    Press Keycode    66
    Wait Until Element Is Visible    ${CONVERSATION_SCREEN}
    Switch Application    ${user2}
    Click Element    ${NEW_CONVERSATION_BUTTON}
    Wait Until Element Is Visible    ${TYPE_NUM_FIELD}
    Click Element    ${TYPE_NUM_FIELD}
    Input Text    ${TYPE_NUM_FIELD}    ${NUMBER_USER1}
    Press Keycode    66
    Wait Until Element Is Visible    ${CONVERSATION_SCREEN}

When ${user} sends message "${text}"
    Log to console    ${\n}${user} sends message "${text}"
    Run Keyword If    '${user}' == 'user1'    Switch Application    ${user1}
    Run Keyword If    '${user}' == 'user2'    Switch Application    ${user2}
    Click Element    ${TEXT_FIELD}
    Input Text    ${TEXT_FIELD}    ${text}
    Click Element    ${SEND_BUTTON}

Then ${user} receives message "${text}"
    Log to console    ${\n}Check if ${user} receives message "${text}"
    Run Keyword If    '${user}' == 'user1'    Switch Application    ${user1}
    Run Keyword If    '${user}' == 'user2'    Switch Application    ${user2}
# This sleep depends on emulator performance/network. Need a better way than sleeping
    Sleep    5s
    Element Should Be Visible    xpath=//android.widget.TextView[@text="${text}"]
