package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.repository.ProductRepository;
import eg.gov.iti.jets.repository.impl.OrderRepositoryImpl;
import eg.gov.iti.jets.repository.impl.ProductRepositoryImpl;

public class ProductRepositoryFactory {

        private static ProductRepository productRepository;

        public static ProductRepository getProductRepositoryInstance(){
            if (productRepository == null) {
                return new ProductRepositoryImpl();
            }
            return productRepository;
        }
    }

