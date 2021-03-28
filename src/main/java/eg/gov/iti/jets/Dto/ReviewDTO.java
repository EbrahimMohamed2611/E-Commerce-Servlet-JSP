package eg.gov.iti.jets.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

@Data
@NoArgsConstructor
public class ReviewDTO {
    private String userName;
    private String message;
    private LocalDateTime reviewTime;
    private int stars;
}
