package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.UserRegistrationDto;
import eg.gov.iti.jets.model.User;

public interface UserService {
    UserRegistrationDto registerUser(UserRegistrationDto userRegistrationDto);
}
