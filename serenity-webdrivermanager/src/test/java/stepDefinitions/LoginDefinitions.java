package stepDefinitions;

import base.TestBase;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;
import steps.LoginSteps;

public class LoginDefinitions {
    @Steps
    LoginSteps login;

    @Steps
    TestBase base;

    @Given("user opened web browser")
    public void init() {
        base.initialize();
    }

    @When("user logged in using username as '(.*)' and password as '(.*)'")
    public void inputCredentials(String username, String password) throws InterruptedException {
        login.input_credentials(username, password);
    }

    @Then("error message '(.*)' should be displayed")
    public void errorMessageDisplayed(String errMsg) {
        login.should_see_error_msg(errMsg);
    }
}
