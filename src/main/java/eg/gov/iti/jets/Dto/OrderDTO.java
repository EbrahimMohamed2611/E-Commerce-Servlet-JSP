package eg.gov.iti.jets.dto;


import lombok.Data;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data
public class OrderDTO {

    private int id;
    private Date orderTimestamp;
    private final Set<PurchaseDTO> itemsOrdered = new HashSet<>();



}
