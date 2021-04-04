package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.model.*;
import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.*;

@WebServlet(name = "OrderController", urlPatterns = "/order")
public class OrderController extends HttpServlet {
    private final OrderService orderService=  OrderServiceFactory.getOrderServiceInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Set<Order> allOrders = orderService.getAllOrders(1);
        System.out.println(allOrders);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Order Nested Objects

        PurchaseId purchaseId = new PurchaseId();
        UserDto userDto = (UserDto) req.getSession().getAttribute("userDto");
        User user = new User();
        user.setUserId(userDto.getUserId());

        String userOrder = req.getParameter("userOrder");
        if (userOrder != null) {
            Type userOrderType = new TypeToken<Order>() {
            }.getType();
            Order newOrder = new Gson().fromJson(userOrder, userOrderType);
            System.out.println("orderList " + newOrder);

            // Add Order Details
            newOrder.setOrderTimestamp(new Date());
            newOrder.setOrderStatus(OrderStatus.COMPLETED);
            newOrder.setUser(user);








            Order order = orderService.addOrder(newOrder);


        }
    }
}
