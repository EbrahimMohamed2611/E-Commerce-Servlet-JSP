package eg.gov.iti.jets.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
public class ShoppingCartDTO {
    private int id;
    private final Set<PurchaseDTO> itemsOrdered = new HashSet<>();
}
