<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .hero-banner-container {
        width: 100%;
        height: 460px;
        position: relative;
        overflow: hidden;
        margin-top: 80px;
        box-shadow: 0 8px 25px rgba(107, 23, 0, 0.15);
    }

    @media (max-width: 768px) {
        .hero-banner-container {
            height: 320px;
            margin-top: 70px;
        }
    }

    .banner-slide-img {
        width: 100%;
        height: 460px;
        object-fit: cover;
        filter: brightness(0.82);
        display: block;
    }

    @media (max-width: 768px) {
        .banner-slide-img {
            height: 320px;
        }
    }

    /* Text overlay centered over full banner */
    .banner-overlay-text {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        background: rgba(0, 0, 0, 0.38);
        padding: 0 20px;
        z-index: 3;
    }

    .banner-title {
        font-family: 'Raleway', sans-serif;
        font-size: 2.6rem;
        font-weight: 800;
        color: #FFFFFF !important;
        text-shadow: 2px 3px 10px rgba(0, 0, 0, 0.95);
        letter-spacing: 1px;
        margin: 0 0 12px 0;
        line-height: 1.25;
    }

    .banner-subtitle {
        font-size: 1.2rem;
        font-weight: 600;
        color: #FFF1D2 !important;
        text-shadow: 1px 2px 6px rgba(0, 0, 0, 0.95);
        margin: 0 auto;
        max-width: 760px;
        line-height: 1.4;
    }

    @media (max-width: 768px) {
        .banner-title {
            font-size: 1.6rem;
            margin-bottom: 8px;
        }
        .banner-subtitle {
            font-size: 0.9rem;
        }
    }

    /* Hide left/right navigation controls & indicators completely */
    .carousel-control-prev,
    .carousel-control-next,
    .carousel-indicators {
        display: none !important;
    }

    /* Smooth Left-to-Right slide transition */
    .carousel-item {
        transition: transform 0.8s ease-in-out !important;
    }

    /* Yellow button area placed OUTSIDE & BELOW the banner image with distinct margin */
    .banner-bottom-button-area {
        margin-top: 25px;
        margin-bottom: 35px;
        text-align: center;
    }

    .banner-btn {
        display: inline-block;
        background-color: #CEAF95 !important;
        color: #6B1700 !important;
        font-weight: 800;
        padding: 12px 34px;
        border-radius: 30px;
        text-decoration: none;
        box-shadow: 0 6px 18px rgba(107, 23, 0, 0.2);
        transition: all 0.3s ease;
        border: 2px solid #6B1700;
        font-size: 1.05rem;
    }

    .banner-btn:hover {
        background-color: #6B1700 !important;
        color: #FFF1D2 !important;
        border-color: #CEAF95;
        transform: translateY(-3px);
        box-shadow: 0 10px 24px rgba(107, 23, 0, 0.3);
    }
</style>

<div class="hero-banner-container">
    <div id="bloomBannerCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3500">
        <div class="carousel-inner">
            <!-- Slide 1 -->
            <div class="carousel-item active" data-link="/products" data-btn-text="Khám Phá Sản Phẩm" data-btn-icon="fa-shopping-bag">
                <img src="${pageContext.request.contextPath}/client/img/banner01.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 1">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">HOA HOÈ HOA HOẸT - BLOOMRESIN</h1>
                    <p class="banner-subtitle">Trang sức thủ công hoa ép Resin tự nhiên lấp lánh & tinh tế</p>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item" data-link="/products" data-btn-text="Xem Bộ Sưu Tập" data-btn-icon="fa-gem">
                <img src="${pageContext.request.contextPath}/client/img/banner02.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 2">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">BỘ SƯU TẬP HOA ÉP VĨNH CỬU</h1>
                    <p class="banner-subtitle">Lưu giữ trọn vẹn nét đẹp tươi tắn và khoảnh khắc kỷ niệm quý giá</p>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="carousel-item" data-link="/custom-order/form" data-btn-text="Đặt Làm Ngay" data-btn-icon="fa-magic">
                <img src="${pageContext.request.contextPath}/client/img/banner03.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 3">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">LÀM THEO YÊU CẦU (CUSTOM ORDER)</h1>
                    <p class="banner-subtitle">Gửi hoa cưới & hoa kỷ niệm của bạn – Shop sẽ đúc thành trang sức độc bản</p>
                </div>
            </div>

            <!-- Slide 4 -->
            <div class="carousel-item" data-link="/news" data-btn-text="Đọc Tin Tức" data-btn-icon="fa-newspaper">
                <img src="${pageContext.request.contextPath}/client/img/banner04.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 4">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">TIN TỨC & BẢO QUẢN SẢN PHẨM</h1>
                    <p class="banner-subtitle">Khám phá các bí quyết chăm sóc trang sức Resin bền đẹp cùng thời gian</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Yellow button placed OUTSIDE & BELOW the banner image with distinct spacing -->
<div class="banner-bottom-button-area">
    <a href="/products" class="banner-btn" id="dynamicBannerBtn"><i class="fas fa-shopping-bag me-2"></i>Khám Phá Sản Phẩm</a>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var bannerCarousel = document.querySelector('#bloomBannerCarousel');
        var dynamicBtn = document.getElementById('dynamicBannerBtn');

        if (bannerCarousel && typeof bootstrap !== 'undefined') {
            new bootstrap.Carousel(bannerCarousel, {
                interval: 3500,
                ride: 'carousel',
                wrap: true
            });
        }

        if (bannerCarousel && dynamicBtn) {
            bannerCarousel.addEventListener('slid.bs.carousel', function () {
                var activeItem = bannerCarousel.querySelector('.carousel-item.active');
                if (activeItem) {
                    var link = activeItem.getAttribute('data-link');
                    var text = activeItem.getAttribute('data-btn-text');
                    var icon = activeItem.getAttribute('data-btn-icon') || 'fa-shopping-bag';
                    if (link) dynamicBtn.setAttribute('href', link);
                    if (text) dynamicBtn.innerHTML = '<i class="fas ' + icon + ' me-2"></i>' + text;
                }
            });
        }
    });
</script>
