package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.Gender;
import eg.gov.iti.jets.model.Role;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

//@Data
@Getter
@Setter
@NoArgsConstructor
public class UserProfileDto {
    private int userId;
    private String email;
    private Role role;
    private double balance;
    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    private LocalDate birthDate;
    private Address address = new Address();

    private Gender gender;


}
