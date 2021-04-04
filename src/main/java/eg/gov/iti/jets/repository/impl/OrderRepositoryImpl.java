package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
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


    @Override
    public Order addOrder(Order order) {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(order);
        entityManager.getTransaction().commit();
        entityManager.close();
        return order;
    }
    @Override
    public Set<Order> getAllOrders(int userID) {
        Set<Order>orders = new HashSet<>();
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        orders = (Set<Order>)entityManager.createNamedQuery("Order.getUserOrder").setParameter("id", userID).getResultList();

        return orders;
    }

}
