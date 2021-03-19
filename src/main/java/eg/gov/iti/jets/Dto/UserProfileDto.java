package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.Address;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UserProfileDto {
    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    private LocalDate birthDate;
    private Address address;

}
