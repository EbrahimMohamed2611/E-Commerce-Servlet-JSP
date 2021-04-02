package eg.gov.iti.jets.repository;

import eg.gov.iti.jets.model.Purchase;

public interface PurchaseRepository {
    Purchase savePurchase(Purchase purchase);
}
