package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.model.Product;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(uses = {ImageMapper.class, CategoryMapper.class})
public interface MinimalProductMapper {
    MinimalProductMapper INSTANCE = Mappers.getMapper(MinimalProductMapper.class);

    @Mapping(source = "productId", target = "id")
    @Mapping(source = "productName", target = "name")
    @Mapping(source = "description", target = "description")
    @Mapping(source = "price", target = "price")
    @Mapping(source = "productImage", target = "image")
    MinimalProductDto productToMinimalProductDto(Product product);

    @InheritInverseConfiguration
    Product minimalProductDtoToProduct(MinimalProductDto minimalProductDto);
}
