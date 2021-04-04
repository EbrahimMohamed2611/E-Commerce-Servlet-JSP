package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.repository.OrderRepository;

import eg.gov.iti.jets.repository.impl.OrderRepositoryImpl;


public class OrderRepositoryFactory {
    private static OrderRepository orderRepository;

    public static OrderRepository getOrderRepositoryInstance() {
        if (orderRepository == null) {
            orderRepository = new OrderRepositoryImpl();
        }
        return orderRepository;
    }
}
