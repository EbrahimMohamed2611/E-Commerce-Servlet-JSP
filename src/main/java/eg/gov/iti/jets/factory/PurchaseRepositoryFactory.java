package eg.gov.iti.jets.factory;

import eg.gov.iti.jets.repository.PurchaseRepository;
import eg.gov.iti.jets.repository.impl.PurchaseRepositoryImpl;

public class PurchaseRepositoryFactory {

    private static PurchaseRepository purchaseRepository;

    public static PurchaseRepository getPurchaseRepositoryInstance() {
        if (purchaseRepository == null) {
            purchaseRepository = new PurchaseRepositoryImpl();
        }
        return purchaseRepository;
    }
}
