package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.model.User;

public class UserAdapter {

    public static UserDTO convertFromUserModelToUserRegistrationDto(User user) {
        UserDTO userDto = new UserDTO();
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
        userDto.setEmailVerification(user.getEmailVerification());
        user.getOrders().stream().map(OrderAdapter::convertOrderModelToOrderDTO).forEach(userDto.getOrders()::add);

        return userDto;
    }

    public static User convertFromUserRegistrationDtoToUserModel(UserDTO userDto) {
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
