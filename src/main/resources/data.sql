-- =============================================
-- KHỞI TẠO DỮ LIỆU BLOOMRESIN - TRANG SỨC & PHỤ KIỆN HOA ÉP RESIN
-- File này chạy tự động khi ứng dụng khởi động
-- =============================================

-- ===================================
-- 1. ROLES
-- ===================================
INSERT INTO roles (id, name, description) VALUES (1, 'ADMIN', 'Quản trị viên hệ thống');
INSERT INTO roles (id, name, description) VALUES (2, 'EMPLOYEE', 'Nhân viên cửa hàng');
INSERT INTO roles (id, name, description) VALUES (3, 'CUSTOMER', 'Khách hàng');

-- ===================================
-- 2. USERS (Mật khẩu: 123456 - BCrypt encoded verified)
-- BCrypt hash verified for "123456": $2a$10$A/J/WdgP6a.kSHriHbobo.YWIHERHXKQJDJ/FRD0mOxEtiOxJ6TY2
-- ===================================

-- Admin
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (1, 'admin@bloomresin.com', '$2a$10$A/J/WdgP6a.kSHriHbobo.YWIHERHXKQJDJ/FRD0mOxEtiOxJ6TY2',
        'Admin BloomResin', '0901234567', '123 Nguyễn Huệ, Quận 1, TP.HCM', 'nhu.jpg', true, 1);

-- Nhân viên 1
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (2, 'nhanvien1@bloomresin.com', '$2a$10$A/J/WdgP6a.kSHriHbobo.YWIHERHXKQJDJ/FRD0mOxEtiOxJ6TY2',
        'Trần Thị Hoa', '0912345678', '45 Lê Lợi, Quận 1, TP.HCM', '1752858585152_fb.jpg', true, 2);

-- Nhân viên 2
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (3, 'nhanvien2@bloomresin.com', '$2a$10$A/J/WdgP6a.kSHriHbobo.YWIHERHXKQJDJ/FRD0mOxEtiOxJ6TY2',
        'Nguyễn Văn Lâm', '0923456789', '78 Trần Hưng Đạo, Quận 5, TP.HCM', '1752858585152_fb.jpg', true, 2);

-- Khách hàng 1
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (4, 'khachhang1@gmail.com', '$2a$10$A/J/WdgP6a.kSHriHbobo.YWIHERHXKQJDJ/FRD0mOxEtiOxJ6TY2',
        'Lê Thị Mai', '0934567890', '15 Nguyễn Trãi, Quận 5, TP.HCM', 'nhu.jpg', true, 3);

-- Khách hàng 2
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (5, 'khachhang2@gmail.com', '$2a$10$A/J/WdgP6a.kSHriHbobo.YWIHERHXKQJDJ/FRD0mOxEtiOxJ6TY2',
        'Phạm Minh Tuấn', '0945678901', '200 Cách Mạng Tháng 8, Quận 3, TP.HCM', '1752858585152_fb.jpg', true, 3);

-- Khách hàng 3
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (6, 'khachhang3@gmail.com', '$2a$10$A/J/WdgP6a.kSHriHbobo.YWIHERHXKQJDJ/FRD0mOxEtiOxJ6TY2',
        'Hoàng Ngọc Anh', '0956789012', '88 Võ Văn Tần, Quận 3, TP.HCM', 'nhu.jpg', true, 3);

-- ===================================
-- 3. DANH MỤC TRANG SỨC & PHỤ KIỆN RESIN (Categories)
-- ===================================
INSERT INTO categories (id, name, image, status) VALUES (1, 'Dây Chuyền Hoa Resin', 'cat_1.png', true);
INSERT INTO categories (id, name, image, status) VALUES (2, 'Bông Tai Hoa Resin', 'cat_2.png', true);
INSERT INTO categories (id, name, image, status) VALUES (3, 'Nhẫn Hoa Resin', 'cat_3.png', true);
INSERT INTO categories (id, name, image, status) VALUES (4, 'Vòng Tay Hoa Resin', 'cat_4.png', true);
INSERT INTO categories (id, name, image, status) VALUES (5, 'Móc Khóa & Phụ Kiện', 'cat_5.png', true);
INSERT INTO categories (id, name, image, status) VALUES (6, 'Decor & Khay Đồ Resin', 'cat_6.png', true);

