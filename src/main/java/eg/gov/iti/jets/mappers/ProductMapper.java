package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.ProductDto;
import eg.gov.iti.jets.model.Product;
import org.mapstruct.InheritConfiguration;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(uses = {ImageMapper.class, CategoryMapper.class, ReviewMapper.class})
public interface ProductMapper {
    ProductMapper INSTANCE = Mappers.getMapper(ProductMapper.class);

    @Mapping(source = "productId", target = "id")
    @Mapping(source = "productName", target = "name")
    @Mapping(source = "description", target = "description")
    @Mapping(source = "price", target = "price")
    @Mapping(source = "productImage", target = "image")
    @Mapping(source = "reviews", target = "reviews")
    ProductDto productToProductDto(Product product);

    @InheritInverseConfiguration
    Product productDtoToProduct(ProductDto productDto);

}
