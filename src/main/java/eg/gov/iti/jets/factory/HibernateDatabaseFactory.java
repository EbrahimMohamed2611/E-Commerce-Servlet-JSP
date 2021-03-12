package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.config.HibernateMySqlConfiguration;
import eg.gov.iti.jets.config.HibernateOracleConfiguration;
import org.hibernate.SessionFactory;

public class HibernateDatabaseFactory {
    public static SessionFactory getMysqlConnection(){
        return HibernateMySqlConfiguration.getSessionFactory();
    }

    public static SessionFactory getOracleConnection(){
        return HibernateOracleConfiguration.getSessionFactory();
    }
}
