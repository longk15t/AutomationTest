*** Variables ***
 # use 'emulator' or 'real'
${DEVICE1}    emulator
${DEVICE2}    emulator

${EMULATOR_NAME1}    Pixel
${EMULATOR_NAME2}    Pixel2
${APPIUM_APP1}    appium    -a    127.0.0.1    -p    4723
${APPIUM_APP2}    appium    -a    127.0.0.1    -p    4725
${ANDROID_SDK}    C:\\Users\\LongTH13\\AppData\\Local\\Android\\Sdk
${ANROID_EMULATOR1}    ${ANDROID_SDK}\\emulator\\emulator.exe    -avd    ${EMULATOR_NAME1}
${ANROID_EMULATOR2}    ${ANDROID_SDK}\\emulator\\emulator.exe    -avd    ${EMULATOR_NAME2}
${APPIUM_SERVER1}    http://127.0.0.1:4723/wd/hub
${APPIUM_SERVER2}    http://127.0.0.1:4725/wd/hub
${CMD_EXE}    C:\\WINDOWS\\System32\\cmd.exe
${PLATFORM_NAME1}    Android
${PLATFORM_NAME2}    Android
${PLATFORM_VERSION1}    7.0
${PLATFORM_VERSION2}    8.0
${DEVICE_NAME1}    emulator-5554
${DEVICE_NAME2}    emulator-5556
${AUTOMATION_NAME}    uiautomator2
${APP_PACKAGE}    com.google.android.apps.messaging
${COMMAND_TIMEOUT}    2500
${APP_ACTIVITY}    com.google.android.apps.messaging.ui.ConversationListActivity
${ABD_KILL_COMMAND}    adb    kill-server
${NUMBER_USER1}    5555215554
${NUMBER_USER2}    5555215556

# Locating Messages elements
${NEW_CONVERSATION_BUTTON}    id=com.google.android.apps.messaging:id/start_new_conversation_button
${TYPE_NUM_FIELD}    id=com.google.android.apps.messaging:id/recipient_text_view
${CONVERSATION_SCREEN}    id=com.google.android.apps.messaging:id/conversation_and_compose_container
${TEXT_FIELD}    id=com.google.android.apps.messaging:id/compose_message_text
${SEND_BUTTON}    xpath=//android.widget.ImageView[contains(@resource-id, "send")]
${CONTACT_OPTIONS}    xpath=//android.widget.ImageView[@content-desc="More options"]
${DELETE_MESS_BUTTON}    xpath=//android.widget.TextView[@text="Delete"]
${DELETE_CONFIRM_BUTTON}    xpath=//android.widget.Button[@text="DELETE"]