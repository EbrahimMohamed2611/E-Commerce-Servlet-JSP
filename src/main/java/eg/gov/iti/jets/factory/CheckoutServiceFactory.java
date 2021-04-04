package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.service.CheckoutService;
import eg.gov.iti.jets.service.impl.CheckoutServiceImpl;

public class CheckoutServiceFactory {
    private static CheckoutService checkOutService;

    public static CheckoutService getCheckOutServiceInstance() {
        if (checkOutService == null) {
            checkOutService = new CheckoutServiceImpl();
        }
        return checkOutService;
    }
}