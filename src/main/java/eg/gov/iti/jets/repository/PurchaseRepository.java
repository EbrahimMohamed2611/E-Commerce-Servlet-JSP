package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Purchase;
import eg.gov.iti.jets.model.PurchaseId;

public interface PurchaseRepository {
    Purchase savePurchase(Purchase purchase);

    boolean deletePurchaseById(PurchaseId purchaseId);

    void deletePurchaseByObject(Purchase purchase);
}
