-- =============================================
-- KHỞI TẠO DỮ LIỆU CƠ BẢN CHO BLOOMRESIN
-- File này chạy tự động khi ứng dụng khởi động
-- Sử dụng ON CONFLICT DO NOTHING để idempotent
-- =============================================

-- ===================================
-- 1. ROLES
-- ===================================
INSERT INTO roles (id, name, description) VALUES (1, 'ADMIN', 'Quản trị viên hệ thống') ON CONFLICT (id) DO NOTHING;
INSERT INTO roles (id, name, description) VALUES (2, 'EMPLOYEE', 'Nhân viên cửa hàng') ON CONFLICT (id) DO NOTHING;
INSERT INTO roles (id, name, description) VALUES (3, 'CUSTOMER', 'Khách hàng') ON CONFLICT (id) DO NOTHING;

-- ===================================
-- 2. USERS (Mật khẩu: 123456 - BCrypt encoded)
-- BCrypt hash cho "123456": $2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy
-- ===================================

-- Admin
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (1, 'admin@bloomresin.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Admin BloomResin', '0901234567', '123 Nguyễn Huệ, Quận 1, TP.HCM', 'nhu.jpg', true, 1)
ON CONFLICT (id) DO NOTHING;

-- Nhân viên 1
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (2, 'nhanvien1@bloomresin.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Trần Thị Hoa', '0912345678', '45 Lê Lợi, Quận 1, TP.HCM', '1752858585152_fb.jpg', true, 2)
ON CONFLICT (id) DO NOTHING;

-- Nhân viên 2
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (3, 'nhanvien2@bloomresin.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Nguyễn Văn Lâm', '0923456789', '78 Trần Hưng Đạo, Quận 5, TP.HCM', '1752858585152_fb.jpg', true, 2)
ON CONFLICT (id) DO NOTHING;

-- Khách hàng 1
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (4, 'khachhang1@gmail.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Lê Thị Mai', '0934567890', '15 Nguyễn Trãi, Quận 5, TP.HCM', 'nhu.jpg', true, 3)
ON CONFLICT (id) DO NOTHING;

-- Khách hàng 2
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (5, 'khachhang2@gmail.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Phạm Minh Tuấn', '0945678901', '200 Cách Mạng Tháng 8, Quận 3, TP.HCM', '1752858585152_fb.jpg', true, 3)
ON CONFLICT (id) DO NOTHING;

-- Khách hàng 3
INSERT INTO users (id, email, password, full_name, phone, address, avatar, status, role_id)
VALUES (6, 'khachhang3@gmail.com', '$2a$10$dXJ3SW6G7P50lGmMQUENv.UReT3p3PBtR.VLmXkgF1MHdcJvGx3Gy',
        'Hoàng Ngọc Anh', '0956789012', '88 Võ Văn Tần, Quận 3, TP.HCM', 'nhu.jpg', true, 3)
ON CONFLICT (id) DO NOTHING;

