package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.CategoryDto;
import eg.gov.iti.jets.dto.FullyProductDto;
import eg.gov.iti.jets.dto.ImageDto;
import eg.gov.iti.jets.dto.MinimalReviewDto;
import eg.gov.iti.jets.model.*;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


public class ProductMapperTest {

    private static ProductMapper mapper;

    @BeforeAll
    private static void setup() {
        mapper = ProductMapper.INSTANCE;
    }

    @Test
    public void productToProductDtoTest() {
        User user = new User();
        user.setFirstName("Ahmed");
        user.setLastName("Mohamed");

        Category category = new Category();
        category.setCategoryId(25);
        category.setCategoryName("TEST");

        Review review = new Review();
        review.setReviewId(15);
        review.setReviewStars(3);
        review.setReviewMessage("TEST");
        review.setReviewMessageTime(LocalDateTime.now());
        review.setUser(user);

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
        product.setReviews(Set.of(review));
        FullyProductDto productDto = mapper.productToProductDto(product);
        assertEquals(product.getProductId(), productDto.getId());
        assertEquals(product.getProductName(), productDto.getName());
        assertEquals(product.getDescription(), productDto.getDescription());
        assertEquals(product.getPrice(), Double.valueOf(productDto.getPrice()));
        assertTrue(productDto.getReviews().stream().anyMatch(e -> e.getMessage().equals(review.getReviewMessage()) && e.getStars() == review.getReviewStars() && e.getTime().isEqual(review.getReviewMessageTime())));
        assertEquals(category.getCategoryId(), productDto.getCategory().getId());
        assertEquals(category.getCategoryName(), productDto.getCategory().getName());
        assertEquals(image.getImageName(), productDto.getImage().getName());
        assertEquals(image.getImagePath(), productDto.getImage().getPath());
    }

    @Test
    public void imageDtoToImageTest() {
        CategoryDto categoryDto = new CategoryDto(21, "TEST Category");
        ImageDto imageDto = new ImageDto("Name", "Path");
        MinimalReviewDto reviewDto = new MinimalReviewDto("TEST", LocalDateTime.now(), 2, "Ahmed Mohamed");
        FullyProductDto productDto = new FullyProductDto(1, "Product Name", "TEST", imageDto, 15.25f, categoryDto, Set.of(reviewDto));
        Product product = mapper.productDtoToProduct(productDto);
        assertEquals(productDto.getId(), product.getProductId());
        assertEquals(productDto.getName(), product.getProductName());
        assertEquals(productDto.getDescription(), product.getDescription());
        assertEquals(Double.valueOf(productDto.getPrice()), product.getPrice());
        assertTrue(product.getReviews().stream().anyMatch(e -> e.getReviewMessage().equals(reviewDto.getMessage()) && e.getReviewStars() == reviewDto.getStars() && e.getReviewMessageTime().isEqual(reviewDto.getTime())));
        assertEquals(categoryDto.getId(), product.getCategory().getCategoryId());
        assertEquals(categoryDto.getName(), product.getCategory().getCategoryName());
        assertEquals(imageDto.getName(), product.getProductImage().getImageName());
        assertEquals(imageDto.getPath(), product.getProductImage().getImagePath());
    }
}
