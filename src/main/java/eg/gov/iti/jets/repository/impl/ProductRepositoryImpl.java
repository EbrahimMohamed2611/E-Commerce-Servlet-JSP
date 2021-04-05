package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
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
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        Query from_product = entityManager.createQuery("FROM Product");
        List<Product> resultList = (ArrayList<Product>) from_product.getResultList();
        return resultList;
    }

    @Override
    public void updateProduct(Product product) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        updatePurchase(product);
        entityManager.createQuery("update from Product set productName=:name,description=:desc,quantity=:quantity,price=:price where productId=:id")
                .setParameter("name" ,product.getProductName()).setParameter("desc" ,product.getDescription())
                .setParameter("quantity" , product.getQuantity()).setParameter("price" , product.getPrice()).setParameter("id" , product.getProductId()).executeUpdate();

       // Product productUpdated = entityManager.merge(product);

        entityManager.getTransaction().commit();
        System.out.println("after the update fn ");
        entityManager.close();
        //return productUpdated;
    }

    @Override
    public void removeProduct(int productId) {
            EntityManager createEntityManager = PersistenceManager.INSTANCE.getEntityManager();
            createEntityManager.getTransaction().begin();
            removePurchase(productId);
            createEntityManager.createQuery("delete from Product where productId ="+productId).executeUpdate();
            createEntityManager.getTransaction().commit();
            createEntityManager.close();

        }

    @Override
    public void updatePurchase(Product product) {

    }

    @Override
    public void removePurchase(int productId) {
        EntityManager createEntityManager = PersistenceManager.INSTANCE.getEntityManager();
        createEntityManager.getTransaction().begin();
        //select o from Order o where o.user.userId = :userId"
        createEntityManager.createQuery("delete from Purchase p where p.product.productId ="+productId).executeUpdate();
        createEntityManager.getTransaction().commit();
        createEntityManager.close();
    }
}
