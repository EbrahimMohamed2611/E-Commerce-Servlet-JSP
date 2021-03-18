package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import eg.gov.iti.jets.Dto.UserProfileDto;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

//@WebServlet("/profile")
@WebServlet(name = "profile", value = "/profile")
public class Profile extends HttpServlet {
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
        UserProfileDto user = new UserProfileDto();
        user.setFirstName(obj.getString("firstname"));
        user.setLastName(obj.getString("lastName"));
        user.setPassword(obj.getString("password"));
        user.setPhone(obj.getString("phoneNumber"));
        LocalDate birthDate = LocalDate.parse(obj.getString("birthDate"));
        user.setBirthDate(birthDate);
        user.setCountry(obj.getString("country"));
        user.setState(obj.getString("state"));
        user.setCity(obj.getString("city"));
        user.setStreet(obj.getString("street"));
        user.setZipCode(obj.getString("zipCode"));

        System.out.println(user.getPhone()+"-------phone");
        // todo update db by user object and return user object
        PrintWriter out = resp.getWriter();
        //todo pass the function the returned user from db  after update
        System.out.println(builGsonFromObject(user));
        out.write(builGsonFromObject(user));

    }
    private String builGsonFromObject (UserProfileDto userProfileDto) {
        Gson gsonUser = new Gson();
        return gsonUser.toJson(userProfileDto);

    }
}
