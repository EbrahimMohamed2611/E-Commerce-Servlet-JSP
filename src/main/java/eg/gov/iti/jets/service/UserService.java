package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.UserRegistrationDto;
import eg.gov.iti.jets.model.User;

import javax.persistence.NoResultException;

public interface UserService {
    UserRegistrationDto registerUser(UserRegistrationDto userRegistrationDto);
    UserRegistrationDto findByEmail(String email) throws NoResultException;
}
