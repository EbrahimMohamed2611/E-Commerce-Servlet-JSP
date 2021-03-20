package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.dto.UserRegistrationDto;
import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.User;

import java.time.LocalDate;

public class UserProfileAdapter {
    public static UserProfileDto convertFromUserModelToUserProfileDto(User user) {

        UserProfileDto userProfileDto = new UserProfileDto();
        userProfileDto.setId(user.getUserId());
        userProfileDto.setBalance(user.getBalance());
        userProfileDto.setRole(user.getRole());
        userProfileDto.setEmail(user.getEmail());
        userProfileDto.setFirstName(user.getFirstName());
        userProfileDto.setLastName(user.getLastName());
        userProfileDto.setPhone(user.getPhone());
        userProfileDto.setPassword(user.getPassword());
        userProfileDto.setAddress(user.getAddress());
        userProfileDto.setBirthDate(user.getBirthDate());
        userProfileDto.setGender(user.getGender());

        return userProfileDto;
    }
    public static User convertFromUserProfileDtoToUserModel(UserProfileDto userProfileDto) {
        User user = new User();
        user.setGender(userProfileDto.getGender());
        user.setUserId(userProfileDto.getId());
        user.setBalance(userProfileDto.getBalance());
        user.setEmail(userProfileDto.getEmail());
        user.setRole(userProfileDto.getRole());
        user.setFirstName(userProfileDto.getFirstName());
        user.setLastName(userProfileDto.getLastName());
        user.setPhone(userProfileDto.getPhone());
        user.setPassword(userProfileDto.getPassword());
        user.setAddress(userProfileDto.getAddress());
        user.setBirthDate(userProfileDto.getBirthDate());

        return user;
    }

}
