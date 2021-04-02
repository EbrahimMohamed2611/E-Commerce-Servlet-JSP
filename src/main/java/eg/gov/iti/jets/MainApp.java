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
        // To add a orderedProductDTO check first if List is empty add only one
        // "not completed order" to it and start add purchase to it

        //Suppose you are adding from the main page so you have only productId;
        // use the productId to get the orderedProductDTO from the database
        // if and only if the quantity in the database is not 0 and the orderedProductDTO is not deleted.
        //As the return orderedProductDTO contain information that is not needed in purchase,
        // [Already Done] convert the orderedProductDTO to productDTO and add it to purchaseDTO;
        // wrap all the previous business logic inside order service


        // in the view you will get the orderedProductDTO by id

        int productTobeAddedId = 2;
        OrderedProductDTO inStockProductDTO = productService.getInStockProduct(2);
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


        // The first to do Done
        //TODO: Purchase has redundant data which is price which is already exist inside orderedProductDTO
        //TODO: discuss using @version annotation on orderedProductDTO quantity column
        //TODO: discuss Order Id in Adaptor after presenting the business
        //TODO: set initial value  for the auto generated id in the order table starting from 1.

//        ProductDTO inStockProductDTO = productService.getInStockProduct(2);
//
//        if (inStockProductDTO != null) {
//            PurchaseDTO purchaseDTO = new PurchaseDTO();
//            purchaseDTO.setOrderedProductDTO(inStockProductDTO);
//            purchaseDTO.setQuantity(1);  //if coming from the main page the quantity is 1
//            purchaseDTO.setPrice(inStockProductDTO.getPrice());
//            if(!userNotCompletedOrders.isEmpty()){
//                userNotCompletedOrders.get(0).getItemsOrdered().add(purchaseDTO);
//            }else{
//                OrderDTO orderDTO = new OrderDTO();
//                orderDTO.getItemsOrdered().add(purchaseDTO);
//                userNotCompletedOrders.add(orderDTO);
//            }
//
//        }

        //====================== the business of saving in the database =====================//
        // Two case the first one .. this is the first time to save in database so
        // order contain no information about the user and has no id inside the database
        //if getId return zero ---->> everytime the order no. 0 will be overridden which may belongs
        // to another user .


        //the second case the order already exist in database
        // make an initial value in the order table id so, i.e start from 1 instead of zero
        //@TableGenerator(name = "Order_Gen", table = "ID_GEN", initialValue = 1)
        //@Id
        //@GeneratedValue(strategy = GenerationType.TABLE, generator = "Order_Gen")
        // make your checks against id = 0 [default value of int]
        // Fields that are declared but not initialized will be set to a reasonable default by the compiler.
        // Generally speaking, this default will be zero or null, depending on the data type.
        //Local variables are slightly different; the compiler never assigns a default value to
        // an uninitialized local variable. If you cannot initialize your local variable where
        // it is declared, make sure to assign it a value before you attempt to use it.
        // Accessing an uninitialized local variable will result in a compile-time error.

        if (!userNotCompletedOrders.isEmpty()) {
            OrderDTO orderDTOToSave = userNotCompletedOrders.get(0);
            long orderId = orderDTOToSave.getId(); // return 0 in case this order is not in the database yet
            //Convert from OrderDTO to Order ...
            if (orderId > 0) { //Already in database
                // use update method
                OrderDTO updatedOrderDTO = orderService.updateOrder(orderDTOToSave, testUser);
                if (updatedOrderDTO != null) {
                    System.out.println("Order Updated Successfully!");
                } else {
                    System.out.println("Order Fail To Update!");
                }
            } else {
                // use save method
                OrderDTO updatedOrderDTO = orderService.addNewOrder(orderDTOToSave, testUser);
                if (updatedOrderDTO != null) {
                    System.out.println("Order Updated Successfully!");
                } else {
                    System.out.println("Order Fail To Update!");
                }

            }
        }

    }

}