-- ===================================
-- 4. SẢN PHẨM TRANG SỨC RESIN (24 sản phẩm với ảnh riêng prod_1.png -> prod_24.png)
-- ===================================

-- === DÂY CHUYỀN HOA RESIN (category_id = 1) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (1, 'Dây chuyền giọt nước hoa hồng baby Resin', 250000, 'prod_1.png',
        'Mặt dây chuyền hình giọt nước đúc từ nhựa Resin cao cấp trong suốt như thủy tinh, bên trong lưu giữ nụ hoa hồng khô mini, hoa baby trắng và vảy dát vàng 18k. Dây đeo hợp kim mạ vàng 18k chống gỉ.',
        'Mặt giọt nước hoa hồng khô mini dát vàng 18k', 30, 12, true, 1, '2025-07-01 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (2, 'Dây chuyền Resin hoa bách nhật & lavender', 280000, 'prod_2.png',
        'Mặt dây chuyền tròn nhựa Resin đúc thủ công với hoa bách nhật tím phớt, nụ lavender khô và nhũ bạc lung linh. Thiết kế nữ tính thanh lịch, quà tặng độc đáo cho người thân yêu.',
        'Mặt tròn hoa bách nhật & nụ lavender ép khô', 20, 8, true, 1, '2025-07-05 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (3, 'Dây chuyền Resin mặt tim hoa cẩm tú cầu', 220000, 'prod_3.png',
        'Mặt dây chuyền hình trái tim bằng Resin lưu giữ cánh hoa cẩm tú cầu xanh pastel ép khô tự nhiên. Kiểu dáng dễ thương, dây xích bạc S925 mảnh mai ngọt ngào.',
        'Mặt trái tim hoa cẩm tú cầu xanh ép Resin', 50, 22, true, 1, '2025-07-10 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (4, 'Dây chuyền resin hoa linh lan & dát vàng', 320000, 'prod_4.png',
        'Vòng cổ mặt hình ovan trong suốt ôm trọn đóa hoa linh lan trắng may mắn và lá dương xỉ mini ép nguyên bản. Phụ kiện mạ vàng cao cấp sang trọng.',
        'Mặt ovan hoa linh lan trắng may mắn dát vàng', 10, 5, true, 1, '2025-07-15 10:00:00', '2025-08-01 10:00:00');

-- === BÔNG TAI HOA RESIN (category_id = 2) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (5, 'Bông tai Resin hoa thắt lưng Forget-Me-Not', 180000, 'prod_5.png',
        'Đôi khuyên tai dáng dài nơ mạ vàng kết hợp mặt lục giác Resin đúc hoa lưu ly (Forget-Me-Not) xanh lam tươi thắm. Chuôi xỏ bạc S925 an toàn cho da nhạy cảm.',
        'Đôi bông tai Resin hoa lưu ly Forget-Me-Not xanh', 40, 18, true, 2, '2025-07-02 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (6, 'Bông tai Resin hình vuông hoa cúc tana', 160000, 'prod_6.png',
        'Bông tai nụ hình vuông đúc nhựa Epoxy trong suốt chứa hoa cúc tana vàng nhung nhỏ nhắn xinh xắn. Khuyên xỏ Titan chống ngứa.',
        'Bông tai nụ hình vuông hoa cúc tana mini', 60, 35, true, 2, '2025-07-08 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (7, 'Bông tai Resin thả dài hoa anh đào khô', 210000, 'prod_7.png',
        'Khuyên tai thả dài phối hạt Resin oval chứa cánh hoa anh đào hồng pastel và xích mảnh mạ vàng 18k tạo vẻ đẹp dịu dàng quyến rũ.',
        'Bông tai thả dài cánh hoa anh đào ép khô', 35, 20, true, 2, '2025-07-12 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (8, 'Bông tai kẹp Resin không cần xỏ hoa cúc họa mi', 190000, 'prod_8.png',
        'Đôi bông tai dạng kẹp vành tai cho người không xỏ lỗ, đúc khuôn Resin tròn với hoa cúc họa mi trắng nhụy vàng.',
        'Bông tai kẹp vành hoa cúc họa mi ép khô', 25, 15, true, 2, '2025-07-18 10:00:00', '2025-08-01 10:00:00');

