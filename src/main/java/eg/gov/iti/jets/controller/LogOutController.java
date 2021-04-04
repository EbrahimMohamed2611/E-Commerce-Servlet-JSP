package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogOutController", urlPatterns = {"/logout", "/closeBrowser"})
public class LogOutController extends HttpServlet {
    private static final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();
    private static final UserService userService = UserServiceFactory.getUserServiceInstance();
    private static final ProductService productService = ProductServiceFactory.getProductServiceInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();
        List<OrderDTO> userNotCompletedOrders = (List<OrderDTO>) session.getAttribute("userNotCompletedOrders");
        UserDTO currentUserDto = (UserDTO) session.getAttribute("userDto");

        if(userNotCompletedOrders.get(0).getItemsOrdered().isEmpty()){
            if(orderService.deleteOrder(userNotCompletedOrders.get(0).getId())){
                userNotCompletedOrders.remove(0);
                System.out.println("User not completed Order is now empty");
                session.invalidate();
                res.sendRedirect("index.jsp");
            }

        //----------------------Save Orders----------------------//
        }else if (!userNotCompletedOrders.isEmpty()) {
            OrderDTO orderDTOToSave = userNotCompletedOrders.get(0);
            int orderId = orderDTOToSave.getId(); // return 0 in case this order is not in the database yet
            //Convert from OrderDTO to Order ...
            if (orderId > 0) { //Already in database
                // use update method
                System.out.println("Order already in database, use update method ");
                System.out.println("orderDTOToSave size :  "+ orderDTOToSave.getItemsOrdered().size());
                OrderDTO updatedOrderDTO = orderService.updateOrder(orderDTOToSave, currentUserDto, OrderStatus.NOT_COMPLETED);
                System.out.println("UpdatedDTO size :  "+ updatedOrderDTO.getItemsOrdered().size());
                if (updatedOrderDTO != null) {
                    System.out.println("Order Updated Successfully!");
                } else {
                    System.out.println("Order Fail To Update!");
                }
            } else {
                // use save method
                System.out.println("Order is not in database, use save method ");
                OrderDTO updatedOrderDTO = orderService.addNewOrder(orderDTOToSave, currentUserDto);
                if (updatedOrderDTO != null) {
                    System.out.println("Order Saved for the first time Successfully!");
                } else {
                    System.out.println("Order Fail To Update!");
                }
            }
        }

//        req.getSession().getAttribute("userDto",null);
        session.invalidate();
        res.sendRedirect("index.jsp");


    }
}
