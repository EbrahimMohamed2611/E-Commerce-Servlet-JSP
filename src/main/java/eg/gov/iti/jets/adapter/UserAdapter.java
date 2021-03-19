package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.UserRegistrationDto;
import eg.gov.iti.jets.model.User;

public class UserAdapter {

    public static UserRegistrationDto convertFromUserModelToUserRegistrationDto(User user) {
        UserRegistrationDto userRegistrationDto = new UserRegistrationDto();
        userRegistrationDto.setFirstName(user.getFirstName());
        userRegistrationDto.setLastName(user.getLastName());
        userRegistrationDto.setPhone(user.getPhone());
        userRegistrationDto.setEmail(user.getEmail());
        userRegistrationDto.setPassword(user.getPassword());
        userRegistrationDto.setRole(user.getRole());
        userRegistrationDto.setGender(user.getGender());
        userRegistrationDto.setAddress(user.getAddress());
        userRegistrationDto.setBirthDate(user.getBirthDate());
        userRegistrationDto.setBalance(user.getBalance());
        return userRegistrationDto;
    }

    public static User convertFromUserRegistrationDtoToUserModel(UserRegistrationDto userRegistrationDto) {
        User user = new User();
        user.setFirstName(userRegistrationDto.getFirstName());
        user.setLastName(userRegistrationDto.getLastName());
        user.setPhone(userRegistrationDto.getPhone());
        user.setEmail(userRegistrationDto.getEmail());
        user.setGender(userRegistrationDto.getGender());
        user.setPassword(userRegistrationDto.getPassword());
        user.setRole(userRegistrationDto.getRole());
        user.setAddress(userRegistrationDto.getAddress());
        user.setBirthDate(userRegistrationDto.getBirthDate());
        user.setBalance(userRegistrationDto.getBalance());
        return user;
    }
}
