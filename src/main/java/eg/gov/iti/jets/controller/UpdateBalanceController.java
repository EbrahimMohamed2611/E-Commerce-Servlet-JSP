package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UpdateBalanceController" , urlPatterns = "/updateVisa")
public class UpdateBalanceController extends HttpServlet {
    private final UserService userService = UserServiceFactory.getUserServiceInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO userDto =(UserDTO) session.getAttribute("userDto");
        userDto.setBalance(1000000.500);
        UserDTO updatedUSerBalance = userService.updateUser(userDto);
        session.setAttribute("userDto",updatedUSerBalance);
        response.sendRedirect("update-visa.jsp?balanceUpdated");

    }
}
