package eg.gov.iti.jets.service;

import eg.gov.iti.jets.model.Order;

import java.util.Set;

public interface OrderService {
    Order addOrder(Order order);
    Set<Order> getAllOrders(int userID);
}
