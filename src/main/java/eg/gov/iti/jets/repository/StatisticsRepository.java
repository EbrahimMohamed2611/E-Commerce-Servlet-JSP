package eg.gov.iti.jets.repository;

public interface StatisticsRepository {
    int getNotCompletedOrders();
    int getCompletedOrders();
    int getStatisticsUsers();
    int getAllProducts();
}
