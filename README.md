# 🌸 BloomResin — Dự án học tập và phát triển của tôi trong hành trình trở thành Java Developer

[![Java 21](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.2.10-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![Spring Security](https://img.shields.io/badge/Security-Spring_Security-6DB33F?style=for-the-badge&logo=springsecurity&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)
[![Docker](https://img.shields.io/badge/Deploy-Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://github.com/NgocNhu1824/hoahoehoahoet)

> Đây là dự án mà tôi tự xây dựng để rèn luyện tư duy lập trình thực tế, làm quen với hệ thống web có logic nghiệp vụ rõ ràng và hiểu sâu hơn về cách một ứng dụng thương mại điện tử hoạt động từ đầu đến cuối.

---

## 1. Vì sao tôi chọn dự án này?

Khi bắt đầu học lập trình, tôi nhận ra rằng chỉ học kiến thức lý thuyết thôi là chưa đủ. Tôi muốn làm một dự án có tính ứng dụng thực tế, có chức năng rõ ràng, có user flow rõ ràng và có thể chứng minh mình đã hiểu cách một hệ thống web vận hành.

BloomResin là dự án đầu tiên giúp tôi đi từ việc “biết code” sang việc “hiểu cách xây dựng một sản phẩm”. Tôi không chỉ làm giao diện đẹp, mà còn phải nghĩ:

- Người dùng cần gì?
- Hệ thống cần lưu dữ liệu gì?
- Đơn hàng phải đi qua những bước nào?
- Ai có quyền làm gì trong hệ thống?
- Làm sao bảo vệ dữ liệu và đảm bảo tính an toàn của ứng dụng?

Đó là lý do dự án này quan trọng với tôi: nó giúp tôi hình thành tư duy như một lập trình viên thực thụ, không chỉ là người học theo template.

---

## 2. Dự án của tôi là gì?

BloomResin là một nền tảng thương mại điện tử dành cho trang sức resin handmade. Dự án này mô phỏng một hệ thống bán hàng thực tế với các chức năng chính như:

- Quản lý sản phẩm và danh mục
- Giỏ hàng và đặt hàng
- Xử lý trạng thái đơn hàng
- Đăng ký, đăng nhập, quên mật khẩu
- Xác thực bằng email OTP
- Tích hợp thanh toán VNPay
- Custom order theo yêu cầu riêng của khách hàng
- Quản lý phân quyền cho admin, employee và customer

Với tôi, đây là dự án rất phù hợp vì nó không chỉ là website mua hàng đơn thuần, mà còn là một hệ thống có nhiều module nghiệp vụ cần được thiết kế và kết nối với nhau.

---

## 3. Những gì tôi đã làm trong dự án

### 3.1 Frontend
- Trang chủ và danh mục sản phẩm
- Chi tiết sản phẩm
- Giỏ hàng
- Đăng ký, đăng nhập, đổi mật khẩu
- Theo dõi trạng thái đơn hàng
- Yêu thích sản phẩm và đánh giá
- Custom order form cho khách hàng
- Giao diện responsive cơ bản

### 3.2 Backend
- Xây dựng controller, service, repository theo mô hình MVC
- Quản lý dữ liệu sản phẩm, đơn hàng, người dùng, custom order
- Phân quyền người dùng theo vai trò
- Tích hợp Spring Security
- Gửi email xác thực và OTP
- Xử lý thanh toán VNPay
- Upload hình ảnh cho sản phẩm

### 3.3 Quản trị hệ thống
- Quản lý sản phẩm và danh mục
- Quản lý nhân viên và khách hàng
- Cập nhật trạng thái đơn hàng
- Theo dõi doanh thu và sản phẩm bán chạy
- Quản lý nội dung và tài nguyên hệ thống

---

## 4. Công nghệ tôi đã sử dụng

### Backend
- Java 21
- Spring Boot 3.2.10
- Spring Security 6
- Spring Data JPA / Hibernate
- PostgreSQL
- Maven
- Spring Mail
- OAuth2 Client

### Frontend
- JSP / JSTL
- Bootstrap 5
- jQuery
- HTML / CSS / JavaScript
- FontAwesome

### DevOps / triển khai
- Docker
- Maven Wrapper

Tôi chọn những công nghệ này vì chúng phù hợp với mục tiêu học tập của tôi: vừa thực tế, vừa đủ mạnh để tôi tiếp tục nâng cấp kỹ năng sau này.

---

## 5. Mô hình kiến trúc tôi đã áp dụng

```text
Client / Browser
       |
       v
Frontend (JSP + Bootstrap)
       |
       v
Controller Layer
       |
       v
Service Layer (Business Logic)
       |
       +------------------------+
       |                        |
       v                        v
Security / Auth            Repository / Database
- Login                    - PostgreSQL
- Role                    - JPA Entities
- OTP / Mail
```

Từ mô hình này, tôi đã hiểu rõ hơn về cách một hệ thống web được cấu thành:
- Controller nhận request
- Service xử lý nghiệp vụ
- Repository tương tác với database
- Security kiểm soát quyền truy cập
- Frontend cung cấp trải nghiệm cho user

---

## 6. Tại sao tôi thấy đây là một dự án đáng giá?

Với tư cách là sinh viên mới tốt nghiệp, tôi muốn có một dự án mà khi nhà tuyển dụng đọc CV sẽ thấy được điều sau:

- Tôi không chỉ học code, mà tôi đã làm được một sản phẩm có logic thực tế.
- Tôi biết cách xây dựng một ứng dụng web theo hướng nghiệp vụ.
- Tôi có khả năng làm Backend bằng Java Spring Boot.
- Tôi hiểu cơ bản về bảo mật, phân quyền, database và xử lý đơn hàng.
- Tôi biết cách suy nghĩ theo hướng user và product, không chỉ code theo từng tutorial.

Đó là điều làm cho dự án này trở nên có giá trị hơn so với các project “demo chỉ đẹp trên giấy”.

---

## 7. Những khó khăn tôi đã vượt qua

Dự án này không dễ như tôi tưởng ban đầu. Tôi đã phải đối mặt với nhiều vấn đề thực tế như:

- Xây dựng đúng luồng đăng ký và xác thực email OTP
- Tối ưu luồng custom order cho sản phẩm thủ công
- Phân quyền đúng theo từng vai trò: admin, employee, customer
- Tạo tính ổn định cho giỏ hàng và đơn hàng
- Tìm cách xử lý các lỗi khi hệ thống tương tác với database và thanh toán

Mỗi lỗi tôi gặp đều giúp tôi hiểu sâu hơn về cách lập trình thực tế hoạt động. Tôi tin rằng việc bạn không sợ sai và biết sửa sai chính là một điểm mạnh của người mới bắt đầu.

---

## 8. Tôi học được gì từ dự án này?

### Tư duy lập trình
Tôi học cách không chỉ viết code đúng, mà còn viết code có logic, dễ mở rộng và dễ bảo trì.

### Tư duy nghiệp vụ
Tôi học cách đặt mình vào vị trí của người dùng và quản lý hệ thống, thay vì chỉ làm theo từng chức năng riêng lẻ.

### Tư duy xử lý vấn đề
Mỗi khi có bug, tôi không chỉ cố gắng tìm cách sửa ngay, mà còn phải hiểu nguyên nhân vì sao nó xảy ra và cách tránh trong tương lai.

### Tư duy phát triển
Tôi thấy rõ rằng project này chưa phải là điểm cuối, mà là điểm khởi đầu để tôi tiếp tục cải tiến, học thêm và phát triển kỹ năng theo hướng chuyên nghiệp hơn.

---

## 9. Tình trạng hiện tại của dự án

Dự án hiện tại đã ở mức hoàn thiện nền tảng và có thể xem như một sản phẩm demo thực tế, phù hợp cho mục tiêu học tập và showcase kỹ năng. Nó không chỉ là một project “đẹp trên GitHub”, mà còn có logic rõ ràng và khả năng phát triển ở mức thực tế.

### Điểm mạnh hiện có
- Hệ thống có luồng người dùng rõ ràng
- Có nhiều tính năng của một website thương mại điện tử
- Có tích hợp bảo mật, xác thực, email và thanh toán
- Có khả năng mở rộng theo hướng doanh nghiệp hoặc mobile app

### Những phần tôi muốn cải thiện tiếp
- Chuyển frontend sang React / Next.js
- Tạo REST API rõ ràng hơn
- Thêm unit test và integration test
- Tăng chất lượng UI/UX
- Thiết kế dashboard quản lý doanh thu và khách hàng chuyên nghiệp hơn

---

## 10. Cơ hội phát triển của dự án trong tương lai

Tôi muốn tiếp tục phát triển dự án này theo hướng thực tế và có giá trị hơn. Bởi vì dự án này không chỉ là một bài tập học, mà còn là nền tảng cho một sản phẩm có thể được tái sử dụng, mở rộng và mang lại giá trị trong thực tế.

### 1. Mở rộng ra thị trường lớn hơn
- Hỗ trợ đa ngôn ngữ để phục vụ khách hàng quốc tế
- Tích hợp thanh toán quốc tế như Stripe, PayPal
- Mở rộng quy trình marketing và chăm sóc khách hàng sau bán hàng

### 2. Tăng tính chuyên nghiệp cho doanh nghiệp
- Dashboard báo cáo doanh thu, đơn hàng và sản phẩm bán chạy theo thời gian
- Quản lý kho, tồn kho và giao hàng mạnh hơn
- Hệ thống CRM cơ bản để chăm sóc khách hàng và theo dõi tương tác
- Cải thiện quy trình làm việc cho admin và nhân viên để hệ thống hoạt động ổn định hơn

### 3. Mở rộng sang các nền tảng mới
- Ứng dụng di động cho khách hàng
- Tích hợp thông báo push và cập nhật đơn hàng realtime
- Xây dựng cửa hàng trên mobile để tăng khả năng tiếp cận người dùng

### 4. Nâng cấp kỹ thuật và mô hình phát triển
- Chuyển sang frontend hiện đại như React / Next.js để tăng trải nghiệm người dùng
- Tách backend thành API rõ ràng để dễ tích hợp với mobile, partner và hệ thống khác
- Thêm CI/CD, kiểm thử tự động và môi trường deploy chuyên nghiệp hơn
- Tối ưu architecture để hệ thống có thể phát triển theo hướng scalable và maintainable

### 5. Hướng tới sản phẩm có tiềm năng thương mại thực tế
- Phát triển thêm các tính năng gợi ý sản phẩm theo sở thích khách hàng
- Tích hợp AI để đề xuất sản phẩm phù hợp
- Xây dựng thương hiệu và mô hình kinh doanh bền vững trong ngành handmade, gift và sản phẩm cá nhân hóa

Với tôi, dự án này không chỉ là “một sản phẩm đã xong”, mà là một nền tảng để tôi tiếp tục học thêm, rèn luyện thêm và phát triển theo hướng xây dựng giải pháp phần mềm có giá trị thực tế trong doanh nghiệp.

---

## 11. Vì sao tôi muốn đưa dự án này vào CV?

Vì đây là một dự án thực tế, cho thấy tôi đã làm được những gì sau:

- Xây dựng backend bằng Java Spring Boot
- Làm việc với database và ORM
- Thiết kế hệ thống có logic nghiệp vụ rõ ràng
- Xây dựng chức năng thương mại điện tử thực tế
- Xử lý xác thực, phân quyền, email và thanh toán
- Học cách làm việc với các vấn đề thực tế trong quá trình xây dựng sản phẩm

Khi nhà tuyển dụng đọc CV của tôi, họ không chỉ thấy “Tôi có kiến thức Java”, mà còn thấy “Tôi đã xây dựng được một hệ thống thực tế và đang tiếp tục phát triển.”

Đó là điều tạo nên sự khác biệt.

---

## 12. Hướng phát triển nghề nghiệp của tôi

Tôi muốn hướng tới các vị trí như:

- Java Backend Developer
- Full-stack Developer
- Web Developer

Trong thời gian tới, tôi muốn tiếp tục nâng cao kỹ năng ở các lĩnh vực như:

- Java Spring Boot nâng cao
- REST API
- React / Next.js
- Database design
- Clean Architecture
- Deploy và CI/CD cơ bản

Tôi tin rằng dự án BloomResin là một bước khởi đầu tốt để tôi tiếp tục đi xa hơn trong nghề lập trình.

---

## 13. Thông tin liên hệ

- Họ và tên: Cao Huỳnh Ngọc Như
- GitHub: https://github.com/NgocNhu1824
- Email: bloomresin.system@gmail.com
- Mục tiêu nghề nghiệp: Java Backend Developer / Full-stack Developer / Web Developer

---

Mình viết dự án này không chỉ để khoe kỹ năng, mà còn để thể hiện sự chủ động học hỏi, khả năng xây dựng sản phẩm và tinh thần phát triển trong lĩnh vực lập trình. Đó là điều mà tôi muốn nhà tuyển dụng nhìn thấy khi đọc đến dự án của mình.
