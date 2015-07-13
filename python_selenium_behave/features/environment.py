from selenium import webdriver
from os.path import dirname
from webdrivermanager import ChromeDriverManager, GeckoDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from allure import attachment_type
from allure import attach

def before_all(context):
    try:
        browser = context.config.userdata['browser']
    except KeyError as ke:
        browser = None
    if browser == "chrome" or browser == None:
        binary_driver = ChromeDriverManager().download_and_install()[0]
        context.driver = webdriver.Chrome(binary_driver)
    elif browser == "firefox":
        binary_driver = GeckoDriverManager().download_and_install()[0]
        context.driver = webdriver.Firefox(executable_path=binary_driver)
    context.wait = WebDriverWait(context.driver, 5)

def after_all(context):
    context.driver.quit()

def after_step(context, step):
    if step.status == "failed":
        attach(context.driver.get_screenshot_as_png(), name="attachment", attachment_type=attachment_type.PNG)