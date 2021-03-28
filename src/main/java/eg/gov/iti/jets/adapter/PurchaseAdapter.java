package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.model.Purchase;

public class PurchaseAdapter {
   public static PurchaseDTO convertFromPurchaseModelToPurchaseDto(Purchase purchase){
       PurchaseDTO purchaseDTO = new PurchaseDTO();
       purchaseDTO.setPrice(purchase.getProduct().getPrice());
       purchaseDTO.setProduct(ProductAdapter.convertFromProductModelToProductDto(purchase.getProduct()));

       return purchaseDTO;
   }
}
