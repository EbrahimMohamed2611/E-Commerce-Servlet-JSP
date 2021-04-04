package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.*;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.OrderStatus;

import java.util.Set;
import java.util.List;

public interface OrderService {

    Order addOrder(Order order);

    Set<Order> getAllOrders(int userID);

    List<OrderDTO> getUserOrders(int userId, OrderStatus orderStatus);

    void saveOrders(UserDTO userDTO, OrderDTO orderDTO, OrderStatus orderStatus);

    boolean isProductAlreadyOrdered(OrderDTO orderDTO, int productId);

    void adjustOrderQuantity(OrderDTO orderDTO, int productId, int quantity);

    void incrementOrderQuantity(OrderDTO orderDTO, int productId);

    int getPurchaseQuantity(OrderDTO orderDTO, int productId);

    PurchaseDTO createNewPurchase(OrderedProductDTO inStockProductDTO);

    OrderDTO updateOrder(OrderDTO orderToUpdate, UserDTO userDTO, OrderStatus orderStatus);

    OrderDTO addNewOrder(OrderDTO orderToSave, UserDTO userDTO);

    OrderDTO deletePurchase(OrderDTO notCompletedOrder, int productId);

    boolean deleteOrder(int orderId);

    double totalPrice(OrderDTO orderDTO);
}
