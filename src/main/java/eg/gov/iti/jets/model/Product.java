package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name="PRODUCT_DETAILS")
@Getter
@Setter
@NoArgsConstructor

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


    @OneToOne
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
