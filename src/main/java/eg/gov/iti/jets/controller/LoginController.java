package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.utils.HashPassword;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.persistence.NoResultException;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginController extends HttpServlet {
    public static final String USER_NAME ="E-commerce";

    private final UserService userService = UserServiceFactory.getUserRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String []remember=request.getParameterValues("remember");
        System.out.println("email" + email +"password" + password );
//        String passwordHashing = HashPassword.hashPassword(password);
        UserDto userDto = null;
        try{
         userDto = userService.findByEmail(email);
        System.out.println("userDto" + userDto);
        if(userDto.getEmail().equals(email) && userDto.getPassword().equals(password)){
//            if(remember!=null){
//                if(remember[0].equals("checked")){
//                    Cookie c1=new Cookie(USER_NAME,email);
//                    response.addCookie(c1);
//                }
//            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            request.getSession().setAttribute("userDto",userDto);
            requestDispatcher.forward(request, response);
        }else{
            response.sendRedirect("login.jsp?invalid");
        }
        } catch (NoResultException e) {
            response.sendRedirect("login.jsp?notFound");
        }

    }
}
