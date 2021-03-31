package eg.gov.iti.jets.filter;

import eg.gov.iti.jets.dto.UserDto;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {"/login.jsp", "/register.jsp","/login"})
public class LoginFilter  implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        System.out.println("From Filter");
        UserDto user = (UserDto) httpRequest.getSession().getAttribute("userDto");
        if (user != null) {
            ((HttpServletResponse) response).sendRedirect("dashboard.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
