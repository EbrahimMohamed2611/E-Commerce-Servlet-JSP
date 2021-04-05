package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AddToShoppingCart", urlPatterns = "/addToCart")
public class AddToShoppingCartController extends HttpServlet {

    private static final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();
    private static final ProductService productService = ProductServiceFactory.getProductServiceInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        Gson gson = new Gson();
        List<OrderDTO> userNotCompletedOrders = (List<OrderDTO>) req.getSession().getAttribute("userNotCompletedOrders");
        String orderJson = gson.toJson(userNotCompletedOrders.get(0));
        System.out.println("Order Json : " + orderJson);
        PrintWriter writer = resp.getWriter();
        writer.write(orderJson);
        writer.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        int productTobeAddedId = Integer.parseInt(req.getParameter("orderedProductId"));
        List<OrderDTO> userNotCompletedOrders = (List<OrderDTO>) session.getAttribute("userNotCompletedOrders");


        OrderedProductDTO inStockProductDTO = productService.getInStockProduct(productTobeAddedId);

        PrintWriter writer = resp.getWriter();
        Gson gson = new Gson();
        resp.setContentType("application/json");
        if (inStockProductDTO == null) {
            System.out.println("Sorry Product out of Stock");
            // ToDO : inform user with that through response
            writer.write("OutOfStock");
            writer.close();
        } else {
            if (userNotCompletedOrders != null && !userNotCompletedOrders.isEmpty()) {
                OrderDTO orderDTO = userNotCompletedOrders.get(0);
                boolean productAlreadyOrdered = orderService.isProductAlreadyOrdered(orderDTO, productTobeAddedId);
                if (productAlreadyOrdered) {
                    System.out.println("Product is ordered Before");
                    orderService.incrementOrderQuantity(orderDTO, productTobeAddedId);

                    session.setAttribute("userNotCompletedOrders", userNotCompletedOrders);
                } else {
                    System.out.println("Product is not ordered Before");
                    PurchaseDTO purchaseDTO = orderService.createNewPurchase(inStockProductDTO);
                    userNotCompletedOrders.get(0).getItemsOrdered().add(purchaseDTO);
                    userNotCompletedOrders.get(0).setOrderTimestamp(new Date());

                    session.setAttribute("userNotCompletedOrders", userNotCompletedOrders);
                    String inStockJson = gson.toJson(inStockProductDTO);
                    writer.write(inStockJson);
                    writer.close();
                }
            } else {
                System.out.println("No not completed order, create new order");
                PurchaseDTO purchaseDTO = orderService.createNewPurchase(inStockProductDTO);
                OrderDTO orderDTO = new OrderDTO();
                orderDTO.getItemsOrdered().add(purchaseDTO);
                userNotCompletedOrders.add(orderDTO);
                userNotCompletedOrders.get(0).setOrderTimestamp(new Date());
                session.setAttribute("userNotCompletedOrders", userNotCompletedOrders);
                // TODO: return product to main page.
                String inStockJson = gson.toJson(inStockProductDTO);
                writer.write(inStockJson);
                writer.close();
            }
        }

    }
}
