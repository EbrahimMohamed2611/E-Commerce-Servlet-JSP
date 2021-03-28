package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.*;
import eg.gov.iti.jets.repository.OrderRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Set;

public class OrderRepositoryImpl implements OrderRepository {
    EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");

    @Override
    public Order createOrder(User user, Set<Purchase> purchaseSet, Double orderTotal) {
        return null;
    }


    @Override
    public Order saveOrder(Order order) {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(order);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("Order saved " + order);
        return order;
    }

    @Override
    public Order updateOrder(Order order) {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        Order orderUpdated = entityManager.merge(order);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("Order updated " + orderUpdated);
        return orderUpdated;
    }

    @Override
    public Boolean deleteOrder(int orderId) {

        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        int isSuccessful = entityManager.createQuery("delete from order o where o.order_id=:id")
                .setParameter("id", orderId)
                .executeUpdate();

        return isSuccessful != 0;
    }

    @Override
    public Order getOrder(int id) {
        System.out.println("entityManager is opened");
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        Order order = entityManager.createNamedQuery("FindOrderById", Order.class)
                .setParameter("order_id", id).getSingleResult();

        entityManager.getTransaction().commit();

        entityManager.close();

        return order;

    }

    @Override
    public List<Order> getUserOrdersByStatus(int userId, OrderStatus orderStatus) {
        System.out.println("entityManager is opened");
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();

        TypedQuery<Order> query =
                entityManager.createQuery("select o from Order o where o.orderStatus = :orderStatus and o.user.userId = :userId", Order.class);
        query.setParameter("orderStatus", orderStatus)
                .setParameter("userId", userId);
        List<Order> listOfOrders = query.getResultList();
        entityManager.getTransaction().commit();
        entityManager.close();

        return listOfOrders;

    }


}
