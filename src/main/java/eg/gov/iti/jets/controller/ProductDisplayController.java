package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductDisplay", urlPatterns = "/products")
public class ProductDisplayController extends HttpServlet {

    private final ProductService PRODUCT_SERVICE = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", PRODUCT_SERVICE.getProducts());
        request.getRequestDispatcher("shop-4-column.jsp").forward(request, response);
    }
}
