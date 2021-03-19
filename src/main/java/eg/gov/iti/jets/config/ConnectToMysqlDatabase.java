package eg.gov.iti.jets.config;

import javax.persistence.*;
import java.util.Objects;

public class ConnectToMysqlDatabase {
    private static ConnectToMysqlDatabase instance;
    private static EntityManager entityManager;
    private static EntityManagerFactory entityManagerFactory;

    private ConnectToMysqlDatabase() {
        System.out.println("ConnectToMysqlDatabase");
        entityManagerFactory = Persistence.createEntityManagerFactory("ECommerce");
        entityManager = entityManagerFactory.createEntityManager();
    }

    public static synchronized ConnectToMysqlDatabase getInstance() {
        return instance = Objects.requireNonNullElseGet(instance, ConnectToMysqlDatabase::new);
    }

    public static void close() {
        System.out.println("close");
        if (entityManager.isOpen() && instance != null) {
            entityManager.close();
            entityManagerFactory.close();
        }
    }

    public EntityManager getEntityManager() {
        System.out.println("getEntityManager");
        return entityManager;
    }
}

