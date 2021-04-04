package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.User;


import java.util.List;
import java.util.Set;

public interface OrderRepository {


    Set<Order> getAllOrders(int userID);

    Order saveOrder(Order order);

    Order updateOrder(Order order);

    Boolean deleteOrder(int orderId);

    Order getOrder(int id);

    List<Order> getUserOrdersByStatus(int userId, OrderStatus orderStatus);

}


