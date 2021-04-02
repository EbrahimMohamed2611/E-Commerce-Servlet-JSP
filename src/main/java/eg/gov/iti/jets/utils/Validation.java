package eg.gov.iti.jets.utils;

import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.service.UserService;
import javax.persistence.NoResultException;

public class Validation {
    private static final UserService userService = UserServiceFactory.getUserServiceInstance();



    public static boolean validateString(String name) {
        return validate(name, "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
    }

    public static boolean validateEmail(String email) {
        boolean validate = validate(email, "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
        return (validate && checkIfEmailIsUnique(email));
    }

    public static boolean checkIfEmailIsUnique(String email) {
        UserDTO user = null;
        try {
            user = userService.findByEmail(email);
        } catch (NoResultException e) {
            e.printStackTrace();
        }
        return (user == null);
    }

    public static boolean validatePhone(String phone) {
        return validate(phone, "^(?:\\+?2)?01[0125]{1}[0-9]{8}$");
    }

    public static boolean validatePassword(String password) {
        return validate(password, "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}$");
    }

    public static boolean validateBirthDate(String birthDate) {
        return validate(birthDate, "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))");
    }

    public static boolean validateZipCode(String zipCode) {

        return validate(zipCode, "^\\d{5}(?:[-\\s]\\d{4})?$");
    }
    public static boolean validate(String string, String regex) {
        return string.trim().matches(regex);
    }
}
