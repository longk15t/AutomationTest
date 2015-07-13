*** Variables ***
 # use 'emulator' or 'real'
${DEVICE}    emulator
${EMULATOR_NAME}    PixelXLAPI
${APPIUM_APP}    appium    -a    127.0.0.1
${ANDROID_SDK}    C:\\Users\\LongTH13\\AppData\\Local\\Android\\Sdk
${ANROID_EMULATOR}    ${ANDROID_SDK}\\emulator\\emulator.exe    -avd    ${EMULATOR_NAME}
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
${CMD_EXE}    C:\\WINDOWS\\System32\\cmd.exe
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    7.0
${DEVICE_NAME}    emulator-5554
${AUTOMATION_NAME}    uiautomator2
${APP_PACKAGE}    com.android.dialer
${COMMAND_TIMEOUT}    2500
${APP_ACTIVITY}    com.android.dialer.DialtactsActivity

# Locating elements
${DIAL_BUTTON}    id=com.android.dialer:id/floating_action_button
${DIAL_PAD}    id=com.android.dialer:id/dialpad_view