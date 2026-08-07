-- =============================================
-- KHỞI TẠO DỮ LIỆU CƠ BẢN CHO BLOOMRESIN
-- File này chạy tự động khi ứng dụng khởi động
-- =============================================

-- ===================================
-- 1. ROLES
-- ===================================
INSERT INTO roles (id, name, description) VALUES (1, 'ADMIN', 'Quản trị viên hệ thống');
INSERT INTO roles (id, name, description) VALUES (2, 'EMPLOYEE', 'Nhân viên cửa hàng');
INSERT INTO roles (id, name, description) VALUES (3, 'CUSTOMER', 'Khách hàng');

-- ===================================
-- 2. USERS (Mật khẩu: 123456 - BCrypt encoded)
-- ===================================

-- Admin
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (1, 'admin@bloomresin.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Admin BloomResin', '0901234567', '123 Nguyễn Huệ, Quận 1, TP.HCM', 'nhu.jpg', true, 1);

-- Nhân viên 1
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (2, 'nhanvien1@bloomresin.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Trần Thị Hoa', '0912345678', '45 Lê Lợi, Quận 1, TP.HCM', '1752858585152_fb.jpg', true, 2);

-- Nhân viên 2
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (3, 'nhanvien2@bloomresin.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Nguyễn Văn Lâm', '0923456789', '78 Trần Hưng Đạo, Quận 5, TP.HCM', '1752858585152_fb.jpg', true, 2);

-- Khách hàng 1
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (4, 'khachhang1@gmail.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Lê Thị Mai', '0934567890', '15 Nguyễn Trãi, Quận 5, TP.HCM', 'nhu.jpg', true, 3);

-- Khách hàng 2
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (5, 'khachhang2@gmail.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Phạm Minh Tuấn', '0945678901', '200 Cách Mạng Tháng 8, Quận 3, TP.HCM', '1752858585152_fb.jpg', true, 3);

-- Khách hàng 3
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (6, 'khachhang3@gmail.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Hoàng Ngọc Anh', '0956789012', '88 Võ Văn Tần, Quận 3, TP.HCM', 'nhu.jpg', true, 3);

-- ===================================
-- 3. DANH MỤC SẢN PHẨM (Categories)
-- ===================================
INSERT INTO categories (id, name, image, status) VALUES (1, 'Hoa Cưới', '1752858767903_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg', true);
INSERT INTO categories (id, name, image, status) VALUES (2, 'Hoa Sinh Nhật', '1752858800398_z6818908563660_b498139a433f58844a743d8d1528aef5.jpg', true);
INSERT INTO categories (id, name, image, status) VALUES (3, 'Hoa Khai Trương', '1752858835348_z6818908524052_7682a58cacf312957f7e771a890c2f4d.jpg', true);
INSERT INTO categories (id, name, image, status) VALUES (4, 'Hoa Chia Buồn', '1752858888403_z6818908524071_9555a793dcdc6c74c9177b902d4242d1.jpg', true);
INSERT INTO categories (id, name, image, status) VALUES (5, 'Hoa Tình Yêu', '1752856843414_1.jpg', true);
INSERT INTO categories (id, name, image, status) VALUES (6, 'Hoa Tốt Nghiệp', '1752858767903_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg', true);

-- ===================================
-- 4. SẢN PHẨM (24 sản phẩm - 4 mỗi danh mục)
-- ===================================

-- === HOA CƯỚI (category_id = 1) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (1, 'Hoa cưới cầm tay cô dâu pastel', 550000, '1752858983429_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó hoa cưới cầm tay thiết kế theo phong cách Hàn Quốc, sử dụng hoa hồng pastel kết hợp cẩm tú cầu xanh và lá eucalyptus.',
        'Bó hoa cưới phong cách Hàn Quốc', 30, 12, true, 1, '2025-07-01 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (2, 'Hoa cưới cascade hồng trắng', 750000, '1752859099573_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Hoa cưới dạng thác nước (cascade) sang trọng, sử dụng hoa hồng trắng David Austin, hoa lan hồ điệp trắng.',
        'Hoa cưới cascade cổ điển', 20, 8, true, 1, '2025-07-05 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (3, 'Hoa cài áo chú rể', 120000, '1752859163812_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Hoa cài áo vest chú rể gồm 1 bông hoa hồng nhỏ kết hợp lá bạc và baby trắng.',
        'Hoa cài áo chú rể mini', 50, 22, true, 1, '2025-07-10 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (4, 'Cổng hoa cưới trọn gói', 3500000, '1752859549485_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Cổng hoa cưới trang trí bằng hoa hồng đỏ, hoa cẩm tú cầu xanh, hoa lan trắng và lá xanh tự nhiên.',
        'Cổng hoa cưới full dịch vụ', 10, 5, true, 1, '2025-07-15 10:00:00', '2025-08-01 10:00:00');

