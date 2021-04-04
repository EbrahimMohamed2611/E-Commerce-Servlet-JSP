package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.UserDTO;

import java.util.Map;

public interface CheckoutService {

    Map<Integer, Boolean> isCheckoutInStock(OrderDTO orderDTO);

   UserDTO updateDatabase(UserDTO currentUserDto, OrderDTO orderToCheckout, double checkoutPrice);
}
