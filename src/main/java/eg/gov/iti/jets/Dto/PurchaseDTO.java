package eg.gov.iti.jets.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PurchaseDTO {

    private int quantity;
    private OrderedProductDTO orderedProductDTO;
}
