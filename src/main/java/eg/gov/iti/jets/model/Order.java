package eg.gov.iti.jets.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "ORDERS")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ORDER_ID")
    private int orderId;

    @Column(name = "ORDER_TIMESTAMP")
    private LocalDateTime orderTimestamp;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_ID", nullable = false, updatable = false)
    private User user;

    public Order() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public LocalDateTime getOrderTimestamp() {
        return orderTimestamp;
    }

    public void setOrderTimestamp(LocalDateTime orderTimestamp) {
        this.orderTimestamp = orderTimestamp;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", orderTimestamp=" + orderTimestamp +
                ", user=" + user +
                '}';
    }
}
