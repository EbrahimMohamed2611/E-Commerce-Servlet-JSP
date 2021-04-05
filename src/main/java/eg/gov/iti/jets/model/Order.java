package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "ORDER_DETAILS")
@Getter
@Setter
@NoArgsConstructor
@NamedQueries({
        @NamedQuery(name = "Order.completedOrder",
                query = "SELECT COUNT(o.orderId) from Order  o where o.orderStatus = eg.gov.iti.jets.model.OrderStatus.COMPLETED"),
        @NamedQuery(name = "Order.notCompletedOrder",
                query = "SELECT COUNT(o.orderId) from Order  o where o.orderStatus = eg.gov.iti.jets.model.OrderStatus.NOT_COMPLETED")
})
public class Order implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "ORDER_ID")
    private int orderId;

    @Column(name = "ORDER_TIMESTAMP")
    @Temporal(TemporalType.TIMESTAMP)
    private Date orderTimestamp;

    @Column(name = "ORDER_STATE")
    @Enumerated(EnumType.STRING)
    private OrderStatus orderStatus;

    @ManyToOne
    @JoinColumn(name = "USERS_ID")
    private User user;

    @OneToMany(mappedBy = "order", cascade={CascadeType.MERGE, CascadeType.REMOVE}, fetch = FetchType.EAGER)
    private Set<Purchase> purchase = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order that = (Order) o;
        return Objects.equals(orderId, that.getOrderId()) &&
                Objects.equals(user, that.getUser());
    }
    @Override
    public int hashCode() {
        return Objects.hash(orderId, user);
    }
}
