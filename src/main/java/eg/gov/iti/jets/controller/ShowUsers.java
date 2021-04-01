package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.model.User;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "showusers", value = "/showusers")
public class ShowUsers extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext servletContext = getServletContext();
        List<User> userList = (List<User>)servletContext.getAttribute("userList");
        System.out.println("inside the doget the list of users is----> "+userList);
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        int id = 0;
        String lastId = request.getHeader("Last-Event-ID");
        System.out.println(lastId+"-->lastId");
        if (lastId != null) {

            out.write("data: " +  buildGsonFromListObject(userList) + "\n");
            out.write("event: userlist" + "\n\n");
            out.flush();
        } else {
            System.out.println("here in the null else of msg id");
            out.print("id: " + id + "\n\n");
            out.write("retry: 500"+"\n");
            out.flush();
            out.close();
        }
    }
    private String buildGsonFromListObject(List<User> users){
        Gson gsonMsg = new Gson();
        return gsonMsg.toJson(users);
    }

}
