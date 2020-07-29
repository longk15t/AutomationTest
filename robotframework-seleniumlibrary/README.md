## Installation
`pip install robotframework`

`pip install robotframework-seleniumlibrary`

`pip install pyyaml`

## Project Structure

    K-Cyber
        |- Common
            |- Common_Keywords.robot        # Contains all the common keywords of project
            |- Screenshot_Keywords.robot    # Contains all the relevant keywords of Capture Screenshot feature
            |- Settings.yaml                # Contains all accounts, URLs for specific environment, Driver path, Default Browser
        |- Drivers                          # Selenium Drivers for browsers
        |- Libs                             # Library Extension from SeleniumLibrary (defined custom python libraries here)
        |- Pages                            # Contains Robot Resource that defined keywords for related pages in WebUI (Page Object Model)
            |- Page1
                |- Page1_Locators.robot     # Contains locating elements on that page
                |- Page1_Actions.robot      # Contains specific actions on that page (Low Level Keywords)
                |- Page1_Pages.robot        # Contains reusable keywords from the actions on that page (High Level Keywords)
            |-
            |- PageN
                |- PageN_Locators.robot
                |- PageN_Actions.robot
                |- PageN_Pages.robot
        |- Results                          # Contains test results such as report.html, log.html, output.xml and screenshot
        |- Tests                            # Contains All Test Suite files 
            |- Suite A
                |- A_Data.yaml              # Contains all the data that you will use to run the test cases (you will call it on Keywords.robot file)
                |- A_Keywords.robot         # Contains Higher Level Keywords to load corresponding data with the purpose of the steps in the test cases
                |- A_Testcases.robot        # Contains all the test cases that you will define for Suite A
                |- A_Variables.robot        # Contains all the variables that you will use for Suite A
            |-
            |- Suite C
                |- A_Data.yaml
                |- A_Keywords.robot
                |- A_Testcases.robot
                |- A_Variables.robot
        |- Jenkinsfile                      # Contains the configuration to run robot scripts on Jenkins server
        |- requirements.txt                 # Contains all packages that are required to run the project

## How to define a new test case?

	Steps:
	1. Manual testing for the test cases make sure that you can understand the scenario its
	2. Get locators of necessary elements (Locating by ID, Name, Link Text, CSS Selector, XPATH)
	3. Define keywords and corresponding actions for each page (based on Page Object Model structure)
	    + PageN_Page.robot            # Contains all the behaviors on that page (High Level Keywords)
	    + PageN_Actions.robot         # Contains specific actions on that page (Low Level Keywords) such as: Click Element, Input Text, PressKey,...
	4. Define test cases and keywords for each feature
	5. Execute test cases
	6. Push robot scripts to App's git
