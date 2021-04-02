package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.PurchaseId;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PurchaseDTO {

    private int quantity;
    private OrderedProductDTO orderedProductDTO;
    private PurchaseId purchaseId;
}
