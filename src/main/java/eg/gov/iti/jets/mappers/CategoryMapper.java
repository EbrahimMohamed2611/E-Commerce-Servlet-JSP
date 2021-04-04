package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.CategoryDto;
import eg.gov.iti.jets.model.Category;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface CategoryMapper {

    CategoryMapper INSTANCE = Mappers.getMapper(CategoryMapper.class);

    @Mapping(source = "categoryId", target = "id")
    @Mapping(source = "categoryName", target = "name")
    CategoryDto categoryToCategoryDto(Category category);

    @InheritInverseConfiguration
    Category categoryDtoToCategory(CategoryDto categoryDto);
}
