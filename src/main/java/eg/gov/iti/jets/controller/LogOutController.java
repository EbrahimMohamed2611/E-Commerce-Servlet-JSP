package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.OrderDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogOutController", value = "/logout")
public class LogOutController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getSession().setAttribute("userDto",null);

        //----------------------Save Orders----------------------//
//        List<OrderDTO> userNotCompletedOrders = (List<OrderDTO>) req.getSession().getAttribute("userNotCompletedOrders");
//        if( userNotCompletedOrders != null && !userNotCompletedOrders.isEmpty()){
//            userNotCompletedOrders.forEach(orderDTO -> );
//        }


        res.sendRedirect("index.jsp");


    }
}
