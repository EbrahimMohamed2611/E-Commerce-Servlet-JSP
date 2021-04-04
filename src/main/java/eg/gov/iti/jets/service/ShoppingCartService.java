package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.OrderDTO;

import java.util.Set;

public interface ShoppingCartService {
    Set<OrderDTO> getItemsOrdered();
    void addItem(int itemID);
    void setNumOrdered(int itemID, int numOrdered);
}
