package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.factory.ProductRepositoryFactory;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.ProductRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet(name = "editproduct", value = "/editproduct")
public class EditProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String desc = req.getParameter("desc");
        String price = req.getParameter("price");
        String quan = req.getParameter("quantity");
        String cat = req.getParameter("cat");
        String id = req.getParameter("id");
        Product product = new Product();
        product.setProductName(name);
        product.setDescription(desc);
        product.setProductId(Integer.parseInt(id));
        product.setPrice(Double.parseDouble(price));
        product.setQuantity(Integer.parseInt(quan));
        Category category = new Category();
        category.setCategoryName(cat);
        product.setCategory(category);


        System.out.println("inside Editproduct servlet  name ="+name +" desc"+desc);
        req.setAttribute("data", product);
        System.out.println("-------------after setting attt----------------");
        RequestDispatcher rd = req.getRequestDispatcher("edit-product.jsp");
        System.out.println("-------------afterdisp--------------");
        rd.forward(req, resp);
    }

}
