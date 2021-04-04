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

    List<Product> findAll();

    double getAvgRating(int id);

}
