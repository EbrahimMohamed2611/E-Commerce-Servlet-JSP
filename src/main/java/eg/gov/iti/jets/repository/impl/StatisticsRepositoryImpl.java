package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.StatisticsRepository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class StatisticsRepositoryImpl implements StatisticsRepository {

    @Override
    public int getNotCompletedOrders() {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        List<Order> resultList = entityManager.createQuery("FROM Order").getResultList();
        int counter = 0;
        if (!resultList.isEmpty()) {
            for (Order order : resultList) {
                if (order.getOrderStatus().equals(OrderStatus.NOT_COMPLETED)) {
                    counter++;
                }
            }
        }
        return counter;
    }

    @Override
    public int getCompletedOrders() {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();

        List<Order> resultList = entityManager.createQuery("FROM Order").getResultList();
        int counter = 0;
        if (!resultList.isEmpty()) {
            for (Order order : resultList) {
                if (order.getOrderStatus().equals(OrderStatus.COMPLETED)) {
                    counter++;
                }
            }
        }
        return counter;
    }

    public int getStatisticsUsers() {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        Query query = entityManager.createQuery("FROM User");
        List<User> resultList = query.getResultList();
        return resultList.size();


    }

    @Override
    public int getAllProducts() {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        Query query = entityManager.createQuery("FROM Product");

        List<Product> resultList = query.getResultList();
        return resultList.size();

    }
}
