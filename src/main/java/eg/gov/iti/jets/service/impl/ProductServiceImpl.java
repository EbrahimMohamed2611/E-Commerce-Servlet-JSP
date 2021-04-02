package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.dto.ProductDto;
import eg.gov.iti.jets.mappers.MinimalProductMapper;
import eg.gov.iti.jets.mappers.ProductMapper;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;
import eg.gov.iti.jets.repository.impl.ProductRepositoryImpl;
import eg.gov.iti.jets.service.ProductService;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Concrete class that responsible for business logic on products
 *
 * @Author MAK
 */
public class ProductServiceImpl implements ProductService {

    private final static ProductRepository PRODUCT_REPOSITORY = new ProductRepositoryImpl();

    @Override
    public List<MinimalProductDto> getProducts() {
        List<Product> products = PRODUCT_REPOSITORY.findAll();
        return products.stream()
                .map(MinimalProductMapper.INSTANCE::productToMinimalProductDto)
                .collect(Collectors.toList());
    }

    @Override
    public MinimalProductDto getMinimalProductById(int id) {
        return MinimalProductMapper.INSTANCE.productToMinimalProductDto(PRODUCT_REPOSITORY.findById(id));
    }

    @Override
    public ProductDto getProductDtoById(int id) {
        return ProductMapper.INSTANCE.productToProductDto(PRODUCT_REPOSITORY.findById(id));
    }

    @Override
    public int getProductRating(int id) {
        double avgRating = PRODUCT_REPOSITORY.getAvgRating(id);
        return (int) Math.ceil(avgRating);
    }

    @Override
    public OrderedProductDTO getInStockProduct(int productId) {
        Product product = getProductById(productId);
        if (product != null) {
            if (!product.isDeleted() && product.getQuantity() > 0) {
                System.out.println("The returned Product Id is "+ product.getProductId() +
                        " and its name is " + product.getProductName());
                return OrderedProductAdapter.convertProductModelToOrderedItem(product);
            }
        }
        return null;
    }

    @Override
    public Product getProductById(int productId) {
        return ProductMapper.INSTANCE.findProductById(productId);
    }
}
