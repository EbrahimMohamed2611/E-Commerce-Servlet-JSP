package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;


public class ProductRepositoryImpl implements ProductRepository {

    @Override
    public List<Product> findByNameLike(String productName) {

        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        return (List<Product>) entityManager.createNamedQuery("Product.findByNameLike").
                setParameter("productName", "%" + productName + "%").getResultList();
    }

    @Override
    public List<Product> findByCategory(Category category) {

        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        return (List<Product>) entityManager.createNamedQuery("Product.findByCategory").
                setParameter("category", category).getResultList();
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

        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        return (List<Product>) entityManager
                .createNamedQuery("Product.findBetweenTwoPrices")
                .setParameter("price1", firstPrice)
                .setParameter("price2", secondPrice)
                .getResultList();
    }

    @Override
    public List<Product> findAll() {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        Query from_product = entityManager.createQuery("FROM Product");
        List<Product> resultList = (ArrayList<Product>) from_product.getResultList();
        return resultList;
    }

    @Override
    public Product findProductById(int productId) {

        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        Product product = entityManager.find(Product.class, productId);
        entityManager.close();
        return product;
    }

    @Override
    public void updateProduct(Product product) {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        entityManager.merge(product);
        transaction.commit();
        entityManager.close();
    }
}
