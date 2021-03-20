package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.Gender;
import eg.gov.iti.jets.model.Role;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UserProfileDto {
    private int id;
    private String email;
    private Role role;
    private double balance;
    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    private LocalDate birthDate;
    private Address address;
    private Gender gender;

}
