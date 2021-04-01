package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.impl.OrderServiceImpl;


public class OrderServiceFactory {
    private static OrderService orderService;

    public static OrderService getOrderRepositoryInstance(){
        if (orderService == null) {
            return new OrderServiceImpl();
        }
        return orderService;
    }
}
