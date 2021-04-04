package eg.gov.iti.jets.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MinimalProductDto {
    private int id;
    private String name;
    private String description;
    private ImageDto image;
    private float price;
    private CategoryDto category;
}
