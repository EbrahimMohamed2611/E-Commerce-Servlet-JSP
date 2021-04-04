package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.exceptions.ProductNotFoundException;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceException;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    private static final EntityManager ENTITY_MANAGER = PersistenceManager.INSTANCE.getEntityManager();
    private final PersistenceManager persistenceManager = PersistenceManager.INSTANCE;

    @Override
    public List<Product> findByNameLike(String productName) {
        return (List<Product>) ENTITY_MANAGER.createNamedQuery("Product.findByNameLike").
                setParameter("productName", "%" + productName + "%").getResultList();
    }

    @Override
    public List<Product> findByCategory(Category category) {
        return (List<Product>) ENTITY_MANAGER.createNamedQuery("Product.findByCategory").
                setParameter("category", category).getResultList();
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        return ENTITY_MANAGER.createQuery("from Product where isDeleted = false and quantity > 0 and category.categoryId = :categoryId")
                .setParameter("categoryId", categoryId)
                .getResultList();
    }

    @Override
    public Product findById(int id) {
        try {
            return (Product) ENTITY_MANAGER.createQuery("from Product where productId = :id")
                    .setParameter("id", id).getSingleResult();
        } catch (PersistenceException exception) {
            throw new ProductNotFoundException("Product with id=" + id + " not found!");
        }
    }

    @Override
    public Product addNewProduct(Product product) {
        System.out.println(product);
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(product);
        entityManager.getTransaction().commit();
        entityManager.close();
        return product;
    }

    @Override
    public List<Product> findBetweenTwoPrices(Double firstPrice, Double secondPrice) {
        return (List<Product>) ENTITY_MANAGER
                .createNamedQuery("Product.findBetweenTwoPrices")
                .setParameter("price1", firstPrice)
                .setParameter("price2", secondPrice)
                .getResultList();
    }

    @Override
    public List<Product> findAll() {
        return ENTITY_MANAGER.createQuery("FROM Product where isDeleted = false and quantity > 0").getResultList();
    }

    @Override
    public double getAvgRating(int id) {
        try {
            return (double) ENTITY_MANAGER.createNamedQuery("Product.getAvgRating").setParameter("productId", id).getSingleResult();
        } catch (PersistenceException exception) {
            throw new ProductNotFoundException("Product with id=" + id + " not found!");
        }
    }

    @Override
    public void updateProduct(Product product) {
        EntityManager entityManager = persistenceManager.getEntityManager();
        EntityTransaction transaction = ENTITY_MANAGER.getTransaction();
        transaction.begin();
        entityManager.merge(product);
        transaction.commit();
        entityManager.close();
    }
}
