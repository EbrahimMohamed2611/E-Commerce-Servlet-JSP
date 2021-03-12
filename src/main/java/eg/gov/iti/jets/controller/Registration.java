package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.service.UserService;
import eg.gov.iti.jets.factory.UserServiceFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
//@WebServlet("/registration")
public class Registration extends HttpServlet {

    private final UserService userService = UserServiceFactory.getUserRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        System.out.println("dfdfdfdf");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        System.out.println("From Servlet");
        String firstName = req.getParameter("firstName");
        System.out.println("firstName " + firstName);
//           userService.saveUSer(null);
    }
}