package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.service.impl.UserServiceImpl;

public class UserServiceFactory {
    private static UserService userService;

    public static UserService getUserServiceInstance() {
        if (userService == null) {
            userService = new UserServiceImpl();
        }
        return userService;
    }
}
