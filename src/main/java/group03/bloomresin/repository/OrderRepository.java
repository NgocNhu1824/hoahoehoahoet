package group03.bloomresin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import group03.bloomresin.domain.Order;
import group03.bloomresin.domain.User;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByStatus(String status);
    List<Order> findByUserAndStatus(User user, String status);
    List<Order> findByUser(User user);
    List<Order> findByUserAndStatusNotIn(User user, List<String> statuses);
    List<Order> findByUser_Id(long userId);
    List<Order> findByUserAndStatusNot(User user, String status);
    boolean existsByUserId(Long userId);
    long countByStatus(String status);

    // Lấy doanh thu theo ngày trong tháng
    @Query("SELECT DAY(o.orderDate) AS day, SUM(o.totalPrice) AS revenue " +
            "FROM Order o " +
            "WHERE MONTH(o.orderDate) = :month AND YEAR(o.orderDate) = :year " +
            "GROUP BY DAY(o.orderDate) " +
            "ORDER BY day ASC")
    List<Object[]> getRevenueByDay(int month, int year);

    // Lấy danh sách năm có dữ liệu
    @Query("SELECT DISTINCT YEAR(o.orderDate) " +
            "FROM Order o " +
            "ORDER BY YEAR(o.orderDate) DESC")
    List<Integer> findYearsWithData();
}
