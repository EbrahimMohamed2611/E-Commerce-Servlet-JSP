package eg.gov.iti.jets.adapter;

import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.model.Purchase;

public class PurchaseAdapter {
    public static PurchaseDTO convertPurchaseModelToPurchaseDTO(Purchase purchase) {
        System.out.println("Purchase Adapter : Convert to PurchaseDTO");
        PurchaseDTO purchaseDTO = new PurchaseDTO();
        purchaseDTO.setQuantity(purchase.getQuantity());
        purchaseDTO.setOrderedProductDTO(OrderedProductAdapter.convertProductModelToOrderedItem(purchase.getProduct()));
        purchaseDTO.setPurchaseId(purchase.getPurchasesId());


        return purchaseDTO;
    }

    public static Purchase convertPurchaseDTOToPurchaseModel(PurchaseDTO purchaseDTO) {
        System.out.println("Purchase Adapter : Convert to Model");
        Purchase purchase = new Purchase();
        purchase.setQuantity(purchaseDTO.getQuantity());
        purchase.setProduct(OrderedProductAdapter.convertOrderedProductDTOToProductModel(purchaseDTO.getOrderedProductDTO()));
        purchase.setPurchasesId(purchaseDTO.getPurchaseId());
        return purchase;
    }

}
