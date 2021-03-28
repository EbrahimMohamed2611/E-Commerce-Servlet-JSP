package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.model.User;

import javax.persistence.NoResultException;
import java.util.List;

public interface UserService {
    UserDto registerUser(UserDto userDto);
    UserDto findByEmail(String email) throws NoResultException;
    UserProfileDto updateUser(UserProfileDto userProfileDto);

    UserDto updateUser(UserDto userDto);
    UserDto updateUserVerification(UserDto userDto);
    User login(String email);

    List<User> fetchAllUsers();


}
