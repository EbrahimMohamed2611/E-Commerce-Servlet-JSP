package eg.gov.iti.jets.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MinimalReviewDto {
    private String message;
    private LocalDateTime time;
    private int stars;
    private String userName;
}
