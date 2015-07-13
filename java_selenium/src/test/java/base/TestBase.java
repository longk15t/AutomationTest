package base;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.support.events.EventFiringWebDriver;

import cucumber.api.Scenario;
import util.EventListener;
import util.TestUtils;

public class TestBase {
    public static WebDriver driver;
    public static Properties prop;
	public static EventFiringWebDriver e_driver;
	public static EventListener eventListener;
    
	public TestBase(){
            try {
	        prop = new Properties();
		FileInputStream ip = new FileInputStream(System.getProperty("user.dir") + "\\config.properties");
		prop.load(ip);
	    } catch (FileNotFoundException e) {
		e.printStackTrace();
	    } catch (IOException e) {
		e.printStackTrace();
	    }
	}
    
    
	public static void initialize() {
		String browserName = prop.getProperty("browser").toLowerCase();
		String urlName = prop.getProperty("url");
		String browserFlag = System.getProperty("browser", "");
		String urlFlag = System.getProperty("url", "");
		
		if(browserFlag.length() > 0) {
			browserName = browserFlag;
		}
		
		if(urlFlag.length() > 0) {
			urlName = urlFlag;
		}

		if(browserName.equals("chrome")){
			System.setProperty("webdriver.chrome.driver", prop.getProperty("chromedriver"));
			driver = new ChromeDriver(); 
		} else if(browserName.equals("firefox") || browserName.equals("ff")){
			System.setProperty("webdriver.gecko.driver", prop.getProperty("ffdriver"));	
			driver = new FirefoxDriver(); 
		} else if(browserName.equals("ie") || browserName.equals("iexplorer") || browserName.equals("internetexplorer")) {
			System.setProperty("webdriver.ie.driver", prop.getProperty("iedriver"));	
			driver = new InternetExplorerDriver(); 
		} else { // Default will be ChromeDriver
			System.setProperty("webdriver.chrome.driver", prop.getProperty("chromedriver"));	
			driver = new ChromeDriver(); 
		}
		
		
		e_driver = new EventFiringWebDriver(driver);
		// Now create object of EventListerHandler to register it with EventFiringWebDriver
		eventListener = new EventListener();
		e_driver.register(eventListener);
		driver = e_driver;
		
		driver.manage().window().maximize();
		driver.manage().deleteAllCookies();
		driver.manage().timeouts().pageLoadTimeout(TestUtils.PAGE_LOAD_TIMEOUT, TimeUnit.SECONDS);
		driver.manage().timeouts().implicitlyWait(TestUtils.IMPLICIT_WAIT, TimeUnit.SECONDS);
		
		driver.get(urlName);
	}
	
	public static void tearDown(Scenario scenario) {
            try {
        	if(scenario.isFailed()) {
        		byte[] screenshot = TestUtils.takeScreenshot();
        	    scenario.embed(screenshot, "image/png");
                }
            } finally {
    	        driver.quit();
            }
	}
}
