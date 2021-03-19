package eg.gov.iti.jets.listener;

import eg.gov.iti.jets.utils.AllCountries;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.Map;
@WebListener
public class SessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Session Created");

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

    }
}
