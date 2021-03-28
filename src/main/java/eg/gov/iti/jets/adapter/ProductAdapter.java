package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.ProductDTO;
import eg.gov.iti.jets.model.Product;

public class ProductAdapter {
    public static ProductDTO convertFromProductModelToProductDto(Product product) {
        ProductDTO productDTO = new ProductDTO();

        productDTO.setProductId(product.getProductId());
        productDTO.setProductName(product.getProductName());
        productDTO.setDescription(product.getDescription());
        productDTO.setCategory(product.getCategory().getCategoryName());
        productDTO.setImagePath(product.getProductImage().getImagePath());
        productDTO.setPrice(product.getPrice());
        productDTO.setQuantity(product.getQuantity());


        product.getReviews().stream().map(ReviewAdapter::convertFromReviewModelToReviewDto)
                .forEach(productDTO.getReviews()::add);


        return productDTO;
    }
}
