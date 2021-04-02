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
public class UserDTO {

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
    private Set<OrderDTO> orders = new HashSet<>();
    private EmailVerification emailVerification;

    @Override
    public String toString() {
        return "UserDto{" +
                "userId=" + userId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                ", gender=" + gender +
                ", balance=" + balance +
                ", birthDate=" + birthDate +
                ", address=" + address +
                ", emailVerification=" + emailVerification +
                '}';
    }
}
