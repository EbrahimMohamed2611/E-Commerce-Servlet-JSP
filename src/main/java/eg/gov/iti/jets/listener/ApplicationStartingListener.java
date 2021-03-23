package eg.gov.iti.jets.listener;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.utils.AllCountries;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;


import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.Map;


@WebListener
public class ApplicationStartingListener implements ServletContextListener{
    EntityManagerFactory factory ;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Map<String, String> stringStringMap = null;
        try {
            stringStringMap = AllCountries.JSONReader();
        } catch (URISyntaxException | FileNotFoundException e) {
            System.out.println("Can't read json file ");
            e.printStackTrace();
        }
        factory = Persistence.createEntityManagerFactory("e-commerce");
        System.out.println("Database is Opened");
        sce.getServletContext().setAttribute("countries",stringStringMap);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        PersistenceManager.INSTANCE.close();
        System.out.println("Database is closed");
    }
}