-- === HOA SINH NHẬT (category_id = 2) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (5, 'Giỏ hoa sinh nhật pastel', 280000, '1752860068720_z6818908524047_419121de94065e1cc77e4741d6e0ca3c.jpg',
        'Giỏ hoa sinh nhật tông màu pastel nhẹ nhàng, bao gồm hoa cát tường hồng, hoa cúc calimero, hoa baby trắng.',
        'Giỏ hoa pastel tặng sinh nhật', 40, 18, true, 2, '2025-07-02 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (6, 'Hộp hoa hồng sáp thơm', 250000, '1752862185469_z6818908544442_3fad0c450aba6f22563d7519bea9a136.jpg',
        'Hộp quà hoa hồng sáp thơm 16 bông, màu sắc đa dạng (đỏ, hồng, tím, xanh).',
        'Hộp 16 hoa hồng sáp thơm', 60, 35, true, 2, '2025-07-08 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (7, 'Bó hoa hướng dương rạng rỡ', 320000, '1752862273286_z6818908524071_9555a793dcdc6c74c9177b902d4242d1.jpg',
        'Bó 7 bông hoa hướng dương Đà Lạt tươi, kết hợp hoa cúc vàng nhỏ và lá xanh.',
        'Bó 7 hướng dương Đà Lạt', 35, 20, true, 2, '2025-07-12 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (8, 'Bánh kem hoa tươi combo', 650000, '1752862338471_z6818908524052_7682a58cacf312957f7e771a890c2f4d.jpg',
        'Combo quà sinh nhật gồm bánh kem tròn 20cm kết hợp bó hoa tươi mini 5 bông hồng pastel.',
        'Combo bánh kem + hoa tươi', 25, 15, true, 2, '2025-07-18 10:00:00', '2025-08-01 10:00:00');

-- === HOA KHAI TRƯƠNG (category_id = 3) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (9, 'Kệ hoa khai trương hoành tráng', 1200000, '1752862868100_z6818908563660_b498139a433f58844a743d8d1528aef5.jpg',
        'Kệ hoa khai trương 3 tầng cao 1.8m, sử dụng hoa lan mokara, hoa hồng đỏ, hoa đồng tiền vàng.',
        'Kệ hoa khai trương 3 tầng', 20, 10, true, 3, '2025-07-04 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (10, 'Lẵng hoa lily trắng sang trọng', 550000, '1752858983429_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Lẵng hoa lily trắng tinh khôi gồm 10 cành lily tươi, kết hợp lá monstera và lá dương xỉ.',
        'Lẵng hoa lily trắng 10 cành', 20, 14, true, 3, '2025-07-09 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (11, 'Chậu lan hồ điệp 10 cành', 1800000, '1752859099573_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Chậu lan hồ điệp 10 cành màu tím, trồng trong chậu sứ trắng có đĩa lót. Hoa nhập khẩu Đài Loan.',
        'Chậu lan hồ điệp 10 cành', 15, 7, true, 3, '2025-07-14 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (12, 'Bình hoa để bàn văn phòng', 380000, '1752859163812_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bình hoa để bàn nhỏ gọn gồm hoa cẩm chướng hồng, hoa cúc trắng và hoa baby.',
        'Bình hoa để bàn mini', 45, 25, true, 3, '2025-07-20 10:00:00', '2025-08-01 10:00:00');

