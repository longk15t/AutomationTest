package steps;

import base.TestBase;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import pages.HomePage;

public class HomeSteps extends TestBase {
	HomePage homePage = new HomePage();
	
	public HomeSteps(){
		super();
	}
    
	@When("^user clicks the avatar$")
    public void clickAvatar() {
		homePage.clickAvatar();
    }
	
	@Then("^profile page should be opened$")
    public void checkProfilePageOpened() {
		Assert.assertEquals("Long Tran | LinkedIn", homePage.getProfilePageTitle());
    }

}
