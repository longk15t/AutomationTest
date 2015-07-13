package runner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(
		features="src/test/resources/testcases/Home.feature",
		glue={"steps"},
		plugin = {"json:target/cucumber-report/home.json"}
) 
public class HomeRunner {

}