-- === HOA CHIA BUỒN (category_id = 4) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (13, 'Vòng hoa chia buồn trang trọng', 450000, '1752859549485_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Vòng hoa chia buồn đường kính 80cm, sử dụng hoa cúc trắng, hoa huệ trắng và lá xanh.',
        'Vòng hoa tang lễ trang trọng', 25, 8, true, 4, '2025-07-06 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (14, 'Lẵng hoa chia buồn trắng vàng', 380000, '1752860068720_z6818908524047_419121de94065e1cc77e4741d6e0ca3c.jpg',
        'Lẵng hoa chia buồn tone trắng vàng, gồm hoa cúc trắng, hoa lan vàng và lá dương xỉ xanh.',
        'Lẵng hoa chia buồn trắng vàng', 30, 6, true, 4, '2025-07-11 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (15, 'Hoa chia buồn hình trái tim', 600000, '1752862185469_z6818908544442_3fad0c450aba6f22563d7519bea9a136.jpg',
        'Vòng hoa chia buồn hình trái tim, làm từ hoa cúc trắng và hoa hồng trắng.',
        'Vòng hoa hình trái tim', 20, 4, true, 4, '2025-07-16 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (16, 'Kệ hoa tang lễ 2 tầng', 850000, '1752862273286_z6818908524071_9555a793dcdc6c74c9177b902d4242d1.jpg',
        'Kệ hoa tang lễ 2 tầng cao 1.5m, sử dụng hoa cúc trắng, hoa lan trắng, hoa huệ và lá xanh.',
        'Kệ hoa tang lễ 2 tầng', 15, 3, true, 4, '2025-07-22 10:00:00', '2025-08-01 10:00:00');

-- === HOA TÌNH YÊU (category_id = 5) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (17, 'Bó hoa hồng đỏ 20 bông', 350000, '1752862338471_z6818908524052_7682a58cacf312957f7e771a890c2f4d.jpg',
        'Bó 20 bông hoa hồng đỏ Đà Lạt tươi, được gói bằng giấy kraft cao cấp màu đen, buộc nơ satin đỏ.',
        'Bó 20 hoa hồng đỏ Đà Lạt', 50, 30, true, 5, '2025-07-03 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (18, 'Bó hoa tulip hồng nhập khẩu', 420000, '1752862868100_z6818908563660_b498139a433f58844a743d8d1528aef5.jpg',
        'Bó 15 hoa tulip hồng nhập khẩu Hà Lan, gói giấy Hàn Quốc tone pastel, buộc nơ lụa hồng.',
        'Bó 15 tulip hồng nhập khẩu', 15, 9, true, 5, '2025-07-07 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (19, 'Hộp hoa hồng 99 bông', 1500000, '1752858983429_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Hộp hoa hồng 99 bông Ecuador nhập khẩu, màu đỏ thắm. Hộp tròn đen sang trọng đường kính 40cm.',
        'Hộp 99 hồng Ecuador', 10, 6, true, 5, '2025-07-13 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (20, 'Bó hoa mix tình yêu', 480000, '1752859099573_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó hoa mix đa sắc gồm hoa hồng đỏ, hoa cát tường tím, hoa baby trắng và lá bạc.',
        'Bó hoa mix lãng mạn', 30, 16, true, 5, '2025-07-19 10:00:00', '2025-08-01 10:00:00');

-- === HOA TỐT NGHIỆP (category_id = 6) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (21, 'Bó hoa hướng dương tốt nghiệp', 300000, '1752859163812_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó 10 bông hoa hướng dương Đà Lạt rực rỡ, kết hợp lá xanh và hoa baby trắng.',
        'Bó hướng dương tốt nghiệp', 35, 28, true, 6, '2025-07-01 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (22, 'Bó hoa hồng tốt nghiệp kèm gấu', 400000, '1752859549485_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó 12 hoa hồng phấn Đà Lạt kèm gấu bông mini 20cm. Gói giấy Hàn Quốc tone hồng pastel.',
        'Bó hồng tốt nghiệp kèm gấu bông', 30, 19, true, 6, '2025-07-08 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (23, 'Bó hoa tiền tốt nghiệp', 500000, '1752860068720_z6818908524047_419121de94065e1cc77e4741d6e0ca3c.jpg',
        'Bó hoa sáng tạo làm từ tiền polymer 500đ (20 tờ) kết hợp hoa hồng sáp 5 bông.',
        'Bó hoa tiền sáng tạo', 20, 13, true, 6, '2025-07-17 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (24, 'Giỏ hoa tốt nghiệp hỗn hợp', 350000, '1752862185469_z6818908544442_3fad0c450aba6f22563d7519bea9a136.jpg',
        'Giỏ hoa tốt nghiệp gồm hoa cát tường trắng, hoa cúc tana vàng, hoa hồng cam.',
        'Giỏ hoa tốt nghiệp hỗn hợp', 40, 21, true, 6, '2025-07-24 10:00:00', '2025-08-01 10:00:00');

