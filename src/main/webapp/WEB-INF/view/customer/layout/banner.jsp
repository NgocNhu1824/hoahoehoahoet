<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .hero-banner-container {
        width: 100%;
        height: 480px;
        position: relative;
        overflow: hidden;
        margin-top: 80px;
        box-shadow: 0 8px 25px rgba(107, 23, 0, 0.15);
    }

    @media (max-width: 768px) {
        .hero-banner-container {
            height: 340px;
            margin-top: 70px;
        }
    }

    .banner-slide-img {
        width: 100%;
        height: 480px;
        object-fit: cover;
        filter: brightness(0.82);
        display: block;
    }

    @media (max-width: 768px) {
        .banner-slide-img {
            height: 340px;
        }
    }

    /* Text overlay in upper-middle area */
    .banner-overlay-text {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 70%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        background: linear-gradient(180deg, rgba(30, 8, 2, 0.7) 0%, rgba(0, 0, 0, 0) 100%);
        padding: 30px 20px 0;
        z-index: 3;
    }

    .banner-title {
        font-family: 'Raleway', sans-serif;
        font-size: 2.6rem;
        font-weight: 800;
        color: #FFFFFF !important;
        text-shadow: 2px 3px 10px rgba(0, 0, 0, 0.95);
        letter-spacing: 1px;
        margin: 0 0 10px 0;
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

    /* 100% STATIC & FIXED Yellow button anchored inside image frame, 40px away from bottom edge */
    .banner-fixed-btn-container {
        position: absolute;
        bottom: 40px;
        left: 0;
        width: 100%;
        text-align: center;
        z-index: 20;
        pointer-events: auto;
    }

    .banner-btn {
        display: inline-block;
        background-color: #CEAF95 !important;
        color: #6B1700 !important;
        font-weight: 800;
        padding: 11px 32px;
        border-radius: 30px;
        text-decoration: none;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.45);
        transition: background-color 0.3s ease, color 0.3s ease;
        border: 2px solid #FFF1D2;
        font-size: 1rem;
    }

    .banner-btn:hover {
        background-color: #6B1700 !important;
        color: #FFF1D2 !important;
        border-color: #FFF1D2;
        transform: none !important;
    }

    @media (max-width: 768px) {
        .banner-title {
            font-size: 1.6rem;
            margin-bottom: 6px;
        }
        .banner-subtitle {
            font-size: 0.9rem;
        }
        .banner-fixed-btn-container {
            bottom: 25px;
        }
        .banner-btn {
            padding: 8px 22px;
            font-size: 0.85rem;
        }
    }

    /* Transparent left and right clickable navigation zones */
    .carousel-control-prev,
    .carousel-control-next {
        display: block !important;
        width: 35% !important;
        height: 100% !important;
        top: 0 !important;
        transform: none !important;
        background: transparent !important;
        border: none !important;
        opacity: 0 !important;
        z-index: 10 !important;
        cursor: pointer !important;
    }

    .carousel-control-prev {
        left: 0 !important;
    }

    .carousel-control-next {
        right: 0 !important;
    }

    /* Hide arrow icons and pagination dots visually */
    .carousel-control-prev-icon,
    .carousel-control-next-icon,
    .carousel-indicators {
        display: none !important;
    }

    /* Smooth Left-to-Right slide transition */
    .carousel-item {
        transition: transform 0.8s ease-in-out !important;
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

        <!-- Transparent Clickable Left/Right Navigation Areas -->
        <button class="carousel-control-prev" type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide="prev">
            <span class="visually-hidden">Trước</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide="next">
            <span class="visually-hidden">Tiếp</span>
        </button>
    </div>

    <!-- 100% FIXED & STATIC Yellow button anchored inside image frame (40px gap from bottom edge) -->
    <div class="banner-fixed-btn-container">
        <a href="/products" class="banner-btn" id="fixedBannerBtn"><i class="fas fa-shopping-bag me-2"></i>Khám Phá Sản Phẩm</a>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var bannerCarousel = document.querySelector('#bloomBannerCarousel');
        var fixedBtn = document.getElementById('fixedBannerBtn');

        if (bannerCarousel && typeof bootstrap !== 'undefined') {
            new bootstrap.Carousel(bannerCarousel, {
                interval: 3500,
                ride: 'carousel',
                wrap: true
            });
        }

        if (bannerCarousel && fixedBtn) {
            bannerCarousel.addEventListener('slid.bs.carousel', function () {
                var activeItem = bannerCarousel.querySelector('.carousel-item.active');
                if (activeItem) {
                    var link = activeItem.getAttribute('data-link');
                    var text = activeItem.getAttribute('data-btn-text');
                    var icon = activeItem.getAttribute('data-btn-icon') || 'fa-shopping-bag';
                    if (link) fixedBtn.setAttribute('href', link);
                    if (text) fixedBtn.innerHTML = '<i class="fas ' + icon + ' me-2"></i>' + text;
                }
            });
        }
    });
</script>
