package eg.gov.iti.jets.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "ORDER_DETAILS")
@Getter
@Setter
@NoArgsConstructor
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

    @OneToMany(mappedBy = "order", cascade={CascadeType.MERGE, CascadeType.REMOVE})
    private Set<Purchase> purchase = new HashSet<>();

}

/* image , orderedProductDTO , price , quantity ---->> if orderstatus not completed */