-- ===================================
-- 3. DANH MỤC SẢN PHẨM (Categories)
-- ===================================
INSERT INTO categories (id, name, image, status) VALUES (1, 'Hoa Cưới', '1752858767903_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO categories (id, name, image, status) VALUES (2, 'Hoa Sinh Nhật', '1752858800398_z6818908563660_b498139a433f58844a743d8d1528aef5.jpg', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO categories (id, name, image, status) VALUES (3, 'Hoa Khai Trương', '1752858835348_z6818908524052_7682a58cacf312957f7e771a890c2f4d.jpg', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO categories (id, name, image, status) VALUES (4, 'Hoa Chia Buồn', '1752858888403_z6818908524071_9555a793dcdc6c74c9177b902d4242d1.jpg', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO categories (id, name, image, status) VALUES (5, 'Hoa Tình Yêu', '1752856843414_1.jpg', true) ON CONFLICT (id) DO NOTHING;
INSERT INTO categories (id, name, image, status) VALUES (6, 'Hoa Tốt Nghiệp', '1752858767903_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg', true) ON CONFLICT (id) DO NOTHING;

-- ===================================
-- 4. SẢN PHẨM (24 sản phẩm - 4 mỗi danh mục)
-- ===================================

-- === HOA CƯỚI (category_id = 1) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (1, 'Hoa cưới cầm tay cô dâu pastel', 550000, '1752858983429_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó hoa cưới cầm tay thiết kế theo phong cách Hàn Quốc, sử dụng hoa hồng pastel kết hợp cẩm tú cầu xanh và lá eucalyptus. Buộc nơ lụa trắng tinh tế, phù hợp cho ngày trọng đại. Hoa được tuyển chọn tươi mới từ Đà Lạt, đảm bảo giữ form đẹp suốt buổi lễ.',
        'Bó hoa cưới phong cách Hàn Quốc', 30, 12, true, 1, NOW() - INTERVAL '30 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (2, 'Hoa cưới cascade hồng trắng', 750000, '1752859099573_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Hoa cưới dạng thác nước (cascade) sang trọng, sử dụng hoa hồng trắng David Austin, hoa lan hồ điệp trắng và dây leo xanh tự nhiên. Thiết kế cổ điển phương Tây, tạo điểm nhấn thanh lịch cho bộ váy cưới. Đi kèm ghim cài và dây buộc chắc chắn.',
        'Hoa cưới cascade cổ điển', 20, 8, true, 1, NOW() - INTERVAL '25 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (3, 'Hoa cài áo chú rể', 120000, '1752859163812_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Hoa cài áo vest chú rể gồm 1 bông hoa hồng nhỏ kết hợp lá bạc và baby trắng. Kích thước nhỏ gọn, không làm nặng áo. Được gắn ghim an toàn phía sau. Có thể đặt theo màu sắc phù hợp với theme cưới.',
        'Hoa cài áo chú rể mini', 50, 22, true, 1, NOW() - INTERVAL '20 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (4, 'Cổng hoa cưới trọn gói', 3500000, '1752859549485_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Cổng hoa cưới trang trí bằng hoa hồng đỏ, hoa cẩm tú cầu xanh, hoa lan trắng và lá xanh tự nhiên. Khung sắt chắc chắn cao 2.5m, rộng 2m. Bao gồm dịch vụ vận chuyển, lắp đặt và thu dọn sau tiệc cưới tại nội thành TP.HCM.',
        'Cổng hoa cưới full dịch vụ', 10, 5, true, 1, NOW() - INTERVAL '15 days', NOW())
ON CONFLICT (id) DO NOTHING;

-- === HOA SINH NHẬT (category_id = 2) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (5, 'Giỏ hoa sinh nhật pastel', 280000, '1752860068720_z6818908524047_419121de94065e1cc77e4741d6e0ca3c.jpg',
        'Giỏ hoa sinh nhật tông màu pastel nhẹ nhàng, bao gồm hoa cát tường hồng, hoa cúc calimero, hoa baby trắng và lá xanh. Giỏ mây tự nhiên handmade. Đi kèm thiệp chúc mừng sinh nhật viết tay theo yêu cầu.',
        'Giỏ hoa pastel tặng sinh nhật', 40, 18, true, 2, NOW() - INTERVAL '28 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (6, 'Hộp hoa hồng sáp thơm', 250000, '1752862185469_z6818908544442_3fad0c450aba6f22563d7519bea9a136.jpg',
        'Hộp quà hoa hồng sáp thơm 16 bông, màu sắc đa dạng (đỏ, hồng, tím, xanh). Hoa sáp không héo úa, giữ được mùi thơm nhẹ nhàng trong 6-12 tháng. Hộp carton cứng bọc nhung đỏ sang trọng. Quà tặng ý nghĩa cho các dịp sinh nhật, valentine, kỷ niệm.',
        'Hộp 16 hoa hồng sáp thơm', 60, 35, true, 2, NOW() - INTERVAL '22 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (7, 'Bó hoa hướng dương rạng rỡ', 320000, '1752862273286_z6818908524071_9555a793dcdc6c74c9177b902d4242d1.jpg',
        'Bó 7 bông hoa hướng dương Đà Lạt tươi, kết hợp hoa cúc vàng nhỏ và lá xanh. Gói giấy kraft nâu phong cách rustic, buộc dây thừng. Tượng trưng cho niềm vui, sự lạc quan và tình bạn đẹp. Phù hợp tặng sinh nhật bạn bè, đồng nghiệp.',
        'Bó 7 hướng dương Đà Lạt', 35, 20, true, 2, NOW() - INTERVAL '18 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (8, 'Bánh kem hoa tươi combo', 650000, '1752862338471_z6818908524052_7682a58cacf312957f7e771a890c2f4d.jpg',
        'Combo quà sinh nhật gồm bánh kem tròn 20cm (vị socola hoặc dâu) kết hợp bó hoa tươi mini 5 bông hồng pastel. Đi kèm nến sinh nhật, thiệp chúc mừng và túi giấy. Giao hàng đúng giờ yêu cầu. Đặt trước ít nhất 4 tiếng.',
        'Combo bánh kem + hoa tươi', 25, 15, true, 2, NOW() - INTERVAL '12 days', NOW())
ON CONFLICT (id) DO NOTHING;

-- === HOA KHAI TRƯƠNG (category_id = 3) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (9, 'Kệ hoa khai trương hoành tráng', 1200000, '1752862868100_z6818908563660_b498139a433f58844a743d8d1528aef5.jpg',
        'Kệ hoa khai trương 3 tầng cao 1.8m, sử dụng hoa lan mokara, hoa hồng đỏ, hoa đồng tiền vàng và lá dương xỉ. Khung sắt sơn tĩnh điện bền đẹp. Kèm banner chúc mừng khai trương in tên công ty. Giao hàng miễn phí nội thành TP.HCM, Hà Nội.',
        'Kệ hoa khai trương 3 tầng', 20, 10, true, 3, NOW() - INTERVAL '26 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (10, 'Lẵng hoa lily trắng sang trọng', 550000, '1752858983429_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Lẵng hoa lily trắng tinh khôi gồm 10 cành lily tươi, kết hợp lá monstera và lá dương xỉ. Lẵng gốm trắng cao cấp. Phù hợp đặt bàn tiếp khách, tặng khai trương văn phòng, phòng khám hoặc showroom. Hoa tươi giữ được 7-10 ngày.',
        'Lẵng hoa lily trắng 10 cành', 20, 14, true, 3, NOW() - INTERVAL '21 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (11, 'Chậu lan hồ điệp 10 cành', 1800000, '1752859099573_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Chậu lan hồ điệp 10 cành màu tím (hoặc trắng/vàng theo yêu cầu), trồng trong chậu sứ trắng có đĩa lót. Hoa nhập khẩu Đài Loan, cành dài 60-70cm, mỗi cành 8-12 bông. Tượng trưng cho sự thịnh vượng và may mắn. Kèm thiệp chúc mừng.',
        'Chậu lan hồ điệp 10 cành', 15, 7, true, 3, NOW() - INTERVAL '16 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (12, 'Bình hoa để bàn văn phòng', 380000, '1752859163812_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bình hoa để bàn nhỏ gọn gồm hoa cẩm chướng hồng, hoa cúc trắng và hoa baby. Bình thủy tinh trong suốt cao 20cm. Phù hợp trang trí bàn làm việc, quầy lễ tân hoặc phòng họp. Có thể đặt theo tuần với giá ưu đãi.',
        'Bình hoa để bàn mini', 45, 25, true, 3, NOW() - INTERVAL '10 days', NOW())
ON CONFLICT (id) DO NOTHING;

-- === HOA CHIA BUỒN (category_id = 4) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (13, 'Vòng hoa chia buồn trang trọng', 450000, '1752859549485_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Vòng hoa chia buồn đường kính 80cm, sử dụng hoa cúc trắng, hoa huệ trắng và lá xanh. Kèm dải băng tang lễ in chữ theo yêu cầu (tối đa 30 ký tự). Khung vòng chắc chắn, có chân đứng. Giao hàng nhanh trong 2 giờ tại nội thành.',
        'Vòng hoa tang lễ trang trọng', 25, 8, true, 4, NOW() - INTERVAL '24 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (14, 'Lẵng hoa chia buồn trắng vàng', 380000, '1752860068720_z6818908524047_419121de94065e1cc77e4741d6e0ca3c.jpg',
        'Lẵng hoa chia buồn tone trắng vàng, gồm hoa cúc trắng, hoa lan vàng và lá dương xỉ xanh. Lẵng mây cao 40cm. Phù hợp đặt tại bàn thờ hoặc nhà tang lễ. Thiết kế trang nhã, thể hiện sự tôn kính và tiếc thương.',
        'Lẵng hoa chia buồn trắng vàng', 30, 6, true, 4, NOW() - INTERVAL '19 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (15, 'Hoa chia buồn hình trái tim', 600000, '1752862185469_z6818908544442_3fad0c450aba6f22563d7519bea9a136.jpg',
        'Vòng hoa chia buồn hình trái tim, làm từ hoa cúc trắng và hoa hồng trắng. Kích thước 70x70cm, có chân đứng inox. Kèm dải băng tang lễ in tên. Thiết kế thể hiện tình cảm sâu sắc dành cho người đã mất.',
        'Vòng hoa hình trái tim', 20, 4, true, 4, NOW() - INTERVAL '14 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (16, 'Kệ hoa tang lễ 2 tầng', 850000, '1752862273286_z6818908524071_9555a793dcdc6c74c9177b902d4242d1.jpg',
        'Kệ hoa tang lễ 2 tầng cao 1.5m, sử dụng hoa cúc trắng, hoa lan trắng, hoa huệ và lá xanh. Khung sắt sơn trắng, kèm dải băng tang lễ. Phù hợp cho tang lễ trang trọng. Miễn phí vận chuyển và lắp đặt nội thành.',
        'Kệ hoa tang lễ 2 tầng', 15, 3, true, 4, NOW() - INTERVAL '8 days', NOW())
ON CONFLICT (id) DO NOTHING;

-- === HOA TÌNH YÊU (category_id = 5) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (17, 'Bó hoa hồng đỏ 20 bông', 350000, '1752862338471_z6818908524052_7682a58cacf312957f7e771a890c2f4d.jpg',
        'Bó 20 bông hoa hồng đỏ Đà Lạt tươi, được gói bằng giấy kraft cao cấp màu đen, buộc nơ satin đỏ. Hoa hồng được chọn lọc cành dài 50-60cm, bông to đều. Tượng trưng cho tình yêu nồng cháy. Phù hợp tặng Valentine, kỷ niệm ngày yêu, cầu hôn.',
        'Bó 20 hoa hồng đỏ Đà Lạt', 50, 30, true, 5, NOW() - INTERVAL '27 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (18, 'Bó hoa tulip hồng nhập khẩu', 420000, '1752862868100_z6818908563660_b498139a433f58844a743d8d1528aef5.jpg',
        'Bó 15 hoa tulip hồng nhập khẩu Hà Lan, gói giấy Hàn Quốc tone pastel, buộc nơ lụa hồng. Hoa tulip tươi, cánh dày, màu hồng phấn nhẹ nhàng. Tượng trưng cho sự duyên dáng và tình yêu hoàn hảo. Thích hợp tặng bạn gái, mẹ hoặc chị em.',
        'Bó 15 tulip hồng nhập khẩu', 15, 9, true, 5, NOW() - INTERVAL '23 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (19, 'Hộp hoa hồng 99 bông', 1500000, '1752858983429_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Hộp hoa hồng 99 bông Ecuador nhập khẩu, màu đỏ thắm. Hộp tròn đen sang trọng đường kính 40cm. Số 99 tượng trưng cho tình yêu vĩnh cửu. Kèm thiệp tình yêu handmade và túi giấy cao cấp. Đặt trước 24 giờ. Sản phẩm bán chạy nhất dịp Valentine.',
        'Hộp 99 hồng Ecuador', 10, 6, true, 5, NOW() - INTERVAL '17 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (20, 'Bó hoa mix tình yêu', 480000, '1752859099573_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó hoa mix đa sắc gồm hoa hồng đỏ, hoa cát tường tím, hoa baby trắng và lá bạc. Gói giấy organza trắng trong suốt, buộc nơ đỏ. Thiết kế lãng mạn, phù hợp tỏ tình, xin lỗi hoặc làm surprise cho người yêu.',
        'Bó hoa mix lãng mạn', 30, 16, true, 5, NOW() - INTERVAL '11 days', NOW())
ON CONFLICT (id) DO NOTHING;

-- === HOA TỐT NGHIỆP (category_id = 6) ===
INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (21, 'Bó hoa hướng dương tốt nghiệp', 300000, '1752859163812_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó 10 bông hoa hướng dương Đà Lạt rực rỡ, kết hợp lá xanh và hoa baby trắng. Gói giấy kraft vàng tươi, buộc nơ xanh navy. Tượng trưng cho sự thành công, tương lai tươi sáng và luôn hướng về phía mặt trời. Quà tặng ý nghĩa cho ngày lễ tốt nghiệp.',
        'Bó hướng dương tốt nghiệp', 35, 28, true, 6, NOW() - INTERVAL '29 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (22, 'Bó hoa hồng tốt nghiệp kèm gấu', 400000, '1752859549485_z6818908577342_239681e6dd0a3f8f5551923ebf164479.jpg',
        'Bó 12 hoa hồng phấn Đà Lạt kèm gấu bông mini 20cm. Gói giấy Hàn Quốc tone hồng pastel, buộc nơ lụa. Combo quà tặng dễ thương cho bạn bè, người yêu hoặc em gái nhân ngày tốt nghiệp. Có thể chọn màu hoa theo yêu cầu.',
        'Bó hồng tốt nghiệp kèm gấu bông', 30, 19, true, 6, NOW() - INTERVAL '22 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (23, 'Bó hoa tiền tốt nghiệp', 500000, '1752860068720_z6818908524047_419121de94065e1cc77e4741d6e0ca3c.jpg',
        'Bó hoa sáng tạo làm từ tiền polymer 500đ (20 tờ) kết hợp hoa hồng sáp 5 bông và hoa khô trang trí. Gói giấy đen-vàng sang trọng. Ý nghĩa "chúc giàu sang phú quý" cho người mới ra trường. Quà tặng độc đáo, viral trên mạng xã hội.',
        'Bó hoa tiền sáng tạo', 20, 13, true, 6, NOW() - INTERVAL '13 days', NOW())
ON CONFLICT (id) DO NOTHING;

INSERT INTO products (id, name, price, image, detail_desc, short_desc, quantity, sold, status, category_id, created_at, updated_at)
VALUES (24, 'Giỏ hoa tốt nghiệp hỗn hợp', 350000, '1752862185469_z6818908544442_3fad0c450aba6f22563d7519bea9a136.jpg',
        'Giỏ hoa tốt nghiệp gồm hoa cát tường trắng, hoa cúc tana vàng, hoa hồng cam và lá eucalyptus. Giỏ mây handmade nhỏ gọn, dễ cầm khi chụp hình. Đi kèm thiệp chúc mừng tốt nghiệp viết tay. Phù hợp cho mọi buổi lễ tốt nghiệp.',
        'Giỏ hoa tốt nghiệp hỗn hợp', 40, 21, true, 6, NOW() - INTERVAL '7 days', NOW())
ON CONFLICT (id) DO NOTHING;

-- ===================================
-- 5. TIN TỨC (News)
-- ===================================
INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (1,
        'Xu hướng hoa cưới 2025: Phong cách tối giản lên ngôi',
        'Năm 2025, xu hướng hoa cưới chuyển sang phong cách tối giản (minimalist) với những bó hoa nhỏ gọn nhưng tinh tế. Các loại hoa được ưa chuộng bao gồm hoa hồng David Austin, hoa mẫu đơn và hoa cát tường. Tông màu chủ đạo là trắng kem, hồng phấn và xanh sage. Nhiều cô dâu cũng chọn hoa khô hoặc hoa preserved để giữ làm kỷ niệm sau lễ cưới. BloomResin luôn cập nhật xu hướng mới nhất để mang đến cho bạn những bó hoa cưới đẹp nhất.',
        '04a93a29-2cf6-42d7-a308-fc90cace4ca8-muahang.jpg', NOW() - INTERVAL '25 days', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (2,
        'Cách chăm sóc hoa tươi để giữ lâu hơn',
        'Để hoa tươi giữ được lâu hơn, bạn cần lưu ý: 1) Cắt vát gốc hoa 45 độ trước khi cắm vào bình nước sạch. 2) Thay nước mỗi ngày và rửa sạch bình. 3) Thêm 1 thìa đường hoặc vài giọt nước chanh vào nước để cung cấp dinh dưỡng. 4) Đặt hoa ở nơi thoáng mát, tránh ánh nắng trực tiếp và gió điều hòa. 5) Tỉa bỏ lá úa và cành héo hàng ngày. Với những mẹo đơn giản này, hoa tươi của bạn có thể giữ đẹp từ 7-14 ngày.',
        'ee28504f-de64-4618-b852-f21d4ea59a05-thanhtoan.jpg', NOW() - INTERVAL '20 days', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (3,
        'BloomResin khai trương chi nhánh mới tại Quận 7',
        'Chúng tôi vui mừng thông báo BloomResin chính thức khai trương chi nhánh mới tại 456 Nguyễn Thị Thập, Quận 7, TP.HCM. Chi nhánh mới hoạt động từ 7h-21h hàng ngày, phục vụ đầy đủ các dịch vụ: bán hoa tươi, nhận đặt hoa online, trang trí sự kiện và workshop cắm hoa. Nhân dịp khai trương, giảm 20% tất cả sản phẩm từ ngày 01/08 đến 15/08/2025. Mời quý khách ghé thăm!',
        '1dd1c657-8b24-4b64-b3c4-9624a6965e6c-CaoHuynhNgocNhu_CE181233.jpg', NOW() - INTERVAL '15 days', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (4,
        'Ý nghĩa các loại hoa phổ biến bạn nên biết',
        'Mỗi loại hoa đều mang một ý nghĩa riêng: Hoa hồng đỏ - Tình yêu nồng cháy. Hoa hồng trắng - Sự thuần khiết. Hoa hồng vàng - Tình bạn. Hoa hướng dương - Sự lạc quan, trung thành. Hoa lily - Sự thanh khiết, tôn kính. Hoa tulip - Tình yêu hoàn hảo. Hoa cúc trắng - Sự chân thành. Hoa lan - Sự sang trọng, quyền quý. Hoa cẩm tú cầu - Lòng biết ơn. Hoa baby - Sự ngây thơ. Hiểu ý nghĩa hoa giúp bạn chọn đúng loại hoa phù hợp với mỗi dịp.',
        '28470519-2a1a-406c-91fd-fe8534968f37-CaoHuynhNgocNhu_CE181233.jpg', NOW() - INTERVAL '10 days', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (5,
        'Mùa tốt nghiệp 2025: Những mẫu hoa được yêu thích nhất',
        'Mùa tốt nghiệp 2025 đang đến gần! Tại BloomResin, các mẫu hoa bán chạy nhất cho dịp này bao gồm: 1) Bó hoa hướng dương - biểu tượng của thành công và tương lai tươi sáng. 2) Bó hoa hồng pastel kèm gấu bông - dễ thương và ý nghĩa. 3) Bó hoa tiền - sáng tạo và thú vị. 4) Giỏ hoa hỗn hợp - đa sắc, dễ cầm khi chụp hình. Đặt hoa tốt nghiệp sớm để được giá ưu đãi và giao hàng đúng ngày lễ!',
        '04a93a29-2cf6-42d7-a308-fc90cace4ca8-muahang.jpg', NOW() - INTERVAL '5 days', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO news (id, title, content, image_url, created_at, status)
VALUES (6,
        'Workshop cắm hoa miễn phí tại BloomResin',
        'BloomResin tổ chức workshop cắm hoa miễn phí vào mỗi Chủ nhật cuối tháng tại cửa hàng chính 123 Nguyễn Huệ, Quận 1, TP.HCM. Chủ đề tháng 8: "Cắm hoa phong cách Nhật Bản - Ikebana". Mỗi buổi workshop kéo dài 2 tiếng, học viên được tặng 1 bình hoa tự cắm mang về. Số lượng giới hạn 20 người/buổi. Đăng ký qua hotline 0901234567 hoặc inbox fanpage BloomResin.',
        'ee28504f-de64-4618-b852-f21d4ea59a05-thanhtoan.jpg', NOW() - INTERVAL '2 days', true)
ON CONFLICT (id) DO NOTHING;

-- ===================================
-- 6. ĐƠN HÀNG MẪU (Orders)
-- ===================================

-- Đơn hàng 1: Khách hàng 1, đã hoàn thành, COD
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (1, 4, 'Lê Thị Mai', '15 Nguyễn Trãi, Quận 5, TP.HCM', '0934567890',
        'Giao buổi sáng trước 10h', NOW() - INTERVAL '20 days', 'COMPLETE', 900000, 'COD')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 2: Khách hàng 1, đã hoàn thành, BANK_TRANSFER
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (2, 4, 'Nguyễn Thị Lan', '100 Lý Tự Trọng, Quận 1, TP.HCM', '0967891234',
        'Tặng mẹ sinh nhật, ghi thiệp: Chúc mẹ sinh nhật vui vẻ', NOW() - INTERVAL '15 days', 'COMPLETE', 530000, 'BANK_TRANSFER')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 3: Khách hàng 2, đang giao
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (3, 5, 'Phạm Minh Tuấn', '200 Cách Mạng Tháng 8, Quận 3, TP.HCM', '0945678901',
        NULL, NOW() - INTERVAL '3 days', 'SHIPPING', 1200000, 'COD')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 4: Khách hàng 2, đã hoàn thành
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (4, 5, 'Trần Thị Hương', '55 Hai Bà Trưng, Quận 1, TP.HCM', '0978901234',
        'Giao giờ hành chính', NOW() - INTERVAL '18 days', 'COMPLETE', 700000, 'COD')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 5: Khách hàng 3, chờ xác nhận
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (5, 6, 'Hoàng Ngọc Anh', '88 Võ Văn Tần, Quận 3, TP.HCM', '0956789012',
        'Gọi trước khi giao 30 phút', NOW() - INTERVAL '1 day', 'PENDING', 480000, 'COD')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 6: Khách hàng 3, đã hủy
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (6, 6, 'Hoàng Ngọc Anh', '88 Võ Văn Tần, Quận 3, TP.HCM', '0956789012',
        NULL, NOW() - INTERVAL '10 days', 'CANCEL', 350000, 'COD')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 7: Khách hàng 1, đang xác nhận
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (7, 4, 'Lê Thị Mai', '15 Nguyễn Trãi, Quận 5, TP.HCM', '0934567890',
        'Cần gói quà đẹp', NOW() - INTERVAL '2 days', 'PENDING', 1500000, 'BANK_TRANSFER')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 8: Khách hàng 2, đã hoàn thành
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (8, 5, 'Phạm Minh Tuấn', '200 Cách Mạng Tháng 8, Quận 3, TP.HCM', '0945678901',
        NULL, NOW() - INTERVAL '25 days', 'COMPLETE', 850000, 'COD')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 9: Khách hàng 3, đã hoàn thành
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (9, 6, 'Hoàng Ngọc Anh', '88 Võ Văn Tần, Quận 3, TP.HCM', '0956789012',
        'Tặng bạn tốt nghiệp', NOW() - INTERVAL '12 days', 'COMPLETE', 400000, 'BANK_TRANSFER')
ON CONFLICT (id) DO NOTHING;

-- Đơn hàng 10: Khách hàng 1, đang giao
INSERT INTO orders (id, user_id, receiver_name, receiver_address, receiver_phone, note, order_date, status, total_price, payment_method)
VALUES (10, 4, 'Lê Thị Mai', '15 Nguyễn Trãi, Quận 5, TP.HCM', '0934567890',
        'Giao chiều sau 14h', NOW() - INTERVAL '1 day', 'SHIPPING', 600000, 'COD')
ON CONFLICT (id) DO NOTHING;

-- ===================================
-- 7. CHI TIẾT ĐƠN HÀNG (Order Details)
-- ===================================

-- Đơn 1: Hoa cưới cầm tay + Hoa cài áo chú rể
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (1, 1, 1, 1, 550000) ON CONFLICT (id) DO NOTHING;
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (2, 1, 3, 3, 120000) ON CONFLICT (id) DO NOTHING;

-- Đơn 2: Giỏ hoa sinh nhật + Hộp hoa hồng sáp
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (3, 2, 5, 1, 280000) ON CONFLICT (id) DO NOTHING;
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (4, 2, 6, 1, 250000) ON CONFLICT (id) DO NOTHING;

-- Đơn 3: Kệ hoa khai trương
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (5, 3, 9, 1, 1200000) ON CONFLICT (id) DO NOTHING;

-- Đơn 4: Hoa cưới cascade + Hoa cài áo chú rể
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (6, 4, 2, 1, 750000) ON CONFLICT (id) DO NOTHING;

-- Đơn 5: Bó hoa mix tình yêu
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (7, 5, 20, 1, 480000) ON CONFLICT (id) DO NOTHING;

-- Đơn 6: Bó hoa hồng đỏ (đơn bị hủy)
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (8, 6, 17, 1, 350000) ON CONFLICT (id) DO NOTHING;

-- Đơn 7: Hộp hoa hồng 99 bông
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (9, 7, 19, 1, 1500000) ON CONFLICT (id) DO NOTHING;

-- Đơn 8: Kệ hoa tang lễ + Vòng hoa chia buồn
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (10, 8, 16, 1, 850000) ON CONFLICT (id) DO NOTHING;

-- Đơn 9: Bó hoa hồng tốt nghiệp kèm gấu
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (11, 9, 22, 1, 400000) ON CONFLICT (id) DO NOTHING;

-- Đơn 10: Bó hoa hướng dương + Giỏ hoa tốt nghiệp
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (12, 10, 21, 1, 300000) ON CONFLICT (id) DO NOTHING;
INSERT INTO order_detail (id, order_id, product_id, quantity, price) VALUES (13, 10, 24, 1, 350000) ON CONFLICT (id) DO NOTHING;

-- ===================================
-- 8. RESET SEQUENCES
-- ===================================
SELECT setval('roles_id_seq', COALESCE((SELECT MAX(id) FROM roles), 1));
SELECT setval('users_id_seq', COALESCE((SELECT MAX(id) FROM users), 1));
SELECT setval('categories_id_seq', COALESCE((SELECT MAX(id) FROM categories), 1));
SELECT setval('products_id_seq', COALESCE((SELECT MAX(id) FROM products), 1));
SELECT setval('news_id_seq', COALESCE((SELECT MAX(id) FROM news), 1));
SELECT setval('orders_id_seq', COALESCE((SELECT MAX(id) FROM orders), 1));
SELECT setval('order_detail_id_seq', COALESCE((SELECT MAX(id) FROM order_detail), 1));
