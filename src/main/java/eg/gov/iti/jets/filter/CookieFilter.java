package eg.gov.iti.jets.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class CookieFilter implements Filter {

    private static List<String> excludedUrls = null;

    public void init(FilterConfig config) throws ServletException {
        //getting the URL exclusion list
        String excludePattern = config.getInitParameter("excludedUrls");
        //System.out.println(excludePattern);
        excludedUrls = Arrays.asList(excludePattern.split(","));
//        for (String url : excludedUrls) {
//            System.out.println("The excluded urls are: " + url.toString());
//            System.out.println("the object form is: " + url);
//        }
    }

    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        String path = ((HttpServletRequest) servletRequest).getServletPath().substring(1);


//        System.out.println("contains: " + excludedUrls.contains(path));
//        System.out.println("! contains: " + !excludedUrls.contains(path));

        if (!excludedUrls.contains(path)) {

            HttpServletRequest request = (HttpServletRequest) servletRequest;
            Cookie[] cookies = request.getCookies();

            if (cookies != null) {
                //get cookies data and pass filter.
                chain.doFilter(request, response);
            } else {

                if (printResponseHeaders((HttpServletResponse) response)) {
                    Cookie dummyCookie = new Cookie("dummy", "cookie");
                    ((HttpServletResponse) response).addCookie(dummyCookie);

                    printResponseHeaders(((HttpServletResponse) response));

                    ((HttpServletResponse) response).sendRedirect("index.jsp?check=1");

                } else {
                    //means cookies are disabled, send him to the Enable Cookies page
                    ((HttpServletResponse) response).sendRedirect("enable-cookies.jsp");
                }

            }

        } else {
            chain.doFilter(servletRequest, response);
        }

    }

    private static boolean printResponseHeaders(HttpServletResponse httpServletResponse) {

        Collection<String> headerNames = httpServletResponse.getHeaderNames();
        boolean key = false;
        outerLoop:
        for (String headerName : headerNames) {

            if (headerName.equals("Set-Cookie")) {
                key =true;
            }else {
                key = false;
            }
        }
        return key;

    }
}