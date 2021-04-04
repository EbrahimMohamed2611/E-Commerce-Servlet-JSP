package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.factory.OrderRepositoryFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.service.OrderService;

import java.util.Set;

public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository = OrderRepositoryFactory.getOrderRepositoryInstance();

    @Override
    public Order addOrder(Order order) {
        Order order1 = orderRepository.addOrder(order);
        return order1;
    }

    @Override
    public Set<Order> getAllOrders(int userID) {
        Set<Order> allOrders = orderRepository.getAllOrders(userID);
        return allOrders;
    }
}
