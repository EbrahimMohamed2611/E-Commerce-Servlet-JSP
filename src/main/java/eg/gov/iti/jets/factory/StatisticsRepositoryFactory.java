package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.repository.StatisticsRepository;
import eg.gov.iti.jets.repository.impl.StatisticsRepositoryImpl;
import eg.gov.iti.jets.repository.impl.UserRepositoryImpl;

public class StatisticsRepositoryFactory {

    private static StatisticsRepository userRepository;

    public static StatisticsRepository getUserRepositoryInstance() {
        if (userRepository == null) {
            userRepository =  new StatisticsRepositoryImpl();

        }
        return userRepository;
    }
}
