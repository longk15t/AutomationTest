from selenium.webdriver.common.keys import Keys
from hamcrest import assert_that, equal_to
from time import sleep


class GitHubPage:
    def __init__(self, webdriver):
        self.driver = webdriver

    def search_repository(self, keyword):
        search_bar = self.driver.find_element_by_name("q")
        search_bar.send_keys(keyword)
        search_bar.send_keys(Keys.RETURN)
        sleep(2)
    
    def is_at_signup_page(self):
        assert_that(len(self.driver.find_elements_by_id("user_login")), equal_to(1))
        assert_that(len(self.driver.find_elements_by_id("user_email")), equal_to(2))
        assert_that(len(self.driver.find_elements_by_id("user_password")), equal_to(1))