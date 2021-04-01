package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Product;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "editprodb", value = "/editprodb")
public class EditProductDb extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String desc = req.getParameter("desc");
        String price = req.getParameter("price");
        String quan = req.getParameter("quantity");
        String cat = req.getParameter("cat");
        String id = req.getParameter("id");

        Product product = new Product();
        product.setProductId(Integer.parseInt(id));
        product.setProductName(name);
        product.setDescription(desc);
        product.setPrice(Double.parseDouble(price));
        product.setQuantity(Integer.parseInt(quan));
        Category category = new Category();
        category.setCategoryName(cat);
        product.setCategory(category);
        //todo call method the update this object in the db
        //todo fetch all product again from db and get list of products and pass it in the fn


        List<Product> products =new ArrayList<>();
        products.add(product);


        System.out.println("inside Editproduct servlet  name ="+name +" desc"+desc);
        req.setAttribute("products", products);
        System.out.println("-------------after setting attt----------------");
        RequestDispatcher rd = req.getRequestDispatcher("viewproduct.jsp");
        System.out.println("-------------afterdisp--------------");
        rd.forward(req, resp);
    }
}
