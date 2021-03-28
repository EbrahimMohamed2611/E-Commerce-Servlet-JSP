package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.Review;

import java.util.List;

public interface ReviewRepository {
    List<Review> findByProduct(Product product);
}
