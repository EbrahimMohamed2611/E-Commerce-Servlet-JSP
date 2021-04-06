package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;

import java.util.List;

public interface ProductRepository {

    Product findById(int id);

    List<Product> findByNameLike(String productName);

    List<Product> findByCategory(Category category);

    List<Product> findByCategoryId(int categoryId);

    Product addNewProduct(Product product);

    List<Product> findBetweenTwoPrices(Double firstPrice, Double secondPrice);

    List<Product> findBetweenTwoPricesUsingName(Double firstPrice, Double secondPrice, String productName);

    List<Product> findBetweenTwoPricesUsingCategory(Double firstPrice, Double secondPrice, int categoryId);

    List<Product> findBetweenTwoPricesUsingNameAndCategory(Double firstPrice, Double secondPrice, String productName, int categoryId);

    List<Product> findAll();

    void removeProduct(int productId);



    void removePurchase(int productId);


    double getAvgRating(int id);

    void updateProduct(Product product);

    double getMaxPriceForAll();

    double getMaxPriceForCategory(int categoryId);

    double getMaxPriceForName(String productName);

    List<Product> findByNameAndCategory(String productName, int categoryId);

    double getMaxPriceForNameAndCategory(String productName, int categoryId);

    long getCountForAllProducts();

    List<Product> getProductsWithLimit(int offset, int limit);

    List<Product> findByCategoryIdUsingLimit(int categoryId, int start, int limit);

    List<Product> findByNameAndCategoryUsingLimit(String productName, int categoryId, int start, int limit);

    List<Product> findByNameLikeUsingLimit(String productName, int start, int limit);

}
