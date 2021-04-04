package eg.gov.iti.jets;

import eg.gov.iti.jets.factory.OrderServiceFactory;
import eg.gov.iti.jets.model.*;
import eg.gov.iti.jets.service.OrderService;

import java.util.Date;
import java.util.UUID;

public class AddOder {
    public static void main(String[] args) {

        OrderService orderService = OrderServiceFactory.getOrderServiceInstance();

        Order order = new Order();
        Purchase purchase = new Purchase();
        PurchaseId purchaseId = new PurchaseId();
        Product product = new Product();
        User user = new User();
        user.setUserId(1);


//        first add Order
        order.setOrderTimestamp(new Date());
        order.setOrderStatus(OrderStatus.COMPLETED);

        // second add Product
        product.setQuantity(4);
        product.setProductName("Dell");
        product.setDescription("Any thind");
        //add product image
        Image image = new Image();
        image.setImagePath("c://");
        image.setImageName(UUID.randomUUID().toString()+".png");
        product.setProductImage(image);

        purchase.setQuantity(40);
        purchase.setProduct(product);
        purchaseId.setOrderId(1);
        purchaseId.setProductId(1);

        order.getPurchase().add(purchase);
        order.setUser(user);

        orderService.addOrder(order);








    }
}
