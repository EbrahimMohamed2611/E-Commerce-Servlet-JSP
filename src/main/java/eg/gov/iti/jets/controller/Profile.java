package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.convertors.JsonConvertor;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.Gender;
import eg.gov.iti.jets.model.Role;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;


@WebServlet(name = "profile", value = "/profile")
public class Profile extends HttpServlet {
    private final UserService userService = UserServiceFactory.getUserServiceInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp);

        String data = req.getParameter("data");
        JSONObject obj = new JSONObject(data);
        resp.setContentType("application/json");


        UserDTO user = new UserDTO();
        user.setFirstName(obj.getString("firstname"));
        user.setLastName(obj.getString("lastName"));
        user.setPassword(obj.getString("password"));
        user.setPhone(obj.getString("phoneNumber"));
        user.setUserId(obj.getInt("id"));
        user.setEmail(obj.getString("email"));
        if (obj.getString("gender").equals(Gender.FEMALE)) {
            user.setGender(Gender.FEMALE);
        } else {
            user.setGender(Gender.MALE);
        }
        user.setRole(Role.USER_ROLE);


        user.setBalance(obj.getDouble("balance"));
        LocalDate birthDate = LocalDate.parse(obj.getString("birthDate"));
        user.setBirthDate(birthDate);
        String country = obj.getString("country");
        String state = obj.getString("state");
        String city = obj.getString("city");
        String street = obj.getString("street");
        String zipcode = obj.getString("zipCode");


        Address address = new Address(country, state, city, street, zipcode);
        user.setAddress(address);
        UserDTO updatedUser = userService.updateUser(user);
        //putting updated object on the session
        req.getSession().setAttribute("userDto", updatedUser);
        PrintWriter out = resp.getWriter();
        out.write(JsonConvertor.toJson(updatedUser));

    }

    private String buildGsonFromObject(UserProfileDto userProfileDto) {
        Gson gsonUser = new Gson();
        return gsonUser.toJson(userProfileDto);

    }
}
