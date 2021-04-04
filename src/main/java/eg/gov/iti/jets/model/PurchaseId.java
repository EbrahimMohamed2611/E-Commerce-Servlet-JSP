package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PurchaseId implements Serializable {

    @Column(name = "ORDER_ID")
    private int orderId;

    @Column(name = "PRODUCT_ID")
    private int productId;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PurchaseId that = (PurchaseId) o;
        return Objects.equals(orderId, that.getOrderId()) &&
                Objects.equals(productId, that.getProductId());
    }
    @Override
    public int hashCode() {
        return Objects.hash(getOrderId(), getProductId());
    }

}
