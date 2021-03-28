package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.OrderAdapter;
import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.factory.OrderRepositoryFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.service.OrderService;

import java.util.List;
import java.util.stream.Collectors;


public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository = OrderRepositoryFactory.getOrderRepositoryInstance();

    @Override
    public List<OrderDTO> getUserOrders(int userId, OrderStatus orderStatus) {
        List<Order> listOfOrders = orderRepository.getUserOrdersByStatus(userId, orderStatus);

        return listOfOrders.stream().
                map(OrderAdapter::convertFromOrderModelToOrderDto).
                collect(Collectors.toList());
    }
}
