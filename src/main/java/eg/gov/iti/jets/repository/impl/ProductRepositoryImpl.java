package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.ProductRepository;
import org.hibernate.Criteria;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        Query from_product = entityManager.createQuery("FROM Product");
        List<Product> resultList = (ArrayList<Product>) from_product.getResultList();
        return resultList;
    }

    @Override
    public Product updateProduct(Product product) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        Product productUpdated = entityManager.merge(product);
        entityManager.getTransaction().commit();
        entityManager.close();
        return productUpdated;
    }

    @Override
    public void removeProduct(int productId) {
            EntityManager createEntityManager = PersistenceManager.INSTANCE.getEntityManager();
            createEntityManager.getTransaction().begin();
            createEntityManager.createQuery("delete from Product where productId ="+productId).executeUpdate();
            createEntityManager.getTransaction().commit();
            createEntityManager.close();

        }


}
