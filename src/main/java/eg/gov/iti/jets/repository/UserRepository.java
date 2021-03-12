package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.User;

public interface UserRepository {
    User findByEmail(String email);
    User saveUser(User user);
}
