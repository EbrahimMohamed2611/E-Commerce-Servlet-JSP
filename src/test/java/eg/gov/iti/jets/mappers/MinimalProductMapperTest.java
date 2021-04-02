package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.CategoryDto;
import eg.gov.iti.jets.dto.ImageDto;
import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.model.Category;
import eg.gov.iti.jets.model.Image;
import eg.gov.iti.jets.model.Product;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.assertEquals;


public class MinimalProductMapperTest {

    private static MinimalProductMapper mapper;

    @BeforeAll
    private static void setup() {
        mapper = MinimalProductMapper.INSTANCE;
    }

    @Test
    public void productToMinimalProductDtoTest() {
        Category category = new Category();
        category.setCategoryId(25);
        category.setCategoryName("TEST");

        Image image = new Image();
        image.setImageId(15);
        image.setImageName("Name");
        image.setImagePath("Path");

        Product product = new Product();
        product.setProductId(1);
        product.setProductImage(image);
        product.setDescription("TEST");
        product.setProductName("Product Name");
        product.setPrice(15.25);
        product.setQuantity(155);
        product.setCategory(category);
        MinimalProductDto productDto = mapper.productToMinimalProductDto(product);
        assertEquals(product.getProductId(), productDto.getId());
        assertEquals(product.getProductName(), productDto.getName());
        assertEquals(product.getDescription(), productDto.getDescription());
        assertEquals(product.getPrice(), Double.valueOf(productDto.getPrice()));
        assertEquals(category.getCategoryId(), productDto.getCategory().getId());
        assertEquals(category.getCategoryName(), productDto.getCategory().getName());
        assertEquals(image.getImageName(), productDto.getImage().getName());
        assertEquals(image.getImagePath(), productDto.getImage().getPath());
    }

    @Test
    public void minimalProductDtoToProductTest() {
        CategoryDto categoryDto = new CategoryDto(21, "TEST Category");
        ImageDto imageDto = new ImageDto("Name", "Path");
        MinimalProductDto productDto = new MinimalProductDto(1, "Product Name", "TEST", imageDto, 15.25f, categoryDto);
        Product product = mapper.minimalProductDtoToProduct(productDto);
        assertEquals(productDto.getId(), product.getProductId());
        assertEquals(productDto.getName(), product.getProductName());
        assertEquals(productDto.getDescription(), product.getDescription());
        assertEquals(Double.valueOf(productDto.getPrice()), product.getPrice());
        assertEquals(categoryDto.getId(), product.getCategory().getCategoryId());
        assertEquals(categoryDto.getName(), product.getCategory().getCategoryName());
        assertEquals(imageDto.getName(), product.getProductImage().getImageName());
        assertEquals(imageDto.getPath(), product.getProductImage().getImagePath());
    }
}
