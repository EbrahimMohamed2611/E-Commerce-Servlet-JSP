package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;

import java.util.List;

public interface ProductRepository  {

    List<Product> findByNameLike(String productName);
    List<Product> findByCategory(Category category);
    Product addNewProduct(Product product);
    List<Product> findBetweenTwoPrices(Double firstPrice, Double secondPrice);
    List<Product> findAll();

    Product findProductById(int productId);

    void updateProduct(Product product);
}
