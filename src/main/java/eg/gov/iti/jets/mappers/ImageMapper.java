package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.ImageDto;
import eg.gov.iti.jets.model.Image;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface ImageMapper {

    ImageMapper INSTANCE = Mappers.getMapper(ImageMapper.class);

    @Mapping(source = "imageName", target = "name")
    @Mapping(source = "imagePath", target = "path")
    ImageDto imageToImageDto(Image image);

    @InheritInverseConfiguration
    Image imageDtoToImage(ImageDto imageDto);
}
