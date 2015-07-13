package util;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import base.TestBase;

public class TestUtils extends TestBase {
    public static int PAGE_LOAD_TIMEOUT = 10;
    public static int IMPLICIT_WAIT = 10;
    
	public static byte[] takeScreenshot() {
		TakesScreenshot ts = (TakesScreenshot) driver;
		return ts.getScreenshotAs(OutputType.BYTES);
	}
	
	public static String getReportConfigPath(){
		 String reportConfigPath = prop.getProperty("report_path");
		 if(reportConfigPath!= null) return reportConfigPath;
		 else throw new RuntimeException("Report Config Path not specified in the config.properties file for the key:report_path"); 
	}
}
