package eg.gov.iti.jets.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class SetUserData  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       // HttpSession session = req.getSession(false);
        //ana hena me7taga object fe el data bta3et el user el fte7 el profile
        //session.setAttribute("firstname", new String("true"));
        /*session.setAttribute("firstname", users.getFirstName());
        session.setAttribute("lastname", users.getLastName());
        */


        RequestDispatcher dispatcher = req.getRequestDispatcher("profile.jsp");
        dispatcher.forward(req, resp);
    }
}
