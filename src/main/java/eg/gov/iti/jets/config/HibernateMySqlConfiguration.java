package eg.gov.iti.jets.config;
import java.util.Properties;


import eg.gov.iti.jets.model.User;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

public class HibernateMySqlConfiguration {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();

                // Hibernate settings equivalent to hibernate.cfg.xml's properties
                Properties settings = new Properties();
                settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
                settings.put(Environment.URL, "jdbc:mysql://localhost:3306/e-commerce-servlet-jsp");
                settings.put(Environment.USER, "root");
                settings.put(Environment.PASS, "Ebra7imFCI");
//              SQL dialect
                settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5InnoDBDialect");
//              Echo all executed SQL to stdout
                settings.put(Environment.SHOW_SQL, "true");

                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
//              Drop and re-create the database schema on startup
//                settings.put(Environment.HBM2DDL_AUTO, "update");
                settings.put(Environment.HBM2DDL_AUTO, "create");

                configuration.setProperties(settings);
//              Names the annotated entity class
                configuration.addAnnotatedClass(User.class);
//                configuration.addAnnotatedClass(Order.class);

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
