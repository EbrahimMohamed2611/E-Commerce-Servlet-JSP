package eg.gov.iti.jets.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
    private String message;
    private LocalDateTime time;
    private int stars;
    private String userName;
}

