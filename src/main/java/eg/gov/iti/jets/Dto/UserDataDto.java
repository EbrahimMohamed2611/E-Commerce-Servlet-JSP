package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.Gender;
import eg.gov.iti.jets.model.Role;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
@Getter
@Setter
@NoArgsConstructor
public class UserDataDto {
    private int userId;
    private String firstName;
    private String lastName;
    private String phone;
    private String email;
    private String password;
    private Role role;
    private Gender gender;
    private double balance;
    private LocalDate birthDate;
    private Address address = new Address();

}
