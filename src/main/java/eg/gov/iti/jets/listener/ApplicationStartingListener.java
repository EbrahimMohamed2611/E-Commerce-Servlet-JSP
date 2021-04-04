package eg.gov.iti.jets.listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import eg.gov.iti.jets.config.PersistenceManager;

import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.UserServiceFactory;

import eg.gov.iti.jets.service.UserService;

import eg.gov.iti.jets.utils.AllCountries;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@WebListener
public class ApplicationStartingListener implements ServletContextListener{
    EntityManagerFactory factory ;

    private final UserService userService = UserServiceFactory.getUserServiceInstance();
    private final PersistenceManager persistenceManager = PersistenceManager.INSTANCE;


    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        MailService.sendEmail("iti.jets.intake41.p2@tutanota.com");
        Map<String, String> stringStringMap = null;
        try {
            stringStringMap = AllCountries.JSONReader();
        } catch (URISyntaxException | FileNotFoundException e) {
            System.out.println("Can't read json file ");
            e.printStackTrace();
        }
        factory = persistenceManager.getEntityManager().getEntityManagerFactory();
        System.out.println("Database is Opened");
        sce.getServletContext().setAttribute("countries",stringStringMap);

        List<UserDTO> userList = userService.fetchAllUsers();
        System.out.println("Inside initialize of conttext->userlist "+userList);
        sce.getServletContext().setAttribute("userList",userList);
        System.out.println("put it into the ocntext scope ");


//         sessionFactory = HibernateDatabaseFactory.getMysqlConnection();
//        //sessionFactory.openSession();
//        System.out.println("Data base Connection is opened");
//        MailService.sendEmail("iti.jets.intake41.p2@tutanota.com");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        PersistenceManager.INSTANCE.close();
        System.out.println("Database is closed");

        try {
            ServletContextListener.super.contextDestroyed(sce);
        }
        finally {
            deregisterJdbcDrivers(sce.getServletContext());
        }
    }





    protected void deregisterJdbcDrivers(ServletContext servletContext) {
        for (Driver driver : Collections.list(DriverManager.getDrivers())) {
            if (driver.getClass().getClassLoader() == servletContext.getClassLoader()) {
                try {
                    DriverManager.deregisterDriver(driver);
                    System.out.println("Mysql Connection Clean Up");
                }
                catch (SQLException ex) {
                    System.out.println("Unable to CleanUp");
                    // Continue
                }
            }
        }
        AbandonedConnectionCleanupThread.checkedShutdown();
    }
}
