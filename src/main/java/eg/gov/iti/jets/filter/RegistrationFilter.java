package eg.gov.iti.jets.filter;

import eg.gov.iti.jets.utils.Validation;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebFilter("/registration")
public class RegistrationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Registration Filter");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        if (request.getMethod().equalsIgnoreCase("post")) {

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phoneNumber");
            String birthDate = request.getParameter("birthDate");
            String balance = request.getParameter("balance");
            String gender = request.getParameter("gender");
            System.out.println("+++++++"+birthDate);
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate dateOfBirth = LocalDate.parse(birthDate, dateTimeFormatter);

            String country = request.getParameter("country");
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            String street = request.getParameter("street");
            String zipCode = request.getParameter("zipcode");

        if (!Validation.validateString(firstName) || !Validation.validateString(lastName) || !Validation.validateEmail(email)
                || !Validation.validatePassword(password) || !Validation.validatePhone(phone) || !Validation.validateBirthDate(birthDate)
                || !Validation.validateString(country) || !Validation.validateString(state) || !Validation.validateString(city)
                || !Validation.validateString(street) || !Validation.validateZipCode(zipCode)) {

            ((HttpServletResponse) response).sendRedirect("register.jsp?invalid=true");
            return;
        }

        chain.doFilter(request, response);
        }
}

    @Override
    public void destroy() {

    }
}
