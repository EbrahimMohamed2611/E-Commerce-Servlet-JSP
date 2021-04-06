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

@WebServlet(name = "adminhome", urlPatterns = "/adminhome")
public class ViewProducts extends HttpServlet {
    public static final ProductRepository productRepsitory = ProductRepositoryFactory.getProductRepositoryInstance();

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<Product>products2 = productRepsitory.findAll();
//
//
//        req.setAttribute("allProducts", products2);
//        System.out.println("-------------after setting attt----------------");
//        RequestDispatcher rd = req.getRequestDispatcher("product.jsp");
//        System.out.println("-------------afterdisp--------------");
//        rd.forward(req, resp);
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product>products2 = productRepsitory.findAll();
        req.setAttribute("allProducts", products2);
        System.out.println("-------------after setting attt----------------");
        RequestDispatcher rd = req.getRequestDispatcher("product.jsp");
        System.out.println("-------------afterdisp--------------");
        rd.forward(req, resp);
    }
}
