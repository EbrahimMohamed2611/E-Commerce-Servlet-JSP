package eg.gov.iti.jets.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Statistics implements Serializable {

    private int completedOrders;
    private int notCompletedOrders;
    private int users;
    private int products;


}
