package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.ImageDto;
import eg.gov.iti.jets.model.Image;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.assertEquals;


public class ImageMapperTest {

    private static ImageMapper mapper;

    @BeforeAll
    private static void setup() {
        mapper = ImageMapper.INSTANCE;
    }

    @Test
    public void imageToImageDtoTest() {
        Image image = new Image();
        image.setImageId(15);
        image.setImageName("Name");
        image.setImagePath("Path");
        ImageDto imageDto = mapper.imageToImageDto(image);
        assertEquals(image.getImageName(), imageDto.getName());
        assertEquals(image.getImagePath(), imageDto.getPath());
    }

    @Test
    public void imageDtoToImageTest() {
        ImageDto imageDto = new ImageDto("Name", "Path");
        Image image = mapper.imageDtoToImage(imageDto);
        assertEquals(imageDto.getName(), image.getImageName());
        assertEquals(imageDto.getPath(), image.getImagePath());
    }
}
