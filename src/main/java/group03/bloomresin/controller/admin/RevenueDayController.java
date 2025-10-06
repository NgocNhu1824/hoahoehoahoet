package group03.bloomresin.controller.admin;

import group03.bloomresin.repository.OrderRepository;
import group03.bloomresin.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/revenue/day")
public class RevenueDayController {

    @Autowired
    private OrderRepository orderRepo;

    @Autowired
    private OrderDetailRepository orderDetailRepo;

    @GetMapping("")
    public String getRevenueByDay(
            @RequestParam(value = "year", required = false) Integer year,
            @RequestParam(value = "month", required = false) Integer month,
            Model model) {

        LocalDate now = LocalDate.now();
        int selectedYear = (year != null) ? year : now.getYear();
        int selectedMonth = (month != null) ? month : now.getMonthValue();

        // --- Doanh thu theo ngày ---
        List<Object[]> results = orderRepo.getRevenueByDay(selectedMonth, selectedYear);
        YearMonth ym = YearMonth.of(selectedYear, selectedMonth);
        int daysInMonth = ym.lengthOfMonth();
        Map<Integer, Double> revenueByDay = new LinkedHashMap<>();
        for (int d = 1; d <= daysInMonth; d++) revenueByDay.put(d, 0.0);

        for (Object[] row : results) {
            Integer day = ((Number) row[0]).intValue();
            Double revenue = ((Number) row[1]).doubleValue();
            revenueByDay.put(day, revenue);
        }

        // --- Sản phẩm bán chạy trong tháng (top 5 + Khác) ---
        List<Object[]> productSales = orderDetailRepo.getTopProductsInMonth(selectedMonth, selectedYear);
        Map<String, Integer> topProducts = new LinkedHashMap<>();
        int othersTotal = 0;

        for (int i = 0; i < productSales.size(); i++) {
            Object[] row = productSales.get(i);
            String productName = (String) row[0];
            Integer quantity = ((Number) row[1]).intValue();

            if (i < 5) {
                topProducts.put(productName, quantity); // Top 5 sản phẩm
            } else {
                othersTotal += quantity; // Gom các sản phẩm còn lại
            }
        }
        if (othersTotal > 0) {
            topProducts.put("Khác", othersTotal);
        }

        // --- Danh sách năm có dữ liệu ---
        List<Integer> yearsWithData = orderRepo.findYearsWithData();

        // --- Thêm vào model ---
        model.addAttribute("selectedYear", selectedYear);
        model.addAttribute("selectedMonth", selectedMonth);
        model.addAttribute("yearsWithData", yearsWithData);
        model.addAttribute("revenueByDay", revenueByDay);
        model.addAttribute("topProducts", topProducts);

        return "admin/homepage/statistics"; // JSP
    }
}
