package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.model.Order;

public class OrderAdapter {

    public static OrderDTO convertOrderModelToOrderDTO(Order order) {

        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setId(order.getOrderId());
        orderDTO.setOrderTimestamp(order.getOrderTimestamp());
        order.getPurchase().stream().map(PurchaseAdapter::convertPurchaseModelToPurchaseDTO).forEach(orderDTO.getItemsOrdered()::add);
        return orderDTO;
    }

    public static Order convertOrderDTOToOrderModel(OrderDTO orderDTO) {

        Order order = new Order();
        order.setOrderId(orderDTO.getId());
        order.setOrderTimestamp(orderDTO.getOrderTimestamp());
        orderDTO.getItemsOrdered().stream().map(PurchaseAdapter::convertPurchaseDTOToPurchaseModel)
                .forEach(order.getPurchase()::add);
        System.out.println("Order Id : " + order.getOrderId());
       order.getPurchase().forEach(purchase -> purchase.setOrder(order));
       order.getPurchase().forEach(purchase -> System.out.println("Order Id inside purchase : " + purchase.getOrder().getOrderId()));
        return order;
    }
}
