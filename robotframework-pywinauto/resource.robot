*** Settings ***
Documentation    This script provides keywords for test cases
Library    PageObject.Notepad

*** Keywords ***
Open Notepad app
    Open App

Close Notepad app
    Close App
    Delete file

user type "${input}" to notepad
    Type in notepad    ${input}

user open Print dialog and click Print button
    Print current document

document is printed in pdf file
    Check document is printed to pdf file

user click menu Help then About to check the version
    Open about dialog

notepad version should be ${ver}
    Check Notepad version is    ${ver}
