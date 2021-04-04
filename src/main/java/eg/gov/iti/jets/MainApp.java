package eg.gov.iti.jets;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.OrderStatus;
import eg.gov.iti.jets.service.OrderService;
import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.UserService;

import java.util.List;

public class MainApp {
    private static final OrderService orderService = OrderServiceFactory.getOrderServiceInstance();
    private static final UserService userService = UserServiceFactory.getUserServiceInstance();
    private static final ProductService productService = ProductServiceFactory.getProductServiceInstance();

    public static void main(String[] args) {

        UserDTO testUser = userService.findByEmail("mail@mail.com");
        List<OrderDTO> userNotCompletedOrders = orderService.getUserOrders(testUser.getUserId(), OrderStatus.NOT_COMPLETED);
        if (userNotCompletedOrders == null) {
            System.out.println("userNotCompletedOrders == null");
        }

        assert userNotCompletedOrders != null;
        if (userNotCompletedOrders.isEmpty()) {
            System.out.println("userNotCompletedOrders is Empty");
        }


        //-------------------- The business of the adding to shopping cart from main page---------------------------//

        int productTobeAddedId = 1;
        OrderedProductDTO inStockProductDTO = productService.getInStockProduct(productTobeAddedId);
        if (inStockProductDTO == null) {
            System.out.println("Sorry Product out of Stock");
        } else {
            if (!userNotCompletedOrders.isEmpty()) {
                OrderDTO orderDTO = userNotCompletedOrders.get(0);
                boolean productAlreadyOrdered = orderService.isProductAlreadyOrdered(orderDTO, productTobeAddedId);
                if (productAlreadyOrdered) {
                    System.out.println("Product is ordered Before");
                    orderService.incrementOrderQuantity(orderDTO, productTobeAddedId);
                } else {
                    System.out.println("Product is not ordered Before");
                    PurchaseDTO purchaseDTO = orderService.createNewPurchase(inStockProductDTO);
                    userNotCompletedOrders.get(0).getItemsOrdered().add(purchaseDTO);
                }
            } else {
                System.out.println("No not completed order, create new order");
                PurchaseDTO purchaseDTO = orderService.createNewPurchase(inStockProductDTO);
                OrderDTO orderDTO = new OrderDTO();
                orderDTO.getItemsOrdered().add(purchaseDTO);
                userNotCompletedOrders.add(orderDTO);
            }
        }
        //====================== the business of deleting =====================//

        // delete an item :
        System.out.println("Number of purchase before deleting : " +  userNotCompletedOrders.get(0).getItemsOrdered().size() );

        OrderDTO orderDTOAfterDelete = orderService.deletePurchase(userNotCompletedOrders.get(0), 1);
        if(orderDTOAfterDelete != null){
            System.out.println("Update User not Completed orders after delete an item");
//            System.out.println("Number of purchase before deleting : " + orderDTOAfterDelete.getItemsOrdered().size() );
//            userNotCompletedOrders.set(0, orderDTOAfterDelete);
            System.out.println("Number of purchase after deleting : " +  userNotCompletedOrders.get(0).getItemsOrdered().size() );

        }

        if(userNotCompletedOrders.get(0).getItemsOrdered().isEmpty()){
            if(orderService.deleteOrder(userNotCompletedOrders.get(0).getId())){
                userNotCompletedOrders.remove(0);
                System.out.println("User not completed Order is now empty");
            }
        }


        //====================== the business of saving in the database =====================//


        if (!userNotCompletedOrders.isEmpty()) {
            OrderDTO orderDTOToSave = userNotCompletedOrders.get(0);
            int orderId = orderDTOToSave.getId(); // return 0 in case this order is not in the database yet
            //Convert from OrderDTO to Order ...
            if (orderId > 0) { //Already in database
                // use update method
                System.out.println("Order already in database, use update method ");
                System.out.println("orderDTOToSave size :  "+ orderDTOToSave.getItemsOrdered().size());
                OrderDTO updatedOrderDTO = orderService.updateOrder(orderDTOToSave, testUser, OrderStatus.NOT_COMPLETED);
                System.out.println("UpdatedDTO size :  "+ updatedOrderDTO.getItemsOrdered().size());
                if (updatedOrderDTO != null) {
                    System.out.println("Order Updated Successfully!");
                } else {
                    System.out.println("Order Fail To Update!");
                }
            } else {
                // use save method
                System.out.println("Order is not in database, use save method ");
                OrderDTO updatedOrderDTO = orderService.addNewOrder(orderDTOToSave, testUser);
                if (updatedOrderDTO != null) {
                    System.out.println("Order Saved for the first time Successfully!");
                } else {
                    System.out.println("Order Fail To Update!");
                }
            }
        }
    }


}
