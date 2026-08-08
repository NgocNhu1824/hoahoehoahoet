package group03.bloomresin.controller.client;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Controller
public class CareServiceController {

    @GetMapping({"/careservice", "/care-service"})
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
        // Priority 1: Free Public AI API (Pollinations GPT-4o Text API) with 4s timeout
        try {
            SimpleClientHttpRequestFactory requestFactory = new SimpleClientHttpRequestFactory();
            requestFactory.setConnectTimeout(4000);
            requestFactory.setReadTimeout(5000);
            RestTemplate restTemplate = new RestTemplate(requestFactory);

            String url = "https://text.pollinations.ai/";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            String systemPrompt = "Bạn là Trợ lý AI thông minh của BloomResin (Thương hiệu trang sức hoa tự nhiên ép khô). Trả lời bằng tiếng Việt ngắn gọn, lịch sự. Nếu người dùng hỏi câu hỏi ngoài luồng không liên quan đến trang sức, cửa hàng hay đơn hàng, hãy lịch sự giải thích rằng bạn là Trợ lý BloomResin chuyên hỗ trợ tư vấn sản phẩm, dịch vụ làm hoa theo yêu cầu và bảo quản, đồng thời mời họ chọn các chủ đề gợi ý.";

            List<Map<String, String>> messages = new ArrayList<>();
            Map<String, String> sysMsg = new HashMap<>();
            sysMsg.put("role", "system");
            sysMsg.put("content", systemPrompt);
            messages.add(sysMsg);

            Map<String, String> usrMsg = new HashMap<>();
            usrMsg.put("role", "user");
            usrMsg.put("content", userMessage);
            messages.add(usrMsg);

            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("messages", messages);
            requestBody.put("model", "openai");

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);
            ResponseEntity<String> apiResponse = restTemplate.postForEntity(url, entity, String.class);

            if (apiResponse.getStatusCode().is2xxSuccessful() && apiResponse.getBody() != null) {
                String reply = apiResponse.getBody().trim();
                if (!reply.isEmpty()) {
                    return reply;
                }
            }
        } catch (Exception e) {
            // Proceed to store fallback
        }

        return generateGeneralStoreFallbackResponse(userMessage);
    }

    private String generateGeneralStoreFallbackResponse(String query) {
        String text = query.toLowerCase();

        if (text.contains("chào") || text.contains("hi") || text.contains("hello") || text.contains("tư vấn")) {
            return "Dạ BloomResin xin chào bạn! 🌸 Bạn đang quan tâm đến mẫu trang sức hoa Resin nào (Dây chuyền, Bông tai, Nhẫn, Vòng tay) hay cần tư vấn dịch vụ làm hoa theo yêu cầu ạ?";
        }

        if (text.contains("sản phẩm") || text.contains("dây chuyền") || text.contains("nhẫn") || text.contains("vòng tay") || text.contains("bông tai") || text.contains("mẫu") || text.contains("giá")) {
            return "BloomResin chuyên cung cấp các bộ sưu tập trang sức hoa tự nhiên ép trong chất liệu Resin trong suốt:\n" +
                "• **Dây chuyền hoa Resin:** Giọt nước, trái tim, hình tròn dát vàng 18k.\n" +
                "• **Bông tai & Nhẫn hoa:** Tinh tế, nữ tính với hoa hồng khô, bách nhật, baby, cẩm tú cầu.\n" +
                "• **Vòng tay & Phụ kiện:** Móc khóa hoa, khay đựng trang sức.\n\n" +
                "👉 Bạn có thể xem danh sách đầy đủ tại mục [Tất cả sản phẩm](/products) nhé!";
        }

        if (text.contains("yêu cầu") || text.contains("đặt làm") || text.contains("custom") || text.contains("hoa của tôi") || text.contains("kỷ niệm")) {
            return "✨ **Dịch vụ làm sản phẩm theo yêu cầu (Custom Order):**\n" +
                "Bạn có thể gửi hoa cưới, hoa sinh nhật hay bông hoa kỷ niệm của chính bạn đến BloomResin! Shop sẽ ép khô bằng kỹ thuật cao và đúc vào khung Resin vĩnh cửu.\n\n" +
                "📞 Vui lòng gọi trực tiếp Hotline **0989780481** hoặc ghé cửa hàng để nhân viên tư vấn chi tiết quy trình gửi hoa ạ!\n\n" +
                "👉 Bạn cũng có thể điền thông tin trực tiếp tại [Form Đặt Làm Theo Yêu Cầu](/custom-order/form) nhé!";
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
                "• **Địa chỉ cửa hàng:** FPT University, 600 Nguyen Van Cu, An Binh, Ninh Kieu, Can Tho.\n" +
                "• **Hotline / Zalo:** 0989780481\n" +
                "• **Email:** bloomresin.system@gmail.com\n" +
                "• **Giờ mở cửa:** 08:00 - 21:30 (Tất cả các ngày trong tuần)";
        }

        // Polite & logical response for out-of-scope / unrecognized questions
        return "Dạ Trợ lý ảo BloomResin hiện chuyên hỗ trợ tư vấn các thông tin liên quan đến **sản phẩm trang sức, dịch vụ làm hoa theo yêu cầu, hướng dẫn bảo quản và đơn hàng** của cửa hàng ạ! 🌸\n\n" +
            "Nếu bạn chưa biết bắt đầu từ đâu, hãy bấm chọn các **chủ đề gợi ý ngay bên dưới** hoặc đặt câu hỏi liên quan đến sản phẩm để shop được hỗ trợ bạn tốt nhất nhé!";
    }
}