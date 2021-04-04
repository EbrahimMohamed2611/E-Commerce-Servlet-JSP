package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.PurchaseId;
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

    @Override
    public boolean deletePurchaseById(PurchaseId purchaseId) {

            EntityManager entityManager = persistenceManager.getEntityManager();
            entityManager.getTransaction().begin();
            int isSuccessful = entityManager.createQuery("delete from Purchase p " +
                    "where p.purchasesId=:purchaseId")
                    .setParameter("purchaseId", purchaseId)
                    .executeUpdate();
            entityManager.getTransaction().commit();
            entityManager.close();
        System.out.println("Delete purchase result "+ isSuccessful);

            return isSuccessful != 0;
        }

    @Override
    public void deletePurchaseByObject(Purchase purchase) {
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.remove(purchase);
        entityManager.close();

    }

}
