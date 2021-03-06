package eg.gov.iti.jets.service.impl;

import eg.gov.iti.jets.factory.OrderRepositoryFactory;
import eg.gov.iti.jets.model.Order;
import eg.gov.iti.jets.repository.OrderRepository;
import eg.gov.iti.jets.service.OrderService;


import java.util.Set;

import eg.gov.iti.jets.adapter.OrderAdapter;
import eg.gov.iti.jets.adapter.UserAdapter;
import eg.gov.iti.jets.dto.OrderDTO;
import eg.gov.iti.jets.dto.OrderedProductDTO;
import eg.gov.iti.jets.dto.PurchaseDTO;
import eg.gov.iti.jets.dto.UserDTO;

import eg.gov.iti.jets.factory.ProductRepositoryFactory;
import eg.gov.iti.jets.factory.PurchaseRepositoryFactory;
import eg.gov.iti.jets.model.*;
import eg.gov.iti.jets.repository.ProductRepository;
import eg.gov.iti.jets.repository.PurchaseRepository;

import java.util.List;
import java.util.stream.Collectors;


public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository = OrderRepositoryFactory.getOrderRepositoryInstance();
    private final ProductRepository productRepository = ProductRepositoryFactory.getProductRepositoryInstance();
    private final PurchaseRepository purchaseRepository = PurchaseRepositoryFactory.getPurchaseRepositoryInstance();


    @Override
    public Set<Order> getAllOrders(int userID) {
        Set<Order> allOrders = orderRepository.getAllOrders(userID);
        return allOrders;

    }

    @Override
    public List<OrderDTO> getUserOrders(int userId, OrderStatus orderStatus) {
        List<Order> listOfOrders = orderRepository.getUserOrdersByStatus(userId, orderStatus);

        return listOfOrders.stream().
                map(OrderAdapter::convertOrderModelToOrderDTO).
                collect(Collectors.toList());
    }

    @Override
    public void saveOrders(UserDTO userDTO, OrderDTO orderDTO, OrderStatus orderStatus) {
        User user = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDTO);
        Order order = new Order();
        order.setUser(user);
        order.setOrderStatus(orderStatus);
        order.setOrderId(orderDTO.getId());

        orderDTO.getItemsOrdered().forEach(e -> {
            Product product = productRepository.findById(e.getOrderedProductDTO().getProductId());
            Purchase purchase = new Purchase();
            purchase.setProduct(product);
            purchase.setQuantity(e.getQuantity());
            purchase.setOrder(order);
            order.getPurchase().add(purchase);
        });

        orderRepository.updateOrder(order);
    }

    @Override
    public boolean isProductAlreadyOrdered(OrderDTO orderDTO, int productId) {
        return orderDTO.getItemsOrdered().stream()
                .map(PurchaseDTO::getOrderedProductDTO).anyMatch(p -> p.getProductId() == productId);
    }

    @Override
    public void adjustOrderQuantity(OrderDTO orderDTO, int productId, int quantity) {
        Set<PurchaseDTO> purchaseDTOs = orderDTO.getItemsOrdered();
        for (PurchaseDTO purchaseDTO : purchaseDTOs) {
            if (purchaseDTO.getOrderedProductDTO().getProductId() == productId) {
                purchaseDTO.setQuantity(quantity);
                break;
            }
        }
    }


    @Override
    public void incrementOrderQuantity(OrderDTO orderDTO, int productId) {
        int oldQuantity = getPurchaseQuantity(orderDTO, productId);
        Set<PurchaseDTO> purchaseDTOs = orderDTO.getItemsOrdered();
        for (PurchaseDTO purchaseDTO : purchaseDTOs) {
            if (purchaseDTO.getOrderedProductDTO().getProductId() == productId) {
                purchaseDTO.setQuantity(oldQuantity + 1);
                break;
            }
        }
    }

    @Override
    public int getPurchaseQuantity(OrderDTO orderDTO, int productId) {
        Set<PurchaseDTO> purchaseDTOs = orderDTO.getItemsOrdered();
        for (PurchaseDTO purchaseDTO : purchaseDTOs) {
            if (purchaseDTO.getOrderedProductDTO().getProductId() == productId) {
                return purchaseDTO.getQuantity();
            }
        }
        return 0;
    }

    @Override
    public PurchaseDTO createNewPurchase(OrderedProductDTO inStockProductDTO) {
        PurchaseDTO purchaseDTO = new PurchaseDTO();
        purchaseDTO.setOrderedProductDTO(inStockProductDTO);
        purchaseDTO.setQuantity(1);  //if coming from the main page the quantity is 1
        return purchaseDTO;
    }

    @Override
    public OrderDTO updateOrder(OrderDTO orderToUpdateDTO, UserDTO userDTO, OrderStatus orderStatus) {
        Order orderToUpdate = prepareTheOrderForDatabase(orderToUpdateDTO, orderStatus, userDTO);

        Order updatedOrder = orderRepository.updateOrder(orderToUpdate);
        if (updatedOrder != null) {
            updatedOrder.getPurchase().forEach(purchaseRepository::savePurchase);
            return OrderAdapter.convertOrderModelToOrderDTO(updatedOrder);
        }
        return null; // else
    }

    @Override
    public OrderDTO addNewOrder(OrderDTO orderToSaveDTO, UserDTO userDTO) {
        Order orderToSave = prepareTheOrderForDatabase(orderToSaveDTO, OrderStatus.NOT_COMPLETED, userDTO);
        Order savedOrder = orderRepository.saveOrder(orderToSave);
        if (savedOrder != null) {
            savedOrder.getPurchase().forEach(purchaseRepository::savePurchase);
            return OrderAdapter.convertOrderModelToOrderDTO(savedOrder);
        }
        return null; // else
    }


    //TODO : refactoring (enhance for loop)
    @Override
    public OrderDTO deletePurchase(OrderDTO notCompletedOrder, int productId) {
        Set<PurchaseDTO> purchaseDTOSet = notCompletedOrder.getItemsOrdered();
        if (purchaseDTOSet == null) {
            return null;
        }
        for (PurchaseDTO purchaseDTO : purchaseDTOSet) {
            if (purchaseDTO.getOrderedProductDTO().getProductId() == productId) {
                System.out.println("size of purchase before delete : " + notCompletedOrder.getItemsOrdered().size());
                boolean b = notCompletedOrder.getItemsOrdered().removeIf(p -> p.getOrderedProductDTO().getProductId() == productId);
//                    boolean remove = notCompletedOrder.getItemsOrdered().remove(purchaseDTO);
                System.out.println("Is Removed ? " + b);
                System.out.println("size of purchase after delete : " + notCompletedOrder.getItemsOrdered().size());
                purchaseRepository.deletePurchaseById(purchaseDTO.getPurchaseId());
                break;
            }
        }
        return notCompletedOrder;
    }

    @Override
    public boolean deleteOrder(int orderId) {
        return orderRepository.deleteOrder(orderId);
    }

    private Order prepareTheOrderForDatabase(OrderDTO orderDTO, OrderStatus orderStatus, UserDTO userDTO) {
        Order order = OrderAdapter.convertOrderDTOToOrderModel(orderDTO);
        User currentUser = UserAdapter.convertFromUserRegistrationDtoToUserModel(userDTO);
        order.setUser(currentUser);
        order.setOrderStatus(orderStatus);
        return order;
    }


    @Override
    public double totalPrice(OrderDTO orderDTO) {
        double totalPrice = orderDTO.getItemsOrdered().stream().mapToDouble(purchaseDTO -> purchaseDTO.getQuantity() * purchaseDTO.getOrderedProductDTO().getPrice()).sum();
        System.out.println("total Price : " + totalPrice);
        return totalPrice;

    }
}
