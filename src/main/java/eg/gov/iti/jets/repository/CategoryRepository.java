package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Category;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository {

    Category addNewCategory(Category category);
    List<Category> getAllCategories();
    Optional<Category> getCategoryByName(String name);
}
