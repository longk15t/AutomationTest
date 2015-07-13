package pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import base.TestBase;

public class HomePage extends TestBase {
	//Initializing the Page Objects
	public HomePage(){
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath="//img[@alt='Long Tran' and contains(@class,'member-photo')]") WebElement imgAvatar;
	
	@FindBy(xpath="//*[text()='View profile']") WebElement btnViewProfile;
	
	public void clickAvatar() {
		imgAvatar.click();
		btnViewProfile.click();
	}
	
	public String getProfilePageTitle() {
		return driver.getTitle();
	}
}
