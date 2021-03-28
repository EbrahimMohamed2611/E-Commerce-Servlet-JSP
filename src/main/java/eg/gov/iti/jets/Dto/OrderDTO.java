package eg.gov.iti.jets.dto;


import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;

@Data
public class OrderDTO {

    private int id;
    private final Set<PurchaseDTO> itemsOrdered = new HashSet<>();




//   OrderItemDTO orderedItem;
//   int quantity = 1;
//
//
//
//    public OrderItemDTO getOrderedItem() {
//        return orderedItem;
//    }
//
//    public void setOrderedItem(OrderItemDTO orderedItem) {
//        this.orderedItem = orderedItem;
//    }
//
//    public int getQuantity() {
//        return quantity;
//    }
//
//    public void setQuantity(int quantity) {
//        this.quantity = quantity;
//    }
//
//    public void incrementNumItems() {
//        quantity++;
//    }
}
