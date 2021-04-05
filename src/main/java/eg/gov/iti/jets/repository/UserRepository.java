package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.model.Role;
import eg.gov.iti.jets.model.User;

import javax.persistence.NoResultException;
import java.util.List;

public interface UserRepository {
    User findByEmail(String email) throws NoResultException;
//    User findByEmailAndPassword(String email, String password);
    User saveUser(User user);
    User updateUser(User user);
    List<UserDto> fetchAllUsers ();

    List<User> findALlAdminUsers();
    List<UserDto> findALlCustomerUsers();
    User updateUserRole(String email, Role role);


}
