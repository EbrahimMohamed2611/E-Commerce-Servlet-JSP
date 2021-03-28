package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.ReviewDTO;
import eg.gov.iti.jets.model.Review;

public class ReviewAdapter {

    public static ReviewDTO convertFromReviewModelToReviewDto(Review review){
        ReviewDTO reviewDTO = new ReviewDTO();
        reviewDTO.setReviewTime(review.getReviewMessageTime());
        reviewDTO.setMessage(review.getReviewMessage());
        reviewDTO.setStars(review.getReviewStars());
        reviewDTO.setUserName(review.getUser().getFirstName() + " " + review.getUser().getLastName());


        return reviewDTO ;
    }
    
}
