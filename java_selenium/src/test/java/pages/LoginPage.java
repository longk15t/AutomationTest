package pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import base.TestBase;

public class LoginPage extends TestBase {
	//Page elements
	@FindBy(id="login-email") WebElement txtUsername;
	
	@FindBy(id="login-password") WebElement txtPassword;
	
	@FindBy(id="login-submit") WebElement btnSignin;
	
	@FindBy(id="error-for-password") WebElement msgIncorrectPassword;
	
	//Initializing the Page Objects
	public LoginPage(){
		PageFactory.initElements(driver, this);
	}
	
	public boolean checkLoginPageOpened() {
		String title = driver.getTitle();
		if (title.equals("LinkedIn: Log In or Sign Up")){
			return true;
		} else
			return false;
	}

	public void inputCredentials(String un, String pwd){
		txtUsername.sendKeys(un);
		txtPassword.sendKeys(pwd);
	}
	
	public void clickSigninBtn() {
		btnSignin.click();
	}
	
	public boolean checkErrorMessage() {
		String expected_msg = "Hmm, that's not the right password. Please try again or request a new one.";
		String actual_msg = msgIncorrectPassword.getText();
		if (actual_msg.equals(expected_msg)) {
			return true;
		} else
			return false;
		
	}
	
	public String signinPageTitle() {
		return driver.getTitle();
	}
	
	public boolean checkHomePageOpened() {
		String title = driver.getTitle();
		if (title.equals("LinkedIn")){
			return true;
		} else
			return false;
		
	}
}
