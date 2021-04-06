package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.utils.MailService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "CompleteOrderController", urlPatterns = "/completeOrderController")
public class CompleteOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("From Completed Order");
        HttpSession session = request.getSession();
        UserDTO userDto =(UserDTO) session.getAttribute("userDto");

        OrderDTO userNotCompletedOrder =(OrderDTO)  session.getAttribute("userCompleted");

        new Thread(()-> MailService.sendEmail(userDto.getEmail(), "From E-Commerce", userNotCompletedOrder.toString())).start();

        response.sendRedirect("order-completed.jsp");
    }
}
