package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserRepositoryFactory;

public class UserServiceImpl implements UserService {

    private final UserRepository userRepository  = UserRepositoryFactory.getUserRepositoryInstance();

    @Override
    public User saveUSer(User user) {
        //logic
        User userSaved = userRepository.saveUser(user);
        System.out.println("From Service " + userSaved);
        return userSaved;
    }
}
