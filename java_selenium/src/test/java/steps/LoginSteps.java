package steps;

import org.junit.Assert;
import base.TestBase;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import pages.LoginPage;
import util.TestUtils;

public class LoginSteps extends TestBase {
	
	LoginPage loginPage;
	
	public LoginSteps(){
		super();
	}
	
	@When("^user open browser and access page linkedin$")
    public void openBrowser() {
		initialize();
		loginPage = new LoginPage();
    }
    
	@Then("^user should see Login page of Linkedin$")
    public void checkLoginPage() {
		loginPage.checkLoginPageOpened();
    }
	
    @When("^user input invalid username and password$")
    public void inputInvalidCredentials() {
    	loginPage.inputCredentials(prop.getProperty("email"), "invalid_password");
    }

    @When("^user input valid username and password$")
    public void inputValidCredentials() {
    	loginPage.inputCredentials(prop.getProperty("email"), prop.getProperty("password"));
    }
    
    @And("^clicks Signin button$")
    public void clickSigninBtn() {
    	loginPage.clickSigninBtn();
    }
    
    @Then("^user see the error message$")
    public void checkErrorMessage() {
    	Assert.assertEquals(loginPage.signinPageTitle(), "Sign In to LinkedIn");
    	Assert.assertTrue(loginPage.checkErrorMessage());
    }
    
    @Then("^user see the home page$")
    public void checkHomePageOpened() {
    	Assert.assertTrue(loginPage.checkHomePageOpened());
    }
    
    @After
	public void teardown(Scenario scenario) {
    	tearDown(scenario);
    }
}