-- === NHẪN HOA RESIN (category_id = 3) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (9, 'Nhẫn Resin nguyên khối hoa tú cầu tím & dát vàng', 150000, 'prod_9.png',
        'Nhẫn nhựa Resin đúc nguyên khối trong suốt nhẵn mịn, bên trong ép cánh hoa cẩm tú cầu tím nhạt và kim tuyến dát vàng lấp lánh.',
        'Nhẫn đúc Resin nguyên khối hoa tú cầu tím', 20, 10, true, 3, '2025-07-04 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (10, 'Nhẫn Resin hoa bồ công anh tự nhiên', 140000, 'prod_10.png',
        'Nhẫn đúc Resin bắt trọn những sợi lông tơ bồ công anh bung nở tự nhiên. Mang thông điệp hy vọng và tự do.',
        'Nhẫn đúc Resin lưu giữ hạt bồ công anh', 20, 14, true, 3, '2025-07-09 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (11, 'Nhẫn bạc S925 mặt tròn Resin hoa baby đỏ', 260000, 'prod_11.png',
        'Nhẫn chất liệu Bạc S925 đính mặt đá Resin tròn chứa bông hoa baby nhuộm đỏ nồng nàn. Thắt nơ nhẫn điều chỉnh size linh hoạt.',
        'Nhẫn Bạc S925 đính đá Resin hoa baby đỏ', 15, 7, true, 3, '2025-07-14 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (12, 'Nhẫn đôi Resin hoa ép hoang dã handmade', 280000, 'prod_12.png',
        'Cặp nhẫn đôi đúc Resin kết hợp hoa cỏ dại núi rừng Đà Lạt, độ bền vượt trội không phai màu theo thời gian.',
        'Bộ 2 nhẫn đôi Resin hoa dại núi rừng Đà Lạt', 45, 25, true, 3, '2025-07-20 10:00:00', '2025-08-01 10:00:00');

-- === VÒNG TAY HOA RESIN (category_id = 4) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (13, 'Vòng tay bản to Resin hoa dại phối lá dương xỉ', 290000, 'prod_13.png',
        'Vòng đeo tay dạng kiềng đúc Resin bản to 2cm, chứa trọn bộ sưu tập hoa dại rực rỡ sắc màu và lá dương xỉ ép khô thủ công.',
        'Vòng tay kiềng Resin bản to hoa dại đa sắc', 25, 8, true, 4, '2025-07-06 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (14, 'Vòng tay dây rút charm Resin hoa hướng dương mini', 170000, 'prod_14.png',
        'Vòng tay dây vải dệt rút điều chỉnh size gắn hạt charm tròn Resin ép bông hướng dương tí hon mang năng lượng tích cực.',
        'Vòng tay charm Resin hoa hướng dương mini', 30, 6, true, 4, '2025-07-11 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (15, 'Lắc tay bạc phối 5 hạt Resin hoa khô', 340000, 'prod_15.png',
        'Lắc tay Bạc S925 xen kẽ 5 viên đá Resin tròn chứa 5 loại hoa mini khác nhau (hồng, cẩm tú cầu, baby, lavender, forget-me-not).',
        'Lắc tay Bạc S925 đính 5 hạt Resin hoa đúc', 20, 4, true, 4, '2025-07-16 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (16, 'Vòng tay Resin trong suốt vân hoa tuyết', 230000, 'prod_16.png',
        'Vòng kiềng Resin tròn ôm sát cổ tay với hoa cúc trắng nhỏ lăn tăn gợi nhớ bông hoa tuyết mùa đông.',
        'Vòng tay kiềng Resin hoa cúc trắng tuyết', 15, 3, true, 4, '2025-07-22 10:00:00', '2025-08-01 10:00:00');

