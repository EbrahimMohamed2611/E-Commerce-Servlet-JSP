package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
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
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "RemoveFromShoppingCart", urlPatterns = "/removePurchase")
public class RemovePurchaseController extends HttpServlet {

    private static final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // delete an item :
        HttpSession session = req.getSession();


        List<OrderDTO> userNotCompletedOrders = (List<OrderDTO>) session.getAttribute("userNotCompletedOrders");

        int productTobeDeletedId = Integer.parseInt(req.getParameter("orderedProductId"));

        OrderDTO orderDTOAfterDelete = orderService.deletePurchase(userNotCompletedOrders.get(0), productTobeDeletedId );
        if(orderDTOAfterDelete != null){
            System.out.println("Update User not Completed orders after delete an item");
            System.out.println("Number of purchase after deleting : " +  userNotCompletedOrders.get(0).getItemsOrdered().size() );
            Gson gson = new Gson();
            String deletedOrderJson = gson.toJson(orderDTOAfterDelete);
            System.out.println("After delete: "+ deletedOrderJson);

            resp.setContentType("application/json");
            PrintWriter writer = resp.getWriter();
            writer.write(deletedOrderJson);
            writer.close();
        }


    }
}
