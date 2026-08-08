<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dịch Vụ Hỏi Đáp & Tư Vấn - BloomResin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/css/style.css" rel="stylesheet">
    <style>
        body {
            background-color: #FFF1D2 !important;
            color: #6B1700;
            font-family: 'Open Sans', sans-serif;
            padding-top: 90px;
        }

        .chat-wrapper {
            max-width: 920px;
            margin: 25px auto;
            padding: 0 15px;
        }

        .chat-card {
            background: #FFF8EA;
            border: 2px solid #CEAF95;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(107, 23, 0, 0.12);
            overflow: hidden;
        }

        .chat-header {
            background-color: #6B1700;
            color: #FFF1D2;
            padding: 16px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .chat-body {
            height: 440px;
            overflow-y: auto;
            padding: 20px;
            background: #FFFFFF;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .message-row {
            display: flex;
            align-items: flex-end;
            gap: 10px;
            max-width: 82%;
        }

        .message-row.user {
            margin-left: auto;
            flex-direction: row-reverse;
        }

        .message-row.bot {
            margin-right: auto;
        }

        .avatar-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            flex-shrink: 0;
        }

        .user .avatar-icon {
            background-color: #6B1700;
            color: #FFF1D2;
        }

        .bot .avatar-icon {
            background-color: #CEAF95;
            color: #6B1700;
        }

        .message-bubble {
            padding: 12px 18px;
            border-radius: 18px;
            font-size: 14.5px;
            line-height: 1.55;
            word-break: break-word;
        }

        .user .message-bubble {
            background-color: #6B1700;
            color: #FFF1D2;
            border-bottom-right-radius: 4px;
        }

        .bot .message-bubble {
            background-color: #FFF8EA;
            color: #6B1700;
            border: 1px solid #CEAF95;
            border-bottom-left-radius: 4px;
        }

        .quick-tags {
            padding: 10px 16px;
            background-color: #FFF8EA;
            border-top: 1px solid #CEAF95;
            display: flex;
            align-items: center;
            gap: 8px;
            overflow-x: auto;
            white-space: nowrap;
            scrollbar-width: thin;
        }

        .quick-tags::-webkit-scrollbar {
            height: 4px;
        }

        .quick-tags::-webkit-scrollbar-thumb {
            background: #CEAF95;
            border-radius: 4px;
        }

        .quick-tag-btn {
            background: #FFF;
            border: 1px solid #CEAF95;
            color: #6B1700;
            font-size: 12.5px;
            font-weight: 600;
            padding: 6px 14px;
            border-radius: 18px;
            cursor: pointer;
            white-space: nowrap;
            flex-shrink: 0;
            transition: all 0.2s ease;
            box-shadow: 0 2px 4px rgba(107, 23, 0, 0.05);
        }

        .quick-tag-btn:hover {
            background: #6B1700;
            color: #FFF1D2;
            border-color: #6B1700;
            transform: translateY(-1px);
        }

        .chat-footer {
            padding: 14px 20px;
            background-color: #FFF8EA;
            border-top: 1px solid #CEAF95;
            display: flex;
            gap: 12px;
        }

        .chat-input {
            border: 2px solid #CEAF95;
            border-radius: 24px;
            padding: 10px 18px;
            font-size: 14px;
            background: #FFF;
            outline: none;
        }

        .chat-input:focus {
            border-color: #6B1700;
            box-shadow: 0 0 0 3px rgba(107, 23, 0, 0.15);
        }

        .send-btn {
            background-color: #6B1700;
            color: #FFF1D2;
            border: none;
            border-radius: 24px;
            padding: 0 24px;
            font-weight: 600;
            font-size: 14px;
            transition: background 0.2s ease;
        }

        .send-btn:hover {
            background-color: #CEAF95;
            color: #6B1700;
        }

        .typing-dots span {
            animation: blink 1.4s infinite fill-mode;
            font-weight: bold;
            font-size: 18px;
        }
        .typing-dots span:nth-child(2) { animation-delay: .2s; }
        .typing-dots span:nth-child(3) { animation-delay: .4s; }

        @keyframes blink {
            0% { opacity: .2; }
            20% { opacity: 1; }
            100% { opacity: .2; }
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<div class="chat-wrapper">
    <div class="chat-card">
        <div class="chat-header">
            <div class="d-flex align-items-center gap-2">
                <i class="fas fa-robot fa-lg"></i>
                <div>
                    <h5 class="mb-0 text-white font-weight-bold" style="font-size: 16px;">Trợ Lý Tư Vấn BloomResin</h5>
                    <small style="color: #FFDDAA; font-size: 12px;">Hỗ trợ 24/7 về sản phẩm & bảo quản hoa Resin</small>
                </div>
            </div>
            <span class="badge bg-success rounded-pill"><i class="fas fa-circle me-1" style="font-size: 8px;"></i>Trực tuyến</span>
        </div>

        <div class="chat-body" id="chat-body">
            <!-- Welcome Message -->
            <div class="message-row bot">
                <div class="avatar-icon"><i class="fas fa-fan"></i></div>
                <div class="message-bubble">
                    Xin chào! 👋 Tôi là trợ lý ảo của <strong>BloomResin (Hoa hòe hoa hoẹt)</strong>.<br>
                    Tôi có thể hỗ trợ bạn tư vấn mẫu trang sức hoa resin ép khô, hướng dẫn đặt làm theo yêu cầu, hoặc cách bảo quản sản phẩm bền đẹp.<br>
                    Bạn cần hỗ trợ thông tin gì ạ?
                </div>
            </div>
        </div>

        <div class="quick-tags">
            <button class="quick-tag-btn" onclick="sendQuickMessage('Sản phẩm nổi bật')">🌸 Sản phẩm nổi bật</button>
            <button class="quick-tag-btn" onclick="sendQuickMessage('Đặt làm hoa theo yêu cầu')">✨ Đặt làm theo yêu cầu</button>
            <button class="quick-tag-btn" onclick="sendQuickMessage('Cách bảo quản hoa resin')">🛡️ Hướng dẫn bảo quản</button>
            <button class="quick-tag-btn" onclick="sendQuickMessage('Thời gian giao hàng & phí ship')">🚚 Vận chuyển & Giao hàng</button>
            <button class="quick-tag-btn" onclick="sendQuickMessage('Thông tin liên hệ shop')">📞 Thông tin liên hệ</button>
        </div>

        <div class="chat-footer">
            <input type="text" id="user-input" class="form-control chat-input" placeholder="Nhập câu hỏi của bạn tại đây..." onkeypress="handleKeyPress(event)">
            <button class="send-btn" onclick="sendMessage()"><i class="fas fa-paper-plane me-1"></i> Gửi</button>
        </div>
    </div>
</div>

<script>
    function sendQuickMessage(text) {
        document.getElementById("user-input").value = text;
        sendMessage();
    }

    function handleKeyPress(event) {
        if (event.key === "Enter") {
            sendMessage();
        }
    }

    function sendMessage() {
        let inputField = document.getElementById("user-input");
        let message = inputField.value.trim();
        if (message === "") return;

        addMessage(message, "user");
        inputField.value = "";

        showTypingIndicator();

        fetch("/api/chat", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ message: message })
        })
        .then(response => response.json())
        .then(data => {
            removeTypingIndicator();
            let botReply = data.reply || generateSmartResponse(message);
            addMessage(botReply, "bot");
        })
        .catch(error => {
            removeTypingIndicator();
            let botReply = generateSmartResponse(message);
            addMessage(botReply, "bot");
        });
    }

    function addMessage(text, sender) {
        let chatBody = document.getElementById("chat-body");
        let rowDiv = document.createElement("div");
        rowDiv.classList.add("message-row", sender);

        let avatarDiv = document.createElement("div");
        avatarDiv.classList.add("avatar-icon");
        avatarDiv.innerHTML = sender === "user" ? '<i class="fas fa-user"></i>' : '<i class="fas fa-fan"></i>';

        let bubbleDiv = document.createElement("div");
        bubbleDiv.classList.add("message-bubble");
        bubbleDiv.innerHTML = convertMarkdownToHTML(text);

        rowDiv.appendChild(avatarDiv);
        rowDiv.appendChild(bubbleDiv);

        chatBody.appendChild(rowDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
    }

    function showTypingIndicator() {
        let chatBody = document.getElementById("chat-body");
        let typingDiv = document.createElement("div");
        typingDiv.id = "typing-indicator";
        typingDiv.classList.add("message-row", "bot");

        typingDiv.innerHTML = `
            <div class="avatar-icon"><i class="fas fa-fan"></i></div>
            <div class="message-bubble typing-dots">
                <span>.</span><span>.</span><span>.</span>
            </div>
        `;
        chatBody.appendChild(typingDiv);
        chatBody.scrollTop = chatBody.scrollHeight;
    }

    function removeTypingIndicator() {
        let typingDiv = document.getElementById("typing-indicator");
        if (typingDiv) {
            typingDiv.remove();
        }
    }

    function generateSmartResponse(query) {
        let text = query.toLowerCase();

        if (text.includes("chào") || text.includes("hi") || text.includes("hello") || text.includes("tư vấn")) {
            return "Dạ BloomResin xin chào bạn! 🌸 Bạn đang quan tâm đến mẫu trang sức hoa Resin nào (Dây chuyền, Bông tai, Nhẫn, Vòng tay) hay cần tư vấn dịch vụ làm hoa theo yêu cầu ạ?";
        }

        if (text.includes("sản phẩm") || text.includes("dây chuyền") || text.includes("nhẫn") || text.includes("vòng tay") || text.includes("bông tai") || text.includes("mẫu")) {
            return "BloomResin chuyên cung cấp các bộ sưu tập trang sức hoa tự nhiên ép trong chất liệu Resin trong suốt:<br>" +
                "• <strong>Dây chuyền hoa Resin:</strong> Giọt nước, trái tim, hình tròn dát vàng 18k.<br>" +
                "• <strong>Bông tai & Nhẫn hoa:</strong> Tinh tế, nữ tính với hoa hồng khô, bách nhật, baby, cẩm tú cầu.<br>" +
                "• <strong>Vòng tay & Phụ kiện:</strong> Móc khóa hoa, khay đựng trang sức.<br><br>" +
                "👉 Bạn có thể xem danh sách đầy đủ tại <a href='/products' style='color:#6B1700; font-weight:bold; text-decoration:underline;'>Trang Tất cả sản phẩm</a> nhé!";
        }

        if (text.includes("yêu cầu") || text.includes("đặt làm") || text.includes("custom") || text.includes("hoa của tôi") || text.includes("kỷ niệm")) {
            return "✨ <strong>Dịch vụ làm sản phẩm theo yêu cầu (Custom Order):</strong><br>" +
                "Bạn có thể gửi hoa cưới, hoa sinh nhật hay bông hoa kỷ niệm của chính bạn đến BloomResin! Shop sẽ ép khô bằng kỹ thuật cao và đúc vào khung Resin vĩnh cửu.<br><br>" +
                "📞 Vui lòng gọi trực tiếp Hotline <strong>0901234567</strong> hoặc ghé cửa hàng để nhân viên tư vấn chi tiết quy trình gửi hoa ạ!";
        }

        if (text.includes("bảo quản") || text.includes("vàng") || text.includes("bền") || text.includes("nước") || text.includes("vệ sinh")) {
            return "🛡️ <strong>Hướng dẫn bảo quản trang sức hoa Resin:</strong><br>" +
                "1. Tránh để trang sức dưới ánh nắng mặt trời gắt hoặc nhiệt độ quá cao trong thời gian dài.<br>" +
                "2. Tránh tiếp xúc trực tiếp với hóa chất tẩy rửa mạnh, nước hoa, dung dịch sơn móng tay.<br>" +
                "3. Khi không sử dụng, nên lau nhẹ bằng khăn mềm khô và cất trong hộp kín bảo quản.<br>" +
                "👉 Nếu làm đúng hướng dẫn, hoa ép Resin sẽ giữ được màu sắc tươi tắn suốt nhiều năm!";
        }

        if (text.includes("vận chuyển") || text.includes("giao hàng") || text.includes("phí ship") || text.includes("thanh toán") || text.includes("bao lâu")) {
            return "🚚 <strong>Chính sách giao hàng & Thanh toán:</strong><br>" +
                "• <strong>Thời gian giao hàng:</strong> Từ 2 - 4 ngày làm việc trên toàn quốc.<br>" +
                "• <strong>Hình thức thanh toán:</strong> Hỗ trợ thanh toán khi nhận hàng (COD) hoặc Chuyển khoản ngân hàng qua mã QR.<br>" +
                "• <strong>Kiểm tra hàng:</strong> Bạn được mở hộp kiểm tra sản phẩm trước khi thanh toán tiền cho shipper ạ!";
        }

        if (text.includes("liên hệ") || text.includes("địa chỉ") || text.includes("hotline") || text.includes("sđt") || text.includes("shop")) {
            return "📞 <strong>Thông tin liên hệ BloomResin:</strong><br>" +
                "• <strong>Địa chỉ cửa hàng:</strong> 123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh.<br>" +
                "• <strong>Hotline / Zalo:</strong> 0901234567<br>" +
                "• <strong>Email:</strong> admin@bloomresin.com<br>" +
                "• <strong>Giờ mở cửa:</strong> 08:00 - 21:30 (Tất cả các ngày trong tuần)";
        }

        return "Cảm ơn câu hỏi của bạn! 🌸 BloomResin đã ghi nhận thông tin: <em>'" + escapeHtml(query) + "'</em>.<br>" +
            "Nếu cần hỗ trợ gấp về đơn hàng hay sản phẩm, bạn có thể gọi ngay Hotline <strong>0901234567</strong> hoặc bấm xem <a href='/products' style='color:#6B1700; font-weight:bold; text-decoration:underline;'>Trang Tất cả sản phẩm</a> nhé!";
    }

    function convertMarkdownToHTML(text) {
        // Convert Markdown links [Label](URL) to clickable HTML <a> tags
        text = text.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" style="color: #6B1700; font-weight: bold; text-decoration: underline;">$1</a>');
        text = text.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
        text = text.replace(/\*(.*?)\*/g, '<em>$1</em>');
        text = text.replace(/\n/g, "<br>");
        return text;
    }

    function escapeHtml(str) {
        return str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    }
</script>
</body>
</html>
