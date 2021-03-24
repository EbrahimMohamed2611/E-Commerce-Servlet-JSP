package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.adapter.UserProfileAdapter;
import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.dto.UserRegistrationDto;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserRepositoryFactory;

import javax.persistence.NoResultException;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public UserRegistrationDto findByEmail(String email) throws NoResultException {
        User user = userRepository.findByEmail(email);
        UserRegistrationDto userRegistrationDto = UserAdapter.convertFromUserModelToUserRegistrationDto(user);
        System.out.println("User by Email is" + userRegistrationDto);
        return userRegistrationDto;
    }


    public UserProfileDto updateUser(UserProfileDto userProfileDto) {
        User user = UserProfileAdapter.convertFromUserProfileDtoToUserModel(userProfileDto);

        User userupdated = userRepository.updateUser(user);

        UserProfileDto userProfileDto1 = UserProfileAdapter.convertFromUserModelToUserProfileDto(userupdated);
        System.out.println("From Service " + userupdated);

        return userProfileDto1;
    }

    @Override
    public List<User> fetchAllUsers() {
        List<User> userList = new ArrayList<>();
        userList = userRepository.fetchAllUsers();
        return userList;
    }
}
