package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.convertors.JsonConvertor;
import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.dto.ProductDto;
import eg.gov.iti.jets.exceptions.ProductNotFoundException;
import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductInfo", urlPatterns = "/productInfo")
public class AsyncProductDetailsController extends HttpServlet {

    private final ProductService PRODUCT_SERVICE = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if (productId != null && !productId.isEmpty()) {
            try {
                ProductDto productDto = PRODUCT_SERVICE.getProductById(Integer.parseInt(productId));
                request.setAttribute("product", productDto);
                request.getRequestDispatcher("single-product.jsp").forward(request, response);
            } catch (ProductNotFoundException exception) {
                response.sendError(404);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if (productId != null && !productId.isEmpty()) {
            try {
                MinimalProductDto productDto = PRODUCT_SERVICE.getMinimalProductById(Integer.parseInt(productId));
                response.setContentType("application/json");
                response.getWriter().write(JsonConvertor.toJson(productDto));
            } catch (ProductNotFoundException exception) {
                response.sendError(404);
            }
        }
    }
}
