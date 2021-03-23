package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.User;

import javax.persistence.NoResultException;

public interface UserRepository {
    User findByEmail(String email) throws NoResultException;
//    User findByEmailAndPassword(String email, String password);
    User saveUser(User user);
    User updateUser(User user);

}
