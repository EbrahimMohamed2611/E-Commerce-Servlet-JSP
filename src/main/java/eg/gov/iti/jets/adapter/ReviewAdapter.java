package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.ReviewDTO;
import eg.gov.iti.jets.dto.UserDTO;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.factory.UserServiceFactory;
import eg.gov.iti.jets.model.Review;
import eg.gov.iti.jets.model.User;
import eg.gov.iti.jets.service.ProductService;
import eg.gov.iti.jets.service.UserService;

public class ReviewAdapter {

    public static ReviewDTO convertFromReviewModelToReviewDto(Review review){
        ReviewDTO reviewDTO = new ReviewDTO();
        reviewDTO.setReviewTime(review.getReviewMessageTime());
        reviewDTO.setMessage(review.getReviewMessage());
        reviewDTO.setStars(review.getReviewStars());
        reviewDTO.setUserName(review.getUser().getFirstName() + " " + review.getUser().getLastName());
        reviewDTO.setUserEmail(review.getUser().getEmail());
        reviewDTO.setProductId(review.getProduct().getProductId());

        return reviewDTO ;
    }

    public static Review convertFromReviewDTOToReviewModel(ReviewDTO reviewDTO){
        UserService userService = UserServiceFactory.getUserServiceInstance();
        ProductService productService = ProductServiceFactory.getProductServiceInstance();
        Review review = new Review();
        review.setReviewMessage(reviewDTO.getMessage());
        review.setReviewStars(reviewDTO.getStars());
        review.setReviewMessageTime(reviewDTO.getReviewTime());
        // Load the review model with user data
        UserDTO userDTO = userService.findByEmail(reviewDTO.getUserEmail());
        review.setUser(UserAdapter.convertFromUserRegistrationDtoToUserModel(userDTO));
        //Load the review model with orderedProductDTO data
        review.setProduct(productService.getProductById(reviewDTO.getProductId()));

        return review ;
    }
    
}
