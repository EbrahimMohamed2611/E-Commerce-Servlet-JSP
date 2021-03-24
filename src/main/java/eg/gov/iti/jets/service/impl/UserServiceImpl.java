package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.adapter.UserProfileAdapter;
import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserRepositoryFactory;
import eg.gov.iti.jets.utils.HashPassword;

import javax.persistence.NoResultException;

public class UserServiceImpl implements UserService {

    private final UserRepository userRepository = UserRepositoryFactory.getUserRepositoryInstance();

    @Override
    public UserDto registerUser(UserDto userDto) {
        // business logic
//        String passwordBeforeHashing = userDto.getPassword();
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDto);
//        user.setPassword(HashPassword.hashPassword(user.getPassword()));
        User userSaved = userRepository.saveUser(user);
        UserDto userDto1 = UserAdapter.convertFromUserModelToUserRegistrationDto(userSaved);
//        userDto1.setPassword(passwordBeforeHashing);
        System.out.println("From Service " + userSaved);
        return userDto1;
    }

    @Override
    public UserDto findByEmail(String email) throws NoResultException {
        User user = userRepository.findByEmail(email);
        UserDto userDto = UserAdapter.convertFromUserModelToUserRegistrationDto(user);
//        System.out.println("User by Email is" + userDto);
        return userDto;
    }

    @Override
    public UserProfileDto updateUser(UserProfileDto userProfileDto) {
        User user = UserProfileAdapter.convertFromUserProfileDtoToUserModel(userProfileDto);

        User userUpdated = userRepository.updateUser(user);

        UserProfileDto userProfileDto1 = UserProfileAdapter.convertFromUserModelToUserProfileDto(userUpdated);
        System.out.println("From Service " + userUpdated);

        return userProfileDto1;
    }

    @Override
    public UserDto updateUser(UserDto userDto) {
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDto);
        User userUpdated = userRepository.updateUser(user);
        UserDto userDto1 = UserAdapter.convertFromUserModelToUserRegistrationDto(userUpdated);
        System.out.println("From Service Verification " + userDto1);
        return userDto1;
    }

    @Override
    public UserDto updateUserVerification(UserDto userDto) {
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDto);
        User userUpdated = userRepository.updateUser(user);
        UserDto userDto1 = UserAdapter.convertFromUserModelToUserRegistrationDto(userUpdated);
        System.out.println("From Service Verification " + userDto1);
        return userDto1;
    }

    @Override
    public User login(String email) {
        User user = userRepository.findByEmail(email);
        System.out.println("login " + user);
        return user;
    }


}
