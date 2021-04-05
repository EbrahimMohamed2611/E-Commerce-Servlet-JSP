package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="PRODUCT_DETAILS")
@Getter
@Setter
@NoArgsConstructor
@NamedQueries({
        @NamedQuery(name = "Product.findByNameLike",
                query = "SELECT p from Product p where p.productName like :productName and p.isDeleted = false"),
        @NamedQuery(name = "Product.findBetweenTwoPrices",
                query = "SELECT p from Product  p where p.price between :price1 and :price2 and p.isDeleted = false")
})
@ToString
public class Product implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "PRODUCT_ID", nullable = false)
    private int productId;

    @Column(name = "PRODUCT_NAME", nullable = false)
    private String productName;

    @Column(name = "PRODUCT_DESCRIPTION", length = 400)
    private String description;

    @Column(name = "PRODUCT_QUANTITY", nullable = false)
    private int quantity;

    @Column(name = "PRODUCT_PRICE", nullable = false)
    private Double price;

    @Column(name = "PRODUCT_DELETED", nullable = false)
    private boolean isDeleted;

    @ManyToOne
    @JoinColumn(name = "CATEGORY_ID")
    private Category category ;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "IMAGE_ID")
    private Image productImage;

    @OneToMany(mappedBy = "product")
    private Set<Review> reviews = new HashSet<>();

    @OneToMany(mappedBy = "product",cascade = CascadeType.ALL)
    private Set<Purchase> purchase = new HashSet<>();

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "ORDER_ID")
    private Order order;

}
