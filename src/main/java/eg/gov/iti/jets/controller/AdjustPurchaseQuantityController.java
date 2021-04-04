package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AdjustPurchaseQuantity", urlPatterns = "/adjustPurchaseQuantity")
public class AdjustPurchaseQuantityController extends HttpServlet {

    private static final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int  productTobeAdjustedId = Integer.parseInt(req.getParameter("orderedProductId"));
        int productQuantity = Integer.parseInt(req.getParameter("productQuantity"));

        List<OrderDTO> userNotCompletedOrders = (List<OrderDTO>) session.getAttribute("userNotCompletedOrders");

        if(productQuantity <= 0){
            PrintWriter writer = resp.getWriter();
            writer.write("Cannot Do This Operation");
            writer.close();

        }else{
            orderService.adjustOrderQuantity(userNotCompletedOrders.get(0), productTobeAdjustedId, productQuantity);
            session.setAttribute("userNotCompletedOrders", userNotCompletedOrders);
            PrintWriter writer = resp.getWriter();
            writer.write("Done Adjustment");
            writer.close();
        }
    }

}
