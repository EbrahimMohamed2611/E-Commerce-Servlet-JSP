package eg.gov.iti.jets.utils;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.json.*;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

public class AllCountries {

    public static Map<String, String> JSONReader() throws URISyntaxException, FileNotFoundException {
        JsonReader jsonReader = Json.createReader(new FileReader(AllCountries.class.getResource("/JSON/Countries.json").toURI().getPath()));
        JsonArray jsonArray = jsonReader.readArray();
        Map<String, String> allCountries = new HashMap<>();
        for (JsonValue jsonValue : jsonArray) {
            JsonValue country = jsonValue.asJsonObject().get("name");
            JsonValue code = jsonValue.asJsonObject().get("code");
            allCountries.put(code.toString().substring(1, code.toString().length()-1), country.toString().substring(1, country.toString().length()-1));
        }
//        allCountries.forEach((k, v) -> {
//            System.out.println("Code : " + k + " Country : " + v);
//        });
        return allCountries;
    }
}
