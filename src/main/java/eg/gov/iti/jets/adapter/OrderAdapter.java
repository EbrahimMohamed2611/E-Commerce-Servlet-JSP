package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.model.Order;

public class OrderAdapter {

    public static OrderDTO convertFromOrderModelToOrderDto(Order order) {

        OrderDTO orderDTO = new OrderDTO();

        orderDTO.setId(order.getOrderId());
        order.getPurchase().stream().map(PurchaseAdapter::convertFromPurchaseModelToPurchaseDto).forEach(orderDTO.getItemsOrdered()::add);

        return orderDTO;

    }


//    public static Order convertFromOrderDtoToOrderModel(OrderDTO orderDTO) {
//
//        Order order = new Order();
//
//        orderDTO.setId(order.getOrderId());
//        order.getPurchase().stream().map(PurchaseAdapter::convertFromPurchaseModelToPurchaseDto).forEach(orderDTO.getItemsOrdered()::add);
//
//        return order;
//
//    }
}
