package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.Review;
import eg.gov.iti.jets.repository.ReviewRepository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;
import java.util.Objects;

public class ReviewRepositoryImpl implements ReviewRepository {


    @Override
    public List<Review> findByProduct(Product product) {
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        return entityManager.createNamedQuery("Review.findByProduct")
                .setParameter("product", product)
                .getResultList();

    }
}
