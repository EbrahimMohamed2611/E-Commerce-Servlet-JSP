package eg.gov.iti.jets.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "PRODUCT_DETAILS")
@Getter
@Setter
@NoArgsConstructor
@NamedQueries({
        @NamedQuery(name = "Product.findByNameLike",
                query = "SELECT p from Product p where p.productName like :productName and p.isDeleted = false"),
        @NamedQuery(name = "Product.findBetweenTwoPrices",
                query = "SELECT p from Product  p where p.price between :price1 and :price2 and p.isDeleted = false"),
        @NamedQuery(name = "Product.findBetweenTwoPricesUsingCategory",
                query = "SELECT p from Product  p where p.price between :price1 and :price2 and p.isDeleted = false and p.category.categoryId = :categoryId"),
        @NamedQuery(name = "Product.findBetweenTwoPricesUsingName",
                query = "SELECT p from Product  p where p.price between :price1 and :price2 and p.isDeleted = false and p.productName like :productName"),
        @NamedQuery(name = "Product.findBetweenTwoPricesUsingNameAndCategory",
                query = "SELECT p from Product  p where p.price between :price1 and :price2 and p.isDeleted = false and p.category.categoryId = :categoryId and p.productName like :productName"),
        @NamedQuery(name = "Product.getAvgRating",
                query = "SELECT AVG(r.reviewStars) from Product  p, Review r where p.productId = :productId")
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
    private Category category;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "IMAGE_ID")
    private Image productImage;

    @OneToMany(mappedBy = "product")
    private Set<Review> reviews = new HashSet<>();

    @OneToMany(mappedBy = "product")
    private Set<Purchase> purchase = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "ORDER_ID")
    private Order order;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product that = (Product) o;
        return Objects.equals(productId, that.getProductId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(productId);
    }

}
