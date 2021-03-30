package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.OrderRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class OrderRepositoryImpl  implements OrderRepository {
    EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");

    @Override
    public Order createOrder(User user, Set<Purchase> purchaseSet, Double orderTotal) {
        return null;
    }
    @Override
    public Set<Order> getAllOrders(int userID) {
        Set<Order>orders = new HashSet<>();
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        orders = (Set<Order>)entityManager.createNamedQuery("Order.getUserOrder").setParameter("id", userID).getResultList();

        return orders;
    }

}
