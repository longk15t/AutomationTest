from behave import *
from hamcrest import assert_that, equal_to, contains_string
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from time import sleep
from github_page import GitHubPage

ghp = None

@given("I was redirected to url \"{base_url}\"")
def step_impl(context, base_url):
    context.driver.get(base_url)
    global ghp
    ghp = GitHubPage(context.driver)

@When("I search with keyword \"{keyword}\"")
def step_impl(context, keyword):
    ghp.search_repository(keyword)

@Then("I am navigated to Search result page")
def step_impl(context):
    assert_that(context.driver.title, contains_string("Search"))

@Then("I see the label \"{py_label}\"")
def step_impl(context, py_label):
    assert_that(context.driver.page_source, contains_string(py_label))

@When("I click Sign Up button")
def step_impl(context):
    signup_btn = context.driver.find_element_by_xpath("(//a[@href='/join?source=header-home'])[2]")
    signup_btn.click()

@Then("I am navigated to Join GitHub page")
def step_impl(context):
    assert_that(context.driver.title, contains_string("Join GitHub"))
    assert_that(context.driver.page_source, contains_string("Create your account"))

@Then("I see field Username, Email address, Password")
def step_impl(context):
    ghp.is_at_signup_page()

@when("I hover my mouse to Explore menu")
def step_impl(context):
    context.driver.find_element_by_xpath("//summary[contains(text(), \"Explore\")]/..").click()

@when("I clicks the \"Explore Github\" option")
def step_impl(context):
    context.wait.until(EC.element_to_be_clickable((By.XPATH, "//a[@href=\"/explore\"]"))).click()

@then("I am navigated to Explore GitHub page")
def step_impl(context):
    assert_that(context.driver.current_url, equal_to("https://github.com/explore"))
    assert_that(context.driver.title, contains_string("Explore GitHub"))
