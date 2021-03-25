package eg.gov.iti.jets.filter;

import eg.gov.iti.jets.dto.UserDto;
import eg.gov.iti.jets.model.Role;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {"/shopping-cart.jsp", "/checkout.jsp"})
public class AuthenticationFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        System.out.println("From Filter");
        UserDto user = (UserDto) httpRequest.getSession().getAttribute("userDto");
        if (user != null) {
            chain.doFilter(request, response);
        } else {

            ((HttpServletResponse) response).sendRedirect("login.jsp");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
