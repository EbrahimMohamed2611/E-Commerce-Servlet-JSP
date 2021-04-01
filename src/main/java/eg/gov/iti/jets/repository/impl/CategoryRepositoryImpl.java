package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.repository.CategoryRepository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;

public class CategoryRepositoryImpl implements CategoryRepository {
    @Override
    public Category addNewCategory(Category category) {
        System.out.println(category.getCategoryName());
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.persist(category);
        entityManager.getTransaction().begin();
        entityManager.getTransaction().commit();
        entityManager.close();
        return category;
    }

    @Override
    public List<Category> getAllCategories() {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        Query from_category = entityManager.createQuery("FROM Category");
        List<Category> categories = (List<Category>) from_category.getResultList();
        return categories;
    }

    @Override
    public Optional<Category> getCategoryByName(String name) {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        Query from_category = entityManager.createQuery("FROM Category");
        List<Category> categories = (List<Category>) from_category.getResultList();
        return categories.stream().filter(c -> c.getCategoryName().equals(name)).findFirst();

    }
}
