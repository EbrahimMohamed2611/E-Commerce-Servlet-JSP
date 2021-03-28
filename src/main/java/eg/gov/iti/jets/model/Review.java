package eg.gov.iti.jets.model;


import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Review_DETAILS")
@Getter
@Setter
@NoArgsConstructor
//@NamedQueries(
//        @NamedQuery(name = "Review.findByProduct", query = "select r from Review r where r.product = :product")
//)
public class Review {

    @Id
    @GeneratedValue
    @Column(name = "REVIEW_ID", nullable = false)
    private int reviewId;

    @Column(name = "REVIEW_MESSAGE", nullable = false)
    private String reviewMessage;

    @Column(name = "REVIEW_MESSAGE_DATE", nullable = false)
    private LocalDateTime reviewMessageTime;

    @Column(name = "REVIEW_STARS", nullable = false)
    private int reviewStars;

    @ManyToOne
    @JoinColumn(name = "USER_ID")
    private User user;

    @ManyToOne
    @JoinColumn(name = "PRODUCT_ID")
    private Product product;


}
