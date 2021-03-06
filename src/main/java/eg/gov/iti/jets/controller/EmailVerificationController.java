package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.EmailVerification;
import eg.gov.iti.jets.service.UserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EmailVerificationController", urlPatterns = "/verify")
public class EmailVerificationController extends HttpServlet {
    private final UserService userService = UserServiceFactory.getUserServiceInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String verificationCode = req.getParameter("verificationCode");
        String actualVerificationCoe = (String)req.getSession().getAttribute("verificationCode");
        if(verificationCode.equals(actualVerificationCoe)){
            UserDTO userDto = (UserDTO)req.getSession().getAttribute("userDto");
            userDto.setEmailVerification(EmailVerification.VERIFY);
            UserDTO userDTO1 = userService.updateUserVerification(userDto);
            System.out.println("After Verification is " + userDTO1);
            req.getSession().setAttribute("userDto", userDTO1);
            resp.sendRedirect("index.jsp");
        }else{
            resp.sendRedirect("email-verification.jsp?verificationInvalid");
        }


    }
}
