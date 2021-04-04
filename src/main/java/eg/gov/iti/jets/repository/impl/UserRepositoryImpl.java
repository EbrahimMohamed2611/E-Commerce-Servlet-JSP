package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.config.PersistenceManager;
import eg.gov.iti.jets.model.Role;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {

    private final PersistenceManager persistenceManager = PersistenceManager.INSTANCE;

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
    public User findByEmail(String email) throws NoResultException {
        System.out.println("entityManager is opened");
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        List<User> resultList = (ArrayList<User>) entityManager
                .createNamedQuery("User.findByEmail").
                        setParameter("email", email).getResultList();
        entityManager.getTransaction().commit();
        entityManager.close();

        for (User user : resultList) {
            if (user.getEmail().equals(email))
                return user;
        }
        return null;
    }

//    @Override
//    public User findByEmailAndPassword(String email, String password) {
////        Session session = sessionFactory.openSession();
////        session.beginTransaction();
//        EntityManager entityManager = PersistenceManager.INSTANCE.getEntityManager();
//        entityManager.getTransaction().begin();
//        User user = (User) entityManager.createNamedQuery("User.findByEmailAndPassword")
//                .setParameter("email", email).setParameter("password",password).getSingleResult();
//        System.out.println("User for this Email " + email + " and this password is " + user);
//        return user;
//    }

    @Override
    public User saveUser(User user) {
        System.out.println("saveUser" + user.getEmail());
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("User saved " + user);
        return user;
    }

    @Override
    public User updateUser(User user) {
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        User userUpdated = entityManager.merge(user);
        entityManager.getTransaction().commit();
        entityManager.close();
        System.out.println("User updated " + userUpdated);
        return userUpdated;

    }

    @Override
    public List<User> fetchAllUsers() {
        EntityManager entityManager = persistenceManager.getEntityManager();
        List<User> users = entityManager.createQuery("from User").getResultList();
        entityManager.close();
        return users;
    }

    public List<User> findALlAdminUsers() {
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        List<User> resultList = entityManager.createNamedQuery("User.getAllAdminUsers").getResultList();
        entityManager.getTransaction().commit();
        entityManager.close();
        return resultList;
    }

    @Override
    public List<User> findALlCustomerUsers() {
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        List<User> resultList = (List<User>) entityManager.createNamedQuery("User.getAllCustomerUsers").getResultList();
        entityManager.getTransaction().commit();
        entityManager.close();
        return resultList;
    }

    @Override
    public User updateUserRole(String email, Role role) {
        User user = findByEmail(email);
        user.setRole(role);
        EntityManager entityManager = persistenceManager.getEntityManager();
        entityManager.getTransaction().begin();
        User userUpdated = entityManager.merge(user);
        entityManager.getTransaction().commit();
        entityManager.close();
        return userUpdated;

    }
}
