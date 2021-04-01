package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.factory.OrderRepositoryFactory;
import eg.gov.iti.jets.factory.ProductRepositoryFactory;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.repository.ProductRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "adminhome", value = "/adminhome")
public class ViewProducts extends HttpServlet {
    public static final ProductRepository productRepsitory = ProductRepositoryFactory.getProductRepositoryInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //todo get all products from db
       // List<Product>products = productRepsitory.findAll();

        Product product = new Product();
        product.setProductId(1);
        product.setProductName("Laptop");
        product.setPrice(5.5);
        Category category = new Category();
        category.setCategoryName("electronics");
        product.setCategory(category);
        product.setDescription("corei7 , 64 giga");
        product.setQuantity(5);

        Product product2 = new Product();
        product2.setProductName("Tv");
        product2.setProductId(2);
        product2.setPrice(100.0);
        Category category1 = new Category();
        category1.setCategoryName("electronics");
        product2.setCategory(category1);
        product2.setDescription("corei7 , 64 giga");
        product2.setQuantity(6);

        List<Product> products =new ArrayList<>();
        products.add(product);
        products.add(product2);


        req.setAttribute("products", products);
        System.out.println("-------------after setting attt----------------");
        RequestDispatcher rd = req.getRequestDispatcher("viewproduct.jsp");
        System.out.println("-------------afterdisp--------------");
        rd.forward(req, resp);
    }

}
