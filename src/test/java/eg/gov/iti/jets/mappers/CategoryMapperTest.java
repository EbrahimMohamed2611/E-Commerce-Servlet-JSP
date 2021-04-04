package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.CategoryDto;
import eg.gov.iti.jets.model.Category;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.assertEquals;


public class CategoryMapperTest {

    private static CategoryMapper mapper;

    @BeforeAll
    private static void setup() {
        mapper = CategoryMapper.INSTANCE;
    }

    @Test
    public void categoryToCategoryDtoTest() {
        Category category = new Category();
        category.setCategoryId(20);
        category.setCategoryName("TEST");

        CategoryDto categoryDto = mapper.categoryToCategoryDto(category);
        assertEquals(category.getCategoryId(), categoryDto.getId());
        assertEquals(category.getCategoryName(), categoryDto.getName());
    }

    @Test
    public void categoryDtoToCategoryTest() {
        CategoryDto categoryDto = new CategoryDto(15, "TEST");
        Category category = mapper.categoryDtoToCategory(categoryDto);
        assertEquals(categoryDto.getId(), category.getCategoryId());
        assertEquals(categoryDto.getName(), category.getCategoryName());
    }
}
