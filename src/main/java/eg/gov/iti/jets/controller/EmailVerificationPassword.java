package eg.gov.iti.jets.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EmailVerificationPassword", urlPatterns = "/verifyCode")
public class EmailVerificationPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String actualVerificationCode = (String)req.getSession().getAttribute("resetPassword");
        String verificationCode1 = req.getParameter("verificationCode");
        System.out.println(actualVerificationCode);
        System.out.println(verificationCode1);
        if(actualVerificationCode.equals(verificationCode1)){
            resp.sendRedirect("reset-password.jsp");
        }else{
            resp.sendRedirect("email-forget-password.jsp?notVerify");
        }
    }
}
