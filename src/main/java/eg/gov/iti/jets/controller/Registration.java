package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserRegistrationDto;
import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.Role;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserServiceFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;



@WebServlet(name = "Registration", urlPatterns = "/registration")
public class Registration extends HttpServlet {

    private final UserService userService = UserServiceFactory.getUserRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Get");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phoneNumber");
        String birthDate = req.getParameter("birthDate");
        String balance = req.getParameter("balance");

        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateOfBirth = LocalDate.parse(birthDate, dateTimeFormatter);

        String country = req.getParameter("country");
        String state = req.getParameter("state");
        String city = req.getParameter("city");
        String street = req.getParameter("street");
        String zipCode = req.getParameter("zipcode");
        Address address = new Address(country, state, city, street, zipCode);
        System.out.println(address);

        UserRegistrationDto userRegistrationDto = new UserRegistrationDto();
        userRegistrationDto.setFirstName(firstName);
        userRegistrationDto.setLastName(lastName);
        userRegistrationDto.setEmail(email);
        userRegistrationDto.setPassword(password);
        userRegistrationDto.setPhone(phone);
        userRegistrationDto.setBirthDate(dateOfBirth);
        userRegistrationDto.setRole(Role.USER_ROLE);
        userRegistrationDto.setBalance(Double.parseDouble(balance));
        userRegistrationDto.setAddress(address);
        System.out.println("User Registration Dto " + userRegistrationDto);
        userService.registerUser(userRegistrationDto);
    }
}