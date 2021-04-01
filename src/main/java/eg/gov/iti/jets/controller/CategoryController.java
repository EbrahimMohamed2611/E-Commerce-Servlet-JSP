package eg.gov.iti.jets.controller;

import com.google.gson.Gson;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.repository.CategoryRepository;
import eg.gov.iti.jets.repository.impl.CategoryRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryController", urlPatterns = "/addCategory")
public class CategoryController extends HttpServlet {
    private final CategoryRepository categoryRepository = new CategoryRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter printWriter = resp.getWriter();
        resp.setContentType("application/json");
        Gson json = new Gson();
        List<Category> allCategories = categoryRepository.getAllCategories();
        List<Category> newListOfCategory = new ArrayList<>();
        for (Category c : allCategories) {
            Category category1 = new Category();
            category1.setCategoryId(c.getCategoryId());
            category1.setCategoryName(c.getCategoryName());
            newListOfCategory.add(category1);
        }
        printWriter.write(json.toJson(newListOfCategory));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter printWriter = response.getWriter();
        response.setContentType("application/json");
        Gson json = new Gson();

        String categoryName = request.getParameter("categoryName");
        Category category = new Category();
        category.setCategoryName(categoryName);
        System.out.println("categoryName " + categoryName);
        Category newCategory = categoryRepository.addNewCategory(category);
        List<Category> allCategories = categoryRepository.getAllCategories();
        List<Category> newListOfCategory = new ArrayList<>();
        for (Category c : allCategories) {
        Category category1 = new Category();
        category1.setCategoryId(c.getCategoryId());
        category1.setCategoryName(c.getCategoryName());
        newListOfCategory.add(category1);
        }
        if (newCategory != null) {
            printWriter.write(json.toJson(newListOfCategory));
        } else {
            printWriter.write("Error Try Again");
        }

    }
}
