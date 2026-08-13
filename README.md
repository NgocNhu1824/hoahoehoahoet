# 🌸 BloomResin - Nền Tảng Thương Mại Điện Tử & Đặt Hàng Thiết Kế Riêng Trang Sức Resin
> **E-Commerce & Custom Order Platform for Handcrafted Resin Jewelry**

[![Java 21](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.2.10-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![Spring Security](https://img.shields.io/badge/Spring_Security-6.x-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![Docker](https://img.shields.io/badge/Deploy-Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)

---

## 📌 1. Giới thiệu Dự án (Project Overview)

**BloomResin** (tên repository: `hoahoehoahoet`) là hệ thống thương mại điện tử chuyên nghiệp cung cấp các sản phẩm trang sức và phụ kiện nghệ thuật chế tác thủ công từ hoa thật ép trong nhựa Resin trong suốt cao cấp.

Nền tảng không chỉ là cửa hàng trực tuyến phục vụ mua sắm sản phẩm bán lẻ mà còn cung cấp bộ công cụ **Đặt hàng Thiết kế Riêng (Custom Order Engine)** độc đáo, giúp khách hàng gửi yêu cầu cá nhân hóa hoa khô, màu sắc và kiểu dáng khung theo gu thẩm mỹ cá nhân.

Dự án được thiết kế và xây dựng theo chuẩn **Spring Boot Enterprise Architecture**, đáp ứng đầy đủ tính năng bảo mật phân quyền (RBAC), thanh toán linh hoạt, gửi mail OTP tự động và quản lý vận hành kinh doanh hiệu quả cho doanh nghiệp.

---

## ✨ 2. Tính Năng Nổi Bật (Key Features)

### 🛍️ 1. Dành cho Khách hàng (Customer Portal)
- **Danh mục Sản phẩm Phong phú**: Khám phá 6 dòng sản phẩm chính (*Dây chuyền hoa resin, Bông tai hoa baby, Nhẫn resin dát vàng 18k, Vòng tay hoa ép, Móc khóa phụ kiện, Khay decor đúc resin*).
- **Đặt làm Theo Yêu cầu (Custom Order Engine)**: Tính năng đặt chế tác riêng cho phép chọn mẫu hoa (hoa hồng baby, cúc cừu, cẩm tú cầu...), chọn loại khung (mạ vàng/bạc/giọt nước) và gửi ghi chú gia công cá nhân.
- **Thanh toán & Đơn hàng**: Đặt hàng linh hoạt qua COD, VNPAY hoặc Chuyển khoản ngân hàng. Theo dõi tiến độ đơn hàng thời gian thực.
- **Xác thực Bảo mật & Đăng nhập Nhanh**: Đăng ký/đăng nhập hệ thống, hỗ trợ **Google OAuth2 SSO** và quy trình lấy lại mật khẩu an toàn qua **Mã OTP Email**.
- **Yêu thích & Đánh giá (Wishlist & Reviews)**: Lưu danh sách sản phẩm yêu thích và gửi phản hồi, chấm điểm sao cho từng sản phẩm đã mua.
- **Chăm sóc & Bảo quản (Care Service)**: Hướng dẫn khách hàng mẹo bảo quản trang sức nhựa resin luôn trong suốt và bền màu theo thời gian.

### 🛡️ 2. Dành cho Quản trị viên & Nhân viên (Admin & Staff Dashboard)
- **Thống kê Doanh thu (Analytics Dashboard)**: Báo cáo tổng doanh thu, số đơn hàng mới, thống kê sản phẩm bán chạy và biểu đồ doanh thu theo thời gian.
- **Quản lý Đơn hàng & Custom Orders**: Xử lý phê duyệt đơn hàng bán lẻ và theo dõi/cập nhật trạng thái gia công cho các đơn thiết kế riêng.
- **Quản lý Sản phẩm & Danh mục (Catalog Management)**: Quản lý danh sách sản phẩm, cập nhật số lượng tồn kho, giá bán và hình ảnh hiển thị.
- **Phân quyền Người dùng (RBAC)**: Quản lý tài khoản và phân quyền người dùng theo 3 vai trò chính: `ADMIN`, `EMPLOYEE`, `CUSTOMER`.
- **Quản lý Bài viết & Phản hồi**: Đăng tin tức khuyến mãi và phản hồi ý kiến đóng góp từ khách hàng.

---

## 🛠️ 3. Công Nghệ Sử Dụng (Tech Stack)

### **Backend Framework**
- **Core Runtime**: Java 21 & Spring Boot 3.2.10
- **Security**: Spring Security 6 (Password Hashing BCrypt, Role-Based Access Control)
- **Authentication**: Native Authentication & Google OAuth2 Client
- **Data Persistence**: Spring Data JPA (Hibernate ORM)
- **Database**: PostgreSQL (Production) / H2 In-Memory Database (Development)
- **Notification**: Spring Mail (Jakarta Mail) gửi mã OTP xác minh

### **Frontend & UI**
- **Architecture**: Spring MVC (Model-View-Controller)
- **Template Engine**: JSP (Jakarta Server Pages) & JSTL
- **Styling**: Bootstrap 5, Custom CSS3, Responsive Layout (Desktop & Mobile)
- **Icons & Libraries**: FontAwesome 6, jQuery, SweetAlert2

---

## 📐 4. Kiến Trúc Hệ Thống (System Architecture)

```
                       +-------------------------+
                       |      Client Browser     |
                       | (HTML5/JSP + Bootstrap) |
                       +------------+------------+
                                    |
                                    | HTTP / HTTPS Request
                                    v
                       +-------------------------+
                       |  Spring MVC Controller  |
                       |  (Spring Security 6)    |
                       +------------+------------+
                                    |
        +---------------------------+---------------------------+
        |                           |                           |
        v                           v                           v
+---------------+           +---------------+           +---------------+
| Auth & OAuth2 |           | Custom Order  |           | Admin Stats   |
| (JWT / OTP)   |           | & Catalog Service         | & Product Mgmt|
+-------+-------+           +-------+-------+           +-------+-------+
        |                           |                           |
        +---------------------------+---------------------------+
                                    |
                                    v
                       +-------------------------+
                       |    Spring Data JPA      |
                       +------------+------------+
                                    |
                                    v
                       +-------------------------+
                       |   PostgreSQL / H2 DB    |
                       +-------------------------+
```

---

## 📁 5. Cấu Trúc Thư Mục (Folder Structure)

```bash
hoahoehoahoet/
├── src/main/java/group03/bloomresin/
│   ├── config/             # Cấu hình Spring Security, OAuth2, Web MVC
│   ├── controller/         # Các Controller xử lý (admin, client, employee)
│   ├── domain/             # Entities Mapped Hibernate (Product, Order, User, CustomOrder, Category...)
│   ├── repository/         # Interfaces Spring Data JPA
│   ├── service/            # Business Logic Services xử lý nghiệp vụ
│   └── util/               # Tiện ích gửi Mail OTP, xử lý file upload, Security
├── src/main/resources/
│   ├── application.properties # Cấu hình Database & Mail server
│   └── data.sql            # Script khởi tạo dữ liệu mẫu (Seed Data)
├── src/main/webapp/WEB-INF/jsp/ # Trang giao diện người dùng & quản trị (JSP Templates)
├── Dockerfile              # Cấu hình đóng gói Docker Container
├── pom.xml                 # Khai báo phụ thuộc Maven
└── README.md
```

---

## 🚀 6. Hướng Dẫn Cài Đặt & Khởi Chạy (Getting Started)

### Yêu cầu tiên quyết
- **JDK 21** trở lên
- **Apache Maven 3.8+**
- **PostgreSQL** (hoặc mặc định chạy trên H2 In-Memory Database)

### Các bước khởi chạy:

1. **Clone repository**:
   ```bash
   git clone https://github.com/NgocNhu1824/hoahoehoahoet.git
   cd hoahoehoahoet
   ```

2. **Biên dịch và đóng gói với Maven**:
   ```bash
   ./mvnw clean package -DskipTests
   ```

3. **Khởi chạy ứng dụng**:
   ```bash
   ./mvnw spring-boot:run
   ```
   *Ứng dụng sẽ chạy tại địa chỉ*: `http://localhost:8080`

---

## 🎯 7. Cơ Hội Phát Triển Trong Tương Lai (Future Growth Roadmap)

1. **Gợi Ý Sản Phẩm Thông Minh Bằng AI (AI Recommendation Engine)**:
   - Tích hợp thuật toán AI phân tích phong cách thời trang, màu sắc hợp mệnh/phong thủy hoặc dịp tặng quà để đưa ra gợi ý mẫu hoa resin phù hợp nhất.
2. **Ướm Thử Trang Sức Thực Tế Ảo (AR Virtual Try-On)**:
   - Tích hợp công nghệ **Augmented Reality (AR)** trên trình duyệt cho phép khách hàng soi camera thử nhẫn, dây chuyền, bông tai resin trực quan trước khi chốt đơn.
3. **Thương Mại Điện Tử Quốc Tế & Đa Tiền Tệ (Cross-Border E-Commerce)**:
   - Tích hợp cổng thanh toán quốc tế (**PayPal, Stripe**), giao diện đa ngôn ngữ (Tiếng Anh, Tiếng Nhật) hỗ trợ xuất khẩu sản phẩm thủ công Việt Nam ra toàn cầu.
4. **Ứng Dụng Di Động Native (React Native / Flutter App)**:
   - Xây dựng app di động giúp khách hàng dễ dàng theo dõi tiến độ gia công thực tế của đơn hàng đặt làm riêng (**Custom Orders**) qua ảnh chụp cập nhật từ nghệ nhân.

---

## 👤 8. Tác Giả & Liên Hệ (Author & Contact)

- **Họ và tên**: Cao Huỳnh Ngọc Như
- **Vị trí mong muốn**: Full-stack Developer / Java Backend Developer (Java Spring Boot / React / Node.js)
- **GitHub**: [github.com/NgocNhu1824](https://github.com/NgocNhu1824)
- **Project Repository**: [hoahoehoahoet](https://github.com/NgocNhu1824/hoahoehoahoet)

---
*Cảm ơn Quý doanh nghiệp / Nhà tuyển dụng đã dành thời gian xem qua dự án!* 🚀
