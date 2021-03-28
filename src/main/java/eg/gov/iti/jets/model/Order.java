package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "ORDER_DETAILS")
@NamedQueries({
        @NamedQuery(name = "Order.getallorders",
                query = "SELECT o from Order o where o.user =:user")
})
@Getter
@Setter
@NoArgsConstructor
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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

    @ManyToMany
    private Set<Product> products = new HashSet<>();

}
