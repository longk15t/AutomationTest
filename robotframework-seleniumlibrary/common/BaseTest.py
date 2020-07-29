from robot.api.deco import keyword
from selenium import webdriver
from webdrivermanager import ChromeDriverManager, GeckoDriverManager

class BaseTest:
    def __init__(self):
        pass
    
    @keyword("Access Web Page")
    def open_page(self, browser, url):
        if not browser or browser == "chrome":
            binary_driver = ChromeDriverManager().download_and_install()[0]
            driver = webdriver.Chrome(binary_driver)
        elif browser == "firefox":
            binary_driver = GeckoDriverManager().download_and_install()[0]
            driver = webdriver.Firefox(executable_path=binary_driver)
        driver.get(url)
        driver.implicitly_wait(10)
    