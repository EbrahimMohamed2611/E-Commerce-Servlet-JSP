package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;

import eg.gov.iti.jets.model.Role;

import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.service.OrderService;

import eg.gov.iti.jets.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginController extends HttpServlet {
    public static final String USER_NAME = "E-commerce";

    private final UserService userService = UserServiceFactory.getUserServiceInstance();
    private final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String[] remember = request.getParameterValues("remember");
        System.out.println("email" + email + "password" + password);
//        String passwordHashing = HashPassword.hashPassword(password);
        UserDTO userDto = userService.findByEmail(email);
        if (userDto == null) {
            response.sendRedirect("login.jsp?notFound");
        } else {
            if (userDto.getEmail().equals(email) && userDto.getPassword().equals(password) && userDto.getRole() == Role.USER_ROLE) {

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                HttpSession session = request.getSession();

                session.setAttribute("userDto", userDto);

                //------------------- Put User Orders on Session----------------------//
                List<OrderDTO> userNotCompletedOrders = orderService.getUserOrders(userDto.getUserId(), OrderStatus.NOT_COMPLETED);
                if(userNotCompletedOrders == null || userNotCompletedOrders.size() <= 0){
                    System.out.println("userNotCompletedOrders == null ");
                    userNotCompletedOrders = new ArrayList<>();
                }
                session.setAttribute("userNotCompletedOrders", userNotCompletedOrders);

                requestDispatcher.forward(request, response);

            } else if (userDto.getEmail().equals(email) && userDto.getPassword().equals(password) && userDto.getRole() == Role.ADMIN_ROLE) {
//                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/index.jsp");
                request.getSession().setAttribute("userDto", userDto);
                response.sendRedirect("product.jsp");
//                requestDispatcher.forward(request, response);
            } else {

                response.sendRedirect("login.jsp?invalid");
            }
        }


    }
}
