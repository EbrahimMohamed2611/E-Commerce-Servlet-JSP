package eg.gov.iti.jets.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "PURCHASES_DETAILS")
@Getter
@Setter
@NoArgsConstructor
public class Purchase implements Serializable {

    @EmbeddedId
    private PurchaseId purchasesId = new PurchaseId();

    @Column(name = "QUANTITY")
    private int quantity;


    @ManyToOne
    @MapsId("orderId")
    @JoinColumn(name = "ORDER_ID", insertable = false, updatable = false)
    private Order order;

    @ManyToOne
    @MapsId("productId")
    @JoinColumn(name = "PRODUCT_ID", insertable = false, updatable = false)
    private Product product;


    public Purchase(int quantity, Order order, Product product) {
        this.quantity = quantity;
        this.order = order;
        this.product = product;
        this.purchasesId = new PurchaseId(order.getOrderId(), product.getProductId());
        order.getPurchase().add(this);
        product.getPurchase().add(this);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Purchase that = (Purchase) o;
        return Objects.equals(order, that.getOrder()) &&
                Objects.equals(product, that.getProduct());
    }

    @Override
    public int hashCode() {
        return Objects.hash(order, product);
    }
}
