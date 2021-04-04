package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.adapter.OrderAdapter;
import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.convertors.JsonConvertor;
import eg.gov.iti.jets.dto.FullyProductDto;
import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.factory.UserRepositoryFactory;
import eg.gov.iti.jets.mappers.ProductMapper;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AddPurchaseController", urlPatterns = "/addToCart")
public class AddPurchaseController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String quantity = request.getParameter("quantity");
        try {
            if (productId != null && !productId.isEmpty()) {
                int purchaseQuantity;
                if (quantity == null || quantity.isEmpty()) {
                    purchaseQuantity = 1;
                } else {
                    purchaseQuantity = Integer.parseInt(quantity);
                }
                OrderService orderService = OrderServiceFactory.getOrderServiceInstance();
                FullyProductDto productDto = ProductServiceFactory.getProductServiceInstance().getProductDtoById(Integer.parseInt(productId));
                Purchase purchase = new Purchase();
                purchase.setProduct(ProductMapper.INSTANCE.productDtoToProduct(productDto));
                purchase.setQuantity(purchaseQuantity);
                UserDTO userDto = (UserDTO) request.getSession().getAttribute("userDto");
                List<OrderDTO> userOrders = orderService.getUserOrders(userDto.getUserId(), OrderStatus.NOT_COMPLETED);
                if (userOrders == null) {
                    Order order = OrderAdapter.convertOrderDTOToOrderModel(userOrders.get(0));
                    purchase.setOrder(order);
                    order.getPurchase().add(purchase);
                } else {
                    Order order = new Order();
                    order.setOrderStatus(OrderStatus.NOT_COMPLETED);
                    User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDto);
                    order.setUser(user);
                    order.setOrderTimestamp(new Date());
                    purchase.setOrder(order);
                    order.getPurchase().add(purchase);
                    user.getOrders().add(order);
                    UserRepositoryFactory.getUserRepositoryInstance().updateUser(user);
                }
                response.setContentType("application/json");
                response.getWriter().write(JsonConvertor.toJson(productDto));
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(404);
        }
    }
}
