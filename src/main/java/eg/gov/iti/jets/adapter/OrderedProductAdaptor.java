package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.dto.ProductDTO;
import eg.gov.iti.jets.factory.ProductServiceFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Product;
import eg.gov.iti.jets.service.ProductService;

public class OrderedProductAdaptor {

    private static final ProductService productService = ProductServiceFactory.getProductServiceInstance();

    public static OrderedProductDTO convertProductModelToOrderedItem(Product product) {
        OrderedProductDTO orderedProductDTO = new OrderedProductDTO();
        orderedProductDTO.setProductId(product.getProductId());
        orderedProductDTO.setProductName(product.getProductName());
        orderedProductDTO.setDescription(product.getDescription());
        orderedProductDTO.setPrice(product.getPrice());
        orderedProductDTO.setProductImagePath(product.getProductImage().getImagePath());
        return orderedProductDTO;
    }


    public static Product convertOrderedProductDTOToProductModel(OrderedProductDTO orderedProductDTO) {
        System.out.println("Get the product in the conversion from OrderedProductDTO to Product");
        return productService.getProductById(orderedProductDTO.getProductId());
    }
}
