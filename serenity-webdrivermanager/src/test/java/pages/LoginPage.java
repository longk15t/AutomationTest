package pages;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

import static org.junit.Assert.assertTrue;

public class LoginPage extends PageObject {

    @FindBy(id = "login_field")
    WebElementFacade txtUsername;

    @FindBy(id = "password")
    WebElementFacade txtPassword;

    @FindBy(xpath = "//input[@type='submit']")
    WebElementFacade btnLogin;

    @FindBy(xpath = "//div[contains(@class,'flash-error')]")
    WebElementFacade lblError;

    public void input_credentials(String username, String password) throws InterruptedException {
        txtUsername.sendKeys(username);
        txtPassword.sendKeys(password);
        btnLogin.click();
        Thread.sleep(3); // Don't use this in your project
    }

    public void see_error_msg(String errMsg){
        assertTrue(lblError.getText().equals(errMsg));
    }
}
