package eg.gov.iti.jets.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Data
@Getter
@Setter
@NoArgsConstructor
public class UserLoginDto {

    private String email;
    private String password;

}
