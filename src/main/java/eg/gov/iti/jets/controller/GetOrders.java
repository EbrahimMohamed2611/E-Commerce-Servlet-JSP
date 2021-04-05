package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.factory.OrderRepositoryFactory;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet(name = "getorders", value = "/getorders")
public class GetOrders extends HttpServlet {
    private final OrderRepository orderRepository = OrderRepositoryFactory.getOrderRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userId = req.getParameter("data");
        System.out.println(userId + "iddd");
        //todo must check the returned set and send it tp jsp instead of static set
        List<Order>orders = orderRepository.getUserOrders(Integer.parseInt(userId));
        System.out.println("orderss--> "+ orders);
        resp.setContentType("text/html");
        System.out.println("-----------------------------");
        // System.out.println("username in the servlet -> "+userid);
        System.out.println("-----------------------------");
        PrintWriter out = resp.getWriter();
        //todo must pass the orderlist to the attribute
        System.out.println("-------------befor setting att on the request----------------");
        req.setAttribute("orders", orders);
        System.out.println("-------------after setting attt----------------");
        RequestDispatcher rd = req.getRequestDispatcher("orders.jsp");
        System.out.println("-------------afterdisp--------------");
        rd.forward(req, resp);
       // resp.sendRedirect("/dashboard.jsp");
    }

    private String buildGsonFromObject(UserDto userDto) {
        Gson gsonUser = new Gson();
        return gsonUser.toJson(userDto);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