-- === MÓC KHÓA & PHỤ KIỆN (category_id = 5) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (17, 'Móc khóa Resin chữ cái tên cá nhân hoa anh đào', 120000, 'prod_17.png',
        'Móc chìa khóa / móc treo túi xách hình chữ cái (A-Z) đúc Resin kết hợp hoa anh đào khô, nhũ lá vàng và tua rua lụa cao cấp.',
        'Móc khóa Resin đúc chữ cái hoa anh đào & dát vàng', 50, 30, true, 5, '2025-07-03 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (18, 'Trâm cài tóc Resin hoa mộc lan & ngọc trai', 160000, 'prod_18.png',
        'Phụ kiện trâm cài tóc cổ phong đúc khuôn Resin hoa mộc lan phối hạt ngọc trai nhân tạo duyên dáng tinh tế.',
        'Trâm cài tóc Resin hoa mộc lan phong cách cổ điển', 15, 9, true, 5, '2025-07-07 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (19, 'Bookmark kẹp sách Resin hoa ép tự nhiên', 95000, 'prod_19.png',
        'Thẻ kẹp sách Resin hình chữ nhật trong suốt lưu giữ đóa hoa ép dẹp và dây tua rua vintage cho người yêu sách.',
        'Bookmark kẹp sách Resin hoa khô dây tua rua', 10, 6, true, 5, '2025-07-13 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (20, 'Gương soi mini bỏ túi đúc mặt Resin hoa tươi', 135000, 'prod_20.png',
        'Gương trang điểm gập 2 mặt bỏ túi, mặt ngoài bằng Resin khắc hoa tươi đúc trong suốt chống trầy xước sang trọng.',
        'Gương gập mini đúc mặt Resin hoa tươi xinh xắn', 30, 16, true, 5, '2025-07-19 10:00:00', '2025-08-01 10:00:00');

-- === DECOR & KHAY ĐỒ RESIN (category_id = 6) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (21, 'Bộ 2 khay lót ly lục giác Resin hoa hướng dương', 250000, 'prod_21.png',
        'Bộ 2 miếng lót cốc trà/cà phê hình lục giác làm từ Epoxy Resin đúc hoa hướng dương khô, chịu nhiệt tốt, trang trí bàn làm việc.',
        'Set 2 khay lót ly Resin hình lục giác hoa hướng dương', 35, 28, true, 6, '2025-07-01 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (22, 'Khay đựng trang sức Resin hình lá phong hoa khô', 310000, 'prod_22.png',
        'Khay đựng nhẫn, dây chuyền hình lá phong làm bằng Resin trong đúc hoa cúc, hoa baby và viền dát vàng 18k.',
        'Khay đựng trang sức Resin hình lá dát vàng 18k', 30, 19, true, 6, '2025-07-08 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (23, 'Đèn ngủ khối Resin đúc hoa hồng lưu niệm', 480000, 'prod_23.png',
        'Khối Resin hình lập phương đúc đóa hoa hồng đỏ nguyên vẹn kết hợp đế gỗ có đèn LED vàng ấm áp trang trí phòng ngủ.',
        'Đèn ngủ khối Resin đúc hoa hồng đỏ đế gỗ LED', 20, 13, true, 6, '2025-07-17 10:00:00', '2025-08-01 10:00:00');

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (24, 'Đồng hồ treo tường Resin hoa ép trang trí', 650000, 'prod_24.png',
        'Đồng hồ treo tường nghệ thuật Resin đường kính 30cm đúc hoa dại Đà Lạt và kim đồng hồ trôi êm không gây tiếng ồn.',
        'Đồng hồ Resin treo tường nghệ thuật đúc hoa dại', 40, 21, true, 6, '2025-07-24 10:00:00', '2025-08-01 10:00:00');

