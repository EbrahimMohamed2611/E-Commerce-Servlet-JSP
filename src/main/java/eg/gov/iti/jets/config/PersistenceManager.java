package eg.gov.iti.jets.config;

import javax.persistence.*;

public enum PersistenceManager {
    INSTANCE;

    private final EntityManagerFactory emFactory;

    private PersistenceManager() {
        System.out.println("PersistenceManager");
        // "jpa-example" was the value of the name attribute of the
        // persistence-unit element.
        emFactory = Persistence.createEntityManagerFactory("e-commerce");
    }

    public EntityManager getEntityManager() {
        System.out.println("getEntityManager");
        return emFactory.createEntityManager();
    }

    public void close() {
        System.out.println("close");
        emFactory.close();
    }
}
