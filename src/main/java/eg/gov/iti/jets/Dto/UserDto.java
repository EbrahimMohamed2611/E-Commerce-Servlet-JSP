package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.*;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
public class UserDto {

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
    private Set<Order> orders = new HashSet<>(0);
    private EmailVerification emailVerification;


}
