package eg.gov.iti.jets.filter;

import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.model.Role;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {"/product.jsp", "/categories.jsp","/dashboard.jsp","/adminhome",
        "/editproduct","/remove","/editproductdb","/getorders","/orders.jsp"})
public class AdminAuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        System.out.println("From Admin Filter");
        UserDTO user = (UserDTO) httpRequest.getSession().getAttribute("userDto");
        if (user != null && user.getRole() == Role.ADMIN_ROLE) {
            chain.doFilter(request, response);
        } else {
            ((HttpServletResponse) response).sendRedirect("404.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
