package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.adapter.UserProfileAdapter;
import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserRepositoryFactory;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {

    private final UserRepository userRepository = UserRepositoryFactory.getUserRepositoryInstance();

    @Override
    public UserDTO registerUser(UserDTO userDto) {
        // business logic
//        String passwordBeforeHashing = userDto.getPassword();
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDto);
//        user.setPassword(HashPassword.hashPassword(user.getPassword()));
        User userSaved = userRepository.saveUser(user);
        UserDTO userDTO1 = UserAdapter.convertFromUserModelToUserRegistrationDto(userSaved);
//        userDto1.setPassword(passwordBeforeHashing);
        System.out.println("From Service " + userSaved);
        return userDTO1;
    }

    @Override
    public UserDTO findByEmail(String email) {
        User user = userRepository.findByEmail(email);
        if (user == null)
            return null;
        else {
            UserDTO userDto = UserAdapter.convertFromUserModelToUserRegistrationDto(user);
            return userDto;
        }
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
    public UserDTO updateUser(UserDTO userDto) {
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDto);
        User userUpdated = userRepository.updateUser(user);
        UserDTO userDTO1 = UserAdapter.convertFromUserModelToUserRegistrationDto(userUpdated);
        System.out.println("From Service Verification " + userDTO1);
        return userDTO1;
    }

    @Override
    public UserDTO updateUserVerification(UserDTO userDto) {
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDto);
        User userUpdated = userRepository.updateUser(user);
        UserDTO userDTO1 = UserAdapter.convertFromUserModelToUserRegistrationDto(userUpdated);
        System.out.println("From Service Verification " + userDTO1);
        return userDTO1;
    }

    @Override
    public User login(String email) {
        User user = userRepository.findByEmail(email);
        System.out.println("login " + user);
        return user;
    }



    public List<UserDTO> fetchAllUsers() {
        List<UserDTO> userList = new ArrayList<>();
        userList = userRepository.fetchAllUsers();
        return userList;
    }


    @Override
    public boolean isUserBalanceEnough(double totalPrice, String userEmail) {
        User user = userRepository.findByEmail(userEmail);
        double userBalance = user.getBalance();
        return totalPrice <= userBalance;
    }

}