-- ===================================
-- 5. TIN TỨC (News - với ảnh riêng news_1.png -> news_6.png)
-- ===================================
INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (1, 'Nghệ thuật lưu giữ ký ức qua trang sức hoa ép Resin',
        'Trang sức hoa Resin là sự kết hợp hoàn hảo giữa vẻ đẹp mỏng mong của hoa tươi ép khô và sự bền vững của nhựa Epoxy Resin.',
        '/images/news/news_1.png', '2025-07-10 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (2, 'Hướng dẫn bảo quản trang sức Resin luôn sáng bóng như mới',
        'Để trang sức hoa Resin giữ được màu sắc rực rỡ: Tránh tiếp xúc trực tiếp với hóa chất tẩy rửa mạnh và ánh nắng gắt kéo dài.',
        '/images/news/news_2.png', '2025-07-15 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (3, 'BloomResin mở lớp Workshop tự tay đúc trang sức hoa khô',
        'Vào mỗi cuối tuần, BloomResin tổ chức workshop đúc dây chuyền và nhẫn hoa Resin cho các bạn trẻ yêu đồ handmade.',
        '/images/news/news_3.png', '2025-07-20 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (4, 'Ý nghĩa các loại hoa ép trong trang sức Resin phong thủy',
        'Mỗi đóa hoa trong trang sức Resin mang một thông điệp: Hoa cẩm tú cầu tượng trưng cho sự biết ơn, Hoa baby đại diện cho tình yêu thuần khiết.',
        '/images/news/news_4.png', '2025-07-25 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (5, 'Món quà tặng cá nhân hóa độc đáo từ hoa cưới kỷ niệm',
        'Dịch vụ ép hoa cưới Resin của BloomResin giúp các cô dâu lưu giữ bó hoa ngày trọng đại thành bộ trang sức kỷ niệm trọn đời.',
        '/images/news/news_5.png', '2025-07-28 10:00:00', true);

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (6, 'Gợi ý phối đồ cùng trang sức hoa Resin phong cách Vintage',
        'Trang sức hoa Resin rất phù hợp với trang phục chất liệu đũi, linen, váy xòe vintage nhẹ nhàng nữ tính.',
        '/images/news/news_6.png', '2025-08-01 10:00:00', true);

-- ===================================
-- 6. ĐƠN HÀNG MẪU (Orders)
-- ===================================
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (1, 4, 'Lê Thị Mai', '15 Nguyễn Trãi, Quận 5, TP.HCM', '0934567890', 'Giao buổi sáng trước 10h', '2025-07-15 10:00:00', 'COMPLETE', 610000, 'COD');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (2, 4, 'Nguyễn Thị Lan', '100 Lý Tự Trọng, Quận 1, TP.HCM', '0967891234', 'Gói quà tặng sinh nhật', '2025-07-20 10:00:00', 'COMPLETE', 440000, 'BANK_TRANSFER');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (3, 5, 'Phạm Minh Tuấn', '200 Cách Mạng Tháng 8, Quận 3, TP.HCM', '0945678901', NULL, '2025-08-01 10:00:00', 'SHIPPING', 480000, 'COD');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (4, 5, 'Trần Thị Hương', '55 Hai Bà Trưng, Quận 1, TP.HCM', '0978901234', 'Giao giờ hành chính', '2025-07-18 10:00:00', 'COMPLETE', 280000, 'COD');

INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (5, 6, 'Hoàng Ngọc Anh', '88 Võ Văn Tần, Quận 3, TP.HCM', '0956789012', 'Gọi trước 30 phút', '2025-08-05 10:00:00', 'PENDING', 250000, 'COD');

-- ===================================
-- 7. CHI TIẾT ĐƠN HÀNG (Order Details)
-- ===================================
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (1, 1, 1, 1, 250000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (2, 1, 5, 2, 180000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (3, 2, 9, 1, 150000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (4, 2, 13, 1, 290000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (5, 3, 23, 1, 480000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (6, 4, 12, 1, 280000);
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (7, 5, 21, 1, 250000);
