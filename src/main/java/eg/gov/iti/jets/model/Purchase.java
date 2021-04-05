package eg.gov.iti.jets.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="PURCHASES_DETAILS")
@Getter
@Setter
@NoArgsConstructor
public class Purchase implements Serializable {

    @EmbeddedId
    private PurchaseId purchasesId ;

    @Column(name = "QUANTITY")
    private int quantity;


    @ManyToOne()
    @JoinColumn(name = "ORDER_ID",insertable = false,updatable = false)
    private Order order ;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "PRODUCT_ID",insertable = false,updatable = false)
    private Product product;

    public Purchase(int quantity, Order order, Product product) {
        this.quantity = quantity;
        this.order = order;
        this.product = product;
        this.purchasesId = new PurchaseId(order.getOrderId(), product.getProductId());
        order.getPurchase().add(this);
        product.getPurchase().add(this);
    }
}
