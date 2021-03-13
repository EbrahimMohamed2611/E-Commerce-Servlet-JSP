package eg.gov.iti.jets.listener;

import eg.gov.iti.jets.config.HibernateMySqlConfiguration;
import eg.gov.iti.jets.factory.HibernateDatabaseFactory;
import eg.gov.iti.jets.utils.MailService;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import org.hibernate.SessionFactory;

public class ApplicationStartingListener implements ServletContextListener{
    private SessionFactory sessionFactory;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
         sessionFactory = HibernateDatabaseFactory.getMysqlConnection();
        sessionFactory.openSession();
        System.out.println("Data base Connection is opened");
        MailService.sendEmail("iti.jets.intake41.p2@tutanota.com");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sessionFactory.close();
        System.out.println("Database is closed");
    }
}
