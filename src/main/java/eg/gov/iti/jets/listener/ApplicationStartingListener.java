package eg.gov.iti.jets.listener;

import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.config.HibernateMySqlConfiguration;
import eg.gov.iti.jets.config.PersistenceManager;


import eg.gov.iti.jets.dto.UserDataDto;
import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.factory.UserRepositoryFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.repository.UserRepository;
import eg.gov.iti.jets.service.UserService;

import eg.gov.iti.jets.utils.AllCountries;
import eg.gov.iti.jets.utils.MailService;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.hibernate.SessionFactory;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebListener
public class ApplicationStartingListener implements ServletContextListener{
    EntityManagerFactory factory ;

    private final UserService userService = UserServiceFactory.getUserRepositoryInstance();
    private final UserRepository userRepository = UserRepositoryFactory.getUserRepositoryInstance();


    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        MailService.sendEmail("iti.jets.intake41.p2@tutanota.com");
        Map<String, String> stringStringMap = null;
        try {
            stringStringMap = AllCountries.JSONReader();
        } catch (URISyntaxException | FileNotFoundException e) {
            System.out.println("Can't read json file ");
            e.printStackTrace();
        }
        factory = Persistence.createEntityManagerFactory("e-commerce");
        System.out.println("Database is Opened");
        sce.getServletContext().setAttribute("countries",stringStringMap);

        List<User> userList = userRepository.findALlCustomerUsers();
        List<UserDataDto> userDataDtoList = userList.stream().map(UserAdapter::convertFromUsertoUserDataDto).collect(Collectors.toList());
        System.out.println("Inside initialize of conttext->userlist "+userList);
        sce.getServletContext().setAttribute("userList",userDataDtoList);
        System.out.println("put it into the ocntext scope ");


//         sessionFactory = HibernateDatabaseFactory.getMysqlConnection();
//        //sessionFactory.openSession();
//        System.out.println("Data base Connection is opened");
//        MailService.sendEmail("iti.jets.intake41.p2@tutanota.com");

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        PersistenceManager.INSTANCE.close();
        System.out.println("Database is closed");
    }
}
