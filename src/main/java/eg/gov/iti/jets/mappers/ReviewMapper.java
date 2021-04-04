package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.MinimalReviewDto;
import eg.gov.iti.jets.model.Review;
import eg.gov.iti.jets.model.User;
import org.mapstruct.InheritInverseConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper(imports = User.class)
public interface ReviewMapper {

    ReviewMapper INSTANCE = Mappers.getMapper(ReviewMapper.class);

    @Mapping(source = "reviewMessage", target = "message")
    @Mapping(source = "reviewMessageTime", target = "time")
    @Mapping(source = "reviewStars", target = "stars")
    @Mapping(target = "userName", expression = "java(review.getUser().getFirstName() + \" \" + review.getUser().getLastName())")
    MinimalReviewDto reviewToReviewDto(Review review);

    @InheritInverseConfiguration
    @Mapping(target = "user.firstName", expression = "java(minimalReviewDto.getUserName().split(\" \")[0])")
    @Mapping(target = "user.lastName", expression = "java(minimalReviewDto.getUserName().split(\" \")[1])")
    Review reviewDtoToReview(MinimalReviewDto minimalReviewDto);
}
