package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaginationController", urlPatterns = "/pagination")
public class PaginationController extends HttpServlet {
    private final ProductService PRODUCT_SERVICE = new ProductServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageOffset = request.getParameter("page");
        String categoryId = request.getParameter("cat");
        String search = request.getParameter("search");
        if (categoryId != null && categoryId.equals("0")) {
            categoryId = null;
        }
        if (pageOffset == null || pageOffset.isEmpty()) {
            pageOffset = "1";
        }
        int page = Integer.parseInt(pageOffset);

        if (categoryId != null && search != null && !categoryId.isEmpty() && !search.isEmpty()) {
            List<MinimalProductDto> products = PRODUCT_SERVICE.getProductsByNameAndCategoryUsingLimit(search, Integer.parseInt(categoryId), page);
            if (products != null && products.size() > 0) {
                request.setAttribute("products", products);
                request.getRequestDispatcher("productList.jsp").forward(request, response);
            } else {
                response.sendError(404);
            }
        } else if (categoryId != null) {
            List<MinimalProductDto> products = PRODUCT_SERVICE.getProductsByCategoryIdUsingLimit(Integer.parseInt(categoryId), page);
            if (products != null && products.size() > 0) {
                request.setAttribute("products", products);
                request.getRequestDispatcher("productList.jsp").forward(request, response);
            } else {
                response.sendError(404);
            }
        } else if (search != null) {
            List<MinimalProductDto> products = PRODUCT_SERVICE.getProductsByNameUsingLimit(search, page);
            if (products != null && products.size() > 0) {
                request.setAttribute("products", products);
                request.getRequestDispatcher("productList.jsp").forward(request, response);
            } else {
                response.sendError(404);
            }
        } else {
            request.setAttribute("products", PRODUCT_SERVICE.getProductsUsingOffset(page));
            request.getRequestDispatcher("productList.jsp").forward(request, response);
        }
    }
}
