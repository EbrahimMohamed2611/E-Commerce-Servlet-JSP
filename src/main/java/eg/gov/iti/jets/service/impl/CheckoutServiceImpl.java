package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.adapter.OrderAdapter;
import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.factory.UserRepositoryFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.service.CheckoutService;
import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.ProductService;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class CheckoutServiceImpl implements CheckoutService {
    private static final ProductService productService = ProductServiceFactory.getProductServiceInstance();
    private static final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();


    @Override
    public Map<Integer, Boolean> isCheckoutInStock(OrderDTO orderDTO) {
        Map<Integer, Boolean> checkoutMap = new HashMap<>();
        orderDTO.getItemsOrdered().forEach(purchaseDTO -> {
            int productId = purchaseDTO.getOrderedProductDTO().getProductId();
            OrderedProductDTO inStockProduct = productService.getInStockProduct(productId, purchaseDTO.getQuantity());
            if(inStockProduct != null){
                checkoutMap.put(productId, true);
            }else{
                checkoutMap.put(productId, false);
            }
        });
        return checkoutMap;
    }

    @Override
    public UserDTO updateDatabase(UserDTO currentUserDto, OrderDTO orderToCheckout, double checkoutPrice) {

        Set<PurchaseDTO> itemsOrdered = orderToCheckout.getItemsOrdered();
        boolean isQuanityUpdated  = updateProductsQuantity(itemsOrdered);
        UserDTO updatedUserDTO = updateUserBalance(currentUserDto, checkoutPrice);
        completeTheOrder(currentUserDto, orderToCheckout);
        return updatedUserDTO;
    }

    private boolean updateProductsQuantity(Set<PurchaseDTO> purchaseDTOSet){

        purchaseDTOSet.forEach(purchaseDTO ->{
            int productId = purchaseDTO.getOrderedProductDTO().getProductId();
            Product product = productService.getProductById(productId);
            product.setQuantity(product.getQuantity() - purchaseDTO.getQuantity());
            productService.updateProduct(product);
        } );
        return true;
    }

    private UserDTO updateUserBalance(UserDTO currentUserDto, double checkoutPrice){
        User userToUpdate = UserAdapter.convertFromUserRegistrationDtoToUserModel(currentUserDto);
        userToUpdate.setBalance(userToUpdate.getBalance() - checkoutPrice);
        User updatedUser = UserRepositoryFactory.getUserRepositoryInstance().updateUser(userToUpdate);
        return UserAdapter.convertFromUserModelToUserRegistrationDto(updatedUser);
    }

    private OrderDTO completeTheOrder(UserDTO currentUserDto, OrderDTO orderToCheckout){
        Order orderToSave = OrderAdapter.convertOrderDTOToOrderModel(orderToCheckout);
        orderToSave.setOrderTimestamp(new Date());
        orderToSave.setOrderStatus(OrderStatus.COMPLETED);
        return  orderService.updateOrder(orderToCheckout, currentUserDto, OrderStatus.COMPLETED);
    }
}
