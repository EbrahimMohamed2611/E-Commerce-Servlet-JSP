package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.User;

import java.util.Set;

public interface OrderRepository {
    Order addOrder(Order order);
    Set<Order> getAllOrders(int userID);
}


