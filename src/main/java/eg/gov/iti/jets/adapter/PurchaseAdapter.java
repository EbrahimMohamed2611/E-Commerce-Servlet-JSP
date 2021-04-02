package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.model.Purchase;

public class PurchaseAdapter {
   public static PurchaseDTO convertPurchaseModelToPurchaseDTO(Purchase purchase){
       PurchaseDTO purchaseDTO = new PurchaseDTO();
       purchaseDTO.setQuantity(purchase.getQuantity());
       purchaseDTO.setOrderedProductDTO(OrderedProductAdaptor.convertProductModelToOrderedItem(purchase.getProduct()));


       return purchaseDTO;
   }

    public static Purchase convertPurchaseDTOToPurchaseModel(PurchaseDTO purchaseDTO){
       Purchase purchase = new Purchase();
       purchase.setQuantity(purchaseDTO.getQuantity());
       purchase.setProduct(OrderedProductAdaptor.convertOrderedProductDTOToProductModel(purchaseDTO.getOrderedProductDTO()));
        return purchase;
    }

}
