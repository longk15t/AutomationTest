package utils;

import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;

public class PropertiesReader {

    private EnvironmentVariables variables;

    public PropertiesReader() {
        this.variables = SystemEnvironmentVariables.createEnvironmentVariables();
    }

    public String getValueOf(String keyName) {
        return variables.getProperty(keyName);
    }

}
