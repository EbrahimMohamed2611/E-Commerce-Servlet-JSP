package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.OrderRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.time.LocalDateTime;
import java.util.*;

public class OrderRepositoryImpl  implements OrderRepository {
    EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");

    @Override
    public Order createOrder(User user, Set<Purchase> purchaseSet, Double orderTotal) {
        return null;
    }
//    @Override
//    public Set<Order> getAllOrders(int userID) {
//        Set<Order>orders = new HashSet<>();
//        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
//        EntityManager entityManager = factory.createEntityManager();
//        entityManager.getTransaction().begin();
//        orders = (Set<Order>)entityManager.createNamedQuery("Order.getUserOrder").setParameter("id", userID).getResultList();
//
//        return orders;
//    }
@Override
    public List<Order> getUserOrders(int userId) {
    System.out.println("entityManager is opened");
    EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
    EntityManager entityManager = factory.createEntityManager();
    entityManager.getTransaction().begin();

    TypedQuery<Order> query =
            entityManager.createQuery("select o from Order o where o.user.userId = :userId", Order.class);

           query.setParameter("userId", userId);
    List<Order> listOfOrders = (List<Order>)query.getResultList();
    entityManager.getTransaction().commit();
    entityManager.close();

    return listOfOrders;

}
}
