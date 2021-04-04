package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Image;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.repository.CategoryRepository;
import eg.gov.iti.jets.repository.ProductRepository;
import eg.gov.iti.jets.repository.impl.CategoryRepositoryImpl;
import eg.gov.iti.jets.repository.impl.ProductRepositoryImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.Optional;
import java.util.UUID;
@MultipartConfig(maxFileSize = 1024 * 1024 * 3)
@WebServlet(name = "AddProductController", urlPatterns = "/addNewProduct")
public class AddProductController extends HttpServlet {

    private final ProductRepository productRepository = new ProductRepositoryImpl();
    private final CategoryRepository categoryRepository = new CategoryRepositoryImpl();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part filePart = req.getPart("picturePicture");
        String submittedFileName = filePart.getSubmittedFileName();
        System.out.println("paaaaaart" +filePart);
        System.out.println("submiteee "+submittedFileName);
        String imageExtension = getExtensionFormImage(submittedFileName);
        String newImageName = UUID.randomUUID().toString() + imageExtension;
        String imageDirectory = System.getProperty("user.home");
//        String imageDirectory2 = System.getProperty("user.dir");
        File ProductImage = new File(imageDirectory+"/ProductImage");
        if (!ProductImage.exists()) {
            boolean mkdirs = ProductImage.mkdirs();
        }
        System.out.println(ProductImage.getAbsolutePath());
        System.out.println(ProductImage.getName());
        System.out.println(ProductImage.getPath());

        filePart.write(ProductImage.getAbsolutePath() + "\\"+ newImageName);
        System.out.println(" ######### " + ProductImage.getAbsolutePath() + "\\"+ newImageName);
        String categoryName = req.getParameter("categoryName");
        String productName = req.getParameter("productName");
        String productDescription = req.getParameter("productDescription");
        Double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Product product = new Product();
        product.setProductName(productName);
        product.setDescription(productDescription);
        product.setPrice(price);
        product.setQuantity(quantity);
        Image productImage = new Image();
        productImage.setImageName(newImageName);
        productImage.setImagePath(ProductImage.getAbsolutePath());
        product.setProductImage(productImage);
        Category productCategory = new Category();
        Optional<Category> category = categoryRepository.getCategoryByName(categoryName);
        int categoryId = 0;
        if(category.isPresent()){
           categoryId =   category.get().getCategoryId();
            System.out.println("categoryId " + categoryId);
        }
            System.out.println("after categoryId " + categoryId);
        productCategory.setCategoryId(categoryId);
        productCategory.setCategoryName(categoryName);
        product.setCategory(productCategory);
        Product product1 = productRepository.addNewProduct(product);
        System.out.println(product1);
        resp.sendRedirect("/E_Commerce_Servlet_JSP_war_exploded/adminhome");
    }


    private String getExtensionFormImage(String imagName){
        int lastIndexOf = imagName.lastIndexOf(".");
        if (lastIndexOf == -1) {
            return ""; // empty extension
        }
        return imagName.substring(lastIndexOf);
    }
}
