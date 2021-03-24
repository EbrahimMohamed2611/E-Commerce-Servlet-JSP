package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.utils.MailService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.persistence.NoResultException;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "ForgetPasswordController", urlPatterns = "/forgetPassword")
public class ForgetPasswordController extends HttpServlet {

    private final UserService userService = UserServiceFactory.getUserRepositoryInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        try {
            UserDto userByEmail = userService.findByEmail(email);
            req.getSession().setAttribute("userDto",userByEmail);
            if (userByEmail.getEmail().equals(email)) {
                String passwordCode = UUID.randomUUID().toString();
                req.getSession().setAttribute("resetPassword", passwordCode);
                MailService.sendEmail(email, "From E-Commerce", passwordCode);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("forgetPassword");
                resp.sendRedirect("email-forget-password.jsp?reset");
            } else {
                System.out.println("");
            }

        } catch (NoResultException e) {
            resp.sendRedirect("forget-password.jsp?emailNotFound");
        }
    }

}