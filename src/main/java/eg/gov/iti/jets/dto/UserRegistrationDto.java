package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.Address;
import eg.gov.iti.jets.model.Gender;
import eg.gov.iti.jets.model.Role;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UserRegistrationDto {

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
    private Address address;



}
