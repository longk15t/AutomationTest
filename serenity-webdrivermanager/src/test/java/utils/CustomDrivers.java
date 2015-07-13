package utils;

import io.github.bonigarcia.wdm.ChromeDriverManager;
import io.github.bonigarcia.wdm.FirefoxDriverManager;
import io.github.bonigarcia.wdm.InternetExplorerDriverManager;
import net.thucydides.core.webdriver.DriverSource;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;

import java.util.logging.Logger;

import static io.github.bonigarcia.wdm.DriverManagerType.*;

public class CustomDrivers implements DriverSource {

    private String webBrowser(){
        PropertiesReader pr = new PropertiesReader();
        return pr.getValueOf("browser").trim().toLowerCase();
    }

    @Override
    public final WebDriver newDriver() {
        String browser = webBrowser();
        System.out.println("The target browser is: " + browser);
        switch(browser) {
            case "chrome":
                ChromeDriverManager.getInstance(CHROME).setup();
                return new ChromeDriver();
            case "ie":
                InternetExplorerDriverManager.getInstance(IEXPLORER).setup();
                return new InternetExplorerDriver();
            default:
                FirefoxDriverManager.getInstance(FIREFOX).setup();
                return new FirefoxDriver();
        }
    }

    @Override
    public final boolean takesScreenshots() {
        return true;
    }
}
