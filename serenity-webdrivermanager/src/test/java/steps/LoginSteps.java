package steps;

import base.TestBase;
import net.serenitybdd.core.pages.PageObject;
import net.thucydides.core.annotations.Step;
import pages.LoginPage;

public class LoginSteps {

    LoginPage loginPage;

    @Step
    public void input_credentials(String username, String password) throws InterruptedException {
        loginPage.input_credentials(username, password);
    }

    @Step
    public void should_see_error_msg(String errMsg) {
        loginPage.see_error_msg(errMsg);
    }
}
