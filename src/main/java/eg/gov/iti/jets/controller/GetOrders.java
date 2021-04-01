package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.dto.UserProfileDto;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.Purchase;
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
    private final OrderService orderService = OrderServiceFactory.getOrderRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("inside dooooooooogeeeeeeeeeet");
        String userId = req.getParameter("data");
        System.out.println(userId + "iddddddddddddddddddddddd");
        //todo must check the returned set and send it tp jsp instead of static set
       // Set<Order>orders = orderService.getAllOrders(Integer.parseInt(userId));
        //JSONObject obj = new JSONObject(data);
        resp.setContentType("text/html");
        //  System.out.println("name "+obj.getString("firstName"));
        //   JSONArray orders = obj.getJSONArray("orders");
        // System.out.println("orders--------> "+orders);
        //System.out.println("orders "+obj.getString("orders"));
        //List<Order> orders = userService.fetchAllOrders(userid);
        //  System.out.println("inside the doget orders = ----------> "+orders);
        System.out.println("-----------------------------");
        // System.out.println("username in the servlet -> "+userid);
        System.out.println("-----------------------------");
        PrintWriter out = resp.getWriter();
        Set<Order> orderss = new HashSet<>();
        Order order = new Order();
        order.setOrderId(1);
        order.setOrderTimestamp(new Date());
        Purchase purchase = new Purchase();
        Product product = new Product();
        product.setProductId(1);
        product.setProductName("laptop");
        product.setPrice(5.7);
        Product product2 = new Product();
        product2.setProductId(2);
        product2.setProductName("laptop");
        product2.setPrice(10.2);
        purchase.setProduct(product);
        purchase.setQuantity(5);
        Purchase purchase1 = new Purchase();
        purchase1.setProduct(product2);
        purchase1.setQuantity(57);
        Set<Purchase> purchasesSet = new HashSet<>();
        purchasesSet.add(purchase);
        purchasesSet.add(purchase1);
        order.setPurchase(purchasesSet);
        ////////////////////////////another order///////////////////////

        Order order1 = new Order();
        order1.setOrderId(2);
        order1.setOrderTimestamp(new Date());
        Purchase purchasee = new Purchase();
        Product productt = new Product();
        productt.setProductId(3);
        productt.setProductName("laptop");
        productt.setPrice(122.32);
        Product productt2 = new Product();
        productt2.setProductId(4);
        productt2.setProductName("laptop");
        productt2.setPrice(10.2232312);
        purchasee.setProduct(productt);
        purchasee.setQuantity(5213122);
        Purchase purchasee1 = new Purchase();
        purchasee1.setProduct(productt2);
        purchasee1.setQuantity(572321);
        Set<Purchase> purchasesSett = new HashSet<>();
        purchasesSett.add(purchasee);
        purchasesSett.add(purchasee1);
        order1.setPurchase(purchasesSett);


        ///////////////////////////////////

        Order order11 = new Order();
        order11.setOrderId(2);
        order11.setOrderTimestamp(new Date());
        Purchase purchasee11 = new Purchase();
        Product productt1 = new Product();
        productt1.setProductId(3);
        productt1.setProductName("laptop");
        productt1.setPrice(122.32);
        Product productt21 = new Product();
        productt21.setProductId(4);
        productt21.setProductName("laptop");
        productt21.setPrice(12.3);
        purchasee11.setProduct(productt);
        purchasee11.setQuantity(12);
        Purchase purchasee111 = new Purchase();
        purchasee111.setProduct(productt2);
        purchasee111.setQuantity(213);
        Set<Purchase> purchasesSett1 = new HashSet<>();
        purchasesSett1.add(purchasee11);
        purchasesSett1.add(purchasee111);
        order11.setPurchase(purchasesSett1);



        orderss.add(order);
        orderss.add(order1);
        orderss.add(order11);

        //purchase.setPurchasesId();
        out.write(String.valueOf(orderss));
        //todo must pass the orderlist to the attribute
        System.out.println("-------------befor setting att on the request----------------");
        req.setAttribute("orders", orderss);
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
