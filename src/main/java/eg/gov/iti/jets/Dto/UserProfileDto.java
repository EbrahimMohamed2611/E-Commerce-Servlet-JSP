package eg.gov.iti.jets.dto;

import eg.gov.iti.jets.model.Address;
import lombok.Data;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

//@Data
public class UserProfileDto {
    private String firstName;
    private String lastName;
    private String phone;
    private String password;
    private LocalDate birthDate;
    private Set<Address> address = new HashSet<>(0);

    public UserProfileDto() {
    }

    public UserProfileDto(String firstName, String lastName, String phone, String password, LocalDate birthDate, Set<Address> address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.password = password;
        this.birthDate = birthDate;
        this.address = address;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public Set<Address> getAddress() {
        return address;
    }

    public void setAddress(Set<Address> address) {
        this.address = address;
    }
}
