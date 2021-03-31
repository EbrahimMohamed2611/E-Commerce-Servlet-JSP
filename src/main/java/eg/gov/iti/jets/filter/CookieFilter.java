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
        System.out.println("filter called on destination page");
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

        System.out.println("The request path is: " + path);

//        System.out.println("contains: " + excludedUrls.contains(path));
//        System.out.println("! contains: " + !excludedUrls.contains(path));

        if (!excludedUrls.contains(path)) {

            System.out.println("checking for cookies...............");

            HttpServletRequest request = (HttpServletRequest) servletRequest;
            Cookie[] cookies = request.getCookies();

            if (cookies != null) {
                //get cookies data and pass filter.
                for (Cookie cookie : cookies) {
                    System.out.println("found cookies Enabled, now printing them ........................");
                    System.out.println(cookie.getName() + cookie.getValue());
                }
                chain.doFilter(request, response);
            } else {

                System.out.println("found cookies disabled, now creating one ................");
                if (printResponseHeaders((HttpServletResponse) response)) {
                    Cookie dummyCookie = new Cookie("dummy", "cookie");
                    ((HttpServletResponse) response).addCookie(dummyCookie);
                    System.out.println("Created new cookie and added it to response");

                    System.out.println("printing the response headers");
                    printResponseHeaders(((HttpServletResponse) response));

                    System.out.println(request.getParameter("check"));
                    System.out.println("---------------------------------------------------");

                    ((HttpServletResponse) response).sendRedirect("dashboard.jsp?check=1");

                } else {
                    //means cookies are disabled, send him to the Enable Cookies page
                    System.out.println("directing to enable cookies page");
                    ((HttpServletResponse) response).sendRedirect("enable-cookies.jsp");
                }

            }

        } else {
            System.out.println("the path is one of the excluded paths, so the process will continue if the cookies are enabled Or disabled");
            chain.doFilter(servletRequest, response);
        }

    }

    private static boolean printResponseHeaders(HttpServletResponse httpServletResponse) {

        Collection<String> headerNames = httpServletResponse.getHeaderNames();
        boolean key = false;
        outerLoop:
        for (String headerName : headerNames) {

            if (headerName.equals("Set-Cookie")) {
                System.out.println("header Name:" + headerName + "," + httpServletResponse.getHeader(headerName));
                System.out.println(true);
                key =true;
            }else {
                key = false;
            }
        }
        System.out.println(key);
        return key;

    }
}