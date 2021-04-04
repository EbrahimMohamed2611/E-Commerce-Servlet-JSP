package eg.gov.iti.jets.service;

import eg.gov.iti.jets.dto.FullyProductDto;
import eg.gov.iti.jets.dto.MinimalProductDto;
import eg.gov.iti.jets.dto.OrderedProductDTO;

import eg.gov.iti.jets.exceptions.ProductNotFoundException;

import eg.gov.iti.jets.model.Product;

import java.util.List;

public interface ProductService {

    Product getProductById(int productId);

    /**
     * this method responsible for return the minimal information of products for display purposes
     *
     * @return List of {@link MinimalProductDto}
     * @Author MAK
     */
    List<MinimalProductDto> getProducts();

    /**
     * this method responsible for return the minimal information of products for specific category
     *
     * @param categoryId the category identifier
     * @return List of {@link MinimalProductDto}
     * @Author MAK
     */
    List<MinimalProductDto> getProductsByCategoryId(int categoryId);

    /**
     * this method responsible for returning minimal information about a specific product
     *
     * @param id Product Id
     * @return {@link MinimalProductDto}
     * @throws ProductNotFoundException in runtime if product with specified Id not Found
     * @Author MAK
     */
    MinimalProductDto getMinimalProductById(int id);

    /**
     * this method responsible for returning comprehensive information about a specific product
     *
     * @param id Product Id
     * @return {@link FullyProductDto}
     * @throws ProductNotFoundException in runtime if product with specified Id not Found
     * @Author MAK
     */
    FullyProductDto getProductDtoById(int id);

    /**
     * this method responsible for getting the avg rating for specific product
     *
     * @param id Product Id
     * @return int
     * @throws ProductNotFoundException in runtime if product with specified Id not Found
     * @Author MAK
     */
    int getProductRating(int id);

    /**
     * Query the database for specific orderedProductDTO and return
     * if and only if the orderedProductDTO state is not deleted
     * and the orderedProductDTO quantity > 0
     *
     * @param productId which is the primary key for orderedProductDTO Table
     * @return ProductDTO
     */
    OrderedProductDTO getInStockProduct(int productId);

    void updateProduct(Product product);

}
