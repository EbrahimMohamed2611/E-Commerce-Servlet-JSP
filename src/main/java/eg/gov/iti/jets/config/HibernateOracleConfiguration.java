package eg.gov.iti.jets.config;

import eg.gov.iti.jets.model.User;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateOracleConfiguration {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();

                // Hibernate settings equivalent to hibernate.cfg.xml's properties
                Properties settings = new Properties();
                settings.put(Environment.DRIVER, "oracle.jdbc.OracleDriver");
                settings.put(Environment.URL, "jdbc:oracle:thin:@localhost:1521:xe");
                settings.put(Environment.USER, "hr");
                settings.put(Environment.PASS, "hr");
//              SQL dialect
                settings.put(Environment.DIALECT, "org.hibernate.dialect.Oracle9Dialect");
//              Echo all executed SQL to stdout
                settings.put(Environment.SHOW_SQL, "true");

                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
//              Drop and re-create the database schema on startup
//                settings.put(Environment.HBM2DDL_AUTO, "update");
                settings.put(Environment.HBM2DDL_AUTO, "create-drop");

                configuration.setProperties(settings);
//              Names the annotated entity class
//                configuration.addAnnotatedClass(Order.class);
                configuration.addAnnotatedClass(User.class);

                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                        .applySettings(configuration.getProperties()).build();
                System.out.println("Hibernate Java Config serviceRegistry created");
                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
                return sessionFactory;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
}
