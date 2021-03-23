package eg.gov.iti.jets.utils;

import org.mindrot.jbcrypt.BCrypt;

public class HashPassword {

    public static String hashPassword(String plainTextPassword){
        String passwordHashed = BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
        System.out.println("passwordHashed : " + passwordHashed);
        return passwordHashed;
    }

    public static Boolean verifyHashing(String plainPassword, String hashedPassword) {
        if (BCrypt.checkpw(plainPassword, hashedPassword)){
            System.out.println("The password matches.");
            return true;
        }
        else{
            System.out.println("The password does not match.");
            return false;
        }
    }
}
