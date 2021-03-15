package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.User;

public interface UserRepository {
    User findByEmail(String email);
    User findByEmailAndPassword(String email, String password);
    User saveUser(User user);
    User updateUser(User user);

}
