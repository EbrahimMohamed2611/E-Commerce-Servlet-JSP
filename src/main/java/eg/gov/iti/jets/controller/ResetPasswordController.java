package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", urlPatterns = "/updatePassword")
public class ResetPasswordController extends HttpServlet {
    private final UserService userService = UserServiceFactory.getUserServiceInstance();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDto userDto = (UserDto) req.getSession().getAttribute("userDto");
        String newPassword = req.getParameter("resetPassword");
        userDto.setPassword(newPassword);
        UserDto userDto1 = userService.updateUser(userDto);
        System.out.println("User before updated " + userDto1.getPassword());
        req.getSession().setAttribute("userDto",null);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
//        resp.sendRedirect("login.jsp");
        requestDispatcher.forward(req,resp);
    }
}
