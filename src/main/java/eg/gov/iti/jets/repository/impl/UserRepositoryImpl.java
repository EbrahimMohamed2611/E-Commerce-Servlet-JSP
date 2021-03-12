package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.factory.HibernateDatabaseFactory;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserRepositoryImpl implements UserRepository {
    SessionFactory sessionFactory = HibernateDatabaseFactory.getOracleConnection();

    @Override
    public User findByEmail(String email) {
        return null;
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
}
