package eg.gov.iti.jets.convertors;

import com.google.gson.Gson;

public class JsonConvertor {
    private static final Gson CONVERTOR = new Gson();

    private JsonConvertor() {
    }

    public static <T> String toJson(T object) {
        return CONVERTOR.toJson(object);
    }

    public static <T> T toObject(String json, Class<T> type) {
        return CONVERTOR.fromJson(json, type);
    }
}
