package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

//@Entity
//@Table(name="ADDRESS")
@Getter
@Setter
@NoArgsConstructor
@Embeddable
public class Address implements Serializable {
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ADDRESS_ID")
    private int addressId;
    @Column(name = "COUNTRY")
    private String country;
    @Column(name = "STATE")
    private String state;
    @Column(name = "CITY")
    private String city;
    @Column(name = "STREET")
    private String street;
    @Column(name = "ZIP_CODE")
    private String zipCode;

//    @ManyToOne
//    @JoinColumn(name = "USERS_ID")
//    private User user;

    public Address(String country, String state, String city, String street, String zipcode) {
        this.country = country;
        this.state = state;
        this.city = city;
        this.street = street;
        this.zipCode = zipcode;
    }

}
