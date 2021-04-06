package eg.gov.iti.jets.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FullyProductDto {
    private int id;
    private String name;
    private String description;
    private ImageDto image;
    private float price;
    private CategoryDto category;
    private Set<MinimalReviewDto> reviews;
}
