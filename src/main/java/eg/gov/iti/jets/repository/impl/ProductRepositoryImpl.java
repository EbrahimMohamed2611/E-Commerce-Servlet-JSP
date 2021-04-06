package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.exceptions.ProductNotFoundException;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import java.util.ArrayList;
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
    public List<Product> findByNameLikeUsingLimit(String productName, int start, int limit) {
        return (List<Product>) ENTITY_MANAGER.createNamedQuery("Product.findByNameLike").
                setParameter("productName", "%" + productName + "%")
                .setFirstResult(start)
                .setMaxResults(limit)
                .getResultList();
    }

    @Override
    public double getMaxPriceForName(String productName) {
        return (double) ENTITY_MANAGER.createNamedQuery("Product.getMaxPriceForName").
                setParameter("productName", "%" + productName + "%")
                .getResultList()
                .get(0);
    }

    @Override
    public List<Product> findByNameAndCategory(String productName, int categoryId) {
        return ENTITY_MANAGER.createNamedQuery("Product.findByNameAndCategory").
                setParameter("productName", "%" + productName + "%")
                .setParameter("categoryId", categoryId)
                .getResultList();
    }

    @Override
    public List<Product> findByNameAndCategoryUsingLimit(String productName, int categoryId, int start, int limit) {
        return ENTITY_MANAGER.createNamedQuery("Product.findByNameAndCategory").
                setParameter("productName", "%" + productName + "%")
                .setParameter("categoryId", categoryId)
                .setFirstResult(start)
                .setMaxResults(limit)
                .getResultList();
    }

    @Override
    public double getMaxPriceForNameAndCategory(String productName, int categoryId) {
        return (double) ENTITY_MANAGER.createNamedQuery("Product.getMaxPriceForNameAndCategory").
                setParameter("productName", "%" + productName + "%")
                .setParameter("categoryId", categoryId)
                .getResultList()
                .get(0);
    }

    @Override
    public List<Product> findByCategory(Category category) {
        return (List<Product>) ENTITY_MANAGER.createNamedQuery("Product.findByCategory").
                setParameter("category", category).getResultList();
    }

    @Override
    public double getMaxPriceForCategory(int categoryId) {
        return (double) ENTITY_MANAGER.createQuery("select MAX(price) from Product where isDeleted = false and quantity > 0 and category.categoryId = :categoryId")
                .setParameter("categoryId", categoryId)
                .getResultList()
                .get(0);
    }

    @Override
    public List<Product> findByCategoryId(int categoryId) {
        return ENTITY_MANAGER.createQuery("from Product where isDeleted = false and quantity > 0 and category.categoryId = :categoryId")
                .setParameter("categoryId", categoryId)
                .getResultList();
    }
    @Override
    public List<Product> findByCategoryIdUsingLimit(int categoryId, int start, int limit) {
        return ENTITY_MANAGER.createQuery("from Product where isDeleted = false and quantity > 0 and category.categoryId = :categoryId")
                .setParameter("categoryId", categoryId)
                .setFirstResult(start)
                .setMaxResults(limit)
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
    public List<Product> findBetweenTwoPricesUsingName(Double firstPrice, Double secondPrice, String productName) {
        return ENTITY_MANAGER
                .createNamedQuery("Product.findBetweenTwoPricesUsingName")
                .setParameter("price1", firstPrice)
                .setParameter("price2", secondPrice)
                .setParameter("productName", "%" + productName + "%")
                .getResultList();
    }

    @Override
    public List<Product> findBetweenTwoPricesUsingCategory(Double firstPrice, Double secondPrice, int categoryId) {
        return ENTITY_MANAGER
                .createNamedQuery("Product.findBetweenTwoPricesUsingCategory")
                .setParameter("price1", firstPrice)
                .setParameter("price2", secondPrice)
                .setParameter("categoryId", categoryId)
                .getResultList();
    }

    @Override
    public List<Product> findBetweenTwoPricesUsingNameAndCategory(Double firstPrice, Double secondPrice, String productName, int categoryId) {
        return ENTITY_MANAGER
                .createNamedQuery("Product.findBetweenTwoPricesUsingNameAndCategory")
                .setParameter("price1", firstPrice)
                .setParameter("price2", secondPrice)
                .setParameter("productName", "%" + productName + "%")
                .setParameter("categoryId", categoryId)
                .getResultList();
    }

    @Override
    public List<Product> findAll() {
        EntityManager entityManager = persistenceManager.getEntityManager();
        Query from_product = entityManager.createQuery("FROM Product");
        List<Product> resultList = (ArrayList<Product>) from_product.getResultList();
        return resultList;
        // TODO Mahmous look at here please
//        return ENTITY_MANAGER.createQuery("FROM Product where isDeleted = false and quantity > 0").getResultList();
    }

    @Override
    public double getMaxPriceForAll() {
        return (double) ENTITY_MANAGER.createQuery("SELECT MAX(price) FROM Product where isDeleted = false and quantity > 0").getResultList().get(0);
    }

    @Override
    public List<Product> getProductsWithLimit(int offset, int limit) {
        return ENTITY_MANAGER.createQuery("FROM Product where isDeleted = false and quantity > 0")
                .setFirstResult(offset)
                .setMaxResults(limit)
                .getResultList();
    }

    @Override
    public long getCountForAllProducts() {
        return (long) ENTITY_MANAGER.createQuery("SELECT COUNT(productId) FROM Product where isDeleted = false and quantity > 0")
                .getResultList()
                .get(0);
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
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
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
    public void removePurchase(int productId) {
        EntityManager createEntityManager = PersistenceManager.INSTANCE.getEntityManager();
        createEntityManager.getTransaction().begin();
        //select o from Order o where o.user.userId = :userId"
        createEntityManager.createQuery("delete from Purchase p where p.product.productId ="+productId).executeUpdate();
        createEntityManager.getTransaction().commit();
        createEntityManager.close();
    }
}
