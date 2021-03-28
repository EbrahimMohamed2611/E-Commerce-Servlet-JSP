package eg.gov.iti.jets.dto;


public class OrderItemDTO {

    private int productId;
    private String productName;
    private String description;
    private Double price;
    private String productImagePath;


    public OrderItemDTO() {
    }


    public OrderItemDTO(int productId, String productName, String description, Double price, int quantity, String productImagePath) {
        this.productId = productId;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.productImagePath = productImagePath;
    }


    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }


    public String getProductImagePath() {
        return productImagePath;
    }

    public void setProductImagePath(String productImagePath) {
        this.productImagePath = productImagePath;
    }
}
