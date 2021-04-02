package eg.gov.iti.jets.mappers;

import eg.gov.iti.jets.dto.ReviewDto;
import eg.gov.iti.jets.model.Review;
import eg.gov.iti.jets.model.User;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.junit.Assert.assertEquals;


public class ReviewMapperTest {

    private static ReviewMapper mapper;

    @BeforeAll
    private static void setup() {
        mapper = ReviewMapper.INSTANCE;
    }

    @Test
    public void reviewToReviewDtoTest() {
        User user = new User();
        user.setFirstName("Ahmed");
        user.setLastName("Mohamed");

        Review review = new Review();
        review.setReviewId(26);
        review.setReviewStars(4);
        review.setReviewMessageTime(LocalDateTime.now());
        review.setReviewMessage("Hello");
        review.setUser(user);

        ReviewDto reviewDto = mapper.reviewToReviewDto(review);
        assertEquals(review.getReviewMessage(), reviewDto.getMessage());
        assertEquals(review.getReviewStars(), reviewDto.getStars());
        assertEquals(review.getReviewMessageTime(), reviewDto.getTime());
        assertEquals(user.getFirstName() + " " + user.getLastName(), reviewDto.getUserName());
    }

    @Test
    public void reviewDtoToReviewTest() {
        ReviewDto reviewDto = new ReviewDto("TEST", LocalDateTime.now(), 5, "Ahmed Mohamed");
        Review review = mapper.reviewDtoToReview(reviewDto);
        assertEquals(reviewDto.getMessage(), review.getReviewMessage());
        assertEquals(reviewDto.getStars(), review.getReviewStars());
        assertEquals(reviewDto.getTime(), review.getReviewMessageTime());
        assertEquals(reviewDto.getUserName(), review.getUser().getFirstName() + " " + review.getUser().getLastName());
    }
}
