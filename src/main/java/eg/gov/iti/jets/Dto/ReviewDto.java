package eg.gov.iti.jets.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class ReviewDTO {
    private int productId; //orderedProductDTO Unique identifier
    private String userEmail; //user unique identifier
    private String userName;
    private String message;
    private LocalDateTime reviewTime;
    private int stars;

}
