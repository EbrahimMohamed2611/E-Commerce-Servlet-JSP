package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.persistence.NoResultException;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "UserInformationController", urlPatterns = "/checkEmail")
public class UserInformationController extends HttpServlet {

    private final UserService userService = UserServiceFactory.getUserRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        String userEmail = req.getParameter("userEmail");
        System.out.println("Email from Ajax Request " + userEmail);
        try {
            UserDto userByEmail = userService.findByEmail(userEmail);
            System.out.println("userByEmail " + userByEmail);
            if (userByEmail.getEmail().equals(userEmail))
                out.write("Exist");
        } catch (NoResultException e) {
            out.write("Not Exist");
        }

    }
}
