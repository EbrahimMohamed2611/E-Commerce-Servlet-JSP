package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.service.impl.UserServiceImpl;

public class UserServiceFactory {
    private static UserService userService;

    public static UserService getUserRepositoryInstance(){
        if (userService == null) {
            return new UserServiceImpl();
        }
        return userService;
    }
}
