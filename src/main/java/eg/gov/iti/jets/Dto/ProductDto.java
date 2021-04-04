package eg.gov.iti.jets.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;


@Data
@NoArgsConstructor
public class ProductDTO {

    private int productId;
    private String productName;
    private String description;
    private int quantity;
    private Double price;
    private String category;
    private String imagePath;
    private Set<ReviewDTO> reviews = new HashSet<>();
}