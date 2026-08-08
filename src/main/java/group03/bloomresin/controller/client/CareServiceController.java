package group03.bloomresin.controller.client;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Controller
public class CareServiceController {

    @GetMapping("/careservice")
    public String showCareService() {
        return "customer/careservice/careservice";
    }

    @GetMapping("/book-service/{type}")
    public String bookService(@PathVariable String type, Model model) {
        model.addAttribute("serviceType", type);
        return "book-service";
    }

    @PostMapping("/api/chat")
    @ResponseBody
    public Map<String, String> processChatApi(@RequestBody Map<String, String> request) {
        String userMessage = request.getOrDefault("message", "").trim();
        Map<String, String> response = new HashMap<>();

        if (userMessage.isEmpty()) {
            response.put("reply", "Bạn chưa nhập câu hỏi.");
            return response;
        }

        String aiReply = callRealAiApi(userMessage);
        response.put("reply", aiReply);
        return response;
    }

    private String callRealAiApi(String userMessage) {
        try {
            String apiKey = System.getenv("GEMINI_API_KEY");
            if (apiKey == null || apiKey.trim().isEmpty()) {
                apiKey = "AIzaSyDv6sL4HSQ6uvlPHq8bfoESihK2g0kzJYo";
            }

            String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + apiKey;

            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String systemPrompt = "Bạn là Trợ lý AI thông minh của BloomResin (Hoa hòe hoa hoẹt - Thương hiệu trang sức hoa tự nhiên ép khô trong nhựa Resin). Hãy trả lời ngắn gọn, thân thiện, lịch sự bằng tiếng Việt. Tư vấn cho khách hàng về các sản phẩm trang sức (Dây chuyền, Bông tai, Nhẫn, Vòng tay, Móc khóa hoa Resin), dịch vụ làm hoa theo yêu cầu (Custom Order), cách bảo quản hoa resin không bị vàng, cùng chính sách giao hàng và thanh toán. Giải đáp bất kỳ câu hỏi nào của khách hàng như ChatGPT.";

            Map<String, Object> part = new HashMap<>();
            part.put("text", systemPrompt + "\n\nKhách hàng hỏi: " + userMessage);

            Map<String, Object> content = new HashMap<>();
            content.put("parts", Collections.singletonList(part));

            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("contents", Collections.singletonList(content));

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

            ResponseEntity<Map> apiResponse = restTemplate.postForEntity(url, entity, Map.class);
            if (apiResponse.getStatusCode().is2xxSuccessful() && apiResponse.getBody() != null) {
                Map body = apiResponse.getBody();
                List candidates = (List) body.get("candidates");
                if (candidates != null && !candidates.isEmpty()) {
                    Map firstCandidate = (Map) candidates.get(0);
                    Map candidateContent = (Map) firstCandidate.get("content");
                    if (candidateContent != null) {
                        List parts = (List) candidateContent.get("parts");
                        if (parts != null && !parts.isEmpty()) {
                            Map firstPart = (Map) parts.get(0);
                            String text = (String) firstPart.get("text");
                            if (text != null && !text.trim().isEmpty()) {
                                return text.trim();
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            // Fallback to internal knowledge engine if external API is unreachable
        }

        return generateSmartFallbackResponse(userMessage);
    }

    private String generateSmartFallbackResponse(String query) {
        String text = query.toLowerCase();

        if (text.contains("chào") || text.contains("hi") || text.contains("hello") || text.contains("tư vấn")) {
            return "Dạ BloomResin xin chào bạn! 🌸 Bạn đang quan tâm đến mẫu trang sức hoa Resin nào (Dây chuyền, Bông tai, Nhẫn, Vòng tay) hay cần tư vấn dịch vụ làm hoa theo yêu cầu ạ?";
        }

        if (text.contains("sản phẩm") || text.contains("dây chuyền") || text.contains("nhẫn") || text.contains("vòng tay") || text.contains("bông tai") || text.contains("mẫu")) {
            return "BloomResin chuyên cung cấp các bộ sưu tập trang sức hoa tự nhiên ép trong chất liệu Resin trong suốt:\n" +
                "• **Dây chuyền hoa Resin:** Giọt nước, trái tim, hình tròn dát vàng 18k.\n" +
                "• **Bông tai & Nhẫn hoa:** Tinh tế, nữ tính với hoa hồng khô, bách nhật, baby, cẩm tú cầu.\n" +
                "• **Vòng tay & Phụ kiện:** Móc khóa hoa, khay đựng trang sức.\n\n" +
                "👉 Bạn có thể xem danh sách đầy đủ tại mục [Tất cả sản phẩm](/products) nhé!";
        }

        if (text.contains("yêu cầu") || text.contains("đặt làm") || text.contains("custom") || text.contains("hoa của tôi") || text.contains("kỷ niệm")) {
            return "✨ **Dịch vụ làm sản phẩm theo yêu cầu (Custom Order):**\n" +
                "Bạn có thể gửi hoa cưới, hoa sinh nhật hay bông hoa kỷ niệm của chính bạn đến BloomResin! Shop sẽ ép khô bằng kỹ thuật cao và đúc vào khung Resin vĩnh cửu.\n\n" +
                "📞 Vui lòng gọi trực tiếp Hotline **0901234567** hoặc ghé cửa hàng để nhân viên tư vấn chi tiết quy trình gửi hoa ạ!";
        }

        if (text.contains("bảo quản") || text.contains("vàng") || text.contains("bền") || text.contains("nước") || text.contains("vệ sinh")) {
            return "🛡️ **Hướng dẫn bảo quản trang sức hoa Resin:**\n" +
                "1. Tránh để trang sức dưới ánh nắng mặt trời gắt hoặc nhiệt độ quá cao trong thời gian dài.\n" +
                "2. Tránh tiếp xúc trực tiếp với hóa chất tẩy rửa mạnh, nước hoa, dung dịch sơn móng tay.\n" +
                "3. Khi không sử dụng, nên lau nhẹ bằng khăn mềm khô và cất trong hộp kín bảo quản.\n" +
                "👉 Nếu làm đúng hướng dẫn, hoa ép Resin sẽ giữ được màu sắc tươi tắn suốt nhiều năm!";
        }

        if (text.contains("vận chuyển") || text.contains("giao hàng") || text.contains("phí ship") || text.contains("thanh toán") || text.contains("bao lâu")) {
            return "🚚 **Chính sách giao hàng & Thanh toán:**\n" +
                "• **Thời gian giao hàng:** Từ 2 - 4 ngày làm việc trên toàn quốc.\n" +
                "• **Hình thức thanh toán:** Hỗ trợ thanh toán khi nhận hàng (COD) hoặc Chuyển khoản ngân hàng qua mã QR.\n" +
                "• **Kiểm tra hàng:** Bạn được mở hộp kiểm tra sản phẩm trước khi thanh toán tiền cho shipper ạ!";
        }

        if (text.contains("liên hệ") || text.contains("địa chỉ") || text.contains("hotline") || text.contains("sđt") || text.contains("shop")) {
            return "📞 **Thông tin liên hệ BloomResin:**\n" +
                "• **Địa chỉ cửa hàng:** 123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh.\n" +
                "• **Hotline / Zalo:** 0901234567\n" +
                "• **Email:** admin@bloomresin.com\n" +
                "• **Giờ mở cửa:** 08:00 - 21:30 (Tất cả các ngày trong tuần)";
        }

        return "Cảm ơn bạn đã nhắn tin cho BloomResin! 🌸 Về thắc mắc *'" + query + "'*, Trợ lý AI đề xuất bạn có thể tham khảo mục [Tất cả sản phẩm](/products) hoặc liên hệ trực tiếp qua Hotline **0901234567** để được nhân viên tư vấn ngay tức thì ạ!";
    }
}