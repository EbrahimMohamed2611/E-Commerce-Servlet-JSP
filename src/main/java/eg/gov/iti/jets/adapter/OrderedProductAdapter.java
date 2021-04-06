package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.service.ProductService;

public class OrderedProductAdapter {

    private static final ProductService productService = ProductServiceFactory.getProductServiceInstance();

    public static OrderedProductDTO convertProductModelToOrderedItem(Product product) {
        OrderedProductDTO orderedProductDTO = new OrderedProductDTO();
        orderedProductDTO.setProductId(product.getProductId());
        orderedProductDTO.setProductName(product.getProductName());
        orderedProductDTO.setDescription(product.getDescription());
        orderedProductDTO.setPrice(product.getPrice());
        orderedProductDTO.setProductImage(product.getProductImage());
        return orderedProductDTO;
    }


    public static Product convertOrderedProductDTOToProductModel(OrderedProductDTO orderedProductDTO) {
        System.out.println("Get the product in the conversion from OrderedProductDTO to Product");
        // ToDO: use product id only
        Product product = new Product();
        product.setProductId(orderedProductDTO.getProductId());
        product.setProductName(orderedProductDTO.getProductName());
        product.setDescription(orderedProductDTO.getDescription());
        product.setPrice(orderedProductDTO.getPrice());
        product.setProductImage(orderedProductDTO.getProductImage());
        return product;
    }
}
