package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.OrderedProductAdaptor;
import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.factory.ProductRepositoryFactory;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;
import eg.gov.iti.jets.service.ProductService;

public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository = ProductRepositoryFactory.getProductRepositoryInstance();

    @Override
    public OrderedProductDTO getInStockProduct(int productId) {
        Product product = getProductById(productId);
        if (product != null) {
            if (!product.isDeleted() && product.getQuantity() > 0) {
                System.out.println("The returned Product Id is "+ product.getProductId() +
                        " and its name is " + product.getProductName());
                return OrderedProductAdaptor.convertProductModelToOrderedItem(product);
            }
        }
        return null;
    }

    @Override
    public Product getProductById(int productId) {
        return  productRepository.findProductById(productId);
    }
}
