package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.OrderedProductAdapter;
import eg.gov.iti.jets.dto.FullyProductDto;
import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.enums.FilterTypes;
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
    public List<MinimalProductDto> getProductsByCategoryId(int categoryId) {
        List<Product> products = PRODUCT_REPOSITORY.findByCategoryId(categoryId);
        return products.stream()
                .map(MinimalProductMapper.INSTANCE::productToMinimalProductDto)
                .collect(Collectors.toList());
    }

    @Override
    public MinimalProductDto getMinimalProductById(int id) {
        return MinimalProductMapper.INSTANCE.productToMinimalProductDto(PRODUCT_REPOSITORY.findById(id));
    }

    @Override
    public FullyProductDto getProductDtoById(int id) {
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
                System.out.println("The returned Product Id is " + product.getProductId() +
                        " and its name is " + product.getProductName());
                return OrderedProductAdapter.convertProductModelToOrderedItem(product);
            }
        }
        return null;
    }

    @Override
    public List<MinimalProductDto> getProductsByPrice(int min, int max, FilterTypes type, String... inputs) {
        List<Product> products = null;
        switch (type) {
            case NORMAL:
                products = PRODUCT_REPOSITORY.findBetweenTwoPrices((double) min, (double) max);
                break;
            case SEARCH:
                products = PRODUCT_REPOSITORY.findBetweenTwoPricesUsingName((double) min, (double) max, inputs[0]);
                break;
            case CATEGORY:
                products = PRODUCT_REPOSITORY.findBetweenTwoPricesUsingCategory((double) min, (double) max, Integer.parseInt(inputs[0]));
                break;
            case SEARCH_CATEGORY:
                products = PRODUCT_REPOSITORY.findBetweenTwoPricesUsingNameAndCategory((double) min, (double) max, inputs[0], Integer.parseInt(inputs[1]));
        }
        return products.stream()
                .map(MinimalProductMapper.INSTANCE::productToMinimalProductDto)
                .collect(Collectors.toList());
    }

    @Override
    public Product getProductById(int productId) {
        return PRODUCT_REPOSITORY.findById(productId);
    }
}
