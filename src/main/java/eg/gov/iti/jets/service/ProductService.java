package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.model.Product;

public interface ProductService {

    Product getProductById(int productId);

    /**
     * Query the database for specific orderedProductDTO and return
     * if and only if the orderedProductDTO state is not deleted
     * and the orderedProductDTO quantity > 0
     * @param productId which is the primary key for orderedProductDTO Table
     * @return ProductDTO
     */
    OrderedProductDTO getInStockProduct(int productId);



}
