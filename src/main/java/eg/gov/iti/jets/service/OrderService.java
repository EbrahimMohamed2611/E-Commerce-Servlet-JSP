package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.model.OrderStatus;

import java.util.List;

public interface OrderService {
    List<OrderDTO> getUserOrders(int userId, OrderStatus orderStatus);
}
