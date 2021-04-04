package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "USERS_DETAILS")
@NamedQueries({
        @NamedQuery(name = "User.findByEmailAndPassword",
                query = "SELECT u from User u where u.email=:email and u.password=:password"),
        @NamedQuery(name = "User.findByEmail",
                query = "SELECT u from User u where u.email=:email"),
        @NamedQuery(name = "User.getAllUsers",
                query = "SELECT u from User u where u.role = eg.gov.iti.jets.model.Role.USER_ROLE"),
        @NamedQuery(name = "User.getAllAdminUsers",
                query = "SELECT u from User u where u.role = eg.gov.iti.jets.model.Role.ADMIN_ROLE"),
})
//@Getter
//@Setter
//@NoArgsConstructor
@Data
public class User implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "USERS_ID", updatable = false, unique = true, nullable = false)
    private int userId;

    @Column(name = "FIRST_NAME", nullable = false)
    private String firstName;

    @Column(name = "LAST_NAME", nullable = false)
    private String lastName;

    @Column(name = "PHONE", nullable = false)
    private String phone;

    @Column(name = "EMAIL", unique = true, nullable = false)
    private String email;

    @Column(name = "PASSWORD", nullable = false)
    private String password;

    @Column(name = "GENDER", nullable = false)
    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Column(name = "CUSTOMER_ROLE", nullable = false)
    @Enumerated(EnumType.STRING)
    private Role role;

    @Column(name = "EMAIL_VERIFICATION")
    @Enumerated(EnumType.STRING)
    EmailVerification emailVerification;

    @Column(name = "BALANCE", nullable = false)
    private double balance;

    @Column(name = "BIRTH_DATE")
    private LocalDate birthDate;

    @OneToOne
    @JoinColumn(name = "IMAGE_ID")
    private Image userImage;

//    @OneToMany(mappedBy = "user")
//    private Set<Address> address = new HashSet<>();

    @Embedded
    private Address address = new Address();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private Set<Order> orders = new HashSet<>();



}
