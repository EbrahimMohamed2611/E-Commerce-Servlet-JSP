package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.factory.OrderRepositoryFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.service.OrderService;
import java.util.Set;

public class OrderServiceImpl implements OrderService {
    private final OrderRepository orderRepository = OrderRepositoryFactory.getOrderRepositoryInstance();
//    @Override
//    public Set<Order> getAllOrders(int userID) {
//        Set<Order> orders = orderRepository.getAllOrders(userID);
//        return orders;
//    }
}
