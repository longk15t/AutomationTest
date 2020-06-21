*** Settings ***
Library           ExtendedSeleniumLibrary
Library           Collections
Library           String
Library           DateTime
Library           OperatingSystem
Variables         Settings.yaml

*** Keywords ***
Open Browser And Go To Login Page
    [Documentation]    Check ${BROWSER} value for the system before running (stored in Settings.robot).
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${chrome_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${BROWSER}    Chrome    ignore_case=True
    ${firefox_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${BROWSER}    Firefox    ignore_case=True
    ${ie_status} =    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${BROWSER}    IE    ignore_case=True
    Run Keyword If    ${chrome_status}    Open Chrome Browser And Go To Login Page    ${login_url}
    ...    ELSE IF    ${firefox_status}    Open Firefox Browser And Go To Login Page    ${login_url}
    ...    ELSE IF    ${ie_status}    Open IE Browser And Go To Login Page    ${login_url}
    ...    ELSE    Fail    ERROR! Unidentified browser:    ${BROWSER}

Open Chrome Browser And Go To Login Page
    [Documentation]    Open Chrome Browser and go to login page.
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open Chrome Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${system}=    Evaluate    platform.system()    platform
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_experimental_option  useAutomationExtension     ${False}
    Run Keyword If    '${system}'=='Linux'    Run Keywords
    ...    Call Method    ${chrome_options}    add_argument    test-type
    ...    AND    Call Method    ${chrome_options}    add_argument    ignore-certificate-errors
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...    AND    Call Method    ${chrome_options}    add_argument    --headless
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...    AND    Call Method    ${chrome_options}    add_argument    --no-sandbox
    ${driver_path}=    Run Keyword If    '${system}'=='Linux'    Set Variable    ${CHROME_DRIVER_PATH_UNIX}
    ...    ELSE    Set Variable    ${EXECDIR}/${CHROME_DRIVER_PATH_WINS}
    ${kwargs}=    BuiltIn.Create Dictionary    executable_path=${driver_path}
    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${driver_path}
    Run Keyword If    '${system}'=='Windows'    Maximize Browser Window
    Go To    ${login_url}

Open Firefox Browser And Go To Login Page
    [Documentation]    Open Firefox Browser and go to login page.
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open Firefox Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${system}=    Evaluate    platform.system()    platform
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Run Keyword If    '${system}'=='Linux'.
    ...    Call Method    ${firefox_options}    add_argument    --headless
    ${driver_path}=    Run Keyword If    '${system}'=='Linux'    Set Variable    ${FIREFOX_DRIVER_PATH_UNIX}
    ...    ELSE    Set Variable    ${FIREFOX_DRIVER_PATH_WINS}
    ${kwargs}=    BuiltIn.Create Dictionary    executable_path=${driver_path}
    Create Webdriver    Firefox    firefox_options=${firefox_options}    executable_path=${driver_path}
    Run Keyword If    '${system}'=='Windows'    Maximize Browser Window
    Go To    ${login_url}

Open IE Browser And Go To Login Page
    [Documentation]    Open Internet Explorer and go to login page.
    ...    \n*login_url*:    login URL with specific environment in Settings.yaml file.
    ...    \nExample:
    ...    \n| `Open IE Browser And Go To Login Page` | ${login_url} |
    [Arguments]    ${login_url}
    ${system}=    Evaluate    platform.system()    platform
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].InternetExplorerOptions()    sys, selenium.webdriver
    Run Keyword If    '${system}'=='Linux'
    #Todo
    Go To    ${login_url}

Verify Value Of Element Attribute Should Be String And Not Empty
    [Arguments]    ${locator}
    ${value} =    Get Text Element    ${locator}
    Should Not Be Empty    ${value}
    Should Be String    ${value}

Get Text Element
    [Documentation]    Gets the text value of element
    ...    \n*locator*:    locator of the element
    ...    \nExample:
    ...    \n| `Get Text Element` | ${FROM_ACCOUNT_REVIEW} |
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${return_text}=    Get Text    ${locator}
    [Return]    ${return_text}

    Take Page Screenshot

Get Content Of Transaction Result Message
    [Arguments]    ${locator}
    ${content} =    Get Text Element    ${locator}
    [Return]    ${content}


