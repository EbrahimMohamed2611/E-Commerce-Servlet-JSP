package eg.gov.iti.jets.controller;

import eg.gov.iti.jets.convertors.JsonConvertor;
import eg.gov.iti.jets.factory.StatisticsRepositoryFactory;
import eg.gov.iti.jets.model.Statistics;
import eg.gov.iti.jets.repository.StatisticsRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "StatisticsController",urlPatterns = "/statisticsController")
public class StatisticsController extends HttpServlet {

       private static final StatisticsRepository STATISTICS_REPOSITORY = StatisticsRepositoryFactory.getUserRepositoryInstance();
       private Statistics statistics = new Statistics();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int completedOrders = STATISTICS_REPOSITORY.getCompletedOrders();
        int notCompletedOrders = STATISTICS_REPOSITORY.getNotCompletedOrders();
        int statisticsUsers = STATISTICS_REPOSITORY.getStatisticsUsers();
        int allProducts = STATISTICS_REPOSITORY.getAllProducts();
        statistics.setCompletedOrders(completedOrders);
        statistics.setNotCompletedOrders(notCompletedOrders);
        statistics.setUsers(statisticsUsers);
        statistics.setProducts(allProducts);
        resp.setContentType("application/json");
        String AllStatistics = JsonConvertor.toJson(statistics);
        PrintWriter writer = resp.getWriter();
        writer.write(AllStatistics);


    }
}
