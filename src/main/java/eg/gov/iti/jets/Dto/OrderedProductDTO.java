package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.Image;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderedProductDTO {

    private int productId;
    private String productName;
    private String description;
    private Double price;
    private Image productImage;

}
