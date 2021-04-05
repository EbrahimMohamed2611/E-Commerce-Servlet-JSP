package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.convertors.JsonConvertor;
import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.CheckoutServiceFactory;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.service.CheckoutService;
import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@WebServlet(name = "checkout", urlPatterns = "/checkout")
public class CheckoutController extends HttpServlet {

    private final UserService userService = UserServiceFactory.getUserServiceInstance();
    private final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();
    private final CheckoutService checkoutService = CheckoutServiceFactory.getCheckOutServiceInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Check Balance
        HttpSession session = req.getSession();
        List<OrderDTO> userNotCompletedOrder = (List<OrderDTO>) session.getAttribute("userNotCompletedOrders");

        System.out.println("userNotCompletedOrder #### " + userNotCompletedOrder);
        OrderDTO orderToCheckout = userNotCompletedOrder.get(0);
        UserDTO currentUserDto = (UserDTO) session.getAttribute("userDto");
        String checkout = req.getParameter("checkout");

        PrintWriter writer = resp.getWriter();

        if(checkout.equals("true")){
            double totalPrice = orderService.totalPrice(orderToCheckout);
            boolean isUserBalanceEnough = userService.isUserBalanceEnough(totalPrice, currentUserDto.getEmail());

            resp.setContentType("application/json");
            if (isUserBalanceEnough){
                //Check isInStock
                Map<Integer, Boolean> checkoutInStock = checkoutService.isCheckoutInStock(orderToCheckout);
                boolean isContainOutOfStockProduct = checkoutInStock.containsValue(false);
                System.out.println("MAPPPPPPPPPPPPPPPPPPPPPPP => " + checkoutInStock + " BOOLEAN => " + isContainOutOfStockProduct);
                if (isContainOutOfStockProduct){
                    String jsonCheckout = JsonConvertor.toJson(checkoutInStock);
                    System.out.println("Checkout Json : " + jsonCheckout);
                    writer.write("{\"map\": "+jsonCheckout + "}" );
                    writer.close();
                }else{
                    // if ok ---> Update database
                    UserDTO updatedUserDTO = checkoutService.updateDatabase(currentUserDto, orderToCheckout, totalPrice);
                    if (updatedUserDTO != null){
                        session.setAttribute("userDto", currentUserDto);
                        OrderDTO orderDTO = userNotCompletedOrder.get(0);
                        session.setAttribute("userCompleted", orderDTO);
                        userNotCompletedOrder.clear();
                        session.setAttribute("userNotCompletedOrders", userNotCompletedOrder);
                        writer.write("{\"success\": \"Low Balance\"}");
                        writer.close();
                    }
                }
            }else{
                writer.write("{\"error\": \"Low Balance\"}");
                writer.close();
            }
        }




    }
}
