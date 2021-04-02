package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.OrderRepository;

import javax.persistence.EntityManager;
import java.util.Set;

public class OrderRepositoryImpl implements OrderRepository {

    @Override
    public Order createOrder(User user, Set<Purchase> purchaseSet, Double orderTotal) {
        return null;
    }

    @Override
    public Set<Order> getAllOrders(int userID) {
        Set<Order> orders;
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        orders = (Set<Order>) entityManager.createNamedQuery("Order.getUserOrder").setParameter("id", userID).getResultList();
        entityManager.close();
        return orders;
    }

}
