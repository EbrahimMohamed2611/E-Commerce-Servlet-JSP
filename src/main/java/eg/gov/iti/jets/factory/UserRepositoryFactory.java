package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.repository.UserRepository;
import eg.gov.iti.jets.repository.impl.UserRepositoryImpl;

public class UserRepositoryFactory {

    private static UserRepository userRepository;

    public static UserRepository getUserRepositoryInstance(){
        if (userRepository == null) {
            userRepository =  new UserRepositoryImpl();
        }
        return userRepository;
    }
}
