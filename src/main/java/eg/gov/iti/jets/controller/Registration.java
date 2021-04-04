package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.EmailVerification;
import eg.gov.iti.jets.model.Gender;
import eg.gov.iti.jets.model.Role;
import eg.gov.iti.jets.model.User;

import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.utils.MailService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import java.util.List;

import java.util.UUID;


@WebServlet(name = "Registration", urlPatterns = "/registration")
public class Registration extends HttpServlet {

    private final UserService userService = UserServiceFactory.getUserServiceInstance();

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        PrintWriter out = resp.getWriter();
//        String userEmail = req.getParameter("userEmail");
//        System.out.println("Email from Ajax Request " + userEmail);
//        try {
//            UserDto userByEmail = userService.findByEmail(userEmail);
//            System.out.println("userByEmail " + userByEmail);
//            if (userByEmail.getEmail().equals(userEmail))
//                out.write("Exist");
//        } catch (NoResultException e) {
//            out.write("Not Exist");
//        }
//
//    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("from Reegistration");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phoneNumber");
        String birthDate = req.getParameter("birthDate");
        String balance = req.getParameter("balance");
        String gender = req.getParameter("gender");
        System.out.println("+++++++"+birthDate);
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dateOfBirth = LocalDate.parse(birthDate, dateTimeFormatter);

        String country = req.getParameter("country");
        String state = req.getParameter("state");
        String city = req.getParameter("city");
        String street = req.getParameter("street");
        String zipCode = req.getParameter("zipcode");
        Address address = new Address(country, state, city, street, zipCode);
        System.out.println(address);

        UserDTO userRegistrationDto = new UserDTO();
        userRegistrationDto.setFirstName(firstName);
        userRegistrationDto.setLastName(lastName);
        userRegistrationDto.setEmail(email);
//        String hashedPassword = HashPassword.hashPassword(password);
        userRegistrationDto.setPassword(password);
        userRegistrationDto.setPhone(phone);
        userRegistrationDto.setBirthDate(dateOfBirth);
        userRegistrationDto.setRole(Role.USER_ROLE);
        if(gender.equals("female"))
        userRegistrationDto.setGender(Gender.FEMALE);
        else
        userRegistrationDto.setGender(Gender.MALE);
        userRegistrationDto.setEmailVerification(EmailVerification.NOT_VERIFY);
        userRegistrationDto.setBalance(Double.parseDouble(balance));
        userRegistrationDto.setAddress(address);
        System.out.println("User Registration Dto " + userRegistrationDto);
        UserDTO userDto = userService.registerUser(userRegistrationDto);
        req.getSession().setAttribute("userDto",userDto);
        ServletContext servletContext = getServletContext();
        List<UserDto> userList = (List<UserDto>)servletContext.getAttribute("userList");
        userList.add(userDto);
        servletContext.setAttribute("userList", userList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("email-verification.jsp");

        String verificationCode = UUID.randomUUID().toString();
        req.getSession().setAttribute("verificationCode",verificationCode);
        //ana hena msh 3rfa ezai a7wel mn dto le user model 3shan ykon feh el orders w kda
        System.out.println("userlist befor regiteration the new user---> "+userList);
        //todo add new user model into the lsit and then put it intto the cotext
        try {
            MailService.sendEmail(email,"From E-Commerce", verificationCode);
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            System.out.println("Cannot forward to home page");
            e.printStackTrace();
        }
    }
}