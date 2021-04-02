package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.repository.PurchaseRepository;

import javax.persistence.EntityManager;

public class PurchaseRepositoryImpl implements PurchaseRepository {
    private final PersistenceManager persistenceManager = PersistenceManager.INSTANCE;

    @Override
    public Purchase savePurchase(Purchase purchase) {
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(purchase);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("Purchase saved " + purchase);
        return purchase;
    }

}
