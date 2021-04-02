package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;


public class ProductRepositoryImpl implements ProductRepository {

    private final PersistenceManager persistenceManager = PersistenceManager.INSTANCE;

    @Override
    public List<Product> findByNameLike(String productName) {
        EntityManager entityManager = persistenceManager.getEntityManager();
        return (List<Product>) entityManager.createNamedQuery("Product.findByNameLike").
                setParameter("productName", "%" + productName + "%").getResultList();
    }

    @Override
    public List<Product> findByCategory(Category category) {
        EntityManager entityManager = persistenceManager.getEntityManager();
        return (List<Product>) entityManager.createNamedQuery("Product.findByCategory").
                setParameter("category", category).getResultList();
    }

    @Override
    public List<Product> findBetweenTwoPrices(Double firstPrice, Double secondPrice) {
        EntityManager entityManager = persistenceManager.getEntityManager();
        return (List<Product>) entityManager
                .createNamedQuery("Product.findBetweenTwoPrices")
                .setParameter("price1", firstPrice)
                .setParameter("price2", secondPrice)
                .getResultList();
    }

    @Override
    public List<Product> findAll() {
        EntityManager entityManager = persistenceManager.getEntityManager();
        Query from_product = entityManager.createQuery("FROM Product");
        List<Product> resultList = (ArrayList<Product>) from_product.getResultList();
        return resultList;
    }

    @Override
    public Product findProductById(int productId) {

        EntityManager entityManager = persistenceManager.getEntityManager();
        Product product = entityManager.find(Product.class, productId);
        entityManager.close();
        return product;
    }
}
