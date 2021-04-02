//package eg.gov.iti.jets.service.impl;
//
//import eg.gov.iti.jets.dto.OrderDTO;
//import eg.gov.iti.jets.dto.OrderItemDTO;
//import eg.gov.iti.jets.adapter.OrderedItemAdaptor;
//import eg.gov.iti.jets.model.Product;
//import eg.gov.iti.jets.repository.ProductRepository;
//import eg.gov.iti.jets.repository.impl.ProductRepositoryImpl;
//import eg.gov.iti.jets.service.ShoppingCartService;
//
//
//import java.util.HashSet;
//import java.util.Set;
//
//public class ShoppingCartServiceImp implements ShoppingCartService {
//
//    Set<OrderDTO> itemsOrdered;
//
//    public ShoppingCartServiceImp() {
//        itemsOrdered = new HashSet<>();
//    }
//
//
//    @Override
//    public Set<OrderDTO> getItemsOrdered() {
//        return (itemsOrdered);
//    }
//
//
//    @Override
//    public void addItem(int itemID) {
//        for (OrderDTO orderDTO : itemsOrdered) {
//            if (orderDTO.getOrderedItem().getProductId() == itemID) {
//                orderDTO.incrementNumItems();
//                return;
//            }
//        }
//
//        ProductRepository productRepository = new ProductRepositoryImpl();
//
//        Product orderedProduct = productRepository.getProductById(itemID);
//        if(orderedProduct != null){
//           OrderItemDTO orderItemDTO =  OrderedItemAdaptor.convertProdcutModelToOrderedItem(orderedProduct);
//            OrderDTO orderDTO = new OrderDTO();
//            orderDTO.setOrderedItem(orderItemDTO);
//            itemsOrdered.add(orderDTO);
//
//        }else{
//            //ToDo : handle wrong item ID;
//
//        }
//
//    }
//
//    @Override
//    public synchronized void setNumOrdered(int itemID, int orderQuantity) {
//        if (orderQuantity <= 0) {
//            itemsOrdered.removeIf(orderDTO -> orderDTO.getOrderedItem().getProductId()== itemID);
//            return;
//        } else {
//            for (OrderDTO orderDTO : itemsOrdered) {
//                if (orderDTO.getOrderedItem().getProductId() == itemID) {
//                    orderDTO.setQuantity(orderQuantity);
//                    return;
//                }
//            }
//        }
//        ProductRepository productRepository = new ProductRepositoryImpl();
//
//        Product orderedProduct = productRepository.getProductById(itemID);
//        if(orderedProduct != null){
//            OrderItemDTO orderItemDTO =  OrderedItemAdaptor.convertProdcutModelToOrderedItem(orderedProduct);
//            OrderDTO orderDTO = new OrderDTO();
//            orderDTO.setOrderedItem(orderItemDTO);
//            orderDTO.setQuantity(orderQuantity);
//            itemsOrdered.add(orderDTO);
//
//        }else{
//            //ToDo : handle wrong item ID;
//
//        }
//    }
//
//}
