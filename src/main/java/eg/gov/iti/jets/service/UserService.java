package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.model.User;

import java.util.List;

public interface UserService {
    UserDTO registerUser(UserDTO userDto);
    UserDTO findByEmail(String email);
    UserProfileDto updateUser(UserProfileDto userProfileDto);

    UserDTO updateUser(UserDTO userDto);
    UserDTO updateUserVerification(UserDTO userDto);
    User login(String email);
     List<UserDto> fetchAllUsers();


}
