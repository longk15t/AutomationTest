package pages;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class HomePage extends PageObject {
    @FindBy(xpath = "//input[@class = 'search-input']")
    WebElementFacade txtSearch;
}
