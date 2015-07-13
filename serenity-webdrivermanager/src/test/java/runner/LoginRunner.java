package runner;


import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(format = {"pretty"},
        monochrome=true,
        glue={"stepDefinitions"},
        features="src/test/resources/features/Login.feature"
)
public class LoginRunner {
}
