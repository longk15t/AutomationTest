.. _robotframework-appiumlibrary: ./robotframework-appiumlibrary
.. _single-device: ./robotframework-appiumlibrary/single_device
.. _multiple-devices: ./robotframework-appiumlibrary/multiple_devices
.. _robotframework-selenium2library: ./robotframework-selenium2library
.. _robotframework-pywinauto: ./robotframework-pywinauto
.. _pytest_uiautomation: ./pytest_uiautomation
.. _maven-selenium-cucumber: ./java_selenium
.. _maven-serenityBDD-cucumber: ./serenity-webdrivermanager
.. _python_selenium_behave: ./python_selenium_behave

Email: longk15t@gmail.com, Skype: longk15t

.. contents:: Table of contents:
   :local:
   :depth: 2

maven-serenityBDD-cucumber_
============
- Automate web by Serenity BDD + Cucumber on Maven project

maven-selenium-cucumber_
============
- Automate web by Selenium + Cucumber on Maven project

robotframework-appiumlibrary_
============

single-device_
----------------
- Automate app on single emulator (as default)/real mobile device (Android)
- Script flow:

    - Start appium server
    - Start emulator (as default)
    - Run test cases

multiple-devices_
----------------
- Automate Skype app on multiple emulator (as default)/real mobile devices (Android)
- Script flow:

    - Start appium servers
    - Start emulator (as default)
    - Run test cases
- Youtube video link: https://www.youtube.com/watch?v=2-KjUGF_wYI

robotframework-selenium2library_
============
- Automate web
- Script flow:

    - Start Web driver
    - Run test cases

robotframework-pywinauto_
============
- Automate Windows desktop application (Notepad) by pywinauto library of Python
- This is custom library, not builtin/internal/external library of Robotframework
- Script flow:

    - Open Notepad app (Windows 10)
    - Run test cases

pytest_uiautomation_
============
- Automate Windows desktop application (Notepad) by Microsoft UI Automation (python wrapper) with pytest framework
- Python uiautomation mimics real user interactions with application i.e move mouse, click button, input text, ...

python_selenium_behave_
============
- Automate web page with python selenium, webdrivermanager and Behave
- Allure report, include screenshot for failed test cases
