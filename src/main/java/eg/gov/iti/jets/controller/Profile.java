package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.Address;
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

//@WebServlet("/profile")
@WebServlet(name = "profile", value = "/profile")
public class Profile extends HttpServlet {
    private final UserService userService = UserServiceFactory.getUserRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);

        System.out.println("insisde the dopost");
        String data = req.getParameter("data");
        System.out.println(data);
        JSONObject obj = new JSONObject(data);

        System.out.println(obj.getString("firstname"));
        System.out.println(obj.getString("lastName"));
        System.out.println(obj.getString("password"));
        System.out.println(obj.getString("phoneNumber"));
        System.out.println(obj.getString("birthDate"));
        System.out.println(obj.getString("country"));
        System.out.println(obj.getString("state"));
        System.out.println(obj.getString("city"));
        System.out.println(obj.getString("street"));
        System.out.println(obj.getString("zipCode"));
        System.out.println("1111");
        UserProfileDto user = new UserProfileDto();
        System.out.println("1111");
        user.setFirstName(obj.getString("firstname"));
        user.setLastName(obj.getString("lastName"));
        user.setPassword(obj.getString("password"));
        user.setPhone(obj.getString("phoneNumber"));
        LocalDate birthDate = LocalDate.parse(obj.getString("birthDate"));
        user.setBirthDate(birthDate);
        String country = obj.getString("country");
        String state = obj.getString("state");
        String city = obj.getString("city");
        String street = obj.getString("street");
        String zipcode = obj.getString("zipCode");


        Address address = new Address(country,  state, city, street, zipcode);
        System.out.println(address+"======");
        System.out.println("22");
        user.setAddress(address);
        System.out.println("333");
        System.out.println("userr "+user);
        //UserProfileDto updateduser = userService.updateUser(user);
        System.out.println("updated "+user);
        System.out.println(user.getPhone() + "-------phone");
        // todo update db by user object and return user object
        PrintWriter out = resp.getWriter();
        //todo pass the function the returned user from db  after update
        System.out.println(buildGsonFromObject(user));
        out.write(buildGsonFromObject(user));

    }

    private String buildGsonFromObject(UserProfileDto userProfileDto) {
        Gson gsonUser = new Gson();
        return gsonUser.toJson(userProfileDto);

    }
}
