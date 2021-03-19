package eg.gov.iti.jets.model;

import lombok.Data;

import javax.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "USERS")
@NamedQueries({
        @NamedQuery(name = "User.findByEmailAndPassword",
                query = "SELECT u from User u where u.email=:email and u.password=:password"),
        @NamedQuery(name = "User.findByEmail",
                query = "SELECT u from User u where u.email=:email"),
        @NamedQuery(name = "User.getAllUsers",
                query = "SELECT u from User u where u.role = eg.gov.iti.jets.model.Role.USER_ROLE")
})
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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
    private Gender gender;

    @Column(name = "CUSTOMER_ROLE", nullable = false)
    private Role role;

    @Column(name = "BALANCE", nullable = false)
    private double balance;

    @Column(name = "BIRTH_DATE")
    private LocalDate birthDate;

    @Embedded
    private Address address;

//    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "user")
//    private Set<Order> orders = new HashSet<>(0);

}
