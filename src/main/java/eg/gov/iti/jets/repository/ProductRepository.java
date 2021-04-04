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

    double getAvgRating(int id);

}
