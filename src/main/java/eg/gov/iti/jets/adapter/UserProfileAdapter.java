package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.model.User;

public class UserProfileAdapter {
    public static UserProfileDto convertFromUserModelToUserProfileDto(User user) {

        UserProfileDto userProfileDto = new UserProfileDto();
        userProfileDto.setFirstName(user.getFirstName());
        userProfileDto.setLastName(user.getLastName());
        userProfileDto.setPhone(user.getPhone());
        userProfileDto.setPassword(user.getPassword());
        userProfileDto.setAddress(user.getAddress());
        userProfileDto.setBirthDate(user.getBirthDate());

        return userProfileDto;
    }
    public static User convertFromUserProfileDtoToUserModel(UserProfileDto userProfileDto) {
        User user = new User();

        user.setFirstName(userProfileDto.getFirstName());
        user.setLastName(userProfileDto.getLastName());
        user.setPhone(userProfileDto.getPhone());
        user.setPassword(userProfileDto.getPassword());
        user.setAddress(userProfileDto.getAddress());
        user.setBirthDate(userProfileDto.getBirthDate());

        return user;
    }

}
