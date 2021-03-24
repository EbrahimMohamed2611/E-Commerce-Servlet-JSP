package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.ConnectToMysqlDatabase;
import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserRepositoryImpl implements UserRepository {
//    SessionFactory sessionFactory = HibernateDatabaseFactory.getMysqlConnection();
//    private final EntityManager entityManager = (EntityManager) ConnectToMysqlDatabase.getInstance().getEntityManager();
//    @Override
//    public User findByEmail(String email) {
//        Session session = sessionFactory.openSession();
//        System.out.println("Session is opened");
//        session.beginTransaction();
//        User user = (User) session.createNamedQuery("User.findByEmail").setParameter("email", email);
//        System.out.println("User for this Email " + email + " is "+user);
//        return user;
//    }
    @Override
    public User findByEmail(String email) throws NoResultException{
        System.out.println("entityManager is opened");
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("e-commerce");
        EntityManager entityManager = factory.createEntityManager();
        entityManager.getTransaction().begin();
        User user = (User) entityManager
                .createNamedQuery("User.findByEmail").
                        setParameter("email", email).
                        getSingleResult();

        entityManager.getTransaction()
                .commit();

        entityManager.close();

//        transaction.begin();
//        System.out.println("entityManager is opened");
//        User user = (User) entityManager.createNamedQuery("User.findByEmail").setParameter("email", email);
//        System.out.println("User for this Email " + email + " is "+user);
//        entityManager.close();
        return user;
    }

    @Override
    public User findByEmailAndPassword(String email, String password) {
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        User user = (User) entityManager.createNamedQuery("User.findByEmailAndPassword")
                .setParameter("email", email).setParameter("password",password).getSingleResult();
        System.out.println("User for this Email " + email + " and this password is " + user);
        return user;
    }

    @Override
    public User saveUser(User user) {
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("User saved " + user);
        return user;
    }

    @Override
    public User updateUser(User user) {
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        entityManager.getTransaction().begin();
        User updatedUser = entityManager.merge(user);
        System.out.println("User merged " + updatedUser);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("User updated " + updatedUser);
        return updatedUser;
    }

    @Override
    public List<User> fetchAllUsers() {
        List<User> userList = new ArrayList<>();
        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
        Query query = entityManager.createQuery("from User");
        System.out.println( "query.getResultList()------> "+ query.getResultList());
        userList = query.getResultList();
        System.out.println("UserList-----> "+userList);


        //entityManager.getTransaction().begin();

        return userList;

    }
}
