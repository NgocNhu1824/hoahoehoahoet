package group03.bloomresin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import group03.bloomresin.domain.OrderDetail;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    List<OrderDetail> findByProductId(long productId);
    List<OrderDetail> findByOrderId(long orderId);

    @Query("SELECT od.product.name, SUM(od.quantity) " +
            "FROM OrderDetail od " +
            "WHERE MONTH(od.order.orderDate) = :month AND YEAR(od.order.orderDate) = :year " +
            "GROUP BY od.product.name " +
            "ORDER BY SUM(od.quantity) DESC")
    List<Object[]> getTopProductsInMonth(int month, int year);
}