-- ===================================
-- 5. TIN TỨC (News)
-- ===================================
INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (1, 'Xu hướng hoa cưới 2025: Phong cách tối giản lên ngôi',
        'Năm 2025, xu hướng hoa cưới chuyển sang phong cách tối giản (minimalist) với những bó hoa nhỏ gọn nhưng tinh tế.',
        '04a93a29-2cf6-42d7-a308-fc90cace4ca8-muahang.jpg', '2025-07-10 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (2, 'Cách chăm sóc hoa tươi để giữ lâu hơn',
        'Để hoa tươi giữ được lâu hơn, bạn cần lưu ý: Cắt vát gốc hoa 45 độ trước khi cắm vào bình nước sạch.',
        'ee28504f-de64-4618-b852-f21d4ea59a05-thanhtoan.jpg', '2025-07-15 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (3, 'BloomResin khai trương chi nhánh mới tại Quận 7',
        'Chúng tôi vui mừng thông báo BloomResin chính thức khai trương chi nhánh mới tại 456 Nguyễn Thị Thập, Quận 7.',
        '1dd1c657-8b24-4b64-b3c4-9624a6965e6c-CaoHuynhNgocNhu_CE181233.jpg', '2025-07-20 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (4, 'Ý nghĩa các loại hoa phổ biến bạn nên biết',
        'Mỗi loại hoa đều mang một ý nghĩa riêng: Hoa hồng đỏ - Tình yêu nồng cháy. Hoa hồng trắng - Sự thuần khiết.',
        '28470519-2a1a-406c-91fd-fe8534968f37-CaoHuynhNgocNhu_CE181233.jpg', '2025-07-25 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (5, 'Mùa tốt nghiệp 2025: Những mẫu hoa được yêu thích nhất',
        'Mùa tốt nghiệp 2025 đang đến gần! Tại BloomResin, các mẫu hoa bán chạy nhất cho dịp này bao gồm bó hoa hướng dương.',
        '04a93a29-2cf6-42d7-a308-fc90cace4ca8-muahang.jpg', '2025-07-28 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (6, 'Workshop cắm hoa miễn phí tại BloomResin',
        'BloomResin tổ chức workshop cắm hoa miễn phí vào mỗi Chủ nhật cuối tháng tại cửa hàng chính 123 Nguyễn Huệ.',
        'ee28504f-de64-4618-b852-f21d4ea59a05-thanhtoan.jpg', '2025-08-01 10:00:00', true);

-- ===================================
-- 6. ĐƠN HÀNG MẪU (Orders)
-- ===================================
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (1, 4, 'Lê Thị Mai', '15 Nguyễn Trãi, Quận 5, TP.HCM', '0934567890', 'Giao buổi sáng trước 10h', '2025-07-15 10:00:00', 'COMPLETE', 900000, 'COD');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (2, 4, 'Nguyễn Thị Lan', '100 Lý Tự Trọng, Quận 1, TP.HCM', '0967891234', 'Tặng mẹ sinh nhật', '2025-07-20 10:00:00', 'COMPLETE', 530000, 'BANK_TRANSFER');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (3, 5, 'Phạm Minh Tuấn', '200 Cách Mạng Tháng 8, Quận 3, TP.HCM', '0945678901', NULL, '2025-08-01 10:00:00', 'SHIPPING', 1200000, 'COD');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (4, 5, 'Trần Thị Hương', '55 Hai Bà Trưng, Quận 1, TP.HCM', '0978901234', 'Giao giờ hành chính', '2025-07-18 10:00:00', 'COMPLETE', 700000, 'COD');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (5, 6, 'Hoàng Ngọc Anh', '88 Võ Văn Tần, Quận 3, TP.HCM', '0956789012', 'Gọi trước 30 phút', '2025-08-05 10:00:00', 'PENDING', 480000, 'COD');

-- ===================================
-- 7. CHI TIẾT ĐƠN HÀNG (Order Details)
-- ===================================
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (1, 1, 1, 1, 550000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (2, 1, 3, 3, 120000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (3, 2, 5, 1, 280000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (4, 2, 6, 1, 250000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (5, 3, 9, 1, 1200000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (6, 4, 2, 1, 750000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (7, 5, 20, 1, 480000);
