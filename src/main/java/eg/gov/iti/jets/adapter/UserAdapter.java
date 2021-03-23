package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.model.User;

public class UserAdapter {

    public static UserDto convertFromUserModelToUserRegistrationDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setUserId(user.getUserId());
        userDto.setFirstName(user.getFirstName());
        userDto.setLastName(user.getLastName());
        userDto.setPhone(user.getPhone());
        userDto.setEmail(user.getEmail());
        userDto.setPassword(user.getPassword());
        userDto.setRole(user.getRole());
        userDto.setGender(user.getGender());
        userDto.setAddress(user.getAddress());
        userDto.setBirthDate(user.getBirthDate());
        userDto.setBalance(user.getBalance());
//        userDto.setOrders(user.getOrders());
        userDto.setEmailVerification(user.getEmailVerification());
        return userDto;
    }

    public static User convertFromUserRegistrationDtoToUserModel(UserDto userDto) {
        User user = new User();
        user.setUserId(userDto.getUserId());
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setPhone(userDto.getPhone());
        user.setEmail(userDto.getEmail());
        user.setGender(userDto.getGender());
        user.setPassword(userDto.getPassword());
        user.setRole(userDto.getRole());
        user.setAddress(userDto.getAddress());
        user.setBirthDate(userDto.getBirthDate());
        user.setBalance(userDto.getBalance());
//        user.setOrders(userDto.getOrders());
        user.setEmailVerification(userDto.getEmailVerification());

        return user;
    }
}
