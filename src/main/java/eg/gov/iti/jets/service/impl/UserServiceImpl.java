package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.dto.UserRegistrationDto;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserRepositoryFactory;

public class UserServiceImpl implements UserService {

    private final UserRepository userRepository  = UserRepositoryFactory.getUserRepositoryInstance();

    @Override
    public UserRegistrationDto registerUser(UserRegistrationDto userRegistrationDto) {
        // business logic
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userRegistrationDto);

        User userSaved = userRepository.saveUser(user);

        UserRegistrationDto userRegistrationDto1 = UserAdapter.convertFromUserModelToUserRegistrationDto(userSaved);
        System.out.println("From Service " + userSaved);

        return userRegistrationDto1;
    }
}
