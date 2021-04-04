package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.impl.OrderServiceImpl;

public class OrderServiceFactory {

    private static OrderService orderService;

    public static OrderService getOrderServiceInstance(){
        if (orderService == null) {
            orderService =  new OrderServiceImpl();
        }
        return orderService;
    }
}


