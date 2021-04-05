package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.enums.FilterTypes;
import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.impl.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDisplay", urlPatterns = "/products")
public class ProductDisplayController extends HttpServlet {

    private final ProductService PRODUCT_SERVICE = new ProductServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String minPrice = request.getParameter("min");
        String maxPrice = request.getParameter("max");
        String searchParam = request.getParameter("search");
        String categoryParam = request.getParameter("cat");
        if (minPrice != null && maxPrice != null && !minPrice.isEmpty() && !maxPrice.isEmpty()) {
            List<MinimalProductDto> productsByPrice;
            if (searchParam != null && categoryParam != null && !searchParam.isEmpty() && !categoryParam.isEmpty()) {
                productsByPrice = PRODUCT_SERVICE.getProductsByPrice(Integer.parseInt(minPrice), Integer.parseInt(maxPrice), FilterTypes.SEARCH_CATEGORY, searchParam, categoryParam);
            } else if (categoryParam != null && !categoryParam.isEmpty()) {
                productsByPrice = PRODUCT_SERVICE.getProductsByPrice(Integer.parseInt(minPrice), Integer.parseInt(maxPrice), FilterTypes.CATEGORY, categoryParam);
            } else if (searchParam != null && !searchParam.isEmpty()) {
                productsByPrice = PRODUCT_SERVICE.getProductsByPrice(Integer.parseInt(minPrice), Integer.parseInt(maxPrice), FilterTypes.SEARCH, searchParam);
            } else {
                productsByPrice = PRODUCT_SERVICE.getProductsByPrice(Integer.parseInt(minPrice), Integer.parseInt(maxPrice), FilterTypes.NORMAL);
            }
            request.setAttribute("products", productsByPrice);
            request.getRequestDispatcher("productList.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("cat");
        String search = request.getParameter("search");
        if (categoryId != null && categoryId.equals("0")) {
            categoryId = null;
        }
        if (categoryId != null && search != null && !categoryId.isEmpty() && !search.isEmpty()) {
            List<MinimalProductDto> products = PRODUCT_SERVICE.getProductsByNameAndCategory(search, Integer.parseInt(categoryId));
            if (products != null && products.size() > 0) {
                request.setAttribute("products", products);
                request.setAttribute("maxPrice", PRODUCT_SERVICE.getMaxPriceForNameAndCategory(search, Integer.parseInt(categoryId)));
                request.getRequestDispatcher("shop-4-column.jsp").forward(request, response);
            } else {
                response.sendError(404);
            }
        } else if (categoryId != null) {
            List<MinimalProductDto> products = PRODUCT_SERVICE.getProductsByCategoryId(Integer.parseInt(categoryId));
            if (products != null && products.size() > 0) {
                request.setAttribute("products", products);
                request.setAttribute("maxPrice", PRODUCT_SERVICE.getMaxPriceForCategory(Integer.parseInt(categoryId)));
                request.getRequestDispatcher("shop-4-column.jsp").forward(request, response);
            } else {
                response.sendError(404);
            }
        } else if (search != null) {
            List<MinimalProductDto> products = PRODUCT_SERVICE.getProductsByName(search);
            if (products != null && products.size() > 0) {
                request.setAttribute("products", products);
                request.setAttribute("maxPrice", PRODUCT_SERVICE.getMaxPriceForName(search));
                request.getRequestDispatcher("shop-4-column.jsp").forward(request, response);
            } else {
                response.sendError(404);
            }
        } else {
            request.setAttribute("products", PRODUCT_SERVICE.getProducts());
            request.setAttribute("maxPrice", PRODUCT_SERVICE.getMaxPriceForAll());
            request.getRequestDispatcher("shop-4-column.jsp").forward(request, response);
        }
    }
}
