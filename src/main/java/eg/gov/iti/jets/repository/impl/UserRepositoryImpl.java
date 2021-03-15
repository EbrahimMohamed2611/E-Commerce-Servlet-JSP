package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.factory.HibernateDatabaseFactory;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserRepositoryImpl implements UserRepository {
    SessionFactory sessionFactory = HibernateDatabaseFactory.getMysqlConnection();

    @Override
    public User findByEmail(String email) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        User user = (User) session.createNamedQuery("User.findByEmail").setParameter("email", email).getSingleResult();
        System.out.println("User for this Email " + email + " is "+user);
        return user;
    }

    @Override
    public User findByEmailAndPassword(String email, String password) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        User user = (User) session.createNamedQuery("User.findByEmailAndPassword")
                .setParameter("email", email).setParameter("password",password).getSingleResult();
        System.out.println("User for this Email " + email + " and this password is " + user);
        return user;
    }

    @Override
    public User saveUser(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        session.close();
        System.out.println("User saved " + user);
        return user;
    }

    @Override
    public User updateUser(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(user);
        session.getTransaction().commit();
        session.close();
        System.out.println("User updated " + user);
        return user;
    }
}
