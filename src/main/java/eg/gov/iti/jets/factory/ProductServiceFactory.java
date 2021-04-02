package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.impl.ProductServiceImpl;

public class ProductServiceFactory {

    private static ProductService productService;

    public static ProductService getProductServiceInstance() {
        if (productService == null) {
            productService = new ProductServiceImpl();
        }
        return productService;
    }
}
